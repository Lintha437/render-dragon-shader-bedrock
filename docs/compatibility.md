# Compatibility and crash investigation

The supported source baseline is Minecraft Bedrock 1.26.60.30 RC0, compiled
material format v26. Other game versions require their own contract extraction
and validation. Backend family names do not replace actual program profiles;
Direct3D_SM60 programs in this baseline include model 6.3.

## Why compilation was insufficient

An early complete export compiled successfully but crashed while entering a world
with Vibrant Visuals. Independent D3D12 tests reproduced 136 pipeline pairs where
the original shaders succeeded and reconstructed shaders failed. Important fixes:

1. Restore exact VS/PS semantic order, masks, registers and interpolation. Retain
   unused interface fields when they reserve lanes for later fields.
2. Restore structured buffer kinds and strides; typed uint buffers cannot replace
   structured SRV/UAV descriptors just because their indexing compiles.
3. Replace oversized 4096-vector constant arrays with the original register extents.
4. Preserve normalized texture declarations and native feature requirements.
5. Keep SRV/UAV namespaces distinct, including arrays sharing a register number
   and space. Three RTX kernels required recovery again with separate bindings.
6. Keep all 14 platform bits and actual container encryption. JSON reconstruction
   alone had dropped the encrypted RTXStub wrapper.
7. Compile two FXC pixel configurations with `/Od` to avoid an optimizer internal
   error, while still checking their original profiles and native interfaces.

The final local evidence includes 9,910 compiled configurations, zero exact
signature/resource/linkage differences, 7,848 successful original/rebuilt pipeline
pairs and 154 reversible original-container comparisons. All exported payloads
come from freshly compiled HLSL, without a bytecode fallback.

## Evidence levels

- Compiler success checks source acceptance, not stage linkage or game execution.
- Native contract checks cover the declared interfaces, resources and extents.
- The WARP probe creates PSOs with a synthesized broad root signature. It does
  not dispatch shaders, draw a world or use Minecraft's exact root signature.
- On 2026-10-17, the maintainer reported that the rebuilt material set loaded in
  the matching game. This is additional manual evidence, not an automated test.
- Pixel equivalence, all permutations, all worlds, every graphics setting and
  cross-device performance are not established by these checks.

After editing resource layouts or shader logic, repeat the complete local build
and the intended in-game scenario. Keep the game version and graphics mode in bug
reports. Do not infer support for other releases from one successful test.
