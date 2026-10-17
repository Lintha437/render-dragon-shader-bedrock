// Cubemap / Opaque / fragment forward pipeline.
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


#include "../../include/materials/Cubemap/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = dot(varyingTexCoord0.xyz, varyingTexCoord0.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = varyingTexCoord0.xyz * workingVector0.xxx;
  workingVector0.w = -workingVector0.x;
  fragmentColor0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.wyz).xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue = rsqrt(dot(float3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z), float3(varyingTexCoord0.x, varyingTexCoord0.y, varyingTexCoord0.z)));
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float3((-0.0f) - (varyingTexCoord0.x * inverseLengthValue), inverseLengthValue * varyingTexCoord0.y, inverseLengthValue * varyingTexCoord0.z));
    fragmentColor0.x = sampledTextureValue.x;
    fragmentColor0.y = sampledTextureValue.y;
    fragmentColor0.z = sampledTextureValue.z;
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
