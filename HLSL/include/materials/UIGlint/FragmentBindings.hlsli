// Native resource and stage-interface layouts for UIGlint / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[1]
#define RD_UNIFORM_TINT_COLOR fragmentVectorConstants1[2]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[0]
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[1]
#define RD_UNIFORM_TINT_COLOR fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentVectorConstants1[3] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[3] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> glintTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState glintTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
static float4 varyingColor0;
#endif
static float2 varyingTexCoord1;
static float2 varyingTexCoord2;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
#if RD_BINDING_LAYOUT == 1
    float4 varyingColor0 : COLOR0;
#endif
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
