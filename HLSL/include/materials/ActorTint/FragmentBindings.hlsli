// Native resource and stage-interface layouts for ActorTint / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[9]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[15]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[16]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[17]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[8]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[9]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[14]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[15]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[16]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[17]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[9]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[10]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[11]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[15]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[16]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[17]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[18]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[9]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[10]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[15]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[16]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[18]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[2]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[1]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[2]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[3]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[4]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[2]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[3]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[4]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[18];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[18] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
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
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[19] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
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
  float4 fragmentVectorConstants1[19];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[5] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[5];
}
#define RD_COMPARISON_MASK -
#endif
