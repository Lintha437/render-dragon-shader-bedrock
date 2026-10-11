// ParticleForwardPBR / AlphaTest / vertex forward pipeline.
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
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ParticleForwardPBR/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float2 vertexTexCoord1 : TEXCOORD1,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor1 : COLOR1,
  out float3 varyingNormal0 : NORMAL0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord1 : TEXCOORD1,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor1 : COLOR1,
  out float3 varyingNormal0 : NORMAL0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord2.xyz = float3(0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingNormal0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  varyingTexCoord1.xy = float2(0,0);
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = vertexPosition0.xyz;
  workingVector0.w = 1;
  workingVector1.y = dot(workingVector0.xyzw, vertexTexCoord6.xyzw);
  workingVector2.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector1.x = dot(workingVector0.xyzw, vertexTexCoord7.xyzw);
  workingVector1.z = dot(workingVector0.xyzw, vertexTexCoord5.xyzw);
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord2.xyz = float3(0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingNormal0.xyz = float3(0,0,0);
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  varyingTexCoord1.xy = float2(0,0);
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = multiplyAddValue3;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue3 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue4 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue5 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue6 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = multiplyAddValue7;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue7 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord1.x = 0.0f;
    varyingTexCoord1.y = 0.0f;
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
