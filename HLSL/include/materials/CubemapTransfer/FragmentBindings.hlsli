// Native resource and stage-interface layouts for CubemapTransfer / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_CURRENT_FACE fragmentConstants[0]
#define RD_UNIFORM_CURRENT_MIP fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_CURRENT_FACE fragmentVectorConstants1[0]
#define RD_UNIFORM_CURRENT_MIP fragmentVectorConstants1[1]
TextureCube<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[2] : packoffset(c0);
};
TextureCube<float4> srcTextureCubeTexture : register(t0, space0);
SamplerState srcTextureCubeSampler : register(s0, space0);
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
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#endif
