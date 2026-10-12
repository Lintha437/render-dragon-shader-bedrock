# Weather

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Weather --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: FlipOcclusion=Off, Instancing=Off, NoOcclusion=Off, NoVariety=Off.

- [GLSL fragment: Weather/Transparent.fragment.glsl](../GLSL/pipelines/Weather/Transparent.fragment.glsl)
- [HLSL fragment: Weather/Transparent.fragment.hlsl](../HLSL/pipelines/Weather/Transparent.fragment.hlsl)
- [GLSL vertex: Weather/Transparent.vertex.glsl](../GLSL/pipelines/Weather/Transparent.vertex.glsl)
- [HLSL vertex: Weather/Transparent.vertex.hlsl](../HLSL/pipelines/Weather/Transparent.vertex.hlsl)

