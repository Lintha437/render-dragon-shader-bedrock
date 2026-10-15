# ScreenSpaceReflections

Parent: `PostFX`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ScreenSpaceReflections --defaults
```

## SSRFillGaps

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: ExtendedGapFill=Off.

- [GLSL fragment: ScreenSpaceReflections/SSRFillGaps.fragment.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRFillGaps.fragment.glsl)
- [HLSL fragment: ScreenSpaceReflections/SSRFillGaps.fragment.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRFillGaps.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## SSRGetReflectedColor

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ScreenSpaceReflections/SSRGetReflectedColor.fragment.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRGetReflectedColor.fragment.glsl)
- [HLSL fragment: ScreenSpaceReflections/SSRGetReflectedColor.fragment.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRGetReflectedColor.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## SSRRayMarch

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ScreenSpaceReflections/SSRRayMarch.fragment.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.fragment.glsl)
- [HLSL fragment: ScreenSpaceReflections/SSRRayMarch.fragment.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.fragment.hlsl)
- [GLSL vertex: ScreenSpaceReflections/SSRRayMarch.vertex.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.vertex.glsl)
- [HLSL vertex: ScreenSpaceReflections/SSRRayMarch.vertex.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.vertex.hlsl)

## SSRRayMarchHZB

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ScreenSpaceReflections/SSRRayMarchHZB.fragment.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRRayMarchHZB.fragment.glsl)
- [HLSL fragment: ScreenSpaceReflections/SSRRayMarchHZB.fragment.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRRayMarchHZB.fragment.hlsl)
- [GLSL vertex: ScreenSpaceReflections/SSRRayMarch.vertex.glsl](../GLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.vertex.glsl)
- [HLSL vertex: ScreenSpaceReflections/SSRRayMarch.vertex.hlsl](../HLSL/pipelines/ScreenSpaceReflections/SSRRayMarch.vertex.hlsl)

