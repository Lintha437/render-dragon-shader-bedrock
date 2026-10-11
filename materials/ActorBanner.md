# ActorBanner

Parent: `Actor`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorBanner --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorBanner/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorBanner/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/AlphaTest.fragment.glsl](../GLSL/pipelines/ActorBanner/AlphaTest.fragment.glsl)
- [HLSL fragment: ActorBanner/AlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBanner/AlphaTest.fragment.hlsl)
- [GLSL vertex: ActorBanner/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorBanner/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorBanner/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBanner/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorBanner/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorBanner/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/Opaque.fragment.glsl](../GLSL/pipelines/ActorBanner/Opaque.fragment.glsl)
- [HLSL fragment: ActorBanner/Opaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/Opaque.fragment.hlsl)
- [GLSL vertex: ActorBanner/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorBanner/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorBanner/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBanner/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/Opaque.fragment.glsl](../GLSL/pipelines/ActorBanner/Opaque.fragment.glsl)
- [HLSL fragment: ActorBanner/Opaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/Opaque.fragment.hlsl)
- [GLSL vertex: ActorBanner/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorBanner/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorBanner/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBanner/AlphaTest.vertex.hlsl)

