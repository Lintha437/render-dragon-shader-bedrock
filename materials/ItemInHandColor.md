# ItemInHandColor

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ItemInHandColor --defaults
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

- [GLSL fragment: ItemInHandColor/AlphaTest.fragment.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.fragment.glsl)
- [HLSL fragment: ItemInHandColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.fragment.hlsl)
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

- [GLSL fragment: ItemInHandColor/Opaque.fragment.glsl](../GLSL/pipelines/ItemInHandColor/Opaque.fragment.glsl)
- [HLSL fragment: ItemInHandColor/Opaque.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/Opaque.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/AlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=Off, Instancing=Off, MultiColorTint=Off.

- [GLSL fragment: ItemInHandColor/Transparent.fragment.glsl](../GLSL/pipelines/ItemInHandColor/Transparent.fragment.glsl)
- [HLSL fragment: ItemInHandColor/Transparent.fragment.hlsl](../HLSL/pipelines/ItemInHandColor/Transparent.fragment.hlsl)
- [GLSL vertex: ItemInHandColor/AlphaTest.vertex.glsl](../GLSL/pipelines/ItemInHandColor/AlphaTest.vertex.glsl)
- [HLSL vertex: ItemInHandColor/AlphaTest.vertex.hlsl](../HLSL/pipelines/ItemInHandColor/AlphaTest.vertex.hlsl)

