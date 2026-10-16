// Native resource and stage-interface layouts for LuminanceHistogram / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_ADAPTATION fragmentConstants[0]
#define RD_UNIFORM_ADAPTIVE_PARAMETERS fragmentConstants[1]
#define RD_UNIFORM_LOG_LUMINANCE_RANGE fragmentConstants[2]
#define RD_UNIFORM_MIN_LOG_LUMINANCE fragmentConstants[3]
#define RD_UNIFORM_QUANTILE_BOUNDS fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[5] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_ADAPTATION fragmentVectorConstants1[0]
#define RD_UNIFORM_ADAPTIVE_PARAMETERS fragmentVectorConstants1[1]
#define RD_UNIFORM_LOG_LUMINANCE_RANGE fragmentVectorConstants1[2]
#define RD_UNIFORM_MIN_LOG_LUMINANCE fragmentVectorConstants1[3]
#define RD_UNIFORM_QUANTILE_BOUNDS fragmentVectorConstants1[4]
struct StorageBufferRecord3 {
  float val[1];
#endif
};
#if RD_BINDING_LAYOUT == 0
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
SamplerState previousFrameAverageLuminanceSampler : register(s1, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
#elif RD_BINDING_LAYOUT == 1
RWStructuredBuffer<StorageBufferRecord3> writableResource3 : register(u3);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[5];
}
#define RD_COMPARISON_MASK -
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_curFrameLuminanceHistogram
#define rdAccess_curFrameLuminanceHistogram(index) curFrameLuminanceHistogram[index]
#endif
