# RTXPostFX.Bloom

Parent: `RTXPostFX`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material RTXPostFX.Bloom --defaults
```

## BloomDownscaleGaussianPass

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: RTXPostFX.Bloom/BloomDownscaleGaussianPass.fragment.glsl](../GLSL/pipelines/RTXPostFX.Bloom/BloomDownscaleGaussianPass.fragment.glsl)
- [HLSL fragment: RTXPostFX.Bloom/BloomDownscaleGaussianPass.fragment.hlsl](../HLSL/pipelines/RTXPostFX.Bloom/BloomDownscaleGaussianPass.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

## BloomDownscaleUniformPass

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: RTXPostFX.Bloom/BloomDownscaleUniformPass.fragment.glsl](../GLSL/pipelines/RTXPostFX.Bloom/BloomDownscaleUniformPass.fragment.glsl)
- [HLSL fragment: RTXPostFX.Bloom/BloomDownscaleUniformPass.fragment.hlsl](../HLSL/pipelines/RTXPostFX.Bloom/BloomDownscaleUniformPass.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

## BloomFinalPass

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: RTXPostFX.Bloom/BloomFinalPass.fragment.glsl](../GLSL/pipelines/RTXPostFX.Bloom/BloomFinalPass.fragment.glsl)
- [HLSL fragment: RTXPostFX.Bloom/BloomFinalPass.fragment.hlsl](../HLSL/pipelines/RTXPostFX.Bloom/BloomFinalPass.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

## BloomUpscalePass

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: RTXPostFX.Bloom/BloomUpscalePass.fragment.glsl](../GLSL/pipelines/RTXPostFX.Bloom/BloomUpscalePass.fragment.glsl)
- [HLSL fragment: RTXPostFX.Bloom/BloomUpscalePass.fragment.hlsl](../HLSL/pipelines/RTXPostFX.Bloom/BloomUpscalePass.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

