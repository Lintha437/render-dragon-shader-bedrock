// ParticlePrepass / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ParticlePrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float3 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor1 : COLOR1,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord1 : TEXCOORD1,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  fragmentColor0.xyzw = float4(0,0,0,0);
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = -workingVector0.xyz * varyingColor0.xyz + varyingColor1.xyz;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyz = varyingColor1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor1.w = workingVector0.w;
  workingVector1.xyz = varyingColor1.xyz + -workingVector0.xyz;
  fragmentColor1.xyz = varyingColor1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor2.xyzw = float4(0,0,0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = particleTextureTexture.Sample(particleTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    fragmentColor0.x = 0u;
    fragmentColor0.y = 0u;
    fragmentColor0.z = 0u;
    fragmentColor0.w = 0u;
    fragmentColor1.x = ((varyingColor1.x - productValue3) * varyingColor1.w) + productValue3;
    fragmentColor1.y = ((varyingColor1.y - productValue4) * varyingColor1.w) + productValue4;
    fragmentColor1.z = ((varyingColor1.z - productValue5) * varyingColor1.w) + productValue5;
    fragmentColor1.w = sampledTextureValue.w * varyingColor0.w;
    fragmentColor2.x = 0.0f;
    fragmentColor2.y = 0.0f;
    fragmentColor2.z = 0.0f;
    fragmentColor2.w = 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor1 = stage_input.varyingColor1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
#endif
}
