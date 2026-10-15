# SunMoon

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SunMoon --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: EndSky/Opaque.fragment.glsl](../GLSL/pipelines/EndSky/Opaque.fragment.glsl)
- [GLSL fragment: SunMoon/Transparent.fragment.glsl](../GLSL/pipelines/SunMoon/Transparent.fragment.glsl)
- [HLSL fragment: EndSky/Opaque.fragment.hlsl](../HLSL/pipelines/EndSky/Opaque.fragment.hlsl)
- [HLSL fragment: SunMoon/Transparent.fragment.hlsl](../HLSL/pipelines/SunMoon/Transparent.fragment.hlsl)
- [GLSL vertex: Stars/Transparent.vertex.glsl](../GLSL/pipelines/Stars/Transparent.vertex.glsl)
- [HLSL vertex: Stars/Transparent.vertex.hlsl](../HLSL/pipelines/Stars/Transparent.vertex.hlsl)

