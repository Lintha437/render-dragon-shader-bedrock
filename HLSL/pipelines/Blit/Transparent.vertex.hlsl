// Blit / Transparent / vertex forward pipeline.
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


#include "../../include/materials/Blit/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * vertexPosition0.zzzz + workingVector0.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
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
