// Native resource and stage-interface layouts for LuminanceHistogram / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_curFrameLuminanceHistogram { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_curFrameLuminanceHistogram> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_curFrameLuminanceHistogram(uint wordIndex) { return rdAccess_curFrameLuminanceHistogram(wordIndex); }
#else
RWBuffer<uint> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[index]
#define rdLoad_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram.Load(index)
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 1
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_intermediateValue { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue> intermediateValue : register(u3);
#define rdAccess_intermediateValue(index) intermediateValue[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_intermediateValue(uint wordIndex) { return rdAccess_intermediateValue(wordIndex); }
#else
RWBuffer<uint> intermediateValue : register(u3);
#define rdAccess_intermediateValue(index) intermediateValue[index]
#define rdLoad_intermediateValue(index) intermediateValue.Load(index)
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_LOG_LUMINANCE_RANGE vertexConstants[0]
#define RD_UNIFORM_CENTER_WEIGHT vertexConstants[1]
#define RD_UNIFORM_MIN_LOG_LUMINANCE vertexConstants[2]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED vertexConstants[3]
#define RD_UNIFORM_SCREEN_SIZE vertexConstants[4]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[5] : packoffset(c0);
};
Texture2D<float4> gameColorTexture : register(t0, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_curFrameLuminanceHistogram { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_curFrameLuminanceHistogram> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_curFrameLuminanceHistogram(uint wordIndex) { return rdAccess_curFrameLuminanceHistogram(wordIndex); }
#else
RWBuffer<uint> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[index]
#define rdLoad_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram.Load(index)
#endif
SamplerState gameColorSampler : register(s0, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s1, space0);
static uint3 dispatchThreadId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
    uint localThreadIndex : SV_GroupIndex;
};
groupshared uint intermediateValue[256];
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_LOG_LUMINANCE_RANGE computeVectorConstants0[0]
#define RD_UNIFORM_CENTER_WEIGHT computeVectorConstants0[1]
#define RD_UNIFORM_MIN_LOG_LUMINANCE computeVectorConstants0[2]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED computeVectorConstants0[3]
#define RD_UNIFORM_SCREEN_SIZE computeVectorConstants0[4]
cbuffer ComputeVectorConstants0Buffer : register(b0)
{
    float4 computeVectorConstants0[5] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(u3);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_intermediateValue2(uint wordIndex) { return rdAccess_intermediateValue2(wordIndex); }
#else
RWBuffer<uint> intermediateValue2 : register(u3);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
static uint3 dispatchThreadId;
static uint localThreadIndex;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
    uint localThreadIndex : SV_GroupIndex;
};
groupshared uint intermediateValue5[256];
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_ADAPTIVE_PARAMETERS vertexConstants[0]
#define RD_UNIFORM_LOG_LUMINANCE_RANGE vertexConstants[1]
#define RD_UNIFORM_ADAPTATION vertexConstants[2]
#define RD_UNIFORM_MIN_LOG_LUMINANCE vertexConstants[3]
#define RD_UNIFORM_QUANTILE_BOUNDS vertexConstants[4]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[5] : packoffset(c0);
};
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t1, space0);
RWTexture2D<float4> adaptedFrameAverageLuminanceTexture : register(u2, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_curFrameLuminanceHistogram { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_curFrameLuminanceHistogram> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_curFrameLuminanceHistogram(uint wordIndex) { return rdAccess_curFrameLuminanceHistogram(wordIndex); }
#else
RWBuffer<uint> curFrameLuminanceHistogram : register(u3, space0);
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[index]
#define rdLoad_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram.Load(index)
#endif
SamplerState previousFrameAverageLuminanceSampler : register(s1, space0);
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_ADAPTIVE_PARAMETERS computeVectorConstants0[0]
#define RD_UNIFORM_LOG_LUMINANCE_RANGE computeVectorConstants0[1]
#define RD_UNIFORM_ADAPTATION computeVectorConstants0[2]
#define RD_UNIFORM_MIN_LOG_LUMINANCE computeVectorConstants0[3]
#define RD_UNIFORM_QUANTILE_BOUNDS computeVectorConstants0[4]
cbuffer ComputeVectorConstants0Buffer : register(b0)
{
    float4 computeVectorConstants0[5] : packoffset(c0);
};
Texture2D<float4> materialTexture1 : register(t1);
RWTexture2D<float4> intermediateValue1 : register(u2);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_U3_WORDS)
struct RdNativeElement_intermediateValue2 { uint words[RD_NATIVE_U3_WORDS]; };
RWStructuredBuffer<RdNativeElement_intermediateValue2> intermediateValue2 : register(u3);
#define rdAccess_intermediateValue2(index) intermediateValue2[(index) / RD_NATIVE_U3_WORDS].words[(index) % RD_NATIVE_U3_WORDS]
uint rdLoad_intermediateValue2(uint wordIndex) { return rdAccess_intermediateValue2(wordIndex); }
#else
RWBuffer<uint> intermediateValue2 : register(u3);
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#define rdLoad_intermediateValue2(index) intermediateValue2.Load(index)
#endif
SamplerState textureSampler1 : register(s1);
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_curFrameLuminanceHistogram
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[index]
#endif
#ifndef rdAccess_intermediateValue
#define rdAccess_intermediateValue(index) intermediateValue[index]
#endif
#ifndef rdAccess_intermediateValue2
#define rdAccess_intermediateValue2(index) intermediateValue2[index]
#endif
