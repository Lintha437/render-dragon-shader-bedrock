#define RD_NATIVE_CBUFFER_VECTORS RD_NATIVE_B1_VECTORS
// Native resource and stage-interface layouts for RenderChunkForwardPBR / fragment.
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_SUN_DIR fragmentConstants[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[138]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[143]
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[144] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[68]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[72]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[129]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[131]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[138]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[143]
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
  float4 fragmentVectorConstants1[144];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_SUN_DIR fragmentConstants[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[138]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[143]
static float intermediateValue245;
static float intermediateValue246;
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[144] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 3
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[68]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[72]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[129]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[131]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[138]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[143]
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
  float4 fragmentVectorConstants1[144];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[61]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[69]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[147]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[155]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[161]
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
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[162];
}
#define RD_COMPARISON_MASK -
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[58]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[147]
#define RD_UNIFORM_SUN_DIR fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[155]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[161]
static uint intermediateValue86;
static float intermediateValue294;
static float intermediateValue295;
static float intermediateValue296;
static float intermediateValue297;
static float intermediateValue298;
static float intermediateValue299;
static float intermediateValue288;
static float intermediateValue289;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[162] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 6
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[147]
#define RD_UNIFORM_SUN_DIR fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[155]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[161]
static uint intermediateValue81;
static float intermediateValue289;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static float intermediateValue294;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue286;
static float intermediateValue287;
static float intermediateValue288;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[162] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState seasonsTextureSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 7
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[61]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[69]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[147]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[155]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[161]
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
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
  float4 fragmentVectorConstants1[162];
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[109]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[110]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[116]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[117]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[118]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[124]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[125]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[127]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[128]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[133]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_SUN_DIR fragmentConstants[137]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[138]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[139]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[140]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[141]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[142]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[143]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[144]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[146]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[147]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[148]
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue246;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[149] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 9
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentVectorConstants1[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[60]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[61]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[68]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[72]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[108]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[109]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[110]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[116]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[117]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[118]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[124]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[125]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[127]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[128]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[136]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[137]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[138]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[139]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[140]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[141]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[142]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[143]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[144]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[145]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[146]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[147]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[148]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
static const uint4 intermediateValue17[69] = { uint4(1065353216u, 0u, 0u, 0u), uint4(0u, 1065353216u, 0u, 0u), uint4(0u, 0u, 1065353216u, 0u), uint4(0u, 0u, 0u, 1065353216u), uint4(4294967295u, 0u, 0u, 1u), uint4(2u, 0u, 0u, 1u), uint4(3u, 0u, 1u, 0u), uint4(4294967295u, 0u, 1u, 0u), uint4(0u, 1u, 0u, 0u), uint4(6u, 1u, 0u, 0u), uint4(7u, 0u, 1u, 0u), uint4(4294967295u, 1u, 0u, 0u), uint4(1u, 0u, 1u, 1u), uint4(10u, 1u, 0u, 1u), uint4(11u, 0u, 1u, 1u), uint4(4294967295u, 0u, 1u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 1u, 0u), uint4(4294967295u, 1u, 1u, 0u), uint4(4u, 0u, 0u, 0u), uint4(14u, 0u, 0u, 0u), uint4(16u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(8u, 0u, 0u, 0u), uint4(18u, 0u, 0u, 0u), uint4(20u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(12u, 0u, 0u, 0u), uint4(22u, 0u, 0u, 0u), uint4(24u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(5u, 0u, 0u, 0u), uint4(15u, 0u, 0u, 0u), uint4(17u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(9u, 0u, 0u, 0u), uint4(19u, 0u, 0u, 0u), uint4(21u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(13u, 0u, 0u, 0u), uint4(23u, 0u, 0u, 0u), uint4(25u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(0u, 0u, 0u, 0u) };
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture8 : register(t8);
TextureCubeArray<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_intermediateValue7 { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue7> intermediateValue7 : register(t10);
#define rdAccess_intermediateValue7(index) intermediateValue7[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_intermediateValue7(uint wordIndex) { return uint4(rdAccess_intermediateValue7(wordIndex), rdAccess_intermediateValue7(wordIndex + 1u), rdAccess_intermediateValue7(wordIndex + 2u), rdAccess_intermediateValue7(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue7 : register(t10);
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#define rdLoad_intermediateValue7(index) intermediateValue7.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t11);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t11);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue9 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue9> intermediateValue9 : register(t12);
#define rdAccess_intermediateValue9(index) intermediateValue9[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue9(uint wordIndex) { return uint4(rdAccess_intermediateValue9(wordIndex), rdAccess_intermediateValue9(wordIndex + 1u), rdAccess_intermediateValue9(wordIndex + 2u), rdAccess_intermediateValue9(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue9 : register(t12);
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#define rdLoad_intermediateValue9(index) intermediateValue9.Load(index)
#endif
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler9 : register(s9);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 10
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentVectorConstants1[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[61]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[69]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[110]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[111]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[112]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[117]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[118]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[128]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[129]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[130]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[131]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[134]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[135]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[136]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[137]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[139]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[140]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[141]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[142]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[143]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[144]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[145]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[146]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[147]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[148]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[149]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[150]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[152]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[153]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[154]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[155]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[156]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[157]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[158]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[159]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[160]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[162]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[163]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[164]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[165]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[166]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
static const uint4 intermediateValue21[69] = { uint4(1065353216u, 0u, 0u, 0u), uint4(0u, 1065353216u, 0u, 0u), uint4(0u, 0u, 1065353216u, 0u), uint4(0u, 0u, 0u, 1065353216u), uint4(4294967295u, 0u, 0u, 1u), uint4(2u, 0u, 0u, 1u), uint4(3u, 0u, 1u, 0u), uint4(4294967295u, 0u, 1u, 0u), uint4(0u, 1u, 0u, 0u), uint4(6u, 1u, 0u, 0u), uint4(7u, 0u, 1u, 0u), uint4(4294967295u, 1u, 0u, 0u), uint4(1u, 0u, 1u, 1u), uint4(10u, 1u, 0u, 1u), uint4(11u, 0u, 1u, 1u), uint4(4294967295u, 0u, 1u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 1u, 0u), uint4(4294967295u, 1u, 1u, 0u), uint4(4u, 0u, 0u, 0u), uint4(14u, 0u, 0u, 0u), uint4(16u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(8u, 0u, 0u, 0u), uint4(18u, 0u, 0u, 0u), uint4(20u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(12u, 0u, 0u, 0u), uint4(22u, 0u, 0u, 0u), uint4(24u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(5u, 0u, 0u, 0u), uint4(15u, 0u, 0u, 0u), uint4(17u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(9u, 0u, 0u, 0u), uint4(19u, 0u, 0u, 0u), uint4(21u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(13u, 0u, 0u, 0u), uint4(23u, 0u, 0u, 0u), uint4(25u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(0u, 0u, 0u, 0u) };
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture8 : register(t8);
TextureCubeArray<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t10);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t10);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue9 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue9> intermediateValue9 : register(t11);
#define rdAccess_intermediateValue9(index) intermediateValue9[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue9(uint wordIndex) { return uint4(rdAccess_intermediateValue9(wordIndex), rdAccess_intermediateValue9(wordIndex + 1u), rdAccess_intermediateValue9(wordIndex + 2u), rdAccess_intermediateValue9(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue9 : register(t11);
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#define rdLoad_intermediateValue9(index) intermediateValue9.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue10 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue10> intermediateValue10 : register(t12);
#define rdAccess_intermediateValue10(index) intermediateValue10[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue10(uint wordIndex) { return uint4(rdAccess_intermediateValue10(wordIndex), rdAccess_intermediateValue10(wordIndex + 1u), rdAccess_intermediateValue10(wordIndex + 2u), rdAccess_intermediateValue10(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue10 : register(t12);
#define rdAccess_intermediateValue10(index) intermediateValue10[index]
#define rdLoad_intermediateValue10(index) intermediateValue10.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue11 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue11> intermediateValue11 : register(t13);
#define rdAccess_intermediateValue11(index) intermediateValue11[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue11(uint wordIndex) { return uint4(rdAccess_intermediateValue11(wordIndex), rdAccess_intermediateValue11(wordIndex + 1u), rdAccess_intermediateValue11(wordIndex + 2u), rdAccess_intermediateValue11(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue11 : register(t13);
#define rdAccess_intermediateValue11(index) intermediateValue11[index]
#define rdLoad_intermediateValue11(index) intermediateValue11.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_intermediateValue12 { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue12> intermediateValue12 : register(t14);
#define rdAccess_intermediateValue12(index) intermediateValue12[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_intermediateValue12(uint wordIndex) { return uint4(rdAccess_intermediateValue12(wordIndex), rdAccess_intermediateValue12(wordIndex + 1u), rdAccess_intermediateValue12(wordIndex + 2u), rdAccess_intermediateValue12(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue12 : register(t14);
#define rdAccess_intermediateValue12(index) intermediateValue12[index]
#define rdLoad_intermediateValue12(index) intermediateValue12.Load(index)
#endif
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler9 : register(s9);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 11
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[111]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[112]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[118]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[128]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[129]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[130]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[131]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[134]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[135]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[136]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[145]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[149]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[152]
#define RD_UNIFORM_SUN_DIR fragmentConstants[153]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[154]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[157]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[158]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[159]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[160]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[161]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[162]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[163]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[164]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[165]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[166]
static uint intermediateValue88;
static float intermediateValue296;
static float intermediateValue297;
static float intermediateValue298;
static float intermediateValue299;
static float intermediateValue300;
static float intermediateValue301;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static float intermediateValue294;
static float intermediateValue295;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[167] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 12
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler2 : register(s2);
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 13
Texture2D<float4> matTextureTexture : register(t2, space0);
SamplerState matTextureSampler : register(s2, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 14
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 15
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static int varyingFrontFacing0;
static float3 varyingNormal0;
static int varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingNormal0 : NORMAL0;
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_SUN_DIR fragmentConstants[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[138]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[143]
static float intermediateValue245;
static float intermediateValue246;
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[144] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 17
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[109]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[110]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[115]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[116]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[117]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[123]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[124]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[125]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[126]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_SUN_DIR fragmentConstants[132]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[133]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[135]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[136]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[137]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[138]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[139]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[140]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[141]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[142]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[143]
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[144] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 18
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[147]
#define RD_UNIFORM_SUN_DIR fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[155]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[161]
static uint intermediateValue86;
static float intermediateValue294;
static float intermediateValue295;
static float intermediateValue296;
static float intermediateValue297;
static float intermediateValue298;
static float intermediateValue299;
static float intermediateValue288;
static float intermediateValue289;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[162] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 19
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[111]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[117]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[118]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[119]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[120]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[121]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[127]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[128]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[129]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[130]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[131]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[145]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[147]
#define RD_UNIFORM_SUN_DIR fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[149]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[152]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[153]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[154]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[155]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[156]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[157]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[158]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[159]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[160]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[161]
static uint intermediateValue81;
static float intermediateValue289;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static float intermediateValue294;
static float intermediateValue283;
static float intermediateValue284;
static float intermediateValue285;
static float intermediateValue286;
static float intermediateValue287;
static float intermediateValue288;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[162] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState seasonsTextureSampler : register(s5, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 20
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentVectorConstants1[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[59]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[60]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[61]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[68]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[72]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[108]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[109]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[110]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[116]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[117]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[118]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[124]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[125]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[127]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[128]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[131]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[134]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[136]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[137]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[138]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[139]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[140]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[141]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[142]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[143]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[144]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[145]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[146]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[147]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[148]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
static const uint4 intermediateValue17[69] = { uint4(1065353216u, 0u, 0u, 0u), uint4(0u, 1065353216u, 0u, 0u), uint4(0u, 0u, 1065353216u, 0u), uint4(0u, 0u, 0u, 1065353216u), uint4(4294967295u, 0u, 0u, 1u), uint4(2u, 0u, 0u, 1u), uint4(3u, 0u, 1u, 0u), uint4(4294967295u, 0u, 1u, 0u), uint4(0u, 1u, 0u, 0u), uint4(6u, 1u, 0u, 0u), uint4(7u, 0u, 1u, 0u), uint4(4294967295u, 1u, 0u, 0u), uint4(1u, 0u, 1u, 1u), uint4(10u, 1u, 0u, 1u), uint4(11u, 0u, 1u, 1u), uint4(4294967295u, 0u, 1u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 1u, 0u), uint4(4294967295u, 1u, 1u, 0u), uint4(4u, 0u, 0u, 0u), uint4(14u, 0u, 0u, 0u), uint4(16u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(8u, 0u, 0u, 0u), uint4(18u, 0u, 0u, 0u), uint4(20u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(12u, 0u, 0u, 0u), uint4(22u, 0u, 0u, 0u), uint4(24u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(5u, 0u, 0u, 0u), uint4(15u, 0u, 0u, 0u), uint4(17u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(9u, 0u, 0u, 0u), uint4(19u, 0u, 0u, 0u), uint4(21u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(13u, 0u, 0u, 0u), uint4(23u, 0u, 0u, 0u), uint4(25u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(0u, 0u, 0u, 0u) };
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture8 : register(t8);
TextureCubeArray<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_intermediateValue7 { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue7> intermediateValue7 : register(t10);
#define rdAccess_intermediateValue7(index) intermediateValue7[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_intermediateValue7(uint wordIndex) { return uint4(rdAccess_intermediateValue7(wordIndex), rdAccess_intermediateValue7(wordIndex + 1u), rdAccess_intermediateValue7(wordIndex + 2u), rdAccess_intermediateValue7(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue7 : register(t10);
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#define rdLoad_intermediateValue7(index) intermediateValue7.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t11);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t11);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue9 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue9> intermediateValue9 : register(t12);
#define rdAccess_intermediateValue9(index) intermediateValue9[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue9(uint wordIndex) { return uint4(rdAccess_intermediateValue9(wordIndex), rdAccess_intermediateValue9(wordIndex + 1u), rdAccess_intermediateValue9(wordIndex + 2u), rdAccess_intermediateValue9(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue9 : register(t12);
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#define rdLoad_intermediateValue9(index) intermediateValue9.Load(index)
#endif
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler9 : register(s9);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
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
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 21
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
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[62]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[63]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[64]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[65]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[66]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[67]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[68]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[69]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[70]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[71]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[72]
#define RD_UNIFORM_MOON_DIR fragmentConstants[73]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[74]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[108]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[109]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[110]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[111]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[112]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[116]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[117]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[118]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[120]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[121]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[122]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[124]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[125]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[126]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[127]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[128]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[131]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[133]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[134]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_SUN_DIR fragmentConstants[137]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[138]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[139]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[140]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[141]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[142]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[143]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[144]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[146]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[147]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[148]
static float intermediateValue247;
static float intermediateValue248;
static float intermediateValue249;
static float intermediateValue250;
static float intermediateValue251;
static float intermediateValue252;
static float intermediateValue241;
static float intermediateValue242;
static float intermediateValue243;
static float intermediateValue244;
static float intermediateValue245;
static float intermediateValue246;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[149] : packoffset(c0);
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
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 22
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
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[61]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[69]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentConstants[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[74]
#define RD_UNIFORM_MOON_DIR fragmentConstants[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[110]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentConstants[111]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[112]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[117]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[118]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[128]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[129]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[130]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[131]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentConstants[134]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[135]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[136]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[141]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[142]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[143]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[144]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[145]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[146]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[147]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[148]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[149]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[150]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[151]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[152]
#define RD_UNIFORM_SUN_DIR fragmentConstants[153]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[154]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[155]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[156]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[157]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[158]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[159]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[160]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[161]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[162]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[163]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[164]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[165]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[166]
static uint intermediateValue88;
static float intermediateValue296;
static float intermediateValue297;
static float intermediateValue298;
static float intermediateValue299;
static float intermediateValue300;
static float intermediateValue301;
static float intermediateValue290;
static float intermediateValue291;
static float intermediateValue292;
static float intermediateValue293;
static float intermediateValue294;
static float intermediateValue295;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[167] : packoffset(c0);
};
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState causticsTextureSampler : register(s6, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
SamplerState specularIblRecordsSampler : register(s9, space0);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static int varyingFrontFacing0;
static float3 varyingTexCoord5;
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
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingFrontFacing0 : FRONTFACING0;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#elif RD_BINDING_LAYOUT == 23
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentVectorConstants1[48]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[56]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[57]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[58]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[59]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[60]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[61]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[62]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[63]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[64]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[65]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[66]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[67]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[68]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[69]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[70]
#define RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY fragmentVectorConstants1[71]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[72]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[73]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[74]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[75]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[76]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[109]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[110]
#define RD_UNIFORM_VIEW_POSITION_AND_TIME fragmentVectorConstants1[111]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[112]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[113]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[114]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[115]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[116]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[117]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[118]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[119]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[120]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[121]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[122]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[123]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[124]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[125]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[126]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[127]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[128]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[129]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[130]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[131]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_2 fragmentVectorConstants1[134]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[135]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[136]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[137]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[139]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[140]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[141]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[142]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[143]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[144]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[145]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[146]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[147]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[148]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[149]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[150]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[151]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[152]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[153]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[154]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[155]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[156]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[157]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[158]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[159]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[160]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[161]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[162]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[163]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[164]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[165]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[166]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
static const uint4 intermediateValue21[69] = { uint4(1065353216u, 0u, 0u, 0u), uint4(0u, 1065353216u, 0u, 0u), uint4(0u, 0u, 1065353216u, 0u), uint4(0u, 0u, 0u, 1065353216u), uint4(4294967295u, 0u, 0u, 1u), uint4(2u, 0u, 0u, 1u), uint4(3u, 0u, 1u, 0u), uint4(4294967295u, 0u, 1u, 0u), uint4(0u, 1u, 0u, 0u), uint4(6u, 1u, 0u, 0u), uint4(7u, 0u, 1u, 0u), uint4(4294967295u, 1u, 0u, 0u), uint4(1u, 0u, 1u, 1u), uint4(10u, 1u, 0u, 1u), uint4(11u, 0u, 1u, 1u), uint4(4294967295u, 0u, 1u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 0u, 1u), uint4(4294967295u, 1u, 1u, 0u), uint4(4294967295u, 1u, 1u, 0u), uint4(4u, 0u, 0u, 0u), uint4(14u, 0u, 0u, 0u), uint4(16u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(8u, 0u, 0u, 0u), uint4(18u, 0u, 0u, 0u), uint4(20u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(12u, 0u, 0u, 0u), uint4(22u, 0u, 0u, 0u), uint4(24u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(5u, 0u, 0u, 0u), uint4(15u, 0u, 0u, 0u), uint4(17u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(9u, 0u, 0u, 0u), uint4(19u, 0u, 0u, 0u), uint4(21u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(13u, 0u, 0u, 0u), uint4(23u, 0u, 0u, 0u), uint4(25u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(4294967295u, 0u, 0u, 0u), uint4(0u, 0u, 0u, 0u) };
cbuffer FragmentVectorConstants1Buffer : register(b1)
{
    float4 fragmentVectorConstants1[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture4 : register(t4);
Texture2DArray<float4> materialTexture6 : register(t6);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2DArray<float4> materialTexture8 : register(t8);
TextureCubeArray<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T10_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T10_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t10);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T10_WORDS].words[(index) % RD_NATIVE_T10_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t10);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue9 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue9> intermediateValue9 : register(t11);
#define rdAccess_intermediateValue9(index) intermediateValue9[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue9(uint wordIndex) { return uint4(rdAccess_intermediateValue9(wordIndex), rdAccess_intermediateValue9(wordIndex + 1u), rdAccess_intermediateValue9(wordIndex + 2u), rdAccess_intermediateValue9(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue9 : register(t11);
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#define rdLoad_intermediateValue9(index) intermediateValue9.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue10 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue10> intermediateValue10 : register(t12);
#define rdAccess_intermediateValue10(index) intermediateValue10[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue10(uint wordIndex) { return uint4(rdAccess_intermediateValue10(wordIndex), rdAccess_intermediateValue10(wordIndex + 1u), rdAccess_intermediateValue10(wordIndex + 2u), rdAccess_intermediateValue10(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue10 : register(t12);
#define rdAccess_intermediateValue10(index) intermediateValue10[index]
#define rdLoad_intermediateValue10(index) intermediateValue10.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue11 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue11> intermediateValue11 : register(t13);
#define rdAccess_intermediateValue11(index) intermediateValue11[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue11(uint wordIndex) { return uint4(rdAccess_intermediateValue11(wordIndex), rdAccess_intermediateValue11(wordIndex + 1u), rdAccess_intermediateValue11(wordIndex + 2u), rdAccess_intermediateValue11(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue11 : register(t13);
#define rdAccess_intermediateValue11(index) intermediateValue11[index]
#define rdLoad_intermediateValue11(index) intermediateValue11.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_intermediateValue12 { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue12> intermediateValue12 : register(t14);
#define rdAccess_intermediateValue12(index) intermediateValue12[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_intermediateValue12(uint wordIndex) { return uint4(rdAccess_intermediateValue12(wordIndex), rdAccess_intermediateValue12(wordIndex + 1u), rdAccess_intermediateValue12(wordIndex + 2u), rdAccess_intermediateValue12(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue12 : register(t14);
#define rdAccess_intermediateValue12(index) intermediateValue12[index]
#define rdLoad_intermediateValue12(index) intermediateValue12.Load(index)
#endif
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler9 : register(s9);
static bool varyingSv_Isfrontface0;
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float2 varyingTexCoord2;
static float2 varyingTexCoord1;
static int varyingTexCoord4;
static float3 varyingTexCoord5;
static float3 varyingNormal0;
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
    float2 varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    nointerpolation int varyingTexCoord4 : TEXCOORD4;
    float3 varyingTexCoord5 : TEXCOORD5;
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
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_intermediateValue10
#define rdAccess_intermediateValue10(index) intermediateValue10[index]
#endif
#ifndef rdAccess_intermediateValue11
#define rdAccess_intermediateValue11(index) intermediateValue11[index]
#endif
#ifndef rdAccess_intermediateValue12
#define rdAccess_intermediateValue12(index) intermediateValue12[index]
#endif
#ifndef rdAccess_intermediateValue7
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#endif
#ifndef rdAccess_intermediateValue8
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#endif
#ifndef rdAccess_intermediateValue9
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#endif
#ifndef rdAccess_pbrData
#define rdAccess_pbrData(index) pbrData[index]
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
