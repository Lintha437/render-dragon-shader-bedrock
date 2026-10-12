# ItemInHandPrepassTextured

Parent: `ItemInHandPrepass`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ItemInHandPrepassTextured --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.glsl)
- [GLSL fragment: ItemInHandPrepassTextured/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.hlsl)
- [HLSL fragment: ItemInHandPrepassTextured/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: ItemInHandPrepassTextured/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassTextured/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassTextured/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassTextured/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/DepthOnlyOpaque.vertex.hlsl)
- [GLSL fragment: ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandForwardPBRTextured/DepthOnlyOpaque.fragment.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassTextured/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassTextured/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepassTextured/GeometryPrepass.fragment.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.fragment.glsl)
- [HLSL fragment: ItemInHandPrepassTextured/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, MultiColorTint=Off.

- [GLSL vertex: ItemInHandPrepassTextured/GeometryPrepass.vertex.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.vertex.glsl)
- [HLSL vertex: ItemInHandPrepassTextured/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: ItemInHandPrepassTextured/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandPrepassTextured/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandPrepassTextured/GeometryPrepassAlphaTest.fragment.hlsl)

