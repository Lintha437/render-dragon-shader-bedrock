// Native resource and stage-interface layouts for PopulateVolume / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION vertexConstants[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[14]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS vertexConstants[15]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[16]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS vertexConstants[17]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION vertexConstants[18]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[19]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES vertexConstants[20]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION vertexConstants[21]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF vertexConstants[22]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE vertexConstants[23]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES vertexConstants[24]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES vertexConstants[25]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G vertexConstants[26]
#define RD_UNIFORM_MIN_AMBIENT_VALUE vertexConstants[27]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA vertexConstants[28]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[29]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG vertexConstants[30]
#define RD_UNIFORM_VOLUME_NEAR_FAR vertexConstants[31]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION vertexConstants[32]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION computeVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 computeVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 computeVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 computeVectorConstants0[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 computeVectorConstants0[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 computeVectorConstants0[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 computeVectorConstants0[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION computeVectorConstants0[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[14]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS computeVectorConstants0[15]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[16]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS computeVectorConstants0[17]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION computeVectorConstants0[18]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL computeVectorConstants0[19]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES computeVectorConstants0[20]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION computeVectorConstants0[21]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF computeVectorConstants0[22]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE computeVectorConstants0[23]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES computeVectorConstants0[24]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES computeVectorConstants0[25]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G computeVectorConstants0[26]
#define RD_UNIFORM_MIN_AMBIENT_VALUE computeVectorConstants0[27]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA computeVectorConstants0[28]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[29]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG computeVectorConstants0[30]
#define RD_UNIFORM_VOLUME_NEAR_FAR computeVectorConstants0[31]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION computeVectorConstants0[32]
static float intermediateValue22;
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION vertexConstants[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[14]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED vertexConstants[15]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE vertexConstants[16]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS vertexConstants[17]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[18]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS vertexConstants[19]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION vertexConstants[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[21]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES vertexConstants[22]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION vertexConstants[23]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS vertexConstants[24]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF vertexConstants[25]
#define RD_UNIFORM_CLUSTER_DIMENSIONS vertexConstants[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE vertexConstants[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES vertexConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES vertexConstants[29]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G vertexConstants[30]
#define RD_UNIFORM_MIN_AMBIENT_VALUE vertexConstants[31]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW vertexConstants[32]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED vertexConstants[33]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES vertexConstants[34]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 vertexConstants[35]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 vertexConstants[36]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 vertexConstants[37]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 vertexConstants[38]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION vertexConstants[39]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA vertexConstants[40]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[41]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG vertexConstants[42]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR vertexConstants[43]
#define RD_UNIFORM_VOLUME_NEAR_FAR vertexConstants[44]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED vertexConstants[45]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION vertexConstants[46]
static uint intermediateValue12;
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION computeVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 computeVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 computeVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 computeVectorConstants0[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 computeVectorConstants0[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 computeVectorConstants0[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 computeVectorConstants0[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION computeVectorConstants0[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[14]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED computeVectorConstants0[15]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE computeVectorConstants0[16]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS computeVectorConstants0[17]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[18]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS computeVectorConstants0[19]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION computeVectorConstants0[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL computeVectorConstants0[21]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES computeVectorConstants0[22]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION computeVectorConstants0[23]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS computeVectorConstants0[24]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF computeVectorConstants0[25]
#define RD_UNIFORM_CLUSTER_DIMENSIONS computeVectorConstants0[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE computeVectorConstants0[27]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES computeVectorConstants0[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES computeVectorConstants0[29]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G computeVectorConstants0[30]
#define RD_UNIFORM_MIN_AMBIENT_VALUE computeVectorConstants0[31]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW computeVectorConstants0[32]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED computeVectorConstants0[33]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES computeVectorConstants0[34]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 computeVectorConstants0[35]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 computeVectorConstants0[36]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 computeVectorConstants0[37]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 computeVectorConstants0[38]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION computeVectorConstants0[39]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA computeVectorConstants0[40]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[41]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG computeVectorConstants0[42]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR computeVectorConstants0[43]
#define RD_UNIFORM_VOLUME_NEAR_FAR computeVectorConstants0[44]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED computeVectorConstants0[45]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION computeVectorConstants0[46]
static float intermediateValue22;
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION vertexConstants[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[14]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY vertexConstants[15]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS vertexConstants[16]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[17]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS vertexConstants[18]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION vertexConstants[19]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[20]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES vertexConstants[21]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION vertexConstants[22]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF vertexConstants[23]
#define RD_UNIFORM_WORLD_ORIGIN vertexConstants[24]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE vertexConstants[25]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES vertexConstants[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES vertexConstants[27]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED vertexConstants[28]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G vertexConstants[29]
#define RD_UNIFORM_MIN_AMBIENT_VALUE vertexConstants[30]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA vertexConstants[31]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[32]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG vertexConstants[33]
#define RD_UNIFORM_VOLUME_NEAR_FAR vertexConstants[34]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION vertexConstants[35]
static float intermediateValue63;
static float intermediateValue64;
static float intermediateValue65;
static float intermediateValue66;
static float intermediateValue67;
static float intermediateValue68;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION computeVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 computeVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 computeVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 computeVectorConstants0[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 computeVectorConstants0[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 computeVectorConstants0[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 computeVectorConstants0[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION computeVectorConstants0[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[14]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY computeVectorConstants0[15]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS computeVectorConstants0[16]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[17]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS computeVectorConstants0[18]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION computeVectorConstants0[19]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL computeVectorConstants0[20]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES computeVectorConstants0[21]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION computeVectorConstants0[22]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF computeVectorConstants0[23]
#define RD_UNIFORM_WORLD_ORIGIN computeVectorConstants0[24]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE computeVectorConstants0[25]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES computeVectorConstants0[26]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES computeVectorConstants0[27]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED computeVectorConstants0[28]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G computeVectorConstants0[29]
#define RD_UNIFORM_MIN_AMBIENT_VALUE computeVectorConstants0[30]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA computeVectorConstants0[31]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[32]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG computeVectorConstants0[33]
#define RD_UNIFORM_VOLUME_NEAR_FAR computeVectorConstants0[34]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION computeVectorConstants0[35]
static float intermediateValue22;
static const uint3 intermediateValue10[73] = { uint3(0u, 0u, 1u), uint3(0u, 0u, 1u), uint3(0u, 1u, 0u), uint3(0u, 1u, 0u), uint3(1u, 0u, 0u), uint3(1u, 0u, 0u), uint3(0u, 1u, 0u), uint3(1u, 0u, 0u), uint3(1u, 0u, 4294967295u), uint3(0u, 1u, 2u), uint3(0u, 1u, 3u), uint3(1u, 1u, 4294967295u), uint3(1u, 1u, 0u), uint3(0u, 0u, 6u), uint3(0u, 0u, 7u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 1u), uint3(0u, 0u, 10u), uint3(0u, 0u, 11u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4u), uint3(0u, 0u, 14u), uint3(0u, 0u, 16u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 8u), uint3(0u, 0u, 18u), uint3(0u, 0u, 20u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 12u), uint3(0u, 0u, 22u), uint3(0u, 0u, 24u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 5u), uint3(0u, 0u, 15u), uint3(0u, 0u, 17u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 9u), uint3(0u, 0u, 19u), uint3(0u, 0u, 21u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 13u), uint3(0u, 0u, 23u), uint3(0u, 0u, 25u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 0u) };
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION vertexConstants[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[14]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED vertexConstants[15]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY vertexConstants[16]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE vertexConstants[17]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS vertexConstants[18]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[19]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS vertexConstants[20]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION vertexConstants[21]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES vertexConstants[23]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION vertexConstants[24]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS vertexConstants[25]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF vertexConstants[26]
#define RD_UNIFORM_WORLD_ORIGIN vertexConstants[27]
#define RD_UNIFORM_CLUSTER_DIMENSIONS vertexConstants[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE vertexConstants[29]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES vertexConstants[30]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES vertexConstants[31]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED vertexConstants[32]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G vertexConstants[33]
#define RD_UNIFORM_MIN_AMBIENT_VALUE vertexConstants[34]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW vertexConstants[35]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED vertexConstants[36]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES vertexConstants[37]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 vertexConstants[38]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 vertexConstants[39]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 vertexConstants[40]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 vertexConstants[41]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION vertexConstants[42]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA vertexConstants[43]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY vertexConstants[44]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG vertexConstants[45]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR vertexConstants[46]
#define RD_UNIFORM_VOLUME_NEAR_FAR vertexConstants[47]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED vertexConstants[48]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION vertexConstants[49]
static uint intermediateValue31;
static float intermediateValue97;
static float intermediateValue98;
static float intermediateValue99;
static float intermediateValue100;
static float intermediateValue101;
static float intermediateValue102;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[3]
#define RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION computeVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 computeVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 computeVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 computeVectorConstants0[7]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 computeVectorConstants0[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 computeVectorConstants0[9]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 computeVectorConstants0[10]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[11]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[12]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION computeVectorConstants0[13]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[14]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED computeVectorConstants0[15]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY computeVectorConstants0[16]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE computeVectorConstants0[17]
#define RD_UNIFORM_BIOME_BLENDING_PARAMETERS computeVectorConstants0[18]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[19]
#define RD_UNIFORM_HEIGHT_FOG_SCALE_BIAS computeVectorConstants0[20]
#define RD_UNIFORM_AIR_ALBEDO_EXTINCTION computeVectorConstants0[21]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL computeVectorConstants0[22]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES computeVectorConstants0[23]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION computeVectorConstants0[24]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS computeVectorConstants0[25]
#define RD_UNIFORM_CAMERA_UNDERWATER_AND_WATER_SURFACE_BIAS_AND_FALLOFF computeVectorConstants0[26]
#define RD_UNIFORM_WORLD_ORIGIN computeVectorConstants0[27]
#define RD_UNIFORM_CLUSTER_DIMENSIONS computeVectorConstants0[28]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE computeVectorConstants0[29]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES computeVectorConstants0[30]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES computeVectorConstants0[31]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED computeVectorConstants0[32]
#define RD_UNIFORM_HENYEY_GREENSTEIN_G computeVectorConstants0[33]
#define RD_UNIFORM_MIN_AMBIENT_VALUE computeVectorConstants0[34]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW computeVectorConstants0[35]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED computeVectorConstants0[36]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES computeVectorConstants0[37]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 computeVectorConstants0[38]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 computeVectorConstants0[39]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 computeVectorConstants0[40]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 computeVectorConstants0[41]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION computeVectorConstants0[42]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA computeVectorConstants0[43]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY computeVectorConstants0[44]
#define RD_UNIFORM_SKY_SAMPLES_CONFIG computeVectorConstants0[45]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR computeVectorConstants0[46]
#define RD_UNIFORM_VOLUME_NEAR_FAR computeVectorConstants0[47]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED computeVectorConstants0[48]
#define RD_UNIFORM_WATER_ALBEDO_EXTINCTION computeVectorConstants0[49]
static float intermediateValue25;
static const uint3 intermediateValue14[73] = { uint3(0u, 0u, 1u), uint3(0u, 0u, 1u), uint3(0u, 1u, 0u), uint3(0u, 1u, 0u), uint3(1u, 0u, 0u), uint3(1u, 0u, 0u), uint3(0u, 1u, 0u), uint3(1u, 0u, 0u), uint3(1u, 0u, 4294967295u), uint3(0u, 1u, 2u), uint3(0u, 1u, 3u), uint3(1u, 1u, 4294967295u), uint3(1u, 1u, 0u), uint3(0u, 0u, 6u), uint3(0u, 0u, 7u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 1u), uint3(0u, 0u, 10u), uint3(0u, 0u, 11u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4u), uint3(0u, 0u, 14u), uint3(0u, 0u, 16u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 8u), uint3(0u, 0u, 18u), uint3(0u, 0u, 20u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 12u), uint3(0u, 0u, 22u), uint3(0u, 0u, 24u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 5u), uint3(0u, 0u, 15u), uint3(0u, 0u, 17u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 9u), uint3(0u, 0u, 19u), uint3(0u, 0u, 21u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 13u), uint3(0u, 0u, 23u), uint3(0u, 0u, 25u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 4294967295u), uint3(0u, 0u, 0u) };
cbuffer ComputeVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[33] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 computeVectorConstants0[33] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[47] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 3
    float4 computeVectorConstants0[47] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 4
    float4 vertexConstants[36] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 5
    float4 computeVectorConstants0[36] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 6
    float4 vertexConstants[50] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 7
    float4 computeVectorConstants0[50] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> screenSpaceWaterBackFaceDepthAndNormalTexture : register(t4, space0);
Texture2D<float4> screenSpaceWaterFrontFaceDepthAndNormalTexture : register(t5, space0);
Texture2DArray<float4> cascadedShadowBufferTexture : register(t7, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t9, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
RWTexture2DArray<float4> scatteringBufferOutTexture : register(u8, space0);
SamplerState skyAmbientSamplesSampler : register(s9, space0);
#elif RD_BINDING_LAYOUT == 1
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture3D<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue5 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue5> intermediateValue5 : register(t13);
#define rdAccess_intermediateValue5(index) intermediateValue5[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue5(uint wordIndex) { return uint4(rdAccess_intermediateValue5(wordIndex), rdAccess_intermediateValue5(wordIndex + 1u), rdAccess_intermediateValue5(wordIndex + 2u), rdAccess_intermediateValue5(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue5 : register(t13);
#define rdAccess_intermediateValue5(index) intermediateValue5[index]
#define rdLoad_intermediateValue5(index) intermediateValue5.Load(index)
#endif
RWTexture2DArray<float4> intermediateValue6 : register(u8);
SamplerState textureSampler9 : register(s9);
#elif RD_BINDING_LAYOUT == 2
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> screenSpaceWaterBackFaceDepthAndNormalTexture : register(t4, space0);
Texture2D<float4> screenSpaceWaterFrontFaceDepthAndNormalTexture : register(t5, space0);
Texture2DArray<float4> cascadedShadowBufferTexture : register(t7, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t9, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t14, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t14, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T15_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T15_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t15, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T15_WORDS].words[(index) % RD_NATIVE_T15_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t15, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
RWTexture2DArray<float4> scatteringBufferOutTexture : register(u8, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState skyAmbientSamplesSampler : register(s9, space0);
#elif RD_BINDING_LAYOUT == 3
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture3D<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue6 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue6> intermediateValue6 : register(t13);
#define rdAccess_intermediateValue6(index) intermediateValue6[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue6(uint wordIndex) { return uint4(rdAccess_intermediateValue6(wordIndex), rdAccess_intermediateValue6(wordIndex + 1u), rdAccess_intermediateValue6(wordIndex + 2u), rdAccess_intermediateValue6(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue6 : register(t13);
#define rdAccess_intermediateValue6(index) intermediateValue6[index]
#define rdLoad_intermediateValue6(index) intermediateValue6.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_intermediateValue7 { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue7> intermediateValue7 : register(t14);
#define rdAccess_intermediateValue7(index) intermediateValue7[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_intermediateValue7(uint wordIndex) { return uint4(rdAccess_intermediateValue7(wordIndex), rdAccess_intermediateValue7(wordIndex + 1u), rdAccess_intermediateValue7(wordIndex + 2u), rdAccess_intermediateValue7(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue7 : register(t14);
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#define rdLoad_intermediateValue7(index) intermediateValue7.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T15_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T15_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t15);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T15_WORDS].words[(index) % RD_NATIVE_T15_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t15);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
RWTexture2DArray<float4> intermediateValue9 : register(u8);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler9 : register(s9);
#elif RD_BINDING_LAYOUT == 4
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> screenSpaceWaterBackFaceDepthAndNormalTexture : register(t4, space0);
Texture2D<float4> screenSpaceWaterFrontFaceDepthAndNormalTexture : register(t5, space0);
Texture2DArray<float4> cascadedShadowBufferTexture : register(t7, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t9, space0);
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
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
RWTexture2DArray<float4> scatteringBufferOutTexture : register(u8, space0);
SamplerState skyAmbientSamplesSampler : register(s9, space0);
#elif RD_BINDING_LAYOUT == 5
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture3D<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue5 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue5> intermediateValue5 : register(t11);
#define rdAccess_intermediateValue5(index) intermediateValue5[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue5(uint wordIndex) { return uint4(rdAccess_intermediateValue5(wordIndex), rdAccess_intermediateValue5(wordIndex + 1u), rdAccess_intermediateValue5(wordIndex + 2u), rdAccess_intermediateValue5(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue5 : register(t11);
#define rdAccess_intermediateValue5(index) intermediateValue5[index]
#define rdLoad_intermediateValue5(index) intermediateValue5.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue6 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue6> intermediateValue6 : register(t12);
#define rdAccess_intermediateValue6(index) intermediateValue6[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue6(uint wordIndex) { return uint4(rdAccess_intermediateValue6(wordIndex), rdAccess_intermediateValue6(wordIndex + 1u), rdAccess_intermediateValue6(wordIndex + 2u), rdAccess_intermediateValue6(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue6 : register(t12);
#define rdAccess_intermediateValue6(index) intermediateValue6[index]
#define rdLoad_intermediateValue6(index) intermediateValue6.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue7 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue7> intermediateValue7 : register(t13);
#define rdAccess_intermediateValue7(index) intermediateValue7[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue7(uint wordIndex) { return uint4(rdAccess_intermediateValue7(wordIndex), rdAccess_intermediateValue7(wordIndex + 1u), rdAccess_intermediateValue7(wordIndex + 2u), rdAccess_intermediateValue7(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue7 : register(t13);
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#define rdLoad_intermediateValue7(index) intermediateValue7.Load(index)
#endif
RWTexture2DArray<float4> intermediateValue8 : register(u8);
SamplerState textureSampler9 : register(s9);
#elif RD_BINDING_LAYOUT == 6
Texture2D<float4> biomeBlendingMapTexture : register(t0, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t2, space0);
Texture2D<float4> screenSpaceWaterBackFaceDepthAndNormalTexture : register(t4, space0);
Texture2D<float4> screenSpaceWaterFrontFaceDepthAndNormalTexture : register(t5, space0);
Texture2DArray<float4> cascadedShadowBufferTexture : register(t7, space0);
Texture3D<float4> skyAmbientSamplesTexture : register(t9, space0);
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
struct RdNativeElement_zBiomeInfoBuffer { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zBiomeInfoBuffer> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zBiomeInfoBuffer(uint wordIndex) { return uint4(rdAccess_zBiomeInfoBuffer(wordIndex), rdAccess_zBiomeInfoBuffer(wordIndex + 1u), rdAccess_zBiomeInfoBuffer(wordIndex + 2u), rdAccess_zBiomeInfoBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> zBiomeInfoBuffer : register(t13, space0);
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#define rdLoad_zBiomeInfoBuffer(index) zBiomeInfoBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t14, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t14, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T15_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T15_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t15, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T15_WORDS].words[(index) % RD_NATIVE_T15_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t15, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
RWTexture2DArray<float4> scatteringBufferOutTexture : register(u8, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s2, space0);
SamplerState skyAmbientSamplesSampler : register(s9, space0);
#elif RD_BINDING_LAYOUT == 7
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture5 : register(t5);
Texture2DArray<float4> materialTexture7 : register(t7);
Texture3D<float4> materialTexture9 : register(t9);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T11_WORDS)
struct RdNativeElement_intermediateValue6 { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue6> intermediateValue6 : register(t11);
#define rdAccess_intermediateValue6(index) intermediateValue6[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_intermediateValue6(uint wordIndex) { return uint4(rdAccess_intermediateValue6(wordIndex), rdAccess_intermediateValue6(wordIndex + 1u), rdAccess_intermediateValue6(wordIndex + 2u), rdAccess_intermediateValue6(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue6 : register(t11);
#define rdAccess_intermediateValue6(index) intermediateValue6[index]
#define rdLoad_intermediateValue6(index) intermediateValue6.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_intermediateValue7 { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue7> intermediateValue7 : register(t12);
#define rdAccess_intermediateValue7(index) intermediateValue7[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_intermediateValue7(uint wordIndex) { return uint4(rdAccess_intermediateValue7(wordIndex), rdAccess_intermediateValue7(wordIndex + 1u), rdAccess_intermediateValue7(wordIndex + 2u), rdAccess_intermediateValue7(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue7 : register(t12);
#define rdAccess_intermediateValue7(index) intermediateValue7[index]
#define rdLoad_intermediateValue7(index) intermediateValue7.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_intermediateValue8 { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue8> intermediateValue8 : register(t13);
#define rdAccess_intermediateValue8(index) intermediateValue8[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_intermediateValue8(uint wordIndex) { return uint4(rdAccess_intermediateValue8(wordIndex), rdAccess_intermediateValue8(wordIndex + 1u), rdAccess_intermediateValue8(wordIndex + 2u), rdAccess_intermediateValue8(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue8 : register(t13);
#define rdAccess_intermediateValue8(index) intermediateValue8[index]
#define rdLoad_intermediateValue8(index) intermediateValue8.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T14_WORDS)
struct RdNativeElement_intermediateValue9 { uint words[RD_NATIVE_T14_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue9> intermediateValue9 : register(t14);
#define rdAccess_intermediateValue9(index) intermediateValue9[(index) / RD_NATIVE_T14_WORDS].words[(index) % RD_NATIVE_T14_WORDS]
uint4 rdLoad_intermediateValue9(uint wordIndex) { return uint4(rdAccess_intermediateValue9(wordIndex), rdAccess_intermediateValue9(wordIndex + 1u), rdAccess_intermediateValue9(wordIndex + 2u), rdAccess_intermediateValue9(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue9 : register(t14);
#define rdAccess_intermediateValue9(index) intermediateValue9[index]
#define rdLoad_intermediateValue9(index) intermediateValue9.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T15_WORDS)
struct RdNativeElement_intermediateValue10 { uint words[RD_NATIVE_T15_WORDS]; };
StructuredBuffer<RdNativeElement_intermediateValue10> intermediateValue10 : register(t15);
#define rdAccess_intermediateValue10(index) intermediateValue10[(index) / RD_NATIVE_T15_WORDS].words[(index) % RD_NATIVE_T15_WORDS]
uint4 rdLoad_intermediateValue10(uint wordIndex) { return uint4(rdAccess_intermediateValue10(wordIndex), rdAccess_intermediateValue10(wordIndex + 1u), rdAccess_intermediateValue10(wordIndex + 2u), rdAccess_intermediateValue10(wordIndex + 3u)); }
#else
Buffer<uint4> intermediateValue10 : register(t15);
#define rdAccess_intermediateValue10(index) intermediateValue10[index]
#define rdLoad_intermediateValue10(index) intermediateValue10.Load(index)
#endif
RWTexture2DArray<float4> intermediateValue11 : register(u8);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler9 : register(s9);
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};

// Fallback indexing for configuration-local arrays.
#ifndef rdAccess_gpuEntryBuffer
#define rdAccess_gpuEntryBuffer(index) gpuEntryBuffer[index]
#endif
#ifndef rdAccess_intermediateValue10
#define rdAccess_intermediateValue10(index) intermediateValue10[index]
#endif
#ifndef rdAccess_intermediateValue5
#define rdAccess_intermediateValue5(index) intermediateValue5[index]
#endif
#ifndef rdAccess_intermediateValue6
#define rdAccess_intermediateValue6(index) intermediateValue6[index]
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
#ifndef rdAccess_voxelBuffer
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#endif
#ifndef rdAccess_zBiomeInfoBuffer
#define rdAccess_zBiomeInfoBuffer(index) zBiomeInfoBuffer[index]
#endif
#ifndef rdAccess_zLightLookupArray
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#endif
#ifndef rdAccess_zLights
#define rdAccess_zLights(index) zLights[index]
#endif
