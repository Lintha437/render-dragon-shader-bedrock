// Native resource and stage-interface layouts for LocalExposure / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_LOCAL_EXPOSURE_PARAMS fragmentConstants[0]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentConstants[1]
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS fragmentConstants[2]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_LOCAL_EXPOSURE_PARAMS fragmentVectorConstants1[0]
#define RD_UNIFORM_PRE_EXPOSURE_ENABLED fragmentVectorConstants1[1]
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS fragmentVectorConstants1[2]
Texture3D<float4> materialTexture4 : register(t4);
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
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_GAUSSIAN_BLUR_PARAMS fragmentConstants[0]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentConstants[1]
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS fragmentConstants[2]
#define RD_UNIFORM_RECIP_SCENE_RESOLUTION fragmentConstants[3]
cbuffer fragmentUniformBuffer : register(b1, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_GAUSSIAN_BLUR_PARAMS fragmentVectorConstants1[0]
#define RD_UNIFORM_VIEWPORT_SCALE fragmentVectorConstants1[1]
#define RD_UNIFORM_LUMINANCE_RANGE_PARAMS fragmentVectorConstants1[2]
#define RD_UNIFORM_RECIP_SCENE_RESOLUTION fragmentVectorConstants1[3]
Texture2D<float4> materialTexture3 : register(t3);
SamplerState textureSampler3 : register(s3);
cbuffer FragmentVectorConstants1Buffer : register(b1)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 fragmentConstants[3] : packoffset(c0);
};
Texture2D<float4> averageLuminanceTexture : register(t0, space0);
Texture2D<float4> downsampledLogLuminanceTexture : register(t1, space0);
Texture2D<float4> previousFrameAverageLuminanceTexture : register(t2, space0);
Texture2D<float4> sceneColorTexture : register(t3, space0);
Texture3D<float4> filteredBilateralGridTexture : register(t4, space0);
SamplerState averageLuminanceSampler : register(s0, space0);
SamplerState downsampledLogLuminanceSampler : register(s1, space0);
SamplerState previousFrameAverageLuminanceSampler : register(s2, space0);
SamplerState sceneColorSampler : register(s3, space0);
SamplerState filteredBilateralGridSampler : register(s4, space0);
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
    float4 fragmentConstants[4] : packoffset(c0);
};
Texture2D<float4> sceneColorTexture : register(t3, space0);
SamplerState sceneColorSampler : register(s3, space0);
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
  float4 fragmentVectorConstants1[4];
}
#define RD_COMPARISON_MASK -
#endif
