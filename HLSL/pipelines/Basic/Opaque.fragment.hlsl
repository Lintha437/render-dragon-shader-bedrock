// Basic / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_SAMPLE_MAT_TEXTURE
#define RD_FEATURE_SAMPLE_MAT_TEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TRANSFORM_UV0
#define RD_FEATURE_TRANSFORM_UV0 RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/Basic/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingTexCoord1 : TEXCOORD1,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * varyingColor0.xyzw;
  return;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  return;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x * varyingColor0.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y * varyingColor0.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z * varyingColor0.z;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w * varyingColor0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SAMPLE_MAT_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (RD_UNIFORM_MAT_COLOR.x * varyingColor0.x) * sampledTextureValue.x;
    fragmentColor0.y = (RD_UNIFORM_MAT_COLOR.y * varyingColor0.y) * sampledTextureValue.y;
    fragmentColor0.z = (RD_UNIFORM_MAT_COLOR.z * varyingColor0.z) * sampledTextureValue.z;
    fragmentColor0.w = (RD_UNIFORM_MAT_COLOR.w * varyingColor0.w) * sampledTextureValue.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
