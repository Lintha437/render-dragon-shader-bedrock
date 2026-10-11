# Bloom

Parent: `PostFX`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Bloom --defaults
```

## BloomBlend

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Bloom/BloomBlend.fragment.glsl](../GLSL/pipelines/Bloom/BloomBlend.fragment.glsl)
- [HLSL fragment: Bloom/BloomBlend.fragment.hlsl](../HLSL/pipelines/Bloom/BloomBlend.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## DFDownSample

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Bloom/DFDownSample.fragment.glsl](../GLSL/pipelines/Bloom/DFDownSample.fragment.glsl)
- [HLSL fragment: Bloom/DFDownSample.fragment.hlsl](../HLSL/pipelines/Bloom/DFDownSample.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## DFUpSample

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Bloom/DFUpSample.fragment.glsl](../GLSL/pipelines/Bloom/DFUpSample.fragment.glsl)
- [HLSL fragment: Bloom/DFUpSample.fragment.hlsl](../HLSL/pipelines/Bloom/DFUpSample.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

## ThresholdedDownSample

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Bloom/ThresholdedDownSample.fragment.glsl](../GLSL/pipelines/Bloom/ThresholdedDownSample.fragment.glsl)
- [HLSL fragment: Bloom/ThresholdedDownSample.fragment.hlsl](../HLSL/pipelines/Bloom/ThresholdedDownSample.fragment.hlsl)
- [GLSL vertex: Bloom/BloomBlend.vertex.glsl](../GLSL/pipelines/Bloom/BloomBlend.vertex.glsl)
- [HLSL vertex: Bloom/BloomBlend.vertex.hlsl](../HLSL/pipelines/Bloom/BloomBlend.vertex.hlsl)

