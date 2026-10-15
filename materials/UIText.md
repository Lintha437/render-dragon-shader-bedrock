# UIText

Parent: `UI/Fill`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material UIText --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: ALPHA_TEST=Off, FONT_TYPE=Bitmap.

- [GLSL fragment: UIText/Transparent.fragment.glsl](../GLSL/pipelines/UIText/Transparent.fragment.glsl)
- [HLSL fragment: UIText/Transparent.fragment.hlsl](../HLSL/pipelines/UIText/Transparent.fragment.hlsl)
- [GLSL vertex: UIText/Transparent.vertex.glsl](../GLSL/pipelines/UIText/Transparent.vertex.glsl)
- [HLSL vertex: UIText/Transparent.vertex.hlsl](../HLSL/pipelines/UIText/Transparent.vertex.hlsl)

