// BeaconBeam / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/BeaconBeam/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + varyingColor0.xyz;
  workingVector1.xyz = -workingVector0.xyz * varyingColor1.xyz + varyingColor2.xyz;
  workingVector0.w = varyingColor0.w;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (((RD_UNIFORM_OVERLAY_COLOR.x - varyingColor0.x) * RD_UNIFORM_OVERLAY_COLOR.w) + varyingColor0.x) * varyingColor1.x;
    float productValue1 = (((RD_UNIFORM_OVERLAY_COLOR.y - varyingColor0.y) * RD_UNIFORM_OVERLAY_COLOR.w) + varyingColor0.y) * varyingColor1.y;
    float productValue2 = (((RD_UNIFORM_OVERLAY_COLOR.z - varyingColor0.z) * RD_UNIFORM_OVERLAY_COLOR.w) + varyingColor0.z) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue) * varyingColor2.w) + productValue;
    fragmentColor0.y = ((varyingColor2.y - productValue1) * varyingColor2.w) + productValue1;
    fragmentColor0.z = ((varyingColor2.z - productValue2) * varyingColor2.w) + productValue2;
    fragmentColor0.w = varyingColor0.w * varyingColor1.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
