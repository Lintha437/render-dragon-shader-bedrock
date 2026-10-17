// Bloom / DFDownSample / fragment forward pipeline.
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


#include "../../include/materials/Bloom/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = float2(2,2) / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.xy = RD_UNIFORM_VIEWPORT_SCALE.xy * workingVector0.xy;
  workingVector0.zw = workingVector0.xy * float2(1.5,1.5) + varyingTexCoord0.xy;
  workingVector1.xy = RD_UNIFORM_VIEWPORT_SCALE.zw * RD_UNIFORM_VIEWPORT_SCALE.xy;
  workingVector1.xy = floor(workingVector1.xy);
  workingVector1.xy = float2(-0.5,-0.5) + workingVector1.xy;
  workingVector1.xy = workingVector1.xy / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.zw = min(workingVector1.xy, workingVector0.zw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector2.xyzw = float4(0.125,0.125,0.125,0.125) * workingVector2.xyzw;
  workingVector0.zw = min(varyingTexCoord0.xy, workingVector1.xy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector2.xyzw = workingVector3.xyzw * float4(0.5,0.5,0.5,0.5) + workingVector2.xyzw;
  workingVector3.xy = float2(1.5,1.5) * workingVector0.xy;
  workingVector0.xy = -workingVector0.xy * float2(1.5,1.5) + varyingTexCoord0.xy;
  workingVector0.xy = min(workingVector0.xy, workingVector1.xy);
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector3.zw = -workingVector3.xy;
  workingVector3.xyzw = varyingTexCoord0.xyxy + workingVector3.zyxw;
  workingVector1.xyzw = min(workingVector3.xyzw, workingVector1.xyxy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector2.xyzw = workingVector3.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector2.xyzw;
  workingVector1.xyzw = workingVector1.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector2.xyzw;
  fragmentColor0.xyzw = workingVector0.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector1.xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = (3.0f / RD_UNIFORM_VIEWPORT_SCALE.z) * RD_UNIFORM_VIEWPORT_SCALE.x;
    float quotientValue1 = (3.0f / RD_UNIFORM_VIEWPORT_SCALE.w) * RD_UNIFORM_VIEWPORT_SCALE.y;
    float quotientValue2 = (floor(RD_UNIFORM_VIEWPORT_SCALE.x * RD_UNIFORM_VIEWPORT_SCALE.z) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.z;
    float quotientValue3 = (floor(RD_UNIFORM_VIEWPORT_SCALE.y * RD_UNIFORM_VIEWPORT_SCALE.w) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.w;
    float4 sampledTextureValue = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(min(varyingTexCoord0.x, quotientValue2), min(varyingTexCoord0.y, quotientValue3)));
    float sumValue = min(quotientValue + varyingTexCoord0.x, quotientValue2);
    float sumValue1 = min(quotientValue1 + varyingTexCoord0.y, quotientValue3);
    float4 sampledTextureValue1 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue1));
    float sumValue2 = min(varyingTexCoord0.x - quotientValue, quotientValue2);
    float4 sampledTextureValue2 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue1));
    float sumValue3 = min(varyingTexCoord0.y - quotientValue1, quotientValue3);
    float4 sampledTextureValue3 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue3));
    float4 sampledTextureValue4 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue3));
    fragmentColor0.x = ((((sampledTextureValue2.x + sampledTextureValue1.x) + sampledTextureValue3.x) + sampledTextureValue4.x) * 0.125f) + (sampledTextureValue.x * 0.5f);
    fragmentColor0.y = ((((sampledTextureValue2.y + sampledTextureValue1.y) + sampledTextureValue3.y) + sampledTextureValue4.y) * 0.125f) + (sampledTextureValue.y * 0.5f);
    fragmentColor0.z = ((((sampledTextureValue2.z + sampledTextureValue1.z) + sampledTextureValue3.z) + sampledTextureValue4.z) * 0.125f) + (sampledTextureValue.z * 0.5f);
    fragmentColor0.w = ((((sampledTextureValue2.w + sampledTextureValue1.w) + sampledTextureValue3.w) + sampledTextureValue4.w) * 0.125f) + (sampledTextureValue.w * 0.5f);
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
