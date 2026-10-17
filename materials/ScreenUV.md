# ScreenUV

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ScreenUV --defaults
```

## Screen

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ScreenUV/Screen.fragment.glsl](../GLSL/pipelines/ScreenUV/Screen.fragment.glsl)
- [HLSL fragment: ScreenUV/Screen.fragment.hlsl](../HLSL/pipelines/ScreenUV/Screen.fragment.hlsl)
- [GLSL vertex: ScreenUV/Screen.vertex.glsl](../GLSL/pipelines/ScreenUV/Screen.vertex.glsl)
- [HLSL vertex: ScreenUV/Screen.vertex.hlsl](../HLSL/pipelines/ScreenUV/Screen.vertex.hlsl)

