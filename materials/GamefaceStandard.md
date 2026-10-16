# GamefaceStandard

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material GamefaceStandard --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: GamefaceStandard/Transparent.fragment.glsl](../GLSL/pipelines/GamefaceStandard/Transparent.fragment.glsl)
- [HLSL fragment: GamefaceStandard/Transparent.fragment.hlsl](../HLSL/pipelines/GamefaceStandard/Transparent.fragment.hlsl)
- [GLSL vertex: GamefaceStandard/Transparent.vertex.glsl](../GLSL/pipelines/GamefaceStandard/Transparent.vertex.glsl)
- [HLSL vertex: GamefaceStandard/Transparent.vertex.hlsl](../HLSL/pipelines/GamefaceStandard/Transparent.vertex.hlsl)

