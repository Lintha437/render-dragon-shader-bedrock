// Native resource and stage-interface layouts for ItemInHandPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[11]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[12]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[13]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[11]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[12]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[13]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[11]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[12]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[14]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[11]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[12]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[14]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[19]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[20]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[21]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[24]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[25]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[26]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[19]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[20]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[21]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[24]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[25]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[26]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[19]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[20]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[21]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[24]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[25]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[26]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[27]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[19]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[20]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[21]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[24]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[25]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[26]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[27]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[14] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord8;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[14];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[15] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord8;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[15];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[27] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord8;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 5
  float4 fragmentVectorConstants1[27];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[28] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord8;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[28];
}
#define RD_COMPARISON_MASK -
#endif
