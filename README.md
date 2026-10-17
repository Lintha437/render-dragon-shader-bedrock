# Render Dragon Shader Bedrock

[![Repository checks](https://github.com/Lintha437/render-dragon-shader-bedrock/actions/workflows/checks.yml/badge.svg)](https://github.com/Lintha437/render-dragon-shader-bedrock/actions/workflows/checks.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

An editable GLSL/HLSL shader project targeting **Minecraft Bedrock 1.26.60.30 RC0**.
Material recipes select shared stage pipelines; native compatibility checks guard
the `.material.bin` files rebuilt from those sources.

**Game loading confirmed:** on 2026-10-17, the maintainer reported successful game
loading of the rebuilt material set after the Vibrant Visuals compatibility
repair. This is a manual observation for the matching build, not a guarantee of
pixel equivalence or support for every graphics mode, device or game version.

| Scope | Count |
|---|---:|
| Materials / original shader records | 154 / 52,175 |
| Unique native programs | 4,955 |
| Shared HLSL / GLSL pipelines | 516 / 516 |
| HLSL + GLSL build configurations | 9,910 |
| Native graphics + compute pipeline pairs | 7,675 + 173 |

The native export preserves material format v26 and Direct3D SM40, SM50, SM60 and
SM65 backend families, including each original program profile. GLSL produces
separate Vulkan 1.3 SPIR-V artifacts; it is not inserted into the Direct3D game
containers. This is reconstructed, editable code, not Mojang's original source.

## Start here

- [Material index](MATERIALS.md): find a material, Pass, stage and supported feature.
- [Build guide](docs/building.md): install tools, import local inputs and build.
- [Architecture](docs/architecture.md): understand pipelines, recipes and native adapters.
- [Compatibility](docs/compatibility.md): read the crash investigation and validation limits.
- [Validation](VALIDATION.md): automated evidence and the later manual game result.
- [Contributing](CONTRIBUTING.md) and [GitFlow](docs/gitflow.md): propose changes and releases.

## Quick start on Windows

Install Python 3.10+, Visual Studio C++ tools, a Windows SDK with FXC, DXC with its
required DLLs, and glslang. Compiler distributions and original game files are
local dependencies and are not bundled in the repository.

```powershell
git clone https://github.com/Lintha437/render-dragon-shader-bedrock.git
cd render-dragon-shader-bedrock
powershell -ExecutionPolicy Bypass -File tools/setup.ps1
.\.venv\Scripts\Activate.ps1

python tools/configure.py --dxc C:\Tools\dxc\dxc.exe --fxc C:\Tools\fxc\fxc.exe --glslang C:\Tools\glslang\glslang.exe
python tools/import_originals.py --materials C:\Games\Minecraft\Renderer\materials
python tools/doctor.py
python tools/project.py rebuild --jobs 8
```

Use the actual paths on your computer. `local/config.json` is ignored by Git.
The importer verifies all original container hashes before creating the private
bytecode/reflection baseline. The supported inputs are version-specific.

The complete workflow compiles both languages, verifies coverage, checks exact
native interfaces and resources, creates original/rebuilt D3D12 pipelines on WARP,
and packages freshly compiled HLSL into the original containers. Output is local:

```text
build/                         Compiler results, reports and native entry adapters
dist/Renderer/materials/       154 rebuilt material.bin files and index configuration
dist/pack_report.json          Payload, metadata, encryption and round-trip evidence
```

Original inputs are read-only. The workflow does not install files into the game.
Use your existing version-appropriate material replacement method to test outputs.

## Edit a material

```powershell
python tools/project.py build --material Actor --pass AlphaTest --defaults
python tools/project.py build --material Actor --pass AlphaTest --feature MaskedMultitexture=On
python tools/project.py build --material Actor --pass AlphaTest --variant 1
```

Edit the linked files under `HLSL/pipelines` or `GLSL/pipelines`; reuse the shared
bindings, math helpers and feature vocabulary. A language-specific edit does not
automatically update its counterpart. Run a complete `rebuild` before exporting a
new package. Partial build reports cannot authorize packaging.

Optional CMake workflow:

```powershell
cmake -S . -B build/cmake -G Ninja
cmake --build build/cmake --target materials
```

The `materials` target includes full compilation and all native export checks.
See the build guide for tool discovery, environment variables and cache behavior.

## Repository layout

```text
HLSL/, GLSL/         Editable pipelines, shared material bindings and math helpers
Shared/             Feature macros, options and deferred fragment discard
materials/          Material recipes and per-material reading guides
metadata/           Native program catalog, provenance and repair evidence
templates/          Original interface and container metadata contracts
tools/              Build, import, verification, D3D12 probe and packaging tools
tests/              Repository and portability regression tests
docs/               Build, compatibility, architecture and release documentation
local/              Ignored game inputs, compiler paths and private baseline
.github/            CI, issue forms and pull-request guidance
```

Large catalogs/templates are generated reference data. Normal authoring belongs
in pipelines, shared modules and material recipe defaults. Original binaries,
extraction snapshots, generated packages and compiler executables are excluded.

## Development findings

The supplied Core material definitions cover only part of the native material
set. Recovery initially produced many independent variants; consolidation reduced
11,890 maintained shader files to 1,515 without dropping the original export
indices. Domain names erased by optimization cannot be recovered literally, so
some kernels retain explicit operation-based dataflow.

A compilation-only export failed while the game entered a world with Vibrant
Visuals. D3D12 tests reproduced 136 pipeline creation regressions. The repair
restored exact semantic packing and interpolation, structured buffer descriptors
and strides, constant-register bounds, normalized textures, separate SRV/UAV
namespaces and original container encryption. Two FXC configurations use `/Od`
to avoid a compiler optimizer internal error.

All 7,848 original and rebuilt pipeline pairs subsequently created successfully.
Restoring original payloads recovers all 154 original containers byte for byte.
153 inputs are unencrypted; `RTXStub` retains `SIMPLE_PASSPHRASE` encryption.
No original bytecode is used as a failed-compilation fallback.

Repository CI runs tests and catalog/source checks without game assets. It does
not claim to run the full Windows compiler, WARP or Minecraft workflow. The local
Windows checks and maintainer-reported game loading are documented separately.

## License and provenance

Original project contributions are licensed under [MIT](LICENSE). See
[third-party notices](THIRD_PARTY_NOTICES.md) for the reconstructed game baseline
and external tools; the MIT license does not relicense Mojang's underlying code
or compiler distributions. This project is independent of Mojang and Microsoft.

[Development history](docs/development-history.md) describes the local import and
the engineering stages represented by the initial repository history.
