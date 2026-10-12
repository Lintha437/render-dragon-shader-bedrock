// RenderChunkPrepass / DepthOnlyAlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/RenderChunkPrepass/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
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
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(0,0,0,0);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(0.5,0.5,0.5) + workingVector0.xyz;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.zxy + workingVector1.zxy;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector2.xyz = float3(0,0,1) * workingVector0.zxy;
  workingVector2.xyz = workingVector0.xyz * float3(1,0,0) + -workingVector2.xyz;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector0.xyz;
  workingVector0.xyz = workingVector0.zxy * workingVector2.zxy + -workingVector3.xyz;
  workingVector3.xy = float2(-0.5,-0.5) + vertexColor0.zx;
  workingVector2.xyz = workingVector3.yyy * workingVector2.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector3.xxx + workingVector2.xyz;
  workingVector0.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(0,0,0,0);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = vertexPosition0.xyz;
  workingVector0.w = 1;
  workingVector1.x = dot(workingVector0.xyzw, vertexTexCoord7.xyzw);
  workingVector1.y = dot(workingVector0.xyzw, vertexTexCoord6.xyzw);
  workingVector1.z = dot(workingVector0.xyzw, vertexTexCoord5.xyzw);
  workingVector0.xyz = float3(0.5,0.5,0.5) + workingVector1.xyz;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector1.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.zxy + workingVector0.zxy;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector2.xyz = float3(0,0,1) * workingVector1.zxy;
  workingVector2.xyz = workingVector1.xyz * float3(1,0,0) + -workingVector2.xyz;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector1.xyz;
  workingVector1.xyz = workingVector1.zxy * workingVector2.zxy + -workingVector3.xyz;
  workingVector3.xy = float2(-0.5,-0.5) + vertexColor0.zx;
  workingVector2.xyz = workingVector3.yyy * workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * workingVector3.xxx + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(0,0,0,0);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(0.5,0.5,0.5) + workingVector0.xyz;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.zxy + workingVector1.zxy;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector2.xyz = float3(0,0,1) * workingVector0.zxy;
  workingVector2.xyz = workingVector0.xyz * float3(1,0,0) + -workingVector2.xyz;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector0.xyz;
  workingVector0.xyz = workingVector0.zxy * workingVector2.zxy + -workingVector3.xyz;
  workingVector3.xy = float2(-0.5,-0.5) + vertexColor0.zx;
  workingVector2.xyz = workingVector3.yyy * workingVector2.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector3.xxx + workingVector2.xyz;
  workingVector0.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(0,0,0,0);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = vertexPosition0.xyz;
  workingVector0.w = 1;
  workingVector1.x = dot(workingVector0.xyzw, vertexTexCoord7.xyzw);
  workingVector1.y = dot(workingVector0.xyzw, vertexTexCoord6.xyzw);
  workingVector1.z = dot(workingVector0.xyzw, vertexTexCoord5.xyzw);
  workingVector0.xyz = float3(0.5,0.5,0.5) + workingVector1.xyz;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector1.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.zxy + workingVector0.zxy;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector2.xyz = float3(0,0,1) * workingVector1.zxy;
  workingVector2.xyz = workingVector1.xyz * float3(1,0,0) + -workingVector2.xyz;
  workingVector0.w = dot(workingVector2.xz, workingVector2.xz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = workingVector2.xyz * workingVector0.www;
  workingVector3.xyz = workingVector2.yzx * workingVector1.xyz;
  workingVector1.xyz = workingVector1.zxy * workingVector2.zxy + -workingVector3.xyz;
  workingVector3.xy = float2(-0.5,-0.5) + vertexColor0.zx;
  workingVector2.xyz = workingVector3.yyy * workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * workingVector3.xxx + workingVector2.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  clipSpacePosition.xyzw = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyzw + workingVector0.xyzw;
  varyingBitangent0.xyz = float3(0,0,0);
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingNormal0.xyz = float3(0,0,0);
  varyingTangent0.xyz = float3(0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  if (1 == 0) workingVector0.z = 0; else if (1+15 < 32) {   workingVector0.z = (uint)workingVector0.x << (32-(1 + 15)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.x >> 15;
  if (1 == 0) workingVector0.w = 0; else if (1+15 < 32) {   workingVector0.w = (uint)workingVector0.y << (32-(1 + 15)); workingVector0.w = (uint)workingVector0.w >> (32-1);  } else workingVector0.w = (uint)workingVector0.y >> 15;
  bitMask.x = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
  bitMask.y = ((~(-1 << 15)) << 1) & 0xffffffff;  workingVector0.y = (((uint)workingVector0.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  return;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float sumValue = multiplyAddValue + 0.5f;
    float sumValue1 = multiplyAddValue1 + 0.5f;
    float sumValue2 = multiplyAddValue2 + 0.5f;
    float sumValue3 = sumValue - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue4 = sumValue1 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue5 = sumValue2 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue3, sumValue4, sumValue5), float3(sumValue3, sumValue4, sumValue5)));
    float productValue2 = sumValue3 * inverseLengthValue;
    float productValue3 = sumValue5 * inverseLengthValue;
    float sumValue6 = (-0.0f) - productValue2;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue3, 0.0f, sumValue6), float3(productValue3, 0.0f, sumValue6)));
    float productValue4 = inverseLengthValue1 * productValue3;
    float productValue5 = inverseLengthValue1 * sumValue6;
    float sumValue7 = vertexColor0.z + (-0.5f);
    float productValue6 = (inverseLengthValue * sumValue7) * sumValue4;
    float sumValue8 = vertexColor0.x + (-0.5f);
    float productValue7 = (sumValue - (productValue4 * sumValue8)) - (productValue5 * productValue6);
    float productValue8 = sumValue1 - (((productValue4 * productValue3) - (productValue5 * productValue2)) * sumValue7);
    float productValue9 = sumValue2 - ((productValue5 * sumValue8) - (productValue4 * productValue6));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue8, productValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue8, productValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue8, productValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue9, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue8, productValue7 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue3 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue4 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue5 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = 0.0f;
    varyingColor0.y = 0.0f;
    varyingColor0.z = 0.0f;
    varyingColor0.w = 0.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
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
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue3 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue4 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue5 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue9 = multiplyAddValue3 + 0.5f;
    float sumValue10 = multiplyAddValue4 + 0.5f;
    float sumValue11 = multiplyAddValue5 + 0.5f;
    float sumValue12 = sumValue9 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue13 = sumValue10 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue14 = sumValue11 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue2 = rsqrt(dot(float3(sumValue12, sumValue13, sumValue14), float3(sumValue12, sumValue13, sumValue14)));
    float productValue10 = sumValue12 * inverseLengthValue2;
    float productValue11 = sumValue14 * inverseLengthValue2;
    float sumValue15 = (-0.0f) - productValue10;
    float inverseLengthValue3 = rsqrt(dot(float3(productValue11, 0.0f, sumValue15), float3(productValue11, 0.0f, sumValue15)));
    float productValue12 = inverseLengthValue3 * productValue11;
    float productValue13 = inverseLengthValue3 * sumValue15;
    float sumValue7 = vertexColor0.z + (-0.5f);
    float productValue14 = (inverseLengthValue2 * sumValue7) * sumValue13;
    float sumValue8 = vertexColor0.x + (-0.5f);
    float productValue15 = (sumValue9 - (productValue12 * sumValue8)) - (productValue13 * productValue14);
    float productValue16 = sumValue10 - (((productValue12 * productValue11) - (productValue13 * productValue10)) * sumValue7);
    float productValue17 = sumValue11 - ((productValue13 * sumValue8) - (productValue12 * productValue14));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    clipSpacePosition.x = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, productValue17, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, productValue16, productValue15 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x;
    clipSpacePosition.y = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, productValue17, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, productValue16, productValue15 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y;
    clipSpacePosition.z = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.z, productValue17, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.z, productValue16, productValue15 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.z;
    clipSpacePosition.w = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, productValue17, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, productValue16, productValue15 * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    varyingBitangent0.x = 0.0f;
    varyingBitangent0.y = 0.0f;
    varyingBitangent0.z = 0.0f;
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingNormal0.x = 0.0f;
    varyingNormal0.y = 0.0f;
    varyingNormal0.z = 0.0f;
    varyingTangent0.x = 0.0f;
    varyingTangent0.y = 0.0f;
    varyingTangent0.z = 0.0f;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
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
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
