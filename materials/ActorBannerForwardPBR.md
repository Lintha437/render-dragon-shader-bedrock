# ActorBannerForwardPBR

Parent: `ActorForwardPBR`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorBannerForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorBannerForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorBannerForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorBannerForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorBannerForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorBannerForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorBannerForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorBannerForwardPBR/ForwardPBROpaque.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/ForwardPBROpaque.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/ForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/ForwardPBROpaque.fragment.hlsl)

