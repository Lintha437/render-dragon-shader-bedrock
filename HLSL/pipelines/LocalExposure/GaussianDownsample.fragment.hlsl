// LocalExposure / GaussianDownsample / fragment forward pipeline.
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


#include "../../include/materials/LocalExposure/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = (int2)RD_UNIFORM_GAUSSIAN_BLUR_PARAMS.xy;
  workingVector0.z = (int)workingVector0.y ^ (int)workingVector0.x;
  workingVector0.yw = max((int2)-workingVector0.xy, (int2)workingVector0.xy);
  integerResult.y = (uint)workingVector0.y / (uint)workingVector0.w;
  workingVector0.y = integerResult.y;
  workingVector0.w = -(int)workingVector0.y;
  workingVector0.z = (int)workingVector0.z & 0x80000000;
  workingVector0.y = workingVector0.z ? workingVector0.w : workingVector0.y;
  workingVector0.x = (int)workingVector0.x * (int)workingVector0.x;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.x = 0.5 * workingVector0.x;
  workingVector0.z = -(int)workingVector0.y;
  workingVector0.w = trunc(RD_UNIFORM_GAUSSIAN_BLUR_PARAMS.y);
  workingVector1.xy = float2(0,0);
  workingVector1.z = workingVector0.z;
  while (true) {
    workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.y < (int)workingVector1.z);
    if (workingVector1.w != 0) break;
    workingVector2.x = (int)workingVector1.z;
    workingVector2.zw = workingVector1.xy;
    workingVector1.w = workingVector0.z;
    while (true) {
      workingVector3.x = RD_COMPARISON_MASK((int)workingVector0.y < (int)workingVector1.w);
      if (workingVector3.x != 0) break;
      workingVector2.y = (int)workingVector1.w;
      workingVector3.xy = workingVector2.xy * workingVector0.ww;
      workingVector2.y = dot(workingVector3.xy, workingVector3.xy);
      workingVector2.y = -workingVector2.y / workingVector0.x;
      workingVector2.y = 1.44269502 * workingVector2.y;
      workingVector2.y = exp2(workingVector2.y);
      workingVector3.xy = workingVector3.xy * RD_UNIFORM_RECIP_SCENE_RESOLUTION.xy + varyingTexCoord0.xy;
      workingVector3.xy = min(RD_UNIFORM_VIEWPORT_SCALE.zw, workingVector3.xy);
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector3.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector3.xyz = materialTexture3.Sample(textureSampler3, workingVector3.xy).xyz;
#endif
      workingVector3.x = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector3.x = max(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z, workingVector3.x);
      workingVector3.x = min(RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w, workingVector3.x);
      workingVector3.x = log2(workingVector3.x);
      workingVector2.z = workingVector2.y * workingVector3.x + workingVector2.z;
      workingVector2.w = workingVector2.w + workingVector2.y;
      workingVector1.w = (int)workingVector1.w + 1;
    }
    workingVector1.xy = workingVector2.zw;
    workingVector1.z = (int)workingVector1.z + 1;
  }
  fragmentColor0.x = workingVector1.x / workingVector1.y;
  fragmentColor0.yzw = float3(0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
uint SDiv(uint num, uint den)
{
    uint intermediateValue2;
    [flatten]
    if (den == 0u)
    {
        intermediateValue2 = 4294967295u;
    }
    else
    {
        intermediateValue2 = uint(int(num) / int(den));
    }
    return intermediateValue2;
}
void executeFragmentStage()
{
    uint scalarValue = uint(int(RD_UNIFORM_GAUSSIAN_BLUR_PARAMS.x));
    uint scalarValue1 = uint(int(RD_UNIFORM_GAUSSIAN_BLUR_PARAMS.y));
    uint scalarValue2 = SDiv(scalarValue, scalarValue1);
    float productValue = float(int(scalarValue * scalarValue)) * 0.5f;
    uint scalarValue3 = -scalarValue2;
    float intermediateValue5;
    float intermediateValue6;
    if (int(scalarValue2) < int(scalarValue3))
    {
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
    }
    else
    {
        float sampledTextureValue;
        float sumValue;
        float intermediateValue10;
        float intermediateValue11;
        uint intermediateValue12;
        float scalarValue4 = 0.0f;
        float scalarValue5 = 0.0f;
        uint scalarValue6 = scalarValue3;
        for (;;)
        {
            intermediateValue10 = scalarValue4;
            intermediateValue11 = scalarValue5;
            intermediateValue12 = scalarValue3;
            for (;;)
            {
                float scalarValue7 = float(int(scalarValue1));
                float productValue1 = float(int(scalarValue6)) * scalarValue7;
                float productValue2 = float(int(intermediateValue12)) * scalarValue7;
                float exponentialValue = exp2((((-0.0f) - ((productValue1 * productValue1) + (productValue2 * productValue2))) / productValue) * 1.44269502162933349609375f);
                sampledTextureValue = (log2(min(max(dot(float3(sceneColorTexture.Sample(sceneColorSampler, float2(min((RD_UNIFORM_RECIP_SCENE_RESOLUTION.x * productValue1) + varyingTexCoord0.x, RD_UNIFORM_VIEWPORT_SCALE.z), min((RD_UNIFORM_RECIP_SCENE_RESOLUTION.y * productValue2) + varyingTexCoord0.y, RD_UNIFORM_VIEWPORT_SCALE.w))).xyz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w)) * exponentialValue) + intermediateValue10;
                sumValue = exponentialValue + intermediateValue11;
                if (int(intermediateValue12) < int(scalarValue2))
                {
                    intermediateValue10 = sampledTextureValue;
                    intermediateValue11 = sumValue;
                    intermediateValue12++;
                }
                else
                {
                    break;
                }
            }
            if (int(scalarValue6) < int(scalarValue2))
            {
                scalarValue4 = sampledTextureValue;
                scalarValue5 = sumValue;
                scalarValue6++;
                continue;
            }
            else
            {
                break;
            }
        }
        intermediateValue5 = sampledTextureValue;
        intermediateValue6 = sumValue;
    }
    fragmentColor0.x = intermediateValue5 / intermediateValue6;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
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
