"""Extract the private original shader baseline from user-supplied game files."""
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from hashlib import sha256
from io import BytesIO
import json
from pathlib import Path
import subprocess
from lazurite.material import Material
from build import locate
from pack_materials import preserve_platform_bits
from project_model import ROOT, load_catalog, local_settings, original_materials_dir, snapshot_directory


def validate_original(path, expected_digest):
    data = path.read_bytes()
    if sha256(data).hexdigest() != expected_digest:
        raise ValueError('Original file does not match the supported game build: '+path.name)
    return data


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--materials', type=Path)
    parser.add_argument('--jobs', type=int, default=8)
    args = parser.parse_args()
    directory = args.materials.resolve() if args.materials else original_materials_dir()
    if not directory.is_dir():
        parser.error('Provide --materials PATH to the original Renderer/materials directory.')
    compilers = {name: locate(name) for name in ('fxc', 'dxc')}
    baseline = snapshot_directory()
    baseline.mkdir(parents=True, exist_ok=True)
    preserve_platform_bits()
    programs, material_count = {}, 0
    for path in sorted((ROOT/'templates/Renderer/materials').glob('*.json')):
        if path.name in ('materials.index.json', 'MaterialTargets.json'):
            continue
        template = json.loads(path.read_text(encoding='utf-8'))
        filename = path.stem+'.material.bin'
        material = Material()
        material.read(BytesIO(validate_original(directory/filename, template['input_sha256'])))
        for render_pass in material.passes:
            for variant in render_pass.variants:
                for shader in variant.shaders:
                    data = shader.bgfx_shader.shader_bytes
                    digest = sha256(data).hexdigest()
                    if digest in programs:
                        continue
                    stem = baseline/digest[:2]/digest
                    stem.parent.mkdir(parents=True, exist_ok=True)
                    stem.with_suffix('.bin').write_bytes(data)
                    programs[digest] = stem
        material_count += 1
    catalog = load_catalog()
    assert material_count == len(catalog['materials']) == 154
    assert set(programs) == set(catalog['programs']), 'The original shader set differs from the catalog.'
    def disassemble(item):
        digest, stem = item
        dxil = int(catalog['programs'][digest]['original_profile'].split('_')[1]) >= 6
        dump = stem.with_suffix('.dxil.ll' if dxil else '.dxbc.asm')
        if dump.exists() and dump.stat().st_size:
            return
        command = [str(compilers['dxc']), '-dumpbin', str(stem.with_suffix('.bin'))] if dxil else [str(compilers['fxc']), '/nologo', '/dumpbin', str(stem.with_suffix('.bin'))]
        result = subprocess.run(command, capture_output=True, timeout=120, creationflags=0x08000000)
        if result.returncode:
            raise RuntimeError('Original reflection failed for '+digest)
        dump.write_bytes(result.stdout)
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        tasks = [pool.submit(disassemble, item) for item in programs.items()]
        for index, task in enumerate(as_completed(tasks), 1):
            task.result()
            if index % 500 == 0 or index == len(tasks):
                print(f'Original baseline: {index}/{len(tasks)} programs', flush=True)
    settings = local_settings()
    settings['materials_dir'] = str(directory)
    settings['reference_dir'] = str(baseline)
    (ROOT/'local/config.json').write_text(json.dumps(settings, indent=2)+'\n', encoding='utf-8')
    (ROOT/'local/import_report.json').write_text(json.dumps({'passed': True, 'materials': material_count, 'programs': len(programs)}, indent=2)+'\n')
    print('Private baseline imported. No original binary is added to Git.')


if __name__ == '__main__':
    main()
