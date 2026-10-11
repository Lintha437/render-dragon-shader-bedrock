# WaterPrepass

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material WaterPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: WaterPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/WaterPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: WaterPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/WaterPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: WaterPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/WaterPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: WaterPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/WaterPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthAndNormal

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: WaterPrepass/DepthAndNormal.fragment.glsl](../GLSL/pipelines/WaterPrepass/DepthAndNormal.fragment.glsl)
- [HLSL fragment: WaterPrepass/DepthAndNormal.fragment.hlsl](../HLSL/pipelines/WaterPrepass/DepthAndNormal.fragment.hlsl)
- [GLSL vertex: WaterPrepass/DepthAndNormal.vertex.glsl](../GLSL/pipelines/WaterPrepass/DepthAndNormal.vertex.glsl)
- [HLSL vertex: WaterPrepass/DepthAndNormal.vertex.hlsl](../HLSL/pipelines/WaterPrepass/DepthAndNormal.vertex.hlsl)

## DoWaterSurfaceBuffer

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL vertex: WaterPrepass/DoWaterSurfaceBuffer.vertex.glsl](../GLSL/pipelines/WaterPrepass/DoWaterSurfaceBuffer.vertex.glsl)
- [HLSL vertex: WaterPrepass/DoWaterSurfaceBuffer.vertex.hlsl](../HLSL/pipelines/WaterPrepass/DoWaterSurfaceBuffer.vertex.hlsl)
- [GLSL fragment: WaterPrepass/DoWaterSurfaceBuffer.fragment.glsl](../GLSL/pipelines/WaterPrepass/DoWaterSurfaceBuffer.fragment.glsl)
- [HLSL fragment: WaterPrepass/DoWaterSurfaceBuffer.fragment.hlsl](../HLSL/pipelines/WaterPrepass/DoWaterSurfaceBuffer.fragment.hlsl)

