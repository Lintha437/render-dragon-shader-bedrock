"""Compile the editable HLSL and GLSL sources described by project.json."""
from __future__ import annotations
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from hashlib import sha256
import json
import os
from pathlib import Path
import subprocess
import time
from functools import lru_cache
from project_model import load_catalog, default_features, local_settings
from native_abi import adapt

ROOT = Path(__file__).resolve().parents[1]


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")


def locate(name, explicit=None):
    explicit = explicit or os.environ.get('RD_'+name.upper()) or local_settings().get('compilers', {}).get(name)
    if explicit:
        path = Path(explicit).resolve()
        if path.is_file():
            return path
        raise FileNotFoundError(path)
    candidates = [ROOT / 'local/toolchain' / (name+'.exe'),
                  ROOT / 'local/toolchain' / name / (name+'.exe'),
                  ROOT / 'local/toolchain' / name / 'bin' / (name+'.exe')]
    if name in ("fxc", "dxc"):
        kit = Path("C:/Program Files (x86)/Windows Kits/10/bin")
        candidates += sorted(kit.glob("*/x64/" + name + ".exe"), reverse=True)
    for candidate in candidates:
        if candidate.is_file():
            return candidate.resolve()
    import shutil
    global_path = shutil.which(name)
    if global_path:
        return Path(global_path)
    raise FileNotFoundError(f"Compiler {name} is missing; provide --{name} PATH.")


@lru_cache(maxsize=None)
def dependencies(path):
    import re
    path = path.resolve()
    data = path.read_bytes()
    result = data
    for include in re.findall(r'^\s*#include\s+"([^"]+)"', data.decode("utf-8"), re.M):
        result += dependencies((path.parent / include).resolve())
    return sha256(result).digest()


def source_fingerprint(source, language):
    policy = native_policy_digest() if language == 'hlsl' else b''
    return sha256(dependencies(ROOT / source['path']) + json.dumps(
        {'profile': source['profile'], 'defines': source.get('defines', {}),
         **({'native_compile_flags': source.get('native_compile_flags', [])} if language == 'hlsl' else {})}, sort_keys=True).encode() + policy).hexdigest()


@lru_cache(maxsize=1)
def native_policy_digest():
    return sha256((ROOT / 'tools/native_abi.py').read_bytes() +
                  (ROOT / 'templates/native_interfaces.json').read_bytes()).digest()


@lru_cache(maxsize=1)
def native_contracts():
    return json.loads((ROOT / 'templates/native_interfaces.json').read_text(encoding='utf-8'))


def compile_source(program, language, args, compilers):
    source = program["sources"][language]
    path = ROOT / source["path"]
    key = program["program"]
    result_path = ROOT / "build/results" / language / (key + ".json")
    fingerprint = source_fingerprint(source, language)
    if result_path.exists() and not args.force:
        old = json.loads(result_path.read_text(encoding="utf-8"))
        if old.get("source_fingerprint") == fingerprint and old.get("passed") and (ROOT / old['binary']).is_file():
            return old
    context = program["context"]
    binary_dir = ROOT / "build" / language.upper() / "renderer/materials" / context["material"]
    binary_dir.mkdir(parents=True, exist_ok=True)
    stem = Path(source.get("implementation_path", source["path"])).stem
    if "configuration" in source:
        platform = context["platform"].removeprefix("Direct3D_").lower()
        stem += f".{platform}.configuration{source['configuration']:04d}"
    definitions = source.get("defines", {})
    if language == "glsl":
        binary = binary_dir / (stem + ".spv")
        stage = {"vertex": "vert", "fragment": "frag", "compute": "comp"}[context["stage"]]
        command = [compilers["glslang"], "-V", "--target-env", "vulkan1.3", "-S", stage, "-o", binary]
        command += ["-D" + key + "=" + str(value) for key, value in definitions.items()]
    else:
        profile = source["profile"]
        if int(profile.split("_")[1]) < 6:
            binary = binary_dir / (stem + ".dxbc")
            command = [compilers["fxc"], "/nologo", "/T", profile, "/E", "main", "/Fo", binary]
            command += ["/D" + key + "=" + str(value) for key, value in definitions.items()]
        else:
            binary = binary_dir / (stem + ".dxil")
            command = [compilers["dxc"], "-T", profile, "-E", "main", "-enable-16bit-types", "-Fo", binary]
            command += ["-D" + key + "=" + str(value) for key, value in definitions.items()]
        command += source.get('native_compile_flags', [])
    start = time.monotonic()
    try:
        if language == 'hlsl' and context['stage'] != 'compute':
            prepared = binary_dir / (stem + '.native.hlsl')
            preprocessed = binary_dir / (stem + '.preprocessed.hlsl')
            if int(source['profile'].split('_')[1]) < 6:
                preprocess = [compilers['fxc'], '/nologo', '/P', preprocessed]
                preprocess += ['/D' + k + '=' + str(v) for k, v in definitions.items()]
            else:
                preprocess = [compilers['dxc'], '-T', source['profile'], '-enable-16bit-types', '-P', '-Fi', preprocessed]
                preprocess += ['-D' + k + '=' + str(v) for k, v in definitions.items()]
            preprocess.append(path)
            pre = subprocess.run([str(x) for x in preprocess], capture_output=True, timeout=120,
                                 creationflags=0x08000000 if os.name == 'nt' else 0)
            if pre.returncode:
                raise ValueError(pre.stderr.decode(errors='replace') + pre.stdout.decode(errors='replace'))
            prepared.write_text(adapt(preprocessed.read_text(encoding='utf-8-sig'), native_contracts()[key], context['stage']), encoding='utf-8')
            command.append(prepared)
        else:
            command.append(path)
        process = subprocess.run([str(x) for x in command], capture_output=True, timeout=120,
                                 creationflags=0x08000000 if os.name == "nt" else 0)
        log = (process.stdout+process.stderr).decode("utf-8", errors="replace")
        passed = process.returncode == 0 and binary.is_file()
        returncode = process.returncode
    except subprocess.TimeoutExpired:
        log, passed, returncode = "Compilation timed out after 120 seconds.", False, -1
    except (ValueError, KeyError) as error:
        log, passed, returncode = str(error), False, -1
    log_path = result_path.with_suffix(".log")
    log_path.parent.mkdir(parents=True, exist_ok=True)
    log_path.write_text(log, encoding="utf-8")
    result = {"program": key, "language": language, "source": source["path"], "source_fingerprint": fingerprint,
              "passed": passed, "returncode": returncode, "seconds": round(time.monotonic()-start, 3),
              "binary": binary.relative_to(ROOT).as_posix(), "log": log_path.relative_to(ROOT).as_posix(),
              "command": [str(x) for x in command]}
    save(result_path, result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--language", choices=("hlsl", "glsl", "all"), default="all")
    parser.add_argument("--material")
    parser.add_argument("--pass", dest="pass_name")
    parser.add_argument("--variant", type=int)
    parser.add_argument("--feature", action="append", default=[], metavar="NAME=VALUE", help="Select a material feature, for example Fancy=Off.")
    parser.add_argument("--defaults", action="store_true", help="Use the per-pass default features in materials/*.json.")
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--force", action="store_true")
    for tool in ("dxc", "fxc", "glslang"):
        parser.add_argument("--" + tool)
    args = parser.parse_args()
    requested = {}
    for assignment in args.feature:
        if "=" not in assignment:
            parser.error("A feature must have the form NAME=VALUE.")
        name, value = assignment.split("=", 1)
        requested[name] = value
    registry = load_catalog()
    selected = set()
    for material in registry["materials"]:
        if args.material and material["name"] != args.material:
            continue
        for render_pass in material["passes"]:
            if args.pass_name and render_pass["name"] != args.pass_name:
                continue
            features = {**(default_features(material["name"], render_pass["name"]) if args.defaults else {}), **requested}
            for variant in render_pass["variants"]:
                if args.variant is not None and variant["index"] != args.variant:
                    continue
                if any(variant["flags"].get(key) != value for key, value in features.items()):
                    continue
                selected.update(shader["program"] for shader in variant["shaders"])
    programs = [value for key, value in registry["programs"].items() if key in selected]
    programs = [p for p in programs if p["complete"]]
    programs = sorted(programs, key=lambda p: (p["context"]["material"], p["context"]["pass"], p["context"]["variant"], p["program"]))
    if args.limit:
        programs = programs[:args.limit]
    if not programs:
        parser.error("No shader programs match the requested selection.")
    languages = ("hlsl", "glsl") if args.language == "all" else (args.language,)
    compilers = {name: locate(name, getattr(args, name)) for name in ("dxc", "fxc", "glslang")}
    results, start = [], time.monotonic()
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        tasks = [pool.submit(compile_source, program, language, args, compilers) for program in programs for language in languages]
        for index, task in enumerate(as_completed(tasks), 1):
            results.append(task.result())
            if index % 50 == 0 or index == len(tasks):
                status = {"processed": index, "total": len(tasks), "passed": sum(r["passed"] for r in results),
                          "failed": sum(not r["passed"] for r in results), "elapsed_seconds": round(time.monotonic()-start, 1)}
                save(ROOT / "build/status.json", status)
                print(json.dumps(status), flush=True)
    report = {"passed": all(r["passed"] for r in results), "compiled": len(results),
              "language_counts": {language: sum(r["language"] == language for r in results) for language in languages},
              "failures": [r for r in results if not r["passed"]], "compilers": {k: str(v) for k, v in compilers.items()}}
    save(ROOT / "build/report.json", report)
    raise SystemExit(0 if report["passed"] else 1)


if __name__ == "__main__":
    main()
