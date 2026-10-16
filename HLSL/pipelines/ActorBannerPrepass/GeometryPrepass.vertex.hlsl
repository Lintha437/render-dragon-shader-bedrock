// ActorBannerPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
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
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ActorBannerPrepass/VertexBindings.hlsli"

#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  out int varyingFrontFacing0 : FRONTFACING0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
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
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+43].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+43].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+43].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+43].www + workingVector1.yzw;
  workingVector2.xyz = vertexPosition0.yyy * workingVector1.yzw;
  workingVector3.xyz = vertexVectorConstants0[workingVector1.x+42].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+42].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+42].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+42].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * vertexPosition0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector1.x+44].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+44].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+44].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+44].www + workingVector4.xyz;
  workingVector2.xyz = workingVector4.xyz * vertexPosition0.zzz + workingVector2.xyz;
  workingVector5.xyz = vertexVectorConstants0[workingVector1.x+45].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+45].xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+45].zzz + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+45].www + workingVector5.xyz;
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
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+43].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+43].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+43].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+43].www + workingVector1.xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.yyy;
  workingVector3.xyz = vertexVectorConstants0[workingVector0.w+42].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+42].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+42].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+42].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * workingVector0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector0.w+44].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+44].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+44].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+44].www + workingVector4.xyz;
  varyingBitangent0.xyz = workingVector4.xyz * workingVector0.zzz + workingVector2.xyz;
#endif
  workingVector0.x = 255 * vertexColor0.w;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.y = RD_COMPARISON_MASK(0 < (int)workingVector0.x);
  varyingColor0.w = workingVector0.y ? 0 : 1;
  varyingColor0.xyz = vertexVectorConstants0[workingVector0.x+28].xyz;
  varyingFrontFacing0.x = 0;
#if RD_FEATURE_INSTANCING == RD_OFF
  workingVector0.yzw = vertexNormal0.yyy * workingVector1.yzw;
  workingVector1.yzw = vertexTangent0.yyy * workingVector1.yzw;
  workingVector1.yzw = workingVector3.xyz * vertexTangent0.xxx + workingVector1.yzw;
  workingVector0.yzw = workingVector3.xyz * vertexNormal0.xxx + workingVector0.yzw;
  varyingNormal0.xyz = workingVector4.xyz * vertexNormal0.zzz + workingVector0.yzw;
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.yzw;
  workingVector0.yzw = vertexVectorConstants0[workingVector1.x+75].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector0.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+75].xxx + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+75].zzz + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+75].www + workingVector0.yzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector0.yzw;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+74].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+74].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+74].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+74].www + workingVector1.yzw;
  workingVector0.yzw = workingVector1.yzw * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+76].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+76].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+76].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+76].www + workingVector1.yzw;
  workingVector0.yzw = workingVector1.yzw * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+77].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+77].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+77].zzz + workingVector1.yzw;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+77].www + workingVector1.yzw;
#elif RD_FEATURE_INSTANCING == RD_ON
  workingVector2.xyz = vertexNormal0.yyy * workingVector1.xyz;
  workingVector1.xyz = vertexTangent0.yyy * workingVector1.xyz;
  workingVector1.xyz = workingVector3.xyz * vertexTangent0.xxx + workingVector1.xyz;
  workingVector2.xyz = workingVector3.xyz * vertexNormal0.xxx + workingVector2.xyz;
  varyingNormal0.xyz = workingVector4.xyz * vertexNormal0.zzz + workingVector2.xyz;
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+75].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+75].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+75].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+75].www + workingVector1.xyz;
  workingVector1.xyz = vertexPosition0.yyy * workingVector1.xyz;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.w+74].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+74].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+74].zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+74].www + workingVector2.xyz;
  workingVector1.xyz = workingVector2.xyz * vertexPosition0.xxx + workingVector1.xyz;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.w+76].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+76].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+76].zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+76].www + workingVector2.xyz;
  workingVector1.xyz = workingVector2.xyz * vertexPosition0.zzz + workingVector1.xyz;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.w+77].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+77].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+77].zzz + workingVector2.xyz;
  workingVector0.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+77].www + workingVector2.xyz;
#endif
  varyingTexCoord4.xyz = workingVector1.xyz + workingVector0.yzw;
  workingVector0.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord0.xy = workingVector0.yz;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.x+35].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+35].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.x+35].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+35].xy;
  return;
}
#elif RD_FEATURE_TINTING == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_FEATURE_TINTING == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+36].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+36].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+36].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+36].www + workingVector1.yzw;
  workingVector2.xyz = vertexPosition0.yyy * workingVector1.yzw;
  workingVector3.xyz = vertexVectorConstants0[workingVector1.x+35].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+35].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+35].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+35].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * vertexPosition0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector1.x+37].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+37].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+37].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+37].www + workingVector4.xyz;
  workingVector2.xyz = workingVector4.xyz * vertexPosition0.zzz + workingVector2.xyz;
  workingVector5.xyz = vertexVectorConstants0[workingVector1.x+38].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+38].xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+38].zzz + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+38].www + workingVector5.xyz;
  workingVector2.xyz = workingVector5.xyz + workingVector2.xyz;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector2.yyyy;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector2.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector5.xyzw;
  varyingTexCoord3.xyz = workingVector2.xyz;
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
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector2.xyz = workingVector1.yzw * workingVector0.yyy;
  workingVector0.xyw = workingVector3.xyz * workingVector0.xxx + workingVector2.xyz;
  varyingBitangent0.xyz = workingVector4.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = vertexNormal0.yyy * workingVector1.yzw;
  workingVector1.yzw = vertexTangent0.yyy * workingVector1.yzw;
  workingVector1.yzw = workingVector3.xyz * vertexTangent0.xxx + workingVector1.yzw;
  workingVector0.xyz = workingVector3.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = workingVector4.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.yzw;
  workingVector0.xyz = vertexVectorConstants0[workingVector1.x+68].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+68].xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+68].zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+68].www + workingVector0.xyz;
  workingVector0.xyz = vertexPosition0.yyy * workingVector0.xyz;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+67].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+67].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+67].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+67].www + workingVector1.yzw;
  workingVector0.xyz = workingVector1.yzw * vertexPosition0.xxx + workingVector0.xyz;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+69].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+69].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+69].zzz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+69].www + workingVector1.yzw;
  workingVector0.xyz = workingVector1.yzw * vertexPosition0.zzz + workingVector0.xyz;
  workingVector1.yzw = vertexVectorConstants0[workingVector1.x+70].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector1.x+70].xxx + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector1.x+70].zzz + workingVector1.yzw;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector1.x+70].www + workingVector1.yzw;
  varyingTexCoord4.xyz = workingVector1.xyz + workingVector0.xyz;
  workingVector0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord0.xy = workingVector0.xy;
  workingVector0.z = 255 * vertexColor0.w;
  workingVector0.z = (int)workingVector0.z;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.z+28].zw * workingVector0.xy + vertexVectorConstants0[workingVector0.z+28].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.z+28].zw * workingVector0.xy + vertexVectorConstants0[workingVector0.z+28].xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
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
  varyingTexCoord3.xyz = workingVector2.xyz;
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
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector0.w = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+36].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+36].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+36].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+36].www + workingVector1.xyz;
  workingVector2.xyz = workingVector1.xyz * workingVector0.yyy;
  workingVector3.xyz = vertexVectorConstants0[workingVector0.w+35].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+35].xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+35].zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+35].www + workingVector3.xyz;
  workingVector2.xyz = workingVector3.xyz * workingVector0.xxx + workingVector2.xyz;
  workingVector4.xyz = vertexVectorConstants0[workingVector0.w+37].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+37].xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+37].zzz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+37].www + workingVector4.xyz;
  varyingBitangent0.xyz = workingVector4.xyz * workingVector0.zzz + workingVector2.xyz;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = vertexNormal0.yyy * workingVector1.xyz;
  workingVector1.xyz = vertexTangent0.yyy * workingVector1.xyz;
  workingVector1.xyz = workingVector3.xyz * vertexTangent0.xxx + workingVector1.xyz;
  workingVector0.xyz = workingVector3.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = workingVector4.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTangent0.xyz = workingVector4.xyz * vertexTangent0.zzz + workingVector1.xyz;
  workingVector0.xyz = vertexVectorConstants0[workingVector0.w+68].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+68].xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+68].zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+68].www + workingVector0.xyz;
  workingVector0.xyz = vertexPosition0.yyy * workingVector0.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+67].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+67].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+67].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+67].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+69].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+69].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+69].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+69].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.w+70].yyy * RD_UNIFORM_PREV_WORLD_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_0.xyz * vertexVectorConstants0[workingVector0.w+70].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_2.xyz * vertexVectorConstants0[workingVector0.w+70].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_WORLD_ROW_3.xyz * vertexVectorConstants0[workingVector0.w+70].www + workingVector1.xyz;
  varyingTexCoord4.xyz = workingVector1.xyz + workingVector0.xyz;
  workingVector0.xy = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord0.xy = workingVector0.xy;
  workingVector0.z = 255 * vertexColor0.w;
  workingVector0.z = (int)workingVector0.z;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.z+28].zw * workingVector0.xy + vertexVectorConstants0[workingVector0.z+28].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.z+28].zw * workingVector0.xy + vertexVectorConstants0[workingVector0.z+28].xy;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 42u;
    uint sumValue1 = bitwiseValue + 43u;
    uint sumValue2 = bitwiseValue + 44u;
    uint sumValue3 = bitwiseValue + 45u;
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue9 = mad(multiplyAddValue2, vertexPosition0.z, mad(multiplyAddValue1, vertexPosition0.y, multiplyAddValue * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue10 = mad(multiplyAddValue5, vertexPosition0.z, mad(multiplyAddValue4, vertexPosition0.y, multiplyAddValue3 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue11 = mad(multiplyAddValue8, vertexPosition0.z, mad(multiplyAddValue7, vertexPosition0.y, multiplyAddValue6 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue16 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue15, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue17 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue15, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue18 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue15, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue19 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue15, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue2 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue4 = productValue2 + 35u;
    uint sumValue5 = productValue2 + 28u;
    uint sumValue6 = bitwiseValue + 74u;
    uint sumValue7 = bitwiseValue + 75u;
    uint sumValue8 = bitwiseValue + 76u;
    uint sumValue9 = bitwiseValue + 77u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue16;
    clipSpacePosition.y = multiplyAddValue17;
    clipSpacePosition.z = multiplyAddValue18;
    clipSpacePosition.w = multiplyAddValue19;
    varyingBitangent0.x = mad(multiplyAddValue2, productValue5, mad(multiplyAddValue1, productValue4, multiplyAddValue * productValue3));
    varyingBitangent0.y = mad(multiplyAddValue5, productValue5, mad(multiplyAddValue4, productValue4, multiplyAddValue3 * productValue3));
    varyingBitangent0.z = mad(multiplyAddValue8, productValue5, mad(multiplyAddValue7, productValue4, multiplyAddValue6 * productValue3));
    varyingColor1.x = multiplyAddValue16;
    varyingColor1.y = multiplyAddValue17;
    varyingColor1.z = multiplyAddValue18;
    varyingColor1.w = multiplyAddValue19;
    varyingColor0.x = vertexConstants[sumValue5].x;
    varyingColor0.y = vertexConstants[sumValue5].y;
    varyingColor0.z = vertexConstants[sumValue5].z;
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0f : 1.0f;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(multiplyAddValue2, vertexNormal0.z, mad(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    varyingNormal0.y = mad(multiplyAddValue5, vertexNormal0.z, mad(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    varyingNormal0.z = mad(multiplyAddValue8, vertexNormal0.z, mad(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    varyingTexCoord4.x = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue9].x)));
    varyingTexCoord4.y = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue9].x)));
    varyingTexCoord4.z = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue9].x)));
    varyingTangent0.x = mad(multiplyAddValue2, vertexTangent0.z, mad(multiplyAddValue1, vertexTangent0.y, multiplyAddValue * vertexTangent0.x));
    varyingTangent0.y = mad(multiplyAddValue5, vertexTangent0.z, mad(multiplyAddValue4, vertexTangent0.y, multiplyAddValue3 * vertexTangent0.x));
    varyingTangent0.z = mad(multiplyAddValue8, vertexTangent0.z, mad(multiplyAddValue7, vertexTangent0.y, multiplyAddValue6 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexConstants[sumValue4].z * productValue) + vertexConstants[sumValue4].x;
    varyingTexCoord2.y = (vertexConstants[sumValue4].w * productValue1) + vertexConstants[sumValue4].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue10 = bitwiseValue + 35u;
    uint sumValue11 = bitwiseValue + 36u;
    uint sumValue12 = bitwiseValue + 37u;
    uint sumValue13 = bitwiseValue + 38u;
    float multiplyAddValue20 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue21 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue22 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue23 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue24 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue25 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue26 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue27 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue28 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue29 = mad(multiplyAddValue22, vertexPosition0.z, mad(multiplyAddValue21, vertexPosition0.y, multiplyAddValue20 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue13].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue13].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue13].y, vertexConstants[sumValue13].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue30 = mad(multiplyAddValue25, vertexPosition0.z, mad(multiplyAddValue24, vertexPosition0.y, multiplyAddValue23 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue13].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue13].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue13].y, vertexConstants[sumValue13].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue31 = mad(multiplyAddValue28, vertexPosition0.z, mad(multiplyAddValue27, vertexPosition0.y, multiplyAddValue26 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue13].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue13].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue13].y, vertexConstants[sumValue13].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue31, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue30, multiplyAddValue29 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue31, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue30, multiplyAddValue29 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue31, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue30, multiplyAddValue29 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue31, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue30, multiplyAddValue29 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue36 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue35, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue34, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue33, multiplyAddValue32 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue37 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue35, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue34, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue33, multiplyAddValue32 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue38 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue35, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue34, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue33, multiplyAddValue32 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue39 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue35, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue34, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue33, multiplyAddValue32 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue6 = uint(int(vertexColor0.w * 255.0f)) + 28u;
    uint sumValue14 = bitwiseValue + 67u;
    uint sumValue15 = bitwiseValue + 68u;
    uint sumValue16 = bitwiseValue + 69u;
    uint sumValue17 = bitwiseValue + 70u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue36;
    clipSpacePosition.y = multiplyAddValue37;
    clipSpacePosition.z = multiplyAddValue38;
    clipSpacePosition.w = multiplyAddValue39;
    varyingBitangent0.x = mad(multiplyAddValue22, productValue5, mad(multiplyAddValue21, productValue4, multiplyAddValue20 * productValue3));
    varyingBitangent0.y = mad(multiplyAddValue25, productValue5, mad(multiplyAddValue24, productValue4, multiplyAddValue23 * productValue3));
    varyingBitangent0.z = mad(multiplyAddValue28, productValue5, mad(multiplyAddValue27, productValue4, multiplyAddValue26 * productValue3));
    varyingColor1.x = multiplyAddValue36;
    varyingColor1.y = multiplyAddValue37;
    varyingColor1.z = multiplyAddValue38;
    varyingColor1.w = multiplyAddValue39;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(multiplyAddValue22, vertexNormal0.z, mad(multiplyAddValue21, vertexNormal0.y, multiplyAddValue20 * vertexNormal0.x));
    varyingNormal0.y = mad(multiplyAddValue25, vertexNormal0.z, mad(multiplyAddValue24, vertexNormal0.y, multiplyAddValue23 * vertexNormal0.x));
    varyingNormal0.z = mad(multiplyAddValue28, vertexNormal0.z, mad(multiplyAddValue27, vertexNormal0.y, multiplyAddValue26 * vertexNormal0.x));
    varyingTexCoord4.x = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue17].x)));
    varyingTexCoord4.y = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue17].x)));
    varyingTexCoord4.z = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue17].x)));
    varyingTangent0.x = mad(multiplyAddValue22, vertexTangent0.z, mad(multiplyAddValue21, vertexTangent0.y, multiplyAddValue20 * vertexTangent0.x));
    varyingTangent0.y = mad(multiplyAddValue25, vertexTangent0.z, mad(multiplyAddValue24, vertexTangent0.y, multiplyAddValue23 * vertexTangent0.x));
    varyingTangent0.z = mad(multiplyAddValue28, vertexTangent0.z, mad(multiplyAddValue27, vertexTangent0.y, multiplyAddValue26 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexConstants[productValue6].z * productValue) + vertexConstants[productValue6].x;
    varyingTexCoord2.y = (vertexConstants[productValue6].w * productValue1) + vertexConstants[productValue6].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue29;
    varyingTexCoord3.y = multiplyAddValue30;
    varyingTexCoord3.z = multiplyAddValue31;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 42u;
    uint sumValue1 = bitwiseValue + 43u;
    uint sumValue2 = bitwiseValue + 44u;
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue40 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue41 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue42 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue45 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue46 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue47 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue46, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue48 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue49 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue50 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue2 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue4 = productValue2 + 35u;
    uint sumValue5 = productValue2 + 28u;
    uint sumValue6 = bitwiseValue + 74u;
    uint sumValue7 = bitwiseValue + 75u;
    uint sumValue8 = bitwiseValue + 76u;
    uint sumValue9 = bitwiseValue + 77u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue47;
    clipSpacePosition.y = multiplyAddValue48;
    clipSpacePosition.z = multiplyAddValue49;
    clipSpacePosition.w = multiplyAddValue50;
    varyingBitangent0.x = mad(multiplyAddValue2, productValue5, mad(multiplyAddValue1, productValue4, multiplyAddValue * productValue3));
    varyingBitangent0.y = mad(multiplyAddValue5, productValue5, mad(multiplyAddValue4, productValue4, multiplyAddValue3 * productValue3));
    varyingBitangent0.z = mad(multiplyAddValue8, productValue5, mad(multiplyAddValue7, productValue4, multiplyAddValue6 * productValue3));
    varyingColor1.x = multiplyAddValue47;
    varyingColor1.y = multiplyAddValue48;
    varyingColor1.z = multiplyAddValue49;
    varyingColor1.w = multiplyAddValue50;
    varyingColor0.x = vertexConstants[sumValue5].x;
    varyingColor0.y = vertexConstants[sumValue5].y;
    varyingColor0.z = vertexConstants[sumValue5].z;
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0f : 1.0f;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(multiplyAddValue2, vertexNormal0.z, mad(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    varyingNormal0.y = mad(multiplyAddValue5, vertexNormal0.z, mad(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    varyingNormal0.z = mad(multiplyAddValue8, vertexNormal0.z, mad(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    varyingTexCoord4.x = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue9].x)));
    varyingTexCoord4.y = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue9].x)));
    varyingTexCoord4.z = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue8].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue8].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue8].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue8].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue7].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue7].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue7].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue7].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue6].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue6].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue6].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue6].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue9].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue9].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue9].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue9].x)));
    varyingTangent0.x = mad(multiplyAddValue2, vertexTangent0.z, mad(multiplyAddValue1, vertexTangent0.y, multiplyAddValue * vertexTangent0.x));
    varyingTangent0.y = mad(multiplyAddValue5, vertexTangent0.z, mad(multiplyAddValue4, vertexTangent0.y, multiplyAddValue3 * vertexTangent0.x));
    varyingTangent0.z = mad(multiplyAddValue8, vertexTangent0.z, mad(multiplyAddValue7, vertexTangent0.y, multiplyAddValue6 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexConstants[sumValue4].z * productValue) + vertexConstants[sumValue4].x;
    varyingTexCoord2.y = (vertexConstants[sumValue4].w * productValue1) + vertexConstants[sumValue4].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue40;
    varyingTexCoord3.y = multiplyAddValue41;
    varyingTexCoord3.z = multiplyAddValue42;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue10 = bitwiseValue + 35u;
    uint sumValue11 = bitwiseValue + 36u;
    uint sumValue12 = bitwiseValue + 37u;
    float multiplyAddValue20 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue21 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue22 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue23 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue24 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue25 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue26 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue10].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue10].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue10].y, vertexConstants[sumValue10].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue27 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue11].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue11].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue11].y, vertexConstants[sumValue11].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue28 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue12].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue12].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue12].y, vertexConstants[sumValue12].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue40 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue41 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue42 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue45 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue46 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue42, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue41, multiplyAddValue40 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue47 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue46, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue48 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue49 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue50 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue46, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue45, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue44, multiplyAddValue43 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue6 = uint(int(vertexColor0.w * 255.0f)) + 28u;
    uint sumValue14 = bitwiseValue + 67u;
    uint sumValue15 = bitwiseValue + 68u;
    uint sumValue16 = bitwiseValue + 69u;
    uint sumValue17 = bitwiseValue + 70u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue47;
    clipSpacePosition.y = multiplyAddValue48;
    clipSpacePosition.z = multiplyAddValue49;
    clipSpacePosition.w = multiplyAddValue50;
    varyingBitangent0.x = mad(multiplyAddValue22, productValue5, mad(multiplyAddValue21, productValue4, multiplyAddValue20 * productValue3));
    varyingBitangent0.y = mad(multiplyAddValue25, productValue5, mad(multiplyAddValue24, productValue4, multiplyAddValue23 * productValue3));
    varyingBitangent0.z = mad(multiplyAddValue28, productValue5, mad(multiplyAddValue27, productValue4, multiplyAddValue26 * productValue3));
    varyingColor1.x = multiplyAddValue47;
    varyingColor1.y = multiplyAddValue48;
    varyingColor1.z = multiplyAddValue49;
    varyingColor1.w = multiplyAddValue50;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(multiplyAddValue22, vertexNormal0.z, mad(multiplyAddValue21, vertexNormal0.y, multiplyAddValue20 * vertexNormal0.x));
    varyingNormal0.y = mad(multiplyAddValue25, vertexNormal0.z, mad(multiplyAddValue24, vertexNormal0.y, multiplyAddValue23 * vertexNormal0.x));
    varyingNormal0.z = mad(multiplyAddValue28, vertexNormal0.z, mad(multiplyAddValue27, vertexNormal0.y, multiplyAddValue26 * vertexNormal0.x));
    varyingTexCoord4.x = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.x, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.x, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.x, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.x * vertexConstants[sumValue17].x)));
    varyingTexCoord4.y = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.y, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.y, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.y, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.y * vertexConstants[sumValue17].x)));
    varyingTexCoord4.z = mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue16].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue16].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue16].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue16].x))), vertexPosition0.z, mad(mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue15].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue15].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue15].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue15].x))), vertexPosition0.y, mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue14].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue14].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue14].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue14].x))) * vertexPosition0.x)) + mad(RD_UNIFORM_PREV_WORLD_ROW_3.z, vertexConstants[sumValue17].w, mad(RD_UNIFORM_PREV_WORLD_ROW_2.z, vertexConstants[sumValue17].z, mad(RD_UNIFORM_PREV_WORLD_ROW_1.z, vertexConstants[sumValue17].y, RD_UNIFORM_PREV_WORLD_ROW_0.z * vertexConstants[sumValue17].x)));
    varyingTangent0.x = mad(multiplyAddValue22, vertexTangent0.z, mad(multiplyAddValue21, vertexTangent0.y, multiplyAddValue20 * vertexTangent0.x));
    varyingTangent0.y = mad(multiplyAddValue25, vertexTangent0.z, mad(multiplyAddValue24, vertexTangent0.y, multiplyAddValue23 * vertexTangent0.x));
    varyingTangent0.z = mad(multiplyAddValue28, vertexTangent0.z, mad(multiplyAddValue27, vertexTangent0.y, multiplyAddValue26 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexConstants[productValue6].z * productValue) + vertexConstants[productValue6].x;
    varyingTexCoord2.y = (vertexConstants[productValue6].w * productValue1) + vertexConstants[productValue6].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue40;
    varyingTexCoord3.y = multiplyAddValue41;
    varyingTexCoord3.z = multiplyAddValue42;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
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
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
#endif
