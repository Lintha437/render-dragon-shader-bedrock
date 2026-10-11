# UIBase

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material UIBase --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: UIBase/Transparent.fragment.glsl](../GLSL/pipelines/UIBase/Transparent.fragment.glsl)
- [HLSL fragment: UIBase/Transparent.fragment.hlsl](../HLSL/pipelines/UIBase/Transparent.fragment.hlsl)
- [GLSL vertex: UIBase/Transparent.vertex.glsl](../GLSL/pipelines/UIBase/Transparent.vertex.glsl)
- [HLSL vertex: UIBase/Transparent.vertex.hlsl](../HLSL/pipelines/UIBase/Transparent.vertex.hlsl)

