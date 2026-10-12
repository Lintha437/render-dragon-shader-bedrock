// Native resource and stage-interface layouts for GamefaceStencil / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentConstants[128]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentVectorConstants1[128]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[133] : packoffset(c0);
};
Texture2D<float4> txBufferTexture : register(t0, space0);
SamplerState txBufferSampler : register(s0, space0);
static float4 varyingTexCoord1;
static float4 varyingTexCoord0;
static float4 varyingTexCoord4;
static float3 varyingTexCoord2;
static float4 varyingTexCoord3;
static float4 varyingTexCoord5;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
    float4 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord2 : TEXCOORD2;
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
    float4 varyingTexCoord5 : TEXCOORD5;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[129];
}
#define RD_COMPARISON_MASK -
#endif
