# WeatherForwardPBR

Parent: `Weather`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material WeatherForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, FlipOcclusion=Off, Instancing=Off, NoOcclusion=Off, NoVariety=Off.

- [GLSL vertex: WeatherForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/WeatherForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: WeatherForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/WeatherForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: WeatherForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/WeatherForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: WeatherForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/WeatherForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, FlipOcclusion=Off, Instancing=Off, NoOcclusion=Off, NoVariety=Off.

- [GLSL fragment: WeatherForwardPBR/Transparent.fragment.glsl](../GLSL/pipelines/WeatherForwardPBR/Transparent.fragment.glsl)
- [HLSL fragment: WeatherForwardPBR/Transparent.fragment.hlsl](../HLSL/pipelines/WeatherForwardPBR/Transparent.fragment.hlsl)
- [GLSL vertex: WeatherForwardPBR/Transparent.vertex.glsl](../GLSL/pipelines/WeatherForwardPBR/Transparent.vertex.glsl)
- [HLSL vertex: WeatherForwardPBR/Transparent.vertex.hlsl](../HLSL/pipelines/WeatherForwardPBR/Transparent.vertex.hlsl)

## MotionOnly

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: PointLightShading=Off, FlipOcclusion=Off, NoOcclusion=Off, NoVariety=Off.

- [GLSL fragment: WeatherForwardPBR/MotionOnly.fragment.glsl](../GLSL/pipelines/WeatherForwardPBR/MotionOnly.fragment.glsl)
- [HLSL fragment: WeatherForwardPBR/MotionOnly.fragment.hlsl](../HLSL/pipelines/WeatherForwardPBR/MotionOnly.fragment.hlsl)
- [GLSL vertex: WeatherForwardPBR/MotionOnly.vertex.glsl](../GLSL/pipelines/WeatherForwardPBR/MotionOnly.vertex.glsl)
- [HLSL vertex: WeatherForwardPBR/MotionOnly.vertex.hlsl](../HLSL/pipelines/WeatherForwardPBR/MotionOnly.vertex.hlsl)

