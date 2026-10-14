// Native resource and stage-interface layouts for Particle / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> particleTextureTexture : register(t0, space0);
SamplerState particleTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
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
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
Texture2D<float4> particleTextureTexture : register(t0, space0);
SamplerState particleTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
