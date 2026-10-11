// EditorBlockVolumeWireframe / AlphaTest / fragment forward pipeline.
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


#include "../../include/materials/EditorBlockVolumeWireframe/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_UNIFORM_FRAME_TIME.x + varyingTexCoord0.x;
  workingVector0.y = trunc(workingVector0.x);
  workingVector0.x = workingVector0.x + -workingVector0.y;
  workingVector0.y = RD_COMPARISON_MASK(varyingTexCoord0.y == 0.000000);
  workingVector0.z = RD_COMPARISON_MASK(0.400000006 < workingVector0.x);
  workingVector0.y = workingVector0.z ? workingVector0.y : 0;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.600000024);
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float sumValue = RD_UNIFORM_FRAME_TIME.x + varyingTexCoord0.x;
    float scalarValue = frac(abs(sumValue));
    float comparisonValue = (sumValue >= ((-0.0f) - sumValue)) ? scalarValue : ((-0.0f) - scalarValue);
    if ((comparisonValue < 0.60000002384185791015625f) && ((varyingTexCoord0.y == 0.0f) && (comparisonValue > 0.4000000059604644775390625f)))
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
