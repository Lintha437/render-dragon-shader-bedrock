// Bloom / BloomBlend / fragment forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_VIEWPORT_SCALE.zw * RD_UNIFORM_VIEWPORT_SCALE.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(-0.5,-0.5) + workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.zw = float2(0.5,0.5) / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.zw = RD_UNIFORM_VIEWPORT_SCALE.xy * workingVector0.zw;
  workingVector1.xy = workingVector0.zw * float2(2,2) + varyingTexCoord0.xy;
  workingVector1.xy = min(workingVector1.xy, workingVector0.xy);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector2.xyzw = workingVector0.zwzw * float4(-2,2,2,-2) + varyingTexCoord0.xyxy;
  workingVector2.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.xy).xyzw;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.zw).xyzw;
  workingVector3.xyz = float3(0.165999994,0.165999994,0.165999994) * workingVector3.xyz;
  workingVector1.xyz = workingVector1.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector3.xyz;
  workingVector1.xyz = workingVector2.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector1.xyz;
  workingVector2.xyzw = workingVector0.zwzw * float4(-2,-2,4,4) + varyingTexCoord0.xyxy;
  workingVector2.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.xy).xyzw;
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.zw).xyzw;
  workingVector1.xyz = workingVector3.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector2.xy = float2(4,4) * workingVector0.zw;
  workingVector0.zw = -workingVector0.zw * float2(4,4) + varyingTexCoord0.xy;
  workingVector0.zw = min(workingVector0.zw, workingVector0.xy);
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector2.xyzw = workingVector2.xyxy * float4(-1,1,1,-1) + varyingTexCoord0.xyxy;
  workingVector0.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector1.xyz = workingVector2.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector0.xyz = workingVector3.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  fragmentColor0.xyz = RD_UNIFORM_BLOOM_PARAMS.xxx * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_VIEWPORT_SCALE.zw * RD_UNIFORM_VIEWPORT_SCALE.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(-0.5,-0.5) + workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.zw = float2(0.5,0.5) / RD_UNIFORM_VIEWPORT_SCALE.zw;
  workingVector0.zw = RD_UNIFORM_VIEWPORT_SCALE.xy * workingVector0.zw;
  workingVector1.xy = workingVector0.zw * float2(2,2) + varyingTexCoord0.xy;
  workingVector1.xy = min(workingVector1.xy, workingVector0.xy);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector2.xyzw = workingVector0.zwzw * float4(-2,2,2,-2) + varyingTexCoord0.xyxy;
  workingVector2.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector3.xyz = materialTexture1.Sample(textureSampler1, workingVector2.xy).xyz;
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector2.zw).xyz;
  workingVector3.xyz = float3(0.165999994,0.165999994,0.165999994) * workingVector3.xyz;
  workingVector1.xyz = workingVector1.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector3.xyz;
  workingVector1.xyz = workingVector2.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector1.xyz;
  workingVector2.xyzw = workingVector0.zwzw * float4(-2,-2,4,4) + varyingTexCoord0.xyxy;
  workingVector2.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector3.xyz = materialTexture1.Sample(textureSampler1, workingVector2.xy).xyz;
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector2.zw).xyz;
  workingVector1.xyz = workingVector3.xyz * float3(0.165999994,0.165999994,0.165999994) + workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector2.xy = float2(4,4) * workingVector0.zw;
  workingVector0.zw = -workingVector0.zw * float2(4,4) + varyingTexCoord0.xy;
  workingVector0.zw = min(workingVector0.zw, workingVector0.xy);
  workingVector3.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector2.xyzw = workingVector2.xyxy * float4(-1,1,1,-1) + varyingTexCoord0.xyxy;
  workingVector0.xyzw = min(workingVector2.xyzw, workingVector0.xyxy);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector1.xyz = workingVector2.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector1.xyz;
  workingVector0.xyz = workingVector3.xyz * float3(0.0829999968,0.0829999968,0.0829999968) + workingVector0.xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyz;
  fragmentColor0.xyz = RD_UNIFORM_BLOOM_PARAMS.xxx * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = (2.0f / RD_UNIFORM_VIEWPORT_SCALE.z) * RD_UNIFORM_VIEWPORT_SCALE.x;
    float quotientValue1 = (2.0f / RD_UNIFORM_VIEWPORT_SCALE.w) * RD_UNIFORM_VIEWPORT_SCALE.y;
    float quotientValue2 = (floor(RD_UNIFORM_VIEWPORT_SCALE.x * RD_UNIFORM_VIEWPORT_SCALE.z) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.z;
    float quotientValue3 = (floor(RD_UNIFORM_VIEWPORT_SCALE.y * RD_UNIFORM_VIEWPORT_SCALE.w) + (-0.5f)) / RD_UNIFORM_VIEWPORT_SCALE.w;
    float productValue = quotientValue * 0.5f;
    float productValue1 = quotientValue1 * 0.5f;
    float sumValue = min(productValue + varyingTexCoord0.x, quotientValue2);
    float sumValue1 = min(productValue1 + varyingTexCoord0.y, quotientValue3);
    float4 sampledTextureValue = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue1));
    float sumValue2 = min(varyingTexCoord0.x - productValue, quotientValue2);
    float4 sampledTextureValue1 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue1));
    float sumValue3 = min(varyingTexCoord0.y - productValue1, quotientValue3);
    float4 sampledTextureValue2 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue, sumValue3));
    float4 sampledTextureValue3 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue2, sumValue3));
    float sumValue4 = min(varyingTexCoord0.x + quotientValue, quotientValue2);
    float sumValue5 = min(varyingTexCoord0.y + quotientValue1, quotientValue3);
    float4 sampledTextureValue4 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue4, sumValue5));
    float sumValue6 = min(varyingTexCoord0.x - quotientValue, quotientValue2);
    float4 sampledTextureValue5 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue6, sumValue5));
    float sumValue7 = min(varyingTexCoord0.y - quotientValue1, quotientValue3);
    float4 sampledTextureValue6 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue4, sumValue7));
    float4 sampledTextureValue7 = blurPyramidTextureTexture.Sample(blurPyramidTextureSampler, float2(sumValue6, sumValue7));
    float4 sampledTextureValue8 = hdRiTexture.Sample(hdRiSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (RD_UNIFORM_BLOOM_PARAMS.x * (((((sampledTextureValue5.x + sampledTextureValue4.x) + sampledTextureValue6.x) + sampledTextureValue7.x) * 0.082999996840953826904296875f) + ((((sampledTextureValue1.x + sampledTextureValue.x) + sampledTextureValue2.x) + sampledTextureValue3.x) * 0.16599999368190765380859375f))) + sampledTextureValue8.x;
    fragmentColor0.y = (RD_UNIFORM_BLOOM_PARAMS.x * (((((sampledTextureValue5.y + sampledTextureValue4.y) + sampledTextureValue6.y) + sampledTextureValue7.y) * 0.082999996840953826904296875f) + ((((sampledTextureValue1.y + sampledTextureValue.y) + sampledTextureValue2.y) + sampledTextureValue3.y) * 0.16599999368190765380859375f))) + sampledTextureValue8.y;
    fragmentColor0.z = (RD_UNIFORM_BLOOM_PARAMS.x * (((((sampledTextureValue5.z + sampledTextureValue4.z) + sampledTextureValue6.z) + sampledTextureValue7.z) * 0.082999996840953826904296875f) + ((((sampledTextureValue1.z + sampledTextureValue.z) + sampledTextureValue2.z) + sampledTextureValue3.z) * 0.16599999368190765380859375f))) + sampledTextureValue8.z;
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
