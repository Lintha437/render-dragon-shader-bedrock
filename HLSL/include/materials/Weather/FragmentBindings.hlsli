// Native resource and stage-interface layouts for Weather / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentVectorConstants1[0]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentConstants[0]
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
Texture2D<float4> lightingTextureTexture : register(t0, space0);
Texture2D<float4> occlusionTextureTexture : register(t1, space0);
Texture2D<float4> weatherTextureTexture : register(t2, space0);
SamplerState lightingTextureSampler : register(s0, space0);
SamplerState occlusionTextureSampler : register(s1, space0);
SamplerState weatherTextureSampler : register(s2, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
