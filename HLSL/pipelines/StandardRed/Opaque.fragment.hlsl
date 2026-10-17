// StandardRed / Opaque / fragment forward pipeline.
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


#include "../../include/materials/StandardRed/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float3 varyingNormal0 : NORMAL0,
  float4 varyingColor1 : COLOR1,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.zzz + workingVector0.xyz;
  workingVector0.w = dot(-workingVector0.xyz, -workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = -workingVector0.xyz * workingVector0.www;
  workingVector0.w = dot(-varyingColor1.xyz, -varyingColor1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = -varyingColor1.xyz * workingVector0.www + workingVector0.xyz;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector0.w = saturate(dot(workingVector2.xyz, workingVector1.xyz));
  workingVector0.x = saturate(dot(workingVector2.xyz, workingVector0.xyz));
  workingVector0.y = log2(workingVector0.w);
  workingVector0.y = 0.455475569 * workingVector0.y;
  workingVector0.y = exp2(workingVector0.y);
  workingVector0.y = 0.170502543 * workingVector0.y;
  workingVector1.xyz = RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector1.xyz * workingVector0.xxx;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector3.xyz = RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.xyz * RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.www;
  workingVector1.xyz = workingVector3.xyz * workingVector2.xyz + workingVector1.xyz;
  fragmentColor0.xyz = workingVector0.yzw * workingVector2.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.zzz + workingVector0.xyz;
  workingVector0.w = dot(-workingVector0.xyz, -workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = -workingVector0.xyz * workingVector0.www;
  workingVector0.w = dot(-varyingColor1.xyz, -varyingColor1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = -varyingColor1.xyz * workingVector0.www + workingVector0.xyz;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector0.w = saturate(dot(workingVector2.xyz, workingVector1.xyz));
  workingVector0.x = saturate(dot(workingVector2.xyz, workingVector0.xyz));
  workingVector0.y = log2(workingVector0.w);
  workingVector0.y = 0.455475569 * workingVector0.y;
  workingVector0.y = exp2(workingVector0.y);
  workingVector0.y = 0.170502543 * workingVector0.y;
  workingVector1.xyz = RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector1.xyz * workingVector0.xxx;
  workingVector2.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector3.xyz = RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.xyz * RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.www;
  workingVector1.xyz = workingVector3.xyz * workingVector2.xyz + workingVector1.xyz;
  fragmentColor0.xyz = workingVector0.yzw * workingVector2.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue = inverseLengthValue * varyingNormal0.x;
    float productValue1 = inverseLengthValue * varyingNormal0.y;
    float productValue2 = inverseLengthValue * varyingNormal0.z;
    float multiplyAddValue = (-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue1 = (-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue2 = (-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue;
    float productValue4 = inverseLengthValue1 * multiplyAddValue1;
    float productValue5 = inverseLengthValue1 * multiplyAddValue2;
    float sumValue = (-0.0f) - varyingColor1.x;
    float sumValue1 = (-0.0f) - varyingColor1.y;
    float sumValue2 = (-0.0f) - varyingColor1.z;
    float inverseLengthValue2 = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue6 = (inverseLengthValue2 * sumValue) + productValue3;
    float productValue7 = (inverseLengthValue2 * sumValue1) + productValue4;
    float productValue8 = (inverseLengthValue2 * sumValue2) + productValue5;
    float inverseLengthValue3 = rsqrt(dot(float3(productValue6, productValue7, productValue8), float3(productValue6, productValue7, productValue8)));
    float clampedValue = (clamp(exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(productValue6 * inverseLengthValue3, productValue7 * inverseLengthValue3, productValue8 * inverseLengthValue3)), 0.0f, 1.0f)) * 0.4554755687713623046875f) * 0.17050254344940185546875f, 0.0f, 1.0f) + clamp(dot(float3(productValue, productValue1, productValue2), float3(productValue3, productValue4, productValue5)), 0.0f, 1.0f)) * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.w;
    fragmentColor0.x = ((RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.w * RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.x) + (clampedValue * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.x)) * sampledTextureValue.x;
    fragmentColor0.y = ((RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.w * RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.y) + (clampedValue * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.y)) * sampledTextureValue.y;
    fragmentColor0.z = ((RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.w * RD_UNIFORM_LIGHT_AMBIENT_COLOR_AND_INTENSITY.z) + (clampedValue * RD_UNIFORM_LIGHT_DIFFUSE_COLOR_AND_ILLUMINANCE.z)) * sampledTextureValue.z;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
