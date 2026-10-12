// Native resource and stage-interface layouts for ActorBase / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
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
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
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
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
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
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> matTexture1Texture : register(t1, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState matTexture1Sampler : register(s1, space0);
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
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
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_COMPARISON_MASK -
#endif
