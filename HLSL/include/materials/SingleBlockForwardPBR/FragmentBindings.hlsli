// Native resource and stage-interface layouts for SingleBlockForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[60]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[64]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[65]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[66]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[67]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[69]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[70]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[71]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[72]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[73]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[75]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[76]
#define RD_UNIFORM_MOON_DIR fragmentConstants[77]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[78]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[111]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[114]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[118]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[119]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[120]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[121]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[122]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[127]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_SUN_DIR fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[143]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
static float intermediateValue246;
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[147] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
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
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[60]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[64]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentVectorConstants1[65]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[66]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[67]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[69]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[70]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[71]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[72]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[73]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[75]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[76]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[77]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[78]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[111]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[112]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[113]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[114]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[118]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[119]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[120]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[121]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[122]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[127]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[140]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[141]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[143]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[146]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[16];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[4];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
TextureCubeArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[147];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[60]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[64]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[65]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[66]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[68]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[69]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[70]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[71]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[72]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[73]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[74]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[76]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[77]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[110]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[111]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[112]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[113]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[118]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[128]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[129]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[130]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[131]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[132]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[133]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[139]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[140]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[141]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[142]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[145]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[16];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[4];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
TextureCubeArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[146];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[60]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[64]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[65]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[66]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[68]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[69]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[70]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[71]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[72]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[73]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[74]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_MOON_DIR fragmentConstants[76]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[77]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[110]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[111]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[113]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[118]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[128]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[129]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[130]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[132]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[139]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[140]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[141]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[145]
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue246;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[146] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
Texture2D<float4> seasonsTextureTexture : register(t5, space0);
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
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState seasonsTextureSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
Texture2D<float4> matTextureTexture : register(t2, space0);
SamplerState matTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 6
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[60]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[64]
#define RD_UNIFORM_ALPHA_MASKED_TINT fragmentConstants[65]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[66]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[67]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[69]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[70]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[71]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[72]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[73]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[75]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[76]
#define RD_UNIFORM_MOON_DIR fragmentConstants[77]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[78]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[111]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[114]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[118]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[119]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[120]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[121]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[122]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[127]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_SUN_DIR fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[143]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
static float intermediateValue246;
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[147] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
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
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[60]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[61]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[62]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[63]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[64]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[65]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[66]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[68]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[69]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[70]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[71]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[72]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[73]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[74]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_MOON_DIR fragmentConstants[76]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[77]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[110]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[111]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[113]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[118]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[128]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[129]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[130]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[132]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[139]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[140]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[141]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[145]
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue246;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[146] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
Texture2D<float4> seasonsTextureTexture : register(t5, space0);
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
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_pbrData { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_pbrData> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_pbrData(uint wordIndex) { return uint4(rdAccess_pbrData(wordIndex), rdAccess_pbrData(wordIndex + 1u), rdAccess_pbrData(wordIndex + 2u), rdAccess_pbrData(wordIndex + 3u)); }
#else
Buffer<uint4> pbrData : register(t11, space0);
#define rdAccess_pbrData(index) pbrData[index]
#define rdLoad_pbrData(index) pbrData.Load(index)
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState seasonsTextureSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    bool varyingSv_Isfrontface0 : SV_IsFrontFace;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 10
static float3 varyingBitangent0;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
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
#ifndef rdAccess_pbrData
#define rdAccess_pbrData(index) pbrData[index]
#endif
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
