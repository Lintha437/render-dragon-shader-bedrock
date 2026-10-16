# StandardRed

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material StandardRed --defaults
```

## CustomPassBasedOnOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: StandardRed/CustomPassBasedOnOpaque.fragment.glsl](../GLSL/pipelines/StandardRed/CustomPassBasedOnOpaque.fragment.glsl)
- [HLSL fragment: StandardRed/CustomPassBasedOnOpaque.fragment.hlsl](../HLSL/pipelines/StandardRed/CustomPassBasedOnOpaque.fragment.hlsl)
- [GLSL vertex: Color/Opaque.vertex.glsl](../GLSL/pipelines/Color/Opaque.vertex.glsl)
- [HLSL vertex: Color/Opaque.vertex.hlsl](../HLSL/pipelines/Color/Opaque.vertex.hlsl)

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: StandardRed/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/StandardRed/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: StandardRed/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/StandardRed/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: StandardRed/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/StandardRed/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: StandardRed/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/StandardRed/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: StandardRed/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/StandardRed/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: StandardRed/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/StandardRed/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: StandardRed/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/StandardRed/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: StandardRed/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/StandardRed/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: StandardRed/Opaque.fragment.glsl](../GLSL/pipelines/StandardRed/Opaque.fragment.glsl)
- [HLSL fragment: StandardRed/Opaque.fragment.hlsl](../HLSL/pipelines/StandardRed/Opaque.fragment.hlsl)
- [GLSL vertex: StandardRed/Opaque.vertex.glsl](../GLSL/pipelines/StandardRed/Opaque.vertex.glsl)
- [HLSL vertex: StandardRed/Opaque.vertex.hlsl](../HLSL/pipelines/StandardRed/Opaque.vertex.hlsl)

