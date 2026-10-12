// WaterPrepass / DepthAndNormal / fragment forward pipeline.
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/WaterPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  workingVector0.xyz = workingVector0.xyz / workingVector0.www;
  workingVector0.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector0.yy;
  workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector0.xx + workingVector0.yw;
  workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector0.zz + workingVector0.xy;
  workingVector0.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector0.xy;
  workingVector0.x = -workingVector0.x / workingVector0.y;
  workingVector0.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.x;
  workingVector0.y = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
  workingVector0.x = workingVector0.x / workingVector0.y;
  workingVector0.x = workingVector0.x * 53.5981483 + 1;
  workingVector0.x = log2(workingVector0.x);
  fragmentColor0.x = 0.173286796 * workingVector0.x;
  workingVector0.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.x = dot(varyingNormal0.xyz, workingVector0.xyz);
  fragmentColor0.y = abs(workingVector0.x);
  fragmentColor0.zw = float2(0,1);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = (mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue;
    float multiplyAddValue2 = (mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue;
    float multiplyAddValue3 = (mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue;
    float sumValue = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    fragmentColor0.x = log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue3, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue2, multiplyAddValue1 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue3, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue2, multiplyAddValue1 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
    fragmentColor0.y = abs(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(inverseLengthValue * sumValue, inverseLengthValue * sumValue1, inverseLengthValue * sumValue2)));
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
