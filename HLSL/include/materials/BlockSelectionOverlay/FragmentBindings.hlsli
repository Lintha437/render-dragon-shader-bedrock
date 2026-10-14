// Native resource and stage-interface layouts for BlockSelectionOverlay / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[0]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_MAT_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[1] : packoffset(c0);
};
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
SamplerState matTextureSampler : register(s0, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#endif
