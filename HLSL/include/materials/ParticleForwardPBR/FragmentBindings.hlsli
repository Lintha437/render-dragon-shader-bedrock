// Native resource and stage-interface layouts for ParticleForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> materialTexture3 : register(t3);
SamplerState textureSampler3 : register(s3);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> particleTextureTexture : register(t3, space0);
SamplerState particleTextureSampler : register(s3, space0);
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[49]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[78]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[79]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[80]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[81]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[82]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[83]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[85]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[86]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_MOON_DIR fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_MERS_UNIFORMS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[147]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[148]
#define RD_UNIFORM_SUN_DIR fragmentConstants[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[154]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[155]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[156]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[161]
static float intermediateValue209;
static float intermediateValue210;
static float intermediateValue211;
static float intermediateValue212;
static float intermediateValue213;
static float intermediateValue214;
static float intermediateValue203;
static float intermediateValue204;
static float intermediateValue205;
static float intermediateValue206;
static float intermediateValue207;
static float intermediateValue208;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[162] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> normalTextureTexture : register(t2, space0);
Texture2D<float4> particleTextureTexture : register(t3, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t5, space0);
Texture2DArray<float4> causticsTextureTexture : register(t6, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t7, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t8, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t9, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t10, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t10, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t12, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t12, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState normalTextureSampler : register(s2, space0);
SamplerState particleTextureSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[78]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[79]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[80]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[81]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[82]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[83]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[85]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[89]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[91]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_MERS_UNIFORMS fragmentVectorConstants1[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[135]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[144]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[146]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[147]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[148]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[154]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[155]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[156]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[161]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t10_t {
  float val[4];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
TextureCubeArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[162];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
Texture2D<float4> particleTextureTexture : register(t3, space0);
SamplerState particleTextureSampler : register(s3, space0);
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
