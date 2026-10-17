// BlitHDR / Blit / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/BlitHDR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
  workingVector0.x = 0.180000007 / workingVector0.x;
  workingVector0.x = 9.99999975e-005 + workingVector0.x;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  fragmentColor0.xyz = workingVector1.xyz / workingVector0.xxx;
  fragmentColor0.w = workingVector1.w;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
  workingVector0.x = 0.180000007 / workingVector0.x;
  workingVector0.x = 9.99999975e-005 + workingVector0.x;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  fragmentColor0.xyz = workingVector1.xyz / workingVector0.xxx;
  fragmentColor0.w = workingVector1.w;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = blitTextureTexture.Sample(blitTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sampledTextureValue1 = (0.180000007152557373046875f / averageLuminanceTexture.Sample(averageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
    fragmentColor0.x = sampledTextureValue.x / sampledTextureValue1;
    fragmentColor0.y = sampledTextureValue.y / sampledTextureValue1;
    fragmentColor0.z = sampledTextureValue.z / sampledTextureValue1;
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
