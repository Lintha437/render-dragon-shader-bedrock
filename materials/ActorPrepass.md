# ActorPrepass

Parent: `ActorBase`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.glsl)
- [GLSL fragment: ActorPatternPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorPatternPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [HLSL fragment: ActorPatternPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorPatternPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ActorPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ActorPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ActorPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorMultiTexturePrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ActorPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ActorPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

