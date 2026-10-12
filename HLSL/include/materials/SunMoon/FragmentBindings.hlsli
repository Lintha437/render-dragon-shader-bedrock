// Native resource and stage-interface layouts for SunMoon / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#define RD_UNIFORM_SUN_MOON_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> sunMoonTextureTexture : register(t0, space0);
SamplerState sunMoonTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
