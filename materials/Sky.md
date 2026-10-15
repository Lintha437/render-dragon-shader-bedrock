# Sky

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Sky --defaults
```

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Clouds/Transparent.fragment.glsl](../GLSL/pipelines/Clouds/Transparent.fragment.glsl)
- [HLSL fragment: Clouds/Transparent.fragment.hlsl](../HLSL/pipelines/Clouds/Transparent.fragment.hlsl)
- [GLSL vertex: Sky/Opaque.vertex.glsl](../GLSL/pipelines/Sky/Opaque.vertex.glsl)
- [HLSL vertex: Sky/Opaque.vertex.hlsl](../HLSL/pipelines/Sky/Opaque.vertex.hlsl)

