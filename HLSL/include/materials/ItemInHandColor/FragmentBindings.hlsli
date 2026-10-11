// Native resource and stage-interface layouts for ItemInHandColor / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
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
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[9]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[15]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[16];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[9]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[15]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[16] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
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
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[9]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[15]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[16]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[17] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
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
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[9]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[15]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[16]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[17];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[1]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[3] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[2]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[1]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[2]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[4] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[2]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[3]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[9]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[15]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[16] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[9]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[15]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[16]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[17] : packoffset(c0);
};
static float4 varyingColor3;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor3 : COLOR3;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
