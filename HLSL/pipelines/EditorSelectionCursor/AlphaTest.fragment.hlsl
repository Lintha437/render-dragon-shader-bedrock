// EditorSelectionCursor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/EditorSelectionCursor/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = varyingTexCoord0.x + varyingTexCoord0.x;
  workingVector0.x = floor(workingVector0.x);
  workingVector0.x = -workingVector0.x * 0.5 + varyingTexCoord0.x;
  workingVector0.x = RD_COMPARISON_MASK(0.375 < workingVector0.x);
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    if ((varyingTexCoord0 - (floor(varyingTexCoord0 * 2.0f) * 0.5f)) > 0.375f)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
