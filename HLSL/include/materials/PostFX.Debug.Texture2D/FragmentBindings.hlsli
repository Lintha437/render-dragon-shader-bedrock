// Native resource and stage-interface layouts for PostFX.Debug.Texture2D / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_CLIP_PLANES fragmentVectorConstants1[0]
#define RD_UNIFORM_DEBUG_MODE fragmentVectorConstants1[1]
#define RD_UNIFORM_MIP_LEVEL fragmentVectorConstants1[2]
static const float3 intermediateValue2[9] = { 0.0f.xxx, float3(0.0f, 0.0f, 1.0f), float3(0.0f, 1.0f, 1.0f), float3(0.0f, 1.0f, 0.0f), float3(1.0f, 1.0f, 0.0f), float3(1.0f, 0.0f, 0.0f), float3(1.0f, 0.0f, 1.0f), 1.0f.xxx, 0.0f.xxx };
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_CLIP_PLANES fragmentConstants[0]
#define RD_UNIFORM_DEBUG_MODE fragmentConstants[1]
#define RD_UNIFORM_MIP_LEVEL fragmentConstants[2]
static const float intermediateValue[8] = { 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f };
static const float intermediateValue1[8] = { 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f };
static const float intermediateValue2[8] = { 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f };
cbuffer fragmentUniformBuffer : register(b1, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentVectorConstants1[3] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[3] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> rasterColorTexture : register(t0, space0);
SamplerState rasterColorSampler : register(s0, space0);
#endif
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
