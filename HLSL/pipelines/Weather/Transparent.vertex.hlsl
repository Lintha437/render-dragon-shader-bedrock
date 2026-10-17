// Weather / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/Weather/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor1 : COLOR1,
  out float varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
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
  out float4 varyingColor1 : COLOR1,
  out float varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_POSITION_BASE_OFFSET.xyz + vertexPosition0.xyz;
  workingVector1.xyz = float3(0.0333333351,0.0333333351,0.0333333351) * workingVector0.xyz;
  workingVector1.xyz = trunc(workingVector1.xyz);
  workingVector0.xyz = -workingVector1.xyz * float3(30,30,30) + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_POSITION_FORWARD_OFFSET.xyz + workingVector0.xyz;
  workingVector0.xyz = float3(-15,-15,-15) + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector3.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector4.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector4.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector4.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector4.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector3.x = dot(workingVector4.xyzw, workingVector1.xyzw);
  workingVector5.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector5.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector5.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector5.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector3.y = dot(workingVector5.xyzw, workingVector1.xyzw);
  workingVector6.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector6.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector6.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector6.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector3.w = dot(workingVector6.xyzw, workingVector1.xyzw);
  workingVector1.xyz = RD_UNIFORM_VELOCITY.xyz * RD_UNIFORM_DIMENSIONS.yyy + workingVector0.xyz;
  workingVector7.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector7.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector7.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector7.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector2.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = dot(workingVector4.xyzw, workingVector1.xyzw);
  workingVector2.y = dot(workingVector5.xyzw, workingVector1.xyzw);
  workingVector2.w = dot(workingVector6.xyzw, workingVector1.xyzw);
  workingVector1.xyzw = workingVector3.xyzw + -workingVector2.xyzw;
  workingVector3.xy = workingVector3.xy / workingVector3.ww;
  workingVector1.xyzw = vertexTexCoord0.yyyy * workingVector1.xyzw + workingVector2.xyzw;
  workingVector2.xy = workingVector2.xy / workingVector2.ww;
  workingVector2.xy = workingVector2.xy + -workingVector3.xy;
  workingVector2.zw = -workingVector2.yy;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xw);
  workingVector2.xy = float2(-1,1) * workingVector2.yx;
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xy = workingVector2.xy * workingVector0.ww;
  workingVector0.w = 0.5 + -vertexTexCoord0.x;
  workingVector2.xy = workingVector0.ww * workingVector2.xy;
  clipSpacePosition.xy = workingVector2.xy * RD_UNIFORM_DIMENSIONS.xx + workingVector1.xy;
  clipSpacePosition.zw = workingVector1.zw;
  workingVector0.w = workingVector1.z / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector1.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(workingVector0.w / workingVector1.x);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_POSITION.xzy + workingVector0.xzy;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.x = -0.5 + workingVector1.z;
  varyingTexCoord1.xy = workingVector1.xy * float2(0.015625,0.015625) + float2(0.5,0.5);
  varyingTexCoord2.x = 0.00392156886 * workingVector0.x;
  workingVector0.x = RD_UNIFORM_UV_OFFSET_AND_SCALE.z * vertexColor0.x;
  workingVector1.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_OFFSET_AND_SCALE.zw + RD_UNIFORM_UV_OFFSET_AND_SCALE.xy;
  workingVector1.x = workingVector0.x * 255 + workingVector1.y;
  varyingTexCoord0.xy = workingVector1.xz;
  return;
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_POSITION_BASE_OFFSET.xyz + vertexPosition0.xyz;
  workingVector1.xyz = float3(0.0333333351,0.0333333351,0.0333333351) * workingVector0.xyz;
  workingVector1.xyz = trunc(workingVector1.xyz);
  workingVector0.xyz = -workingVector1.xyz * float3(30,30,30) + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_POSITION_FORWARD_OFFSET.xyz + workingVector0.xyz;
  workingVector0.xyz = float3(-15,-15,-15) + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector3.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector4.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector4.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector4.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector4.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector3.x = dot(workingVector4.xyzw, workingVector1.xyzw);
  workingVector5.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector5.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector5.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector5.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector3.y = dot(workingVector5.xyzw, workingVector1.xyzw);
  workingVector6.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector6.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector6.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector6.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector3.w = dot(workingVector6.xyzw, workingVector1.xyzw);
  workingVector1.xyz = RD_UNIFORM_VELOCITY.xyz * RD_UNIFORM_DIMENSIONS.yyy + workingVector0.xyz;
  workingVector7.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector7.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector7.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector7.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector2.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = dot(workingVector4.xyzw, workingVector1.xyzw);
  workingVector2.y = dot(workingVector5.xyzw, workingVector1.xyzw);
  workingVector2.w = dot(workingVector6.xyzw, workingVector1.xyzw);
  workingVector1.xyzw = workingVector3.xyzw + -workingVector2.xyzw;
  workingVector3.xy = workingVector3.xy / workingVector3.ww;
  workingVector1.xyzw = vertexTexCoord0.yyyy * workingVector1.xyzw + workingVector2.xyzw;
  workingVector2.xy = workingVector2.xy / workingVector2.ww;
  workingVector2.xy = workingVector2.xy + -workingVector3.xy;
  workingVector2.zw = -workingVector2.yy;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xw);
  workingVector2.xy = float2(-1,1) * workingVector2.yx;
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xy = workingVector2.xy * workingVector0.ww;
  workingVector0.w = 0.5 + -vertexTexCoord0.x;
  workingVector2.xy = workingVector0.ww * workingVector2.xy;
  clipSpacePosition.xy = workingVector2.xy * RD_UNIFORM_DIMENSIONS.xx + workingVector1.xy;
  clipSpacePosition.zw = workingVector1.zw;
  workingVector0.w = workingVector1.z / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
  workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector1.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
  varyingColor1.w = saturate(workingVector0.w / workingVector1.x);
  varyingColor1.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_POSITION.xzy + workingVector0.xzy;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.x = -0.5 + workingVector1.z;
  varyingTexCoord1.xy = workingVector1.xy * float2(0.015625,0.015625) + float2(0.5,0.5);
  varyingTexCoord2.x = 0.00392156886 * workingVector0.x;
  varyingTexCoord0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_OFFSET_AND_SCALE.zw + RD_UNIFORM_UV_OFFSET_AND_SCALE.xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (RD_UNIFORM_POSITION_BASE_OFFSET.x + vertexPosition0.x) * 0.0333333350718021392822265625f;
    float productValue1 = (RD_UNIFORM_POSITION_BASE_OFFSET.y + vertexPosition0.y) * 0.0333333350718021392822265625f;
    float productValue2 = (RD_UNIFORM_POSITION_BASE_OFFSET.z + vertexPosition0.z) * 0.0333333350718021392822265625f;
    float scalarValue = frac(abs(productValue));
    float scalarValue1 = frac(abs(productValue1));
    float scalarValue2 = frac(abs(productValue2));
    float comparisonValue = (RD_UNIFORM_POSITION_FORWARD_OFFSET.x + (-15.0f)) + (((productValue >= ((-0.0f) - productValue)) ? scalarValue : ((-0.0f) - scalarValue)) * 30.0f);
    float comparisonValue1 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.y + (-15.0f)) + (((productValue1 >= ((-0.0f) - productValue1)) ? scalarValue1 : ((-0.0f) - scalarValue1)) * 30.0f);
    float comparisonValue2 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.z + (-15.0f)) + (((productValue2 >= ((-0.0f) - productValue2)) ? scalarValue2 : ((-0.0f) - scalarValue2)) * 30.0f);
    float productValue3 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.x) + comparisonValue;
    float productValue4 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.y) + comparisonValue1;
    float productValue5 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.z) + comparisonValue2;
    float sumValue = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
    float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(sumValue, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(sumValue1, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(sumValue, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(sumValue1, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float quotientValue = (multiplyAddValue11 / multiplyAddValue14) - (multiplyAddValue4 / multiplyAddValue6);
    float quotientValue1 = (-0.0f) - ((multiplyAddValue12 / multiplyAddValue14) - (multiplyAddValue5 / multiplyAddValue6));
    float multiplyAddValue15 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) - multiplyAddValue13) * vertexTexCoord0.y) + multiplyAddValue13;
    float inverseLengthValue = (rsqrt(dot(float2(quotientValue1, quotientValue), float2(quotientValue1, quotientValue))) * (0.5f - vertexTexCoord0.x)) * RD_UNIFORM_DIMENSIONS.x;
    clipSpacePosition.x = (((multiplyAddValue4 - multiplyAddValue11) * vertexTexCoord0.y) + multiplyAddValue11) + (inverseLengthValue * quotientValue1);
    clipSpacePosition.y = (((multiplyAddValue5 - multiplyAddValue12) * vertexTexCoord0.y) + multiplyAddValue12) + (inverseLengthValue * quotientValue);
    clipSpacePosition.z = multiplyAddValue15;
    clipSpacePosition.w = ((multiplyAddValue6 - multiplyAddValue14) * vertexTexCoord0.y) + multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue15 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5f)) + RD_UNIFORM_VIEW_POSITION.y) * 0.0039215688593685626983642578125f;
    varyingTexCoord1.x = ((RD_UNIFORM_VIEW_POSITION.x + comparisonValue) * 0.015625f) + 0.5f;
    varyingTexCoord1.y = ((RD_UNIFORM_VIEW_POSITION.z + comparisonValue2) * 0.015625f) + 0.5f;
    varyingTexCoord0.x = (((vertexColor0.x * 255.0f) + vertexTexCoord0.x) * RD_UNIFORM_UV_OFFSET_AND_SCALE.z) + RD_UNIFORM_UV_OFFSET_AND_SCALE.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_OFFSET_AND_SCALE.w * vertexTexCoord0.y) + RD_UNIFORM_UV_OFFSET_AND_SCALE.y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (RD_UNIFORM_POSITION_BASE_OFFSET.x + vertexPosition0.x) * 0.0333333350718021392822265625f;
    float productValue1 = (RD_UNIFORM_POSITION_BASE_OFFSET.y + vertexPosition0.y) * 0.0333333350718021392822265625f;
    float productValue2 = (RD_UNIFORM_POSITION_BASE_OFFSET.z + vertexPosition0.z) * 0.0333333350718021392822265625f;
    float scalarValue = frac(abs(productValue));
    float scalarValue1 = frac(abs(productValue1));
    float scalarValue2 = frac(abs(productValue2));
    float comparisonValue = (RD_UNIFORM_POSITION_FORWARD_OFFSET.x + (-15.0f)) + (((productValue >= ((-0.0f) - productValue)) ? scalarValue : ((-0.0f) - scalarValue)) * 30.0f);
    float comparisonValue1 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.y + (-15.0f)) + (((productValue1 >= ((-0.0f) - productValue1)) ? scalarValue1 : ((-0.0f) - scalarValue1)) * 30.0f);
    float comparisonValue2 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.z + (-15.0f)) + (((productValue2 >= ((-0.0f) - productValue2)) ? scalarValue2 : ((-0.0f) - scalarValue2)) * 30.0f);
    float productValue3 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.x) + comparisonValue;
    float productValue4 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.y) + comparisonValue1;
    float productValue5 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.z) + comparisonValue2;
    float sumValue = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
    float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(sumValue, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(sumValue1, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(sumValue, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(sumValue1, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float quotientValue = (multiplyAddValue11 / multiplyAddValue14) - (multiplyAddValue4 / multiplyAddValue6);
    float quotientValue1 = (-0.0f) - ((multiplyAddValue12 / multiplyAddValue14) - (multiplyAddValue5 / multiplyAddValue6));
    float multiplyAddValue15 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) - multiplyAddValue13) * vertexTexCoord0.y) + multiplyAddValue13;
    float inverseLengthValue = (rsqrt(dot(float2(quotientValue1, quotientValue), float2(quotientValue1, quotientValue))) * (0.5f - vertexTexCoord0.x)) * RD_UNIFORM_DIMENSIONS.x;
    clipSpacePosition.x = (((multiplyAddValue4 - multiplyAddValue11) * vertexTexCoord0.y) + multiplyAddValue11) + (inverseLengthValue * quotientValue1);
    clipSpacePosition.y = (((multiplyAddValue5 - multiplyAddValue12) * vertexTexCoord0.y) + multiplyAddValue12) + (inverseLengthValue * quotientValue);
    clipSpacePosition.z = multiplyAddValue15;
    clipSpacePosition.w = ((multiplyAddValue6 - multiplyAddValue14) * vertexTexCoord0.y) + multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue15 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5f)) + RD_UNIFORM_VIEW_POSITION.y) * 0.0039215688593685626983642578125f;
    varyingTexCoord1.x = ((RD_UNIFORM_VIEW_POSITION.x + comparisonValue) * 0.015625f) + 0.5f;
    varyingTexCoord1.y = ((RD_UNIFORM_VIEW_POSITION.z + comparisonValue2) * 0.015625f) + 0.5f;
    varyingTexCoord0.x = (RD_UNIFORM_UV_OFFSET_AND_SCALE.z * vertexTexCoord0.x) + RD_UNIFORM_UV_OFFSET_AND_SCALE.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_OFFSET_AND_SCALE.w * vertexTexCoord0.y) + RD_UNIFORM_UV_OFFSET_AND_SCALE.y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (RD_UNIFORM_POSITION_BASE_OFFSET.x + vertexPosition0.x) * 0.0333333350718021392822265625f;
    float productValue1 = (RD_UNIFORM_POSITION_BASE_OFFSET.y + vertexPosition0.y) * 0.0333333350718021392822265625f;
    float productValue2 = (RD_UNIFORM_POSITION_BASE_OFFSET.z + vertexPosition0.z) * 0.0333333350718021392822265625f;
    float scalarValue = frac(abs(productValue));
    float scalarValue1 = frac(abs(productValue1));
    float scalarValue2 = frac(abs(productValue2));
    float comparisonValue = (RD_UNIFORM_POSITION_FORWARD_OFFSET.x + (-15.0f)) + (((productValue >= ((-0.0f) - productValue)) ? scalarValue : ((-0.0f) - scalarValue)) * 30.0f);
    float comparisonValue1 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.y + (-15.0f)) + (((productValue1 >= ((-0.0f) - productValue1)) ? scalarValue1 : ((-0.0f) - scalarValue1)) * 30.0f);
    float comparisonValue2 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.z + (-15.0f)) + (((productValue2 >= ((-0.0f) - productValue2)) ? scalarValue2 : ((-0.0f) - scalarValue2)) * 30.0f);
    float productValue3 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.x) + comparisonValue;
    float productValue4 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.y) + comparisonValue1;
    float productValue5 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.z) + comparisonValue2;
    float sumValue = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
    float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(sumValue, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(sumValue1, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(sumValue, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(sumValue1, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float quotientValue = (multiplyAddValue11 / multiplyAddValue14) - (multiplyAddValue4 / multiplyAddValue6);
    float quotientValue1 = (-0.0f) - ((multiplyAddValue12 / multiplyAddValue14) - (multiplyAddValue5 / multiplyAddValue6));
    float multiplyAddValue15 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) - multiplyAddValue13) * vertexTexCoord0.y) + multiplyAddValue13;
    float inverseLengthValue = (rsqrt(dot(float2(quotientValue1, quotientValue), float2(quotientValue1, quotientValue))) * (0.5f - vertexTexCoord0.x)) * RD_UNIFORM_DIMENSIONS.x;
    clipSpacePosition.x = (((multiplyAddValue4 - multiplyAddValue11) * vertexTexCoord0.y) + multiplyAddValue11) + (inverseLengthValue * quotientValue1);
    clipSpacePosition.y = (((multiplyAddValue5 - multiplyAddValue12) * vertexTexCoord0.y) + multiplyAddValue12) + (inverseLengthValue * quotientValue);
    clipSpacePosition.z = multiplyAddValue15;
    clipSpacePosition.w = ((multiplyAddValue6 - multiplyAddValue14) * vertexTexCoord0.y) + multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue15 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5f)) + RD_UNIFORM_VIEW_POSITION.y) * 0.0039215688593685626983642578125f;
    varyingTexCoord1.x = ((RD_UNIFORM_VIEW_POSITION.x + comparisonValue) * 0.015625f) + 0.5f;
    varyingTexCoord1.y = ((RD_UNIFORM_VIEW_POSITION.z + comparisonValue2) * 0.015625f) + 0.5f;
    varyingTexCoord0.x = (((vertexColor0.x * 255.0f) + vertexTexCoord0.x) * RD_UNIFORM_UV_OFFSET_AND_SCALE.z) + RD_UNIFORM_UV_OFFSET_AND_SCALE.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_OFFSET_AND_SCALE.w * vertexTexCoord0.y) + RD_UNIFORM_UV_OFFSET_AND_SCALE.y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (RD_UNIFORM_POSITION_BASE_OFFSET.x + vertexPosition0.x) * 0.0333333350718021392822265625f;
    float productValue1 = (RD_UNIFORM_POSITION_BASE_OFFSET.y + vertexPosition0.y) * 0.0333333350718021392822265625f;
    float productValue2 = (RD_UNIFORM_POSITION_BASE_OFFSET.z + vertexPosition0.z) * 0.0333333350718021392822265625f;
    float scalarValue = frac(abs(productValue));
    float scalarValue1 = frac(abs(productValue1));
    float scalarValue2 = frac(abs(productValue2));
    float comparisonValue = (RD_UNIFORM_POSITION_FORWARD_OFFSET.x + (-15.0f)) + (((productValue >= ((-0.0f) - productValue)) ? scalarValue : ((-0.0f) - scalarValue)) * 30.0f);
    float comparisonValue1 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.y + (-15.0f)) + (((productValue1 >= ((-0.0f) - productValue1)) ? scalarValue1 : ((-0.0f) - scalarValue1)) * 30.0f);
    float comparisonValue2 = (RD_UNIFORM_POSITION_FORWARD_OFFSET.z + (-15.0f)) + (((productValue2 >= ((-0.0f) - productValue2)) ? scalarValue2 : ((-0.0f) - scalarValue2)) * 30.0f);
    float productValue3 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.x) + comparisonValue;
    float productValue4 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.y) + comparisonValue1;
    float productValue5 = (RD_UNIFORM_DIMENSIONS.y * RD_UNIFORM_VELOCITY.z) + comparisonValue2;
    float sumValue = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
    float sumValue1 = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, comparisonValue1, comparisonValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(sumValue, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(sumValue1, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(sumValue, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(sumValue1, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float quotientValue = (multiplyAddValue11 / multiplyAddValue14) - (multiplyAddValue4 / multiplyAddValue6);
    float quotientValue1 = (-0.0f) - ((multiplyAddValue12 / multiplyAddValue14) - (multiplyAddValue5 / multiplyAddValue6));
    float multiplyAddValue15 = ((mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) - multiplyAddValue13) * vertexTexCoord0.y) + multiplyAddValue13;
    float inverseLengthValue = (rsqrt(dot(float2(quotientValue1, quotientValue), float2(quotientValue1, quotientValue))) * (0.5f - vertexTexCoord0.x)) * RD_UNIFORM_DIMENSIONS.x;
    clipSpacePosition.x = (((multiplyAddValue4 - multiplyAddValue11) * vertexTexCoord0.y) + multiplyAddValue11) + (inverseLengthValue * quotientValue1);
    clipSpacePosition.y = (((multiplyAddValue5 - multiplyAddValue12) * vertexTexCoord0.y) + multiplyAddValue12) + (inverseLengthValue * quotientValue);
    clipSpacePosition.z = multiplyAddValue15;
    clipSpacePosition.w = ((multiplyAddValue6 - multiplyAddValue14) * vertexTexCoord0.y) + multiplyAddValue14;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor1.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor1.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor1.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor1.w = clamp(((multiplyAddValue15 / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z) - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x), 0.0f, 1.0f);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5f)) + RD_UNIFORM_VIEW_POSITION.y) * 0.0039215688593685626983642578125f;
    varyingTexCoord1.x = ((RD_UNIFORM_VIEW_POSITION.x + comparisonValue) * 0.015625f) + 0.5f;
    varyingTexCoord1.y = ((RD_UNIFORM_VIEW_POSITION.z + comparisonValue2) * 0.015625f) + 0.5f;
    varyingTexCoord0.x = (RD_UNIFORM_UV_OFFSET_AND_SCALE.z * vertexTexCoord0.x) + RD_UNIFORM_UV_OFFSET_AND_SCALE.x;
    varyingTexCoord0.y = (RD_UNIFORM_UV_OFFSET_AND_SCALE.w * vertexTexCoord0.y) + RD_UNIFORM_UV_OFFSET_AND_SCALE.y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
