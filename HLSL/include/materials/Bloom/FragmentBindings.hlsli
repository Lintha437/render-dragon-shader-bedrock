// Native resource and stage-interface layouts for Bloom / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_BLOOM_PARAMS fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[1]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_BLOOM_PARAMS fragmentConstants[0]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[0]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_BLOOM_PARAMS fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[1]
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 4
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> blurPyramidTextureTexture : register(t1, space0);
Texture2D<float4> hdRiTexture : register(t2, space0);
SamplerState blurPyramidTextureSampler : register(s1, space0);
SamplerState hdRiSampler : register(s2, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> blurPyramidTextureTexture : register(t1, space0);
SamplerState blurPyramidTextureSampler : register(s1, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> averageLuminanceTexture : register(t0, space0);
Texture2D<float4> blurPyramidTextureTexture : register(t1, space0);
SamplerState averageLuminanceSampler : register(s0, space0);
SamplerState blurPyramidTextureSampler : register(s1, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
