// ActorBanner / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
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
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ActorBanner/VertexBindings.hlsli"

#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  int vertexBlendIndices0 : BLENDINDICES0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
#if RD_FEATURE_INSTANCING == RD_OFF
  float2 vertexTexCoord0 : TEXCOORD0,
#elif RD_FEATURE_INSTANCING == RD_ON
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
#endif
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingColor3 : COLOR3,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float4 varyingTexCoord2 : TEXCOORD2,
  out float3 varyingTexCoord3 : TEXCOORD3)
{
#if RD_FEATURE_FANCY == RD_ON || RD_FEATURE_INSTANCING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF)
  float4 workingVector0,workingVector1,workingVector2;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF)
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+42].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+42].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+42].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+42].wwww + workingVector1.xyzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector1.xyz;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+41].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+41].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+41].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+41].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+43].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+43].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+43].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+43].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.x+44].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+44].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+44].zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+44].www + workingVector2.xyz;
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
#elif RD_FEATURE_INSTANCING == RD_ON
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
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF)
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector0.yzw = vertexVectorConstants0[workingVector0.x+42].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+42].xxx + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+42].zzz + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+42].www + workingVector0.yzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+41].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+41].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+41].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+41].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+43].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+43].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+43].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+43].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+44].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+44].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+44].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+44].www + workingVector1.xyz;
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
#endif
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  workingVector0.y = 255 * vertexColor0.w;
  workingVector0.y = (int)workingVector0.y;
  workingVector0.z = RD_COMPARISON_MASK(0 < (int)workingVector0.y);
  varyingColor0.w = workingVector0.z ? 0 : 1;
#if RD_FEATURE_FANCY == RD_ON || RD_FEATURE_INSTANCING == RD_OFF
  varyingColor0.xyz = vertexVectorConstants0[workingVector0.y+27].xyz;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON)
  varyingColor0.xyz = vertexVectorConstants0[workingVector0.y+11].xyz;
#endif
  workingVector0.z = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.z);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF)
  workingVector0.x = dot(workingVector1.xyzw, workingVector1.xyzw);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xzw = workingVector1.xyz * workingVector0.xxx;
  workingVector0.z = workingVector0.z * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xw = workingVector0.xw * workingVector0.xw;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.z * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.w * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + workingVector0.x;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON)
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+42].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+42].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+42].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+42].wwww + workingVector1.xyzw;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+41].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+41].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+41].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+41].wwww + workingVector2.xyzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+43].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+43].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+43].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+43].wwww + workingVector2.xyzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
  workingVector0.x = dot(workingVector1.xyzw, workingVector1.xyzw);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xzw = workingVector1.xyz * workingVector0.xxx;
  workingVector0.z = workingVector0.z * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xw = workingVector0.xw * workingVector0.xw;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.z * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.w * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + workingVector0.x;
#elif RD_FEATURE_FANCY == RD_OFF
  workingVector0.x = RD_UNIFORM_OVERLAY_COLOR.w * 0.349999994 + 1;
#endif
  varyingColor3.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  varyingColor3.w = 1;
  varyingTexCoord0.xy = float2(0,0);
  workingVector0.xz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
#if RD_FEATURE_FANCY == RD_ON || RD_FEATURE_INSTANCING == RD_OFF
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.y+34].zw * workingVector0.xz + vertexVectorConstants0[workingVector0.y+34].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.y+34].zw * workingVector0.xz + vertexVectorConstants0[workingVector0.y+34].xy;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON)
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.y+18].zw * workingVector0.xz + vertexVectorConstants0[workingVector0.y+18].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.y+18].zw * workingVector0.xz + vertexVectorConstants0[workingVector0.y+18].xy;
#endif
  return;
}
#elif RD_FEATURE_TINTING == RD_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
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
#elif RD_FEATURE_TINTING == RD_ON || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+35].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+35].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+35].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+35].wwww + workingVector1.xyzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector1.xyz;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+34].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+34].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+34].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+34].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+36].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+36].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+36].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+36].wwww + workingVector2.xyzw;
  workingVector0.yzw = workingVector2.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.zzzz + workingVector1.xyzw;
  workingVector2.xyz = vertexVectorConstants0[workingVector0.x+37].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+37].xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+37].zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+37].www + workingVector2.xyz;
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
  workingVector0.x = 255 * vertexColor0.w;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
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
  workingVector1.xyzw = vertexVectorConstants0[workingVector0.x+35].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+35].xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+35].zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+35].wwww + workingVector1.xyzw;
  workingVector1.xyzw = vertexNormal0.yyyy * workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+34].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+34].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+34].zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+34].wwww + workingVector2.xyzw;
  workingVector1.xyzw = workingVector2.xyzw * vertexNormal0.xxxx + workingVector1.xyzw;
  workingVector2.xyzw = vertexVectorConstants0[workingVector0.x+36].yyyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * vertexVectorConstants0[workingVector0.x+36].xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * vertexVectorConstants0[workingVector0.x+36].zzzz + workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw * vertexVectorConstants0[workingVector0.x+36].wwww + workingVector2.xyzw;
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
  workingVector0.x = 255 * vertexColor0.w;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
  return;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (uint)vertexBlendIndices0.x << 2;
  workingVector0.yzw = vertexVectorConstants0[workingVector0.x+35].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+35].xxx + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+35].zzz + workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+35].www + workingVector0.yzw;
  workingVector0.yzw = vertexPosition0.yyy * workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+34].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+34].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+34].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+34].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.xxx + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+36].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+36].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+36].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+36].www + workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * vertexPosition0.zzz + workingVector0.yzw;
  workingVector1.xyz = vertexVectorConstants0[workingVector0.x+37].yyy * RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexVectorConstants0[workingVector0.x+37].xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexVectorConstants0[workingVector0.x+37].zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexVectorConstants0[workingVector0.x+37].www + workingVector1.xyz;
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
  workingVector0.x = 255 * vertexColor0.w;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.x+27].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+27].xy;
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
  workingVector0.x = 255 * vertexColor0.w;
  workingVector0.x = (int)workingVector0.x;
  workingVector0.yz = vertexTexCoord0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  varyingTexCoord2.xy = vertexVectorConstants0[workingVector0.x+11].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+11].xy;
  varyingTexCoord2.zw = vertexVectorConstants0[workingVector0.x+11].zw * workingVector0.yz + vertexVectorConstants0[workingVector0.x+11].xy;
  return;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 41u;
    uint sumValue1 = bitwiseValue + 42u;
    uint sumValue2 = bitwiseValue + 43u;
    uint sumValue3 = bitwiseValue + 44u;
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
    float multiplyAddValue9 = mad(multiplyAddValue2, vertexNormal0.z, mad(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    float multiplyAddValue10 = mad(multiplyAddValue5, vertexNormal0.z, mad(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    float multiplyAddValue11 = mad(multiplyAddValue8, vertexNormal0.z, mad(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    float multiplyAddValue12 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue = rsqrt(dot(float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12), float4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12)));
    float productValue2 = inverseLengthValue * multiplyAddValue9;
    float productValue3 = inverseLengthValue * multiplyAddValue11;
    float productValue4 = (((0.449999988079071044921875f - ((productValue2 * productValue2) * 0.100000001490116119384765625f)) + ((productValue3 * productValue3) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue10 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue) + 1.0f) * 0.2750000059604644775390625f);
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
    uint productValue5 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue4 = productValue5 + 34u;
    uint sumValue5 = productValue5 + 27u;
    clipSpacePosition.x = multiplyAddValue20;
    clipSpacePosition.y = multiplyAddValue21;
    clipSpacePosition.z = multiplyAddValue22;
    clipSpacePosition.w = multiplyAddValue23;
    varyingColor1.x = multiplyAddValue20;
    varyingColor1.y = multiplyAddValue21;
    varyingColor1.z = multiplyAddValue22;
    varyingColor1.w = multiplyAddValue23;
    varyingColor0.x = vertexConstants[sumValue5].x;
    varyingColor0.y = vertexConstants[sumValue5].y;
    varyingColor0.z = vertexConstants[sumValue5].z;
    varyingColor0.w = (int(productValue5) > int(0u)) ? 0.0f : 1.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue22 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[sumValue4].z * productValue) + vertexConstants[sumValue4].x;
    varyingTexCoord2.y = (vertexConstants[sumValue4].w * productValue1) + vertexConstants[sumValue4].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
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
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue6 = bitwiseValue + 34u;
    uint sumValue7 = bitwiseValue + 35u;
    uint sumValue8 = bitwiseValue + 36u;
    uint sumValue9 = bitwiseValue + 37u;
    float multiplyAddValue38 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue39 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue40 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue41 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue42 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue43 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue44 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue45 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue46 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue47 = mad(multiplyAddValue40, vertexNormal0.z, mad(multiplyAddValue39, vertexNormal0.y, multiplyAddValue38 * vertexNormal0.x));
    float multiplyAddValue48 = mad(multiplyAddValue43, vertexNormal0.z, mad(multiplyAddValue42, vertexNormal0.y, multiplyAddValue41 * vertexNormal0.x));
    float multiplyAddValue49 = mad(multiplyAddValue46, vertexNormal0.z, mad(multiplyAddValue45, vertexNormal0.y, multiplyAddValue44 * vertexNormal0.x));
    float multiplyAddValue50 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue2 = rsqrt(dot(float4(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49, multiplyAddValue50), float4(multiplyAddValue47, multiplyAddValue48, multiplyAddValue49, multiplyAddValue50)));
    float productValue9 = inverseLengthValue2 * multiplyAddValue47;
    float productValue10 = inverseLengthValue2 * multiplyAddValue49;
    float productValue11 = (((0.449999988079071044921875f - ((productValue9 * productValue9) * 0.100000001490116119384765625f)) + ((productValue10 * productValue10) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue48 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue2) + 1.0f) * 0.2750000059604644775390625f);
    float multiplyAddValue51 = mad(multiplyAddValue40, vertexPosition0.z, mad(multiplyAddValue39, vertexPosition0.y, multiplyAddValue38 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue52 = mad(multiplyAddValue43, vertexPosition0.z, mad(multiplyAddValue42, vertexPosition0.y, multiplyAddValue41 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue53 = mad(multiplyAddValue46, vertexPosition0.z, mad(multiplyAddValue45, vertexPosition0.y, multiplyAddValue44 * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue54 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue52, multiplyAddValue51 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue55 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue52, multiplyAddValue51 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue56 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue52, multiplyAddValue51 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue57 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue53, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue52, multiplyAddValue51 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue58 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue57, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue56, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue55, multiplyAddValue54 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue59 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue57, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue56, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue55, multiplyAddValue54 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue60 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue57, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue56, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue55, multiplyAddValue54 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue61 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue57, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue56, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue55, multiplyAddValue54 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue12 = uint(int(vertexColor0.w * 255.0f)) + 27u;
    clipSpacePosition.x = multiplyAddValue58;
    clipSpacePosition.y = multiplyAddValue59;
    clipSpacePosition.z = multiplyAddValue60;
    clipSpacePosition.w = multiplyAddValue61;
    varyingColor1.x = multiplyAddValue58;
    varyingColor1.y = multiplyAddValue59;
    varyingColor1.z = multiplyAddValue60;
    varyingColor1.w = multiplyAddValue61;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue60 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue11 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue11 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue11 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[productValue12].z * productValue) + vertexConstants[productValue12].x;
    varyingTexCoord2.y = (vertexConstants[productValue12].w * productValue1) + vertexConstants[productValue12].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue51;
    varyingTexCoord3.y = multiplyAddValue52;
    varyingTexCoord3.z = multiplyAddValue53;
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
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 41u;
    uint sumValue1 = bitwiseValue + 42u;
    uint sumValue2 = bitwiseValue + 43u;
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue24 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexNormal0.x));
    float multiplyAddValue25 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexNormal0.x));
    float multiplyAddValue26 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexNormal0.x));
    float multiplyAddValue12 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue1 = rsqrt(dot(float4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue12), float4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue12)));
    float productValue6 = inverseLengthValue1 * multiplyAddValue24;
    float productValue7 = inverseLengthValue1 * multiplyAddValue26;
    float productValue8 = (((0.449999988079071044921875f - ((productValue6 * productValue6) * 0.100000001490116119384765625f)) + ((productValue7 * productValue7) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue25 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue1) + 1.0f) * 0.2750000059604644775390625f);
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
    uint productValue5 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue4 = productValue5 + 34u;
    uint sumValue5 = productValue5 + 27u;
    clipSpacePosition.x = multiplyAddValue34;
    clipSpacePosition.y = multiplyAddValue35;
    clipSpacePosition.z = multiplyAddValue36;
    clipSpacePosition.w = multiplyAddValue37;
    varyingColor1.x = multiplyAddValue34;
    varyingColor1.y = multiplyAddValue35;
    varyingColor1.z = multiplyAddValue36;
    varyingColor1.w = multiplyAddValue37;
    varyingColor0.x = vertexConstants[sumValue5].x;
    varyingColor0.y = vertexConstants[sumValue5].y;
    varyingColor0.z = vertexConstants[sumValue5].z;
    varyingColor0.w = (int(productValue5) > int(0u)) ? 0.0f : 1.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue36 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue8 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue8 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue8 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[sumValue4].z * productValue) + vertexConstants[sumValue4].x;
    varyingTexCoord2.y = (vertexConstants[sumValue4].w * productValue1) + vertexConstants[sumValue4].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
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
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue6 = bitwiseValue + 34u;
    uint sumValue7 = bitwiseValue + 35u;
    uint sumValue8 = bitwiseValue + 36u;
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float multiplyAddValue62 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexNormal0.x));
    float multiplyAddValue63 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexNormal0.x));
    float multiplyAddValue64 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexNormal0.x));
    float multiplyAddValue50 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))), vertexNormal0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.w, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.w))) * vertexNormal0.x));
    float inverseLengthValue3 = rsqrt(dot(float4(multiplyAddValue62, multiplyAddValue63, multiplyAddValue64, multiplyAddValue50), float4(multiplyAddValue62, multiplyAddValue63, multiplyAddValue64, multiplyAddValue50)));
    float productValue13 = inverseLengthValue3 * multiplyAddValue62;
    float productValue14 = inverseLengthValue3 * multiplyAddValue64;
    float productValue15 = (((0.449999988079071044921875f - ((productValue13 * productValue13) * 0.100000001490116119384765625f)) + ((productValue14 * productValue14) * 0.100000001490116119384765625f)) + (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f)) + ((((multiplyAddValue63 * RD_UNIFORM_TILE_LIGHT_COLOR.w) * inverseLengthValue3) + 1.0f) * 0.2750000059604644775390625f);
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
    uint productValue12 = uint(int(vertexColor0.w * 255.0f)) + 27u;
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
    varyingColor3.x = productValue15 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue15 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue15 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[productValue12].z * productValue) + vertexConstants[productValue12].x;
    varyingTexCoord2.y = (vertexConstants[productValue12].w * productValue1) + vertexConstants[productValue12].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
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
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 41u;
    uint sumValue1 = bitwiseValue + 42u;
    uint sumValue2 = bitwiseValue + 43u;
    uint sumValue3 = bitwiseValue + 44u;
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float productValue16 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
    float multiplyAddValue76 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue77 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue78 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue2].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue2].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue2].y, vertexConstants[sumValue2].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue1].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue1].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue1].y, vertexConstants[sumValue1].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue].y, vertexConstants[sumValue].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue3].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue3].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue3].y, vertexConstants[sumValue3].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue79 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue78, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue77, multiplyAddValue76 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue80 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue78, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue77, multiplyAddValue76 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue81 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue78, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue77, multiplyAddValue76 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue82 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue78, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue77, multiplyAddValue76 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue83 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue82, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue81, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue80, multiplyAddValue79 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue84 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue82, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue81, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue80, multiplyAddValue79 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue85 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue82, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue81, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue80, multiplyAddValue79 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue86 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue82, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue81, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue80, multiplyAddValue79 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue5 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue4 = productValue5 + 34u;
    uint sumValue5 = productValue5 + 27u;
    clipSpacePosition.x = multiplyAddValue83;
    clipSpacePosition.y = multiplyAddValue84;
    clipSpacePosition.z = multiplyAddValue85;
    clipSpacePosition.w = multiplyAddValue86;
    varyingColor1.x = multiplyAddValue83;
    varyingColor1.y = multiplyAddValue84;
    varyingColor1.z = multiplyAddValue85;
    varyingColor1.w = multiplyAddValue86;
    varyingColor0.x = vertexConstants[sumValue5].x;
    varyingColor0.y = vertexConstants[sumValue5].y;
    varyingColor0.z = vertexConstants[sumValue5].z;
    varyingColor0.w = (int(productValue5) > int(0u)) ? 0.0f : 1.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue85 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[sumValue4].z * productValue) + vertexConstants[sumValue4].x;
    varyingTexCoord2.y = (vertexConstants[sumValue4].w * productValue1) + vertexConstants[sumValue4].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue76;
    varyingTexCoord3.y = multiplyAddValue77;
    varyingTexCoord3.z = multiplyAddValue78;
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
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue6 = bitwiseValue + 34u;
    uint sumValue7 = bitwiseValue + 35u;
    uint sumValue8 = bitwiseValue + 36u;
    uint sumValue9 = bitwiseValue + 37u;
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float productValue16 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
    float multiplyAddValue65 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.x)));
    float multiplyAddValue66 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.y)));
    float multiplyAddValue67 = mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue8].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue8].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue8].y, vertexConstants[sumValue8].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.z, mad(mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue7].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue7].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue7].y, vertexConstants[sumValue7].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))), vertexPosition0.y, mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue6].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue6].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue6].y, vertexConstants[sumValue6].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z))) * vertexPosition0.x)) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexConstants[sumValue9].w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexConstants[sumValue9].z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexConstants[sumValue9].y, vertexConstants[sumValue9].x * RD_UNIFORM_MODEL_MATRICES_ROW_0.z)));
    float multiplyAddValue68 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue67, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue66, multiplyAddValue65 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue69 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue67, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue66, multiplyAddValue65 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue70 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue67, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue66, multiplyAddValue65 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue71 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue67, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue66, multiplyAddValue65 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue72 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue71, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue70, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue69, multiplyAddValue68 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue73 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue71, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue70, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue69, multiplyAddValue68 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue74 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue71, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue70, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue69, multiplyAddValue68 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue75 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue71, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue70, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue69, multiplyAddValue68 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue12 = uint(int(vertexColor0.w * 255.0f)) + 27u;
    clipSpacePosition.x = multiplyAddValue72;
    clipSpacePosition.y = multiplyAddValue73;
    clipSpacePosition.z = multiplyAddValue74;
    clipSpacePosition.w = multiplyAddValue75;
    varyingColor1.x = multiplyAddValue72;
    varyingColor1.y = multiplyAddValue73;
    varyingColor1.z = multiplyAddValue74;
    varyingColor1.w = multiplyAddValue75;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue74 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[productValue12].z * productValue) + vertexConstants[productValue12].x;
    varyingTexCoord2.y = (vertexConstants[productValue12].w * productValue1) + vertexConstants[productValue12].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
    varyingTexCoord3.x = multiplyAddValue65;
    varyingTexCoord3.y = multiplyAddValue66;
    varyingTexCoord3.z = multiplyAddValue67;
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
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON)
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float productValue16 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
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
    uint productValue5 = uint(int(vertexColor0.w * 255.0f));
    uint sumValue10 = productValue5 + 18u;
    uint sumValue11 = productValue5 + 11u;
    clipSpacePosition.x = multiplyAddValue34;
    clipSpacePosition.y = multiplyAddValue35;
    clipSpacePosition.z = multiplyAddValue36;
    clipSpacePosition.w = multiplyAddValue37;
    varyingColor1.x = multiplyAddValue34;
    varyingColor1.y = multiplyAddValue35;
    varyingColor1.z = multiplyAddValue36;
    varyingColor1.w = multiplyAddValue37;
    varyingColor0.x = vertexConstants[sumValue11].x;
    varyingColor0.y = vertexConstants[sumValue11].y;
    varyingColor0.z = vertexConstants[sumValue11].z;
    varyingColor0.w = (int(productValue5) > int(0u)) ? 0.0f : 1.0f;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((multiplyAddValue36 / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor3.x = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[sumValue10].z * productValue) + vertexConstants[sumValue10].x;
    varyingTexCoord2.y = (vertexConstants[sumValue10].w * productValue1) + vertexConstants[sumValue10].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
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
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (RD_UNIFORM_UV_ANIMATION.z * vertexTexCoord0.x) + RD_UNIFORM_UV_ANIMATION.x;
    float productValue1 = (RD_UNIFORM_UV_ANIMATION.w * vertexTexCoord0.y) + RD_UNIFORM_UV_ANIMATION.y;
    float productValue16 = (RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f) + 1.0f;
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
    uint productValue17 = uint(int(vertexColor0.w * 255.0f)) + 11u;
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
    varyingColor3.x = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.x;
    varyingColor3.y = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.y;
    varyingColor3.z = productValue16 * RD_UNIFORM_TILE_LIGHT_COLOR.z;
    varyingColor3.w = 1.0f;
    varyingTexCoord0.x = 0.0f;
    varyingTexCoord0.y = 0.0f;
    varyingTexCoord2.x = (vertexConstants[productValue17].z * productValue) + vertexConstants[productValue17].x;
    varyingTexCoord2.y = (vertexConstants[productValue17].w * productValue1) + vertexConstants[productValue17].y;
    varyingTexCoord2.z = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.z * productValue) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.x;
    varyingTexCoord2.w = (RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.w * productValue1) + RD_UNIFORM_BANNER_UV_OFFSETS_AND_SCALES_ROW_0.y;
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
#endif
