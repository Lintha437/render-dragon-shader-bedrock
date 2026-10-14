// SingleBlockPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
#endif


#include "../../include/materials/SingleBlockPrepass/VertexBindings.hlsli"

#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float4 vertexTangent0 : TANGENT0,
  float4 vertexTexCoord0 : TEXCOORD0,
  int vertexTexCoord4 : TEXCOORD4,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord5 : TEXCOORD5,
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
  int4 vertexTexCoord4 : TEXCOORD4,
  float4 vertexTexCoord7 : TEXCOORD7,
  float4 vertexTexCoord6 : TEXCOORD6,
  float4 vertexTexCoord5 : TEXCOORD5,
  out float4 clipSpacePosition : SV_POSITION0,
  out float3 varyingBitangent0 : BITANGENT0,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingColor0 : COLOR0,
  out int varyingFrontFacing0 : FRONTFACING0,
  out int varyingTexCoord4 : TEXCOORD4,
  out float3 varyingNormal0 : NORMAL0,
  out float3 varyingTexCoord5 : TEXCOORD5,
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
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = float3(0,0,0);
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
  workingVector1.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector1.y = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.z = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector1.w = dot(workingVector2.xyzw, workingVector0.xyzw);
  clipSpacePosition.xyzw = workingVector1.xyzw;
  varyingColor1.xyzw = workingVector1.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = float3(0,0,0);
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
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = vertexColor0.xyzw;
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = float3(0,0,0);
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
  workingVector1.x = dot(workingVector1.xyzw, workingVector0.xyzw);
  workingVector2.z = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y;
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y;
  workingVector1.y = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.z = dot(workingVector2.xyzw, workingVector0.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector1.w = dot(workingVector2.xyzw, workingVector0.xyzw);
  clipSpacePosition.xyzw = workingVector1.xyzw;
  varyingColor1.xyzw = workingVector1.xyzw;
  workingVector0.xyz = vertexTangent0.yzx * vertexNormal0.zxy;
  workingVector0.xyz = vertexNormal0.yzx * vertexTangent0.zxy + -workingVector0.xyz;
  workingVector0.xyz = vertexTangent0.www * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector0.xxx + workingVector1.xyz;
  varyingBitangent0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector0.zzz + workingVector0.xyw;
  varyingColor0.xyzw = float4(1,1,1,1);
  varyingTexCoord4.x = (int)vertexTexCoord4.x & 0x0000ffff;
  varyingFrontFacing0.x = 0;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  varyingNormal0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  varyingTexCoord5.xyz = float3(0,0,0);
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
    float multiplyAddValue7 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue6, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue8 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue9 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue10 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue5, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue4, multiplyAddValue3 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue7;
    clipSpacePosition.y = multiplyAddValue8;
    clipSpacePosition.z = multiplyAddValue9;
    clipSpacePosition.w = multiplyAddValue10;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor1.x = multiplyAddValue7;
    varyingColor1.y = multiplyAddValue8;
    varyingColor1.z = multiplyAddValue9;
    varyingColor1.w = multiplyAddValue10;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
    varyingTexCoord5.z = 0.0f;
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
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.x + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexPosition0.x));
    float multiplyAddValue12 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.y + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexPosition0.x));
    float multiplyAddValue13 = (RD_UNIFORM_MODEL_MATRICES_ROW_3.z + 0.5f) + mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexPosition0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexPosition0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexPosition0.x));
    float sumValue = multiplyAddValue11 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue1 = multiplyAddValue12 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue2 = multiplyAddValue13 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue5 = sumValue * inverseLengthValue;
    float productValue6 = sumValue2 * inverseLengthValue;
    float sumValue3 = (-0.0f) - productValue5;
    float inverseLengthValue1 = rsqrt(dot(float3(productValue6, 0.0f, sumValue3), float3(productValue6, 0.0f, sumValue3)));
    float productValue7 = inverseLengthValue1 * productValue6;
    float productValue8 = inverseLengthValue1 * sumValue3;
    float sumValue4 = vertexColor0.z + (-0.5f);
    float productValue9 = (inverseLengthValue * sumValue4) * sumValue1;
    float sumValue5 = vertexColor0.x + (-0.5f);
    float productValue10 = (multiplyAddValue11 - (productValue7 * sumValue5)) - (productValue8 * productValue9);
    float productValue11 = multiplyAddValue12 - (((productValue7 * productValue6) - (productValue8 * productValue5)) * sumValue4);
    float productValue12 = multiplyAddValue13 - ((productValue8 * sumValue5) - (productValue7 * productValue9));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue12, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue11, productValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue12, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue11, productValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue12, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue11, productValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue12, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue11, productValue10 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue18 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue17, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue19 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue20 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue21 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue17, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue16, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue15, multiplyAddValue14 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue18;
    clipSpacePosition.y = multiplyAddValue19;
    clipSpacePosition.z = multiplyAddValue20;
    clipSpacePosition.w = multiplyAddValue21;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor1.x = multiplyAddValue18;
    varyingColor1.y = multiplyAddValue19;
    varyingColor1.z = multiplyAddValue20;
    varyingColor1.w = multiplyAddValue21;
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
    varyingTexCoord5.z = 0.0f;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = productValue10;
    varyingTexCoord3.y = productValue11;
    varyingTexCoord3.z = productValue12;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
    executeVertexStage();
    VertexStageOutput stage_output;
    stage_output.clipSpacePosition = clipSpacePosition;
    stage_output.varyingBitangent0 = varyingBitangent0;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingFrontFacing0 = varyingFrontFacing0;
    stage_output.varyingNormal0 = varyingNormal0;
    stage_output.varyingTexCoord4 = varyingTexCoord4;
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue22 = mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue23 = mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue24 = mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue23, multiplyAddValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue29 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue28, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue26, multiplyAddValue25 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue30 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue28, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue26, multiplyAddValue25 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue31 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue28, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue26, multiplyAddValue25 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue32 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue28, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue27, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue26, multiplyAddValue25 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue29;
    clipSpacePosition.y = multiplyAddValue30;
    clipSpacePosition.z = multiplyAddValue31;
    clipSpacePosition.w = multiplyAddValue32;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor1.x = multiplyAddValue29;
    varyingColor1.y = multiplyAddValue30;
    varyingColor1.z = multiplyAddValue31;
    varyingColor1.w = multiplyAddValue32;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
    varyingTexCoord5.z = 0.0f;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = multiplyAddValue22;
    varyingTexCoord3.y = multiplyAddValue23;
    varyingTexCoord3.z = multiplyAddValue24;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
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
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue33 = (vertexTexCoord7.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord7.z, mad(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x));
    float multiplyAddValue34 = (vertexTexCoord6.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord6.z, mad(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x));
    float multiplyAddValue35 = (vertexTexCoord5.w + 0.5f) + mad(vertexPosition0.z, vertexTexCoord5.z, mad(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x));
    float sumValue6 = multiplyAddValue33 - RD_UNIFORM_VIEW_POSITION_AND_TIME.x;
    float sumValue7 = multiplyAddValue34 - RD_UNIFORM_VIEW_POSITION_AND_TIME.y;
    float sumValue8 = multiplyAddValue35 - RD_UNIFORM_VIEW_POSITION_AND_TIME.z;
    float inverseLengthValue2 = rsqrt(dot(float3(sumValue6, sumValue7, sumValue8), float3(sumValue6, sumValue7, sumValue8)));
    float productValue13 = sumValue6 * inverseLengthValue2;
    float productValue14 = sumValue8 * inverseLengthValue2;
    float sumValue9 = (-0.0f) - productValue13;
    float inverseLengthValue3 = rsqrt(dot(float3(productValue14, 0.0f, sumValue9), float3(productValue14, 0.0f, sumValue9)));
    float productValue15 = inverseLengthValue3 * productValue14;
    float productValue16 = inverseLengthValue3 * sumValue9;
    float sumValue4 = vertexColor0.z + (-0.5f);
    float productValue17 = (inverseLengthValue2 * sumValue4) * sumValue7;
    float sumValue5 = vertexColor0.x + (-0.5f);
    float productValue18 = (multiplyAddValue33 - (productValue15 * sumValue5)) - (productValue16 * productValue17);
    float productValue19 = multiplyAddValue34 - (((productValue15 * productValue14) - (productValue16 * productValue13)) * sumValue4);
    float productValue20 = multiplyAddValue35 - ((productValue16 * sumValue5) - (productValue15 * productValue17));
    float multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue19, productValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue19, productValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue38 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue19, productValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, productValue20, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, productValue19, productValue18 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue40 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue39, mad(RD_UNIFORM_SUB_PIXEL_OFFSET.x + RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue38, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x)));
    float multiplyAddValue41 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue39, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y, multiplyAddValue38, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y)));
    float multiplyAddValue42 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue39, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue38, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z)));
    float multiplyAddValue43 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue39, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue38, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue37, multiplyAddValue36 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    uint productValue = uint(round(vertexTexCoord0.x * 65535.0f));
    uint productValue1 = uint(round(vertexTexCoord0.y * 65535.0f));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    clipSpacePosition.x = multiplyAddValue40;
    clipSpacePosition.y = multiplyAddValue41;
    clipSpacePosition.z = multiplyAddValue42;
    clipSpacePosition.w = multiplyAddValue43;
    varyingBitangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * productValue2));
    varyingBitangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * productValue2));
    varyingBitangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue4, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue3, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * productValue2));
    varyingColor1.x = multiplyAddValue40;
    varyingColor1.y = multiplyAddValue41;
    varyingColor1.z = multiplyAddValue42;
    varyingColor1.w = multiplyAddValue43;
    varyingColor0.x = 1.0f;
    varyingColor0.y = 1.0f;
    varyingColor0.z = 1.0f;
    varyingColor0.w = 1.0f;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x));
    varyingNormal0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x));
    varyingNormal0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTexCoord5.x = 0.0f;
    varyingTexCoord5.y = 0.0f;
    varyingTexCoord5.z = 0.0f;
    varyingTangent0.x = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexTangent0.x));
    varyingTangent0.y = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexTangent0.x));
    varyingTangent0.z = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexTangent0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexTangent0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
    varyingTexCoord3.x = productValue18;
    varyingTexCoord3.y = productValue19;
    varyingTexCoord3.z = productValue20;
}
VertexStageOutput main(VertexStageInput stage_input)
{
    vertexColor0 = stage_input.vertexColor0;
    vertexNormal0 = stage_input.vertexNormal0;
    vertexPosition0 = stage_input.vertexPosition0;
    vertexTangent0 = stage_input.vertexTangent0;
    vertexTexCoord0 = stage_input.vertexTexCoord0;
    vertexTexCoord4 = stage_input.vertexTexCoord4;
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
    stage_output.varyingTexCoord5 = varyingTexCoord5;
    stage_output.varyingTangent0 = varyingTangent0;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
