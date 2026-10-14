// Native resource and stage-interface layouts for DeferredMixedResolutionCaustics / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[8]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[9]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[8]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[9]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[10]
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[11] : packoffset(c0);
};
Texture2D<float4> normalTexture : register(t2, space0);
Texture2D<float4> sceneDepthTexture : register(t5, space0);
Texture2DArray<float4> causticsTextureTexture : register(t6, space0);
SamplerState normalSampler : register(s2, space0);
SamplerState sceneDepthSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#endif
