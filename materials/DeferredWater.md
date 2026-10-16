# DeferredWater

Parent: `DeferredShadingBase`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material DeferredWater --defaults
```

## WaterSurface

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: GPUBlockLighting=Off, PointLightShading=Off.

- [GLSL fragment: DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.glsl)
- [GLSL fragment: DeferredWater/WaterSurface.fragment.glsl](../GLSL/pipelines/DeferredWater/WaterSurface.fragment.glsl)
- [HLSL fragment: DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.hlsl)
- [HLSL fragment: DeferredWater/WaterSurface.fragment.hlsl](../HLSL/pipelines/DeferredWater/WaterSurface.fragment.hlsl)
- [GLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl)
- [HLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl)

## Fallback

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.glsl)
- [GLSL fragment: DeferredIndirectSpecular/Fallback.fragment.glsl](../GLSL/pipelines/DeferredIndirectSpecular/Fallback.fragment.glsl)
- [HLSL fragment: DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.fragment.hlsl)
- [HLSL fragment: DeferredIndirectSpecular/Fallback.fragment.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/Fallback.fragment.hlsl)
- [GLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl)
- [HLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl)

