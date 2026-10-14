// Color / Opaque / fragment forward pipeline.
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


#include "../../include/materials/Color/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float3 varyingNormal0 : NORMAL0,
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
  workingVector0.xyz = RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.zzz + workingVector0.xyz;
  workingVector0.x = saturate(dot(varyingNormal0.xyz, -workingVector0.xyz));
  workingVector0.x = 0.800000012 * workingVector0.x;
  fragmentColor0.xyz = workingVector0.xxx * RD_UNIFORM_MAT_COLOR.xyz + float3(0.200000003,0.200000003,0.200000003);
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = clamp(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3((-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)), (-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)), (-0.0f) - mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_LIGHT_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)))), 0.0f, 1.0f) * 0.800000011920928955078125f;
    fragmentColor0.x = (multiplyAddValue * RD_UNIFORM_MAT_COLOR.x) + 0.20000000298023223876953125f;
    fragmentColor0.y = (multiplyAddValue * RD_UNIFORM_MAT_COLOR.y) + 0.20000000298023223876953125f;
    fragmentColor0.z = (multiplyAddValue * RD_UNIFORM_MAT_COLOR.z) + 0.20000000298023223876953125f;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
