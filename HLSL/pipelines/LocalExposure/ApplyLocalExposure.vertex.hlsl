// LocalExposure / ApplyLocalExposure / vertex forward pipeline.
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


#include "../../include/materials/LocalExposure/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  clipSpacePosition.xy = vertexPosition0.xy * float2(2,2) + float2(-1,-1);
  clipSpacePosition.zw = float2(0,1);
  varyingTexCoord0.xy = RD_UNIFORM_VIEWPORT_SCALE.xy * vertexTexCoord0.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    clipSpacePosition.x = (vertexPosition0.x * 2.0f) + (-1.0f);
    clipSpacePosition.y = (vertexPosition0.y * 2.0f) + (-1.0f);
    clipSpacePosition.z = 0.0f;
    clipSpacePosition.w = 1.0f;
    varyingTexCoord0.x = RD_UNIFORM_VIEWPORT_SCALE.x * vertexTexCoord0.x;
    varyingTexCoord0.y = RD_UNIFORM_VIEWPORT_SCALE.y * vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
