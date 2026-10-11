# ActorMultiTexturePrepass

Parent: `ActorPrepass`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorMultiTexturePrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorMultiTexturePrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ActorMultiTexturePrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, ColorSecondTexture=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorMultiTexturePrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ActorMultiTexturePrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepassAlphaTest.fragment.hlsl)

