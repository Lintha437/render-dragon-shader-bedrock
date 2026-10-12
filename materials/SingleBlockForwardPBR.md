# SingleBlockForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SingleBlockForwardPBR --defaults
```

## ForwardPBRTransparent

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: SingleBlockForwardPBR/ForwardPBRTransparent.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/ForwardPBRTransparent.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.fragment.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL fragment: SingleBlockForwardPBR/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlockForwardPBR/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL fragment: SingleBlockForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: SingleBlockForwardPBR/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/DepthOnlyOpaque.vertex.hlsl)

## ForwardPBRAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## ForwardPBROpaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRTransparent.vertex.hlsl)
- [GLSL fragment: SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/ForwardPBRAlphaTest.fragment.hlsl)

## Opaque

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: RenderAsBillboards=Off, Instancing=Off, PointLightShading=Off, Seasons=Off.

- [GLSL vertex: SingleBlockForwardPBR/Opaque.vertex.glsl](../GLSL/pipelines/SingleBlockForwardPBR/Opaque.vertex.glsl)
- [HLSL vertex: SingleBlockForwardPBR/Opaque.vertex.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/Opaque.vertex.hlsl)
- [GLSL fragment: SingleBlockForwardPBR/Opaque.fragment.glsl](../GLSL/pipelines/SingleBlockForwardPBR/Opaque.fragment.glsl)
- [HLSL fragment: SingleBlockForwardPBR/Opaque.fragment.hlsl](../HLSL/pipelines/SingleBlockForwardPBR/Opaque.fragment.hlsl)

