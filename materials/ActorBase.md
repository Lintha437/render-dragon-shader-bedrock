# ActorBase

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ActorBase --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorBase/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ActorBase/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ActorBase/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ActorBase/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ActorBase/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ActorBase/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ActorBase/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ActorBase/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Change_Color=Off, Fancy=On, Emissive=Off, Instancing=Off, MaskedMultitexture=Off.

- [GLSL fragment: ActorBase/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ActorBase/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ActorBase/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ActorBase/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ActorBase/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ActorBase/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ActorBase/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ActorBase/DepthOnlyOpaque.vertex.hlsl)

