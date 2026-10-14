// EditorBlockVolumeHull / Opaque / fragment forward pipeline.
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


#include "../../include/materials/EditorBlockVolumeHull/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingNormal0 : NORMAL0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
