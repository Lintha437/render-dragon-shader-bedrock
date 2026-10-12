# ShadowVolume

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ShadowVolume --defaults
```

## StencilWrite

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: ShadowVolume/StencilWrite.fragment.glsl](../GLSL/pipelines/ShadowVolume/StencilWrite.fragment.glsl)
- [HLSL fragment: ShadowVolume/StencilWrite.fragment.hlsl](../HLSL/pipelines/ShadowVolume/StencilWrite.fragment.hlsl)
- [GLSL vertex: ShadowVolume/StencilWrite.vertex.glsl](../GLSL/pipelines/ShadowVolume/StencilWrite.vertex.glsl)
- [HLSL vertex: ShadowVolume/StencilWrite.vertex.hlsl](../HLSL/pipelines/ShadowVolume/StencilWrite.vertex.hlsl)

