// Native resource and stage-interface layouts for ColorPostProcessing / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_COLOR_GRADING_MISC fragmentConstants[0]
#define RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK fragmentConstants[1]
#define RD_UNIFORM_EXPOSURE_COMPENSATION fragmentConstants[2]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS fragmentConstants[3]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS fragmentConstants[4]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS fragmentConstants[5]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS fragmentConstants[6]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES fragmentConstants[7]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS fragmentConstants[8]
#define RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS fragmentConstants[9]
#define RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES fragmentConstants[10]
#define RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS fragmentConstants[11]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS fragmentConstants[12]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES fragmentConstants[13]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS fragmentConstants[14]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES fragmentConstants[15]
#define RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS fragmentConstants[16]
#define RD_UNIFORM_COLOR_GRADING_MISC2 fragmentConstants[17]
#define RD_UNIFORM_TONEMAP_PARAMS0 fragmentConstants[18]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES fragmentConstants[19]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS fragmentConstants[20]
#define RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS fragmentConstants[21]
#define RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT fragmentConstants[22]
#define RD_UNIFORM_RASTERIZED_COLOR_ENABLED fragmentConstants[23]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_COLOR_GRADING_MISC fragmentVectorConstants1[0]
#define RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK fragmentVectorConstants1[1]
#define RD_UNIFORM_EXPOSURE_COMPENSATION fragmentVectorConstants1[2]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS fragmentVectorConstants1[3]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS fragmentVectorConstants1[4]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS fragmentVectorConstants1[5]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS fragmentVectorConstants1[6]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES fragmentVectorConstants1[7]
#define RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS fragmentVectorConstants1[8]
#define RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS fragmentVectorConstants1[9]
#define RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES fragmentVectorConstants1[10]
#define RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS fragmentVectorConstants1[11]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS fragmentVectorConstants1[12]
#define RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES fragmentVectorConstants1[13]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS fragmentVectorConstants1[14]
#define RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES fragmentVectorConstants1[15]
#define RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS fragmentVectorConstants1[16]
#define RD_UNIFORM_COLOR_GRADING_MISC2 fragmentVectorConstants1[17]
#define RD_UNIFORM_TONEMAP_PARAMS0 fragmentVectorConstants1[18]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES fragmentVectorConstants1[19]
#define RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS fragmentVectorConstants1[20]
#define RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS fragmentVectorConstants1[21]
#define RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT fragmentVectorConstants1[22]
#define RD_UNIFORM_RASTERIZED_COLOR_ENABLED fragmentVectorConstants1[23]
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[24] : packoffset(c0);
};
Texture2D<float4> averageLuminanceTexture : register(t0, space0);
Texture2D<float4> colorTextureTexture : register(t1, space0);
Texture2D<float4> customExposureCompensationTexture : register(t2, space0);
Texture2D<float4> preExposureLuminanceTexture : register(t3, space0);
Texture2D<float4> rasterizedColorTexture : register(t5, space0);
SamplerState averageLuminanceSampler : register(s0, space0);
SamplerState colorTextureSampler : register(s1, space0);
SamplerState customExposureCompensationSampler : register(s2, space0);
SamplerState preExposureLuminanceSampler : register(s3, space0);
SamplerState rasterizedColorSampler : register(s5, space0);
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
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[24];
}
#define RD_COMPARISON_MASK -
#endif
