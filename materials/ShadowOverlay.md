# ShadowOverlay

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ShadowOverlay --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ShadowOverlay/Transparent.fragment.glsl](../GLSL/pipelines/ShadowOverlay/Transparent.fragment.glsl)
- [HLSL fragment: ShadowOverlay/Transparent.fragment.hlsl](../HLSL/pipelines/ShadowOverlay/Transparent.fragment.hlsl)
- [GLSL vertex: ShadowOverlay/Transparent.vertex.glsl](../GLSL/pipelines/ShadowOverlay/Transparent.vertex.glsl)
- [HLSL vertex: ShadowOverlay/Transparent.vertex.hlsl](../HLSL/pipelines/ShadowOverlay/Transparent.vertex.hlsl)

