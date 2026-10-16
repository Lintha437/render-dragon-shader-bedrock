"""Check the configured tools and original inputs without compiling shaders."""
import json
import os
import sys
from build import locate
from project_model import ROOT, original_materials_dir, snapshot_directory


def main():
    checks = {'windows': os.name == 'nt', 'python_3_10_or_newer': sys.version_info >= (3, 10)}
    for compiler in ('dxc', 'fxc', 'glslang'):
        try:
            locate(compiler)
            checks[compiler] = True
        except FileNotFoundError:
            checks[compiler] = False
    checks['original_materials'] = len(list(original_materials_dir().glob('*.material.bin'))) == 154
    checks['private_shader_baseline'] = len(list(snapshot_directory().glob('*/*.bin'))) == 4955
    print(json.dumps({'passed': all(checks.values()), 'checks': checks}, indent=2))
    raise SystemExit(0 if all(checks.values()) else 1)


if __name__ == '__main__':
    main()
