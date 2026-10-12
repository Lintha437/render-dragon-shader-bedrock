// Flipbook / Blit / fragment forward pipeline.
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


#include "../../include/materials/Flipbook/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord1 : TEXCOORD1,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord1.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w >= 0.00999999978);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector3.xyzw = -workingVector2.xyzw + workingVector0.xyzw;
  workingVector3.xyzw = RD_UNIFORM_V_BLEND_CONTROL.zzzz * workingVector3.xyzw + workingVector2.xyzw;
  workingVector1.xyzw = workingVector1.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.w < 0.00999999978);
  fragmentColor0.xyzw = workingVector2.xxxx ? workingVector0.xyzw : workingVector1.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = blitTextureTexture.Sample(blitTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float4 sampledTextureValue1 = blitTextureTexture.Sample(blitTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if (scalarValue3 < 0.00999999977648258209228515625f)
    {
        intermediateValue8 = scalarValue4;
        intermediateValue9 = scalarValue5;
        intermediateValue10 = scalarValue6;
        intermediateValue11 = scalarValue7;
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (!(scalarValue7 >= 0.00999999977648258209228515625f))
        {
            branchMergedValue = scalarValue;
            branchMergedValue1 = scalarValue1;
            branchMergedValue2 = scalarValue2;
            branchMergedValue3 = scalarValue3;
        }
        else
        {
            branchMergedValue = (RD_UNIFORM_V_BLEND_CONTROL.z * (scalarValue4 - scalarValue)) + scalarValue;
            branchMergedValue1 = (RD_UNIFORM_V_BLEND_CONTROL.z * (scalarValue5 - scalarValue1)) + scalarValue1;
            branchMergedValue2 = (RD_UNIFORM_V_BLEND_CONTROL.z * (scalarValue6 - scalarValue2)) + scalarValue2;
            branchMergedValue3 = (RD_UNIFORM_V_BLEND_CONTROL.z * (scalarValue7 - scalarValue3)) + scalarValue3;
        }
        intermediateValue8 = branchMergedValue;
        intermediateValue9 = branchMergedValue1;
        intermediateValue10 = branchMergedValue2;
        intermediateValue11 = branchMergedValue3;
    }
    fragmentColor0.x = intermediateValue8;
    fragmentColor0.y = intermediateValue9;
    fragmentColor0.z = intermediateValue10;
    fragmentColor0.w = intermediateValue11;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
