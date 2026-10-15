# GamefaceStencilPath

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material GamefaceStencilPath --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: GamefaceStencilPath/Transparent.fragment.glsl](../GLSL/pipelines/GamefaceStencilPath/Transparent.fragment.glsl)
- [HLSL fragment: GamefaceStencilPath/Transparent.fragment.hlsl](../HLSL/pipelines/GamefaceStencilPath/Transparent.fragment.hlsl)
- [GLSL vertex: GamefacePath/Transparent.vertex.glsl](../GLSL/pipelines/GamefacePath/Transparent.vertex.glsl)
- [HLSL vertex: GamefacePath/Transparent.vertex.hlsl](../HLSL/pipelines/GamefacePath/Transparent.vertex.hlsl)

