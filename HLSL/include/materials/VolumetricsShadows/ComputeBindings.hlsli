#define RD_NATIVE_CBUFFER_VECTORS RD_NATIVE_B0_VECTORS
#define RD_NATIVE_CBUFFER_VECTORS RD_NATIVE_B0_VECTORS
// Native resource and stage-interface layouts for VolumetricsShadows / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_0 vertexConstants[4]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_1 vertexConstants[5]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_2 vertexConstants[6]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_3 vertexConstants[7]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 vertexConstants[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[16]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[17]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[18]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[19]
#define RD_UNIFORM_VOLUME_SHADOW_SETTINGS vertexConstants[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS vertexConstants[21]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 vertexConstants[22]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 vertexConstants[23]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 vertexConstants[24]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 vertexConstants[25]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS vertexConstants[26]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE vertexConstants[27]
#define RD_UNIFORM_ND_LFLOOR vertexConstants[28]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET vertexConstants[29]
#define RD_UNIFORM_JITTER_OFFSET vertexConstants[30]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[31]
#define RD_UNIFORM_CASCADES_PER_SET vertexConstants[32]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 vertexConstants[65]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 vertexConstants[66]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 vertexConstants[67]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 vertexConstants[68]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE vertexConstants[69]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 vertexConstants[70]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 vertexConstants[71]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 vertexConstants[72]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 vertexConstants[73]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION vertexConstants[74]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH vertexConstants[75]
#define RD_UNIFORM_TEMPORAL_SETTINGS vertexConstants[76]
#define RD_UNIFORM_VOLUME_NEAR_FAR vertexConstants[77]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[3]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_0 computeVectorConstants0[4]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_1 computeVectorConstants0[5]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_2 computeVectorConstants0[6]
#define RD_UNIFORM_PREV_INV_PROJ_ROW_3 computeVectorConstants0[7]
#define RD_UNIFORM_CASCADES_PARAMETERS_ROW_0 computeVectorConstants0[8]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0 computeVectorConstants0[16]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1 computeVectorConstants0[17]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2 computeVectorConstants0[18]
#define RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3 computeVectorConstants0[19]
#define RD_UNIFORM_VOLUME_SHADOW_SETTINGS computeVectorConstants0[20]
#define RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS computeVectorConstants0[21]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 computeVectorConstants0[22]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 computeVectorConstants0[23]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 computeVectorConstants0[24]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 computeVectorConstants0[25]
#define RD_UNIFORM_QUANTIZATION_PARAMETERS computeVectorConstants0[26]
#define RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE computeVectorConstants0[27]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET computeVectorConstants0[28]
#define RD_UNIFORM_JITTER_OFFSET computeVectorConstants0[29]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[30]
#define RD_UNIFORM_CASCADES_PER_SET computeVectorConstants0[31]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0 computeVectorConstants0[64]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1 computeVectorConstants0[65]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2 computeVectorConstants0[66]
#define RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3 computeVectorConstants0[67]
#define RD_UNIFORM_CLOUD_SHADOWS_VISIBLE computeVectorConstants0[68]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0 computeVectorConstants0[69]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1 computeVectorConstants0[70]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2 computeVectorConstants0[71]
#define RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3 computeVectorConstants0[72]
#define RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION computeVectorConstants0[73]
#define RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH computeVectorConstants0[74]
#define RD_UNIFORM_TEMPORAL_SETTINGS computeVectorConstants0[75]
#define RD_UNIFORM_VOLUME_NEAR_FAR computeVectorConstants0[76]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[78] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 computeVectorConstants0[RD_NATIVE_CBUFFER_VECTORS] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
Texture2DArray<float4> previousCascadedShadowBufferTexture : register(t0, space0);
Texture2DArray<float4> shadowCascadesTexture : register(t1, space0);
RWTexture2DArray<float4> cascadedShadowBufferOutTexture : register(u2, space0);
SamplerState previousCascadedShadowBufferSampler : register(s0, space0);
SamplerState shadowCascadesSampler : register(s1, space0);
#elif RD_BINDING_LAYOUT == 1
Texture2DArray<float4> materialTexture0 : register(t0);
Texture2DArray<float4> materialTexture1 : register(t1);
RWTexture2DArray<float4> intermediateValue2 : register(u2);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
