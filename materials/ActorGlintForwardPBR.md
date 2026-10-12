# ActorGlintForwardPBR

Parent: `ActorForwardPBR`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorGlintForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorGlintForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorGlintForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorGlintForwardPBR/ForwardPBROpaque.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBROpaque.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/ForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBROpaque.fragment.hlsl)

