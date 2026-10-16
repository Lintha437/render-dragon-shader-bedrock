// Native resource and stage-interface layouts for SingleBlockPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 2
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[10]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[11]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[12] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
SamplerState matTextureSampler : register(s0, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentVectorConstants1[10]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[11]
struct t2_t {
  float val[16];
};
StructuredBuffer<t2_t> sampledResource2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[12];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[9]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[10]
struct t2_t {
  float val[16];
};
StructuredBuffer<t2_t> sampledResource2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[9]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[11] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> seasonsTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
SamplerState matTextureSampler : register(s0, space0);
SamplerState seasonsTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[16]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[17]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[18]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentConstants[20]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[22]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[23]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[24]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[25] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
SamplerState matTextureSampler : register(s0, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[17]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentVectorConstants1[18]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentVectorConstants1[20]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[22]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[23]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[24]
struct t2_t {
  float val[16];
};
StructuredBuffer<t2_t> sampledResource2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[25];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[17]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentVectorConstants1[19]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[21]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[22]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[23]
struct t2_t {
  float val[16];
};
StructuredBuffer<t2_t> sampledResource2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[24];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[16]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[17]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentConstants[19]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[21]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[22]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[23]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[24] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> seasonsTextureTexture : register(t1, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T2_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T2_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T2_WORDS].words[(index) % RD_NATIVE_T2_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t2, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
#endif
SamplerState matTextureSampler : register(s0, space0);
SamplerState seasonsTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_pbrData
#define rdAccess_pbrData(index) pbrData[index]
#endif
