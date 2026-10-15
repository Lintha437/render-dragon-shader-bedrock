# Basic

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Basic --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, SampleMatTexture=Off, TransformUV0=Off.

- [GLSL fragment: Basic/AlphaTest.fragment.glsl](../GLSL/pipelines/Basic/AlphaTest.fragment.glsl)
- [HLSL fragment: Basic/AlphaTest.fragment.hlsl](../HLSL/pipelines/Basic/AlphaTest.fragment.hlsl)
- [GLSL vertex: Basic/AlphaTest.vertex.glsl](../GLSL/pipelines/Basic/AlphaTest.vertex.glsl)
- [HLSL vertex: Basic/AlphaTest.vertex.hlsl](../HLSL/pipelines/Basic/AlphaTest.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, SampleMatTexture=Off, TransformUV0=Off.

- [GLSL fragment: Basic/Opaque.fragment.glsl](../GLSL/pipelines/Basic/Opaque.fragment.glsl)
- [HLSL fragment: Basic/Opaque.fragment.hlsl](../HLSL/pipelines/Basic/Opaque.fragment.hlsl)
- [GLSL vertex: Basic/AlphaTest.vertex.glsl](../GLSL/pipelines/Basic/AlphaTest.vertex.glsl)
- [HLSL vertex: Basic/AlphaTest.vertex.hlsl](../HLSL/pipelines/Basic/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, SampleMatTexture=Off, TransformUV0=Off.

- [GLSL fragment: Basic/Opaque.fragment.glsl](../GLSL/pipelines/Basic/Opaque.fragment.glsl)
- [HLSL fragment: Basic/Opaque.fragment.hlsl](../HLSL/pipelines/Basic/Opaque.fragment.hlsl)
- [GLSL vertex: Basic/AlphaTest.vertex.glsl](../GLSL/pipelines/Basic/AlphaTest.vertex.glsl)
- [HLSL vertex: Basic/AlphaTest.vertex.hlsl](../HLSL/pipelines/Basic/AlphaTest.vertex.hlsl)

