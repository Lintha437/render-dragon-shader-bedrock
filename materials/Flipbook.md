# Flipbook

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Flipbook --defaults
```

## Blit

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Flipbook/Blit.fragment.glsl](../GLSL/pipelines/Flipbook/Blit.fragment.glsl)
- [HLSL fragment: Flipbook/Blit.fragment.hlsl](../HLSL/pipelines/Flipbook/Blit.fragment.hlsl)
- [GLSL vertex: Flipbook/Blit.vertex.glsl](../GLSL/pipelines/Flipbook/Blit.vertex.glsl)
- [HLSL vertex: Flipbook/Blit.vertex.hlsl](../HLSL/pipelines/Flipbook/Blit.vertex.hlsl)

