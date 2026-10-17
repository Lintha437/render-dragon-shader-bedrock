# RTXPostFX.Tonemapping

Parent: `RTXPostFX`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material RTXPostFX.Tonemapping --defaults
```

## ToneMapping

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: RTXPostFX.Tonemapping/ToneMapping.fragment.glsl](../GLSL/pipelines/RTXPostFX.Tonemapping/ToneMapping.fragment.glsl)
- [HLSL fragment: RTXPostFX.Tonemapping/ToneMapping.fragment.hlsl](../HLSL/pipelines/RTXPostFX.Tonemapping/ToneMapping.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

