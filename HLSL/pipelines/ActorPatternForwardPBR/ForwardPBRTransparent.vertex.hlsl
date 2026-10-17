// ActorPatternForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM40
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ActorPatternForwardPBR/VertexBindings.hlsli"

void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
#if RD_FEATURE_INSTANCING == RD_OFF
  float2 vertexTexCoord0 : TEXCOORD0,
#elif RD_FEATURE_INSTANCING == RD_ON
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
#endif
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
{
#if RD_FEATURE_INSTANCING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
#elif RD_FEATURE_INSTANCING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector1.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+25].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+25].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+25].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+25].www + workingVector1.yzw;
  workingVector2.xyz = vertexPosition0.yyy * workingVector1.yzw;
  workingVector3.xyz = vertexVectorConstants0[workingVector1.x+24].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+24].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+24].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+24].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * vertexPosition0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector1.x+26].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+26].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+26].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+26].www + workingVector4.xyz;
  workingVector2.xyz = workingVector4.xyz * vertexPosition0.zzz + workingVector2.xyz;
  workingVector5.xyz = vertexVectorConstants0[workingVector1.x+27].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+27].xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+27].zzz + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+27].www + workingVector5.xyz;
  workingVector2.xyz = workingVector5.xyz + workingVector2.xyz;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector5.xyzw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector1.xyz = vertexPosition0.xyz;
  workingVector1.w = 1;
  workingVector2.y = dot(workingVector1.xyzw, vertexTexCoord6.xyzw);
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector2.x = dot(workingVector1.xyzw, vertexTexCoord7.xyzw);
  workingVector2.z = dot(workingVector1.xyzw, vertexTexCoord5.xyzw);
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector3.xyzw;
#endif
  varyingTexCoord3.xyz = workingVector2.xyz;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector5.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector2.xyzw);
  workingVector5.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector5.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector5.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector5.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector0.y = dot(workingVector5.xyzw, workingVector2.xyzw);
  workingVector5.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector5.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector5.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector5.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.z = dot(workingVector5.xyzw, workingVector2.xyzw);
  workingVector5.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector5.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector5.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector5.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector5.xyzw, workingVector2.xyzw);
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector0.y = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
#endif
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector2.xyz = workingVector1.yzw * workingVector0.yyy;
  workingVector0.xyw = workingVector3.xyz * workingVector0.xxx + workingVector2.xyz;
  varyingBitangent0.xyz = workingVector4.xyz * workingVector0.zzz + workingVector0.xyw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.w = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+25].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+25].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+25].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+25].www + workingVector1.xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.yyy;
  workingVector3.xyz = vertexVectorConstants0[workingVector0.w+24].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+24].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+24].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+24].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * workingVector0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector0.w+26].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+26].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+26].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+26].www + workingVector4.xyz;
  varyingBitangent0.xyz = workingVector4.xyz * workingVector0.zzz + workingVector2.xyz;
#endif
  varyingColor0.xyzw = vertexColor0.xyzw;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.xyz = vertexNormal0.yyy * workingVector1.yzw;
  workingVector1.yzw = vertexTangent0.yyy * workingVector1.yzw;
  workingVector1.yzw = workingVector3.xyz * vertexTangent0.xxx + workingVector1.yzw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector0.xyz = vertexNormal0.yyy * workingVector1.xyz;
  workingVector1.xyz = vertexTangent0.yyy * workingVector1.xyz;
  workingVector1.xyz = workingVector3.xyz * vertexTangent0.xxx + workingVector1.xyz;
#endif
  workingVector0.xyz = workingVector3.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = workingVector4.xyz * vertexNormal0.zzz + workingVector0.xyz;
#if RD_FEATURE_INSTANCING == RD_OFF
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.yzw;
  workingVector0.xyz = vertexVectorConstants0[workingVector1.x+58].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+58].xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+58].zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+58].www + workingVector0.xyz;
#elif RD_FEATURE_INSTANCING == RD_ON
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.xyz;
  workingVector0.xyz = vertexVectorConstants0[workingVector0.w+58].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+58].xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+58].zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+58].www + workingVector0.xyz;
#endif
  workingVector0.xyz = vertexPosition0.yyy * workingVector0.xyz;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+57].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+57].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+57].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+57].www + workingVector1.yzw;
  workingVector0.xyz = workingVector1.yzw * vertexPosition0.xxx + workingVector0.xyz;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+59].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+59].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+59].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+59].www + workingVector1.yzw;
  workingVector0.xyz = workingVector1.yzw * vertexPosition0.zzz + workingVector0.xyz;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+60].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+60].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+60].zzz + workingVector1.yzw;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+60].www + workingVector1.yzw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+57].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+57].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+57].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+57].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+59].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+59].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+59].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+59].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+60].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+60].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+60].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+60].www + workingVector1.xyz;
#endif
  varyingTexCoord4.xyz = workingVector1.xyz + workingVector0.xyz;
  varyingTexCoord0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
}
