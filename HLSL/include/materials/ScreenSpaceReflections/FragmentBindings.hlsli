// Native resource and stage-interface layouts for ScreenSpaceReflections / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[0]
Texture2D<float4> materialTexture4 : register(t4);
SamplerState textureSampler4 : register(s4);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentConstants[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentConstants[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentConstants[10]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentConstants[11]
#define RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS fragmentConstants[12]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[13]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[14]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_INV_VIEW_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[7]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_0 fragmentVectorConstants1[8]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_1 fragmentVectorConstants1[9]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_2 fragmentVectorConstants1[10]
#define RD_UNIFORM_PREV_VIEW_PROJ_ROW_3 fragmentVectorConstants1[11]
#define RD_UNIFORM_SSR_TEMPORAL_ACCUMULATION_PARAMS fragmentVectorConstants1[12]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[13]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[14]
Texture2D<float4> materialTexture6 : register(t6);
Texture2D<float4> materialTexture5 : register(t5);
Texture2D<float4> materialTexture4 : register(t4);
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler6 : register(s6);
SamplerState textureSampler5 : register(s5);
SamplerState textureSampler4 : register(s4);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS fragmentConstants[4]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[9]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[12]
#define RD_UNIFORM_CAMERA_DATA fragmentConstants[13]
#define RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS fragmentConstants[14]
#define RD_UNIFORM_SSR_RAY_MARCHING_PARAMS fragmentConstants[15]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[16]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[17]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS fragmentVectorConstants1[4]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[9]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[12]
#define RD_UNIFORM_CAMERA_DATA fragmentVectorConstants1[13]
#define RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS fragmentVectorConstants1[14]
#define RD_UNIFORM_SSR_RAY_MARCHING_PARAMS fragmentVectorConstants1[15]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[16]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[17]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentConstants[3]
#define RD_UNIFORM_SCREEN_SPACE_RAY_OFFSET fragmentConstants[4]
#define RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS fragmentConstants[5]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentConstants[6]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentConstants[7]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentConstants[8]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentConstants[10]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentConstants[11]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentConstants[12]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentConstants[13]
#define RD_UNIFORM_CAMERA_DATA fragmentConstants[14]
#define RD_UNIFORM_HI_ZMIP_COUNT fragmentConstants[15]
#define RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS fragmentConstants[16]
#define RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS fragmentConstants[17]
#define RD_UNIFORM_SSR_RAY_MARCHING_PARAMS fragmentConstants[18]
#define RD_UNIFORM_SCREEN_SIZE fragmentConstants[19]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 fragmentVectorConstants1[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 fragmentVectorConstants1[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 fragmentVectorConstants1[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 fragmentVectorConstants1[3]
#define RD_UNIFORM_SCREEN_SPACE_RAY_OFFSET fragmentVectorConstants1[4]
#define RD_UNIFORM_SSR_ROUGHNESS_CUTOFF_PARAMS fragmentVectorConstants1[5]
#define RD_UNIFORM_INV_VIEW_ROW_0 fragmentVectorConstants1[6]
#define RD_UNIFORM_INV_VIEW_ROW_1 fragmentVectorConstants1[7]
#define RD_UNIFORM_INV_VIEW_ROW_2 fragmentVectorConstants1[8]
#define RD_UNIFORM_INV_PROJ_ROW_0 fragmentVectorConstants1[10]
#define RD_UNIFORM_INV_PROJ_ROW_1 fragmentVectorConstants1[11]
#define RD_UNIFORM_INV_PROJ_ROW_2 fragmentVectorConstants1[12]
#define RD_UNIFORM_INV_PROJ_ROW_3 fragmentVectorConstants1[13]
#define RD_UNIFORM_CAMERA_DATA fragmentVectorConstants1[14]
#define RD_UNIFORM_HI_ZMIP_COUNT fragmentVectorConstants1[15]
#define RD_UNIFORM_HI_ZVIEWPORT_DIMENSIONS_AND_BUFFER_DIMENSIONS fragmentVectorConstants1[16]
#define RD_UNIFORM_SSR_FADING_PARAMS_AND_THICKNESS fragmentVectorConstants1[17]
#define RD_UNIFORM_SSR_RAY_MARCHING_PARAMS fragmentVectorConstants1[18]
#define RD_UNIFORM_SCREEN_SIZE fragmentVectorConstants1[19]
struct PackedDataRecord
{
    uint2 packedValues;
    uint recordComponent1;
};
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[1] : packoffset(c0);
};
Texture2D<float4> inputTextureTexture : register(t4, space0);
SamplerState inputTextureSampler : register(s4, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[15] : packoffset(c0);
};
Texture2D<float4> gbufferDepthTexture : register(t0, space0);
Texture2D<float4> inputTextureTexture : register(t4, space0);
Texture2D<float4> previousReflectionBufferTexture : register(t5, space0);
Texture2D<float4> rasterColorTexture : register(t6, space0);
SamplerState gbufferDepthSampler : register(s0, space0);
SamplerState inputTextureSampler : register(s4, space0);
SamplerState previousReflectionBufferSampler : register(s5, space0);
SamplerState rasterColorSampler : register(s6, space0);
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
  float4 fragmentVectorConstants1[15];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 fragmentConstants[18] : packoffset(c0);
};
Texture2D<float4> gbufferDepthTexture : register(t0, space0);
Texture2D<float4> gbufferNormalTexture : register(t1, space0);
Texture2D<uint4> gbufferRoughnessTexture : register(t2, space0);
SamplerState gbufferDepthSampler : register(s0, space0);
SamplerState gbufferNormalSampler : register(s1, space0);
static float4 varyingTexCoord1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 5
    float4 fragmentVectorConstants1[18] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<uint4> materialTexture2 : register(t2);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 6
    float4 fragmentConstants[20] : packoffset(c0);
};
Texture2D<float4> gbufferDepthTexture : register(t0, space0);
Texture2D<float4> gbufferNormalTexture : register(t1, space0);
Texture2D<uint4> gbufferRoughnessTexture : register(t2, space0);
Texture2D<float4> hiZBufferTexture : register(t3, space0);
SamplerState gbufferDepthSampler : register(s0, space0);
SamplerState gbufferNormalSampler : register(s1, space0);
static float4 varyingTexCoord1;
static float4 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 7
    float4 fragmentVectorConstants1[20] : packoffset(c0);
};
Texture2D<float4> materialTexture0 : register(t0);
Texture2D<float4> materialTexture1 : register(t1);
Texture2D<uint4> materialTexture2 : register(t2);
Texture2D<float4> materialTexture3 : register(t3);
SamplerState textureSampler0 : register(s0);
SamplerState textureSampler1 : register(s1);
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingTexCoord1 : TEXCOORD1;
    float4 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
