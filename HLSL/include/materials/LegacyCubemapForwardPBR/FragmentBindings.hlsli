// Native resource and stage-interface layouts for LegacyCubemapForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT fragmentConstants[8]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[9]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[10]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[12]
#define RD_UNIFORM_MOON_DIR fragmentConstants[13]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[14]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[15]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[16]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[17]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[18]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[19]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[21]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[22]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[23]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[24]
#define RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE fragmentConstants[25]
#define RD_UNIFORM_SKYBOX_PARAMETERS fragmentConstants[26]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[27]
#define RD_UNIFORM_SUN_DIR fragmentConstants[28]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[29]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[30]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[31]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT fragmentVectorConstants1[8]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[9]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[10]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[12]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[13]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[14]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[15]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[16]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[18]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[19]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[21]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[22]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[23]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[24]
#define RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE fragmentVectorConstants1[25]
#define RD_UNIFORM_SKYBOX_PARAMETERS fragmentVectorConstants1[26]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[27]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[28]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[29]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[30]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[31]
Texture3D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT fragmentConstants[8]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[9]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[10]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[12]
#define RD_UNIFORM_MOON_DIR fragmentConstants[13]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[14]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[15]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[16]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[17]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[18]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[19]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[21]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[22]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[23]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[24]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentConstants[25]
#define RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE fragmentConstants[26]
#define RD_UNIFORM_SKYBOX_PARAMETERS fragmentConstants[27]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[28]
#define RD_UNIFORM_SUN_DIR fragmentConstants[29]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[30]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[31]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[32]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CLOUD_RENDER_DISTANCE_AND_CLOUD_HEIGHT fragmentVectorConstants1[8]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[9]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[10]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[12]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[13]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[14]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[15]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[16]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[18]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[19]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[20]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[21]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[22]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[23]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[24]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentVectorConstants1[25]
#define RD_UNIFORM_SKYBOX_AMBIENT_ILLUMINANCE fragmentVectorConstants1[26]
#define RD_UNIFORM_SKYBOX_PARAMETERS fragmentVectorConstants1[27]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[28]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[29]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[30]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[31]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[32]
Texture3D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[32] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t1, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t3, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t5, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s1, space0);
SamplerState scatteringBufferSampler : register(s3, space0);
SamplerState skyAmbientSamplesSampler : register(s5, space0);
static float4 varyingTexCoord1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
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
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[33] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t0, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t3, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t5, space0);
SamplerState matTextureSampler : register(s0, space0);
SamplerState scatteringBufferSampler : register(s3, space0);
SamplerState skyAmbientSamplesSampler : register(s5, space0);
static float4 varyingTexCoord1;
static float4 varyingColor0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[33];
}
#define RD_COMPARISON_MASK -
#endif
