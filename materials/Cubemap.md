# Cubemap

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material Cubemap --defaults
```

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Cubemap/Opaque.fragment.glsl](../GLSL/pipelines/Cubemap/Opaque.fragment.glsl)
- [HLSL fragment: Cubemap/Opaque.fragment.hlsl](../HLSL/pipelines/Cubemap/Opaque.fragment.hlsl)
- [GLSL vertex: Cubemap/Opaque.vertex.glsl](../GLSL/pipelines/Cubemap/Opaque.vertex.glsl)
- [HLSL vertex: Cubemap/Opaque.vertex.hlsl](../HLSL/pipelines/Cubemap/Opaque.vertex.hlsl)

