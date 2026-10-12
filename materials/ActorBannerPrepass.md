# ActorBannerPrepass

Parent: `ActorPrepass`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorBannerPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBannerPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorBannerPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorBannerPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBannerPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorBannerPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorBannerPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorBannerPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBannerPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBannerForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBannerForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorBannerForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorBannerForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorBannerForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL vertex: ActorBannerPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorBannerPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorBannerPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorBannerPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorBannerPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ActorBannerPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ActorBannerPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ActorBannerPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL vertex: ActorBannerPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorBannerPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorBannerPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorBannerPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorBannerPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ActorBannerPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ActorBannerPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBannerPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

