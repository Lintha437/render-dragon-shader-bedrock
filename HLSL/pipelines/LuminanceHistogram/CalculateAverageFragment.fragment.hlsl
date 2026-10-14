// LuminanceHistogram / CalculateAverageFragment / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/LuminanceHistogram/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture1.SampleLevel(textureSampler1, float2(0.5,0.5), 0).x;
  workingVector0.yz = float2(0,1.40129846e-045);
  while (true) {
    workingVector0.w = RD_COMPARISON_MASK((uint)workingVector0.z >= 256);
    if (workingVector0.w != 0) break;
    workingVector0.w = writableResource3[workingVector0.z].val[0/4];
    workingVector0.w = (uint)workingVector0.w;
    workingVector0.y = workingVector0.w * 0.00390625 + workingVector0.y;
    workingVector0.z = (int)workingVector0.z + 1;
  }
  workingVector0.yz = RD_UNIFORM_QUANTILE_BOUNDS.xy * workingVector0.yy;
  workingVector0.w = 0;
  workingVector1.xyz = float3(0,0,1.40129846e-045);
  while (true) {
    workingVector1.w = RD_COMPARISON_MASK((uint)workingVector1.z >= 256);
    if (workingVector1.w != 0) break;
    workingVector1.w = writableResource3[workingVector1.z].val[0/4];
    workingVector1.w = (uint)workingVector1.w;
    workingVector2.x = max(workingVector1.x, workingVector0.y);
    workingVector1.x = workingVector1.w * 0.00390625 + workingVector1.x;
    workingVector1.w = min(workingVector1.x, workingVector0.z);
    workingVector1.w = max(workingVector1.w, workingVector2.x);
    workingVector1.w = workingVector1.w + -workingVector2.x;
    workingVector2.x = (uint)workingVector1.z;
    workingVector0.w = workingVector1.w * workingVector2.x + workingVector0.w;
    workingVector1.y = workingVector1.y + workingVector1.w;
    workingVector1.z = (int)workingVector1.z + 1;
  }
  workingVector0.y = max(1, workingVector1.y);
  workingVector0.y = workingVector0.w / workingVector0.y;
  workingVector0.y = -1 + workingVector0.y;
  workingVector0.y = RD_UNIFORM_LOG_LUMINANCE_RANGE.x * workingVector0.y;
  workingVector0.y = workingVector0.y * 0.00393700786 + RD_UNIFORM_MIN_LOG_LUMINANCE.x;
  workingVector0.z = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_ADAPTATION.x);
  workingVector0.x = max(0.000950000016, workingVector0.x);
  workingVector0.x = log2(workingVector0.x);
  workingVector0.w = RD_UNIFORM_MIN_LOG_LUMINANCE.x + RD_UNIFORM_LOG_LUMINANCE_RANGE.x;
  workingVector0.x = max(RD_UNIFORM_MIN_LOG_LUMINANCE.x, workingVector0.x);
  workingVector0.x = min(workingVector0.x, workingVector0.w);
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.x < workingVector0.y);
  workingVector0.w = workingVector0.w ? RD_UNIFORM_ADAPTIVE_PARAMETERS.y : RD_UNIFORM_ADAPTIVE_PARAMETERS.z;
  workingVector1.x = workingVector0.y + -workingVector0.x;
  workingVector1.y = RD_UNIFORM_ADAPTIVE_PARAMETERS.x * -RD_UNIFORM_ADAPTATION.y;
  workingVector0.w = workingVector1.y * workingVector0.w;
  workingVector0.w = 1.44269502 * workingVector0.w;
  workingVector0.w = exp2(workingVector0.w);
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.x = workingVector1.x * workingVector0.w + workingVector0.x;
  workingVector0.x = workingVector0.z ? workingVector0.x : workingVector0.y;
  fragmentColor0.xyzw = exp2(workingVector0.xxxx);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float intermediateValue;
    uint intermediateValue1;
    intermediateValue = 0.0f;
    intermediateValue1 = 1u;
    float productValue;
    for (;;)
    {
        productValue = (float(rdAccess_curFrameLuminanceHistogram(intermediateValue1).xxxx.x) * 0.00390625f) + intermediateValue;
        uint sumValue = intermediateValue1 + 1u;
        if (sumValue == 256u)
        {
            break;
        }
        else
        {
            intermediateValue = productValue;
            intermediateValue1 = sumValue;
        }
    }
    float productValue1 = RD_UNIFORM_QUANTILE_BOUNDS.x * productValue;
    float productValue2 = RD_UNIFORM_QUANTILE_BOUNDS.y * productValue;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    uint intermediateValue5;
    intermediateValue2 = 0.0f;
    intermediateValue3 = 0.0f;
    intermediateValue4 = 0.0f;
    intermediateValue5 = 1u;
    float productValue3;
    float sumValue1;
    for (;;)
    {
        float scalarValue = max(intermediateValue3, productValue1);
        float productValue4 = (float(rdAccess_curFrameLuminanceHistogram(intermediateValue5).xxxx.x) * 0.00390625f) + intermediateValue3;
        float sumValue2 = max(min(productValue4, productValue2), scalarValue) - scalarValue;
        productValue3 = (sumValue2 * float(intermediateValue5)) + intermediateValue2;
        sumValue1 = sumValue2 + intermediateValue4;
        uint sumValue3 = intermediateValue5 + 1u;
        if (sumValue3 == 256u)
        {
            break;
        }
        else
        {
            intermediateValue2 = productValue3;
            intermediateValue3 = productValue4;
            intermediateValue4 = sumValue1;
            intermediateValue5 = sumValue3;
        }
    }
    float quotientValue = ((((productValue3 / max(sumValue1, 1.0f)) + (-1.0f)) * 0.00393700785934925079345703125f) * RD_UNIFORM_LOG_LUMINANCE_RANGE.x) + RD_UNIFORM_MIN_LOG_LUMINANCE.x;
    float exponentialValue;
    if (RD_UNIFORM_ADAPTATION.x > 0.5f)
    {
        float sampledTextureValue = min(max(log2(max(previousFrameAverageLuminanceTexture.SampleLevel(previousFrameAverageLuminanceSampler, 0.5f.xx, 0.0f).x, 0.00095000001601874828338623046875f)), RD_UNIFORM_MIN_LOG_LUMINANCE.x), RD_UNIFORM_MIN_LOG_LUMINANCE.x + RD_UNIFORM_LOG_LUMINANCE_RANGE.x);
        exponentialValue = ((1.0f - exp2(((RD_UNIFORM_ADAPTATION.y * (-1.44269502162933349609375f)) * RD_UNIFORM_ADAPTIVE_PARAMETERS.x) * ((quotientValue > sampledTextureValue) ? RD_UNIFORM_ADAPTIVE_PARAMETERS.y : RD_UNIFORM_ADAPTIVE_PARAMETERS.z))) * (quotientValue - sampledTextureValue)) + sampledTextureValue;
    }
    else
    {
        exponentialValue = quotientValue;
    }
    float exponentialValue1 = exp2(exponentialValue);
    fragmentColor0.x = exponentialValue1;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue1;
    fragmentColor0.w = exponentialValue1;
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
