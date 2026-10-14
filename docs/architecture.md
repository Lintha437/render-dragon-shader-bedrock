# Architecture

The small `project.json` points to the native export catalog and shared feature
vocabulary. The catalog maps 52,175 original shader records to 4,955 native program
identities. Each identity selects a maintained pipeline plus feature, platform,
binding-layout and configuration definitions.

`materials/*.json` contains editable Pass defaults used by `--defaults`. The
material Markdown files and `MATERIALS.md` connect those defaults to source. Shared
programs can be owned by another material; selectors follow the complete registry.

HLSL and GLSL each maintain 516 Pass/stage pipelines and 238 material binding
modules. Statement factoring shares common logic; named macros select supported
differences. The math libraries share verified operation order and precision.
`Shared/FragmentControl.h` keeps deferred discard valid across helper calls.

The original CPU/GPU contract is a separate concern from convenient kernel types.
`tools/native_abi.py` generates a private-kernel/public-entry HLSL adapter with the
original semantic order, interpolation, masks and register allocation. Legacy
widened vectors stay private; original unused fields reserve their native lanes.

Structured access adapters retain descriptor class, element stride and word
addressing. Native resource contracts include exact register spaces and ranges.
The last constant-buffer register is compared at 16-byte register granularity;
padding a final float3 does not authorize a larger register range.

GLSL produces separate Vulkan SPIR-V. Its shared semantic location table accounts
for D3D packed varyings; descriptor space 99 maps to Vulkan set 15. Three recovered
RTX kernels use an additional UAV binding-number offset of 10000 to avoid aliasing
different descriptor classes. Native HLSL uses the original registers and spaces.

The packer reads the user's original containers and replaces only native payloads.
The JSON templates provide comparison contracts rather than complete replacement
containers: encryption keys and other omitted state must survive in the originals.
