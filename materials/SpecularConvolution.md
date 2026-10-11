# SpecularConvolution

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SpecularConvolution --defaults
```

## Convolve

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Checkerboarding/DoCheckerboarding.fragment.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.glsl)
- [GLSL fragment: SpecularConvolution/Convolve.fragment.glsl](../GLSL/pipelines/SpecularConvolution/Convolve.fragment.glsl)
- [HLSL fragment: Checkerboarding/DoCheckerboarding.fragment.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.fragment.hlsl)
- [HLSL fragment: SpecularConvolution/Convolve.fragment.hlsl](../HLSL/pipelines/SpecularConvolution/Convolve.fragment.hlsl)
- [GLSL vertex: Checkerboarding/DoCheckerboarding.vertex.glsl](../GLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.glsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [HLSL vertex: Checkerboarding/DoCheckerboarding.vertex.hlsl](../HLSL/pipelines/Checkerboarding/DoCheckerboarding.vertex.hlsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)

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

## GenerateBrdf

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: SpecularConvolution/GenerateBrdf.fragment.glsl](../GLSL/pipelines/SpecularConvolution/GenerateBrdf.fragment.glsl)
- [HLSL fragment: SpecularConvolution/GenerateBrdf.fragment.hlsl](../HLSL/pipelines/SpecularConvolution/GenerateBrdf.fragment.hlsl)
- [GLSL vertex: SpecularConvolution/GenerateBrdf.vertex.glsl](../GLSL/pipelines/SpecularConvolution/GenerateBrdf.vertex.glsl)
- [HLSL vertex: SpecularConvolution/GenerateBrdf.vertex.hlsl](../HLSL/pipelines/SpecularConvolution/GenerateBrdf.vertex.hlsl)

