// Native resource and stage-interface layouts for WaterSimulation / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_RECT fragmentConstants[0]
#define RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE fragmentConstants[1]
#define RD_UNIFORM_WATER_RESOLUTION fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_RECT fragmentVectorConstants1[0]
#define RD_UNIFORM_STOCKHAM_FFT_SUB_TRANSFORM_SIZE fragmentVectorConstants1[1]
#define RD_UNIFORM_WATER_RESOLUTION fragmentVectorConstants1[2]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_WATER_WAVE_DAMPENING fragmentConstants[0]
#define RD_UNIFORM_WATER_WIND_ALIGNMENT fragmentConstants[1]
#define RD_UNIFORM_G fragmentConstants[2]
#define RD_UNIFORM_WATER_PATCH_SIZE fragmentConstants[3]
#define RD_UNIFORM_WATER_RESOLUTION fragmentConstants[4]
#define RD_UNIFORM_WATER_WIND_VELOCITY fragmentConstants[5]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_WATER_SIM_TIME fragmentConstants[0]
#define RD_UNIFORM_G fragmentConstants[1]
#define RD_UNIFORM_WATER_PATCH_SIZE fragmentConstants[2]
#define RD_UNIFORM_WATER_RESOLUTION fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_WATER_WAVE_DAMPENING fragmentVectorConstants1[0]
#define RD_UNIFORM_WATER_WIND_ALIGNMENT fragmentVectorConstants1[1]
#define RD_UNIFORM_G fragmentVectorConstants1[2]
#define RD_UNIFORM_WATER_PATCH_SIZE fragmentVectorConstants1[3]
#define RD_UNIFORM_WATER_RESOLUTION fragmentVectorConstants1[4]
#define RD_UNIFORM_WATER_WIND_VELOCITY fragmentVectorConstants1[5]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_WATER_SIM_TIME fragmentVectorConstants1[0]
#define RD_UNIFORM_G fragmentVectorConstants1[1]
#define RD_UNIFORM_WATER_PATCH_SIZE fragmentVectorConstants1[2]
#define RD_UNIFORM_WATER_RESOLUTION fragmentVectorConstants1[3]
Texture2D<float4> materialTexture0 : register(t0);
SamplerState textureSampler0 : register(s0);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> simTextureTexture : register(t0, space0);
SamplerState simTextureSampler : register(s0, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
  float4 fragmentVectorConstants1[3];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 fragmentConstants[6] : packoffset(c0);
};
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 3
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> simTextureTexture : register(t0, space0);
SamplerState simTextureSampler : register(s0, space0);
static float2 varyingTexCoord0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float2 varyingTexCoord0 : TEXCOORD0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 4
  float4 fragmentVectorConstants1[6];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#endif
