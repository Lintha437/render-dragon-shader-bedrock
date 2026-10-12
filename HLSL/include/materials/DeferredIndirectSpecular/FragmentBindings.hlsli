// Native resource and stage-interface layouts for DeferredIndirectSpecular / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[16]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[17]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[18]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[19]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[21]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[23]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[24]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[25]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[28]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[29]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[30]
#define RD_UNIFORM_SSR_PARAMETERS fragmentConstants[31]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[32]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[33]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[34]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[35]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[36]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[37]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[38] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2D<float4> ssrTextureTexture : register(t7, space0);
Texture2D<float4> sceneDepthTexture : register(t8, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t10, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t12, space0);
SamplerState brdfLutSampler : register(s0, space0);
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState ssrTextureSampler : register(s7, space0);
SamplerState sceneDepthSampler : register(s8, space0);
SamplerState scatteringBufferSampler : register(s10, space0);
SamplerState specularIblRecordsSampler : register(s12, space0);
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
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[16]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[17]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[18]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[19]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[21]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[23]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[24]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[25]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[28]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[29]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[30]
#define RD_UNIFORM_SSR_PARAMETERS fragmentVectorConstants1[31]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[32]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[33]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[34]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[35]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[36]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[37]
TextureCubeArray<float4> materialTexture12 : register(t12);
Texture2DArray<float4> materialTexture10 : register(t10);
Texture2D<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler12 : register(s12);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[38];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[16]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[17]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[18]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[19]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[21]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[23]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[24]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[25]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[28]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[29]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[30]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[31]
#define RD_UNIFORM_SSR_PARAMETERS fragmentConstants[32]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[33]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[34]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[35]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[36]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[37]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[38]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[39] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2D<float4> ssrTextureTexture : register(t7, space0);
Texture2D<float4> sceneDepthTexture : register(t8, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t10, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t12, space0);
SamplerState brdfLutSampler : register(s0, space0);
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState ssrTextureSampler : register(s7, space0);
SamplerState sceneDepthSampler : register(s8, space0);
SamplerState scatteringBufferSampler : register(s10, space0);
SamplerState specularIblRecordsSampler : register(s12, space0);
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
#elif RD_BINDING_LAYOUT == 4
Texture2D<float4> sceneDepthTexture : register(t8, space0);
Texture2D<float4> specularLightingTexture : register(t9, space0);
SamplerState sceneDepthSampler : register(s8, space0);
SamplerState specularLightingSampler : register(s9, space0);
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
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[16]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[17]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[18]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[19]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[21]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[23]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[24]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[25]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[26]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[28]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[29]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[30]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[31]
#define RD_UNIFORM_SSR_PARAMETERS fragmentVectorConstants1[32]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[33]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[34]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[35]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[36]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[37]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[38]
TextureCubeArray<float4> materialTexture12 : register(t12);
Texture2DArray<float4> materialTexture10 : register(t10);
Texture2D<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler12 : register(s12);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[39];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[0]
#define RD_UNIFORM_LIGHTING_UPSCALE_PARAMS fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[2] : packoffset(c0);
};
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> normalsAndDepthLightingTexture : register(t4, space0);
Texture2D<float4> sceneDepthTexture : register(t8, space0);
Texture2D<float4> specularLightingTexture : register(t9, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState normalsAndDepthLightingSampler : register(s4, space0);
SamplerState sceneDepthSampler : register(s8, space0);
SamplerState specularLightingSampler : register(s9, space0);
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
#elif RD_BINDING_LAYOUT == 7
Texture2D<float4> materialTexture9 : register(t9);
Texture2D<float4> materialTexture8 : register(t8);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[0]
#define RD_UNIFORM_LIGHTING_UPSCALE_PARAMS fragmentVectorConstants1[1]
Texture2D<float4> materialTexture9 : register(t9);
Texture2D<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 9
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
#endif
