# ItemInHandPrepass

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ItemInHandPrepass --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepass/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ItemInHandPrepass/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ItemInHandPrepass/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepass/DepthOnlyOpaque.vertex.hlsl)
- [GLSL fragment: ItemInHandForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ItemInHandForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandForwardPBR/DepthOnlyOpaque.fragment.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ItemInHandPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ItemInHandPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

