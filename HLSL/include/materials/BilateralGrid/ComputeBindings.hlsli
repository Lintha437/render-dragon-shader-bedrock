// Native resource and stage-interface layouts for BilateralGrid / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS vertexConstants[0]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED vertexConstants[1]
#define RD_UNIFORM_GRID_DIMENSIONS vertexConstants[2]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS computeVectorConstants0[0]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED computeVectorConstants0[1]
#define RD_UNIFORM_GRID_DIMENSIONS computeVectorConstants0[2]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION computeVectorConstants0[3]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_GRID_DIMENSIONS computeVectorConstants0[0]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_GRID_DIMENSIONS vertexConstants[0]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_BILATERAL_FILTER_PARAMS vertexConstants[0]
#define RD_UNIFORM_GRID_DIMENSIONS vertexConstants[1]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_BILATERAL_FILTER_PARAMS computeVectorConstants0[0]
#define RD_UNIFORM_GRID_DIMENSIONS computeVectorConstants0[1]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[4] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 computeVectorConstants0[4] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 2
    float4 computeVectorConstants0[1] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 3
    float4 vertexConstants[1] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 4
    float4 vertexConstants[2] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 5
    float4 computeVectorConstants0[2] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t1, space0);
Texture2D<float4> sceneColorTexture : register(t2, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_bilateralGrid { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_bilateralGrid> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_bilateralGrid(uint wordIndex) { return rdAccess_bilateralGrid(wordIndex); }
#else
RWBuffer<uint> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[index]
#define rdLoad_bilateralGrid(index) bilateralGrid.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture2 : register(t2);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(u4);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_intermediateValue2(uint wordIndex) { return rdAccess_intermediateValue2(wordIndex); }
#else
RWBuffer<uint> intermediateValue2 : register(u4);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 2
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_intermediateValue { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue> intermediateValue : register(u4);
#define rdAccess_intermediateValue(index) intermediateValue[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_intermediateValue(uint wordIndex) { return rdAccess_intermediateValue(wordIndex); }
#else
RWBuffer<uint> intermediateValue : register(u4);
#define rdAccess_intermediateValue(index) intermediateValue[index]
#define rdLoad_intermediateValue(index) intermediateValue.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 3
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_bilateralGrid { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_bilateralGrid> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_bilateralGrid(uint wordIndex) { return rdAccess_bilateralGrid(wordIndex); }
#else
RWBuffer<uint> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[index]
#define rdLoad_bilateralGrid(index) bilateralGrid.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 4
RWTexture3D<float4> filteredBilateralGridOutputTexture : register(u3, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_bilateralGrid { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_bilateralGrid> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_bilateralGrid(uint wordIndex) { return rdAccess_bilateralGrid(wordIndex); }
#else
RWBuffer<uint> bilateralGrid : register(u4, space0);
#define rdAccess_bilateralGrid(index) bilateralGrid[index]
#define rdLoad_bilateralGrid(index) bilateralGrid.Load(index)
#endif
#elif RD_BINDING_LAYOUT == 5
RWTexture3D<float4> intermediateValue : register(u3);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U4_WORDS)
struct RdNativeElement_intermediateValue1 { uint words[RD_NATIVE_U4_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue1> intermediateValue1 : register(u4);
#define rdAccess_intermediateValue1(index) intermediateValue1[(index) / RD_NATIVE_U4_WORDS].words[(index) % RD_NATIVE_U4_WORDS]
uint rdLoad_intermediateValue1(uint wordIndex) { return rdAccess_intermediateValue1(wordIndex); }
#else
RWBuffer<uint> intermediateValue1 : register(u4);
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#define rdLoad_intermediateValue1(index) intermediateValue1.Load(index)
#endif
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_bilateralGrid
#define rdAccess_bilateralGrid(index) bilateralGrid[index]
#endif
#ifndef rdAccess_intermediateValue
#define rdAccess_intermediateValue(index) intermediateValue[index]
#endif
#ifndef rdAccess_intermediateValue1
#define rdAccess_intermediateValue1(index) intermediateValue1[index]
#endif
#ifndef rdAccess_intermediateValue2
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#endif
