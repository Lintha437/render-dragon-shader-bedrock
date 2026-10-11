// LocalExposure / ApplyLocalExposure / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/LocalExposure/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.x != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector0.xyzw = materialTexture2.Sample(textureSampler2, float2(0.5,0.5)).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.x = materialTexture2.Sample(textureSampler2, float2(0.5,0.5)).x;
#endif
    workingVector0.x = 0.180000007 / workingVector0.x;
    workingVector0.x = 9.99999975e-005 + workingVector0.x;
    workingVector0.x = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector0.x);
    workingVector0.x = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector0.x);
    workingVector0.x = log2(workingVector0.x);
  } else {
    workingVector0.x = 0;
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.y = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.y = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector0.y);
  workingVector0.y = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector0.y);
  workingVector0.y = log2(workingVector0.y);
  workingVector0.y = workingVector0.y + -workingVector0.x;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.x = workingVector2.x + -workingVector0.x;
  workingVector0.z = -RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x + workingVector0.y;
  workingVector0.w = RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y + -RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x;
  workingVector2.z = workingVector0.z / workingVector0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.yzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyz;
  workingVector1.x = dot(workingVector0.yzw, float3(0.212599993,0.715200007,0.0722000003));
  workingVector1.x = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector1.x);
  workingVector1.x = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector1.x);
  workingVector1.x = log2(workingVector1.x);
  workingVector1.x = workingVector1.x + -workingVector0.x;
  workingVector1.y = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).x;
  workingVector0.x = workingVector1.y + -workingVector0.x;
  workingVector1.y = -RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x + workingVector1.x;
  workingVector1.z = RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y + -RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x;
  workingVector2.z = workingVector1.y / workingVector1.z;
#endif
  workingVector2.xy = varyingTexCoord0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector2.xyzw = materialTexture4.Sample(textureSampler4, workingVector2.xyz).xyzw;
  workingVector0.z = workingVector2.y / workingVector2.x;
  workingVector0.z = workingVector0.z * workingVector0.w + RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x;
  workingVector0.w = workingVector0.x + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.z * workingVector0.w + workingVector0.z;
  workingVector0.w = RD_COMPARISON_MASK(workingVector2.x < 0.00100000005);
  workingVector0.x = workingVector0.w ? workingVector0.x : workingVector0.z;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
  workingVector0.z = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector2.x);
  workingVector0.z = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector0.z);
  workingVector0.z = log2(workingVector0.z);
  workingVector0.w = workingVector0.x + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.x * workingVector0.w + workingVector0.z;
  workingVector0.x = workingVector0.y + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.y * workingVector0.x + workingVector0.z;
  workingVector0.x = workingVector0.x + -workingVector0.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.yw = materialTexture4.Sample(textureSampler4, workingVector2.xyz).xy;
  workingVector1.w = workingVector1.w / workingVector1.y;
  workingVector1.z = workingVector1.w * workingVector1.z + RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x;
  workingVector1.w = -workingVector1.z + workingVector0.x;
  workingVector1.z = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.z * workingVector1.w + workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.y < 0.00100000005);
  workingVector0.x = workingVector1.y ? workingVector0.x : workingVector1.z;
  workingVector1.y = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
  workingVector1.y = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector1.y);
  workingVector1.y = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector1.y);
  workingVector1.y = log2(workingVector1.y);
  workingVector1.z = -workingVector1.y + workingVector0.x;
  workingVector1.y = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.x * workingVector1.z + workingVector1.y;
  workingVector0.x = workingVector1.x + -workingVector0.x;
  workingVector0.x = RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.y * workingVector0.x + workingVector1.y;
  workingVector0.x = workingVector0.x + -workingVector1.x;
#endif
  workingVector0.x = exp2(workingVector0.x);
#if RD_PLATFORM == RD_PLATFORM_SM40
  fragmentColor0.xyz = workingVector0.xxx * workingVector1.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  fragmentColor0.xyz = workingVector0.xxx * workingVector0.yzw;
#endif
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float sampledTextureValue;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        sampledTextureValue = log2(min(max((0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f, RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w));
    }
    else
    {
        sampledTextureValue = 0.0f;
    }
    float4 sampledTextureValue1 = sceneColorTexture.Sample(sceneColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float dotProductValue = log2(min(max(dot(float3(scalarValue, sampledTextureValue1.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w)) - sampledTextureValue;
    float sampledTextureValue2 = downsampledLogLuminanceTexture.Sample(downsampledLogLuminanceSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x - sampledTextureValue;
    float4 sampledTextureValue3 = filteredBilateralGridTexture.Sample(filteredBilateralGridSampler, float3(varyingTexCoord0.x, varyingTexCoord0.y, (dotProductValue - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x) / (RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x)));
    float scalarValue1 = sampledTextureValue3.x;
    float quotientValue = ((RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x) * (sampledTextureValue3.y / scalarValue1)) + RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x;
    float comparisonValue = (scalarValue1 < 0.001000000047497451305389404296875f) ? sampledTextureValue2 : (((sampledTextureValue2 - quotientValue) * RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.z) + quotientValue);
    float sampledTextureValue4 = log2(min(max(averageLuminanceTexture.Sample(averageLuminanceSampler, 0.5f.xx).x, RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w));
    float exponentialValue = exp2(((sampledTextureValue4 - dotProductValue) + ((dotProductValue - comparisonValue) * RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.y)) + ((comparisonValue - sampledTextureValue4) * RD_UNIFORM_LOCAL_EXPOSURE_PARAMS.x));
    fragmentColor0.x = exponentialValue * scalarValue;
    fragmentColor0.y = exponentialValue * sampledTextureValue1.y;
    fragmentColor0.z = exponentialValue * sampledTextureValue1.z;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
