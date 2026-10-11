# GamefacePath

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material GamefacePath --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: GamefacePath/Transparent.fragment.glsl](../GLSL/pipelines/GamefacePath/Transparent.fragment.glsl)
- [HLSL fragment: GamefacePath/Transparent.fragment.hlsl](../HLSL/pipelines/GamefacePath/Transparent.fragment.hlsl)
- [GLSL vertex: GamefacePath/Transparent.vertex.glsl](../GLSL/pipelines/GamefacePath/Transparent.vertex.glsl)
- [HLSL vertex: GamefacePath/Transparent.vertex.hlsl](../HLSL/pipelines/GamefacePath/Transparent.vertex.hlsl)

