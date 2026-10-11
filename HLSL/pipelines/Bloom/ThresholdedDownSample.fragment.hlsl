// Bloom / ThresholdedDownSample / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/Bloom/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
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
  workingVector0.z = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector3.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
  workingVector0.w = RD_UNIFORM_BLOOM_PARAMS.y * workingVector3.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.w = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
  workingVector0.w = RD_UNIFORM_BLOOM_PARAMS.y * workingVector0.w;
#endif
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z >= workingVector0.w);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector2.xyzw = workingVector2.xyzw * workingVector0.zzzz;
  workingVector2.xyzw = float4(0.125,0.125,0.125,0.125) * workingVector2.xyzw;
  workingVector1.zw = min(varyingTexCoord0.xy, workingVector1.xy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector0.z = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z >= workingVector0.w);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector3.xyzw = workingVector3.xyzw * workingVector0.zzzz;
  workingVector2.xyzw = workingVector3.xyzw * float4(0.5,0.5,0.5,0.5) + workingVector2.xyzw;
  workingVector3.xy = float2(1.5,1.5) * workingVector0.xy;
  workingVector0.xy = -workingVector0.xy * float2(1.5,1.5) + varyingTexCoord0.xy;
  workingVector0.xy = min(workingVector0.xy, workingVector1.xy);
  workingVector4.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector3.zw = -workingVector3.xy;
  workingVector3.xyzw = varyingTexCoord0.xyxy + workingVector3.zyxw;
  workingVector1.xyzw = min(workingVector3.xyzw, workingVector1.xyxy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector0.x = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.w);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector3.xyzw = workingVector3.xyzw * workingVector0.xxxx;
  workingVector2.xyzw = workingVector3.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector2.xyzw;
  workingVector0.x = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.w);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector1.xyzw = workingVector1.xyzw * workingVector0.xxxx;
  workingVector1.xyzw = workingVector1.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector2.xyzw;
  workingVector0.x = dot(workingVector4.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.w);
  workingVector0.x = workingVector0.x ? 1.000000 : 0;
  workingVector0.xyzw = workingVector4.xyzw * workingVector0.xxxx;
  fragmentColor0.xyzw = workingVector0.xyzw * float4(0.125,0.125,0.125,0.125) + workingVector1.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float quotientValue = (3.0f / RD_UNIFORM_VIEWPORT_SCALE.z) * RD_UNIFORM_VIEWPORT_SCALE.x;
    float quotientValue1 = (3.0f / RD_UNIFORM_VIEWPORT_SCALE.w) * RD_UNIFORM_VIEWPORT_SCALE.y;
    float quotientValue2 = (floor(RD_UNIFORM_VIEWPORT_SCALE.x * RD_UNIFORM_VIEWPORT_SCALE.z) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.z;
    float quotientValue3 = (floor(RD_UNIFORM_VIEWPORT_SCALE.y * RD_UNIFORM_VIEWPORT_SCALE.w) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.w;
    float sampledTextureValue = averageLuminanceTexture.Sample(averageLuminanceSampler, 0.5f.xx).x * RD_UNIFORM_BLOOM_PARAMS.y;
    float4 sampledTextureValue1 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(min(varyingTexCoord0.x, quotientValue2), min(varyingTexCoord0.y, quotientValue3)));
    float scalarValue = sampledTextureValue1.x;
    float dotProductValue = (dot(float3(scalarValue, sampledTextureValue1.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < sampledTextureValue) ? 0.0f : 0.5f;
    float sumValue = min(quotientValue + varyingTexCoord0.x, quotientValue2);
    float sumValue1 = min(quotientValue1 + varyingTexCoord0.y, quotientValue3);
    float4 sampledTextureValue2 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue1));
    float scalarValue1 = sampledTextureValue2.x;
    float dotProductValue1 = (dot(float3(scalarValue1, sampledTextureValue2.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < sampledTextureValue) ? 0.0f : 1.0f;
    float sumValue2 = min(varyingTexCoord0.x - quotientValue, quotientValue2);
    float4 sampledTextureValue3 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue1));
    float scalarValue2 = sampledTextureValue3.x;
    float dotProductValue2 = (dot(float3(scalarValue2, sampledTextureValue3.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < sampledTextureValue) ? 0.0f : 1.0f;
    float sumValue3 = min(varyingTexCoord0.y - quotientValue1, quotientValue3);
    float4 sampledTextureValue4 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue3));
    float scalarValue3 = sampledTextureValue4.x;
    float dotProductValue3 = (dot(float3(scalarValue3, sampledTextureValue4.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < sampledTextureValue) ? 0.0f : 1.0f;
    float4 sampledTextureValue5 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue3));
    float scalarValue4 = sampledTextureValue5.x;
    float dotProductValue4 = (dot(float3(scalarValue4, sampledTextureValue5.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) < sampledTextureValue) ? 0.0f : 1.0f;
    fragmentColor0.x = (((((dotProductValue2 * scalarValue2) + (dotProductValue1 * scalarValue1)) + (dotProductValue3 * scalarValue3)) + (dotProductValue4 * scalarValue4)) * 0.125f) + (dotProductValue * scalarValue);
    fragmentColor0.y = (((((dotProductValue2 * sampledTextureValue3.y) + (dotProductValue1 * sampledTextureValue2.y)) + (dotProductValue3 * sampledTextureValue4.y)) + (dotProductValue4 * sampledTextureValue5.y)) * 0.125f) + (dotProductValue * sampledTextureValue1.y);
    fragmentColor0.z = (((((dotProductValue2 * sampledTextureValue3.z) + (dotProductValue1 * sampledTextureValue2.z)) + (dotProductValue3 * sampledTextureValue4.z)) + (dotProductValue4 * sampledTextureValue5.z)) * 0.125f) + (dotProductValue * sampledTextureValue1.z);
    fragmentColor0.w = (((((dotProductValue2 * sampledTextureValue3.w) + (dotProductValue1 * sampledTextureValue2.w)) + (dotProductValue3 * sampledTextureValue4.w)) + (dotProductValue4 * sampledTextureValue5.w)) * 0.125f) + (dotProductValue * sampledTextureValue1.w);
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
