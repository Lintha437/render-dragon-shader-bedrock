# SkyProbeDeferredShading

Parent: `DeferredShadingBase`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SkyProbeDeferredShading --defaults
```

## DoDeferredShading

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl)
- [HLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl)
- [GLSL fragment: SkyProbeDeferredShading/DoDeferredShading.fragment.glsl](../GLSL/pipelines/SkyProbeDeferredShading/DoDeferredShading.fragment.glsl)
- [HLSL fragment: SkyProbeDeferredShading/DoDeferredShading.fragment.hlsl](../HLSL/pipelines/SkyProbeDeferredShading/DoDeferredShading.fragment.hlsl)

## Fallback

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl](../GLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.glsl)
- [HLSL vertex: DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/DoIndirectSpecularShading.vertex.hlsl)
- [GLSL fragment: DeferredIndirectSpecular/Fallback.fragment.glsl](../GLSL/pipelines/DeferredIndirectSpecular/Fallback.fragment.glsl)
- [HLSL fragment: DeferredIndirectSpecular/Fallback.fragment.hlsl](../HLSL/pipelines/DeferredIndirectSpecular/Fallback.fragment.hlsl)

