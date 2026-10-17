// Native resource and stage-interface layouts for ActorMultiTexturePrepass / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[1]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[2]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[1]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[1]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[2]
#define RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED fragmentVectorConstants1[3]
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[11]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[12]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[14]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[15]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[16]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[17]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[18]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[4]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[10]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[11]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[12]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[13]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[14]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[15]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[16]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[17]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[18]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 10
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[12]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[13]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[14]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[15]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[16]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[17]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[18]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[19]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[20]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 11
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[12]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[13]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[14]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[15]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[16]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[18]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[19]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[20]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 12
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[12]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[13]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[14]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[15]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[16]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[17]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[18]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[19]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 13
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[12]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[13]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[14]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[15]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[16]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[17]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[18]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[19]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 14
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[12]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[13]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[14]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[15]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[16]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[17]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[18]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[19]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[20]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 15
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[12]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[13]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[14]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[15]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[16]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[18]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[19]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[20]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 16
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[12]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[13]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[14]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[15]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[16]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[17]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[18]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[19]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[20]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[21]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 17
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[0]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[3]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[4]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[5]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[10]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[11]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[12]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[13]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[14]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[15]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[16]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[17]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[18]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[19]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[20]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[21]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 18
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[19]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[20]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[21]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[22]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[25]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[26]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[27]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[28]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[29]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[30]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[31]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[32]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 19
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[8]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[13]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[17]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[18]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[19]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[20]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[21]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[22]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[25]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[26]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[27]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[28]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[29]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[30]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[31]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[32]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 20
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[12]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[13]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[17]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[18]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[19]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[20]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[21]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[27]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[28]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[29]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[30]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[31]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[32]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[33]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 21
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[12]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[13]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[17]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[18]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[19]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[20]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[21]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[27]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[28]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[29]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[30]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[31]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[32]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[33]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 22
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentConstants[4]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[12]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[13]
#define RD_UNIFORM_OVERLAY_COLOR fragmentConstants[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[17]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[18]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentConstants[19]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[20]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentConstants[21]
#define RD_UNIFORM_COLOR_BASED fragmentConstants[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentConstants[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentConstants[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentConstants[27]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentConstants[28]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentConstants[29]
#define RD_UNIFORM_MAT_COLOR fragmentConstants[30]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentConstants[31]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentConstants[32]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentConstants[33]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentConstants[34]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 23
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_CHANGE_COLOR fragmentVectorConstants1[4]
#define RD_UNIFORM_PBR_TEXTURE_FLAGS fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[9]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[10]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[11]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[12]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[13]
#define RD_UNIFORM_OVERLAY_COLOR fragmentVectorConstants1[14]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[15]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[16]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[17]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[18]
#define RD_UNIFORM_BLOCK_LIGHT_COLOR fragmentVectorConstants1[19]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[20]
#define RD_UNIFORM_ACTOR_FP_EPSILON fragmentVectorConstants1[21]
#define RD_UNIFORM_COLOR_BASED fragmentVectorConstants1[22]
#define RD_UNIFORM_DITHER_PARAMS2_ROW_0 fragmentVectorConstants1[23]
#define RD_UNIFORM_DITHER_PARAMS fragmentVectorConstants1[26]
#define RD_UNIFORM_DITHERING_ENABLED_TOGGLE fragmentVectorConstants1[27]
#define RD_UNIFORM_EMISSIVE_UNIFORM fragmentVectorConstants1[28]
#define RD_UNIFORM_TILE_LIGHT_INTENSITY fragmentVectorConstants1[29]
#define RD_UNIFORM_MAT_COLOR fragmentVectorConstants1[30]
#define RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR fragmentVectorConstants1[31]
#define RD_UNIFORM_METALNESS_UNIFORM fragmentVectorConstants1[32]
#define RD_UNIFORM_ROUGHNESS_UNIFORM fragmentVectorConstants1[33]
#define RD_UNIFORM_SUBSURFACE_UNIFORM fragmentVectorConstants1[34]
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture3 : register(t3);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler3 : register(s3);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
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
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
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
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
SamplerState matTextureSampler : register(s1, space0);
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
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 5 || RD_BINDING_LAYOUT == 7
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
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
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 8
    float4 fragmentConstants[19] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 9
  float4 fragmentVectorConstants1[19];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 10 || RD_BINDING_LAYOUT == 14
    float4 fragmentConstants[21] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 11 || RD_BINDING_LAYOUT == 15
  float4 fragmentVectorConstants1[21];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 12
    float4 fragmentConstants[20] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 13
  float4 fragmentVectorConstants1[20];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 16
    float4 fragmentConstants[22] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#elif RD_BINDING_LAYOUT == 17
  float4 fragmentVectorConstants1[22];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 18
    float4 fragmentConstants[33] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 19
  float4 fragmentVectorConstants1[33];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 20
    float4 fragmentConstants[34] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 21
  float4 fragmentVectorConstants1[34];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 22
    float4 fragmentConstants[35] : packoffset(c0);
};
Texture2D<float4> mersTextureTexture : register(t0, space0);
Texture2D<float4> matTextureTexture : register(t1, space0);
Texture2D<float4> matTexture1Texture : register(t2, space0);
Texture2D<float4> matTexture2Texture : register(t3, space0);
Texture2D<float4> normalTextureTexture : register(t4, space0);
SamplerState mersTextureSampler : register(s0, space0);
SamplerState matTextureSampler : register(s1, space0);
SamplerState matTexture1Sampler : register(s2, space0);
SamplerState matTexture2Sampler : register(s3, space0);
SamplerState normalTextureSampler : register(s4, space0);
static float3 varyingBitangent0;
static float4 varyingColor1;
static float4 varyingColor0;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static uint4 fragmentColor0;
static float4 fragmentColor1;
static float4 fragmentColor2;
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
};
struct FragmentStageOutput
{
    uint4 fragmentColor0 : SV_Target0;
    float4 fragmentColor1 : SV_Target1;
    float4 fragmentColor2 : SV_Target2;
};
#define RD_FRAGMENT_GLOBAL_STORAGE static
#include "../../../../Shared/FragmentControl.h"
#define discard_state isFragmentDiscarded
#elif RD_BINDING_LAYOUT == 23
  float4 fragmentVectorConstants1[35];
}
#define RD_COMPARISON_MASK -
#endif
