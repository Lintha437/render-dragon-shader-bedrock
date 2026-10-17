// SingleBlock / AlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/SingleBlock/VertexBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 vertexColor0 : COLOR0,
  float4 vertexNormal0 : NORMAL0,
  float3 vertexPosition0 : POSITION0,
  float2 vertexTexCoord0 : TEXCOORD0,
  out float4 clipSpacePosition : SV_POSITION0,
  out float4 varyingColor3 : COLOR3,
  out float4 varyingColor0 : COLOR0,
  out float4 varyingColor2 : COLOR2,
  out float4 varyingColor1 : COLOR1,
  out float4 varyingTexCoord0 : TEXCOORD0,
  out float3 varyingTexCoord3 : TEXCOORD3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeVertexStage()
#endif
{
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.x = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector0.z = RD_UNIFORM_Z_SHIFT_VALUE.x + workingVector1.x;
  varyingColor3.z = workingVector1.x;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor3.xyw = workingVector0.xyw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingColor1.xyzw = float4(0,0,0,0);
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  workingVector0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.x = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector0.z = RD_UNIFORM_Z_SHIFT_VALUE.x + workingVector1.x;
  varyingColor3.z = workingVector1.x;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor3.xyw = workingVector0.xyw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexNormal0.www + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.y = workingVector0.y * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xz = workingVector0.xz * workingVector0.xz;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.y * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.z * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  workingVector0.w = 1;
  varyingColor1.xyzw = RD_UNIFORM_OVERLAY_COLOR.wwww * float4(0.349999994,0.349999994,0.349999994,0.349999994) + workingVector0.xyzw;
  workingVector0.xy = float2(65535,65535) * vertexTexCoord0.xy;
  workingVector0.xy = round(workingVector0.xy);
  workingVector0.xy = (uint2)workingVector0.xy;
  workingVector0.zw = (uint2)workingVector0.xy >> 15;
  workingVector0.xy = (uint2)workingVector0.xy << 1;
  workingVector0.xyzw = (int4)workingVector0.xyzw & int4(0xfffe,0xfffe,1,1);
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  workingVector0.zw = workingVector0.zw * float2(2,2) + float2(-1,-1);
  workingVector0.zw = float2(3.05175781e-005,3.05175781e-005) * workingVector0.zw;
  workingVector0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.x = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector0.z = RD_UNIFORM_Z_SHIFT_VALUE.x + workingVector1.x;
  varyingColor3.z = workingVector1.x;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor3.xyw = workingVector0.xyw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  varyingColor1.xyzw = float4(0,0,0,0);
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
  workingVector0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w;
  workingVector0.w = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector2.x = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z;
  workingVector2.w = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z;
  workingVector1.x = dot(workingVector2.xyzw, workingVector1.xyzw);
  workingVector0.z = RD_UNIFORM_Z_SHIFT_VALUE.x + workingVector1.x;
  varyingColor3.z = workingVector1.x;
  clipSpacePosition.xyzw = workingVector0.xyzw;
  varyingColor3.xyw = workingVector0.xyw;
  workingVector0.x = workingVector0.z / RD_UNIFORM_FOG_CONTROL.z;
  workingVector0.x = -RD_UNIFORM_FOG_CONTROL.x + workingVector0.x;
  varyingColor0.xyzw = vertexColor0.xyzw;
  workingVector0.y = RD_UNIFORM_FOG_CONTROL.y + -RD_UNIFORM_FOG_CONTROL.x;
  varyingColor2.w = saturate(workingVector0.x / workingVector0.y);
  varyingColor2.xyz = RD_UNIFORM_FOG_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * vertexNormal0.yyy;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * vertexNormal0.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * vertexNormal0.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyz * vertexNormal0.www + workingVector0.xyz;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.y = workingVector0.y * RD_UNIFORM_TILE_LIGHT_COLOR.w + 1;
  workingVector0.xz = workingVector0.xz * workingVector0.xz;
  workingVector0.x = -0.100000001 * workingVector0.x;
  workingVector0.x = workingVector0.y * 0.275000006 + workingVector0.x;
  workingVector0.x = workingVector0.z * 0.100000001 + workingVector0.x;
  workingVector0.x = 0.449999988 + workingVector0.x;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xxx;
  workingVector0.w = 1;
  varyingColor1.xyzw = RD_UNIFORM_OVERLAY_COLOR.wwww * float4(0.349999994,0.349999994,0.349999994,0.349999994) + workingVector0.xyzw;
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
  workingVector0.xy = workingVector0.xy * float2(1.52590219e-005,1.52590219e-005) + workingVector0.zw;
  varyingTexCoord0.xy = workingVector0.xy * RD_UNIFORM_UV_ANIMATION.zw + RD_UNIFORM_UV_ANIMATION.xy;
  return;
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
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
    float sumValue = RD_UNIFORM_Z_SHIFT_VALUE.x + multiplyAddValue9;
    clipSpacePosition.x = multiplyAddValue7;
    clipSpacePosition.y = multiplyAddValue8;
    clipSpacePosition.z = sumValue;
    clipSpacePosition.w = multiplyAddValue10;
    varyingColor3.x = multiplyAddValue7;
    varyingColor3.y = multiplyAddValue8;
    varyingColor3.z = multiplyAddValue9;
    varyingColor3.w = multiplyAddValue10;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((sumValue / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor1.x = 0.0f;
    varyingColor1.y = 0.0f;
    varyingColor1.z = 0.0f;
    varyingColor1.w = 0.0f;
    varyingTexCoord0.x = ((((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f)) * RD_UNIFORM_UV_ANIMATION.z) + RD_UNIFORM_UV_ANIMATION.x;
    varyingTexCoord0.y = ((((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f)) * RD_UNIFORM_UV_ANIMATION.w) + RD_UNIFORM_UV_ANIMATION.y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
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
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
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
    float sumValue = RD_UNIFORM_Z_SHIFT_VALUE.x + multiplyAddValue9;
    float multiplyAddValue11 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.x, vertexNormal0.w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * vertexNormal0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.y, vertexNormal0.w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * vertexNormal0.x)));
    float multiplyAddValue13 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_3.z, vertexNormal0.w, mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, vertexNormal0.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, vertexNormal0.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * vertexNormal0.x)));
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float productValue3 = inverseLengthValue * multiplyAddValue13;
    float productValue4 = ((0.449999988079071044921875f - ((productValue2 * productValue2) * 0.100000001490116119384765625f)) + ((productValue3 * productValue3) * 0.100000001490116119384765625f)) + ((((inverseLengthValue * multiplyAddValue12) * RD_UNIFORM_TILE_LIGHT_COLOR.w) + 1.0f) * 0.2750000059604644775390625f);
    float productValue5 = RD_UNIFORM_OVERLAY_COLOR.w * 0.3499999940395355224609375f;
    clipSpacePosition.x = multiplyAddValue7;
    clipSpacePosition.y = multiplyAddValue8;
    clipSpacePosition.z = sumValue;
    clipSpacePosition.w = multiplyAddValue10;
    varyingColor3.x = multiplyAddValue7;
    varyingColor3.y = multiplyAddValue8;
    varyingColor3.z = multiplyAddValue9;
    varyingColor3.w = multiplyAddValue10;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingColor2.x = RD_UNIFORM_FOG_COLOR.x;
    varyingColor2.y = RD_UNIFORM_FOG_COLOR.y;
    varyingColor2.z = RD_UNIFORM_FOG_COLOR.z;
    varyingColor2.w = clamp(((sumValue / RD_UNIFORM_FOG_CONTROL.z) - RD_UNIFORM_FOG_CONTROL.x) / (RD_UNIFORM_FOG_CONTROL.y - RD_UNIFORM_FOG_CONTROL.x), 0.0f, 1.0f);
    varyingColor1.x = (productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.x) + productValue5;
    varyingColor1.y = (productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.y) + productValue5;
    varyingColor1.z = (productValue4 * RD_UNIFORM_TILE_LIGHT_COLOR.z) + productValue5;
    varyingColor1.w = productValue5 + 1.0f;
    varyingTexCoord0.x = ((((float((productValue >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05f)) * RD_UNIFORM_UV_ANIMATION.z) + RD_UNIFORM_UV_ANIMATION.x;
    varyingTexCoord0.y = ((((float((productValue1 >> 15u) & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05f)) * RD_UNIFORM_UV_ANIMATION.w) + RD_UNIFORM_UV_ANIMATION.y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
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
    stage_output.varyingColor3 = varyingColor3;
    stage_output.varyingColor0 = varyingColor0;
    stage_output.varyingColor2 = varyingColor2;
    stage_output.varyingColor1 = varyingColor1;
    stage_output.varyingTexCoord0 = varyingTexCoord0;
    stage_output.varyingTexCoord3 = varyingTexCoord3;
    return stage_output;
#endif
}
