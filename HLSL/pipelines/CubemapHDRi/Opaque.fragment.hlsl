// CubemapHDRi / Opaque / fragment forward pipeline.
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


#include "../../include/materials/CubemapHDRi/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = dot(varyingTexCoord0.xyz, varyingTexCoord0.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = varyingTexCoord0.xyz * workingVector0.xxx;
  workingVector0.w = -workingVector0.x;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.wyz).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.x != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.x = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
#endif
    workingVector1.x = 0.180000007 / workingVector1.x;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
  } else {
    workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
    workingVector1.yzw = max(float3(0,0,0), workingVector0.xyz);
    workingVector1.yzw = log2(workingVector1.yzw);
    workingVector1.yzw = float3(2.20000005,2.20000005,2.20000005) * workingVector1.yzw;
    workingVector1.yzw = exp2(workingVector1.yzw);
    workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
    workingVector3.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
    workingVector3.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector3.xyz;
    workingVector3.xyz = log2(workingVector3.xyz);
    workingVector3.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector3.xyz;
    workingVector3.xyz = exp2(workingVector3.xyz);
    workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
    workingVector2.xyz = workingVector4.xyz ? workingVector2.xyz : workingVector3.xyz;
    workingVector0.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector2.xyz;
  }
  fragmentColor0.xyzw = workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float inverseLengthValue = rsqrt(dot(float3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z), float3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z)));
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float3((-0.0f) - (varyingTexCoord0.x * inverseLengthValue), inverseLengthValue * varyingTexCoord0.y, inverseLengthValue * varyingTexCoord0.z));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue;
    float productValue1;
    float productValue2;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue1 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue = sampledTextureValue1 * scalarValue;
        productValue1 = sampledTextureValue1 * scalarValue1;
        productValue2 = sampledTextureValue1 * scalarValue2;
    }
    else
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
        {
            branchMergedValue = exp2(log2(max(scalarValue, 0.0f)) * 2.2000000476837158203125f);
            branchMergedValue1 = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
            branchMergedValue2 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
        }
        else
        {
            branchMergedValue = (scalarValue <= 0.040449999272823333740234375f) ? (scalarValue * 0.077399380505084991455078125f) : exp2(log2((scalarValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
            branchMergedValue1 = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
            branchMergedValue2 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        }
        productValue = branchMergedValue;
        productValue1 = branchMergedValue1;
        productValue2 = branchMergedValue2;
    }
    fragmentColor0.x = productValue;
    fragmentColor0.y = productValue1;
    fragmentColor0.z = productValue2;
    fragmentColor0.w = sampledTextureValue.w;
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
