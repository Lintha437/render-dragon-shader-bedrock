# RenderChunkForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material RenderChunkForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: RenderChunkForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: RenderChunkForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL fragment: RenderChunkForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunkForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunkForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: RenderChunkForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL fragment: RenderChunkForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/RenderChunkForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: RenderChunkForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: RenderChunkForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

