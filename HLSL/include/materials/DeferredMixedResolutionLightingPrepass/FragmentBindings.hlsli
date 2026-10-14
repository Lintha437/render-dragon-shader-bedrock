// Native resource and stage-interface layouts for DeferredMixedResolutionLightingPrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[0]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[1]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[2]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[3]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[4]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[5]
cbuffer fragmentUniformBuffer : register(b1, space0)
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
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 fragmentConstants[44]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentConstants[52]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[53]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentConstants[54]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[55]
#define RD_UNIFORM_ND_LFLOOR fragmentConstants[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentConstants[57]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[90]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentConstants[91]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentConstants[92]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentConstants[93]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentConstants[94]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentConstants[95]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[96]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[97]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[98]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentConstants[99]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentConstants[100]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentConstants[101]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentConstants[102]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentConstants[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentConstants[104]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentConstants[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[106]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[107]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[108]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentConstants[109]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[110]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[111]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
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
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS fragmentVectorConstants1[52]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[53]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION fragmentVectorConstants1[54]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[55]
#define RD_UNIFORM_ND_LFLOOR fragmentVectorConstants1[56]
#define RD_UNIFORM_CASCADES_PER_SET fragmentVectorConstants1[57]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[90]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[91]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[92]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[93]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[94]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE fragmentVectorConstants1[95]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[96]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[97]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[98]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES fragmentVectorConstants1[99]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 fragmentVectorConstants1[100]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 fragmentVectorConstants1[101]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 fragmentVectorConstants1[102]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 fragmentVectorConstants1[103]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION fragmentVectorConstants1[104]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION fragmentVectorConstants1[105]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[106]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[107]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[108]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH fragmentVectorConstants1[109]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[110]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[111]
Texture2DArray<float4> materialTexture8 : register(t8);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler8 : register(s8);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[17]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[18]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[19]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[20]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[21]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[22]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[23]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[24]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[25]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[26]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[27]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[28]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[29]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[30]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[31]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[32]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[33]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[34]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[35]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[36]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[37]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[38]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[39]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[40]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[41]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[42]
struct t13_t {
  float val[32];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[0]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[1]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[2]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[3]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[4]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[5]
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[17]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[18]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[19]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[20]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[21]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[22]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[23]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[24]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[25]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[26]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[27]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[28]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[29]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[30]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[31]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[32]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[33]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[34]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[35]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[36]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[37]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[38]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[39]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[40]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[41]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[42]
static uint intermediateValue25;
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[8]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[9]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[10]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[11]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[12]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[13]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[14]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[15]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[16]
static float intermediateValue112;
static float intermediateValue113;
static float intermediateValue114;
static float intermediateValue115;
static float intermediateValue116;
static float intermediateValue117;
static float intermediateValue106;
static float intermediateValue107;
static float intermediateValue108;
static float intermediateValue109;
static float intermediateValue110;
static float intermediateValue111;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[8]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[9]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[10]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[11]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[12]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[13]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[14]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[15]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[16]
struct t11_t {
  float val[1];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[4];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentConstants[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[16]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentConstants[17]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentConstants[18]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[19]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentConstants[20]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentConstants[21]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentConstants[22]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentConstants[23]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[24]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentConstants[25]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[26]
#define RD_UNIFORM_WORLD_ORIGIN fragmentConstants[27]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentConstants[28]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[29]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[30]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[31]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentConstants[32]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentConstants[33]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentConstants[34]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentConstants[35]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentConstants[36]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentConstants[37]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentConstants[38]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentConstants[39]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentConstants[40]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[41]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentConstants[42]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentConstants[43]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentConstants[44]
static uint intermediateValue35;
static float intermediateValue174;
static float intermediateValue175;
static float intermediateValue176;
static float intermediateValue177;
static float intermediateValue178;
static float intermediateValue179;
static float intermediateValue168;
static float intermediateValue169;
static float intermediateValue170;
static float intermediateValue171;
static float intermediateValue172;
static float intermediateValue173;
static const uint intermediateValue[64] = { 4294967295u, 2u, 3u, 4294967295u, 0u, 6u, 7u, 4294967295u, 1u, 10u, 11u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4u, 14u, 16u, 4294967295u, 8u, 18u, 20u, 4294967295u, 12u, 22u, 24u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 5u, 15u, 17u, 4294967295u, 9u, 19u, 21u, 4294967295u, 13u, 23u, 25u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u, 4294967295u };
static const uint intermediateValue1[24] = { 0u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 1u, 0u, 0u, 1u, 0u, 0u, 0u, 1u, 0u, 1u, 0u, 0u };
static const uint intermediateValue2[24] = { 0u, 1u, 1u, 1u, 0u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u, 1u, 1u, 1u, 0u, 1u, 1u, 0u };
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[13]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[14]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[15]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[16]
#define RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION fragmentVectorConstants1[17]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS fragmentVectorConstants1[18]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[19]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED fragmentVectorConstants1[20]
#define RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED fragmentVectorConstants1[21]
#define RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY fragmentVectorConstants1[22]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE fragmentVectorConstants1[23]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[24]
#define RD_UNIFORM_CLUSTER_DEPTH_BOUNDS fragmentVectorConstants1[25]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentVectorConstants1[26]
#define RD_UNIFORM_WORLD_ORIGIN fragmentVectorConstants1[27]
#define RD_UNIFORM_CLUSTER_DIMENSIONS fragmentVectorConstants1[28]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[29]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[30]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[31]
#define RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES fragmentVectorConstants1[32]
#define RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW fragmentVectorConstants1[33]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0 fragmentVectorConstants1[34]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1 fragmentVectorConstants1[35]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2 fragmentVectorConstants1[36]
#define RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3 fragmentVectorConstants1[37]
#define RD_UNIFORM_POINT_LIGHT_ND_LFLOOR fragmentVectorConstants1[38]
#define RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS fragmentVectorConstants1[39]
#define RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION fragmentVectorConstants1[40]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[41]
#define RD_UNIFORM_SUB_PIXEL_OFFSET fragmentVectorConstants1[42]
#define RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE fragmentVectorConstants1[43]
#define RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR fragmentVectorConstants1[44]
struct t13_t {
  float val[32];
};
StructuredBuffer<t13_t> sampledResource13 : register(t13);
struct t12_t {
  float val[1];
};
StructuredBuffer<t12_t> sampledResource12 : register(t12);
struct t11_t {
  float val[1];
};
StructuredBuffer<t11_t> sampledResource11 : register(t11);
struct t10_t {
  float val[4];
};
StructuredBuffer<t10_t> sampledResource10 : register(t10);
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[6] : packoffset(c0);
};
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> sceneDepthTexture : register(t6, space0);
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState sceneDepthSampler : register(s6, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[112] : packoffset(c0);
};
Texture2D<float4> causticsMultiplierTexture : register(t0, space0);
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> sceneDepthTexture : register(t6, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t8, space0);
SamplerState causticsMultiplierSampler : register(s0, space0);
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState sceneDepthSampler : register(s6, space0);
SamplerState shadowCascadesSampler : register(s8, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
static float4 fragmentColor1;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
};
#elif RD_BINDING_LAYOUT == 2
  float4 fragmentVectorConstants1[112];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[43];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
  float4 fragmentVectorConstants1[6];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
    float4 fragmentConstants[43] : packoffset(c0);
};
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t4, space0);
Texture2D<float4> sceneDepthTexture : register(t6, space0);
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t12, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t12, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t13, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t13, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s4, space0);
SamplerState sceneDepthSampler : register(s6, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[17] : packoffset(c0);
};
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> sceneDepthTexture : register(t6, space0);
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
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t11, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t11, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState sceneDepthSampler : register(s6, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[17];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 8
    float4 fragmentConstants[45] : packoffset(c0);
};
Texture2D<float4> colorMetalnessSubsurfaceTexture : register(t1, space0);
Texture2D<uint4> emissiveAmbientLinearRoughnessTexture : register(t2, space0);
Texture2D<float4> normalTexture : register(t3, space0);
Texture2D<float4> pointLightShadowTextureAtlasTexture : register(t4, space0);
Texture2D<float4> sceneDepthTexture : register(t6, space0);
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
struct RdNativeElement_voxelBuffer { uint words[RD_NATIVE_T11_WORDS]; };
StructuredBuffer<RdNativeElement_voxelBuffer> voxelBuffer : register(t11, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[(index) / RD_NATIVE_T11_WORDS].words[(index) % RD_NATIVE_T11_WORDS]
uint4 rdLoad_voxelBuffer(uint wordIndex) { return uint4(rdAccess_voxelBuffer(wordIndex), rdAccess_voxelBuffer(wordIndex + 1u), rdAccess_voxelBuffer(wordIndex + 2u), rdAccess_voxelBuffer(wordIndex + 3u)); }
#else
Buffer<uint4> voxelBuffer : register(t11, space0);
#define rdAccess_voxelBuffer(index) voxelBuffer[index]
#define rdLoad_voxelBuffer(index) voxelBuffer.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T12_WORDS)
struct RdNativeElement_zLightLookupArray { uint words[RD_NATIVE_T12_WORDS]; };
StructuredBuffer<RdNativeElement_zLightLookupArray> zLightLookupArray : register(t12, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[(index) / RD_NATIVE_T12_WORDS].words[(index) % RD_NATIVE_T12_WORDS]
uint4 rdLoad_zLightLookupArray(uint wordIndex) { return uint4(rdAccess_zLightLookupArray(wordIndex), rdAccess_zLightLookupArray(wordIndex + 1u), rdAccess_zLightLookupArray(wordIndex + 2u), rdAccess_zLightLookupArray(wordIndex + 3u)); }
#else
Buffer<uint4> zLightLookupArray : register(t12, space0);
#define rdAccess_zLightLookupArray(index) zLightLookupArray[index]
#define rdLoad_zLightLookupArray(index) zLightLookupArray.Load(index)
#endif
// Native structured-buffer ABI restored from original reflection.
#if defined(RD_NATIVE_T13_WORDS)
struct RdNativeElement_zLights { uint words[RD_NATIVE_T13_WORDS]; };
StructuredBuffer<RdNativeElement_zLights> zLights : register(t13, space0);
#define rdAccess_zLights(index) zLights[(index) / RD_NATIVE_T13_WORDS].words[(index) % RD_NATIVE_T13_WORDS]
uint4 rdLoad_zLights(uint wordIndex) { return uint4(rdAccess_zLights(wordIndex), rdAccess_zLights(wordIndex + 1u), rdAccess_zLights(wordIndex + 2u), rdAccess_zLights(wordIndex + 3u)); }
#else
Buffer<uint4> zLights : register(t13, space0);
#define rdAccess_zLights(index) zLights[index]
#define rdLoad_zLights(index) zLights.Load(index)
#endif
SamplerState colorMetalnessSubsurfaceSampler : register(s1, space0);
SamplerState normalSampler : register(s3, space0);
SamplerState pointLightShadowTextureAtlasSampler : register(s4, space0);
SamplerState sceneDepthSampler : register(s6, space0);
static float3 varyingColor1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
struct FragmentStageInput
{
    float3 varyingColor1 : COLOR1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 9
  float4 fragmentVectorConstants1[45];
}
#define RD_COMPARISON_MASK -
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
