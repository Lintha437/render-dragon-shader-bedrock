# LegacyCubemapForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material LegacyCubemapForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: LegacyCubemapForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: LegacyCubemapForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## ForwardPBRTransparentSkyProbe

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: LegacyCubemapForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl](../GLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl)
- [HLSL fragment: LegacyCubemapForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl](../HLSL/pipelines/LegacyCubemapForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl)

