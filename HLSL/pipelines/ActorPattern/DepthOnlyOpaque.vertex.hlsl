// ActorPattern / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ActorPattern/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingColor3 : COLOR3,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingColor3 : COLOR3,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+28].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+28].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+28].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+28].wwww + workingVector1.xyzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector1.xyz;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+27].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+27].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+27].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+27].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+29].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+29].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+29].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+29].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.x+30].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+30].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+30].zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+30].www + workingVector2.xyz;
  workingVector0.xyz = workingVector2.xyz + workingVector0.yzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
  workingVector2.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector2.x = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector3.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector2.y = dot(workingVector3.xyzw, workingVector0.xyzw);
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector3.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector2.w = dot(workingVector3.xyzw, workingVector0.xyzw);
  workingVector3.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector3.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector2.z = dot(workingVector3.xyzw, workingVector0.xyzw);
  clipSpacePosition.xyzw = workingVector2.xyzw;
  varyingColor1.xyzw = workingVector2.xyzw;
  workingVector0.x = workingVector2.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = float4(0,0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.x = dot(workingVector1.xyzw, workingVector1.xyzw);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  workingVector0.y = workingVector0.y * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xz = workingVector0.xz * workingVector0.xz;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.y * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.z * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + workingVector0.x;
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = float2(0,0);
  varyingTexCoord2.xyzw = float4(0,0,0,0);
  return;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  varyingTexCoord3.xyz = workingVector2.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector0.y = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = float4(0,0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+28].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+28].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+28].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+28].wwww + workingVector1.xyzw;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+27].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+27].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+27].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+27].wwww + workingVector2.xyzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+29].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+29].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+29].zzzz + workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+29].wwww + workingVector2.xyzw;
  workingVector0.xyzw = workingVector0.xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
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
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = float2(0,0);
  varyingTexCoord2.xyzw = float4(0,0,0,0);
  return;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector0.yzw = vertexVectorConstants0[workingVector0.x+28].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+28].xxx + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+28].zzz + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+28].www + workingVector0.yzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+27].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+27].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+27].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+27].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+29].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+29].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+29].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+29].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+30].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+30].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+30].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+30].www + workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz + workingVector0.yzw;
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
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector1.w = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.z = dot(workingVector2.xyzw, workingVector0.xyzw);
  clipSpacePosition.xyzw = workingVector1.xyzw;
  varyingColor1.xyzw = workingVector1.xyzw;
  workingVector0.x = workingVector1.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = float4(0,0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + 1;
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = float2(0,0);
  varyingTexCoord2.xyzw = float4(0,0,0,0);
  return;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  varyingTexCoord3.xyz = workingVector2.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector2.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector0.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector0.y = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector0.z = dot(workingVector2.xyzw, workingVector1.xyzw);
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor1.xyzw = workingVector0.xyzw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = float4(0,0,0,0);
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + 1;
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = float2(0,0);
  varyingTexCoord2.xyzw = float4(0,0,0,0);
  return;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    uint sumValue3 = bitwiseValue + 30u;
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue4 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue5 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue9 = mad(multiplyAddValue2, vertexNormal0.z, mad(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    float multiplyAddValue10 = mad(multiplyAddValue5, vertexNormal0.z, mad(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    float multiplyAddValue11 = mad(multiplyAddValue8, vertexNormal0.z, mad(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    float multiplyAddValue12 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue = rsqrt(dot(float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12), float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue11;
    float productValue2 = (((0.449999988079071044921875f - ((productValue * productValue) * 0.100000001490116119384765625f)) + ((productValue1 * productValue1) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue10 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue) + 1.0f) * 0.2750000059604644775390625f);
    float multiplyAddValue13 = mad(multiplyAddValue2, vertexPosition0.z, mad(multiplyAddValue1, vertexPosition0.y, multiplyAddValue * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue14 = mad(multiplyAddValue5, vertexPosition0.z, mad(multiplyAddValue4, vertexPosition0.y, multiplyAddValue3 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue15 = mad(multiplyAddValue8, vertexPosition0.z, mad(multiplyAddValue7, vertexPosition0.y, multiplyAddValue6 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue14, multiplyAddValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue20 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue19, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue21 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue22 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue23 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue18, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue20;
    clipSpacePosition.y = multiplyAddValue21;
    clipSpacePosition.z = multiplyAddValue22;
    clipSpacePosition.w = multiplyAddValue23;
    varyingColor1.x = multiplyAddValue20;
    varyingColor1.y = multiplyAddValue21;
    varyingColor1.z = multiplyAddValue22;
    varyingColor1.w = multiplyAddValue23;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue22 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue2 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord2.w = 0.0f;
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    float multiplyAddValue24 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexNormal0.x));
    float multiplyAddValue25 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexNormal0.x));
    float multiplyAddValue26 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexNormal0.x));
    float multiplyAddValue12 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue1 = rsqrt(dot(float4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue12), float4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue12)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue24;
    float productValue4 = inverseLengthValue1 * multiplyAddValue26;
    float productValue5 = (((0.449999988079071044921875f - ((productValue3 * productValue3) * 0.100000001490116119384765625f)) + ((productValue4 * productValue4) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue25 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue1) + 1.0f) * 0.2750000059604644775390625f);
    float multiplyAddValue27 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue28 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue29 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue31 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue34 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue33, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue35 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue36 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue37 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue34;
    clipSpacePosition.y = multiplyAddValue35;
    clipSpacePosition.z = multiplyAddValue36;
    clipSpacePosition.w = multiplyAddValue37;
    varyingColor1.x = multiplyAddValue34;
    varyingColor1.y = multiplyAddValue35;
    varyingColor1.z = multiplyAddValue36;
    varyingColor1.w = multiplyAddValue37;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue36 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue5 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue5 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue5 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord2.w = 0.0f;
    varyingTexCoord3.x = multiplyAddValue27;
    varyingTexCoord3.y = multiplyAddValue28;
    varyingTexCoord3.z = multiplyAddValue29;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    uint sumValue3 = bitwiseValue + 30u;
    float productValue6 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
    float multiplyAddValue38 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue39 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue40 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue39, multiplyAddValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue45 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue44, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue46 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue47 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue48 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue44, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue43, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue42, multiplyAddValue41 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue45;
    clipSpacePosition.y = multiplyAddValue46;
    clipSpacePosition.z = multiplyAddValue47;
    clipSpacePosition.w = multiplyAddValue48;
    varyingColor1.x = multiplyAddValue45;
    varyingColor1.y = multiplyAddValue46;
    varyingColor1.z = multiplyAddValue47;
    varyingColor1.w = multiplyAddValue48;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue47 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord2.w = 0.0f;
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue6 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
    float multiplyAddValue27 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue28 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue29 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue31 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue28, multiplyAddValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue34 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue33, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue35 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue36 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue37 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue33, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue32, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue31, multiplyAddValue30 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    clipSpacePosition.x = multiplyAddValue34;
    clipSpacePosition.y = multiplyAddValue35;
    clipSpacePosition.z = multiplyAddValue36;
    clipSpacePosition.w = multiplyAddValue37;
    varyingColor1.x = multiplyAddValue34;
    varyingColor1.y = multiplyAddValue35;
    varyingColor1.z = multiplyAddValue36;
    varyingColor1.w = multiplyAddValue37;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue36 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue6 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = 0.0f;
    varyingTexCoord2.y = 0.0f;
    varyingTexCoord2.z = 0.0f;
    varyingTexCoord2.w = 0.0f;
    varyingTexCoord3.x = multiplyAddValue27;
    varyingTexCoord3.y = multiplyAddValue28;
    varyingTexCoord3.z = multiplyAddValue29;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexBlendIndices0 = stage_input.vertexBlendIndices0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
