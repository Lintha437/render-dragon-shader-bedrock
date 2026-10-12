// CloudsForwardPBR / MotionOnly / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif


#include "../../include/materials/CloudsForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  int varyingTexCoord4 : TEXCOORD4,
  float4 varyingColor0 : COLOR0,
  float4 varyingFragmentPosition0 : FRAGPOSITION0,
  float3 varyingNormal0 : NORMAL0,
  float4 varyingTexCoord6 : TEXCOORD6,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord6.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector0.zw = workingVector1.xy / workingVector1.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor0.zw = workingVector0.zw + -workingVector0.xy;
  fragmentColor0.xy = float2(0,0);
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue = varyingTexCoord6.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord6.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord6.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor0.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingColor0 = stage_input.varyingColor0;
    varyingFragmentPosition0 = stage_input.varyingFragmentPosition0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord6 = stage_input.varyingTexCoord6;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
