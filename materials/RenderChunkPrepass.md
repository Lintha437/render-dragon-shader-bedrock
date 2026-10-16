# RenderChunkPrepass

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material RenderChunkPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunkPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunkPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunkPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunkPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: RenderChunkPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/RenderChunkPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: RenderChunkPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/RenderChunkPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunkPrepass/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/RenderChunkPrepass/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: RenderChunkPrepass/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/RenderChunkPrepass/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: RenderChunkPrepass/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/RenderChunkPrepass/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: RenderChunkPrepass/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/RenderChunkPrepass/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: RenderChunkPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/RenderChunkPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: RenderChunkPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/RenderChunkPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: RenderChunkPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/RenderChunkPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: RenderChunkPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/RenderChunkPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [GLSL vertex: RenderChunkPrepass/GeometryPrepassAlphaTest.vertex.glsl](../GLSL/pipelines/RenderChunkPrepass/GeometryPrepassAlphaTest.vertex.glsl)
- [HLSL vertex: RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/RenderChunkForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [HLSL vertex: RenderChunkPrepass/GeometryPrepassAlphaTest.vertex.hlsl](../HLSL/pipelines/RenderChunkPrepass/GeometryPrepassAlphaTest.vertex.hlsl)
- [GLSL fragment: RenderChunkPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunkPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunkPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunkPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

