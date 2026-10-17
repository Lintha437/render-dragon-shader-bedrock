// Particle / Transparent / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/Particle/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = -workingVector0.xyz * varyingColor0.xyz + varyingColor1.xyz;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyz = varyingColor1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = varyingColor1.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor1.www * workingVector1.xyz + workingVector0.xyz;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = particleTextureTexture.Sample(particleTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.x = ((varyingColor1.x - productValue3) * varyingColor1.w) + productValue3;
    fragmentColor0.y = ((varyingColor1.y - productValue4) * varyingColor1.w) + productValue4;
    fragmentColor0.z = ((varyingColor1.z - productValue5) * varyingColor1.w) + productValue5;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
