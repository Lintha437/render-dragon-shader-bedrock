// Native resource and stage-interface layouts for Blit / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> blitTextureTexture : register(t0, space0);
SamplerState blitTextureSampler : register(s0, space0);
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
