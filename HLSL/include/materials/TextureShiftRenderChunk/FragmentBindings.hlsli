// Native resource and stage-interface layouts for TextureShiftRenderChunk / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[0]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[0]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[1]
struct t3_t {
  float val[8];
};
StructuredBuffer<t3_t> sampledResource3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[7]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[9]
struct t3_t {
  float val[8];
};
StructuredBuffer<t3_t> sampledResource3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[10];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[7]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 6
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 7
struct t3_t {
  float val[8];
};
StructuredBuffer<t3_t> sampledResource3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[0]
struct t3_t {
  float val[8];
};
StructuredBuffer<t3_t> sampledResource3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[7]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T3_WORDS)
struct RdNativeElement_textureShiftBufferData { uint words[RD_NATIVE_T3_WORDS]; };
StructuredBuffer<RdNativeElement_textureShiftBufferData> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[(index) / RD_NATIVE_T3_WORDS].words[(index) % RD_NATIVE_T3_WORDS]
uint4 rdLoad_textureShiftBufferData(uint wordIndex) { return uint4(rdAccess_textureShiftBufferData(wordIndex), rdAccess_textureShiftBufferData(wordIndex + 1u), rdAccess_textureShiftBufferData(wordIndex + 2u), rdAccess_textureShiftBufferData(wordIndex + 3u)); }
#else
Buffer<uint4> textureShiftBufferData : register(t3, space0);
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#define rdLoad_textureShiftBufferData(index) textureShiftBufferData.Load(index)
#endif
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_textureShiftBufferData
#define rdAccess_textureShiftBufferData(index) textureShiftBufferData[index]
#endif
