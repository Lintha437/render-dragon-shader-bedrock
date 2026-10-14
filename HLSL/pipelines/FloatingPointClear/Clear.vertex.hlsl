// FloatingPointClear / Clear / vertex forward pipeline.
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


#include "../../include/materials/FloatingPointClear/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float3 vertexPosition0 : POSITION0,
  out float4 clipSpacePosition : SV_POSITION0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  clipSpacePosition.xyz = vertexPosition0.xyz * float3(2,2,1) + float3(-1,-1,0);
  clipSpacePosition.w = 1;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    clipSpacePosition.x = (vertexPosition0.x * 2.0f) + (-1.0f);
    clipSpacePosition.y = (vertexPosition0.y * 2.0f) + (-1.0f);
    clipSpacePosition.z = vertexPosition0.z;
    clipSpacePosition.w = 1.0f;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    return stage_output;
#endif
}
