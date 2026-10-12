# HiZDownSample

Parent: `PostFX`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material HiZDownSample --defaults
```

## MinMaxDownSample

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: HiZDownSample/MinMaxDownSample.fragment.glsl](../GLSL/pipelines/HiZDownSample/MinMaxDownSample.fragment.glsl)
- [HLSL fragment: HiZDownSample/MinMaxDownSample.fragment.hlsl](../HLSL/pipelines/HiZDownSample/MinMaxDownSample.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## MinMaxInitialize

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: HiZDownSample/MinMaxInitialize.fragment.glsl](../GLSL/pipelines/HiZDownSample/MinMaxInitialize.fragment.glsl)
- [HLSL fragment: HiZDownSample/MinMaxInitialize.fragment.hlsl](../HLSL/pipelines/HiZDownSample/MinMaxInitialize.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

