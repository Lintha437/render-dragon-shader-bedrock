# BilateralGrid

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material BilateralGrid --defaults
```

## BuildBilateralGrid

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`.

Default features: ThreadLimit=LimitedAt64.

- [GLSL compute: BilateralGrid/BuildBilateralGrid.compute.glsl](../GLSL/pipelines/BilateralGrid/BuildBilateralGrid.compute.glsl)
- [HLSL compute: BilateralGrid/BuildBilateralGrid.compute.hlsl](../HLSL/pipelines/BilateralGrid/BuildBilateralGrid.compute.hlsl)

## ClearBilateralGrid

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL compute: BilateralGrid/ClearBilateralGrid.compute.glsl](../GLSL/pipelines/BilateralGrid/ClearBilateralGrid.compute.glsl)
- [HLSL compute: BilateralGrid/ClearBilateralGrid.compute.hlsl](../HLSL/pipelines/BilateralGrid/ClearBilateralGrid.compute.hlsl)

## FilterBilateralGrid

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`.

Default features: ThreadLimit=LimitedAt128.

- [GLSL compute: BilateralGrid/FilterBilateralGrid.compute.glsl](../GLSL/pipelines/BilateralGrid/FilterBilateralGrid.compute.glsl)
- [HLSL compute: BilateralGrid/FilterBilateralGrid.compute.hlsl](../HLSL/pipelines/BilateralGrid/FilterBilateralGrid.compute.hlsl)

