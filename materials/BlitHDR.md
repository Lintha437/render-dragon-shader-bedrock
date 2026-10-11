# BlitHDR

Parent: `Blit`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material BlitHDR --defaults
```

## Blit

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: BlitHDR/Blit.fragment.glsl](../GLSL/pipelines/BlitHDR/Blit.fragment.glsl)
- [HLSL fragment: BlitHDR/Blit.fragment.hlsl](../HLSL/pipelines/BlitHDR/Blit.fragment.hlsl)
- [GLSL vertex: BlitHDR/Blit.vertex.glsl](../GLSL/pipelines/BlitHDR/Blit.vertex.glsl)
- [HLSL vertex: BlitHDR/Blit.vertex.hlsl](../HLSL/pipelines/BlitHDR/Blit.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: BlitHDR/Transparent.fragment.glsl](../GLSL/pipelines/BlitHDR/Transparent.fragment.glsl)
- [HLSL fragment: BlitHDR/Transparent.fragment.hlsl](../HLSL/pipelines/BlitHDR/Transparent.fragment.hlsl)
- [GLSL vertex: Blit/Transparent.vertex.glsl](../GLSL/pipelines/Blit/Transparent.vertex.glsl)
- [HLSL vertex: Blit/Transparent.vertex.hlsl](../HLSL/pipelines/Blit/Transparent.vertex.hlsl)

