// ActorGlintForwardPBR / DepthOnlyAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 19
#endif


#include "../../include/materials/ActorGlintForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF
  float4 workingVector0;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.x = workingVector1.x + workingVector1.y;
  workingVector0.x = workingVector0.x + workingVector1.z;
  workingVector0.y = 1 + -workingVector1.w;
  workingVector0.x = workingVector0.x * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(0 < workingVector0.x);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector0.y = RD_UNIFORM_MAT_COLOR.w * workingVector0.w + -workingVector1.w;
  workingVector0.x = workingVector0.x * workingVector0.y + workingVector1.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).w;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).w;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.x + -workingVector1.w;
  workingVector0.x = workingVector0.y * workingVector0.x + workingVector1.w;
#endif
  workingVector0.y = workingVector0.x * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.y + workingVector0.x;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#endif
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w;
    if (((((RD_UNIFORM_OVERLAY_COLOR.w * sampledTextureValue) - sampledTextureValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue) < 0.5f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float sampledTextureValue2 = (float((((sampledTextureValue1.x + sampledTextureValue1.y) + sampledTextureValue1.z) * (1.0f - scalarValue)) > 0.0f) * ((matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue2 * RD_UNIFORM_OVERLAY_COLOR.w) - sampledTextureValue2) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue2) < 0.5f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w;
    if (((((RD_UNIFORM_OVERLAY_COLOR.w * sampledTextureValue) - sampledTextureValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float sampledTextureValue2 = (float((((sampledTextureValue1.x + sampledTextureValue1.y) + sampledTextureValue1.z) * (1.0f - scalarValue)) > 0.0f) * ((matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue2 * RD_UNIFORM_OVERLAY_COLOR.w) - sampledTextureValue2) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue2) < RD_UNIFORM_ACTOR_FP_EPSILON.x)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
