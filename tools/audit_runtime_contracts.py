"""Audit native resource declarations and stage linkage, beyond source compilation."""
from concurrent.futures import ThreadPoolExecutor, as_completed
from collections import Counter
from hashlib import sha256
import json
from pathlib import Path
import re
import struct
import subprocess
from threading import Lock
from build import locate
from project_model import load_catalog, snapshot_directory
from audit_native_interfaces import signatures

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = snapshot_directory()
_CACHE_GUARD = Lock()
_CACHE_LOCKS = {}


def reflection_text(binary_path, dxil, native_hash):
    cache = ROOT / 'build/runtime_reflection' / (native_hash+'.txt')
    cache.parent.mkdir(parents=True, exist_ok=True)
    with _CACHE_GUARD:
        cache_lock = _CACHE_LOCKS.setdefault(native_hash, Lock())
    # Distinct original programs can compile to the same native bytes. A second
    # worker must not read a cache file while the first worker is writing it.
    with cache_lock:
        if not cache.exists() or cache.stat().st_size == 0:
            command = [str(locate('dxc')), '-dumpbin', str(binary_path)] if dxil else [str(locate('fxc')), '/nologo', '/dumpbin', str(binary_path)]
            completed = subprocess.run(command, capture_output=True, creationflags=0x08000000, timeout=120)
            if completed.returncode or not completed.stdout:
                raise RuntimeError(completed.stderr.decode(errors='replace'))
            temporary = cache.with_suffix('.tmp')
            temporary.write_bytes(completed.stdout)
            temporary.replace(cache)
        return cache.read_text()


def chunks(data):
    result = {}
    for i in range(struct.unpack_from('<I', data, 28)[0]):
        offset = struct.unpack_from('<I', data, 32 + i * 4)[0]
        size = struct.unpack_from('<I', data, offset + 4)[0]
        result[data[offset:offset+4].decode('ascii')] = data[offset+8:offset+8+size]
    return result


def declarations(text, dxil):
    text = text.replace('\r', '')
    if not dxil:
        # Shader declarations describe the executable ABI even when RDEF was stripped.
        lines = [s.strip() for s in text.splitlines() if re.match(
            r'dcl_(?:resource|sampler|constantbuffer|uav|thread_group|tgsm)', s.strip())]
        return sorted(lines)
    resources = []
    section = text.split('; Resource Bindings:', 1)[-1].split('; ViewId state:', 1)[0] if '; Resource Bindings:' in text else ''
    for line in section.splitlines():
        row = re.match(r'^;\s*(\S+)\s+(cbuffer|sampler|texture|UAV)\s*(NA|[a-z0-9_]+)\s+(\S+)\s+\S+\s+((?:cb|[tsu])\d+(?:,space\d+)?)\s+(\S+)\s*$', line)
        if row:
            name, kind, fmt, dim, register, count = row.groups()
            resource = [kind, fmt, dim, register, count]
            if fmt == 'struct':
                block = text.split('; Resource bind info for '+name, 1)[1]
                block = re.split(r'; Resource (?:bind info|Bindings:)', block, maxsplit=1)[0]
                resource.append('stride='+re.findall(r'Size:\s*(\d+)', block)[-1])
            if kind == 'cbuffer':
                block = text.split('; cbuffer '+name, 1)[1]
                block = re.split(r'; (?:cbuffer |Resource)', block, maxsplit=1)[0]
                size = int(re.findall(r'Size:\s*(\d+)', block)[-1])
                # CBVs expose complete 16-byte constant registers. A terminal
                # float3 and a float4 array occupy the same final register.
                resource.append('constant_register_bytes='+str((size+15)//16*16))
            resources.append(resource)
    groups = re.findall(r'NumThreads=\(([^)]+)\)', text)
    return {'resources': sorted(resources), 'thread_groups': groups}


def inspect(digest, program):
    original_path = SNAPSHOT / digest[:2] / (digest + '.bin')
    original = original_path.read_bytes()
    assert sha256(original).hexdigest() == digest
    result = json.loads((ROOT / 'build/results/hlsl' / (digest + '.json')).read_text())
    assert result['passed'], 'Compile every native program before auditing runtime contracts.'
    rebuilt_path = ROOT / result['binary']
    rebuilt = rebuilt_path.read_bytes()
    native_hash = sha256(rebuilt).hexdigest()
    oc, nc = chunks(original), chunks(rebuilt)
    dxil = 'DXIL' in oc
    original_dump = original_path.with_suffix('.dxil.ll' if dxil else '.dxbc.asm').read_text()
    new_dump = reflection_text(rebuilt_path, dxil, native_hash)
    a, b = declarations(original_dump, dxil), declarations(new_dump, dxil)
    return digest, {'context': program['context'], 'resources_original': a, 'resources_rebuilt': b,
                    'resource_declarations_match': a == b,
                    'original_signatures': signatures(original), 'rebuilt_signatures': signatures(rebuilt),
                    'original_feature_flags': oc.get('SFI0', b'').hex(),
                    'rebuilt_feature_flags': nc.get('SFI0', b'').hex(),
                    'native_sha256': native_hash}


def main():
    catalog = load_catalog()
    programs = {}
    with ThreadPoolExecutor(max_workers=8) as pool:
        tasks = [pool.submit(inspect, key, value) for key, value in catalog['programs'].items()]
        for i, task in enumerate(as_completed(tasks), 1):
            key, value = task.result()
            programs[key] = value
            if i % 250 == 0 or i == len(tasks):
                print(f'Runtime contract reflection: {i}/{len(tasks)}', flush=True)
    resource_failures = [k for k, v in programs.items() if not v['resource_declarations_match']]
    added_capabilities = []
    for digest, value in programs.items():
        original = int.from_bytes(bytes.fromhex(value['original_feature_flags']), 'little')
        rebuilt = int.from_bytes(bytes.fromhex(value['rebuilt_feature_flags']), 'little')
        if rebuilt & ~original:
            added_capabilities.append({'program': digest, 'added_flags': hex(rebuilt & ~original)})
    links, failures, seen = 0, [], set()
    for material in catalog['materials']:
        for render_pass in material['passes']:
            for variant in render_pass['variants']:
                for platform in {s['platform'] for s in variant['shaders']}:
                    stages = {s['stage']: s['program'] for s in variant['shaders'] if s['platform'] == platform}
                    if not {'vertex', 'fragment'} <= stages.keys():
                        continue
                    pair = stages['vertex'], stages['fragment']
                    if pair in seen:
                        continue
                    seen.add(pair)
                    links += 1
                    vs = programs[pair[0]]['rebuilt_signatures']['output']
                    ps = programs[pair[1]]['rebuilt_signatures']['input']
                    output = {(s['semantic'], s['index']): s for s in vs}
                    for row in ps:
                        if not row['access'] or row['system_value'] in (7, 9, 10, 64, 65, 66, 67, 68):
                            continue
                        match = output.get((row['semantic'], row['index']))
                        if match is None or match['type'] != row['type'] or (match['mask'] & row['mask']) != row['mask'] or match['register'] != row['register']:
                            failures.append({'material': material['name'], 'pass': render_pass['name'], 'platform': platform,
                                             'vertex': pair[0], 'fragment': pair[1], 'input': row, 'output': match})
    report = {'passed': not resource_failures and not failures and not added_capabilities, 'programs': programs,
              'additional_native_capability_requirements': added_capabilities,
              'resource_mismatches': resource_failures, 'graphics_pairs_checked': links,
              'linkage_failures': failures, 'minecraft_runtime_loading_tested': False}
    (ROOT / 'build/runtime_contract_report.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
    print(json.dumps({'programs': len(programs), 'resource_mismatches': len(resource_failures),
                      'graphics_pairs_checked': links, 'linkage_failures': len(failures)}, indent=2), flush=True)
    raise SystemExit(0 if report['passed'] else 1)


if __name__ == '__main__':
    main()
