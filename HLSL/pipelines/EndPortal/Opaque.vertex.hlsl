// EndPortal / Opaque / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/EndPortal/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor0 : COLOR0)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float2 varyingTexCoord0 : TEXCOORD0,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float varyingTexCoord2 : TEXCOORD2,
  out float4 varyingColor0 : COLOR0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector1.xyzw = float4(-0.5,-0.5,-0.5,-0) + vertexColor0.xyzw;
  workingVector2.xyzw = float4(2,2,2,32) * workingVector1.xyzw;
  workingVector0.w = 71.8078308 * workingVector1.w;
  sincos(workingVector0.w, workingVector1.x, workingVector3.x);
  workingVector1.yzw = -workingVector2.xyz * workingVector2.www + workingVector0.xyz;
  workingVector0.w = dot(workingVector1.yzw, workingVector2.xyz);
  workingVector1.y = dot(workingVector0.xyz, workingVector2.xyz);
  workingVector0.w = workingVector0.w / workingVector1.y;
  workingVector4.xyzw = workingVector0.wwww * workingVector0.yzxz + RD_UNIFORM_VIEW_POSITION_AND_TIME.yzxz;
  workingVector0.x = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.x = sqrt(workingVector0.x);
  workingVector0.x = workingVector0.x / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
  workingVector5.xyzw = workingVector4.xyzw * abs(workingVector2.xxyy);
  workingVector0.yz = workingVector5.xy + workingVector5.zw;
  workingVector0.yz = workingVector4.zx * abs(workingVector2.zz) + workingVector0.yz;
  workingVector0.yz = float2(0.0625,0.0625) * workingVector0.yz;
  workingVector2.x = -workingVector1.x;
  workingVector2.y = workingVector3.x;
  workingVector2.z = workingVector1.x;
  workingVector1.y = dot(workingVector2.xy, workingVector0.yz);
  workingVector1.x = dot(workingVector2.yz, workingVector0.yz);
  workingVector0.yz = workingVector2.yz * workingVector2.ww + workingVector1.xy;
  workingVector0.w = 0.015625 * workingVector0.y;
  workingVector0.w = trunc(workingVector0.w);
  varyingTexCoord1.x = -workingVector0.w * 64 + workingVector0.y;
  workingVector0.y = RD_UNIFORM_VIEW_POSITION_AND_TIME.w * 0.00390625 + workingVector0.z;
  workingVector0.z = 0.015625 * workingVector0.y;
  workingVector0.z = trunc(workingVector0.z);
  varyingTexCoord1.y = -workingVector0.z * 64 + workingVector0.y;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  varyingTexCoord2.x = vertexColor0.w;
  workingVector0.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor0.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor0.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = vertexPosition0.xyz;
  workingVector0.w = 1;
  workingVector1.y = dot(workingVector0.xyzw, vertexTexCoord6.xyzw);
  workingVector2.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector1.x = dot(workingVector0.xyzw, vertexTexCoord7.xyzw);
  workingVector1.z = dot(workingVector0.xyzw, vertexTexCoord5.xyzw);
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector0.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  workingVector0.xyzw = float4(-0.5,-0.5,-0.5,-0) + vertexColor0.xyzw;
  workingVector2.xyzw = float4(2,2,2,32) * workingVector0.xyzw;
  workingVector0.x = 71.8078308 * workingVector0.w;
  sincos(workingVector0.x, workingVector0.x, workingVector3.x);
  workingVector0.yzw = -workingVector2.xyz * workingVector2.www + workingVector1.xyz;
  workingVector0.y = dot(workingVector0.yzw, workingVector2.xyz);
  workingVector0.z = dot(workingVector1.xyz, workingVector2.xyz);
  workingVector0.y = workingVector0.y / workingVector0.z;
  workingVector4.xyzw = workingVector0.yyyy * workingVector1.yzxz + RD_UNIFORM_VIEW_POSITION_AND_TIME.yzxz;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = sqrt(workingVector0.y);
  workingVector0.y = workingVector0.y / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.y;
  workingVector1.xyzw = workingVector4.xyzw * abs(workingVector2.xxyy);
  workingVector0.zw = workingVector1.xy + workingVector1.zw;
  workingVector0.zw = workingVector4.zx * abs(workingVector2.zz) + workingVector0.zw;
  workingVector0.zw = float2(0.0625,0.0625) * workingVector0.zw;
  workingVector1.x = -workingVector0.x;
  workingVector1.y = workingVector3.x;
  workingVector1.z = workingVector0.x;
  workingVector2.y = dot(workingVector1.xy, workingVector0.zw);
  workingVector2.x = dot(workingVector1.yz, workingVector0.zw);
  workingVector0.xz = workingVector1.yz * workingVector2.ww + workingVector2.xy;
  workingVector0.w = 0.015625 * workingVector0.x;
  workingVector0.w = trunc(workingVector0.w);
  varyingTexCoord1.x = -workingVector0.w * 64 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_VIEW_POSITION_AND_TIME.w * 0.00390625 + workingVector0.z;
  workingVector0.z = 0.015625 * workingVector0.x;
  workingVector0.z = trunc(workingVector0.z);
  varyingTexCoord1.y = -workingVector0.z * 64 + workingVector0.x;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  varyingTexCoord2.x = vertexColor0.w;
  workingVector0.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor0.w = saturate(workingVector0.y / workingVector0.x);
  varyingColor0.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float productValue = (vertexColor0.x + (-0.5f)) * 2.0f;
    float productValue1 = (vertexColor0.y + (-0.5f)) * 2.0f;
    float productValue2 = (vertexColor0.z + (-0.5f)) * 2.0f;
    float productValue3 = vertexColor0.w * 32.0f;
    float dotProductValue = dot(float3(multiplyAddValue - (productValue3 * productValue), multiplyAddValue1 - (productValue3 * productValue1), multiplyAddValue2 - (productValue2 * productValue3)), float3(productValue, productValue1, productValue2)) / dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(productValue, productValue1, productValue2));
    float productValue4 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y + (dotProductValue * multiplyAddValue1);
    float scalarValue = abs(productValue);
    float scalarValue1 = abs(productValue1);
    float scalarValue2 = abs(productValue2);
    float productValue5 = (((scalarValue2 + scalarValue1) * (RD_UNIFORM_VIEW_POSITION_AND_TIME.x + (dotProductValue * multiplyAddValue))) + (productValue4 * scalarValue)) * 0.0625f;
    float productValue6 = (((scalarValue1 + scalarValue) * (RD_UNIFORM_VIEW_POSITION_AND_TIME.z + (dotProductValue * multiplyAddValue2))) + (scalarValue2 * productValue4)) * 0.0625f;
    float productValue7 = vertexColor0.w * 71.807830810546875f;
    float wavePhaseValue = sin(productValue7);
    float wavePhaseValue1 = cos(productValue7);
    float multiplyAddValue3 = (mad(wavePhaseValue, productValue6, productValue5 * wavePhaseValue1) + (wavePhaseValue1 * productValue3)) * 0.015625f;
    float multiplyAddValue4 = (((wavePhaseValue * productValue3) + (RD_UNIFORM_VIEW_POSITION_AND_TIME.w * 0.00390625f)) + mad(wavePhaseValue1, productValue6, (-0.0f) - (wavePhaseValue * productValue5))) * 0.015625f;
    float scalarValue3 = frac(abs(multiplyAddValue3));
    float scalarValue4 = frac(abs(multiplyAddValue4));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingTexCoord1.x = vertexTexCoord0.x;
    varyingTexCoord1.y = vertexTexCoord0.y;
    varyingTexCoord2 = vertexColor0.w;
    varyingColor0.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor0.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor0.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor0.w = clamp(((sqrt(((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue * multiplyAddValue)) + (multiplyAddValue2 * multiplyAddValue2)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord0.x = ((multiplyAddValue3 >= ((-0.0f) - multiplyAddValue3)) ? scalarValue3 : ((-0.0f) - scalarValue3)) * 64.0f;
    varyingTexCoord0.y = ((multiplyAddValue4 >= ((-0.0f) - multiplyAddValue4)) ? scalarValue4 : ((-0.0f) - scalarValue4)) * 64.0f;
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
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue5 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue6 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue7 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float productValue = (vertexColor0.x + (-0.5f)) * 2.0f;
    float productValue1 = (vertexColor0.y + (-0.5f)) * 2.0f;
    float productValue2 = (vertexColor0.z + (-0.5f)) * 2.0f;
    float productValue3 = vertexColor0.w * 32.0f;
    float dotProductValue1 = dot(float3(multiplyAddValue5 - (productValue3 * productValue), multiplyAddValue6 - (productValue3 * productValue1), multiplyAddValue7 - (productValue2 * productValue3)), float3(productValue, productValue1, productValue2)) / dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(productValue, productValue1, productValue2));
    float productValue8 = RD_UNIFORM_VIEW_POSITION_AND_TIME.y + (dotProductValue1 * multiplyAddValue6);
    float scalarValue = abs(productValue);
    float scalarValue1 = abs(productValue1);
    float scalarValue2 = abs(productValue2);
    float productValue9 = (((scalarValue2 + scalarValue1) * (RD_UNIFORM_VIEW_POSITION_AND_TIME.x + (dotProductValue1 * multiplyAddValue5))) + (productValue8 * scalarValue)) * 0.0625f;
    float productValue10 = (((scalarValue1 + scalarValue) * (RD_UNIFORM_VIEW_POSITION_AND_TIME.z + (dotProductValue1 * multiplyAddValue7))) + (scalarValue2 * productValue8)) * 0.0625f;
    float productValue7 = vertexColor0.w * 71.807830810546875f;
    float wavePhaseValue = sin(productValue7);
    float wavePhaseValue1 = cos(productValue7);
    float multiplyAddValue8 = (mad(wavePhaseValue, productValue10, productValue9 * wavePhaseValue1) + (wavePhaseValue1 * productValue3)) * 0.015625f;
    float multiplyAddValue9 = (((wavePhaseValue * productValue3) + (RD_UNIFORM_VIEW_POSITION_AND_TIME.w * 0.00390625f)) + mad(wavePhaseValue1, productValue10, (-0.0f) - (wavePhaseValue * productValue9))) * 0.015625f;
    float scalarValue5 = frac(abs(multiplyAddValue8));
    float scalarValue6 = frac(abs(multiplyAddValue9));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue7, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue7, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue7, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue7, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingTexCoord1.x = vertexTexCoord0.x;
    varyingTexCoord1.y = vertexTexCoord0.y;
    varyingTexCoord2 = vertexColor0.w;
    varyingColor0.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor0.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor0.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor0.w = clamp(((sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord0.x = ((multiplyAddValue8 >= ((-0.0f) - multiplyAddValue8)) ? scalarValue5 : ((-0.0f) - scalarValue5)) * 64.0f;
    varyingTexCoord0.y = ((multiplyAddValue9 >= ((-0.0f) - multiplyAddValue9)) ? scalarValue6 : ((-0.0f) - scalarValue6)) * 64.0f;
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
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
