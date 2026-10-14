// RTXPostFX.Bloom / BloomDownscaleUniformPass / fragment forward pipeline.
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


#include "../../include/materials/RTXPostFX.Bloom/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
#endif
  workingVector1.xyz = (int3)workingVector0.xyz & int3(0x7f800000,0x7f800000,0x7f800000);
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyz = RD_COMPARISON_MASK((int3)workingVector1.xyz == int3(0x7f800000,0x7f800000,0x7f800000));
  workingVector0.w = (int)workingVector1.y | (int)workingVector1.x;
  workingVector0.w = (int)workingVector1.z | (int)workingVector0.w;
  fragmentColor0.xyz = workingVector0.www ? float3(0,0,0) : workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = rasterColorTexture.Sample(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (((asuint(scalarValue2) & 2139095040u) == 2139095040u) || (((asuint(scalarValue) & 2139095040u) == 2139095040u) || ((asuint(scalarValue1) & 2139095040u) == 2139095040u)))
    {
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
    }
    else
    {
        intermediateValue3 = max(scalarValue, 0.0f);
        intermediateValue4 = max(scalarValue1, 0.0f);
        intermediateValue5 = max(scalarValue2, 0.0f);
    }
    fragmentColor0.x = intermediateValue3;
    fragmentColor0.y = intermediateValue4;
    fragmentColor0.z = intermediateValue5;
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
