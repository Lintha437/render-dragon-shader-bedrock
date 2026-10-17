// Native resource and stage-interface layouts for Upscaling / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY fragmentConstants[0]
#define RD_UNIFORM_TAA_UPSCALING_PARAMETERS fragmentConstants[1]
#define RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON fragmentConstants[2]
#define RD_UNIFORM_DISPLAY_RESOLUTION fragmentConstants[3]
#define RD_UNIFORM_RECIP_DISPLAY_RESOLUTION fragmentConstants[4]
#define RD_UNIFORM_RENDER_RESOLUTION fragmentConstants[5]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_SUB_PIXEL_JITTER_AND_VALID_HISTORY fragmentVectorConstants1[0]
#define RD_UNIFORM_TAA_UPSCALING_PARAMETERS fragmentVectorConstants1[1]
#define RD_UNIFORM_RESOLUTION_RATIOS_AND_FP_EPSILON fragmentVectorConstants1[2]
#define RD_UNIFORM_DISPLAY_RESOLUTION fragmentVectorConstants1[3]
#define RD_UNIFORM_RECIP_DISPLAY_RESOLUTION fragmentVectorConstants1[4]
#define RD_UNIFORM_RENDER_RESOLUTION fragmentVectorConstants1[5]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[6] : packoffset(c0);
};
Texture2D<float4> inputBufferMotionVectorsTexture : register(t0, space0);
Texture2D<float4> inputFinalColorTexture : register(t1, space0);
Texture2D<float4> inputTaaHistoryTexture : register(t2, space0);
SamplerState inputTaaHistorySampler : register(s2, space0);
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
  float4 fragmentVectorConstants1[6];
}
#define RD_COMPARISON_MASK -
#endif
