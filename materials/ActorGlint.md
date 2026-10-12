# ActorGlint

Parent: `Actor`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorGlint --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlint/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorGlint/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorGlint/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorGlint/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorGlint/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorGlint/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorGlint/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorGlint/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlint/AlphaTest.fragment.glsl](../GLSL/pipelines/ActorGlint/AlphaTest.fragment.glsl)
- [HLSL fragment: ActorGlint/AlphaTest.fragment.hlsl](../HLSL/pipelines/ActorGlint/AlphaTest.fragment.hlsl)
- [GLSL vertex: ActorGlint/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlint/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlint/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlint/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlint/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorGlint/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorGlint/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorGlint/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorGlint/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorGlint/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorGlint/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorGlint/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlint/Opaque.fragment.glsl](../GLSL/pipelines/ActorGlint/Opaque.fragment.glsl)
- [HLSL fragment: ActorGlint/Opaque.fragment.hlsl](../HLSL/pipelines/ActorGlint/Opaque.fragment.hlsl)
- [GLSL vertex: ActorGlint/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlint/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlint/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlint/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorGlint/Transparent.fragment.glsl](../GLSL/pipelines/ActorGlint/Transparent.fragment.glsl)
- [HLSL fragment: ActorGlint/Transparent.fragment.hlsl](../HLSL/pipelines/ActorGlint/Transparent.fragment.hlsl)
- [GLSL vertex: ActorGlint/AlphaTest.vertex.glsl](../GLSL/pipelines/ActorGlint/AlphaTest.vertex.glsl)
- [HLSL vertex: ActorGlint/AlphaTest.vertex.hlsl](../HLSL/pipelines/ActorGlint/AlphaTest.vertex.hlsl)

