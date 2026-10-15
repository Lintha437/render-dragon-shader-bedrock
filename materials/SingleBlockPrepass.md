# SingleBlockPrepass

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SingleBlockPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: SingleBlockPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlockPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlockPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlockPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlockPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlockPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlockPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlockPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, RenderAsBillboards=Off, Instancing=Off, Seasons=Off.

- [GLSL fragment: SingleBlockPrepass/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/SingleBlockPrepass/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: SingleBlockPrepass/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/SingleBlockPrepass/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: SingleBlockPrepass/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/SingleBlockPrepass/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: SingleBlockPrepass/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/SingleBlockPrepass/DepthOnlyOpaque.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=On, RenderAsBillboards=Off, Instancing=Off, Seasons=Off, UseTextures=On.

- [GLSL vertex: SingleBlockPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/SingleBlockPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: SingleBlockPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/SingleBlockPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: SingleBlockPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/SingleBlockPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: SingleBlockPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/SingleBlockPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=On, RenderAsBillboards=Off, Instancing=Off, Seasons=Off, UseTextures=On.

- [GLSL vertex: SingleBlockPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/SingleBlockPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: SingleBlockPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/SingleBlockPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: SingleBlockPrepass/GeometryPrepassAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlockPrepass/GeometryPrepassAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlockPrepass/GeometryPrepassAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlockPrepass/GeometryPrepassAlphaTest.fragment.hlsl)

