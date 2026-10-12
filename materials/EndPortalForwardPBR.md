# EndPortalForwardPBR

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material EndPortalForwardPBR --defaults
```

## DepthOnlyOpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: EndPortalForwardPBR/DepthOnlyOpaque.fragment.glsl](../GLSL/pipelines/EndPortalForwardPBR/DepthOnlyOpaque.fragment.glsl)
- [HLSL fragment: EndPortalForwardPBR/DepthOnlyOpaque.fragment.hlsl](../HLSL/pipelines/EndPortalForwardPBR/DepthOnlyOpaque.fragment.hlsl)
- [GLSL vertex: EndPortal/Opaque.vertex.glsl](../GLSL/pipelines/EndPortal/Opaque.vertex.glsl)
- [HLSL vertex: EndPortal/Opaque.vertex.hlsl](../HLSL/pipelines/EndPortal/Opaque.vertex.hlsl)

## ForceForwardPBROpaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Instancing=Off.

- [GLSL fragment: EndPortalForwardPBR/ForceForwardPBROpaque.fragment.glsl](../GLSL/pipelines/EndPortalForwardPBR/ForceForwardPBROpaque.fragment.glsl)
- [HLSL fragment: EndPortalForwardPBR/ForceForwardPBROpaque.fragment.hlsl](../HLSL/pipelines/EndPortalForwardPBR/ForceForwardPBROpaque.fragment.hlsl)
- [GLSL vertex: EndPortal/Opaque.vertex.glsl](../GLSL/pipelines/EndPortal/Opaque.vertex.glsl)
- [HLSL vertex: EndPortal/Opaque.vertex.hlsl](../HLSL/pipelines/EndPortal/Opaque.vertex.hlsl)

