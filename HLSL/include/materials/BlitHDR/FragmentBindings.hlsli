// Native resource and stage-interface layouts for BlitHDR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> averageLuminanceTexture : register(t0, space0);
Texture2D<float4> blitTextureTexture : register(t1, space0);
SamplerState averageLuminanceSampler : register(s0, space0);
SamplerState blitTextureSampler : register(s1, space0);
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
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
Texture2D<float4> blitTextureTexture : register(t1, space0);
SamplerState blitTextureSampler : register(s1, space0);
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
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
#define RD_COMPARISON_MASK -
#endif
