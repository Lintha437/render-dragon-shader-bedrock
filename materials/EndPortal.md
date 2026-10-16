# EndPortal

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material EndPortal --defaults
```

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: EndPortal/Opaque.fragment.glsl](../GLSL/pipelines/EndPortal/Opaque.fragment.glsl)
- [HLSL fragment: EndPortal/Opaque.fragment.hlsl](../HLSL/pipelines/EndPortal/Opaque.fragment.hlsl)
- [GLSL vertex: EndPortal/Opaque.vertex.glsl](../GLSL/pipelines/EndPortal/Opaque.vertex.glsl)
- [HLSL vertex: EndPortal/Opaque.vertex.hlsl](../HLSL/pipelines/EndPortal/Opaque.vertex.hlsl)

