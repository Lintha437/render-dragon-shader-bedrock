# StarsForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material StarsForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: StarsForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: StarsForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## ForwardPBRTransparentSkyProbe

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: StarsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl)
- [HLSL fragment: StarsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl)

