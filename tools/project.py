"""Build, verify and package the forward shader project through one entry point."""
import argparse
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def run(script, arguments=()):
    subprocess.run([sys.executable, str(ROOT / "tools" / script), *arguments], check=True, cwd=ROOT)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("build", "check", "pack", "rebuild"))
    args, remaining = parser.parse_known_args()
    if args.command in ("build", "rebuild"):
        run("build.py", remaining)
    elif remaining:
        parser.error("Build selection arguments apply to build and rebuild only.")
    if args.command in ("check", "pack", "rebuild"):
        run("verify.py")
        run("audit_native_interfaces.py")
        run("audit_runtime_contracts.py")
        run("audit_native_pipelines.py")
    if args.command in ("pack", "rebuild"):
        run("pack_materials.py")


if __name__ == "__main__":
    main()
