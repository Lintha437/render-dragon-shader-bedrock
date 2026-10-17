# LocalExposure

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material LocalExposure --defaults
```

## ApplyLocalExposure

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: LocalExposure/ApplyLocalExposure.fragment.glsl](../GLSL/pipelines/LocalExposure/ApplyLocalExposure.fragment.glsl)
- [HLSL fragment: LocalExposure/ApplyLocalExposure.fragment.hlsl](../HLSL/pipelines/LocalExposure/ApplyLocalExposure.fragment.hlsl)
- [GLSL vertex: LocalExposure/ApplyLocalExposure.vertex.glsl](../GLSL/pipelines/LocalExposure/ApplyLocalExposure.vertex.glsl)
- [HLSL vertex: LocalExposure/ApplyLocalExposure.vertex.hlsl](../HLSL/pipelines/LocalExposure/ApplyLocalExposure.vertex.hlsl)

## GaussianDownsample

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: LocalExposure/GaussianDownsample.fragment.glsl](../GLSL/pipelines/LocalExposure/GaussianDownsample.fragment.glsl)
- [HLSL fragment: LocalExposure/GaussianDownsample.fragment.hlsl](../HLSL/pipelines/LocalExposure/GaussianDownsample.fragment.hlsl)
- [GLSL vertex: LocalExposure/ApplyLocalExposure.vertex.glsl](../GLSL/pipelines/LocalExposure/ApplyLocalExposure.vertex.glsl)
- [HLSL vertex: LocalExposure/ApplyLocalExposure.vertex.hlsl](../HLSL/pipelines/LocalExposure/ApplyLocalExposure.vertex.hlsl)

