"""Check the public source tree without requiring game binaries or compilers."""
import json
from pathlib import Path
import re
import subprocess
from project_model import ROOT, load_catalog

EXCLUDED = {'.git', '.venv', 'build', 'dist', '__pycache__', '.work'}


def public_files():
    if (ROOT/'.git').exists():
        result = subprocess.run(['git', 'ls-files', '-z'], cwd=ROOT, capture_output=True, check=True)
        return [ROOT/name for name in result.stdout.decode().split('\0') if name]
    return [p for p in ROOT.rglob('*') if p.is_file() and not set(p.relative_to(ROOT).parts)&EXCLUDED
            and (p.relative_to(ROOT).parts[0] != 'local' or p.relative_to(ROOT).as_posix() == 'local/README.md')
            and p.name not in ('verification.json', 'completion.json')]


def source_path(relative):
    path = Path(relative)
    assert not path.is_absolute() and '..' not in path.parts, relative
    target = ROOT/path
    assert target.is_file(), relative
    return target


def main():
    catalog = load_catalog()
    assert len(catalog['materials']) == 154
    assert len(catalog['programs']) == 4955
    assert catalog['shader_records'] == 52175
    references = 0
    for digest, program in catalog['programs'].items():
        assert re.fullmatch('[0-9a-f]{64}', digest)
        assert program['complete'] and set(program['sources']) == {'hlsl', 'glsl'}
        for source in program['sources'].values():
            for field in ('path', 'implementation_path', 'binding_path'):
                source_path(source[field])
    for material in catalog['materials']:
        source_path('materials/'+material['name']+'.json')
        for render_pass in material['passes']:
            for variant in render_pass['variants']:
                for shader in variant['shaders']:
                    assert shader['program'] in catalog['programs']
                    references += 1
    assert references == 52175
    templates, shader_records = 0, 0
    for path in (ROOT/'templates/Renderer/materials').glob('*.json'):
        if path.name in ('materials.index.json', 'MaterialTargets.json'):
            continue
        template = json.loads(path.read_text(encoding='utf-8'))
        assert template['version'] == 26
        for render_pass in template['passes']:
            assert len(render_pass['supported_platforms_raw_bits']) == 14
            for variant in render_pass['variants']:
                for shader in variant['shaders']:
                    assert shader['sha256'] in catalog['programs']
                    shader_records += 1
        templates += 1
    assert templates == 154 and shader_records == 52175
    for name in ('LICENSE', 'THIRD_PARTY_NOTICES.md', 'CONTRIBUTING.md', 'SECURITY.md'):
        source_path(name)
    links, inspected = 0, 0
    token = re.compile(r'(?:gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{30,}|-----BEGIN (?:RSA )?PRIVATE KEY-----)')
    for path in public_files():
        relative = path.relative_to(ROOT)
        assert not set(relative.parts)&EXCLUDED, relative
        assert relative.parts[0] != 'local' or relative.as_posix() == 'local/README.md', relative
        assert path.suffix.lower() not in {'.bin', '.exe', '.dll', '.dxbc', '.dxil', '.spv', '.pdb', '.obj'}, relative
        assert path.stat().st_size < 50*1024*1024, relative
        if path.suffix == '.gz':
            continue
        text = path.read_text(encoding='utf-8')
        assert not token.search(text), 'Credential-like data in '+str(relative)
        assert not re.search(r'(?:E:[\\/]MainData|C:[\\/]Users[\\/]linth)', text, re.I), 'Private workstation path in '+str(relative)
        if path.suffix == '.md':
            for link in re.findall(r'\]\(([^)]+)\)', text):
                if link.startswith(('https://', 'http://', '#')):
                    continue
                destination = link.split('#', 1)[0]
                assert (path.parent/destination).exists(), (relative, link)
                links += 1
        inspected += 1
    print(json.dumps({'passed': True, 'programs': 4955, 'original_shader_records': references,
                      'templates': templates, 'public_text_files': inspected, 'local_links': links}, indent=2))


if __name__ == '__main__':
    main()
