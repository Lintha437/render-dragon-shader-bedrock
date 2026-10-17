# Particle

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Particle --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Particle/AlphaTest.fragment.glsl](../GLSL/pipelines/Particle/AlphaTest.fragment.glsl)
- [HLSL fragment: Particle/AlphaTest.fragment.hlsl](../HLSL/pipelines/Particle/AlphaTest.fragment.hlsl)
- [GLSL vertex: Particle/AlphaTest.vertex.glsl](../GLSL/pipelines/Particle/AlphaTest.vertex.glsl)
- [HLSL vertex: Particle/AlphaTest.vertex.hlsl](../HLSL/pipelines/Particle/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Particle/Transparent.fragment.glsl](../GLSL/pipelines/Particle/Transparent.fragment.glsl)
- [HLSL fragment: Particle/Transparent.fragment.hlsl](../HLSL/pipelines/Particle/Transparent.fragment.hlsl)
- [GLSL vertex: Particle/AlphaTest.vertex.glsl](../GLSL/pipelines/Particle/AlphaTest.vertex.glsl)
- [HLSL vertex: Particle/AlphaTest.vertex.hlsl](../HLSL/pipelines/Particle/AlphaTest.vertex.hlsl)

