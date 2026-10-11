// Native resource and stage-interface layouts for StarsForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[4]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[5]
#define RD_UNIFORM_STARS_COLOR fragmentConstants[6]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[7]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[8]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[4]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[5]
#define RD_UNIFORM_STARS_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[7]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[8]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[9]
Texture3D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[4]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[5]
#define RD_UNIFORM_STARS_COLOR fragmentConstants[6]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentConstants[7]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[8]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[9]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[10]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[4]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[5]
#define RD_UNIFORM_STARS_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentVectorConstants1[7]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[8]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[9]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[10]
Texture3D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture2 : register(t2);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t0, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t2, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s0, space0);
SamplerState scatteringBufferSampler : register(s2, space0);
SamplerState skyAmbientSamplesSampler : register(s4, space0);
static float4 varyingColor0;
static float3 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float3 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[10];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[11] : packoffset(c0);
};
Texture2DArray<float4> scatteringBufferTexture : register(t2, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t4, space0);
SamplerState scatteringBufferSampler : register(s2, space0);
SamplerState skyAmbientSamplesSampler : register(s4, space0);
static float4 varyingColor0;
static float3 varyingColor1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float3 varyingColor1 : COLOR1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[11];
}
#define RD_COMPARISON_MASK -
#endif
