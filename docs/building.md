# Building and local inputs

## Requirements

- Windows, Python 3.10+, and `lazurite==0.11.0` from `requirements.txt`.
- FXC from a Windows SDK, DXC plus its matching DLLs, and glslang.
- Visual Studio C++ tools and a Windows SDK for the native D3D12 probe.
- Your matching Minecraft 1.26.60.30 RC0 `Renderer/materials` files.

The Python/metadata repository checks run without Windows or game inputs. The
complete native pipeline and packaging workflow requires Windows and local inputs.

Run `tools/setup.ps1` to create `.venv` and install Python dependencies. Compiler
installations are separate. Do not commit game files or compiler distributions.

## Configure tools

```powershell
python tools/configure.py --dxc C:Toolsdxcdxc.exe --fxc C:Toolsxcxc.exe --glslang C:Toolsglslangglslang.exe
python tools/import_originals.py --materials C:GamesMinecraftRenderermaterials --jobs 8
python tools/doctor.py
```

The import validates every container's SHA-256, extracts 4,955 unique programs
from 154 materials, and generates their private original disassembly. It supports
the encrypted RTXStub container. The game directory is not modified.

Path precedence is explicit compiler arguments, environment variables, ignored
`local/config.json`, `local/toolchain`, installed Windows SDK discovery, then PATH.
Configure paths for the whole workflow: compiler arguments on a selected build
alone do not configure later audit subprocesses.

| Environment variable | Purpose |
|---|---|
| `RD_DXC`, `RD_FXC`, `RD_GLSLANG` | Compiler executable paths |
| `RD_MATERIALS_DIR` | Original Renderer/materials directory |
| `RD_REFERENCE_DIR` | Imported private shader baseline directory |

Local settings can instead contain `compilers`, `materials_dir` and `reference_dir`.
Relative configured paths resolve against the repository root. Keep local paths
and credentials outside tracked files.

## Build commands

```powershell
python tools/project.py rebuild --jobs 8
python tools/project.py build --language hlsl --material RenderChunk
python tools/project.py build --material Actor --pass AlphaTest --defaults
python tools/project.py build --material Actor --feature Fancy=On --feature Instancing=Off
python tools/project.py build --material Actor --variant 1
python tools/project.py check
python tools/project.py pack
```

`rebuild` means full compilation, source verification, exact native interfaces,
resource/linkage audits, D3D12 pipeline creation and native packaging. A full build
must precede `check` or `pack`; selected builds are iteration tools only. Use
`--force` to recompile selected configurations. `--jobs` controls parallelism.

Successful results are cached by source dependencies, defines, profile, native
interface contracts, adapter policy and per-program compiler flags. Native entry
adapters are generated under `build/`; edit maintained source instead.

## CMake

```powershell
cmake -S . -B build/cmake -G Ninja -DPython3_EXECUTABLE=.venv/Scripts/python.exe
cmake --build build/cmake --target materials
```

The target uses the repository virtual environment when available. It does not
need compiler executables vendored into the repository. MSVC and Windows SDK
discovery for the probe is independent of FXC/DXC shader compilation.

## Reports and export

- `build/report.json`: compiler coverage and diagnostics.
- `verification.json`: current source/catalog coverage.
- `build/native_contract_report.json`: exact native signature checks.
- `build/runtime_contract_report.json`: descriptors, strides, constant-register
  extents, capabilities and VS/PS linkage.
- `build/native_pipeline_report.json`: original/rebuilt WARP pipeline creation.
- `dist/pack_report.json`: material metadata, encryption, payload hashes and
  reversible original-container comparison.

The original shader profiles and BGFX wrapper identities are preserved. Packaging
changes payloads in actual original containers, including encryption state, and
rejects stale reports or source/binary hashes. All generated reports and outputs
remain ignored. The builder never writes to the original game directory.
