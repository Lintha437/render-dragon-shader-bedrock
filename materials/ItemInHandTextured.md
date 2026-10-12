# ItemInHandTextured

Parent: `ItemInHandColor`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ItemInHandTextured --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ItemInHandColor/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandTextured/AlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandTextured/AlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandTextured/AlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandTextured/AlphaTest.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/AlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: ItemInHandColor/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: ItemInHandColor/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandTextured/Opaque.fragment.glsl](../GLSL/pipelines/ItemInHandTextured/Opaque.fragment.glsl)
- [HLSL fragment: ItemInHandTextured/Opaque.fragment.hlsl](../HLSL/pipelines/ItemInHandTextured/Opaque.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/AlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandTextured/Transparent.fragment.glsl](../GLSL/pipelines/ItemInHandTextured/Transparent.fragment.glsl)
- [HLSL fragment: ItemInHandTextured/Transparent.fragment.hlsl](../HLSL/pipelines/ItemInHandTextured/Transparent.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/AlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.vertex.hlsl)

