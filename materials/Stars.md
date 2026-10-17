# Stars

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Stars --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Stars/Transparent.fragment.glsl](../GLSL/pipelines/Stars/Transparent.fragment.glsl)
- [HLSL fragment: Stars/Transparent.fragment.hlsl](../HLSL/pipelines/Stars/Transparent.fragment.hlsl)
- [GLSL vertex: Stars/Transparent.vertex.glsl](../GLSL/pipelines/Stars/Transparent.vertex.glsl)
- [HLSL vertex: Stars/Transparent.vertex.hlsl](../HLSL/pipelines/Stars/Transparent.vertex.hlsl)

