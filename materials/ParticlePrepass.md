# ParticlePrepass

Parent: `Particle`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ParticlePrepass --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: ParticlePrepass/AlphaTest.fragment.glsl](../GLSL/pipelines/ParticlePrepass/AlphaTest.fragment.glsl)
- [HLSL fragment: ParticlePrepass/AlphaTest.fragment.hlsl](../HLSL/pipelines/ParticlePrepass/AlphaTest.fragment.hlsl)
- [GLSL vertex: ParticlePrepass/AlphaTest.vertex.glsl](../GLSL/pipelines/ParticlePrepass/AlphaTest.vertex.glsl)
- [HLSL vertex: ParticlePrepass/AlphaTest.vertex.hlsl](../HLSL/pipelines/ParticlePrepass/AlphaTest.vertex.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL vertex: ParticlePrepass/GeometryPrepassAlphaTest.vertex.glsl](../GLSL/pipelines/ParticlePrepass/GeometryPrepassAlphaTest.vertex.glsl)
- [HLSL vertex: ParticlePrepass/GeometryPrepassAlphaTest.vertex.hlsl](../HLSL/pipelines/ParticlePrepass/GeometryPrepassAlphaTest.vertex.hlsl)
- [GLSL fragment: ParticlePrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/ParticlePrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: ParticlePrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/ParticlePrepass/GeometryPrepassAlphaTest.fragment.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: ParticlePrepass/Transparent.fragment.glsl](../GLSL/pipelines/ParticlePrepass/Transparent.fragment.glsl)
- [HLSL fragment: ParticlePrepass/Transparent.fragment.hlsl](../HLSL/pipelines/ParticlePrepass/Transparent.fragment.hlsl)
- [GLSL vertex: ParticlePrepass/AlphaTest.vertex.glsl](../GLSL/pipelines/ParticlePrepass/AlphaTest.vertex.glsl)
- [HLSL vertex: ParticlePrepass/AlphaTest.vertex.hlsl](../HLSL/pipelines/ParticlePrepass/AlphaTest.vertex.hlsl)

