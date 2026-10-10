# Third-party notices

The MIT license covers the original project tooling, documentation and original
contributions made by this project. It does not relicense Minecraft, RenderDragon,
Mojang's original shader programs, or third-party compiler implementations.

The GLSL/HLSL baseline and native interface descriptions were reconstructed from
user-supplied Minecraft Bedrock 1.26.60.30 RC0 programs. Recovery, variable naming
and compilation do not make them Mojang's original source text or establish a
new license grant over underlying third-party expression. Respect the rights
applicable to that material when using or redistributing derived work.

Original `.material.bin` files, encrypted containers, extraction snapshots,
compiler executables and rebuilt game packages are not included in this repository.
Users provide their own matching game files for local validation and packaging.

External tools used by the local workflow include:

| Tool | Purpose | Upstream |
|---|---|---|
| Lazurite 0.11.0 | Material v26 parsing and writing | https://github.com/veka0/lazurite |
| DirectX Shader Compiler | Native SM6 compilation and reflection | https://github.com/microsoft/DirectXShaderCompiler |
| Windows SDK FXC / D3DCompiler | Native SM4/5 compilation and reflection | Microsoft Windows SDK |
| glslang | GLSL to Vulkan SPIR-V compilation | https://github.com/KhronosGroup/glslang |
| dxil-spirv | Earlier local recovery from DXIL/DXBC | https://github.com/HansKristian-Work/dxil-spirv |
| SPIRV-Cross | Earlier local HLSL/GLSL recovery | https://github.com/KhronosGroup/SPIRV-Cross |

These tools retain their upstream licenses and distribution terms. They are not
vendored here. This is an independent project and is not affiliated with or
endorsed by Mojang or Microsoft.
