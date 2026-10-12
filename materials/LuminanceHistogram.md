# LuminanceHistogram

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material LuminanceHistogram --defaults
```

## Fallback

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [GLSL fragment: Checkerboarding/Fallback.fragment.glsl](../GLSL/pipelines/Checkerboarding/Fallback.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)
- [HLSL fragment: Checkerboarding/Fallback.fragment.hlsl](../HLSL/pipelines/Checkerboarding/Fallback.fragment.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [GLSL vertex: Checkerboarding/Fallback.vertex.glsl](../GLSL/pipelines/Checkerboarding/Fallback.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [HLSL vertex: Checkerboarding/Fallback.vertex.hlsl](../HLSL/pipelines/Checkerboarding/Fallback.vertex.hlsl)

## CleanUp

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`, `ps_4_0`, `vs_4_0`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL compute: LuminanceHistogram/CleanUp.compute.glsl](../GLSL/pipelines/LuminanceHistogram/CleanUp.compute.glsl)
- [HLSL compute: LuminanceHistogram/CleanUp.compute.hlsl](../HLSL/pipelines/LuminanceHistogram/CleanUp.compute.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)

## BuildHistogram

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`, `ps_4_0`, `vs_4_0`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL compute: LuminanceHistogram/BuildHistogram.compute.glsl](../GLSL/pipelines/LuminanceHistogram/BuildHistogram.compute.glsl)
- [HLSL compute: LuminanceHistogram/BuildHistogram.compute.hlsl](../HLSL/pipelines/LuminanceHistogram/BuildHistogram.compute.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)

## CalculateAverageFragment

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [GLSL fragment: LuminanceHistogram/CalculateAverageFragment.fragment.glsl](../GLSL/pipelines/LuminanceHistogram/CalculateAverageFragment.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)
- [HLSL fragment: LuminanceHistogram/CalculateAverageFragment.fragment.hlsl](../HLSL/pipelines/LuminanceHistogram/CalculateAverageFragment.fragment.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)

## CalculateAverage

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`, `ps_4_0`, `vs_4_0`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL compute: LuminanceHistogram/CalculateAverage.compute.glsl](../GLSL/pipelines/LuminanceHistogram/CalculateAverage.compute.glsl)
- [HLSL compute: LuminanceHistogram/CalculateAverage.compute.hlsl](../HLSL/pipelines/LuminanceHistogram/CalculateAverage.compute.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)

