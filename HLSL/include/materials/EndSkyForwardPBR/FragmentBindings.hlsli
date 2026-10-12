// Native resource and stage-interface layouts for EndSkyForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_SUN_DIR fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[9]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[10]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[12]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[13]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[14]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[15]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[16]
#define RD_UNIFORM_MOON_DIR fragmentConstants[17]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[18]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[19]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[21]
#define RD_UNIFORM_MINIMUM_SKY_LUMINANCE fragmentConstants[22]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[23]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[24]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[25]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[26]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[27]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[28]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[29]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[30]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[31]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[9]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[10]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[12]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[14]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[15]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[16]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[17]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[18]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[19]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[21]
#define RD_UNIFORM_MINIMUM_SKY_LUMINANCE fragmentVectorConstants1[22]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[23]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[24]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[25]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[26]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[27]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[28]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[29]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[30]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[31]
Texture2DArray<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[32] : packoffset(c0);
};
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t0, space0);
Texture2D<float4> skyTextureTexture : register(t1, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s0, space0);
SamplerState skyTextureSampler : register(s1, space0);
SamplerState scatteringBufferSampler : register(s3, space0);
static float3 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[32];
}
#define RD_COMPARISON_MASK -
#endif
