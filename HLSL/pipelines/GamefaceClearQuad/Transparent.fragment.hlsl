// GamefaceClearQuad / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceClearQuad/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord2 : TEXCOORD2,
  float4 varyingTexCoord3 : TEXCOORD3,
  float4 varyingTexCoord5 : TEXCOORD5,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  fragmentColor0.xyzw = varyingTexCoord1.xyzw;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = varyingTexCoord1.x;
    fragmentColor0.y = varyingTexCoord1.y;
    fragmentColor0.z = varyingTexCoord1.z;
    fragmentColor0.w = varyingTexCoord1.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
