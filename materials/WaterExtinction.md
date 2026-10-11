# WaterExtinction

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material WaterExtinction --defaults
```

## WaterExtinction

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl)
- [HLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl)
- [GLSL fragment: WaterExtinction/WaterExtinction.fragment.glsl](../GLSL/pipelines/WaterExtinction/WaterExtinction.fragment.glsl)
- [HLSL fragment: WaterExtinction/WaterExtinction.fragment.hlsl](../HLSL/pipelines/WaterExtinction/WaterExtinction.fragment.hlsl)

