#define RD_NATIVE_CBUFFER_VECTORS RD_NATIVE_B1_VECTORS
#define RD_NATIVE_CBUFFER_VECTORS RD_NATIVE_B1_VECTORS
// Native resource and stage-interface layouts for GamefaceTexturesWithColorMix / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_UV_TRANSFORM_ROW_1 fragmentConstants[129]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentVectorConstants1[128]
#define RD_UNIFORM_UV_TRANSFORM_ROW_1 fragmentVectorConstants1[129]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[133] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentVectorConstants1[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> txBufferTexture : register(t0, space0);
Texture2D<float4> txBuffer1Texture : register(t1, space0);
SamplerState txBufferSampler : register(s0, space0);
SamplerState txBuffer1Sampler : register(s1, space0);
static float4 varyingTexCoord1;
static float4 varyingTexCoord0;
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
static float2 varyingTexCoord1;
#endif
static float4 varyingTexCoord4;
#if RD_BINDING_LAYOUT == 0
static float3 varyingTexCoord2;
static float4 varyingTexCoord3;
static float4 varyingTexCoord5;
#elif RD_BINDING_LAYOUT == 1
static float3 varyingTexCoord3;
#endif
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
#if RD_BINDING_LAYOUT == 0
    float4 varyingTexCoord0 : TEXCOORD0;
#endif
    float4 varyingTexCoord4 : TEXCOORD4;
#if RD_BINDING_LAYOUT == 0
    float3 varyingTexCoord2 : TEXCOORD2;
#endif
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
#if RD_BINDING_LAYOUT == 0
    float4 varyingTexCoord5 : TEXCOORD5;
#endif
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
