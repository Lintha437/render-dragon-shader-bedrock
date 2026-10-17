// LegacyCubemapForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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


#include "../../include/materials/LegacyCubemapForwardPBR/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.xyzw * vertexPosition0.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.xyzw * vertexPosition0.zzzz + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.xyzw + workingVector0.xyzw;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * workingVector0.www + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector1.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector1.y = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.z = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector1.w = dot(workingVector2.xyzw, workingVector0.xyzw);
  clipSpacePosition.xyzw = workingVector1.xyzw;
  varyingTexCoord1.xyzw = workingVector1.xyzw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.x, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.y, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.z, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.w, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue11;
    clipSpacePosition.y = multiplyAddValue12;
    clipSpacePosition.z = multiplyAddValue13;
    clipSpacePosition.w = multiplyAddValue14;
    varyingTexCoord1.x = multiplyAddValue11;
    varyingTexCoord1.y = multiplyAddValue12;
    varyingTexCoord1.z = multiplyAddValue13;
    varyingTexCoord1.w = multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.x, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.y, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.z, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_CUBEMAP_ROTATION_ROW_1.w, vertexPosition0.y, RD_UNIFORM_CUBEMAP_ROTATION_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_CUBEMAP_ROTATION_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue11;
    clipSpacePosition.y = multiplyAddValue12;
    clipSpacePosition.z = multiplyAddValue13;
    clipSpacePosition.w = multiplyAddValue14;
    varyingTexCoord1.x = multiplyAddValue11;
    varyingTexCoord1.y = multiplyAddValue12;
    varyingTexCoord1.z = multiplyAddValue13;
    varyingTexCoord1.w = multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
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
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
