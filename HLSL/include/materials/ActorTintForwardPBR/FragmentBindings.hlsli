// Native resource and stage-interface layouts for ActorTintForwardPBR / fragment.
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
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[45]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[56]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[57]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[58]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[91]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[92]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[93]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[94]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[99]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[100]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[101]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[102]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[111]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[112]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[113]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[114]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[115]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[116]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[117]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[118]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[119]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[120]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[121]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[122]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[123]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[124]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[125]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[126]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[127]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[128]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[129]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[130]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[131]
struct t12_t {
  float val[1];
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 32
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[56]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[57]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[58]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[94]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[99]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[101]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[102]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[111]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[113]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[114]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_DIR fragmentConstants[116]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[117]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[118]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[119]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[120]
#define RD_UNIFORM_SUN_DIR fragmentConstants[121]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[122]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[123]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[124]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[125]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[127]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[128]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[129]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[131]
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
    float4 fragmentConstants[132] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 33
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[55]
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
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[114]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[115]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[116]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[117]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_DIR fragmentConstants[119]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[120]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[121]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[122]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[132]
#define RD_UNIFORM_SUN_DIR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[139]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[140]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[141]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[145]
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
    float4 fragmentConstants[146] : packoffset(c0);
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[45]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[55]
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
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[113]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[114]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[115]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[116]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[117]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[118]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[119]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[120]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[121]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[122]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[124]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[125]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[126]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[131]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[132]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[139]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[140]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[141]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[145]
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
#elif RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 4
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[56]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[57]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[58]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[91]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[92]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[93]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[94]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[95]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[96]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[99]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[101]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[102]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[103]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[107]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[109]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[111]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[112]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[113]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[114]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_DIR fragmentConstants[116]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[117]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[118]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[119]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[120]
#define RD_UNIFORM_SUN_DIR fragmentConstants[121]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[122]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[123]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[124]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[125]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[126]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[127]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[128]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[129]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[131]
static float intermediateValue190;
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue184;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[132] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 36 || RD_BINDING_LAYOUT == 5
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[114]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[116]
#define RD_UNIFORM_MOON_DIR fragmentConstants[117]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[119]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[120]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_SUN_DIR fragmentConstants[122]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[123]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[125]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[126]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[129]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[131]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[132]
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
    float4 fragmentConstants[133] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 35 || RD_BINDING_LAYOUT == 6
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[48]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[49]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[50]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[51]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[52]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[54]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[55]
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
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[114]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[115]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[116]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[117]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_DIR fragmentConstants[119]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[120]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[121]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[122]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[130]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[132]
#define RD_UNIFORM_SUN_DIR fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[134]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[135]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[136]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[137]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[138]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[139]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[140]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[141]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[142]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[143]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[145]
static uint intermediateValue42;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[146] : packoffset(c0);
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
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[112]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[113]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[114]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[115]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[116]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[117]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[118]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[119]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[120]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[121]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[122]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[123]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[124]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[125]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[126]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[128]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[129]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[130]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[131]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[132]
struct t12_t {
  float val[1];
#elif RD_BINDING_LAYOUT == 8
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
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[101]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[114]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[115]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[116]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[117]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[118]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[119]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[120]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[121]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[124]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[125]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[126]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[131]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[132]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[133]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[140]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[141]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[142]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[143]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[146]
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
#elif RD_BINDING_LAYOUT == 38 || RD_BINDING_LAYOUT == 9
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[115]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[116]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[117]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[119]
#define RD_UNIFORM_MOON_DIR fragmentConstants[120]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[143]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
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
    float4 fragmentConstants[147] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 37
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[114]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[116]
#define RD_UNIFORM_MOON_DIR fragmentConstants[117]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[119]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[120]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_SUN_DIR fragmentConstants[122]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[123]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[125]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[126]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[129]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[131]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[132]
static float intermediateValue190;
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue184;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[133] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 39
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[115]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[116]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[117]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[119]
#define RD_UNIFORM_MOON_DIR fragmentConstants[120]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[143]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
static uint intermediateValue42;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[147] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 12 || RD_BINDING_LAYOUT == 40
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[114]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[116]
#define RD_UNIFORM_MOON_DIR fragmentConstants[117]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[119]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[120]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_SUN_DIR fragmentConstants[122]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[123]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[125]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[126]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[129]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[131]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[132]
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
    float4 fragmentConstants[133] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 13 || RD_BINDING_LAYOUT == 41
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[115]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[116]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[117]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[119]
#define RD_UNIFORM_MOON_DIR fragmentConstants[120]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[143]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
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
    float4 fragmentConstants[147] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 14 || RD_BINDING_LAYOUT == 42
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[113]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[114]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[115]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[116]
#define RD_UNIFORM_MOON_DIR fragmentConstants[117]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[118]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[119]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[120]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_SUN_DIR fragmentConstants[122]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[123]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[124]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[125]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[126]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[127]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[128]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[129]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[130]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[131]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[132]
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue196;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[133] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 15
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[114]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[117]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[118]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[119]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[120]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_DIR fragmentConstants[122]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[123]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[124]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[125]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_SUN_DIR fragmentConstants[127]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[128]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[130]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[131]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[133]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[134]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[135]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[137]
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
    float4 fragmentConstants[138] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 16 || RD_BINDING_LAYOUT == 43
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[112]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[113]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[114]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[115]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[116]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[117]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[118]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[119]
#define RD_UNIFORM_MOON_DIR fragmentConstants[120]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[121]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[122]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[123]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[124]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[125]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[126]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[127]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[131]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[133]
#define RD_UNIFORM_SUN_DIR fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[135]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[138]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[139]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[140]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[141]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[142]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[143]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[144]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[145]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[146]
static uint intermediateValue43;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[147] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 17
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[45]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[112]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[113]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[114]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[117]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[118]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[119]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[120]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[121]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[122]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[124]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[125]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[126]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[127]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[128]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[129]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[130]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[131]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[133]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[134]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[135]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[136]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[137]
struct t12_t {
  float val[1];
#elif RD_BINDING_LAYOUT == 18
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[45]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[101]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[106]
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
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[120]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[121]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[122]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[123]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[124]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[125]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[126]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[127]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[128]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[130]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[131]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[136]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[137]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[138]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[139]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[140]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[141]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[142]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[143]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[144]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[145]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[146]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[147]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[148]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[149]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[150]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[151]
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
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
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[120]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[121]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[122]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[123]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_DIR fragmentConstants[125]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[126]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[127]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[138]
#define RD_UNIFORM_SUN_DIR fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[140]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[141]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[142]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[143]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[144]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[145]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[146]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[147]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[148]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[149]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[151]
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
    float4 fragmentConstants[152] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 20
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
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
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[103]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[104]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[108]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[110]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[112]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[114]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[117]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[118]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[119]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[120]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_DIR fragmentConstants[122]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[123]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[124]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[125]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[126]
#define RD_UNIFORM_SUN_DIR fragmentConstants[127]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[128]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[129]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[130]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[131]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[132]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[133]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[134]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[135]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[137]
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue196;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[138] : packoffset(c0);
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[16]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[24]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[25]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[26]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[27]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[41]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[42]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[43]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[44]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[45]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[46]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[47]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[48]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[49]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[50]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[51]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[52]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[53]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[54]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[55]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[57]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[104]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[105]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[106]
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
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[120]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[121]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[122]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[123]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_DIR fragmentConstants[125]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[126]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[127]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[128]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[136]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[137]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[138]
#define RD_UNIFORM_SUN_DIR fragmentConstants[139]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[140]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[141]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[142]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[143]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[144]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[145]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[146]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[147]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[148]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[149]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[151]
static uint intermediateValue43;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[152] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 22
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
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[101]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[113]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[114]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[115]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[120]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[121]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[122]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[123]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[124]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[126]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[127]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[128]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[129]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[130]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[131]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[132]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[133]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[134]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[135]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[138]
struct t12_t {
  float val[1];
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[122]
#define RD_UNIFORM_MOON_DIR fragmentConstants[123]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[124]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[126]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_SUN_DIR fragmentConstants[128]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[129]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[130]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[131]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[132]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[134]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[135]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[136]
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
#elif RD_BINDING_LAYOUT == 24
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
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentVectorConstants1[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[58]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[59]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[60]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[61]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[94]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentVectorConstants1[95]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentVectorConstants1[96]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentVectorConstants1[97]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[101]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[102]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[103]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[104]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[106]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[110]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[113]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[114]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[115]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[116]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[117]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[120]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[121]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[122]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[123]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[124]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[125]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[126]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[127]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[128]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[130]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[131]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[132]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[136]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[137]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[139]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[140]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[141]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[142]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[143]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[144]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[145]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[146]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[147]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[148]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[149]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[152]
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
#elif RD_BINDING_LAYOUT == 25
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[59]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[60]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[61]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[96]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[97]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[102]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[103]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[104]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[106]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[110]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[113]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[114]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[116]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[117]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[120]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[122]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[123]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[125]
#define RD_UNIFORM_MOON_DIR fragmentConstants[126]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[127]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[128]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[137]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[139]
#define RD_UNIFORM_SUN_DIR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[141]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[142]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[143]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[144]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[145]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[146]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[147]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[148]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[149]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[150]
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
#elif RD_BINDING_LAYOUT == 26
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[122]
#define RD_UNIFORM_MOON_DIR fragmentConstants[123]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[124]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[126]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_SUN_DIR fragmentConstants[128]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[129]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[130]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[131]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[132]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[134]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[135]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[138]
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue196;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[139] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 27
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[59]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[60]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[61]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[96]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[97]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[102]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[103]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[104]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[106]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[110]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[113]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[114]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[116]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[117]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[120]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[122]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[123]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[125]
#define RD_UNIFORM_MOON_DIR fragmentConstants[126]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[127]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[128]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[137]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[139]
#define RD_UNIFORM_SUN_DIR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[141]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[142]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[143]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[144]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[145]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[146]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[147]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[148]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[149]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[152]
static uint intermediateValue43;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[153] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 28
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[122]
#define RD_UNIFORM_MOON_DIR fragmentConstants[123]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[124]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[126]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_SUN_DIR fragmentConstants[128]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[129]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[130]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[131]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[132]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[134]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[135]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[138]
static float intermediateValue189;
static float intermediateValue190;
static float intermediateValue191;
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue183;
static float intermediateValue184;
static float intermediateValue185;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[139] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 29
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[59]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[60]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[61]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[96]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[97]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[102]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[103]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[104]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[106]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[110]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[113]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[114]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[116]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[117]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[120]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[122]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[123]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[125]
#define RD_UNIFORM_MOON_DIR fragmentConstants[126]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[127]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[128]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[137]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[139]
#define RD_UNIFORM_SUN_DIR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[141]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[142]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[143]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[144]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[145]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[146]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[147]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[148]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[149]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[152]
static uint intermediateValue41;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue227;
static float intermediateValue228;
static float intermediateValue229;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[153] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 30
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[59]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[60]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[93]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[96]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[97]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[101]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[102]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[104]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[105]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[106]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[109]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[110]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[111]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[113]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[114]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[115]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[118]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[119]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[120]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[121]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[122]
#define RD_UNIFORM_MOON_DIR fragmentConstants[123]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[124]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[125]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[126]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[127]
#define RD_UNIFORM_SUN_DIR fragmentConstants[128]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[129]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[130]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[131]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[132]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[133]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[134]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[135]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[136]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[137]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[138]
static float intermediateValue192;
static float intermediateValue193;
static float intermediateValue194;
static float intermediateValue195;
static float intermediateValue196;
static float intermediateValue197;
static float intermediateValue186;
static float intermediateValue187;
static float intermediateValue188;
static float intermediateValue189;
static float intermediateValue190;
static float intermediateValue191;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[139] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 31
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
#define RD_UNIFORM_FOG_COLOR fragmentConstants[47]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[48]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[49]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[50]
#define RD_UNIFORM_LAST_SPECULAR_IBL_IDX fragmentConstants[51]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[52]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[53]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[54]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[55]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[56]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[57]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[58]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[59]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[60]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[61]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[94]
#define RD_UNIFORM_CAUSTICS_PARAMETERS fragmentConstants[95]
#define RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS fragmentConstants[96]
#define RD_UNIFORM_CONVOLUTION_TYPE fragmentConstants[97]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[98]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[99]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[100]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[101]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[102]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[103]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[104]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[106]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[107]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[108]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[109]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[110]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[111]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[112]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[113]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[114]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[115]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[116]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[117]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[120]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[121]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[122]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[123]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[124]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[125]
#define RD_UNIFORM_MOON_DIR fragmentConstants[126]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[127]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[128]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[129]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[130]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[131]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[132]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[133]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[134]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[135]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[136]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[137]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[138]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[139]
#define RD_UNIFORM_SUN_DIR fragmentConstants[140]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[141]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[142]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[143]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[144]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[145]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[146]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[147]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[148]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[149]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[150]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[151]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[152]
static uint intermediateValue44;
static float intermediateValue236;
static float intermediateValue237;
static float intermediateValue238;
static float intermediateValue239;
static float intermediateValue240;
static float intermediateValue241;
static float intermediateValue230;
static float intermediateValue231;
static float intermediateValue232;
static float intermediateValue233;
static float intermediateValue234;
static float intermediateValue235;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[153] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 17 || RD_BINDING_LAYOUT == 18 || RD_BINDING_LAYOUT == 22 || RD_BINDING_LAYOUT == 24 || RD_BINDING_LAYOUT == 3 || RD_BINDING_LAYOUT == 7 || RD_BINDING_LAYOUT == 8
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[4];
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 12 || RD_BINDING_LAYOUT == 14 || RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 5
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
#elif RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 13 || RD_BINDING_LAYOUT == 16 || RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 6 || RD_BINDING_LAYOUT == 9
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
#elif RD_BINDING_LAYOUT == 15 || RD_BINDING_LAYOUT == 20 || RD_BINDING_LAYOUT == 23 || RD_BINDING_LAYOUT == 26 || RD_BINDING_LAYOUT == 28 || RD_BINDING_LAYOUT == 30 || RD_BINDING_LAYOUT == 32 || RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 36 || RD_BINDING_LAYOUT == 37 || RD_BINDING_LAYOUT == 40 || RD_BINDING_LAYOUT == 42
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
#elif RD_BINDING_LAYOUT == 19 || RD_BINDING_LAYOUT == 21 || RD_BINDING_LAYOUT == 25 || RD_BINDING_LAYOUT == 27 || RD_BINDING_LAYOUT == 29 || RD_BINDING_LAYOUT == 31 || RD_BINDING_LAYOUT == 33 || RD_BINDING_LAYOUT == 35 || RD_BINDING_LAYOUT == 38 || RD_BINDING_LAYOUT == 39 || RD_BINDING_LAYOUT == 41 || RD_BINDING_LAYOUT == 43
Texture2D<float4> brdfLutTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t2, space0);
Texture2D<float4> matTexture1Texture : register(t3, space0);
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
SamplerState matTextureSampler : register(s2, space0);
SamplerState matTexture1Sampler : register(s3, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState causticsTextureSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState specularIblRecordsSampler : register(s10, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
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
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
#endif
};
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 17 || RD_BINDING_LAYOUT == 22 || RD_BINDING_LAYOUT == 7
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 12 || RD_BINDING_LAYOUT == 13 || RD_BINDING_LAYOUT == 14 || RD_BINDING_LAYOUT == 15 || RD_BINDING_LAYOUT == 16 || RD_BINDING_LAYOUT == 19 || RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 20 || RD_BINDING_LAYOUT == 21 || RD_BINDING_LAYOUT == 23 || RD_BINDING_LAYOUT == 25 || RD_BINDING_LAYOUT == 26 || RD_BINDING_LAYOUT == 27 || RD_BINDING_LAYOUT == 28 || RD_BINDING_LAYOUT == 29 || RD_BINDING_LAYOUT == 30 || RD_BINDING_LAYOUT == 31 || RD_BINDING_LAYOUT == 32 || RD_BINDING_LAYOUT == 33 || RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 35 || RD_BINDING_LAYOUT == 36 || RD_BINDING_LAYOUT == 37 || RD_BINDING_LAYOUT == 38 || RD_BINDING_LAYOUT == 39 || RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 40 || RD_BINDING_LAYOUT == 41 || RD_BINDING_LAYOUT == 42 || RD_BINDING_LAYOUT == 43 || RD_BINDING_LAYOUT == 5 || RD_BINDING_LAYOUT == 6 || RD_BINDING_LAYOUT == 9
struct FragmentStageOutput
#elif RD_BINDING_LAYOUT == 18 || RD_BINDING_LAYOUT == 24 || RD_BINDING_LAYOUT == 3 || RD_BINDING_LAYOUT == 8
StructuredBuffer<t11_t> sampledResource11 : register(t11);
TextureCubeArray<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[132];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 12 || RD_BINDING_LAYOUT == 13 || RD_BINDING_LAYOUT == 14 || RD_BINDING_LAYOUT == 16 || RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 5 || RD_BINDING_LAYOUT == 6 || RD_BINDING_LAYOUT == 9
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[146];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[133];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
  float4 fragmentVectorConstants1[147];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 15 || RD_BINDING_LAYOUT == 19 || RD_BINDING_LAYOUT == 20 || RD_BINDING_LAYOUT == 21 || RD_BINDING_LAYOUT == 23 || RD_BINDING_LAYOUT == 25 || RD_BINDING_LAYOUT == 26 || RD_BINDING_LAYOUT == 27 || RD_BINDING_LAYOUT == 28 || RD_BINDING_LAYOUT == 29 || RD_BINDING_LAYOUT == 30 || RD_BINDING_LAYOUT == 31
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 17
  float4 fragmentVectorConstants1[138];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 18
  float4 fragmentVectorConstants1[152];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 22
  float4 fragmentVectorConstants1[139];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 24
  float4 fragmentVectorConstants1[153];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 32 || RD_BINDING_LAYOUT == 33 || RD_BINDING_LAYOUT == 34 || RD_BINDING_LAYOUT == 35 || RD_BINDING_LAYOUT == 36 || RD_BINDING_LAYOUT == 37 || RD_BINDING_LAYOUT == 38 || RD_BINDING_LAYOUT == 39 || RD_BINDING_LAYOUT == 40 || RD_BINDING_LAYOUT == 41 || RD_BINDING_LAYOUT == 42 || RD_BINDING_LAYOUT == 43
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
