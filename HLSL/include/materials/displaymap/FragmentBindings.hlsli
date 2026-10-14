// Native resource and stage-interface layouts for displaymap / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PAPER_WHITE fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PAPER_WHITE fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> texColorTexture : register(t0, space0);
SamplerState texColorSampler : register(s0, space0);
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
#endif
