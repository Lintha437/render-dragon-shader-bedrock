# Blit

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Blit --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Blit/Transparent.fragment.glsl](../GLSL/pipelines/Blit/Transparent.fragment.glsl)
- [HLSL fragment: Blit/Transparent.fragment.hlsl](../HLSL/pipelines/Blit/Transparent.fragment.hlsl)
- [GLSL vertex: Blit/Transparent.vertex.glsl](../GLSL/pipelines/Blit/Transparent.vertex.glsl)
- [HLSL vertex: Blit/Transparent.vertex.hlsl](../HLSL/pipelines/Blit/Transparent.vertex.hlsl)

