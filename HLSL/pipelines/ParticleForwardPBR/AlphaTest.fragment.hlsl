// ParticleForwardPBR / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ParticleForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float3 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor1 : COLOR1,
  float3 varyingNormal0 : NORMAL0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord1 : TEXCOORD1,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor0.xyz + varyingColor1.xyz;
  fragmentColor0.xyz = varyingColor1.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = particleTextureTexture.Sample(particleTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5f)
    {
        isFragmentDiscarded = true;
    }
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    fragmentColor0.x = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    fragmentColor0.y = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    fragmentColor0.z = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.w = 1.0f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor1 = stage_input.varyingColor1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
