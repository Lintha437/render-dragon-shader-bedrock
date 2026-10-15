# SingleBlock

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material SingleBlock --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [GLSL fragment: SingleBlock/AlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [HLSL fragment: SingleBlock/AlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlock/AlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlock/AlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off.

- [GLSL fragment: SingleBlock/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlock/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: SingleBlock/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlock/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlock/AlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlock/AlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [GLSL fragment: SingleBlock/AlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [HLSL fragment: SingleBlock/AlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlock/AlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlock/AlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: AlphaTest=Off, Lit=Off.

- [GLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl](../GLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.glsl)
- [GLSL fragment: SingleBlock/AlphaTest.fragment.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.fragment.glsl)
- [HLSL fragment: MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl](../HLSL/pipelines/MeshFallbackPosUVNormalColor/AlphaTest.fragment.hlsl)
- [HLSL fragment: SingleBlock/AlphaTest.fragment.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.fragment.hlsl)
- [GLSL vertex: SingleBlock/AlphaTest.vertex.glsl](../GLSL/pipelines/SingleBlock/AlphaTest.vertex.glsl)
- [HLSL vertex: SingleBlock/AlphaTest.vertex.hlsl](../HLSL/pipelines/SingleBlock/AlphaTest.vertex.hlsl)

