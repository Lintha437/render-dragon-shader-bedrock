# LegacyCubemap

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material LegacyCubemap --defaults
```

## ForceForwardPBROpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: LegacyCubemap/ForceForwardPBROpaque.fragment.glsl](../GLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.fragment.glsl)
- [HLSL fragment: LegacyCubemap/ForceForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.fragment.hlsl)
- [GLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.glsl](../GLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.glsl)
- [HLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl](../HLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Blit/Transparent.fragment.glsl](../GLSL/pipelines/Blit/Transparent.fragment.glsl)
- [GLSL fragment: LegacyCubemap/Transparent.fragment.glsl](../GLSL/pipelines/LegacyCubemap/Transparent.fragment.glsl)
- [HLSL fragment: Blit/Transparent.fragment.hlsl](../HLSL/pipelines/Blit/Transparent.fragment.hlsl)
- [HLSL fragment: LegacyCubemap/Transparent.fragment.hlsl](../HLSL/pipelines/LegacyCubemap/Transparent.fragment.hlsl)
- [GLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.glsl](../GLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.glsl)
- [HLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl](../HLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl)

## TransparentDegamma

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: LegacyCubemap/TransparentDegamma.fragment.glsl](../GLSL/pipelines/LegacyCubemap/TransparentDegamma.fragment.glsl)
- [HLSL fragment: LegacyCubemap/TransparentDegamma.fragment.hlsl](../HLSL/pipelines/LegacyCubemap/TransparentDegamma.fragment.hlsl)
- [GLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.glsl](../GLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.glsl)
- [HLSL vertex: LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl](../HLSL/pipelines/LegacyCubemap/ForceForwardPBROpaque.vertex.hlsl)

