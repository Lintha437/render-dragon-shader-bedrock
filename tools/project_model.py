"""Load human project settings and the native material export catalog."""
import json
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def local_settings():
    path = ROOT / 'local/config.json'
    return json.loads(path.read_text(encoding='utf-8')) if path.exists() else {}


def configured_path(environment_name, setting_name, default):
    value = os.environ.get(environment_name) or local_settings().get(setting_name) or default
    path = Path(value).expanduser()
    return path.resolve() if path.is_absolute() else (ROOT / path).resolve()


def original_materials_dir():
    return configured_path('RD_MATERIALS_DIR', 'materials_dir', 'local/originals')


def snapshot_directory():
    return configured_path('RD_REFERENCE_DIR', 'reference_dir', 'local/reference/shaders')


def load_catalog():
    settings = json.loads((ROOT / "project.json").read_text(encoding="utf-8"))
    if "catalog" not in settings:
        return settings
    return json.loads((ROOT / settings["catalog"]).read_text(encoding="utf-8"))


def default_features(material, pass_name):
    path = ROOT / "materials" / (material+".json")
    if not path.is_file():
        return {}
    recipe = json.loads(path.read_text(encoding="utf-8"))
    return recipe["passes"][pass_name]["default_features"]
