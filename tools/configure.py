"""Store machine-specific paths in the ignored local/config.json file."""
import argparse
import json
from pathlib import Path
from project_model import ROOT, local_settings


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--materials', type=Path)
    parser.add_argument('--reference', type=Path)
    for compiler in ('dxc', 'fxc', 'glslang'):
        parser.add_argument('--'+compiler, type=Path)
    args = parser.parse_args()
    settings = local_settings()
    for option, key in (('materials', 'materials_dir'), ('reference', 'reference_dir')):
        path = getattr(args, option)
        if path:
            if not path.is_dir():
                parser.error(str(path)+' is not a directory.')
            settings[key] = str(path.resolve())
    for name in ('dxc', 'fxc', 'glslang'):
        path = getattr(args, name)
        if path:
            if not path.is_file():
                parser.error(str(path)+' is not a file.')
            settings.setdefault('compilers', {})[name] = str(path.resolve())
    destination = ROOT / 'local/config.json'
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json.dumps(settings, indent=2)+'\n', encoding='utf-8')
    print('Local configuration saved to local/config.json. This file is not committed.')


if __name__ == '__main__':
    main()
