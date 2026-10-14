// displaymap / Blend / fragment forward pipeline.
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


#include "../../include/materials/displaymap/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = dot(float3(0.627403975,0.329281986,0.0433136001), workingVector0.xyz);
  workingVector1.y = dot(float3(0.0690969974,0.919539988,0.0113612004), workingVector0.xyz);
  workingVector1.z = dot(float3(0.0163915996,0.088013202,0.895595014), workingVector0.xyz);
  fragmentColor0.w = workingVector0.w;
  workingVector0.xyz = RD_UNIFORM_PAPER_WHITE.xxx * workingVector1.xyz;
  workingVector0.xyz = float3(9.99999975e-005,9.99999975e-005,9.99999975e-005) * workingVector0.xyz;
  workingVector0.xyz = log2(abs(workingVector0.xyz));
  workingVector0.xyz = float3(0.159301758,0.159301758,0.159301758) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector1.xyz = workingVector0.xyz * float3(18.8515625,18.8515625,18.8515625) + float3(0.8359375,0.8359375,0.8359375);
  workingVector0.xyz = workingVector0.xyz * float3(18.6875,18.6875,18.6875) + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz / workingVector0.xyz;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(78.84375,78.84375,78.84375) * workingVector0.xyz;
  fragmentColor0.xyz = exp2(workingVector0.xyz);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = texColorTexture.Sample(texColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue = RD_UNIFORM_PAPER_WHITE.x * 9.9999997473787516355514526367188e-05f;
    float multiplyAddValue = exp2(log2(abs(productValue * mad(0.043313600122928619384765625f, scalarValue2, mad(0.329281985759735107421875f, scalarValue1, scalarValue * 0.6274039745330810546875f)))) * 0.1593017578125f);
    float multiplyAddValue1 = exp2(log2(abs(mad(0.0113612003624439239501953125f, scalarValue2, mad(0.919539988040924072265625f, scalarValue1, scalarValue * 0.06909699738025665283203125f)) * productValue)) * 0.1593017578125f);
    float multiplyAddValue2 = exp2(log2(abs(mad(0.895595014095306396484375f, scalarValue2, mad(0.0880132019519805908203125f, scalarValue1, scalarValue * 0.01639159955084323883056640625f)) * productValue)) * 0.1593017578125f);
    fragmentColor0.x = exp2(log2(((multiplyAddValue * 18.8515625f) + 0.8359375f) / ((multiplyAddValue * 18.6875f) + 1.0f)) * 78.84375f);
    fragmentColor0.y = exp2(log2(((multiplyAddValue1 * 18.8515625f) + 0.8359375f) / ((multiplyAddValue1 * 18.6875f) + 1.0f)) * 78.84375f);
    fragmentColor0.z = exp2(log2(((multiplyAddValue2 * 18.8515625f) + 0.8359375f) / ((multiplyAddValue2 * 18.6875f) + 1.0f)) * 78.84375f);
    fragmentColor0.w = sampledTextureValue.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
