// Clouds / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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


#include "../../include/materials/Clouds/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector2.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector2.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector0.xyzw, workingVector2.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector2.xyzw);
  workingVector0.x = dot(workingVector1.xyz, workingVector1.xyz);
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.x = workingVector0.x / RD_UNIFORM_DISTANCE_CONTROL.x;
  workingVector0.x = -0.899999976 + workingVector0.x;
  workingVector0.x = max(0, workingVector0.x);
  workingVector0.x = 1 + -workingVector0.x;
  workingVector0.x = max(0, workingVector0.x);
  workingVector1.xyzw = RD_UNIFORM_CLOUD_COLOR.xyzw * vertexColor0.xyzw;
  varyingColor0.w = workingVector1.w * workingVector0.x;
  varyingColor0.xyz = workingVector1.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector2.y = dot(workingVector1.xyzw, vertexTexCoord6.xyzw);
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector2.x = dot(workingVector1.xyzw, vertexTexCoord7.xyzw);
  workingVector2.z = dot(workingVector1.xyzw, vertexTexCoord5.xyzw);
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector3.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = dot(workingVector2.xyz, workingVector2.xyz);
  varyingTexCoord3.xyz = workingVector2.xyz;
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.x = workingVector0.x / RD_UNIFORM_DISTANCE_CONTROL.x;
  workingVector0.x = -0.899999976 + workingVector0.x;
  workingVector0.x = max(0, workingVector0.x);
  workingVector0.x = 1 + -workingVector0.x;
  workingVector0.x = max(0, workingVector0.x);
  workingVector1.xyzw = RD_UNIFORM_CLOUD_COLOR.xyzw * vertexColor0.xyzw;
  varyingColor0.w = workingVector1.w * workingVector0.x;
  varyingColor0.xyz = workingVector1.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = RD_UNIFORM_CLOUD_COLOR.x * vertexColor0.x;
    varyingColor0.y = RD_UNIFORM_CLOUD_COLOR.y * vertexColor0.y;
    varyingColor0.z = RD_UNIFORM_CLOUD_COLOR.z * vertexColor0.z;
    varyingColor0.w = (RD_UNIFORM_CLOUD_COLOR.w * vertexColor0.w) * min(max(1.0f - max((sqrt(((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue * multiplyAddValue)) + (multiplyAddValue2 * multiplyAddValue2)) / RD_UNIFORM_DISTANCE_CONTROL.x) + (-0.89999997615814208984375f), 0.0f), 0.0f), 1.0f);
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
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
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue8 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue9 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue13, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = RD_UNIFORM_CLOUD_COLOR.x * vertexColor0.x;
    varyingColor0.y = RD_UNIFORM_CLOUD_COLOR.y * vertexColor0.y;
    varyingColor0.z = RD_UNIFORM_CLOUD_COLOR.z * vertexColor0.z;
    varyingColor0.w = (RD_UNIFORM_CLOUD_COLOR.w * vertexColor0.w) * min(max(1.0f - max((sqrt(((multiplyAddValue8 * multiplyAddValue8) + (multiplyAddValue7 * multiplyAddValue7)) + (multiplyAddValue9 * multiplyAddValue9)) / RD_UNIFORM_DISTANCE_CONTROL.x) + (-0.89999997615814208984375f), 0.0f), 0.0f), 1.0f);
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
