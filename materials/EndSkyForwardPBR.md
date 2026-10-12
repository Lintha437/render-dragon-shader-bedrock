# EndSkyForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material EndSkyForwardPBR --defaults
```

## ForceForwardPBROpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: EndSkyForwardPBR/ForceForwardPBROpaque.fragment.glsl](../GLSL/pipelines/EndSkyForwardPBR/ForceForwardPBROpaque.fragment.glsl)
- [HLSL fragment: EndSkyForwardPBR/ForceForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/EndSkyForwardPBR/ForceForwardPBROpaque.fragment.hlsl)
- [GLSL vertex: EndSkyForwardPBR/ForceForwardPBROpaque.vertex.glsl](../GLSL/pipelines/EndSkyForwardPBR/ForceForwardPBROpaque.vertex.glsl)
- [HLSL vertex: EndSkyForwardPBR/ForceForwardPBROpaque.vertex.hlsl](../HLSL/pipelines/EndSkyForwardPBR/ForceForwardPBROpaque.vertex.hlsl)

