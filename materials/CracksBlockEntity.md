# CracksBlockEntity

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material CracksBlockEntity --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: Blit/Transparent.fragment.glsl](../GLSL/pipelines/Blit/Transparent.fragment.glsl)
- [GLSL fragment: CracksBlockEntity/Transparent.fragment.glsl](../GLSL/pipelines/CracksBlockEntity/Transparent.fragment.glsl)
- [HLSL fragment: Blit/Transparent.fragment.hlsl](../HLSL/pipelines/Blit/Transparent.fragment.hlsl)
- [HLSL fragment: CracksBlockEntity/Transparent.fragment.hlsl](../HLSL/pipelines/CracksBlockEntity/Transparent.fragment.hlsl)
- [GLSL vertex: CracksBlockEntity/Transparent.vertex.glsl](../GLSL/pipelines/CracksBlockEntity/Transparent.vertex.glsl)
- [HLSL vertex: CracksBlockEntity/Transparent.vertex.hlsl](../HLSL/pipelines/CracksBlockEntity/Transparent.vertex.hlsl)

