// Nametag / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Nametag/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor3 : COLOR3,
  float4 varyingColor0 : COLOR0,
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
  workingVector0.xyz = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.w = 1;
  fragmentColor0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.x) * (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f);
    fragmentColor0.y = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.y) * (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f);
    fragmentColor0.z = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.z) * (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f);
    fragmentColor0.w = RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor3 = stage_input.varyingColor3;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
