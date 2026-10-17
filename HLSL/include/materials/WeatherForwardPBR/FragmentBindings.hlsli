// Native resource and stage-interface layouts for WeatherForwardPBR / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentVectorConstants1[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentVectorConstants1[13]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentVectorConstants1[14]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentVectorConstants1[15]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[28]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentVectorConstants1[29]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentVectorConstants1[30]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentVectorConstants1[31]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentVectorConstants1[32]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentVectorConstants1[33]
#define RD_UNIFORM_FOG_COLOR fragmentVectorConstants1[34]
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentVectorConstants1[35]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentVectorConstants1[36]
#define RD_UNIFORM_MOON_DIR fragmentVectorConstants1[37]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentVectorConstants1[38]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentVectorConstants1[39]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentVectorConstants1[40]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentVectorConstants1[41]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentVectorConstants1[42]
#define RD_UNIFORM_MOON_COLOR fragmentVectorConstants1[43]
#define RD_UNIFORM_SUN_DIR fragmentVectorConstants1[44]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[45]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentVectorConstants1[46]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentVectorConstants1[47]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentVectorConstants1[48]
#define RD_UNIFORM_SUN_COLOR fragmentVectorConstants1[49]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentVectorConstants1[50]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentVectorConstants1[51]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentVectorConstants1[52]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentVectorConstants1[53]
Texture2DArray<float4> materialTexture7 : register(t7);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler7 : register(s7);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[28]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[29]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[30]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[31]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[32]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[33]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[34]
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentConstants[35]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[36]
#define RD_UNIFORM_CAMERA_LIGHT_INTENSITY fragmentConstants[37]
#define RD_UNIFORM_MOON_DIR fragmentConstants[38]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[39]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[40]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[41]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[42]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[43]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[44]
#define RD_UNIFORM_SUN_DIR fragmentConstants[45]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[46]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[47]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[48]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[49]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[50]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[51]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[52]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[53]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[54]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 fragmentConstants[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 fragmentConstants[13]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 fragmentConstants[14]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 fragmentConstants[15]
#define RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[28]
#define RD_UNIFORM_AMBIENT_LIGHT_PARAMS fragmentConstants[29]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL fragmentConstants[30]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING fragmentConstants[31]
#define RD_UNIFORM_SKY_ZENITH_COLOR fragmentConstants[32]
#define RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES fragmentConstants[33]
#define RD_UNIFORM_FOG_COLOR fragmentConstants[34]
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentConstants[35]
#define RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION fragmentConstants[36]
#define RD_UNIFORM_MOON_DIR fragmentConstants[37]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE fragmentConstants[38]
#define RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION fragmentConstants[39]
#define RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES fragmentConstants[40]
#define RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED fragmentConstants[41]
#define RD_UNIFORM_FOG_SKY_BLEND fragmentConstants[42]
#define RD_UNIFORM_MOON_COLOR fragmentConstants[43]
#define RD_UNIFORM_SUN_DIR fragmentConstants[44]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[45]
#define RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA fragmentConstants[46]
#define RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY fragmentConstants[47]
#define RD_UNIFORM_SKY_HORIZON_COLOR fragmentConstants[48]
#define RD_UNIFORM_SUN_COLOR fragmentConstants[49]
#define RD_UNIFORM_UNDERGROUND_FOG_COLOR fragmentConstants[50]
#define RD_UNIFORM_VOLUME_DIMENSIONS fragmentConstants[51]
#define RD_UNIFORM_VOLUME_NEAR_FAR fragmentConstants[52]
#define RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED fragmentConstants[53]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentVectorConstants1[0]
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture1 : register(t1);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler2 : register(s2);
SamplerState textureSampler1 : register(s1);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[8]
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentVectorConstants1[9]
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture2 : register(t2);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler2 : register(s2);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[8]
#define RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET fragmentConstants[9]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentConstants[8]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_WORLD_POS_OFFSET fragmentVectorConstants1[8]
Texture2D<float4> materialTexture5 : register(t5);
SamplerState textureSampler5 : register(s5);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[54];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[55] : packoffset(c0);
};
Texture2D<float4> occlusionTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
Texture2D<float4> weatherTextureTexture : register(t5, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t7, space0);
SamplerState occlusionTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState weatherTextureSampler : register(s5, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float3 varyingColor2;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float3 varyingColor2 : COLOR2;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[54] : packoffset(c0);
};
Texture2D<float4> occlusionTextureTexture : register(t2, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t4, space0);
Texture2D<float4> weatherTextureTexture : register(t5, space0);
Texture2DArray<float4> scatteringBufferTexture : register(t7, space0);
SamplerState occlusionTextureSampler : register(s2, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s4, space0);
SamplerState weatherTextureSampler : register(s5, space0);
SamplerState scatteringBufferSampler : register(s7, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float3 varyingColor2;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float3 varyingColor2 : COLOR2;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> lightingTextureTexture : register(t1, space0);
Texture2D<float4> occlusionTextureTexture : register(t2, space0);
Texture2D<float4> weatherTextureTexture : register(t5, space0);
SamplerState lightingTextureSampler : register(s1, space0);
SamplerState occlusionTextureSampler : register(s2, space0);
SamplerState weatherTextureSampler : register(s5, space0);
static float4 varyingColor0;
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
  float4 fragmentVectorConstants1[10];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[10] : packoffset(c0);
};
Texture2D<float4> occlusionTextureTexture : register(t2, space0);
Texture2D<float4> weatherTextureTexture : register(t5, space0);
SamplerState occlusionTextureSampler : register(s2, space0);
SamplerState weatherTextureSampler : register(s5, space0);
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingTexCoord4;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord4 : TEXCOORD4;
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
#elif RD_BINDING_LAYOUT == 7
    float4 fragmentConstants[9] : packoffset(c0);
};
Texture2D<float4> weatherTextureTexture : register(t5, space0);
SamplerState weatherTextureSampler : register(s5, space0);
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingTexCoord4;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord4 : TEXCOORD4;
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
  float4 fragmentVectorConstants1[9];
}
#define RD_COMPARISON_MASK -
#endif
