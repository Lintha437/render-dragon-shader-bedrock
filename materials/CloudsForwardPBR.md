# CloudsForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material CloudsForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: CloudsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: CloudsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: CloudsForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: CloudsForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: CloudsForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/CloudsForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: CloudsForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/CloudsForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)
- [GLSL fragment: CloudsForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/CloudsForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: CloudsForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/CloudsForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)

## ForwardPBRTransparentSkyProbe

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: CloudsForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: CloudsForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: CloudsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl](../GLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.glsl)
- [HLSL fragment: CloudsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl](../HLSL/pipelines/CloudsForwardPBR/ForwardPBRTransparentSkyProbe.fragment.hlsl)

## MotionOnly

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: CloudsForwardPBR/MotionOnly.vertex.glsl](../GLSL/pipelines/CloudsForwardPBR/MotionOnly.vertex.glsl)
- [HLSL vertex: CloudsForwardPBR/MotionOnly.vertex.hlsl](../HLSL/pipelines/CloudsForwardPBR/MotionOnly.vertex.hlsl)
- [GLSL fragment: CloudsForwardPBR/MotionOnly.fragment.glsl](../GLSL/pipelines/CloudsForwardPBR/MotionOnly.fragment.glsl)
- [HLSL fragment: CloudsForwardPBR/MotionOnly.fragment.hlsl](../HLSL/pipelines/CloudsForwardPBR/MotionOnly.fragment.hlsl)

