# PostFX.Debug.VoxelBuffer

Parent: `PostFX.Debug`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material PostFX.Debug.VoxelBuffer --defaults
```

## Fallback

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: PostFX.Debug/DebugBlit.fragment.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.fragment.glsl)
- [HLSL fragment: PostFX.Debug/DebugBlit.fragment.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.fragment.hlsl)
- [GLSL vertex: PostFX.Debug.VoxelBuffer/Fallback.vertex.glsl](../GLSL/pipelines/PostFX.Debug.VoxelBuffer/Fallback.vertex.glsl)
- [HLSL vertex: PostFX.Debug.VoxelBuffer/Fallback.vertex.hlsl](../HLSL/pipelines/PostFX.Debug.VoxelBuffer/Fallback.vertex.hlsl)

## DebugBlit

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: PostFX.Debug/DebugBlit.fragment.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.fragment.glsl)
- [HLSL fragment: PostFX.Debug/DebugBlit.fragment.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug/DebugBlit.vertex.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug/DebugBlit.vertex.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.vertex.hlsl)

## DebugBlitVoxel

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: none.

- [GLSL fragment: PostFX.Debug.VoxelBuffer/DebugBlitVoxel.fragment.glsl](../GLSL/pipelines/PostFX.Debug.VoxelBuffer/DebugBlitVoxel.fragment.glsl)
- [GLSL fragment: PostFX.Debug/DebugBlit.fragment.glsl](../GLSL/pipelines/PostFX.Debug/DebugBlit.fragment.glsl)
- [HLSL fragment: PostFX.Debug.VoxelBuffer/DebugBlitVoxel.fragment.hlsl](../HLSL/pipelines/PostFX.Debug.VoxelBuffer/DebugBlitVoxel.fragment.hlsl)
- [HLSL fragment: PostFX.Debug/DebugBlit.fragment.hlsl](../HLSL/pipelines/PostFX.Debug/DebugBlit.fragment.hlsl)
- [GLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.glsl](../GLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.glsl)
- [GLSL vertex: PostFX.Debug.VoxelBuffer/Fallback.vertex.glsl](../GLSL/pipelines/PostFX.Debug.VoxelBuffer/Fallback.vertex.glsl)
- [HLSL vertex: CubemapTransfer/CubemapToOffscreen.vertex.hlsl](../HLSL/pipelines/CubemapTransfer/CubemapToOffscreen.vertex.hlsl)
- [HLSL vertex: PostFX.Debug.VoxelBuffer/Fallback.vertex.hlsl](../HLSL/pipelines/PostFX.Debug.VoxelBuffer/Fallback.vertex.hlsl)

