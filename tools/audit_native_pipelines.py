"""Create every original/rebuilt native pipeline with Windows D3D12 WARP.

Original failures identify limitations of the probe's broad root signature and
software adapter. A rebuilt pipeline must succeed whenever its original does.
This checks pipeline creation only, not dispatch correctness or game rendering.
"""
from hashlib import sha256
import json
import os
from pathlib import Path
import subprocess
import sys
from project_model import load_catalog, snapshot_directory
from build import locate

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = snapshot_directory()
OUTPUT = ROOT / 'build/pipeline_probe'


def compile_probe():
    source = ROOT / 'tools/native_pipeline_probe.cpp'
    executable = OUTPUT / 'native_pipeline_probe.exe'
    stamp = OUTPUT / 'compiler_stamp.txt'
    checksum = sha256(source.read_bytes()).hexdigest()
    if executable.exists() and stamp.exists() and stamp.read_text() == checksum:
        return executable
    installations = []
    for drive in ('C:', 'D:', 'E:'):
        installations += list(Path(drive+'/Program Files/Microsoft Visual Studio').glob('*/*/VC/Tools/MSVC'))
    versions = sorted([v for p in installations for v in p.glob('*')], key=lambda p: p.name, reverse=True)
    kits = sorted(Path('C:/Program Files (x86)/Windows Kits/10/Include').glob('*'), reverse=True)
    if not versions or not kits:
        raise RuntimeError('The native D3D12 probe requires Visual Studio C++ tools and a Windows SDK.')
    version, kit = versions[0], kits[0]
    compiler = version / 'bin/Hostx64/x64/cl.exe'
    command = [str(compiler), '/nologo', '/EHsc', '/std:c++17', '/I'+str(version/'include')]
    command += ['/I'+str(kit/part) for part in ('um','shared','ucrt','winrt')]
    command += [str(source), '/Fe:'+str(executable), '/Fo:'+str(OUTPUT/'native_pipeline_probe.obj'), '/link',
                '/LIBPATH:'+str(version/'lib/x64')]
    library = kit.parents[1] / 'Lib' / kit.name
    command += ['/LIBPATH:'+str(library/part/'x64') for part in ('um','ucrt')]
    command += ['d3d12.lib', 'dxgi.lib', 'd3dcompiler.lib']
    subprocess.run(command, check=True, creationflags=0x08000000)
    stamp.write_text(checksum)
    return executable


def main():
    if os.name != 'nt':
        raise RuntimeError('Native D3D12 validation requires Windows.')
    OUTPUT.mkdir(parents=True, exist_ok=True)
    executable = compile_probe()
    catalog = load_catalog()
    paths, hashes = {}, {}
    for digest in catalog['programs']:
        original = SNAPSHOT / digest[:2] / (digest+'.bin')
        assert sha256(original.read_bytes()).hexdigest() == digest
        result = json.loads((ROOT/'build/results/hlsl'/(digest+'.json')).read_text())
        assert result['passed']
        rebuilt = ROOT / result['binary']
        paths[digest] = str(original), str(rebuilt)
        hashes[digest] = sha256(rebuilt.read_bytes()).hexdigest()
    policy = sha256((ROOT/'tools/native_pipeline_probe.cpp').read_bytes()).hexdigest()
    report_path = ROOT/'build/native_pipeline_report.json'
    if report_path.exists():
        previous=json.loads(report_path.read_text())
        if previous.get('passed') and previous.get('native_program_sha256')==hashes and previous.get('probe_source_sha256')==policy and previous.get('windows_build')==sys.getwindowsversion().build:
            print('D3D12 pipeline creation probe is current:',previous['pipeline_pairs_checked'],'pairs; no regressions.',flush=True)
            return
    rows, index, seen = [], {}, set()
    for material in catalog['materials']:
        for render_pass in material['passes']:
            for variant in render_pass['variants']:
                for platform in sorted({s['platform'] for s in variant['shaders']}):
                    stages={s['stage']:s['program'] for s in variant['shaders'] if s['platform']==platform}
                    if not {'vertex','fragment'} <= stages.keys(): continue
                    pair=stages['vertex'],stages['fragment']
                    if pair in seen: continue
                    seen.add(pair)
                    key='graphics_'+str(len(rows));a,x=paths[pair[0]];b,y=paths[pair[1]]
                    rows.append([key,a,b,x,y]);index[key]={'material':material['name'],'pass':render_pass['name'],
                                                        'platform':platform,'vertex':pair[0],'fragment':pair[1]}
    graphics = len(rows)
    for digest, program in catalog['programs'].items():
        if program['context']['stage']!='compute': continue
        key='compute_'+str(len(rows));a,x=paths[digest];rows.append([key,a,'-',x,'-'])
        index[key]={'program':digest,**program['context']}
    (OUTPUT/'index.json').write_text(json.dumps(index,indent=2))
    input_path=OUTPUT/'pipelines.tsv'
    input_path.write_text('\n'.join('\t'.join(row) for row in rows),encoding='utf-8')
    compiler_dll=locate('dxc').with_name('dxcompiler.dll')
    print('D3D12 pipeline creation probe:',len(rows),'original/rebuilt pairs',flush=True)
    process=subprocess.Popen([str(executable),str(input_path),str(compiler_dll)],stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT,text=True,encoding='utf-8',errors='replace',creationflags=0x08000000)
    results, completed = {}, 0
    with (OUTPUT/'runtime.log').open('w',encoding='utf-8') as log:
        for line in process.stdout:
            log.write(line)
            fields=line.rstrip().split('\t')
            if len(fields)==3 and fields[0] in index and fields[1] in ('original','rebuilt'):
                results.setdefault(fields[0],{})[fields[1]]=fields[2]
                if fields[1]=='rebuilt':
                    completed += 1
                    if completed%500==0 or completed==len(rows):
                        log.flush()
                        print('D3D12 pipeline pairs checked:',completed,'/',len(rows),flush=True)
    assert process.wait()==0, 'Native probe failed; inspect build/pipeline_probe/runtime.log.'
    assert len(results)==len(rows) and all(set(v)=={'original','rebuilt'} for v in results.values())
    regressions=[{'pipeline':key,**index[key],'hresult':v['rebuilt']} for key,v in results.items()
                 if v['original']=='0' and v['rebuilt']!='0']
    unavailable=[{'pipeline':key,**index[key],'original_hresult':v['original'],'rebuilt_hresult':v['rebuilt']}
                 for key,v in results.items() if v['original']!='0']
    report={'passed':not regressions,'adapter':'Windows D3D12 WARP','graphics_pairs':graphics,
            'compute_pairs':len(rows)-graphics,'pipeline_pairs_checked':len(rows),
            'original_successes':len(rows)-len(unavailable),'regressions':regressions,
            'probe_source_sha256':policy,'windows_build':sys.getwindowsversion().build,
            'original_pipelines_unavailable_on_probe':unavailable,'native_program_sha256':hashes,
            'scope':'D3D12 pipeline creation with a synthesized broad root signature; no GPU dispatch, drawing, or Minecraft execution.',
            'minecraft_runtime_loading_tested':False}
    (ROOT/'build/native_pipeline_report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k not in ('native_program_sha256','original_pipelines_unavailable_on_probe')},indent=2),flush=True)
    raise SystemExit(0 if report['passed'] else 1)


if __name__=='__main__':main()
