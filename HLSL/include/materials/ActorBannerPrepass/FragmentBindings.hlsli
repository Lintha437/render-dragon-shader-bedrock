// Native resource and stage-interface layouts for ActorBannerPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 8
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
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0 fragmentConstants[10]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1 fragmentConstants[11]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2 fragmentConstants[12]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3 fragmentConstants[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[14]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 9
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
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0 fragmentVectorConstants1[10]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1 fragmentVectorConstants1[11]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2 fragmentVectorConstants1[12]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3 fragmentVectorConstants1[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[14]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 10
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
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[18]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0 fragmentConstants[19]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1 fragmentConstants[20]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2 fragmentConstants[21]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3 fragmentConstants[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[27]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[28]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 11
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
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[18]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0 fragmentVectorConstants1[19]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1 fragmentVectorConstants1[20]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2 fragmentVectorConstants1[21]
#define RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3 fragmentVectorConstants1[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[27]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[28]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
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
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 5 || RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 8
    float4 fragmentConstants[15] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 9
  float4 fragmentVectorConstants1[15];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
    float4 fragmentConstants[29] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
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
#elif RD_BINDING_LAYOUT == 11
  float4 fragmentVectorConstants1[29];
}
#define RD_COMPARISON_MASK -
#endif
