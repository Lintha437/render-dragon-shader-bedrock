# MeshFallbackForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material MeshFallbackForwardPBR --defaults
```

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=Off, Instancing=Off, PointLightShading=Off, UseTextures=On.

- [GLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl](../GLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.glsl)
- [HLSL vertex: GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl](../HLSL/pipelines/GlowInkSignForwardPBR/RasterizedAlphaTest.vertex.hlsl)
- [GLSL fragment: MeshFallbackForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: MeshFallbackForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/MeshFallbackForwardPBR/ForwardPBRTransparent.fragment.hlsl)

