// GammaScreenColorPostProcessing / ColorPostProcess / fragment forward pipeline.
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


#include "../../include/materials/GammaScreenColorPostProcessing/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
#endif
  workingVector1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector1.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector1.xyz;
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector1.xyz = workingVector3.xyz ? workingVector2.xyz : workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC.y);
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : workingVector1.xyz;
  workingVector1.xyz = log2(abs(workingVector0.xyz));
  workingVector1.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector1.xyz = workingVector1.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  workingVector2.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector0.xyz;
  workingVector3.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector0.xyz);
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector1.xyz = workingVector3.xyz ? workingVector2.xyz : workingVector1.xyz;
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.w = 2.20000005 * RD_UNIFORM_COLOR_GRADING_MISC.x;
  workingVector2.x = 2.20000005 / workingVector1.w;
  workingVector1.w = 1 / workingVector1.w;
  workingVector0.xyz = workingVector1.www * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector1.xyz = workingVector2.xxx * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector0.xyz = workingVector0.www ? workingVector0.xyz : workingVector1.xyz;
  fragmentColor0.xyz = min(float3(1,1,1), workingVector0.xyz);
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = colorTextureTexture.Sample(colorTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_MISC.y != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue <= 0.040449999272823333740234375f) ? (scalarValue * 0.077399380505084991455078125f) : exp2(log2((scalarValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float nonlinearValue;
    float nonlinearValue1;
    float nonlinearValue2;
    if (RD_UNIFORM_COLOR_GRADING_MISC.y != 0.0f)
    {
        float quotientValue = 0.454545438289642333984375f / RD_UNIFORM_COLOR_GRADING_MISC.x;
        nonlinearValue = log2(max(exponentialValue, 0.0f)) * quotientValue;
        nonlinearValue1 = log2(max(exponentialValue1, 0.0f)) * quotientValue;
        nonlinearValue2 = log2(max(exponentialValue2, 0.0f)) * quotientValue;
    }
    else
    {
        float quotientValue1 = 1.0f / RD_UNIFORM_COLOR_GRADING_MISC.x;
        nonlinearValue = log2((exponentialValue <= 0.003130800090730190277099609375f) ? (exponentialValue * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * quotientValue1;
        nonlinearValue1 = log2((exponentialValue1 <= 0.003130800090730190277099609375f) ? (exponentialValue1 * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue1)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * quotientValue1;
        nonlinearValue2 = log2((exponentialValue2 <= 0.003130800090730190277099609375f) ? (exponentialValue2 * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue2)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * quotientValue1;
    }
    fragmentColor0.x = min(max(exp2(nonlinearValue), 0.0f), 1.0f);
    fragmentColor0.y = min(max(exp2(nonlinearValue1), 0.0f), 1.0f);
    fragmentColor0.z = min(max(exp2(nonlinearValue2), 0.0f), 1.0f);
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
