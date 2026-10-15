# ImGui

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material ImGui --defaults
```

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: ImGui/Transparent.fragment.glsl](../GLSL/pipelines/ImGui/Transparent.fragment.glsl)
- [HLSL fragment: ImGui/Transparent.fragment.hlsl](../HLSL/pipelines/ImGui/Transparent.fragment.hlsl)
- [GLSL vertex: ImGui/Transparent.vertex.glsl](../GLSL/pipelines/ImGui/Transparent.vertex.glsl)
- [HLSL vertex: ImGui/Transparent.vertex.hlsl](../HLSL/pipelines/ImGui/Transparent.vertex.hlsl)

