# RenderChunk

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material RenderChunk --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunk/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/RenderChunk/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: RenderChunk/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/RenderChunk/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: RenderChunk/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/RenderChunk/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: RenderChunk/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/RenderChunk/DepthOnlyOpaque.vertex.hlsl)

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunk/AlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunk/AlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunk/AlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunk/AlphaTest.fragment.hlsl)
- [GLSL vertex: RenderChunk/AlphaTest.vertex.glsl](../GLSL/pipelines/RenderChunk/AlphaTest.vertex.glsl)
- [HLSL vertex: RenderChunk/AlphaTest.vertex.hlsl](../HLSL/pipelines/RenderChunk/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunk/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/RenderChunk/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: RenderChunk/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/RenderChunk/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: RenderChunk/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/RenderChunk/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: RenderChunk/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/RenderChunk/DepthOnlyAlphaTest.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunk/Opaque.fragment.glsl](../GLSL/pipelines/RenderChunk/Opaque.fragment.glsl)
- [HLSL fragment: RenderChunk/Opaque.fragment.hlsl](../HLSL/pipelines/RenderChunk/Opaque.fragment.hlsl)
- [GLSL vertex: RenderChunk/Opaque.vertex.glsl](../GLSL/pipelines/RenderChunk/Opaque.vertex.glsl)
- [HLSL vertex: RenderChunk/Opaque.vertex.hlsl](../HLSL/pipelines/RenderChunk/Opaque.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Dithering=Off, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: RenderChunk/Transparent.fragment.glsl](../GLSL/pipelines/RenderChunk/Transparent.fragment.glsl)
- [HLSL fragment: RenderChunk/Transparent.fragment.hlsl](../HLSL/pipelines/RenderChunk/Transparent.fragment.hlsl)
- [GLSL vertex: RenderChunk/Transparent.vertex.glsl](../GLSL/pipelines/RenderChunk/Transparent.vertex.glsl)
- [HLSL vertex: RenderChunk/Transparent.vertex.hlsl](../HLSL/pipelines/RenderChunk/Transparent.vertex.hlsl)

