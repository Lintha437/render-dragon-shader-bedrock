// GamefaceStencilPath / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/GamefaceStencilPath/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  nointerpolation float4 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)varyingTexCoord3.w;
  workingVector0.y = RD_COMPARISON_MASK((int)workingVector0.x == 15);
  workingVector0.z = ~(int)workingVector0.y;
  workingVector1.xy = abs(varyingTexCoord0.xy);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.zw = ddx(workingVector1.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.zw = ddx_coarse(workingVector1.xy);
#endif
  workingVector2.xy = -workingVector1.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector2.xz = ddy(workingVector2.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.xz = ddy_coarse(workingVector2.xy);
#endif
  workingVector0.w = workingVector1.x + workingVector1.x;
  workingVector1.y = workingVector0.w * workingVector1.z + -workingVector1.w;
  workingVector0.w = workingVector0.w * workingVector2.x + -workingVector2.z;
  workingVector1.x = workingVector1.x * workingVector1.x + workingVector2.y;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = workingVector1.y * workingVector1.y + workingVector0.w;
  workingVector0.w = sqrt(workingVector0.w);
  workingVector0.w = workingVector1.x / workingVector0.w;
  workingVector0.w = saturate(-workingVector0.w);
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.00390625);
  workingVector0.y = workingVector0.w ? workingVector0.y : 0;
  if (workingVector0.y != 0) discard;
  workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x != 16);
  workingVector0.x = workingVector0.x ? workingVector0.z : 0;
  workingVector0.y = RD_COMPARISON_MASK(varyingTexCoord0.y < 0.00390625);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
    if (scalarValue == 15u)
    {
        float scalarValue1 = abs(varyingTexCoord0.x);
        float scalarValue2 = abs(varyingTexCoord0.y);
        float productValue = scalarValue1 * 2.0f;
        float productValue1 = (ddx_coarse(scalarValue1) * productValue) - ddx_coarse(scalarValue2);
        float productValue2 = (ddy_coarse((-0.0f) - scalarValue1) * productValue) - ddy_coarse((-0.0f) - scalarValue2);
        if (clamp((-0.0f) - (((scalarValue1 * scalarValue1) - scalarValue2) / sqrt((productValue2 * productValue2) + (productValue1 * productValue1))), 0.0f, 1.0f) < 0.00390625f)
        {
            isFragmentDiscarded = true;
        }
    }
    else
    {
        if ((scalarValue != 16u) && (varyingTexCoord0.y < 0.00390625f))
        {
            isFragmentDiscarded = true;
        }
    }
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
