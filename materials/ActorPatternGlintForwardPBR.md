# ActorPatternGlintForwardPBR

Parent: `ActorPatternForwardPBR`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorPatternGlintForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MultiColorTint=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorPatternGlintForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: ActorPatternGlintForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MultiColorTint=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MultiColorTint=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MultiColorTint=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorPatternGlintForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: ActorPatternGlintForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MultiColorTint=Off, MaskedMultitexture=Off, PointLightShading=Off.

- [GLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ActorPatternGlintForwardPBR/ForwardPBROpaque.fragment.glsl](../GLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBROpaque.fragment.glsl)
- [HLSL fragment: ActorPatternGlintForwardPBR/ForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/ActorPatternGlintForwardPBR/ForwardPBROpaque.fragment.hlsl)

