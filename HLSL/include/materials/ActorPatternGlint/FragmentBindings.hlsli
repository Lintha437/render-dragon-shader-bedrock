// Native resource and stage-interface layouts for ActorPatternGlint / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
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
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PATTERN_COUNT fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[9]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[10]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[13]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[14]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[15]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[16]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[31]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[32] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
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
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PATTERN_COUNT fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[9]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[10]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[13]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[14]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[15]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[16]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[31]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[32];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[12]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[13]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[14]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[15]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[16]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[17] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
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
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[12]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[13]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[14]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[15]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[16]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[17];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_PATTERN_COUNT fragmentConstants[0]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[1]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[17]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[18] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_PATTERN_COUNT fragmentVectorConstants1[0]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[2]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[17]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[18];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[11]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[12]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[13]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[14]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[15]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[16] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[11]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[12]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[14]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[15]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[16];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_PATTERN_COUNT fragmentConstants[0]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[16] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture2Texture : register(t2, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture2Sampler : register(s2, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_PATTERN_COUNT fragmentVectorConstants1[0]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[16];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 12
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
static float4 varyingTexCoord1;
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
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    centroid float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 13
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
#endif
