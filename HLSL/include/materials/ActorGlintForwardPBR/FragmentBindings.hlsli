// Native resource and stage-interface layouts for ActorGlintForwardPBR / fragment.
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[145]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[146]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[147]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[148]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[149]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[151]
#define RD_UNIFORM_MOON_DIR fragmentConstants[152]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[153]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[154]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_SUN_DIR fragmentConstants[157]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[158]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[159]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[160]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[161]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[162]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[163]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[164]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[167]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[168]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[169]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[171]
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue221;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[172] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[77]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[131]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[143]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[144]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[145]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[146]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[147]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[148]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[149]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[150]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[151]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[152]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[153]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[155]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[156]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[157]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[158]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[159]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[160]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[161]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[162]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[163]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[164]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[165]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[166]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[167]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[168]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[169]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[170]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[171]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[172];
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[77]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[132]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[146]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[147]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[148]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[149]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[150]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[151]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[152]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[153]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[155]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[156]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[157]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[158]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[160]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[164]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[165]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[170]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[172]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[174]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[175]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[176]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[177]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[178]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[179]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[180]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[181]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[182]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[183]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[184]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[185]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[186]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[187]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[188]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[189]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[190];
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[145]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[146]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[147]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[148]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[149]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[151]
#define RD_UNIFORM_MOON_DIR fragmentConstants[152]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[153]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[154]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_SUN_DIR fragmentConstants[157]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[158]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[159]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[160]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[161]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[162]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[163]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[164]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[167]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[168]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[169]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[171]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[172] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[147]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[148]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[149]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[150]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[151]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[152]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[153]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[154]
#define RD_UNIFORM_MOON_DIR fragmentConstants[155]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[156]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[157]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[158]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[170]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[172]
#define RD_UNIFORM_SUN_DIR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[174]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[177]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[178]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[179]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[180]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[181]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[184]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[185]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[186]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[187]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[189]
static uint intermediateValue66;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue270;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[190] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[147]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[148]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[149]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[150]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[151]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[152]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[153]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[154]
#define RD_UNIFORM_MOON_DIR fragmentConstants[155]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[156]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[157]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[158]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[170]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[172]
#define RD_UNIFORM_SUN_DIR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[174]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[177]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[178]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[179]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[180]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[181]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[184]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[185]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[186]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[187]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[189]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[190] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[132]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[147]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[149]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[151]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[152]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[153]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[154]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[155]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[156]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[157]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[158]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[159]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[160]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[161]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[162]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[163]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[164]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[165]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[166]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[167]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[168]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[169]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[170]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[171]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[172]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[173];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[133]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[149]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[152]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[154]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[155]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[156]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[157]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[165]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[171]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[173]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[175]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[176]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[177]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[178]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[179]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[180]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[181]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[182]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[183]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[184]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[185]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[186]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[187]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[188]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[189]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[190]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[191];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[154]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[155]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[156]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[157]
#define RD_UNIFORM_SUN_DIR fragmentConstants[158]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[159]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[161]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[162]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[163]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[164]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[167]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[168]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[169]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[172]
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue221;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[173] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
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
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[157]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[158]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[173]
#define RD_UNIFORM_SUN_DIR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[175]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[176]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[177]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[178]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[179]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[180]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[181]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[184]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[185]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[186]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[187]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[190]
static uint intermediateValue66;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue270;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[191] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[154]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[155]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[156]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[157]
#define RD_UNIFORM_SUN_DIR fragmentConstants[158]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[159]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[161]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[162]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[163]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[164]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[167]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[168]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[169]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[172]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[173] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[157]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[158]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[173]
#define RD_UNIFORM_SUN_DIR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[175]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[176]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[177]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[178]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[179]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[180]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[181]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[184]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[185]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[186]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[187]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[190]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[191] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 12
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[132]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[147]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[149]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[151]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[152]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[153]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[155]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[157]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[158]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[159]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[160]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[161]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[162]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[163]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[164]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[165]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[166]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[167]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[168]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[169]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[170]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[171]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[172]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[173]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[174];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 13
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[133]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[149]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[152]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[154]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[155]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[156]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[157]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[161]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[172]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[174]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[175]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[176]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[177]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[178]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[179]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[180]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[181]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[182]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[183]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[184]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[185]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[186]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[187]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[188]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[189]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[190]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[191]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[192];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 14
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[155]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[156]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[157]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[158]
#define RD_UNIFORM_SUN_DIR fragmentConstants[159]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[162]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[163]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[164]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[165]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[167]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[169]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[170]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[172]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[173]
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[174] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 15
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[174]
#define RD_UNIFORM_SUN_DIR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[176]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[179]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[180]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[181]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[182]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[184]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[186]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[187]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[188]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[190]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[191]
static uint intermediateValue67;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[192] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 16
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[155]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[156]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[157]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[158]
#define RD_UNIFORM_SUN_DIR fragmentConstants[159]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[162]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[163]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[164]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[165]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[167]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[169]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[170]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[172]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[173]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[174] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 17
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[174]
#define RD_UNIFORM_SUN_DIR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[176]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[179]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[180]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[181]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[182]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[184]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[186]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[187]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[188]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[190]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[191]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[192] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 18
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 19
#define RD_UNIFORM_MAT_COLOR fragmentConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t2, space0);
SamplerState matTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 20
#define RD_UNIFORM_MAT_COLOR fragmentConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 21
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 22
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t2, space0);
SamplerState matTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 23
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 24
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 25
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 26
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 27
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 28
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[144]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[148]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[149]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[151]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[152]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[153]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[154]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[155]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[156]
#define RD_UNIFORM_MOON_DIR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_SUN_DIR fragmentConstants[162]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[163]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[164]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[165]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[167]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[168]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[169]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[170]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[171]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[172]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[173]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[174]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[175]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[176]
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[177] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 29
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[77]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[131]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[143]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[144]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[145]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[148]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[149]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[150]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[151]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[152]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[153]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[155]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[157]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[160]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[161]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[162]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[163]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[164]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[165]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[166]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[167]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[168]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[169]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[170]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[171]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[172]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[173]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[174]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[175]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[176]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[177];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 30
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[144]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[148]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[149]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[151]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[152]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[153]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[154]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[155]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[156]
#define RD_UNIFORM_MOON_DIR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_SUN_DIR fragmentConstants[162]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[163]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[164]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[165]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[167]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[168]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[169]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[170]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[171]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[172]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[173]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[174]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[175]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[176]
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[177] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 31
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[77]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[132]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[153]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[155]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[156]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[157]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[158]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[160]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[163]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[164]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[175]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[176]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[177]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[179]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[180]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[181]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[182]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[183]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[184]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[185]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[186]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[187]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[188]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[189]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[190]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[191]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[192]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[193]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[194]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[195];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 32
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[156]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[157]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[158]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[159]
#define RD_UNIFORM_MOON_DIR fragmentConstants[160]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[177]
#define RD_UNIFORM_SUN_DIR fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[179]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[180]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[181]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[182]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[184]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[185]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[186]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[187]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[188]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[189]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[190]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[191]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[192]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[193]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[194]
static uint intermediateValue67;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[195] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 33
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[157]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[158]
#define RD_UNIFORM_MOON_DIR fragmentConstants[159]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[160]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[161]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[162]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_SUN_DIR fragmentConstants[164]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[165]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[166]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[167]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[169]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[170]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[171]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[173]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[176]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[178]
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[179] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 34
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[134]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[155]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[158]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[160]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[162]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[164]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[165]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[177]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[179]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[181]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[182]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[183]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[184]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[185]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[186]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[187]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[188]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[189]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[190]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[194]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[195]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[196]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[197];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 35
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[156]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[157]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[158]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[159]
#define RD_UNIFORM_MOON_DIR fragmentConstants[160]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[177]
#define RD_UNIFORM_SUN_DIR fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[179]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[180]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[181]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[182]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[184]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[185]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[186]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[187]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[188]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[189]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[190]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[191]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[192]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[193]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[194]
static uint intermediateValue71;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue286;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[195] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 36
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[133]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[153]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[155]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[157]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[159]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[160]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[162]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[163]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[164]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[165]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[166]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[167]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[168]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[169]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[170]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[171]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[172]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[173]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[176]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[177]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[178]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[179];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 37
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[134]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[155]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[158]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[164]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[179]
#define RD_UNIFORM_SUN_DIR fragmentConstants[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[181]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[182]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[183]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[184]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[186]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[187]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[188]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[190]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[194]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[196]
static uint intermediateValue67;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[197] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 38
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[157]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[158]
#define RD_UNIFORM_MOON_DIR fragmentConstants[159]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[160]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[161]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[162]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_SUN_DIR fragmentConstants[164]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[165]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[166]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[167]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[169]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[170]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[171]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[173]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[176]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[178]
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[179] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 39
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[134]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[155]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[158]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[164]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[179]
#define RD_UNIFORM_SUN_DIR fragmentConstants[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[181]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[182]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[183]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[184]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[186]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[187]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[188]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[190]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[194]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[196]
static uint intermediateValue71;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue286;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[197] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 40
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[133]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[153]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[155]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[157]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[159]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[160]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[163]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[164]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[165]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[166]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[167]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[168]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[173]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[174]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[179]
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[180];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 41
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[157]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[158]
#define RD_UNIFORM_MOON_DIR fragmentConstants[159]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[160]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[163]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[164]
#define RD_UNIFORM_SUN_DIR fragmentConstants[165]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[166]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[167]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[168]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[173]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[174]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[179]
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[180] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 42
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[134]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[155]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[158]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[163]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[165]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[178]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[179]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[180]
#define RD_UNIFORM_SUN_DIR fragmentConstants[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[182]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[183]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[184]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[185]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[190]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[191]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[197]
static uint intermediateValue68;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[198] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 43
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[146]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[150]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[152]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[153]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[155]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[156]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[157]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[158]
#define RD_UNIFORM_MOON_DIR fragmentConstants[159]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[160]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[161]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[162]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[163]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[164]
#define RD_UNIFORM_SUN_DIR fragmentConstants[165]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[166]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[167]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[168]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[173]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[174]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[179]
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[180] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 44
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[78]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[134]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[155]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[158]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[160]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[163]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[165]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[178]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[179]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[180]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[182]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[183]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[184]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[185]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[190]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[191]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[197]
struct t14_t {
  float val[32];
};
StructuredBuffer<t14_t> sampledResource14 : register(t14);
struct t13_t {
  float val[1];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[198];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 45
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[82]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[83]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[84]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[85]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[86]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[87]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[89]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[90]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[91]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[93]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[128]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[129]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[134]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[136]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[137]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[138]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[142]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[146]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[147]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[148]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[149]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[152]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[155]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[156]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[157]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[158]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[159]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[163]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[165]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[178]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[179]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[180]
#define RD_UNIFORM_SUN_DIR fragmentConstants[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[182]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[183]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[184]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[185]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[190]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[191]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[197]
static uint intermediateValue71;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue286;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[198] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 46
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[145]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[146]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[147]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[148]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[149]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[151]
#define RD_UNIFORM_MOON_DIR fragmentConstants[152]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[153]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[154]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_SUN_DIR fragmentConstants[157]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[158]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[159]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[160]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[161]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[162]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[163]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[164]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[167]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[168]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[169]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[171]
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue221;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[172] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 47
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[147]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[148]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[149]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[150]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[151]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[152]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[153]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[154]
#define RD_UNIFORM_MOON_DIR fragmentConstants[155]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[156]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[157]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[158]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[170]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[172]
#define RD_UNIFORM_SUN_DIR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[174]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[177]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[178]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[179]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[180]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[181]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[184]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[185]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[186]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[187]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[189]
static uint intermediateValue66;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue270;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[190] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 48
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[89]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[90]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[123]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[126]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[127]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[133]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[134]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[135]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[141]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[143]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[145]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[146]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[147]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[148]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[149]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[150]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[151]
#define RD_UNIFORM_MOON_DIR fragmentConstants[152]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[153]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[154]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_SUN_DIR fragmentConstants[157]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[158]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[159]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[160]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[161]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[162]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[163]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[164]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[166]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[167]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[168]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[169]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[171]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[172] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 49
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[57]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[58]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[59]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[73]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[75]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[76]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[77]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[78]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[79]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[80]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[81]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[82]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[83]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[84]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[85]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[86]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[88]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[136]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[143]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[145]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[147]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[148]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[149]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[150]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[151]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[152]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[153]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[154]
#define RD_UNIFORM_MOON_DIR fragmentConstants[155]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[156]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[157]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[158]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[170]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[172]
#define RD_UNIFORM_SUN_DIR fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[174]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[175]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[176]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[177]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[178]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[179]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[180]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[181]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[183]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[184]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[185]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[186]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[187]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[189]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[190] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 50
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[154]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[155]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[156]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[157]
#define RD_UNIFORM_SUN_DIR fragmentConstants[158]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[159]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[161]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[162]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[163]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[164]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[167]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[168]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[169]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[172]
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue221;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[173] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 51
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[154]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[155]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[156]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[157]
#define RD_UNIFORM_SUN_DIR fragmentConstants[158]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[159]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[161]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[162]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[163]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[164]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[165]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[167]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[168]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[169]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[170]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[172]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[173] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 52
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[157]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[158]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[173]
#define RD_UNIFORM_SUN_DIR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[175]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[176]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[177]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[178]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[179]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[180]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[181]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[184]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[185]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[186]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[187]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[190]
static uint intermediateValue66;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue270;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[191] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 53
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[157]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[158]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[159]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[171]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[173]
#define RD_UNIFORM_SUN_DIR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[175]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[176]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[177]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[178]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[179]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[180]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[181]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[182]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[184]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[185]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[186]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[187]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[188]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[190]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[191] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 54
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[155]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[156]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[157]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[158]
#define RD_UNIFORM_SUN_DIR fragmentConstants[159]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[162]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[163]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[164]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[165]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[167]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[169]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[170]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[172]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[173]
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue222;
static float intermediateValue223;
static float intermediateValue224;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[174] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 55
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[174]
#define RD_UNIFORM_SUN_DIR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[176]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[179]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[180]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[181]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[182]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[184]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[186]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[187]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[188]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[190]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[191]
static uint intermediateValue67;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue271;
static float intermediateValue272;
static float intermediateValue273;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[192] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 56
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[91]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[124]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[127]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[128]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[132]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[133]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[134]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[135]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[136]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[137]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[140]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[142]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[144]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[145]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[146]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[147]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[148]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[149]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[150]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[151]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[152]
#define RD_UNIFORM_MOON_DIR fragmentConstants[153]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[154]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[155]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[156]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[157]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[158]
#define RD_UNIFORM_SUN_DIR fragmentConstants[159]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[160]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[161]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[162]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[163]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[164]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[165]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[166]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[167]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[168]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[169]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[170]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[171]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[172]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[173]
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue225;
static float intermediateValue226;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[174] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 57
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
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
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[61]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[74]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[75]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[77]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[78]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[79]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[80]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[81]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[82]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[83]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[84]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[85]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[87]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[88]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[89]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[90]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[92]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[125]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[128]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[129]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[130]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[131]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[132]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[133]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[134]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[135]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[137]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[138]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[139]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[140]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[141]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[142]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[143]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[144]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[145]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[146]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[147]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[148]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[149]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[150]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[151]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[152]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[153]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[154]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[155]
#define RD_UNIFORM_MOON_DIR fragmentConstants[156]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[157]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[158]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[159]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[160]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[161]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[162]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[163]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[164]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[165]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[166]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[172]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[174]
#define RD_UNIFORM_SUN_DIR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[176]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[177]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[178]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[179]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[180]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[181]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[182]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[183]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[184]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[185]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[186]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[187]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[188]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[189]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[190]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[191]
static uint intermediateValue70;
static float intermediateValue280;
static float intermediateValue281;
static float intermediateValue282;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue274;
static float intermediateValue275;
static float intermediateValue276;
static float intermediateValue277;
static float intermediateValue278;
static float intermediateValue279;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[192] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> mersTextureTexture : register(t1, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2DArray<float4> causticsTextureTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t11, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t11, space0);
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
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t13, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t14, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState mersTextureSampler : register(s1, space0);
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingTexCoord2 : TEXCOORD2;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
#ifndef rdAccess_zLightLookupArray
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#endif
#ifndef rdAccess_zLights
#define rdAccess_zLights(index) zLights[index]
#endif
