// Native resource and stage-interface layouts for MeshFallbackPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
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
#define RD_UNIFORM_CURRENT_COLOR fragmentConstants[10]
#define RD_UNIFORM_MERS_UNIFORMS fragmentConstants[11]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[13] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
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
#elif RD_BINDING_LAYOUT == 3
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
#define RD_UNIFORM_CURRENT_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_MERS_UNIFORMS fragmentVectorConstants1[11]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[12]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[13];
}
#define RD_COMPARISON_MASK -
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
#define RD_UNIFORM_CURRENT_COLOR fragmentConstants[10]
#define RD_UNIFORM_MERS_UNIFORMS fragmentConstants[11]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[13] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
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
#define RD_UNIFORM_CURRENT_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_MERS_UNIFORMS fragmentVectorConstants1[11]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[12]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[13];
}
#define RD_COMPARISON_MASK -
#endif
