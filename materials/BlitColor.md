# BlitColor

Parent: `Blit`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material BlitColor --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: BlitColor/Transparent.fragment.glsl](../GLSL/pipelines/BlitColor/Transparent.fragment.glsl)
- [HLSL fragment: BlitColor/Transparent.fragment.hlsl](../HLSL/pipelines/BlitColor/Transparent.fragment.hlsl)
- [GLSL vertex: Blit/Transparent.vertex.glsl](../GLSL/pipelines/Blit/Transparent.vertex.glsl)
- [HLSL vertex: Blit/Transparent.vertex.hlsl](../HLSL/pipelines/Blit/Transparent.vertex.hlsl)

