// RTXPostFX.Bloom / BloomFinalPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
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
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.xyz = RD_UNIFORM_G_BLOOM_MULTIPLIER.xxx * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.xyz = RD_UNIFORM_G_BLOOM_MULTIPLIER.xxx * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = gBloomOriginalInputTexture.Sample(gBloomOriginalInputSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float4 sampledTextureValue1 = rasterColorTexture.Sample(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (RD_UNIFORM_G_BLOOM_MULTIPLIER.x * (max(sampledTextureValue1.x, 0.0f) - scalarValue)) + scalarValue;
    fragmentColor0.y = (RD_UNIFORM_G_BLOOM_MULTIPLIER.x * (max(sampledTextureValue1.y, 0.0f) - scalarValue1)) + scalarValue1;
    fragmentColor0.z = (RD_UNIFORM_G_BLOOM_MULTIPLIER.x * (max(sampledTextureValue1.z, 0.0f) - scalarValue2)) + scalarValue2;
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
