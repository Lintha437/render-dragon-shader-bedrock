// RenderChunkPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
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
#define RD_BINDING_LAYOUT 9
#endif


#include "../../include/materials/RenderChunkPrepass/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord1 : TEXCOORD1,
  int vertexTexCoord4 : TEXCOORD4,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  float4 vertexTexCoord1 : TEXCOORD1,
  int4 vertexTexCoord4 : TEXCOORD4,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor0 : COLOR0,
  out float2 varyingTexCoord2 : TEXCOORD2,
  out float2 varyingTexCoord1 : TEXCOORD1,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float3 varyingTexCoord5 : TEXCOORD5,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTangent0 : TANGENT0,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexPosition0.yyy;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexPosition0.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexPosition0.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz + workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
  varyingTexCoord3.xyz = workingVector1.xyz;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector2.xyzw;
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
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
  workingVector0.xyz = float3(0.5,0.5,0.5) + workingVector0.xyz;
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
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector1.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  clipSpacePosition.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = float4(1,1,1,1);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
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
  clipSpacePosition.x = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector0.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector0.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector0.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector0.xyzw, workingVector1.xyzw);
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
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
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector1.xyzw;
  varyingTexCoord3.xyz = workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector1.xyzw;
  workingVector1.z = RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x;
  clipSpacePosition.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  clipSpacePosition.y = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  clipSpacePosition.z = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector1.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector1.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector1.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector1.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  clipSpacePosition.w = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = float4(1,1,1,1);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord1.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector1.w = workingVector0.y;
  workingVector1.xyz = (uint3)workingVector0.xyy >> int3(8,8,4);
  workingVector0.zw = (int2)workingVector1.zw & int2(15,15);
  workingVector1.xy = (int2)workingVector1.xy & int2(254,254);
  workingVector1.xz = (uint2)workingVector1.xy;
  workingVector0.zw = (uint2)workingVector0.zw;
  varyingTexCoord1.xy = float2(0.0666666701,0.0666666701) * workingVector0.zw;
  if (1 == 0) workingVector0.y = 0; else if (1+8 < 32) {   workingVector0.y = (uint)workingVector0.x << (32-(1 + 8)); workingVector0.y = (uint)workingVector0.y >> (32-1);  } else workingVector0.y = (uint)workingVector0.x >> 8;
  if (1 == 0) workingVector0.z = 0; else if (1+8 < 32) {   workingVector0.z = (uint)workingVector0.y << (32-(1 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-1);  } else workingVector0.z = (uint)workingVector0.y >> 8;
  workingVector0.x = (int)workingVector0.x & 255;
  workingVector1.y = (uint)workingVector0.x;
  workingVector1.xyz = float3(0.00392156886,0.00392156886,0.00392156886) * workingVector1.xyz;
  varyingTexCoord2.xy = workingVector0.yz ? float2(1,1) : float2(0,0);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.x = vertexNormal0.w * 0.5 + 0.5;
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  varyingTexCoord5.xyz = float3(6,6,6) * workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexTangent0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexTangent0.xxx + workingVector0.xyz;
  varyingTangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexTangent0.zzz + workingVector0.xyz;
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
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.x + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x));
    float multiplyAddValue8 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.y + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x));
    float multiplyAddValue9 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.z + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x));
    float sumValue = multiplyAddValue7 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue1 = multiplyAddValue8 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue2 = multiplyAddValue9 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue8 = sumValue * inverseLengthValue;
    float productValue9 = sumValue2 * inverseLengthValue;
    float sumValue3 = (-0.0f) - productValue8;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue9, 0.0f, sumValue3), float3(productValue9, 0.0f, sumValue3)));
    float productValue10 = inverseLengthValue1 * productValue9;
    float productValue11 = inverseLengthValue1 * sumValue3;
    float sumValue4 = vertexColor0.z + (-0.5f);
    float productValue12 = (inverseLengthValue * sumValue4) * sumValue1;
    float sumValue5 = vertexColor0.x + (-0.5f);
    float productValue13 = (multiplyAddValue7 - (productValue10 * sumValue5)) - (productValue11 * productValue12);
    float productValue14 = multiplyAddValue8 - (((productValue10 * productValue9) - (productValue11 * productValue8)) * sumValue4);
    float productValue15 = multiplyAddValue9 - ((productValue11 * sumValue5) - (productValue10 * productValue12));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue14, productValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue14, productValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue14, productValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue15, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue14, productValue13 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue13, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue12, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue11, multiplyAddValue10 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = productValue13;
    varyingTexCoord3.y = productValue14;
    varyingTexCoord3.z = productValue15;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue14 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue15 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue16 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue20, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue18, multiplyAddValue17 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue18, multiplyAddValue17 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue18, multiplyAddValue17 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue20, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue19, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue18, multiplyAddValue17 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue21 = (vertexTexCoord7.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x));
    float multiplyAddValue22 = (vertexTexCoord6.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x));
    float multiplyAddValue23 = (vertexTexCoord5.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x));
    float sumValue6 = multiplyAddValue21 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue7 = multiplyAddValue22 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue8 = multiplyAddValue23 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue2 = rsqrt(dot(float3(sumValue6, sumValue7, sumValue8), float3(sumValue6, sumValue7, sumValue8)));
    float productValue16 = sumValue6 * inverseLengthValue2;
    float productValue17 = sumValue8 * inverseLengthValue2;
    float sumValue9 = (-0.0f) - productValue16;
    float inverseLengthValue3 = rsqrt(dot(float3(productValue17, 0.0f, sumValue9), float3(productValue17, 0.0f, sumValue9)));
    float productValue18 = inverseLengthValue3 * productValue17;
    float productValue19 = inverseLengthValue3 * sumValue9;
    float sumValue4 = vertexColor0.z + (-0.5f);
    float productValue20 = (inverseLengthValue2 * sumValue4) * sumValue7;
    float sumValue5 = vertexColor0.x + (-0.5f);
    float productValue21 = (multiplyAddValue21 - (productValue18 * sumValue5)) - (productValue19 * productValue20);
    float productValue22 = multiplyAddValue22 - (((productValue18 * productValue17) - (productValue19 * productValue16)) * sumValue4);
    float productValue23 = multiplyAddValue23 - ((productValue19 * sumValue5) - (productValue18 * productValue20));
    float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue22, productValue21 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue22, productValue21 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue22, productValue21 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue23, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue22, productValue21 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(round(vertexTexCoord1.x * 65535.0f));
    uint productValue6 = uint(round(vertexTexCoord1.y * 65535.0f));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125f) + 0.01176470704376697540283203125f;
    clipSpacePosition.x = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue27, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue26, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue25, multiplyAddValue24 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    clipSpacePosition.y = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue26, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue25, multiplyAddValue24 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    clipSpacePosition.z = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue26, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue25, multiplyAddValue24 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    clipSpacePosition.w = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue26, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue25, multiplyAddValue24 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125f;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125f;
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = productValue21;
    varyingTexCoord3.y = productValue22;
    varyingTexCoord3.z = productValue23;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord1 = stage_input.vertexTexCoord1;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    vertexTexCoord7 = stage_input.vertexTexCoord7;
    vertexTexCoord6 = stage_input.vertexTexCoord6;
    vertexTexCoord5 = stage_input.vertexTexCoord5;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingTexCoord2 = varyingTexCoord2;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTexCoord1 = varyingTexCoord1;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
