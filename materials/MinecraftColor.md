# MinecraftColor

Parent: `Core/Color`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material MinecraftColor --defaults
```

## DepthOnlyAlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Color/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/Color/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: Color/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/Color/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: Color/DepthOnlyAlphaTest.vertex.glsl](../GLSL/pipelines/Color/DepthOnlyAlphaTest.vertex.glsl)
- [HLSL vertex: Color/DepthOnlyAlphaTest.vertex.hlsl](../HLSL/pipelines/Color/DepthOnlyAlphaTest.vertex.hlsl)

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: Color/DepthOnlyAlphaTest.fragment.glsl](../GLSL/pipelines/Color/DepthOnlyAlphaTest.fragment.glsl)
- [HLSL fragment: Color/DepthOnlyAlphaTest.fragment.hlsl](../HLSL/pipelines/Color/DepthOnlyAlphaTest.fragment.hlsl)
- [GLSL vertex: Color/DepthOnlyOpaque.vertex.glsl](../GLSL/pipelines/Color/DepthOnlyOpaque.vertex.glsl)
- [HLSL vertex: Color/DepthOnlyOpaque.vertex.hlsl](../HLSL/pipelines/Color/DepthOnlyOpaque.vertex.hlsl)

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: MinecraftColor/Opaque.fragment.glsl](../GLSL/pipelines/MinecraftColor/Opaque.fragment.glsl)
- [HLSL fragment: MinecraftColor/Opaque.fragment.hlsl](../HLSL/pipelines/MinecraftColor/Opaque.fragment.hlsl)
- [GLSL vertex: Color/Opaque.vertex.glsl](../GLSL/pipelines/Color/Opaque.vertex.glsl)
- [HLSL vertex: Color/Opaque.vertex.hlsl](../HLSL/pipelines/Color/Opaque.vertex.hlsl)

