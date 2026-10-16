# Contributing

Use `develop` as the base and pull-request target for normal work. Create a
`feature/<short-name>` branch, keep changes focused, and use short English commit
subjects. Commit bodies are optional. Do not push changes directly to `main`.

Run the checks available without game assets:

```powershell
python -m unittest discover -s tests -v
python tools/check_repository.py
```

Changes to shader arithmetic, resources, interpolation, export identities or
native adapters also require the full Windows build and original/rebuilt runtime
audits described in [the build guide](docs/building.md). Attach the relevant
summary; do not upload original game binaries, compiler bundles or private paths.

Preserve public semantic names, component masks, registers, structured buffer
strides, supported platform bits, container encryption and the original shader
profiles. Name new variables by their actual operation or domain role. Comments
and macros in maintained shader source must be English.

Keep historical recovery evidence separate from current validation claims. State
whether a result is a compiler check, a WARP pipeline test or an actual game test.
See [GitFlow](docs/gitflow.md) for release and hotfix handling.
