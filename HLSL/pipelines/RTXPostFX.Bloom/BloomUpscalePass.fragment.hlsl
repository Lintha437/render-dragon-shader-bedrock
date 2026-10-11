// RTXPostFX.Bloom / BloomUpscalePass / fragment forward pipeline.
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
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  fragmentColor0.xyz = max(float3(0,0,0), workingVector0.xyz);
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  fragmentColor0.xyz = max(float3(0,0,0), workingVector0.xyz);
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = rasterColorTexture.Sample(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = max(sampledTextureValue.x, 0.0f);
    fragmentColor0.y = max(sampledTextureValue.y, 0.0f);
    fragmentColor0.z = max(sampledTextureValue.z, 0.0f);
    fragmentColor0.w = 1.0f;
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
