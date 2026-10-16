// HiZDownSample / MinMaxDownSample / fragment forward pipeline.
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


#include "../../include/materials/HiZDownSample/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(-0.5,-0.5,0.5,-0.5) + varyingTexCoord0.xyxy;
  workingVector1.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector0.xy, RD_UNIFORM_MIP_LEVEL.x).xyzw;
  workingVector0.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector0.zw, RD_UNIFORM_MIP_LEVEL.x).xyzw;
  workingVector0.zw = float2(1,1) + -workingVector0.xy;
  workingVector0.xy = float2(1,1) + -workingVector1.xy;
  workingVector1.xyzw = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(-0.5,0.5,0.5,0.5) + varyingTexCoord0.xyxy;
  workingVector2.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector1.xy, RD_UNIFORM_MIP_LEVEL.x).xyzw;
  workingVector1.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector1.zw, RD_UNIFORM_MIP_LEVEL.x).xyzw;
  workingVector1.zw = float2(1,1) + -workingVector1.xy;
  workingVector1.xy = float2(1,1) + -workingVector2.xy;
  workingVector0.xz = min(workingVector1.xz, workingVector0.xz);
  workingVector0.yw = max(workingVector1.yw, workingVector0.yw);
  workingVector0.y = max(workingVector0.y, workingVector0.w);
  workingVector0.x = min(workingVector0.x, workingVector0.z);
  fragmentColor0.xy = float2(1,1) + -workingVector0.xy;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(-0.5,-0.5,0.5,-0.5) + varyingTexCoord0.xyxy;
  workingVector0.xy = materialTexture0.SampleLevel(textureSampler0, workingVector0.xy, RD_UNIFORM_MIP_LEVEL.x).xy;
  workingVector0.zw = materialTexture0.SampleLevel(textureSampler0, workingVector0.zw, RD_UNIFORM_MIP_LEVEL.x).xy;
  workingVector1.xyzw = float4(1,1,1,1) + -workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(-0.5,0.5,0.5,0.5) + varyingTexCoord0.xyxy;
  workingVector0.xy = materialTexture0.SampleLevel(textureSampler0, workingVector0.xy, RD_UNIFORM_MIP_LEVEL.x).xy;
  workingVector0.zw = materialTexture0.SampleLevel(textureSampler0, workingVector0.zw, RD_UNIFORM_MIP_LEVEL.x).xy;
  workingVector2.xyzw = float4(1,1,1,1) + -workingVector0.xyzw;
  workingVector0.xy = min(workingVector2.xz, workingVector1.xz);
  workingVector0.zw = max(workingVector2.yw, workingVector1.yw);
  workingVector0.z = max(workingVector0.z, workingVector0.w);
  workingVector0.x = min(workingVector0.x, workingVector0.y);
  fragmentColor0.xy = float2(1,1) + -workingVector0.xz;
  fragmentColor0.zw = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.z * 0.5f;
    float productValue1 = RD_UNIFORM_PREVIOUS_MIP_RESOLUTION_AND_RECIP_RESOLUTION.w * 0.5f;
    float sumValue = varyingTexCoord0.x - productValue;
    float sumValue1 = varyingTexCoord0.y - productValue1;
    float4 sampledTextureValue = previousMipTexture.SampleLevel(previousMipSampler, float2(sumValue, sumValue1), RD_UNIFORM_MIP_LEVEL.x);
    float sumValue2 = productValue + varyingTexCoord0.x;
    float4 sampledTextureValue1 = previousMipTexture.SampleLevel(previousMipSampler, float2(sumValue2, sumValue1), RD_UNIFORM_MIP_LEVEL.x);
    float sumValue3 = productValue1 + varyingTexCoord0.y;
    float4 sampledTextureValue2 = previousMipTexture.SampleLevel(previousMipSampler, float2(sumValue, sumValue3), RD_UNIFORM_MIP_LEVEL.x);
    float4 sampledTextureValue3 = previousMipTexture.SampleLevel(previousMipSampler, float2(sumValue2, sumValue3), RD_UNIFORM_MIP_LEVEL.x);
    fragmentColor0.x = 1.0f - min(min(1.0f - sampledTextureValue.x, 1.0f - sampledTextureValue2.x), min(1.0f - sampledTextureValue1.x, 1.0f - sampledTextureValue3.x));
    fragmentColor0.y = 1.0f - max(max(1.0f - sampledTextureValue.y, 1.0f - sampledTextureValue2.y), max(1.0f - sampledTextureValue1.y, 1.0f - sampledTextureValue3.y));
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
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
