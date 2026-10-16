// EditorSelectionCursor / RasterizedTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/EditorSelectionCursor/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = 6.28318024 * RD_UNIFORM_FRAME_TIME.x;
  workingVector0.x = sin(workingVector0.x);
  fragmentColor0.w = workingVector0.x * 0.015625 + RD_UNIFORM_MAT_COLOR.w;
  fragmentColor0.xyz = RD_UNIFORM_MAT_COLOR.xyz;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z;
    fragmentColor0.w = (sin(RD_UNIFORM_FRAME_TIME.x * 6.28318023681640625f) * 0.015625f) + RD_UNIFORM_MAT_COLOR.w;
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
