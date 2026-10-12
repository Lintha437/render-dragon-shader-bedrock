# PopulateVolume

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material PopulateVolume --defaults
```

## Populate

Native profiles: `cs_5_0`, `cs_6_3`, `cs_6_5`, `ps_4_0`, `vs_4_0`.

Default features: GPUBlockLighting=Off, PointLightShading=Off, ThreadLimit=LimitedAt128.

- [GLSL compute: PopulateVolume/Populate.compute.glsl](../GLSL/pipelines/PopulateVolume/Populate.compute.glsl)
- [HLSL compute: PopulateVolume/Populate.compute.hlsl](../HLSL/pipelines/PopulateVolume/Populate.compute.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)

## Fallback

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [GLSL fragment: Checkerboarding/Fallback.fragment.glsl](../GLSL/pipelines/Checkerboarding/Fallback.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)
- [HLSL fragment: Checkerboarding/Fallback.fragment.hlsl](../HLSL/pipelines/Checkerboarding/Fallback.fragment.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [GLSL vertex: Checkerboarding/Fallback.vertex.glsl](../GLSL/pipelines/Checkerboarding/Fallback.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [HLSL vertex: Checkerboarding/Fallback.vertex.hlsl](../HLSL/pipelines/Checkerboarding/Fallback.vertex.hlsl)

