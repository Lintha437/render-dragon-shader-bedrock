// Native resource and stage-interface layouts for ParticlePrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> particleTextureTexture : register(t2, space0);
SamplerState particleTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
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
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[9]
#define RD_UNIFORM_MERS_UNIFORMS fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[11] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> normalTextureTexture : register(t1, space0);
Texture2D<float4> particleTextureTexture : register(t2, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState normalTextureSampler : register(s1, space0);
SamplerState particleTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
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
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[9]
#define RD_UNIFORM_MERS_UNIFORMS fragmentVectorConstants1[10]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
Texture2D<float4> particleTextureTexture : register(t2, space0);
SamplerState particleTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#endif
