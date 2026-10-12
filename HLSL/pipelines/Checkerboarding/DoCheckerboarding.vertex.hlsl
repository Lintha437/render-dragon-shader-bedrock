// Checkerboarding / DoCheckerboarding / vertex forward pipeline.
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


#include "../../include/materials/Checkerboarding/VertexBindings.hlsli"

void main(
  out float4 clipSpacePosition : SV_POSITION0)
{
  clipSpacePosition.xyzw = float4(0,0,0,0);
  return;
}
