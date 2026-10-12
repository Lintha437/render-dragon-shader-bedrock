// Basic / AlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_SAMPLE_MAT_TEXTURE
#define RD_FEATURE_SAMPLE_MAT_TEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TRANSFORM_UV0
#define RD_FEATURE_TRANSFORM_UV0 RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Basic/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord1 : TEXCOORD1)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord1 : TEXCOORD1)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
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
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  workingVector1.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector2.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.zzz + workingVector1.xyw;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector2.xyz;
  workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector2.yyy;
  workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector1.zxy;
  workingVector3.xyz = workingVector1.yzx * workingVector2.zxy + -workingVector3.xyz;
  varyingBitangent0.xyz = workingVector3.xyz;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingNormal0.xyz = workingVector1.xyz;
  varyingTangent0.xyz = workingVector2.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.zzz + workingVector4.xyz;
  varyingTexCoord1.xyz = workingVector0.xyz;
  workingVector0.xyz = workingVector4.yyy * workingVector3.xyz;
  workingVector0.xyz = workingVector4.xxx * workingVector2.xyz + workingVector0.xyz;
  varyingTexCoord2.xyz = workingVector4.zzz * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
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
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  workingVector1.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector2.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.zzz + workingVector1.xyw;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector2.xyz;
  workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector2.yyy;
  workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector1.zxy;
  workingVector3.xyz = workingVector1.yzx * workingVector2.zxy + -workingVector3.xyz;
  varyingBitangent0.xyz = workingVector3.xyz;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingNormal0.xyz = workingVector1.xyz;
  varyingTangent0.xyz = workingVector2.xyz;
  workingVector4.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_1.xy * vertexTexCoord0.yy;
  workingVector4.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_0.xy * vertexTexCoord0.xx + workingVector4.xy;
  varyingTexCoord0.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_3.xy + workingVector4.xy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.zzz + workingVector4.xyz;
  varyingTexCoord1.xyz = workingVector0.xyz;
  workingVector0.xyz = workingVector4.yyy * workingVector3.xyz;
  workingVector0.xyz = workingVector4.xxx * workingVector2.xyz + workingVector0.xyz;
  varyingTexCoord2.xyz = workingVector4.zzz * workingVector1.xyz + workingVector0.xyz;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector2.xyz;
  workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector2.yyy;
  workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector0.zxy;
  workingVector3.xyz = workingVector0.yzx * workingVector2.zxy + -workingVector3.xyz;
  varyingBitangent0.xyz = workingVector3.xyz;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingNormal0.xyz = workingVector0.xyz;
  varyingTangent0.xyz = workingVector2.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  varyingTexCoord1.xyz = workingVector1.xyz;
  workingVector1.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector4.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.zzz + workingVector1.xyw;
  workingVector3.xyz = workingVector1.yyy * workingVector3.xyz;
  workingVector1.xyw = workingVector1.xxx * workingVector2.xyz + workingVector3.xyz;
  varyingTexCoord2.xyz = workingVector1.zzz * workingVector0.xyz + workingVector1.xyw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector2.xyz;
  workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector2.yyy;
  workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector2.xxx + workingVector3.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector0.zxy;
  workingVector3.xyz = workingVector0.yzx * workingVector2.zxy + -workingVector3.xyz;
  varyingBitangent0.xyz = workingVector3.xyz;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingNormal0.xyz = workingVector0.xyz;
  varyingTangent0.xyz = workingVector2.xyz;
  workingVector4.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_1.xy * vertexTexCoord0.yy;
  workingVector4.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_0.xy * vertexTexCoord0.xx + workingVector4.xy;
  varyingTexCoord0.xy = RD_UNIFORM_UV0_TRANSFORM_ROW_3.xy + workingVector4.xy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  varyingTexCoord1.xyz = workingVector1.xyz;
  workingVector1.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector4.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.zzz + workingVector1.xyw;
  workingVector3.xyz = workingVector1.yyy * workingVector3.xyz;
  workingVector1.xyw = workingVector1.xxx * workingVector2.xyz + workingVector3.xyz;
  varyingTexCoord2.xyz = workingVector1.zzz * workingVector0.xyz + workingVector1.xyw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord2.x = mad(multiplyAddValue17, productValue, mad(multiplyAddValue16, productValue6, multiplyAddValue15 * productValue3));
    varyingTexCoord2.y = mad(multiplyAddValue17, productValue1, mad(multiplyAddValue16, productValue7, multiplyAddValue15 * productValue4));
    varyingTexCoord2.z = mad(multiplyAddValue17, productValue2, mad(multiplyAddValue16, productValue8, multiplyAddValue15 * productValue5));
    varyingTexCoord1.x = multiplyAddValue;
    varyingTexCoord1.y = multiplyAddValue1;
    varyingTexCoord1.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = RD_UNIFORM_UV0_TRANSFORM_ROW_3.x + mad(RD_UNIFORM_UV0_TRANSFORM_ROW_1.x, vertexTexCoord0.y, RD_UNIFORM_UV0_TRANSFORM_ROW_0.x * vertexTexCoord0.x);
    varyingTexCoord0.y = mad(RD_UNIFORM_UV0_TRANSFORM_ROW_1.y, vertexTexCoord0.y, RD_UNIFORM_UV0_TRANSFORM_ROW_0.y * vertexTexCoord0.x) + RD_UNIFORM_UV0_TRANSFORM_ROW_3.y;
    varyingTexCoord2.x = mad(multiplyAddValue17, productValue, mad(multiplyAddValue16, productValue6, multiplyAddValue15 * productValue3));
    varyingTexCoord2.y = mad(multiplyAddValue17, productValue1, mad(multiplyAddValue16, productValue7, multiplyAddValue15 * productValue4));
    varyingTexCoord2.z = mad(multiplyAddValue17, productValue2, mad(multiplyAddValue16, productValue8, multiplyAddValue15 * productValue5));
    varyingTexCoord1.x = multiplyAddValue;
    varyingTexCoord1.y = multiplyAddValue1;
    varyingTexCoord1.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue18 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue19 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue20 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord2.x = mad(multiplyAddValue23, productValue, mad(multiplyAddValue22, productValue6, multiplyAddValue21 * productValue3));
    varyingTexCoord2.y = mad(multiplyAddValue23, productValue1, mad(multiplyAddValue22, productValue7, multiplyAddValue21 * productValue4));
    varyingTexCoord2.z = mad(multiplyAddValue23, productValue2, mad(multiplyAddValue22, productValue8, multiplyAddValue21 * productValue5));
    varyingTexCoord1.x = multiplyAddValue18;
    varyingTexCoord1.y = multiplyAddValue19;
    varyingTexCoord1.z = multiplyAddValue20;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue18 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue19 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue20 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue8, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue7, multiplyAddValue6 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue20, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue19, multiplyAddValue18 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = RD_UNIFORM_UV0_TRANSFORM_ROW_3.x + mad(RD_UNIFORM_UV0_TRANSFORM_ROW_1.x, vertexTexCoord0.y, RD_UNIFORM_UV0_TRANSFORM_ROW_0.x * vertexTexCoord0.x);
    varyingTexCoord0.y = mad(RD_UNIFORM_UV0_TRANSFORM_ROW_1.y, vertexTexCoord0.y, RD_UNIFORM_UV0_TRANSFORM_ROW_0.y * vertexTexCoord0.x) + RD_UNIFORM_UV0_TRANSFORM_ROW_3.y;
    varyingTexCoord2.x = mad(multiplyAddValue23, productValue, mad(multiplyAddValue22, productValue6, multiplyAddValue21 * productValue3));
    varyingTexCoord2.y = mad(multiplyAddValue23, productValue1, mad(multiplyAddValue22, productValue7, multiplyAddValue21 * productValue4));
    varyingTexCoord2.z = mad(multiplyAddValue23, productValue2, mad(multiplyAddValue22, productValue8, multiplyAddValue21 * productValue5));
    varyingTexCoord1.x = multiplyAddValue18;
    varyingTexCoord1.y = multiplyAddValue19;
    varyingTexCoord1.z = multiplyAddValue20;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    return stage_output;
#endif
}
