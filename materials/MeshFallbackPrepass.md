# MeshFallbackPrepass

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material MeshFallbackPrepass --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On, Instancing=Off, UseTextures=On.

- [GLSL fragment: MeshFallbackPrepass/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPrepass/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPrepass/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPrepass/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: MeshFallbackPrepass/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/MeshFallbackPrepass/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: MeshFallbackPrepass/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/MeshFallbackPrepass/DepthOnlyAlphaTest.vertex.hlsl)

## GeometryPrepass

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=On, Instancing=Off, UseTextures=On.

- [GLSL vertex: MeshFallbackPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: MeshFallbackPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: MeshFallbackPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: MeshFallbackPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.fragment.hlsl)

## GeometryPrepassAlphaTest

Native profiles: `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off, Fancy=On, Instancing=Off, UseTextures=On.

- [GLSL vertex: MeshFallbackPrepass/GeometryPrepass.vertex.glsl](../GLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.vertex.glsl)
- [HLSL vertex: MeshFallbackPrepass/GeometryPrepass.vertex.hlsl](../HLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.vertex.hlsl)
- [GLSL fragment: MeshFallbackPrepass/GeometryPrepass.fragment.glsl](../GLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.fragment.glsl)
- [HLSL fragment: MeshFallbackPrepass/GeometryPrepass.fragment.hlsl](../HLSL/pipelines/MeshFallbackPrepass/GeometryPrepass.fragment.hlsl)

