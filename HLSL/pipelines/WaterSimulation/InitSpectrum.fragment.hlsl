// WaterSimulation / InitSpectrum / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/WaterSimulation/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = dot(RD_UNIFORM_WATER_WIND_VELOCITY.xy, RD_UNIFORM_WATER_WIND_VELOCITY.xy);
  workingVector0.y = workingVector0.x / RD_UNIFORM_G.x;
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.zw = float2(-0.5,-0.5) + varyingTexCoord0.xy;
  workingVector0.zw = RD_UNIFORM_WATER_RESOLUTION.xx * workingVector0.zw;
  workingVector0.zw = float2(6.28318548,6.28318548) * workingVector0.zw;
  workingVector0.zw = workingVector0.zw / RD_UNIFORM_WATER_PATCH_SIZE.xx;
  workingVector1.x = dot(-workingVector0.zw, -workingVector0.zw);
  workingVector1.y = workingVector1.x * workingVector0.y;
  workingVector1.y = -1 / workingVector1.y;
  workingVector1.y = 1.44269502 * workingVector1.y;
  workingVector1.y = exp2(workingVector1.y);
  workingVector1.y = 9.99999975e-006 * workingVector1.y;
  workingVector1.z = workingVector1.x * workingVector1.x;
  workingVector1.y = workingVector1.y / workingVector1.z;
  workingVector1.z = sqrt(workingVector1.x);
  workingVector1.x = RD_UNIFORM_WATER_WAVE_DAMPENING.x * -workingVector1.x;
  workingVector1.x = 1.44269502 * workingVector1.x;
  workingVector1.x = exp2(workingVector1.x);
  workingVector2.xy = -workingVector0.zw / workingVector1.zz;
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.z != 0.000000);
  workingVector2.zw = RD_UNIFORM_WATER_WIND_VELOCITY.xy / workingVector0.xx;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x != 0.000000);
  workingVector1.w = dot(workingVector2.zw, workingVector2.xy);
  workingVector2.x = workingVector1.w * workingVector1.w;
  workingVector1.w = RD_COMPARISON_MASK(workingVector1.w < 0);
  workingVector1.w = workingVector1.w ? RD_UNIFORM_WATER_WIND_ALIGNMENT.x : 1;
  workingVector1.y = workingVector2.x * workingVector1.y;
  workingVector1.x = workingVector1.y * workingVector1.x;
  workingVector1.x = workingVector1.x * workingVector1.w;
  workingVector1.x = workingVector0.x ? workingVector1.x : 0;
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  workingVector1.x = 0.5 * workingVector1.x;
  workingVector1.x = sqrt(workingVector1.x);
  fragmentColor0.zw = float2(1,-1) * workingVector1.xx;
  workingVector1.x = dot(workingVector0.zw, workingVector0.zw);
  workingVector0.y = workingVector1.x * workingVector0.y;
  workingVector0.y = -1 / workingVector0.y;
  workingVector0.y = 1.44269502 * workingVector0.y;
  workingVector0.y = exp2(workingVector0.y);
  workingVector0.y = 9.99999975e-006 * workingVector0.y;
  workingVector1.y = workingVector1.x * workingVector1.x;
  workingVector0.y = workingVector0.y / workingVector1.y;
  workingVector1.y = sqrt(workingVector1.x);
  workingVector1.x = RD_UNIFORM_WATER_WAVE_DAMPENING.x * -workingVector1.x;
  workingVector1.x = 1.44269502 * workingVector1.x;
  workingVector1.x = exp2(workingVector1.x);
  workingVector0.zw = workingVector0.zw / workingVector1.yy;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.y != 0.000000);
  workingVector0.z = dot(workingVector2.zw, workingVector0.zw);
  workingVector0.w = workingVector0.z * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector0.z = workingVector0.z ? RD_UNIFORM_WATER_WIND_ALIGNMENT.x : 1;
  workingVector0.y = workingVector0.y * workingVector0.w;
  workingVector0.y = workingVector0.y * workingVector1.x;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
  workingVector0.x = workingVector0.x ? workingVector1.y : 0;
  workingVector0.x = 0.5 * workingVector0.x;
  fragmentColor0.xy = sqrt(workingVector0.xx);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = RD_UNIFORM_WATER_RESOLUTION.x * 6.283185482025146484375f;
    float quotientValue = (productValue * (varyingTexCoord0.x + (-0.5f))) / RD_UNIFORM_WATER_PATCH_SIZE.x;
    float quotientValue1 = (productValue * (varyingTexCoord0.y + (-0.5f))) / RD_UNIFORM_WATER_PATCH_SIZE.x;
    float nonlinearValue = sqrt((quotientValue1 * quotientValue1) + (quotientValue * quotientValue));
    bool comparisonValue = nonlinearValue == 0.0f;
    float intermediateValue;
    if (comparisonValue)
    {
        intermediateValue = 0.0f;
    }
    else
    {
        float productValue1 = nonlinearValue * nonlinearValue;
        float nonlinearValue1 = sqrt((RD_UNIFORM_WATER_WIND_VELOCITY.x * RD_UNIFORM_WATER_WIND_VELOCITY.x) + (RD_UNIFORM_WATER_WIND_VELOCITY.y * RD_UNIFORM_WATER_WIND_VELOCITY.y));
        float branchMergedValue;
        if (nonlinearValue1 == 0.0f)
        {
            branchMergedValue = 0.0f;
        }
        else
        {
            float quotientValue2 = (nonlinearValue1 * nonlinearValue1) / RD_UNIFORM_G.x;
            float dotProductValue = dot(float2(RD_UNIFORM_WATER_WIND_VELOCITY.x / nonlinearValue1, RD_UNIFORM_WATER_WIND_VELOCITY.y / nonlinearValue1), float2(quotientValue / nonlinearValue, quotientValue1 / nonlinearValue));
            precise float exponentialValue = (((dotProductValue < 0.0f) ? RD_UNIFORM_WATER_WIND_ALIGNMENT.x : 1.0f) * (((dotProductValue * dotProductValue) * ((exp2((-1.44269502162933349609375f) / ((quotientValue2 * quotientValue2) * productValue1)) * 9.9999997473787516355514526367188e-06f) / (productValue1 * productValue1))) * exp2((RD_UNIFORM_WATER_WAVE_DAMPENING.x * (-1.44269502162933349609375f)) * productValue1))) * 0.5f;
            branchMergedValue = exponentialValue;
        }
        intermediateValue = branchMergedValue;
    }
    float nonlinearValue2 = sqrt(intermediateValue);
    float intermediateValue1;
    if (comparisonValue)
    {
        intermediateValue1 = 0.0f;
    }
    else
    {
        float productValue2 = nonlinearValue * nonlinearValue;
        float nonlinearValue3 = sqrt((RD_UNIFORM_WATER_WIND_VELOCITY.x * RD_UNIFORM_WATER_WIND_VELOCITY.x) + (RD_UNIFORM_WATER_WIND_VELOCITY.y * RD_UNIFORM_WATER_WIND_VELOCITY.y));
        float branchMergedValue1;
        if (nonlinearValue3 == 0.0f)
        {
            branchMergedValue1 = 0.0f;
        }
        else
        {
            float quotientValue3 = (nonlinearValue3 * nonlinearValue3) / RD_UNIFORM_G.x;
            float dotProductValue1 = dot(float2(RD_UNIFORM_WATER_WIND_VELOCITY.x / nonlinearValue3, RD_UNIFORM_WATER_WIND_VELOCITY.y / nonlinearValue3), float2(((-0.0f) - quotientValue) / nonlinearValue, ((-0.0f) - quotientValue1) / nonlinearValue));
            precise float exponentialValue1 = (((dotProductValue1 < 0.0f) ? RD_UNIFORM_WATER_WIND_ALIGNMENT.x : 1.0f) * (((dotProductValue1 * dotProductValue1) * ((exp2((-1.44269502162933349609375f) / ((quotientValue3 * quotientValue3) * productValue2)) * 9.9999997473787516355514526367188e-06f) / (productValue2 * productValue2))) * exp2((RD_UNIFORM_WATER_WAVE_DAMPENING.x * (-1.44269502162933349609375f)) * productValue2))) * 0.5f;
            branchMergedValue1 = exponentialValue1;
        }
        intermediateValue1 = branchMergedValue1;
    }
    float nonlinearValue4 = sqrt(intermediateValue1);
    fragmentColor0.x = nonlinearValue2;
    fragmentColor0.y = nonlinearValue2;
    fragmentColor0.z = nonlinearValue4;
    fragmentColor0.w = (-0.0f) - nonlinearValue4;
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
