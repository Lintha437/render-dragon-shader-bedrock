# SunMoonForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SunMoonForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: SunMoonForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/SunMoonForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: SunMoonForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/SunMoonForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## ForwardPBRTransparentSkyProbe

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/StarsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: SunMoonForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl](../GLSL/pipelines/SunMoonForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl)
- [HLSL fragment: SunMoonForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl](../HLSL/pipelines/SunMoonForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl)

