# Validation

This repository separates historical automated evidence from manual game testing.
The [baseline summary](docs/validation/baseline.json) records the 2026-10-16 local
repair run and the later maintainer report. Newly generated compiler logs and
binary reports belong in ignored `build/`, `dist/` and `local/` directories.

| Check | Baseline result |
|---|---:|
| Compiled HLSL + GLSL configurations | 9,910 |
| Unique native programs | 4,955 |
| Exact input / output semantics | 34,576 / 15,275 |
| Native signature / resource / linkage differences | 0 / 0 / 0 |
| Original/rebuilt graphics pipeline pairs | 7,675 |
| Original/rebuilt compute pipeline pairs | 173 |
| Original/rebuilt PSO creation successes | 7,848 / 7,848 |
| Packaged material files | 154 |
| Original containers recovered byte for byte | 154 |

136 earlier pipeline creation regressions were eliminated. All material payloads
were compiled from maintained HLSL without original-bytecode fallback. Original
shader profiles, platform bits, metadata and encryption were preserved, including
the encrypted RTXStub container. Python and CMake entry points passed locally.

On 2026-10-17 the maintainer reported successful game loading of the rebuilt files
in the matching game. That report is distinct from automated testing. Pixel
equivalence, complete permutation coverage in gameplay and other devices/game
builds remain unverified.

Run `python tools/project.py rebuild --jobs 8` with your local originals to generate
current reports. CI runs repository checks without distributing or accessing game
assets; it does not represent a full Windows or Minecraft integration run. See
[compatibility](docs/compatibility.md) and [building](docs/building.md).
