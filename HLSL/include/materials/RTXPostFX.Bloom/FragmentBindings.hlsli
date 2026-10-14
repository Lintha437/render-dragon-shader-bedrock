// Native resource and stage-interface layouts for RTXPostFX.Bloom / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[0]
static const float intermediateValue[4] = { 0.16339969635009765625f, 0.0387139283120632171630859375f, 0.0387139283120632171630859375f, 0.009172405116260051727294921875f };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> rasterColorTexture : register(t0, space0);
SamplerState rasterColorSampler : register(s0, space0);
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
Texture2D<float4> rasterColorTexture : register(t0, space0);
SamplerState rasterColorSampler : register(s0, space0);
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
#elif RD_BINDING_LAYOUT == 3
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_G_BLOOM_MULTIPLIER fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> rasterColorTexture : register(t0, space0);
Texture2D<float4> gBloomOriginalInputTexture : register(t1, space0);
SamplerState rasterColorSampler : register(s0, space0);
SamplerState gBloomOriginalInputSampler : register(s1, space0);
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
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_G_BLOOM_MULTIPLIER fragmentVectorConstants1[0]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#endif
