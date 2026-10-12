// Native resource and stage-interface layouts for CloudsForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[16]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[17]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[18]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[19]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[20]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[21]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[22]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[23]
#define RD_UNIFORM_CLOUD_LIGHTING_TOGGLES fragmentVectorConstants1[24]
#define RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS fragmentVectorConstants1[25]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[27]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[28]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[30]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[31]
#define RD_UNIFORM_DISTANCE_CONTROL fragmentVectorConstants1[32]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[33]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[34]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[35]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[36]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[37]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[38]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[39]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[40]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[41]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[42]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[43]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[44] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
Texture2DArray<float4> materialTexture3 : register(t3);
Texture3D<float4> materialTexture5 : register(t5);
TextureCubeArray<float4> materialTexture6 : register(t6);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler6 : register(s6);
static int varyingTexCoord4;
static float4 varyingColor0;
static float3 varyingNormal0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[16]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[17]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[18]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[19]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[20]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[21]
#define RD_UNIFORM_MOON_DIR fragmentConstants[22]
#define RD_UNIFORM_CLOUD_LIGHTING_TOGGLES fragmentConstants[23]
#define RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS fragmentConstants[24]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[25]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[29]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[30]
#define RD_UNIFORM_DISTANCE_CONTROL fragmentConstants[31]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[32]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[33]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[34]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[35]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[36]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[37]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[38]
#define RD_UNIFORM_SUN_DIR fragmentConstants[39]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[40]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[41]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[42]
static float intermediateValue12;
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[43] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t1, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t3, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t5, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t6, space0);
SamplerState brdfLutSampler : register(s0, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s1, space0);
SamplerState scatteringBufferSampler : register(s3, space0);
SamplerState skyAmbientSamplesSampler : register(s5, space0);
SamplerState specularIblRecordsSampler : register(s6, space0);
static int varyingTexCoord4;
static float4 varyingColor0;
static float4 varyingFragmentPosition0;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float4 varyingFragmentPosition0 : FRAGPOSITION0;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
static int varyingTexCoord4;
static float4 varyingColor0;
static float4 varyingFragmentPosition0;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float4 varyingFragmentPosition0 : FRAGPOSITION0;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[16]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[17]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[18]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[19]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[20]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[21]
#define RD_UNIFORM_MOON_DIR fragmentConstants[22]
#define RD_UNIFORM_CLOUD_LIGHTING_TOGGLES fragmentConstants[23]
#define RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS fragmentConstants[24]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[25]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[29]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[30]
#define RD_UNIFORM_DISTANCE_CONTROL fragmentConstants[31]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[32]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[33]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[34]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[35]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentConstants[36]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[37]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[38]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[39]
#define RD_UNIFORM_SUN_DIR fragmentConstants[40]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[41]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[42]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[43]
static float intermediateValue12;
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[44] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t3, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t5, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t6, space0);
SamplerState brdfLutSampler : register(s0, space0);
SamplerState scatteringBufferSampler : register(s3, space0);
SamplerState skyAmbientSamplesSampler : register(s5, space0);
SamplerState specularIblRecordsSampler : register(s6, space0);
static int varyingTexCoord4;
static float4 varyingColor0;
static float4 varyingFragmentPosition0;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float4 varyingFragmentPosition0 : FRAGPOSITION0;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[16]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[17]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[18]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[19]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[20]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[21]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[22]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[23]
#define RD_UNIFORM_CLOUD_LIGHTING_TOGGLES fragmentVectorConstants1[24]
#define RD_UNIFORM_CLOUD_LIGHTING_UNIFORMS fragmentVectorConstants1[25]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[27]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[28]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[30]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[31]
#define RD_UNIFORM_DISTANCE_CONTROL fragmentVectorConstants1[32]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[33]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[34]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[35]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[36]
#define RD_UNIFORM_SKY_PROBE_UV_FADE_PARAMETERS fragmentVectorConstants1[37]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[38]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[39]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[40]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[41]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[42]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[43]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[44]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[45] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2DArray<float4> materialTexture3 : register(t3);
Texture3D<float4> materialTexture5 : register(t5);
TextureCubeArray<float4> materialTexture6 : register(t6);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler6 : register(s6);
static int varyingTexCoord4;
static float4 varyingColor0;
static float3 varyingNormal0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[8]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[9];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[8]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[9] : packoffset(c0);
};
static int varyingTexCoord4;
static float4 varyingColor0;
static float4 varyingFragmentPosition0;
static float3 varyingNormal0;
static float3 varyingTexCoord6;
static float2 varyingTexCoord0;
static float2 varyingTexCoord5;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float4 varyingColor0 : COLOR0;
    float4 varyingFragmentPosition0 : FRAGPOSITION0;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord6 : TEXCOORD6;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
