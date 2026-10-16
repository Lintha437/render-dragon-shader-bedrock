// Native resource and stage-interface layouts for ItemInHandForwardPBRGlint / fragment.
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
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[43]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[44]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[45]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[47]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[48]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[49]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[50]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[51]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[53]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[54]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[55]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[57]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[91]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[92]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[93]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[94]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[98]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[100]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[101]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[102]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[111]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[112]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[113]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[116]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[117]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[119]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[120]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[121]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[124]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[125]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[126]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[128]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[129]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[131]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[132]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[134]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[135]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[136]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[137]
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[138];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[43]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[44]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[45]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[46]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[47]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[48]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[49]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[50]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[51]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[53]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[54]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[55]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[57]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[91]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[93]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[94]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[98]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[100]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[101]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[102]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[111]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[112]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[116]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[117]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[120]
#define RD_UNIFORM_MOON_DIR fragmentConstants[121]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[123]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_SUN_DIR fragmentConstants[125]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[126]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[128]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[129]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[132]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[133]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[134]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[135]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[137]
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue181;
static float intermediateValue182;
static float intermediateValue183;
static float intermediateValue184;
static float intermediateValue185;
static float intermediateValue186;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[138] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[43]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[44]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[45]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[47]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[48]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[49]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[50]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[51]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[53]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[54]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[55]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[57]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[90]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[91]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[92]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[93]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[94]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[98]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[100]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[101]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[102]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[111]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[112]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[113]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[116]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[117]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[119]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[120]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[121]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[122]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[123]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[124]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[125]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[126]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[127]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[128]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[129]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[130]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[131]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[132]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[134]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[135]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[138]
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[139];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[43]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[44]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[45]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[46]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[54]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[56]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[57]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[59]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[92]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[93]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[94]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[95]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[100]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[101]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[102]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[105]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[114]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[115]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[116]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[120]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[121]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[122]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[124]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[126]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[127]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[128]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[131]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[134]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[135]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[136]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[137]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[138]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[139]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[140]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[141]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[142]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[143]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[144]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[145]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[146]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[147]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[148]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[149]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[150]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[151]
struct t11_t {
  float val[32];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[1];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
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
  float4 fragmentVectorConstants1[152];
}
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
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[43]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[44]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[45]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[46]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[56]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[57]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[59]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[95]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[100]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[102]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[116]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[122]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[123]
#define RD_UNIFORM_MOON_DIR fragmentConstants[124]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[134]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[136]
#define RD_UNIFORM_SUN_DIR fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[138]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[139]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[140]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[141]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[142]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[143]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[144]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[145]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[146]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[147]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[148]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[149]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[151]
static uint intermediateValue39;
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
    float4 fragmentConstants[152] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[43]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[44]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[45]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[46]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[47]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[48]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[49]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[50]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[51]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[53]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[54]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[55]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[57]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[90]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[91]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[93]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[94]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[98]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[100]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[101]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[102]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[111]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[112]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[116]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[117]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[120]
#define RD_UNIFORM_MOON_DIR fragmentConstants[121]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[122]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[123]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[124]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[125]
#define RD_UNIFORM_SUN_DIR fragmentConstants[126]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[127]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[128]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[129]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[130]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[131]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[132]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[133]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[134]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[135]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[138]
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue182;
static float intermediateValue183;
static float intermediateValue184;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[139] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[43]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[44]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[45]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[46]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[54]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[56]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[57]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[59]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[92]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[93]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[94]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[95]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[100]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[101]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[102]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[105]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[114]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[115]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[116]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[120]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[121]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[122]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[124]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[125]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[126]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[127]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[128]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[130]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[131]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[136]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[137]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[139]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[140]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[141]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[142]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[143]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[144]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[145]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[146]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[147]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[148]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[149]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[152]
struct t11_t {
  float val[32];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[1];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
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
  float4 fragmentVectorConstants1[153];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[12]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[13] : packoffset(c0);
};
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[28]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[29]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[42]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[43]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[44]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[45]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[46]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[56]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[57]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[59]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[92]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[95]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[100]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[102]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[116]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[122]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[123]
#define RD_UNIFORM_MOON_DIR fragmentConstants[124]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[125]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[126]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[137]
#define RD_UNIFORM_SUN_DIR fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[139]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[140]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[141]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[142]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[143]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[144]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[145]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[146]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[147]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[148]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[149]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[152]
static uint intermediateValue40;
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
    float4 fragmentConstants[153] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[8]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[12]
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[13];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 11
#define RD_COMPARISON_MASK -
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[93]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[158]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[160]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[162]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[164]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[165]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[166]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[167]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[168]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[173]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[176]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[179]
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[180];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 13
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[93]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[158]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[164]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[165]
#define RD_UNIFORM_SUN_DIR fragmentConstants[166]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[167]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[168]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[173]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[176]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[179]
static float intermediateValue205;
static float intermediateValue206;
static float intermediateValue207;
static float intermediateValue208;
static float intermediateValue209;
static float intermediateValue210;
static float intermediateValue199;
static float intermediateValue200;
static float intermediateValue201;
static float intermediateValue202;
static float intermediateValue203;
static float intermediateValue204;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[180] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[94]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[161]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[164]
#define RD_UNIFORM_MOON_DIR fragmentConstants[165]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[179]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[181]
#define RD_UNIFORM_SUN_DIR fragmentConstants[182]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[183]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[184]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[185]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[190]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[194]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[197]
static uint intermediateValue44;
static float intermediateValue254;
static float intermediateValue255;
static float intermediateValue256;
static float intermediateValue257;
static float intermediateValue258;
static float intermediateValue259;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue253;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[198] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#elif RD_BINDING_LAYOUT == 15
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[93]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[158]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[160]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[163]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[165]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[166]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[167]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[168]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[169]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[170]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[171]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[172]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[173]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[174]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[177]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[178]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[179]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[180]
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[181];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 16
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[94]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[161]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[163]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[164]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[165]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[166]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[179]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[181]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[182]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[183]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[184]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[185]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[190]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[194]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[197]
struct t11_t {
  float val[32];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[1];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[93]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[158]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[163]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[165]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[166]
#define RD_UNIFORM_SUN_DIR fragmentConstants[167]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[168]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[169]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[170]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[171]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[172]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[173]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[174]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[178]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[179]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[180]
static float intermediateValue206;
static float intermediateValue207;
static float intermediateValue208;
static float intermediateValue209;
static float intermediateValue210;
static float intermediateValue211;
static float intermediateValue200;
static float intermediateValue201;
static float intermediateValue202;
static float intermediateValue203;
static float intermediateValue204;
static float intermediateValue205;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[181] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#elif RD_BINDING_LAYOUT == 18
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[94]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[141]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[161]
#define RD_UNIFORM_GLINT_COLOR fragmentVectorConstants1[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[163]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[164]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[165]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[166]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[167]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[169]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[173]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[174]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[175]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[179]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[180]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[182]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[183]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[184]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[185]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[186]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[187]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[188]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[189]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[190]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[191]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentVectorConstants1[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[195]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[196]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[197]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[198]
struct t11_t {
  float val[32];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[1];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
struct t9_t {
  float val[1];
};
StructuredBuffer<t9_t> sampledResource9 : register(t9);
struct t8_t {
  float val[4];
};
StructuredBuffer<t8_t> sampledResource8 : register(t8);
TextureCubeArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
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
  float4 fragmentVectorConstants1[199];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 19
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[94]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[161]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[164]
#define RD_UNIFORM_MOON_DIR fragmentConstants[165]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[166]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[179]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[180]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[182]
#define RD_UNIFORM_SUN_DIR fragmentConstants[183]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[184]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[185]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[186]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[187]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[188]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[189]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[190]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[191]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[196]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[197]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[198]
static uint intermediateValue45;
static float intermediateValue255;
static float intermediateValue256;
static float intermediateValue257;
static float intermediateValue258;
static float intermediateValue259;
static float intermediateValue260;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue253;
static float intermediateValue254;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[199] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
#elif RD_BINDING_LAYOUT == 20
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[93]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[158]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[163]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[164]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[165]
#define RD_UNIFORM_SUN_DIR fragmentConstants[166]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[167]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[168]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[169]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[170]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[171]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[172]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[173]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[174]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[175]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[176]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[177]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[178]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[179]
static float intermediateValue205;
static float intermediateValue206;
static float intermediateValue207;
static float intermediateValue208;
static float intermediateValue209;
static float intermediateValue210;
static float intermediateValue199;
static float intermediateValue200;
static float intermediateValue201;
static float intermediateValue202;
static float intermediateValue203;
static float intermediateValue204;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[180] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 21
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[94]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[161]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[164]
#define RD_UNIFORM_MOON_DIR fragmentConstants[165]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[166]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[167]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[179]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[180]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[181]
#define RD_UNIFORM_SUN_DIR fragmentConstants[182]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[183]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[184]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[185]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[186]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[187]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[188]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[189]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[190]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[191]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[192]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[193]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[194]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[195]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[196]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[197]
static uint intermediateValue44;
static float intermediateValue254;
static float intermediateValue255;
static float intermediateValue256;
static float intermediateValue257;
static float intermediateValue258;
static float intermediateValue259;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue253;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[198] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 22
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[84]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[85]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[86]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[87]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[88]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[89]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[90]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[91]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[93]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[94]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[95]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[96]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[97]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[98]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[131]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[133]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[134]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[135]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[141]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[142]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[143]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[144]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[145]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[146]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[148]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[149]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[150]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[152]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[153]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[154]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[157]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[158]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[159]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[160]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[161]
#define RD_UNIFORM_MOON_DIR fragmentConstants[162]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[163]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[164]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[165]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[166]
#define RD_UNIFORM_SUN_DIR fragmentConstants[167]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[168]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[169]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[170]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[171]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[172]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[173]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[174]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[175]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[176]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[177]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[178]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[179]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[180]
static float intermediateValue206;
static float intermediateValue207;
static float intermediateValue208;
static float intermediateValue209;
static float intermediateValue210;
static float intermediateValue211;
static float intermediateValue200;
static float intermediateValue201;
static float intermediateValue202;
static float intermediateValue203;
static float intermediateValue204;
static float intermediateValue205;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[181] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 23
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
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[17]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[18]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[19]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[20]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[53]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[61]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[62]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[63]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[64]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[65]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[66]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[67]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[68]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[69]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[83]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[84]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[85]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[86]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[87]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[88]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[89]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[90]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[91]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[92]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[94]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[95]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[96]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[97]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[98]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[99]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[100]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[135]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[136]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[137]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[138]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[139]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[140]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[141]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[142]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[143]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[144]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[145]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[146]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[147]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[148]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[149]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[150]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[151]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[152]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[153]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[154]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[155]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[156]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[157]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[160]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[161]
#define RD_UNIFORM_GLINT_COLOR fragmentConstants[162]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[163]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[164]
#define RD_UNIFORM_MOON_DIR fragmentConstants[165]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[166]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[167]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[168]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[169]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[170]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[171]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[172]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[173]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[174]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[175]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[176]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[177]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[178]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[179]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[180]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[181]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[182]
#define RD_UNIFORM_SUN_DIR fragmentConstants[183]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[184]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[185]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[186]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[187]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[188]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[189]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[190]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[191]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[192]
#define RD_UNIFORM_TILE_LIGHT_COLOR fragmentConstants[193]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[194]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[195]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[196]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[197]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[198]
static uint intermediateValue45;
static float intermediateValue255;
static float intermediateValue256;
static float intermediateValue257;
static float intermediateValue258;
static float intermediateValue259;
static float intermediateValue260;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue253;
static float intermediateValue254;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[199] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> glintTextureTexture : register(t1, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t3, space0);
Texture2DArray<float4> causticsTextureTexture : register(t4, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t5, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t6, space0);
TextureCubeArray<float4> specularIblRecordsTexture : register(t7, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T8_WORDS)
struct RdNativeElement_gpuEntryBuffer { uint words[RD_NATIVE_T8_WORDS]; };
StructuredBuffer<RdNativeElement_gpuEntryBuffer> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[(index) / RD_NATIVE_T8_WORDS].words[(index) % RD_NATIVE_T8_WORDS]
uint4 rdLoad_gpuEntryBuffer(uint wordIndex) { return uint4(rdAccess_gpuEntryBuffer(wordIndex), rdAccess_gpuEntryBuffer(wordIndex + 1u), rdAccess_gpuEntryBuffer(wordIndex + 2u), rdAccess_gpuEntryBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> gpuEntryBuffer : register(t8, space0);
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#define rdLoad_gpuEntryBuffer(index) gpuEntryBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T9_WORDS)
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T9_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T9_WORDS].words[(index) % RD_NATIVE_T9_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t9, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t10, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t11, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState brdfLutSampler : register(s0, space0);
SamplerState glintTextureSampler : register(s1, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s3, space0);
SamplerState causticsTextureSampler : register(s4, space0);
SamplerState scatteringBufferSampler : register(s5, space0);
SamplerState shadowCascadesSampler : register(s6, space0);
SamplerState specularIblRecordsSampler : register(s7, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingTexCoord2;
static float4 varyingTexCoord8;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
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
    float4 varyingTexCoord8 : TEXCOORD8;
    float3 varyingNormal0 : NORMAL0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
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
