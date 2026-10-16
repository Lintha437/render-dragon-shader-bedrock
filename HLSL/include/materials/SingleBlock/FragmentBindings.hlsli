// Native resource and stage-interface layouts for SingleBlock / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[8]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[10]
#define RD_UNIFORM_CURRENT_COLOR fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[15]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[16]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentVectorConstants1[10]
#define RD_UNIFORM_CURRENT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[15]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[16]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[8]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[10]
#define RD_UNIFORM_CURRENT_COLOR fragmentConstants[11]
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[12]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[16]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[17]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[9]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentVectorConstants1[10]
#define RD_UNIFORM_CURRENT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[12]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[16]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[17]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_DISCARD_VALUE fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_DISCARD_VALUE fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[17] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
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
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[17];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[18] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
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
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[18];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
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
    centroid float2 varyingTexCoord0 : TEXCOORD0;
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
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#endif
