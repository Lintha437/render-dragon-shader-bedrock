// ScreenSpaceReflections / SSRFillGaps / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_EXTENDED_GAP_FILL
#define RD_FEATURE_EXTENDED_GAP_FILL RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0);
  if (workingVector1.x != 0) {
    workingVector1.xz = float2(0,0);
    workingVector1.y = RD_UNIFORM_SCREEN_SIZE.w;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
    workingVector1.xy = varyingTexCoord0.xy + workingVector1.xy;
    workingVector2.xyzw = materialTexture4.Sample(textureSampler4, workingVector1.xy).xyzw;
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
    workingVector2.xy = varyingTexCoord0.xy + workingVector1.xy;
    workingVector2.xyzw = materialTexture4.Sample(textureSampler4, workingVector2.xy).xyzw;
    workingVector3.x = RD_COMPARISON_MASK(workingVector2.w < 0);
    if (workingVector3.x != 0) {
      workingVector1.xy = workingVector1.xy * float2(2,2) + varyingTexCoord0.xy;
      workingVector2.xyzw = materialTexture4.Sample(textureSampler4, workingVector1.xy).xyzw;
    }
#endif
    workingVector1.w = -RD_UNIFORM_SCREEN_SIZE.w;
    workingVector1.xy = varyingTexCoord0.xy + workingVector1.zw;
    workingVector1.xyzw = materialTexture4.Sample(textureSampler4, workingVector1.xy).xyzw;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
    workingVector3.x = RD_COMPARISON_MASK(workingVector1.w < 0);
    if (workingVector3.x != 0) {
      workingVector3.x = 2;
      workingVector3.y = RD_UNIFORM_SCREEN_SIZE.w;
      workingVector3.xy = float2(0,-2) * workingVector3.xy + varyingTexCoord0.xy;
      workingVector1.xyzw = materialTexture4.Sample(textureSampler4, workingVector3.xy).xyzw;
    }
#endif
    workingVector3.x = RD_COMPARISON_MASK(workingVector2.w >= 0);
    workingVector3.y = RD_COMPARISON_MASK(workingVector1.w >= 0);
    workingVector3.x = workingVector3.y ? workingVector3.x : 0;
    workingVector1.xyzw = workingVector2.xyzw + workingVector1.xyzw;
    workingVector1.xyzw = float4(0.5,0.5,0.5,0.5) * workingVector1.xyzw;
    fragmentColor0.xyzw = workingVector3.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
  } else {
    fragmentColor0.xyzw = workingVector0.xyzw;
  }
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
    float intermediateValue5;
#endif
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
    float intermediateValue9;
#endif
    if (!(scalarValue3 >= 0.0f))
    {
        float4 sampledTextureValue1 = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, RD_UNIFORM_SCREEN_SIZE.w + varyingTexCoord0.y));
        float scalarValue4 = sampledTextureValue1.w;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        if (!(scalarValue4 >= 0.0f))
        {
            float4 sampledTextureValue3 = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, (RD_UNIFORM_SCREEN_SIZE.w * 2.0f) + varyingTexCoord0.y));
            intermediateValue9 = sampledTextureValue3.x;
            intermediateValue10 = sampledTextureValue3.y;
            intermediateValue11 = sampledTextureValue3.z;
            intermediateValue12 = sampledTextureValue3.w;
        }
        else
        {
            intermediateValue9 = sampledTextureValue1.x;
            intermediateValue10 = sampledTextureValue1.y;
            intermediateValue11 = sampledTextureValue1.z;
            intermediateValue12 = scalarValue4;
        }
#endif
        float4 sampledTextureValue2 = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y - RD_UNIFORM_SCREEN_SIZE.w));
        float scalarValue5 = sampledTextureValue2.w;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if (!(scalarValue5 >= 0.0f))
        {
            float4 sampledTextureValue4 = inputTextureTexture.Sample(inputTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y - (RD_UNIFORM_SCREEN_SIZE.w * 2.0f)));
            intermediateValue14 = sampledTextureValue4.x;
            intermediateValue15 = sampledTextureValue4.y;
            intermediateValue16 = sampledTextureValue4.z;
            intermediateValue17 = sampledTextureValue4.w;
        }
        else
        {
            intermediateValue14 = sampledTextureValue2.x;
            intermediateValue15 = sampledTextureValue2.y;
            intermediateValue16 = sampledTextureValue2.z;
            intermediateValue17 = scalarValue5;
        }
#endif
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
        if ((scalarValue4 >= 0.0f) && (scalarValue5 >= 0.0f))
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
        if ((intermediateValue12 >= 0.0f) && (intermediateValue17 >= 0.0f))
#endif
        {
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
            branchMergedValue = (sampledTextureValue2.x + sampledTextureValue1.x) * 0.5f;
            branchMergedValue1 = (sampledTextureValue2.y + sampledTextureValue1.y) * 0.5f;
            branchMergedValue2 = (sampledTextureValue2.z + sampledTextureValue1.z) * 0.5f;
            branchMergedValue3 = (scalarValue5 + scalarValue4) * 0.5f;
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
            branchMergedValue = (intermediateValue14 + intermediateValue9) * 0.5f;
            branchMergedValue1 = (intermediateValue15 + intermediateValue10) * 0.5f;
            branchMergedValue2 = (intermediateValue16 + intermediateValue11) * 0.5f;
            branchMergedValue3 = (intermediateValue17 + intermediateValue12) * 0.5f;
#endif
        }
        else
        {
            branchMergedValue = scalarValue;
            branchMergedValue1 = scalarValue1;
            branchMergedValue2 = scalarValue2;
            branchMergedValue3 = scalarValue3;
        }
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
        intermediateValue6 = branchMergedValue;
        intermediateValue7 = branchMergedValue1;
        intermediateValue8 = branchMergedValue2;
        intermediateValue9 = branchMergedValue3;
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
        intermediateValue5 = branchMergedValue;
        intermediateValue6 = branchMergedValue1;
        intermediateValue7 = branchMergedValue2;
        intermediateValue8 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
        intermediateValue6 = scalarValue;
        intermediateValue7 = scalarValue1;
        intermediateValue8 = scalarValue2;
        intermediateValue9 = scalarValue3;
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
        intermediateValue5 = scalarValue;
        intermediateValue6 = scalarValue1;
        intermediateValue7 = scalarValue2;
        intermediateValue8 = scalarValue3;
#endif
    }
#if RD_FEATURE_EXTENDED_GAP_FILL == RD_OFF
    fragmentColor0.x = intermediateValue6;
    fragmentColor0.y = intermediateValue7;
    fragmentColor0.z = intermediateValue8;
    fragmentColor0.w = intermediateValue9;
#elif RD_FEATURE_EXTENDED_GAP_FILL == RD_ON
    fragmentColor0.x = intermediateValue5;
    fragmentColor0.y = intermediateValue6;
    fragmentColor0.z = intermediateValue7;
    fragmentColor0.w = intermediateValue8;
#endif
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
