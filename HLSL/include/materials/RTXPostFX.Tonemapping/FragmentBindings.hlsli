// Native resource and stage-interface layouts for RTXPostFX.Tonemapping / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_G_TONE_MAPPING_DEBUG_MODE fragmentVectorConstants1[0]
#define RD_UNIFORM_G_TONE_MAPPING_SATURATION fragmentVectorConstants1[1]
#define RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST_END fragmentVectorConstants1[2]
#define RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST fragmentVectorConstants1[3]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[4]
#define RD_UNIFORM_G_BLOOM_MULTIPLIER fragmentVectorConstants1[5]
#define RD_UNIFORM_G_COLOR_GRADING_ENABLED fragmentVectorConstants1[6]
#define RD_UNIFORM_G_PERFORM_SRGB_CONVERSION fragmentVectorConstants1[7]
#define RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE fragmentVectorConstants1[8]
#define RD_UNIFORM_G_TONE_MAPPING_CONTRAST fragmentVectorConstants1[9]
#define RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION fragmentVectorConstants1[10]
#define RD_UNIFORM_G_TONE_MAPPING_GAMMA fragmentVectorConstants1[11]
#define RD_UNIFORM_G_TONE_MAPPING_INTENSITY fragmentVectorConstants1[12]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_G_TONE_MAPPING_DEBUG_MODE fragmentConstants[0]
#define RD_UNIFORM_G_TONE_MAPPING_SATURATION fragmentConstants[1]
#define RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST_END fragmentConstants[2]
#define RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST fragmentConstants[3]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[4]
#define RD_UNIFORM_G_BLOOM_MULTIPLIER fragmentConstants[5]
#define RD_UNIFORM_G_COLOR_GRADING_ENABLED fragmentConstants[6]
#define RD_UNIFORM_G_PERFORM_SRGB_CONVERSION fragmentConstants[7]
#define RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE fragmentConstants[8]
#define RD_UNIFORM_G_TONE_MAPPING_CONTRAST fragmentConstants[9]
#define RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION fragmentConstants[10]
#define RD_UNIFORM_G_TONE_MAPPING_GAMMA fragmentConstants[11]
#define RD_UNIFORM_G_TONE_MAPPING_INTENSITY fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentVectorConstants1[13] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[13] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture3 : register(t3);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler3 : register(s3);
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> rasterColorTexture : register(t0, space0);
Texture2D<float4> gBloomBufferTexture : register(t1, space0);
Texture2D<float4> gRasterizedInputTexture : register(t2, space0);
Texture2D<float4> gToneCurveTexture : register(t3, space0);
SamplerState rasterColorSampler : register(s0, space0);
SamplerState gBloomBufferSampler : register(s1, space0);
SamplerState gRasterizedInputSampler : register(s2, space0);
SamplerState gToneCurveSampler : register(s3, space0);
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
