// Native resource and stage-interface layouts for PostFX.Debug.VoxelBuffer / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[8]
#define RD_UNIFORM_VOLUME_LAYER fragmentConstants[9]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[11] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[8]
#define RD_UNIFORM_VOLUME_LAYER fragmentVectorConstants1[9]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[10]
struct t7_t {
  float val[1];
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> normalTexture : register(t0, space0);
Texture2D<float4> rasterColorTexture : register(t2, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T6_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T6_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t6, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T6_WORDS].words[(index) % RD_NATIVE_T6_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t6, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T7_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T7_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t7, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T7_WORDS].words[(index) % RD_NATIVE_T7_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t7, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState normalSampler : register(s0, space0);
SamplerState rasterColorSampler : register(s2, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
#elif RD_BINDING_LAYOUT == 1
StructuredBuffer<t7_t> sampledResource7 : register(t7);
struct t6_t {
  float val[4];
#endif
};
#if RD_BINDING_LAYOUT == 0
struct FragmentStageOutput
#elif RD_BINDING_LAYOUT == 1
StructuredBuffer<t6_t> sampledResource6 : register(t6);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
