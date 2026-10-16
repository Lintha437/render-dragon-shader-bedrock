# GlowInkSignForwardPBR

Parent: `MeshFallbackForwardPBR`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material GlowInkSignForwardPBR --defaults
```

## RasterizedAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## RasterizedOpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## RasterizedTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.fragment.hlsl)

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=On_DiscardValueBased, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: GlowInkSignForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: GlowInkSignForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/ForwardPBRTransparent.fragment.hlsl)

