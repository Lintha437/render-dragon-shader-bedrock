// LegacyCubemap / ForceForwardPBROpaque / fragment forward pipeline.
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


#include "../../include/materials/LegacyCubemap/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.x != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture1.Sample(textureSampler1, float2(0.5,0.5)).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.x = materialTexture1.Sample(textureSampler1, float2(0.5,0.5)).x;
#endif
    workingVector1.x = 0.180000007 / workingVector1.x;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
  }
  fragmentColor0.xyzw = workingVector0.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
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
        productValue = scalarValue;
        productValue1 = scalarValue1;
        productValue2 = scalarValue2;
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
