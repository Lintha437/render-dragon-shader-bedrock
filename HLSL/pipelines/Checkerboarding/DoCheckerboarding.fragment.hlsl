// Checkerboarding / DoCheckerboarding / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM50
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Checkerboarding/FragmentBindings.hlsli"

void main(
  float4 pixelPosition : SV_POSITION0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  fragmentColor0.xyzw = float4(0,0,0,0);
  return;
}
