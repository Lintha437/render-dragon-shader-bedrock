# ActorPattern

Parent: `Actor`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorPattern --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, UIEntity=Enabled, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorPattern/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorPattern/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorPattern/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorPattern/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, UIEntity=Enabled, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorPattern/AlphaTest.fragment.glsl](../GLSL/pipelines/ActorPattern/AlphaTest.fragment.glsl)
- [HLSL fragment: ActorPattern/AlphaTest.fragment.hlsl](../HLSL/pipelines/ActorPattern/AlphaTest.fragment.hlsl)
- [GLSL vertex: ActorPattern/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorPattern/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorPattern/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorPattern/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, UIEntity=Enabled, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBanner/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBanner/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorPattern/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorPattern/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorPattern/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorPattern/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, UIEntity=Enabled, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorPattern/Opaque.fragment.glsl](../GLSL/pipelines/ActorPattern/Opaque.fragment.glsl)
- [HLSL fragment: ActorPattern/Opaque.fragment.hlsl](../HLSL/pipelines/ActorPattern/Opaque.fragment.hlsl)
- [GLSL vertex: ActorPattern/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorPattern/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorPattern/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorPattern/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, UIEntity=Enabled, Tinting=Enabled, MaskedMultitexture=Off.

- [GLSL fragment: ActorPattern/Opaque.fragment.glsl](../GLSL/pipelines/ActorPattern/Opaque.fragment.glsl)
- [HLSL fragment: ActorPattern/Opaque.fragment.hlsl](../HLSL/pipelines/ActorPattern/Opaque.fragment.hlsl)
- [GLSL vertex: ActorPattern/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorPattern/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorPattern/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorPattern/AlphaTest.vertex.hlsl)

