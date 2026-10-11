// BeaconBeam / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/BeaconBeam/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingColor1 : COLOR1,
  out float2 varyingTexCoord0 : TEXCOORD0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * vertexPosition0.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  clipSpacePosition.z = workingVector0.x;
  workingVector0.x = workingVector0.x / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * vertexNormal0.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexNormal0.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexNormal0.zzzz + workingVector0.xyzw;
  workingVector0.w = dot(workingVector0.xyzw, workingVector0.xyzw);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.y = workingVector0.y * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xz = workingVector0.xz * workingVector0.xz;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.y * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.z * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + workingVector0.x;
  varyingColor1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor1.w = 1;
  varyingTexCoord0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * vertexPosition0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * vertexPosition0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * vertexPosition0.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  clipSpacePosition.z = workingVector0.x;
  workingVector0.x = workingVector0.x / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + 1;
  varyingColor1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor1.w = 1;
  varyingTexCoord0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.w * vertexNormal0.x));
    float inverseLengthValue = rsqrt(dot(float4(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float4(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float productValue = inverseLengthValue * multiplyAddValue5;
    float productValue1 = inverseLengthValue * multiplyAddValue7;
    float productValue2 = (((0.449999988079071044921875f - ((productValue * productValue) * 0.100000001490116119384765625f)) + ((productValue1 * productValue1) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue) + 1.0f) * 0.2750000059604644775390625f);
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = multiplyAddValue4;
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue4 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingColor1.x = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor1.y = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor1.z = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor1.w = 1.0f;
    varyingTexCoord0.x = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, vertexPosition0.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, vertexPosition0.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * vertexPosition0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float productValue3 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = multiplyAddValue4;
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue4 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingColor1.x = productValue3 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor1.y = productValue3 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor1.z = productValue3 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor1.w = 1.0f;
    varyingTexCoord0.x = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    return stage_output;
#endif
}
