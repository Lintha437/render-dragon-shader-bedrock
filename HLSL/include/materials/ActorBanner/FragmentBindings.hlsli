// Native resource and stage-interface layouts for ActorBanner / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[12]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[13]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[14]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[15];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[12]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[13]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[14]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[15] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
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
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[12]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[13]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[14];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[11]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[12]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[13]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[14] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float4 varyingTexCoord2;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
