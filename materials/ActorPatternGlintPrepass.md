# ActorPatternGlintPrepass

Parent: `ActorPatternPrepass`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorPatternGlintPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MultiColorTint=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlintPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorGlintPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorGlintPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorGlintPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorGlintPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlintPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlintPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlintPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MultiColorTint=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorGlintForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MultiColorTint=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorGlintPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorGlintPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorGlintPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorGlintPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorPatternGlintPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ActorPatternGlintPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ActorPatternGlintPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ActorPatternGlintPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MultiColorTint=Off, MaskedMultitexture=Off.

- [GLSL vertex: ActorGlintPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ActorGlintPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ActorGlintPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ActorGlintPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ActorPatternGlintPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ActorPatternGlintPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ActorPatternGlintPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorPatternGlintPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

