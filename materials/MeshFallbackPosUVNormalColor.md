# MeshFallbackPosUVNormalColor

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material MeshFallbackPosUVNormalColor --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl)

## RasterizedTransparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.glsl)
- [GLSL fragment: MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.hlsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl)

## RasterizedAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.glsl)
- [GLSL fragment: MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.hlsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.vertex.hlsl)

## RasterizedOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, UseTextures=On, MultiColorTint=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.glsl)
- [HLSL vertex: MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/RasterizedTransparent.vertex.hlsl)

