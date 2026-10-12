# CubemapHDRi

Parent: `Cubemap`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material CubemapHDRi --defaults
```

## ForceForwardPBROpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: CubemapHDRi/ForceForwardPBROpaque.fragment.glsl](../GLSL/pipelines/CubemapHDRi/ForceForwardPBROpaque.fragment.glsl)
- [HLSL fragment: CubemapHDRi/ForceForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/CubemapHDRi/ForceForwardPBROpaque.fragment.hlsl)
- [GLSL vertex: Cubemap/Opaque.vertex.glsl](../GLSL/pipelines/Cubemap/Opaque.vertex.glsl)
- [HLSL vertex: Cubemap/Opaque.vertex.hlsl](../HLSL/pipelines/Cubemap/Opaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: CubemapHDRi/Opaque.fragment.glsl](../GLSL/pipelines/CubemapHDRi/Opaque.fragment.glsl)
- [HLSL fragment: CubemapHDRi/Opaque.fragment.hlsl](../HLSL/pipelines/CubemapHDRi/Opaque.fragment.hlsl)
- [GLSL vertex: Cubemap/Opaque.vertex.glsl](../GLSL/pipelines/Cubemap/Opaque.vertex.glsl)
- [HLSL vertex: Cubemap/Opaque.vertex.hlsl](../HLSL/pipelines/Cubemap/Opaque.vertex.hlsl)

