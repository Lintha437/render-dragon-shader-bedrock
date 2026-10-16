# ParticleForwardPBR

Parent: `Particle`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ParticleForwardPBR --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, PointLightShading=Off.

- [GLSL fragment: ParticleForwardPBR/AlphaTest.fragment.glsl](../GLSL/pipelines/ParticleForwardPBR/AlphaTest.fragment.glsl)
- [HLSL fragment: ParticleForwardPBR/AlphaTest.fragment.hlsl](../HLSL/pipelines/ParticleForwardPBR/AlphaTest.fragment.hlsl)
- [GLSL vertex: ParticleForwardPBR/AlphaTest.vertex.glsl](../GLSL/pipelines/ParticleForwardPBR/AlphaTest.vertex.glsl)
- [HLSL vertex: ParticleForwardPBR/AlphaTest.vertex.hlsl](../HLSL/pipelines/ParticleForwardPBR/AlphaTest.vertex.hlsl)

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, PointLightShading=Off.

- [GLSL vertex: ParticleForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/ParticleForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: ParticleForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/ParticleForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: ParticleForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/ParticleForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: ParticleForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/ParticleForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off, PointLightShading=Off.

- [GLSL fragment: ParticleForwardPBR/Transparent.fragment.glsl](../GLSL/pipelines/ParticleForwardPBR/Transparent.fragment.glsl)
- [HLSL fragment: ParticleForwardPBR/Transparent.fragment.hlsl](../HLSL/pipelines/ParticleForwardPBR/Transparent.fragment.hlsl)
- [GLSL vertex: ParticleForwardPBR/AlphaTest.vertex.glsl](../GLSL/pipelines/ParticleForwardPBR/AlphaTest.vertex.glsl)
- [HLSL vertex: ParticleForwardPBR/AlphaTest.vertex.hlsl](../HLSL/pipelines/ParticleForwardPBR/AlphaTest.vertex.hlsl)

