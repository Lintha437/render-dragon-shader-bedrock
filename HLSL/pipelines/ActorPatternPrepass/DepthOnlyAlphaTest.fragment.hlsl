// ActorPatternPrepass / DepthOnlyAlphaTest / fragment forward pipeline.
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
#define RD_OPTION_EMISSIVE RD_EMISSIVE_EMISSIVE
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ActorPatternPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
  float4 workingVector0,workingVector1;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  float4 workingVector0,workingVector1,workingVector2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
  float4 workingVector0;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector0.x = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector2.y = 1 + -workingVector1.w;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(0 < workingVector2.x);
  workingVector2.x = workingVector2.x ? 1.000000 : 0;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw + -workingVector1.xyzw;
  workingVector0.xyzw = workingVector2.xxxx * workingVector0.xyzw + workingVector1.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector0.x = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.w;
  workingVector0.y = workingVector0.x * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.y + workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.z < workingVector0.x);
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.x = workingVector1.x + workingVector1.y;
  workingVector0.x = workingVector0.x + workingVector1.z;
  workingVector0.y = 1 + -workingVector1.w;
  workingVector0.x = workingVector0.x * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(0 < workingVector0.x);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector0.y = RD_UNIFORM_MAT_COLOR.w * workingVector0.w + -workingVector1.w;
  workingVector0.x = workingVector0.x * workingVector0.y + workingVector1.w;
  workingVector0.y = workingVector0.x * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.y + workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.z < workingVector0.x);
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).w;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.x;
  workingVector0.y = workingVector0.x * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.y + workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.z < workingVector0.x);
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).w;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector0.x = RD_UNIFORM_MAT_COLOR.w * workingVector0.x + -workingVector1.w;
  workingVector0.x = workingVector0.y * workingVector0.x + workingVector1.w;
  workingVector0.y = workingVector0.x * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.y + workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.z < workingVector0.x);
  workingVector0.x = (int)workingVector0.x | (int)workingVector0.y;
#endif
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    if (dot(float4(sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x, sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y, sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z, (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    float productValue1 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)) > 0.0f);
    float productValue2 = (productValue1 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3;
    if (dot(float4((productValue1 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue)) + scalarValue, (productValue1 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue1)) + scalarValue1, (productValue1 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue2)) + scalarValue2, (((productValue2 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue2) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue2), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float sampledTextureValue2 = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w;
    float productValue3 = (((RD_UNIFORM_OVERLAY_COLOR.w * sampledTextureValue2) - sampledTextureValue2) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue2;
    if ((productValue3 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || (productValue3 > (1.0f - RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float sampledTextureValue3 = (float((((sampledTextureValue1.x + sampledTextureValue1.y) + sampledTextureValue1.z) * (1.0f - scalarValue3)) > 0.0f) * ((matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w * RD_UNIFORM_MAT_COLOR.w) - scalarValue3)) + scalarValue3;
    float productValue4 = (((sampledTextureValue3 * RD_UNIFORM_OVERLAY_COLOR.w) - sampledTextureValue3) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + sampledTextureValue3;
    if ((productValue4 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || (productValue4 > (1.0f - RD_UNIFORM_ACTOR_FP_EPSILON.x)))
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
