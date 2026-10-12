// LegacyCubemap / TransparentDegamma / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/LegacyCubemap/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector1.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector1.xyz;
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector1.xyz = workingVector3.xyz ? workingVector2.xyz : workingVector1.xyz;
  workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  fragmentColor0.w = workingVector0.w;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  fragmentColor0.xyz = workingVector1.www ? workingVector0.xyz : workingVector1.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
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
    fragmentColor0.x = exponentialValue;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue2;
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
