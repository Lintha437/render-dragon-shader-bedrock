// RTXPostFX.Bloom / BloomDownscaleGaussianPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  const float4 icb[] = { { 0.163400, 0, 0, 0},
                              { 0.038714, 0, 0, 0},
                              { 0.038714, 0, 0, 0},
                              { 0.009172, 0, 0, 0} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = float2(0.5,0.5) * RD_UNIFORM_SCREEN_SIZE.zw;
  workingVector1.xyz = float3(0,0,0);
  workingVector0.z = -2;
  while (true) {
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z >= 2);
    if (workingVector0.w != 0) break;
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z < 0);
    workingVector1.w = (int)-workingVector0.z + -1;
    workingVector0.w = workingVector0.w ? workingVector1.w : workingVector0.z;
    workingVector0.w = (uint)workingVector0.w << 1;
    workingVector2.x = (int)workingVector0.z;
    workingVector3.xyz = workingVector1.xyz;
    workingVector1.w = -2;
    while (true) {
      workingVector2.z = RD_COMPARISON_MASK((int)workingVector1.w >= 2);
      if (workingVector2.z != 0) break;
      workingVector2.y = (int)workingVector1.w;
      workingVector2.yz = workingVector2.xy * RD_UNIFORM_SCREEN_SIZE.zw + workingVector0.xy;
      workingVector2.w = RD_COMPARISON_MASK((int)workingVector1.w < 0);
      workingVector3.w = (int)-workingVector1.w + -1;
      workingVector2.w = workingVector2.w ? workingVector3.w : workingVector1.w;
      workingVector2.w = (int)workingVector0.w + (int)workingVector2.w;
      workingVector2.yz = varyingTexCoord0.xy + workingVector2.yz;
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector4.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.yz).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector4.xyz = materialTexture0.Sample(textureSampler0, workingVector2.yz).xyz;
#endif
      workingVector3.xyz = workingVector4.xyz * icb[workingVector2.w+0].xxx + workingVector3.xyz;
      workingVector1.w = (int)workingVector1.w + 1;
    }
    workingVector1.xyz = workingVector3.xyz;
    workingVector0.z = (int)workingVector0.z + 1;
  }
  fragmentColor0.xyz = workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = RD_UNIFORM_SCREEN_SIZE.z * 0.5f;
    float productValue1 = RD_UNIFORM_SCREEN_SIZE.w * 0.5f;
    float productValue2;
    float productValue3;
    float productValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    uint intermediateValue8;
    float scalarValue = 0.0f;
    float scalarValue1 = 0.0f;
    float scalarValue2 = 0.0f;
    uint scalarValue3 = 4294967294u;
    for (;;)
    {
        intermediateValue5 = scalarValue;
        intermediateValue6 = scalarValue1;
        intermediateValue7 = scalarValue2;
        intermediateValue8 = 4294967294u;
        for (;;)
        {
            uint bitwiseValue = (uint(int(intermediateValue8) >> int(31u)) ^ intermediateValue8) + ((uint(int(scalarValue3) >> int(31u)) ^ scalarValue3) * 2u);
            float4 sampledTextureValue = rasterColorTexture.Sample(rasterColorSampler, float2((productValue + varyingTexCoord0.x) + (float(int(scalarValue3)) * RD_UNIFORM_SCREEN_SIZE.z), (productValue1 + varyingTexCoord0.y) + (float(int(intermediateValue8)) * RD_UNIFORM_SCREEN_SIZE.w)));
            productValue2 = (sampledTextureValue.x * intermediateValue[bitwiseValue]) + intermediateValue5;
            productValue3 = (sampledTextureValue.y * intermediateValue[bitwiseValue]) + intermediateValue6;
            productValue4 = (sampledTextureValue.z * intermediateValue[bitwiseValue]) + intermediateValue7;
            uint sumValue = intermediateValue8 + 1u;
            if (sumValue == 2u)
            {
                break;
            }
            else
            {
                intermediateValue5 = productValue2;
                intermediateValue6 = productValue3;
                intermediateValue7 = productValue4;
                intermediateValue8 = sumValue;
            }
        }
        uint sumValue1 = scalarValue3 + 1u;
        if (sumValue1 == 2u)
        {
            break;
        }
        else
        {
            scalarValue = productValue2;
            scalarValue1 = productValue3;
            scalarValue2 = productValue4;
            scalarValue3 = sumValue1;
            continue;
        }
    }
    fragmentColor0.x = productValue2;
    fragmentColor0.y = productValue3;
    fragmentColor0.z = productValue4;
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
