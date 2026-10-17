// PostFX.Debug / DebugBlit / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM40
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/PostFX.Debug/VertexBindings.hlsli"

void main(
  float4 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0)
{
  clipSpacePosition.xy = vertexPosition0.xy * float2(2,2) + float2(-1,-1);
  clipSpacePosition.zw = float2(0,1);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
}
