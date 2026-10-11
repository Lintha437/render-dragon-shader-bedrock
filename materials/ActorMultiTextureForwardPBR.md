# ActorMultiTextureForwardPBR

Parent: `ActorForwardPBR`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorMultiTextureForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorMultiTextureForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: ActorMultiTextureForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorMultiTextureForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: ActorMultiTextureForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorMultiTextureForwardPBR/ForwardPBROpaque.fragment.glsl](../GLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBROpaque.fragment.glsl)
- [HLSL fragment: ActorMultiTextureForwardPBR/ForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/ActorMultiTextureForwardPBR/ForwardPBROpaque.fragment.hlsl)

