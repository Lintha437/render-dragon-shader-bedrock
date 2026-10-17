# ItemInHandPrepassGlint

Parent: `ItemInHandPrepass`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ItemInHandPrepassGlint --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassGlint/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassGlint/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassGlint/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassGlint/DepthOnlyOpaque.vertex.hlsl)
- [GLSL fragment: ItemInHandForwardPBRGlint/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandForwardPBRGlint/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ItemInHandForwardPBRGlint/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandForwardPBRGlint/DepthOnlyOpaque.fragment.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassGlint/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassGlint/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepassGlint/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ItemInHandPrepassGlint/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassGlint/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassGlint/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepassGlint/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandPrepassGlint/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepassGlint/GeometryPrepassAlphaTest.fragment.hlsl)

