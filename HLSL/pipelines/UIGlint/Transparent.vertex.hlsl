// UIGlint / Transparent / vertex forward pipeline.
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


#include "../../include/materials/UIGlint/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * vertexPosition0.zzzz + workingVector0.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  sincos(RD_UNIFORM_UV_ROTATION.x, workingVector0.x, workingVector1.x);
  workingVector2.z = workingVector0.x;
  workingVector2.y = workingVector1.x;
  workingVector2.x = -workingVector0.x;
  workingVector0.xy = float2(-0.5,-0.5) + vertexTexCoord0.xy;
  workingVector0.z = dot(workingVector0.xy, workingVector2.yz);
  workingVector1.y = dot(workingVector0.xy, workingVector2.xy);
  workingVector1.x = RD_UNIFORM_UV_OFFSET.x + workingVector0.z;
  workingVector0.zw = float2(0.5,0.5) + workingVector1.xy;
  varyingTexCoord1.xy = RD_UNIFORM_UV_SCALE.xy * workingVector0.zw;
  sincos(RD_UNIFORM_UV_ROTATION.y, workingVector1.x, workingVector2.x);
  workingVector3.z = workingVector1.x;
  workingVector3.y = workingVector2.x;
  workingVector3.x = -workingVector1.x;
  workingVector0.w = dot(workingVector0.xy, workingVector3.xy);
  workingVector0.x = dot(workingVector0.xy, workingVector3.yz);
  workingVector0.z = RD_UNIFORM_UV_OFFSET.y + workingVector0.x;
  workingVector0.xy = float2(0.5,0.5) + workingVector0.zw;
  varyingTexCoord2.xy = RD_UNIFORM_UV_SCALE.xy * workingVector0.xy;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue = vertexTexCoord0.x + (-0.5f);
    float sumValue1 = vertexTexCoord0.y + (-0.5f);
    float wavePhaseValue = sin(RD_UNIFORM_UV_ROTATION.x);
    float wavePhaseValue1 = cos(RD_UNIFORM_UV_ROTATION.x);
    float sumValue2 = (-0.0f) - sumValue;
    float wavePhaseValue2 = sin(RD_UNIFORM_UV_ROTATION.y);
    float wavePhaseValue3 = cos(RD_UNIFORM_UV_ROTATION.y);
    clipSpacePosition.x = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord1.x = RD_UNIFORM_UV_SCALE.x * ((RD_UNIFORM_UV_OFFSET.x + 0.5f) + mad(sumValue1, wavePhaseValue, wavePhaseValue1 * sumValue));
    varyingTexCoord1.y = RD_UNIFORM_UV_SCALE.y * (mad(sumValue1, wavePhaseValue1, wavePhaseValue * sumValue2) + 0.5f);
    varyingTexCoord2.x = ((RD_UNIFORM_UV_OFFSET.y + 0.5f) + mad(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * RD_UNIFORM_UV_SCALE.x;
    varyingTexCoord2.y = (mad(sumValue1, wavePhaseValue3, wavePhaseValue2 * sumValue2) + 0.5f) * RD_UNIFORM_UV_SCALE.y;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
