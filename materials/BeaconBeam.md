# BeaconBeam

Parent: `none`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material BeaconBeam --defaults
```

## Opaque

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: Fancy=On.

- [GLSL fragment: BeaconBeam/Opaque.fragment.glsl](../GLSL/pipelines/BeaconBeam/Opaque.fragment.glsl)
- [HLSL fragment: BeaconBeam/Opaque.fragment.hlsl](../HLSL/pipelines/BeaconBeam/Opaque.fragment.hlsl)
- [GLSL vertex: BeaconBeam/Opaque.vertex.glsl](../GLSL/pipelines/BeaconBeam/Opaque.vertex.glsl)
- [HLSL vertex: BeaconBeam/Opaque.vertex.hlsl](../HLSL/pipelines/BeaconBeam/Opaque.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: BeaconBeam/Transparent.fragment.glsl](../GLSL/pipelines/BeaconBeam/Transparent.fragment.glsl)
- [HLSL fragment: BeaconBeam/Transparent.fragment.hlsl](../HLSL/pipelines/BeaconBeam/Transparent.fragment.hlsl)
- [GLSL vertex: BeaconBeam/Transparent.vertex.glsl](../GLSL/pipelines/BeaconBeam/Transparent.vertex.glsl)
- [HLSL vertex: BeaconBeam/Transparent.vertex.hlsl](../HLSL/pipelines/BeaconBeam/Transparent.vertex.hlsl)

