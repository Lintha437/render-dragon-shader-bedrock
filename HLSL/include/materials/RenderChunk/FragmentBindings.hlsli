// Native resource and stage-interface layouts for RenderChunk / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> seasonsTextureTexture : register(t2, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState seasonsTextureSampler : register(s2, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[7]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[9]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[10];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[7]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[7]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[9]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[10];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[7]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> seasonsTextureTexture : register(t2, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState seasonsTextureSampler : register(s2, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 10
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 11
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
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
#elif RD_BINDING_LAYOUT == 12
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 13
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> seasonsTextureTexture : register(t2, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState seasonsTextureSampler : register(s2, space0);
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 14
#define RD_UNIFORM_FOG_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 15
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[7]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[8]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> lightMapTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState lightMapTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float4 varyingColor2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 varyingColor3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor2 : COLOR2;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 varyingColor3 : COLOR3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
