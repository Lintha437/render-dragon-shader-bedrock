// Native resource and stage-interface layouts for DeferredWater / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[20]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[21]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[22]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[23]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[24]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[25]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[26]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[27]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[28]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[29]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[30]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[31]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[32]
#define RD_UNIFORM_CAMERA_IS_UNDERWATER fragmentVectorConstants1[33]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[34]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[35]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[36]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[69]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[70]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[71]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[72]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[73]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[74]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[75]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[76]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[77]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[78]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[79]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[80]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[81]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[82]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[83]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[84]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[85]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[86]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[87]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[88]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[89]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[90]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[91]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[92]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[93]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[94]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[95]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[96]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[97]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[98]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[99]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[100]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[101]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[102]
Texture3D<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<uint4> materialTexture3 : register(t3);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[20]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[21]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[22]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[23]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[24]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[25]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[26]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[27]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[28]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[29]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[30]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[31]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[32]
#define RD_UNIFORM_CAMERA_IS_UNDERWATER fragmentConstants[33]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[34]
#define RD_UNIFORM_MOON_DIR fragmentConstants[35]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[36]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[69]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[70]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[71]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[72]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[73]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[74]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[75]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[76]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[77]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[78]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[79]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[80]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[81]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[82]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[83]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[84]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[85]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[86]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[87]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[88]
#define RD_UNIFORM_SUN_DIR fragmentConstants[89]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[90]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[91]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[92]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[93]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[94]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[95]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[96]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[97]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[98]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[99]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[100]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[101]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[102]
static float intermediateValue66;
static float intermediateValue67;
static float intermediateValue68;
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[20]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[21]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[22]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[23]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[24]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[25]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[26]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[27]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[28]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[29]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[30]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentConstants[31]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[32]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[33]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[34]
#define RD_UNIFORM_CAMERA_IS_UNDERWATER fragmentConstants[35]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[36]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[37]
#define RD_UNIFORM_MOON_DIR fragmentConstants[38]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[39]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[72]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[73]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[74]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[75]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[76]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[77]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[78]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[79]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[80]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[81]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[82]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[83]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[84]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[85]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[86]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[87]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[88]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[89]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[90]
#define RD_UNIFORM_IBL_PARAMETERS fragmentConstants[91]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[92]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[93]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[94]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[95]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[96]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[97]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[98]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[99]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[100]
#define RD_UNIFORM_SUN_DIR fragmentConstants[101]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[102]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[103]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[104]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[105]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[106]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[107]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[108]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentConstants[109]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[110]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[111]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[112]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[113]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[114]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[115]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[116]
static uint intermediateValue22;
static float intermediateValue103;
static float intermediateValue104;
static float intermediateValue105;
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[20]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[21]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[22]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[23]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[24]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[25]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[26]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[27]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[28]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[29]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[30]
#define RD_UNIFORM_IBL_SKY_FADE_PARAMETERS fragmentVectorConstants1[31]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[32]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[33]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[34]
#define RD_UNIFORM_CAMERA_IS_UNDERWATER fragmentVectorConstants1[35]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[36]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[37]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[38]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[39]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[72]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[73]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[74]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[75]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[76]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[77]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[78]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[79]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[80]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[81]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[82]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[83]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[84]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[85]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[86]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[87]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[88]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[89]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[90]
#define RD_UNIFORM_IBL_PARAMETERS fragmentVectorConstants1[91]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[92]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[93]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[94]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[95]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[96]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[97]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[98]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[99]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[100]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[101]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[102]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[103]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[104]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[105]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[106]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[107]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[108]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG fragmentVectorConstants1[109]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[110]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[111]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[112]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[113]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[114]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[115]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[116]
struct t16_t {
  float val[32];
};
StructuredBuffer<t16_t> sampledResource16 : register(t16);
struct t15_t {
  float val[1];
};
StructuredBuffer<t15_t> sampledResource15 : register(t15);
Texture3D<float4> materialTexture10 : register(t10);
Texture2DArray<float4> materialTexture9 : register(t9);
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<uint4> materialTexture3 : register(t3);
SamplerState textureSampler10 : register(s10);
SamplerState textureSampler9 : register(s9);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[103];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[103] : packoffset(c0);
};
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t3, space0);
Texture2D<float4> normalTexture : register(t4, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2D<float4> sceneDepthTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t10, space0);
SamplerState normalSampler : register(s4, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState sceneDepthSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState skyAmbientSamplesSampler : register(s10, space0);
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
    float4 fragmentConstants[117] : packoffset(c0);
};
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t3, space0);
Texture2D<float4> normalTexture : register(t4, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t5, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t6, space0);
Texture2D<float4> sceneDepthTexture : register(t7, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t8, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t9, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t10, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T15_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T15_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t15, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T15_WORDS].words[(index) % RD_NATIVE_T15_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t15, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T16_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T16_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t16, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T16_WORDS].words[(index) % RD_NATIVE_T16_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t16, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState normalSampler : register(s4, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s5, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s6, space0);
SamplerState sceneDepthSampler : register(s7, space0);
SamplerState scatteringBufferSampler : register(s8, space0);
SamplerState shadowCascadesSampler : register(s9, space0);
SamplerState skyAmbientSamplesSampler : register(s10, space0);
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
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[117];
}
#define RD_COMPARISON_MASK -
#endif

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_zLightLookupArray
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#endif
#ifndef rdAccess_zLights
#define rdAccess_zLights(index) zLights[index]
#endif
