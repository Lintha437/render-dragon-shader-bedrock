# Upscaling

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Upscaling --defaults
```

## Fallback

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: PostFX.Debug/DebugBlit.fragment.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.fragment.glsl)
- [HLSL fragment: PostFX.Debug/DebugBlit.fragment.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.fragment.hlsl)
- [GLSL vertex: Upscaling/Fallback.vertex.glsl](../GLSL/pipelines/Upscaling/Fallback.vertex.glsl)
- [HLSL vertex: Upscaling/Fallback.vertex.hlsl](../HLSL/pipelines/Upscaling/Fallback.vertex.hlsl)

## TAAU

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: PostFX.Debug/DebugBlit.fragment.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.fragment.glsl)
- [GLSL fragment: Upscaling/TAAU.fragment.glsl](../GLSL/pipelines/Upscaling/TAAU.fragment.glsl)
- [HLSL fragment: PostFX.Debug/DebugBlit.fragment.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.fragment.hlsl)
- [HLSL fragment: Upscaling/TAAU.fragment.hlsl](../HLSL/pipelines/Upscaling/TAAU.fragment.hlsl)
- [GLSL vertex: BlitHDR/Blit.vertex.glsl](../GLSL/pipelines/BlitHDR/Blit.vertex.glsl)
- [GLSL vertex: Upscaling/Fallback.vertex.glsl](../GLSL/pipelines/Upscaling/Fallback.vertex.glsl)
- [HLSL vertex: BlitHDR/Blit.vertex.hlsl](../HLSL/pipelines/BlitHDR/Blit.vertex.hlsl)
- [HLSL vertex: Upscaling/Fallback.vertex.hlsl](../HLSL/pipelines/Upscaling/Fallback.vertex.hlsl)

