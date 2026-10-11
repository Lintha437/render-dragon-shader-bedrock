# Actor

Parent: `ActorBase`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Actor --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: Actor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/Actor/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: Actor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/Actor/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: Actor/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/Actor/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: Actor/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/Actor/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: Actor/AlphaTest.fragment.glsl](../GLSL/pipelines/Actor/AlphaTest.fragment.glsl)
- [HLSL fragment: Actor/AlphaTest.fragment.hlsl](../HLSL/pipelines/Actor/AlphaTest.fragment.hlsl)
- [GLSL vertex: Actor/AlphaTest.vertex.glsl](../GLSL/pipelines/Actor/AlphaTest.vertex.glsl)
- [HLSL vertex: Actor/AlphaTest.vertex.hlsl](../HLSL/pipelines/Actor/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: Actor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/Actor/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: Actor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/Actor/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: Actor/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/Actor/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: Actor/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/Actor/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: Actor/Opaque.fragment.glsl](../GLSL/pipelines/Actor/Opaque.fragment.glsl)
- [HLSL fragment: Actor/Opaque.fragment.hlsl](../HLSL/pipelines/Actor/Opaque.fragment.hlsl)
- [GLSL vertex: Actor/AlphaTest.vertex.glsl](../GLSL/pipelines/Actor/AlphaTest.vertex.glsl)
- [HLSL vertex: Actor/AlphaTest.vertex.hlsl](../HLSL/pipelines/Actor/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: Actor/Transparent.fragment.glsl](../GLSL/pipelines/Actor/Transparent.fragment.glsl)
- [HLSL fragment: Actor/Transparent.fragment.hlsl](../HLSL/pipelines/Actor/Transparent.fragment.hlsl)
- [GLSL vertex: Actor/AlphaTest.vertex.glsl](../GLSL/pipelines/Actor/AlphaTest.vertex.glsl)
- [HLSL vertex: Actor/AlphaTest.vertex.hlsl](../HLSL/pipelines/Actor/AlphaTest.vertex.hlsl)

