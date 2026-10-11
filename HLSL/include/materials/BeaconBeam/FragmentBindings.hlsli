// Native resource and stage-interface layouts for BeaconBeam / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[1] : packoffset(c0);
};
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> beaconTextureTexture : register(t0, space0);
SamplerState beaconTextureSampler : register(s0, space0);
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
