// Native resource and stage-interface layouts for GamefaceRenoir / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_UV_TRANSFORM_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_UV_TRANSFORM_ROW_2 fragmentConstants[130]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_UV_TRANSFORM_ROW_0 fragmentVectorConstants1[128]
#define RD_UNIFORM_UV_TRANSFORM_ROW_1 fragmentVectorConstants1[129]
#define RD_UNIFORM_UV_TRANSFORM_ROW_2 fragmentVectorConstants1[130]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[133] : packoffset(c0);
};
Texture2D<float4> txBufferTexture : register(t0, space0);
Texture2D<float4> txBuffer1Texture : register(t1, space0);
Texture2D<float4> txBuffer2Texture : register(t2, space0);
SamplerState txBufferSampler : register(s0, space0);
SamplerState txBuffer1Sampler : register(s1, space0);
SamplerState txBuffer2Sampler : register(s2, space0);
static float4 varyingTexCoord1;
static float4 varyingTexCoord4;
static float3 varyingTexCoord2;
static float4 varyingTexCoord3;
static float4 varyingTexCoord5;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord2 : TEXCOORD2;
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
    float4 varyingTexCoord5 : TEXCOORD5;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[131];
}
#define RD_COMPARISON_MASK -
#endif
