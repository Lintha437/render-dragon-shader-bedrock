// ItemInHandForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ItemInHandForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord8 : TEXCOORD8,
  float3 varyingNormal0 : NORMAL0,
  int4 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000},
                              { -1, 0, 0, 1},
                              { 2, 0, 0, 1},
                              { 3, 0, 1, 0},
                              { -1, 0, 1, 0},
                              { 0, 1, 0, 0},
                              { 6, 1, 0, 0},
                              { 7, 0, 1, 0},
                              { -1, 1, 0, 0},
                              { 1, 0, 1, 1},
                              { 10, 1, 0, 1},
                              { 11, 0, 1, 1},
                              { -1, 0, 1, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 1, 0},
                              { -1, 1, 1, 0},
                              { 4, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 21, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0} };
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25,workingVector26,workingVector27,workingVector28,workingVector29,workingVector30,workingVector31,workingVector32;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xy + float2(1,1);
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz * workingVector1.www;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.x = dot(-workingVector1.xyz, workingVector2.xyz);
  workingVector1.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.x;
  workingVector1.y = 1 / workingVector1.y;
  workingVector1.x = saturate(workingVector1.x * workingVector1.y);
  workingVector1.y = workingVector1.x * -2 + 3;
  workingVector1.x = workingVector1.x * workingVector1.x;
  workingVector1.x = workingVector1.y * workingVector1.x;
  workingVector1.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector1.yz = workingVector1.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.yz;
  workingVector1.yz = workingVector1.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.yz;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.yzyz;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector1.w = workingVector3.x * 0.25 + workingVector3.y;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = 0.75 * workingVector1.z;
  workingVector1.y = workingVector1.y * 0.5 + workingVector1.z;
  workingVector1.y = frac(workingVector1.y);
  workingVector1.y = workingVector1.w * 0.25 + workingVector1.y;
  workingVector1.y = workingVector1.y * 64 + 0.5;
  workingVector1.y = 0.015625 * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.y >= workingVector1.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  fragmentColor0.w = workingVector0.w ? 0 : 1;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector4.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector4.xyz;
  workingVector4.xyz = log2(workingVector4.xyz);
  workingVector4.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector4.xyz;
  workingVector4.xyz = exp2(workingVector4.xyz);
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector3.xyz : workingVector4.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector1.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector1.xyzw;
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector3.xyzw;
  workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector1.wwww + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
  workingVector3.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector1.wwww + workingVector3.xyzw;
  workingVector3.xyz = workingVector3.xyz / workingVector3.www;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector4.yyy;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector4.xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector4.zzz + workingVector5.xyz;
  workingVector6.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector7.xyz = ddx_coarse(workingVector1.zxy);
  workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector7.xyz = workingVector7.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector8.xyz = -workingVector1.yzx;
  workingVector8.xyz = ddy_coarse(workingVector8.xyz);
  workingVector1.w = dot(workingVector8.xyz, workingVector8.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector8.xyz = -workingVector1.xyz;
  workingVector9.xyz = ddy_coarse(workingVector8.yzx);
  workingVector1.w = dot(workingVector9.xyz, workingVector9.xyz);
#endif
  workingVector1.w = rsqrt(workingVector1.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector8.xyz = workingVector8.xyz * workingVector1.www;
  workingVector9.xyz = workingVector8.xyz * workingVector7.xyz;
  workingVector7.xyz = workingVector7.zxy * workingVector8.yzx + -workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector9.xyz = workingVector9.xyz * workingVector1.www;
  workingVector10.xyz = workingVector9.xyz * workingVector7.xyz;
  workingVector7.xyz = workingVector7.zxy * workingVector9.yzx + -workingVector10.xyz;
#endif
  workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector7.xyz = workingVector7.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector7.yyy;
  workingVector7.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector7.xxx + workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector7.yyy;
  workingVector7.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector7.xxx + workingVector9.xyz;
#endif
  workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector7.zzz + workingVector7.xyw;
  workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector7.xyz = workingVector7.xyz * workingVector1.www;
  workingVector7.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector7.xyz = round(workingVector7.xyz);
  workingVector7.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector7.xyz;
  workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector7.xyz = workingVector7.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector8.xyz = workingVector6.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector8.xyz = floor(workingVector8.xyz);
  workingVector8.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector8.xyz + workingVector6.xyz;
  workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector8.xyz;
  workingVector1.w = dot(workingVector8.xyz, workingVector7.xyz);
  workingVector7.xyz = -workingVector1.www * workingVector7.xyz + workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector9.xyz = workingVector6.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector9.xyz = floor(workingVector9.xyz);
  workingVector9.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector9.xyz + workingVector6.xyz;
  workingVector9.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector9.xyz;
  workingVector1.w = dot(workingVector9.xyz, workingVector7.xyz);
  workingVector7.xyz = -workingVector1.www * workingVector7.xyz + workingVector9.xyz;
#endif
  workingVector7.xyz = workingVector7.xyz + workingVector6.xyz;
  workingVector7.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector7.xyz;
  workingVector1.w = 1 + -varyingTexCoord8.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector8.xyz = varyingTexCoord8.xxx * workingVector0.xyz;
  workingVector8.xyz = workingVector1.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector9.xyz = varyingTexCoord8.xxx * workingVector0.xyz;
  workingVector9.xyz = workingVector1.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector9.xyz;
#endif
  workingVector2.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector2.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector2.w;
  workingVector2.w = RD_COMPARISON_MASK(workingVector2.w < 9.99999975e-005);
  workingVector3.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector2.w = workingVector2.w ? workingVector3.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector3.w = workingVector9.x * 0.600000024 + 0.400000006;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector3.w = workingVector10.x * 0.600000024 + 0.400000006;
#endif
  workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.y = workingVector9.x * workingVector3.w;
  workingVector3.w = workingVector9.x * workingVector9.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.y = workingVector10.x * workingVector3.w;
  workingVector3.w = workingVector10.x * workingVector10.x;
#endif
  workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.z = workingVector9.x * workingVector3.w;
  workingVector9.xyz = min(float3(1,1,1), workingVector9.xyz);
  workingVector9.xyz = workingVector2.www ? workingVector9.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector10.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector2.w = workingVector10.y ? workingVector10.x : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.z = workingVector10.x * workingVector3.w;
  workingVector10.xyz = min(float3(1,1,1), workingVector10.xyz);
  workingVector10.xyz = workingVector2.www ? workingVector10.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector11.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector2.w = workingVector11.y ? workingVector11.x : 0;
#endif
  if (workingVector2.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector10.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector10.xy;
    workingVector10.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector2.w = materialTexture3.Sample(textureSampler3, workingVector10.xyz).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector11.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector11.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector11.xy;
    workingVector11.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector2.w = materialTexture3.Sample(textureSampler3, workingVector11.xyz).x;
#endif
    workingVector2.w = workingVector2.w + workingVector2.w;
    workingVector3.w = saturate(workingVector4.y);
    workingVector2.w = workingVector3.w * workingVector2.w;
    workingVector2.w = log2(workingVector2.w);
    workingVector2.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector2.w;
    workingVector2.w = exp2(workingVector2.w);
    workingVector3.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector2.w = workingVector3.w * workingVector2.w;
  } else {
    workingVector2.w = 1;
  }
  workingVector3.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector3.w = sqrt(workingVector3.w);
  workingVector4.w = RD_COMPARISON_MASK(workingVector3.z != 1.000000);
  if (workingVector4.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector5.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector4.w = workingVector4.w ? workingVector5.w : 0;
    if (workingVector4.w == 0) {
      workingVector4.w = 9.99999975e-005 + workingVector3.w;
      workingVector10.xyz = workingVector1.xyz / workingVector4.www;
      workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * varyingTexCoord8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector4.w = 9.99999975e-005 + workingVector3.w;
    workingVector11.xyz = workingVector1.xyz / workingVector4.www;
    workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * varyingTexCoord8.w;
    workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
    workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
    workingVector12.xyz = workingVector5.www ? workingVector7.xyz : varyingTexCoord3.xyz;
    workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector6.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector5.w = workingVector5.w ? workingVector6.w : 0;
    if (workingVector5.w == 0) {
#endif
      workingVector5.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 1);
      if (workingVector5.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
        workingVector11.xyz = workingVector5.www ? workingVector7.xyz : varyingTexCoord3.xyz;
        workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector12.xyz;
        workingVector5.w = dot(workingVector12.xyz, workingVector12.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector13.xyz;
        workingVector5.w = dot(workingVector13.xyz, workingVector13.xyz);
#endif
        workingVector5.w = rsqrt(workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = workingVector12.xyz * workingVector5.www;
        workingVector5.w = dot(workingVector5.xyz, workingVector12.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = workingVector13.xyz * workingVector5.www;
        workingVector5.w = dot(workingVector5.xyz, workingVector13.xyz);
#endif
        workingVector5.w = max(0, workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector4.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector4.xyz;
#endif
        workingVector6.w = 1 + -workingVector5.w;
        workingVector6.w = max(0, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = workingVector12.xyz * workingVector6.www + workingVector11.xyz;
        workingVector12.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector6.w = dot(workingVector12.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = workingVector13.xyz * workingVector6.www + workingVector12.xyz;
        workingVector14.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector6.w = dot(workingVector14.xyzw, float4(1,1,1,1));
#endif
        workingVector6.w = (int)workingVector6.w;
        workingVector7.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = float3(1,1,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.xyz = float3(1,1,0);
#endif
        workingVector8.w = 0;
        while (true) {
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector6.w);
          if (workingVector9.w != 0) break;
          workingVector9.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector8.w+0].xyzw);
          workingVector9.w = (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector9.w = (int)workingVector9.w + (int)workingVector12.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.w = (int)workingVector9.w + (int)workingVector14.z;
#endif
          workingVector9.w = min(8, (int)workingVector9.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xy = workingVector12.xy;
          workingVector10.w = workingVector12.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xy = workingVector14.xy;
          workingVector10.w = workingVector14.z;
#endif
          while (true) {
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector9.w);
            if (workingVector11.w != 0) break;
            workingVector11.w = (uint)workingVector10.w << 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = fragmentVectorConstants1[workingVector11.w+93].xyz * workingVector11.yyy;
            workingVector14.xyz = fragmentVectorConstants1[workingVector11.w+92].xyz * workingVector11.xxx + workingVector14.xyz;
            workingVector14.xyz = fragmentVectorConstants1[workingVector11.w+94].xyz * workingVector11.zzz + workingVector14.xyz;
            workingVector14.xyz = fragmentVectorConstants1[workingVector11.w+95].xyz + workingVector14.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector14.xyz));
            workingVector12.w = workingVector15.y ? workingVector15.x : 0;
            workingVector12.w = workingVector15.z ? workingVector12.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+95].xyz * workingVector13.yyy;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+94].xyz * workingVector13.xxx + workingVector16.xyz;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+96].xyz * workingVector13.zzz + workingVector16.xyz;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+97].xyz + workingVector16.xyz;
            workingVector17.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector16.xyz));
            workingVector12.w = workingVector17.y ? workingVector17.x : 0;
            workingVector12.w = workingVector17.z ? workingVector12.w : 0;
#endif
            if (workingVector12.w != 0) {
              workingVector12.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector10.w+0].xyzw);
              workingVector12.w = max(workingVector12.w, workingVector5.w);
              workingVector12.w = min(1, workingVector12.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.z = -workingVector12.w * workingVector12.w + 1;
              workingVector13.z = sqrt(workingVector13.z);
              workingVector12.w = workingVector13.z / workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector13.w = -workingVector12.w * workingVector12.w + 1;
              workingVector13.w = sqrt(workingVector13.w);
              workingVector12.w = workingVector13.w / workingVector12.w;
#endif
              workingVector12.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector12.w + fragmentVectorConstants1[workingVector10.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector15.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector17.xy = workingVector16.xy * float2(0.5,0.5) + float2(0.5,0.5);
#endif
              workingVector11.w = dot(fragmentVectorConstants1[workingVector11.w+19].xyzw, fragmentVectorConstants1[workingVector11.w+19].xyzw);
              workingVector11.w = sqrt(workingVector11.w);
              workingVector11.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.z = fragmentVectorConstants1[workingVector10.w+49].w + 0.5;
              workingVector13.z = (int)workingVector13.z;
              workingVector13.z = max(1, (int)workingVector13.z);
              workingVector13.z = min(9, (int)workingVector13.z);
              workingVector13.z = workingVector7.w ? 1 : workingVector13.z;
              workingVector13.w = (uint)workingVector13.z >> 1;
              workingVector15.z = 1 + -workingVector15.y;
              workingVector16.z = (int)workingVector10.w;
              workingVector12.w = workingVector14.z + -workingVector12.w;
              workingVector14.xyw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector13.w = fragmentVectorConstants1[workingVector10.w+49].w + 0.5;
              workingVector13.w = (int)workingVector13.w;
              workingVector13.w = max(1, (int)workingVector13.w);
              workingVector13.w = min(9, (int)workingVector13.w);
              workingVector13.w = workingVector7.w ? 1 : workingVector13.w;
              workingVector14.w = (uint)workingVector13.w >> 1;
              workingVector17.z = 1 + -workingVector17.y;
              workingVector18.z = (int)workingVector10.w;
              workingVector12.w = workingVector16.z + -workingVector12.w;
              workingVector15.zw = float2(0,0);
              workingVector16.x = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector15.y = RD_COMPARISON_MASK((int)workingVector14.w >= (int)workingVector13.z);
                if (workingVector15.y != 0) break;
                workingVector15.y = (int)-workingVector13.w + (int)workingVector14.w;
                workingVector15.y = (int)workingVector15.y;
                workingVector17.y = 0.5 + workingVector15.y;
                workingVector15.yw = workingVector14.yx;
                workingVector16.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector16.y = RD_COMPARISON_MASK((int)workingVector16.x >= (int)workingVector13.w);
                if (workingVector16.y != 0) break;
                workingVector16.y = (int)-workingVector14.w + (int)workingVector16.x;
                workingVector16.y = (int)workingVector16.y;
                workingVector19.y = 0.5 + workingVector16.y;
                workingVector16.yw = workingVector15.wz;
                workingVector17.y = 0;
#endif
                while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector17.z = RD_COMPARISON_MASK((int)workingVector16.w >= (int)workingVector13.z);
                  if (workingVector17.z != 0) break;
                  workingVector17.z = (int)-workingVector13.w + (int)workingVector16.w;
                  workingVector17.z = (int)workingVector17.z;
                  workingVector17.x = 0.5 + workingVector17.z;
                  workingVector17.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector17.xy;
                  workingVector17.xz = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector17.xz;
                  workingVector16.xy = workingVector15.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector17.xz;
                  workingVector18.xyzw = materialTexture5.Gather(textureSampler5, workingVector16.xyz).xyzw;
                  workingVector16.xy = workingVector16.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector16.xy = frac(workingVector16.xy);
                  workingVector19.xyzw = -workingVector18.xyzw + workingVector14.zzzz;
                  workingVector19.xyzw = saturate(workingVector19.xyzw * workingVector11.wwww);
                  workingVector20.xyzw = workingVector19.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector19.xyzw = workingVector19.xyzw * workingVector19.xyzw;
                  workingVector19.xyzw = -workingVector20.xyzw * workingVector19.xyzw + float4(1,1,1,1);
                  workingVector17.xz = workingVector19.zy + -workingVector19.wx;
                  workingVector17.xz = workingVector16.xx * workingVector17.xz + workingVector19.wx;
                  workingVector17.z = workingVector17.z + -workingVector17.x;
                  workingVector17.x = workingVector16.y * workingVector17.z + workingVector17.x;
                  workingVector15.w = workingVector17.x + workingVector15.w;
                  workingVector17.x = RD_COMPARISON_MASK(workingVector18.w >= workingVector12.w);
                  workingVector17.x = workingVector17.x ? 1.000000 : 0;
                  workingVector17.x = workingVector17.x + workingVector15.y;
                  workingVector18.xyzw = RD_COMPARISON_MASK(workingVector18.xyzw >= workingVector12.wwww);
                  workingVector19.xyzw = workingVector18.xyzw ? float4(1,1,1,1) : 0;
                  workingVector17.zw = workingVector18.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector17.zw = workingVector19.zy + workingVector17.zw;
                  workingVector17.zw = workingVector16.xx * workingVector17.zw + workingVector19.wx;
                  workingVector16.x = workingVector17.w + -workingVector17.z;
                  workingVector16.x = workingVector16.y * workingVector16.x + workingVector17.z;
                  workingVector16.x = workingVector16.x + workingVector15.y;
                  workingVector15.y = workingVector7.w ? workingVector17.x : workingVector16.x;
                  workingVector16.w = (int)workingVector16.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector17.w = RD_COMPARISON_MASK((int)workingVector17.y >= (int)workingVector13.w);
                  if (workingVector17.w != 0) break;
                  workingVector17.w = (int)-workingVector14.w + (int)workingVector17.y;
                  workingVector17.w = (int)workingVector17.w;
                  workingVector19.x = 0.5 + workingVector17.w;
                  workingVector19.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector19.xy;
                  workingVector19.xz = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector19.xz;
                  workingVector18.xy = workingVector17.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector19.xz;
                  workingVector20.xyzw = materialTexture5.Gather(textureSampler5, workingVector18.xyz).xyzw;
                  workingVector18.xy = workingVector18.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector18.xy = frac(workingVector18.xy);
                  workingVector21.xyzw = -workingVector20.xyzw + workingVector16.zzzz;
                  workingVector21.xyzw = saturate(workingVector21.xyzw * workingVector11.wwww);
                  workingVector22.xyzw = workingVector21.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector21.xyzw = workingVector21.xyzw * workingVector21.xyzw;
                  workingVector21.xyzw = -workingVector22.xyzw * workingVector21.xyzw + float4(1,1,1,1);
                  workingVector19.xz = workingVector21.zy + -workingVector21.wx;
                  workingVector19.xz = workingVector18.xx * workingVector19.xz + workingVector21.wx;
                  workingVector17.w = workingVector19.z + -workingVector19.x;
                  workingVector17.w = workingVector18.y * workingVector17.w + workingVector19.x;
                  workingVector16.w = workingVector17.w + workingVector16.w;
                  workingVector17.w = RD_COMPARISON_MASK(workingVector20.w >= workingVector12.w);
                  workingVector17.w = workingVector17.w ? 1.000000 : 0;
                  workingVector17.w = workingVector17.w + workingVector16.y;
                  workingVector20.xyzw = RD_COMPARISON_MASK(workingVector20.xyzw >= workingVector12.wwww);
                  workingVector21.xyzw = workingVector20.xyzw ? float4(1,1,1,1) : 0;
                  workingVector19.xz = workingVector20.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector19.xz = workingVector21.zy + workingVector19.xz;
                  workingVector18.xw = workingVector18.xx * workingVector19.xz + workingVector21.wx;
                  workingVector18.w = workingVector18.w + -workingVector18.x;
                  workingVector18.x = workingVector18.y * workingVector18.w + workingVector18.x;
                  workingVector18.x = workingVector18.x + workingVector16.y;
                  workingVector16.y = workingVector7.w ? workingVector17.w : workingVector18.x;
                  workingVector17.y = (int)workingVector17.y + 1;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector14.xy = workingVector15.wy;
                workingVector14.w = (int)workingVector14.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector15.zw = workingVector16.wy;
                workingVector16.x = (int)workingVector16.x + 1;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.w = (int)workingVector13.z * (int)workingVector13.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.w = (int)workingVector13.w * (int)workingVector13.w;
#endif
              workingVector11.w = (int)workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.zw = workingVector14.xy / workingVector11.ww;
              workingVector13.xy = min(workingVector13.xy, workingVector13.zw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector16.xz = workingVector15.zw / workingVector11.ww;
              workingVector15.xy = min(workingVector16.xz, workingVector15.xy);
#endif
              workingVector10.w = workingVector9.w;
            } else {
              workingVector10.w = (int)workingVector10.w + 1;
            }
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector12.xy = workingVector13.xy;
          workingVector12.z = workingVector10.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector14.xy = workingVector15.xy;
          workingVector14.z = workingVector10.w;
#endif
          workingVector8.w = (int)workingVector8.w + 1;
        }
        workingVector6.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
        if (workingVector6.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector11.yyy;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector11.xxx + workingVector13.xyz;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector11.zzz + workingVector13.xyz;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector13.xyz;
          workingVector14.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector14.z = 1 + -workingVector14.y;
          workingVector12.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector14.xz;
          workingVector13.xy = RD_COMPARISON_MASK(workingVector12.zw >= float2(0,0));
          workingVector14.xy = RD_COMPARISON_MASK(workingVector12.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector6.w = workingVector13.x ? workingVector14.x : 0;
          workingVector6.w = workingVector13.y ? workingVector6.w : 0;
          workingVector6.w = workingVector14.y ? workingVector6.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector13.yyy;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector13.xxx + workingVector15.xyz;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector13.zzz + workingVector15.xyz;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector15.xyz;
          workingVector16.xy = workingVector15.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector16.z = 1 + -workingVector16.y;
          workingVector14.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector16.xz;
          workingVector15.xy = RD_COMPARISON_MASK(workingVector14.zw >= float2(0,0));
          workingVector16.xy = RD_COMPARISON_MASK(workingVector14.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector6.w = workingVector15.x ? workingVector16.x : 0;
          workingVector6.w = workingVector15.y ? workingVector6.w : 0;
          workingVector6.w = workingVector16.y ? workingVector6.w : 0;
#endif
          if (workingVector6.w != 0) {
            workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
            workingVector6.w = min(1, workingVector6.w);
            workingVector8.w = -workingVector6.w * workingVector6.w + 1;
            workingVector8.w = sqrt(workingVector8.w);
            workingVector6.w = workingVector8.w / workingVector6.w;
            workingVector6.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector6.w + fragmentVectorConstants1[workingVector10.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.w = workingVector13.z + -workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector6.w = workingVector15.z + -workingVector6.w;
#endif
            workingVector6.w = min(1, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector15.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
#endif
            workingVector8.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.z = 1 + workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector16.z = 1 + workingVector8.w;
#endif
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector9.w = 0;
            workingVector10.w = 0;
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector13.x);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector15.x);
#endif
              if (workingVector11.w != 0) break;
              workingVector11.w = (int)workingVector8.w + (int)workingVector10.w;
              workingVector11.w = (int)workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector15.y = 0.5 + workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector17.y = 0.5 + workingVector11.w;
#endif
              workingVector11.w = workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.z = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.w = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector13.w = RD_COMPARISON_MASK((int)workingVector13.z >= (int)workingVector13.x);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector15.x);
#endif
                if (workingVector13.w != 0) break;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector13.w = (int)workingVector8.w + (int)workingVector13.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.w = (int)workingVector8.w + (int)workingVector12.w;
#endif
                workingVector13.w = (int)workingVector13.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector15.x = 0.5 + workingVector13.w;
                workingVector15.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector15.xy;
                workingVector14.xy = workingVector15.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector12.zw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector17.x = 0.5 + workingVector13.w;
                workingVector15.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector17.xy;
                workingVector16.xy = workingVector15.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector14.zw;
#endif
                if (workingVector7.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector13.w = materialTexture5.SampleLevel(textureSampler5, workingVector14.xyz, 0).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector13.w = materialTexture5.SampleLevel(textureSampler5, workingVector16.xyz, 0).x;
#endif
                  workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector6.w);
                  workingVector13.w = workingVector13.w ? 1.000000 : 0;
                  workingVector11.w = workingVector13.w + workingVector11.w;
                } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector16.xyzw = materialTexture5.Gather(textureSampler5, workingVector14.xyz).xyzw;
                  workingVector14.xy = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector14.xy = frac(workingVector14.xy);
                  workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector6.wwww);
                  workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                  workingVector15.xz = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector15.xz = workingVector17.zy + workingVector15.xz;
                  workingVector14.xw = workingVector14.xx * workingVector15.xz + workingVector17.wx;
                  workingVector13.w = workingVector14.w + -workingVector14.x;
                  workingVector13.w = workingVector14.y * workingVector13.w + workingVector14.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector18.xyzw = materialTexture5.Gather(textureSampler5, workingVector16.xyz).xyzw;
                  workingVector15.zw = workingVector16.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector15.zw = frac(workingVector15.zw);
                  workingVector18.xyzw = RD_COMPARISON_MASK(workingVector18.xyzw >= workingVector6.wwww);
                  workingVector19.xyzw = workingVector18.xyzw ? float4(1,1,1,1) : 0;
                  workingVector16.xy = workingVector18.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector16.xy = workingVector19.zy + workingVector16.xy;
                  workingVector16.xy = workingVector15.zz * workingVector16.xy + workingVector19.wx;
                  workingVector13.w = workingVector16.y + -workingVector16.x;
                  workingVector13.w = workingVector15.w * workingVector13.w + workingVector16.x;
#endif
                  workingVector11.w = workingVector13.w + workingVector11.w;
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector13.z = (int)workingVector13.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector12.w = (int)workingVector12.w + 1;
#endif
              }
              workingVector9.w = workingVector11.w;
              workingVector10.w = (int)workingVector10.w + 1;
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.w = workingVector9.w / workingVector13.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector6.w = workingVector9.w / workingVector15.y;
#endif
          } else {
            workingVector6.w = 1;
          }
        } else {
          workingVector6.w = 1;
        }
        workingVector8.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector8.w = RD_COMPARISON_MASK(0 < (int)workingVector8.w);
        workingVector9.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector9.w = RD_COMPARISON_MASK(0 < (int)workingVector9.w);
        workingVector8.w = workingVector8.w ? workingVector9.w : 0;
        if (workingVector8.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector11.yyyy;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector11.xxxx + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector11.zzzz + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector11.xyzw;
          workingVector11.xyzw = workingVector11.xyzw / workingVector11.wwww;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector13.yyyy;
          workingVector15.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector13.xxxx + workingVector15.xyzw;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector13.zzzz + workingVector15.xyzw;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector13.xyzw;
          workingVector13.xyzw = workingVector13.xyzw / workingVector13.wwww;
#endif
          workingVector5.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
          workingVector5.w = min(1, workingVector5.w);
          workingVector8.w = -workingVector5.w * workingVector5.w + 1;
          workingVector8.w = sqrt(workingVector8.w);
          workingVector5.w = workingVector8.w / workingVector5.w;
          workingVector5.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector5.w + fragmentVectorConstants1[workingVector10.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector5.w = workingVector5.w / workingVector11.w;
          workingVector5.w = workingVector11.z + -workingVector5.w;
          workingVector11.xy = workingVector11.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector11.z = 1 + -workingVector11.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector5.w = workingVector5.w / workingVector13.w;
          workingVector5.w = workingVector13.z + -workingVector5.w;
          workingVector13.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector13.z = 1 + -workingVector13.y;
#endif
          workingVector8.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector8.w = (int)workingVector8.w;
          workingVector8.w = max(1, (int)workingVector8.w);
          workingVector8.w = min(9, (int)workingVector8.w);
          workingVector8.w = workingVector7.w ? 1 : workingVector8.w;
          workingVector9.w = (uint)workingVector8.w >> 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#endif
          workingVector10.w = 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector11.w = 0;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.y >= (int)workingVector8.w);
            if (workingVector11.w != 0) break;
            workingVector11.w = (int)-workingVector9.w + (int)workingVector11.y;
            workingVector11.w = (int)workingVector11.w;
            workingVector14.y = 0.5 + workingVector11.w;
            workingVector11.w = workingVector10.w;
            workingVector12.z = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector8.w);
            if (workingVector12.w != 0) break;
            workingVector12.w = (int)-workingVector9.w + (int)workingVector11.w;
            workingVector12.w = (int)workingVector12.w;
            workingVector16.y = 0.5 + workingVector12.w;
            workingVector12.w = workingVector10.w;
            workingVector13.y = 0;
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.z >= (int)workingVector8.w);
              if (workingVector12.w != 0) break;
              workingVector12.w = (int)-workingVector9.w + (int)workingVector12.z;
              workingVector12.w = (int)workingVector12.w;
              workingVector14.x = 0.5 + workingVector12.w;
              workingVector14.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector14.xy;
              workingVector14.xz = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector14.xz;
              workingVector13.xy = workingVector11.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector14.xz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector13.w = RD_COMPARISON_MASK((int)workingVector13.y >= (int)workingVector8.w);
              if (workingVector13.w != 0) break;
              workingVector13.w = (int)-workingVector9.w + (int)workingVector13.y;
              workingVector13.w = (int)workingVector13.w;
              workingVector16.x = 0.5 + workingVector13.w;
              workingVector14.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector16.xy;
              workingVector14.zw = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector14.zw;
              workingVector15.xy = workingVector13.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector14.zw;
#endif
              if (workingVector7.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector12.w = materialTexture5.SampleLevel(textureSampler5, workingVector13.xyz, 0).x;
                workingVector12.w = RD_COMPARISON_MASK(workingVector12.w >= workingVector5.w);
                workingVector12.w = workingVector12.w ? 1.000000 : 0;
                workingVector11.w = workingVector12.w + workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.w = materialTexture5.SampleLevel(textureSampler5, workingVector15.xyz, 0).x;
                workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector5.w);
                workingVector13.w = workingVector13.w ? 1.000000 : 0;
                workingVector12.w = workingVector13.w + workingVector12.w;
#endif
              } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector15.xyzw = materialTexture5.Gather(textureSampler5, workingVector13.xyz).xyzw;
                workingVector13.xy = workingVector13.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector13.xy = frac(workingVector13.xy);
                workingVector15.xyzw = RD_COMPARISON_MASK(workingVector15.xyzw >= workingVector5.wwww);
                workingVector16.xyzw = workingVector15.xyzw ? float4(1,1,1,1) : 0;
                workingVector14.xz = workingVector15.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector14.xz = workingVector16.zy + workingVector14.xz;
                workingVector13.xw = workingVector13.xx * workingVector14.xz + workingVector16.wx;
                workingVector12.w = workingVector13.w + -workingVector13.x;
                workingVector12.w = workingVector13.y * workingVector12.w + workingVector13.x;
                workingVector11.w = workingVector12.w + workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector17.xyzw = materialTexture5.Gather(textureSampler5, workingVector15.xyz).xyzw;
                workingVector14.zw = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector14.zw = frac(workingVector14.zw);
                workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector5.wwww);
                workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                workingVector15.xy = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector15.xy = workingVector18.zy + workingVector15.xy;
                workingVector15.xy = workingVector14.zz * workingVector15.xy + workingVector18.wx;
                workingVector13.w = workingVector15.y + -workingVector15.x;
                workingVector13.w = workingVector14.w * workingVector13.w + workingVector15.x;
                workingVector12.w = workingVector13.w + workingVector12.w;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.z = (int)workingVector12.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector13.y = (int)workingVector13.y + 1;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.w = workingVector11.w;
            workingVector11.y = (int)workingVector11.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = workingVector12.w;
            workingVector11.w = (int)workingVector11.w + 1;
#endif
          }
          workingVector5.w = (int)workingVector8.w * (int)workingVector8.w;
          workingVector5.w = (int)workingVector5.w;
          workingVector5.w = workingVector10.w / workingVector5.w;
          workingVector7.w = RD_COMPARISON_MASK(workingVector5.w < 1);
          workingVector8.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector5.w = max(workingVector8.w, workingVector5.w);
          workingVector5.w = min(1, workingVector5.w);
          workingVector5.w = workingVector7.w ? workingVector5.w : 1;
        } else {
          workingVector5.w = 1;
        }
        workingVector5.w = min(workingVector6.w, workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = min(workingVector12.y, workingVector5.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = min(workingVector14.y, workingVector5.w);
#endif
        workingVector6.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector6.w = min(8, workingVector6.w);
        workingVector6.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
        workingVector6.w = max(0, workingVector6.w);
        workingVector7.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
        workingVector6.w = -workingVector6.w + -workingVector1.z;
        workingVector7.w = 1 / workingVector7.w;
        workingVector6.w = saturate(workingVector7.w * workingVector6.w);
        workingVector7.w = workingVector6.w * -2 + 3;
        workingVector6.w = workingVector6.w * workingVector6.w;
        workingVector6.w = workingVector7.w * workingVector6.w;
        workingVector7.w = 1 + -workingVector5.w;
        workingVector5.w = workingVector6.w * workingVector7.w + workingVector5.w;
      } else {
        workingVector5.w = 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.x = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.x = 1;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector11.xyz;
      workingVector6.w = dot(workingVector11.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector13.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector13.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector13.xyz;
      workingVector6.w = dot(workingVector13.xyz, workingVector13.xyz);
#endif
      workingVector6.w = rsqrt(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.yzw = workingVector11.xyz * workingVector6.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector13.xyz = workingVector13.xyz * workingVector2.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector13.xyz;
      workingVector2.w = dot(workingVector5.xyz, workingVector12.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector14.yzw = workingVector13.xyz * workingVector6.www;
      workingVector15.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector15.xyz = workingVector15.xyz * workingVector2.www;
      workingVector15.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector15.xyz;
      workingVector2.w = dot(workingVector5.xyz, workingVector14.yzw);
#endif
      workingVector7.w = max(0, workingVector2.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector8.w = dot(workingVector5.xyz, -workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.w = dot(workingVector5.xyz, -workingVector11.xyz);
#endif
      workingVector8.w = max(0, workingVector8.w);
      workingVector2.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector2.w;
      workingVector9.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
      workingVector9.w = workingVector9.w * workingVector9.w;
      workingVector2.w = workingVector2.w / workingVector9.w;
      workingVector2.w = max(0, workingVector2.w);
      workingVector2.w = workingVector2.w + -workingVector7.w;
      workingVector2.w = workingVector4.w * workingVector2.w + workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.w = dot(-workingVector5.xyz, workingVector12.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector10.w = dot(-workingVector5.xyz, workingVector14.yzw);
#endif
      workingVector10.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector10.w;
      workingVector9.w = workingVector10.w / workingVector9.w;
      workingVector9.w = max(0, workingVector9.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.w = workingVector9.w * workingVector4.w;
      workingVector11.xyz = workingVector11.xyz * workingVector6.www + -workingVector10.xyz;
      workingVector6.w = dot(workingVector11.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.w = workingVector9.w * workingVector4.w;
      workingVector13.xyz = workingVector13.xyz * workingVector6.www + -workingVector11.xyz;
      workingVector6.w = dot(workingVector13.xyz, workingVector13.xyz);
#endif
      workingVector6.w = rsqrt(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = workingVector11.xyz * workingVector6.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector13.xyz = workingVector13.xyz * workingVector6.www;
#endif
      workingVector6.w = max(0.0500000007, varyingTexCoord8.z);
      workingVector6.w = workingVector6.w * workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.w = workingVector6.w * workingVector6.w;
      workingVector10.w = dot(workingVector5.xyz, workingVector11.xyz);
      workingVector10.w = max(0, workingVector10.w);
      workingVector11.w = workingVector6.w * workingVector6.w + -1;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector10.w = workingVector10.w * workingVector11.w + 1;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector10.w = 3.14159274 * workingVector10.w;
      workingVector9.w = workingVector9.w / workingVector10.w;
      workingVector10.w = 0.5 * workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector10.w = workingVector6.w * workingVector6.w;
      workingVector11.w = dot(workingVector5.xyz, workingVector13.xyz);
      workingVector11.w = max(0, workingVector11.w);
      workingVector12.w = workingVector6.w * workingVector6.w + -1;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector11.w = workingVector11.w * workingVector12.w + 1;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector11.w = 3.14159274 * workingVector11.w;
      workingVector10.w = workingVector10.w / workingVector11.w;
      workingVector11.w = 0.5 * workingVector6.w;
#endif
      workingVector6.w = -workingVector6.w * 0.5 + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.w = workingVector8.w * workingVector6.w + workingVector10.w;
      workingVector11.w = 9.99999975e-005 + workingVector11.w;
      workingVector11.w = workingVector8.w / workingVector11.w;
      workingVector6.w = workingVector7.w * workingVector6.w + workingVector10.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector12.w = workingVector8.w * workingVector6.w + workingVector11.w;
      workingVector12.w = 9.99999975e-005 + workingVector12.w;
      workingVector12.w = workingVector8.w / workingVector12.w;
      workingVector6.w = workingVector7.w * workingVector6.w + workingVector11.w;
#endif
      workingVector6.w = 9.99999975e-005 + workingVector6.w;
      workingVector6.w = workingVector7.w / workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector6.w = workingVector11.w * workingVector6.w;
      workingVector10.x = dot(-workingVector10.xyz, workingVector11.xyz);
      workingVector10.x = max(0, workingVector10.x);
      workingVector10.yzw = float3(1,1,1) + -workingVector8.xyz;
      workingVector10.x = 1 + -workingVector10.x;
      workingVector10.x = max(0, workingVector10.x);
      workingVector11.x = workingVector10.x * workingVector10.x;
      workingVector11.x = workingVector11.x * workingVector11.x;
      workingVector10.x = workingVector11.x * workingVector10.x;
      workingVector10.xyz = workingVector10.yzw * workingVector10.xxx + workingVector8.xyz;
      workingVector11.xyz = workingVector1.www * workingVector0.xyz;
      workingVector12.yzw = float3(1,1,1) + -workingVector10.xyz;
      workingVector12.yzw = workingVector12.yzw * workingVector2.www;
      workingVector11.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector11.xyz;
      workingVector12.yzw = workingVector12.yzw * workingVector11.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector4.www;
      workingVector10.xyz = workingVector10.xyz * workingVector9.www;
      workingVector10.xyz = workingVector10.xyz * workingVector6.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.w = workingVector12.w * workingVector6.w;
      workingVector11.w = dot(-workingVector11.xyz, workingVector13.xyz);
      workingVector11.w = max(0, workingVector11.w);
      workingVector13.xyz = float3(1,1,1) + -workingVector9.xyz;
      workingVector11.w = 1 + -workingVector11.w;
      workingVector11.w = max(0, workingVector11.w);
      workingVector12.w = workingVector11.w * workingVector11.w;
      workingVector12.w = workingVector12.w * workingVector12.w;
      workingVector11.w = workingVector12.w * workingVector11.w;
      workingVector13.xyz = workingVector13.xyz * workingVector11.www + workingVector9.xyz;
      workingVector14.yzw = workingVector1.www * workingVector0.xyz;
      workingVector16.xyz = float3(1,1,1) + -workingVector13.xyz;
      workingVector16.xyz = workingVector16.xyz * workingVector2.www;
      workingVector14.yzw = float3(0.318309873,0.318309873,0.318309873) * workingVector14.yzw;
      workingVector16.xyz = workingVector16.xyz * workingVector14.yzw;
      workingVector14.yzw = workingVector14.yzw * workingVector9.www;
      workingVector13.xyz = workingVector13.xyz * workingVector10.www;
      workingVector13.xyz = workingVector13.xyz * workingVector6.www;
#endif
      workingVector2.w = workingVector8.w * workingVector7.w;
      workingVector2.w = workingVector2.w * 4 + 9.99999975e-005;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.xyz = workingVector10.xyz / workingVector2.www;
      workingVector10.xyz = workingVector10.xyz * workingVector7.www;
      workingVector11.xyz = workingVector11.xyz * workingVector12.xxx;
      workingVector11.xyz = workingVector12.yzw * workingVector5.www + workingVector11.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector13.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector11.xyz;
      workingVector10.xyz = workingVector10.xyz * workingVector5.www;
      workingVector10.xyz = workingVector10.xyz * workingVector13.xyz;
      workingVector10.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector13.xyz = workingVector13.xyz / workingVector2.www;
      workingVector13.xyz = workingVector13.xyz * workingVector7.www;
      workingVector14.xyz = workingVector14.yzw * workingVector14.xxx;
      workingVector14.xyz = workingVector16.xyz * workingVector5.www + workingVector14.xyz;
      workingVector14.xyz = workingVector14.xyz * workingVector15.xyz;
      workingVector14.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector14.xyz;
      workingVector13.xyz = workingVector13.xyz * workingVector5.www;
      workingVector13.xyz = workingVector13.xyz * workingVector15.xyz;
      workingVector13.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector13.xyz;
#endif
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = float3(0,0,0);
      workingVector10.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector14.xyz = float3(0,0,0);
      workingVector13.xyz = float3(0,0,0);
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
    if (workingVector2.w != 0) {
      workingVector5.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector1.z;
      workingVector6.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector5.w;
      workingVector7.w = workingVector5.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector1.x;
      workingVector6.w = workingVector6.w + workingVector6.w;
      workingVector6.w = saturate(workingVector7.w / workingVector6.w);
      workingVector7.w = -workingVector1.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector1.y;
      workingVector5.w = workingVector5.w + workingVector5.w;
      workingVector5.w = saturate(workingVector7.w / workingVector5.w);
      workingVector15.xy = RD_COMPARISON_MASK(-workingVector1.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
      workingVector7.w = log2(-workingVector1.z);
      workingVector7.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector7.w;
      workingVector7.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector7.w);
      workingVector16.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
      workingVector7.w = workingVector16.x * workingVector7.w;
      workingVector7.w = floor(workingVector7.w);
      workingVector7.w = 2 + workingVector7.w;
      workingVector7.w = min(workingVector7.w, workingVector16.y);
      workingVector7.w = workingVector15.y ? 1 : workingVector7.w;
      workingVector7.w = workingVector15.x ? 0 : workingVector7.w;
      workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector6.w;
      workingVector6.w = floor(workingVector6.w);
      workingVector6.w = min(workingVector6.w, workingVector16.z);
      workingVector5.w = RD_UNIFORM_CLUSTER_DIMENSIONS.y * workingVector5.w;
      workingVector5.w = floor(workingVector5.w);
      workingVector5.w = min(workingVector5.w, workingVector16.w);
      workingVector8.w = RD_COMPARISON_MASK(workingVector6.w < 0);
      workingVector9.w = RD_COMPARISON_MASK(workingVector5.w < 0);
      workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
      workingVector9.w = RD_COMPARISON_MASK(workingVector7.w < 0);
      workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
      workingVector9.w = RD_COMPARISON_MASK(workingVector6.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
      workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
      workingVector9.w = RD_COMPARISON_MASK(workingVector5.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
      workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
      workingVector9.w = RD_COMPARISON_MASK(workingVector7.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
      workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
      if (workingVector8.w == 0) {
        workingVector5.w = workingVector5.w * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector6.w;
        workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector7.w;
        workingVector5.w = workingVector6.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector5.w;
        workingVector5.w = (int)workingVector5.w;
        workingVector6.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
        workingVector7.w = (int)workingVector5.w * (int)workingVector6.w;
        workingVector5.w = mad((int)workingVector5.w, (int)workingVector6.w, (int)workingVector6.w);
        workingVector6.w = dot(workingVector5.xyz, -workingVector11.xyz);
        workingVector6.w = max(0, workingVector6.w);
        workingVector8.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
        workingVector8.w = workingVector8.w * workingVector8.w;
        workingVector9.w = max(0.0500000007, varyingTexCoord8.z);
        workingVector9.w = workingVector9.w * workingVector9.w;
        workingVector10.w = workingVector9.w * workingVector9.w;
        workingVector11.w = workingVector9.w * workingVector9.w + -1;
        workingVector12.w = 0.5 * workingVector9.w;
        workingVector9.w = -workingVector9.w * 0.5 + 1;
        workingVector13.w = workingVector6.w * workingVector9.w + workingVector12.w;
        workingVector13.w = 9.99999975e-005 + workingVector13.w;
        workingVector13.w = workingVector6.w / workingVector13.w;
        workingVector15.xyz = float3(1,1,1) + -workingVector9.xyz;
        workingVector16.xyz = workingVector1.www * workingVector0.xyz;
        workingVector16.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector16.xyz;
        workingVector14.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
        workingVector15.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
        workingVector16.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
        workingVector17.x = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
        workingVector17.yz = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
        workingVector17.w = RD_COMPARISON_MASK(0 < workingVector4.w);
        workingVector17.x = 1 / workingVector17.x;
        workingVector18.xyz = float3(0,0,0);
        workingVector19.xyz = float3(0,0,0);
        workingVector18.w = workingVector7.w;
        while (true) {
          workingVector19.w = RD_COMPARISON_MASK((int)workingVector18.w >= (int)workingVector5.w);
          if (workingVector19.w != 0) break;
          workingVector19.w = sampledResource9[workingVector18.w].val[0/4];
          workingVector19.w = (int)workingVector19.w;
          workingVector20.x = RD_COMPARISON_MASK((int)workingVector19.w < 0);
          if (workingVector20.x != 0) {
            break;
          }
          workingVector20.x = sampledResource10[workingVector19.w].val[0/4];
          workingVector20.y = sampledResource10[workingVector19.w].val[0/4+1];
          workingVector20.z = sampledResource10[workingVector19.w].val[0/4+2];
          workingVector21.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector20.yyy;
          workingVector21.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector20.xxx + workingVector21.xyz;
          workingVector21.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector20.zzz + workingVector21.xyz;
          workingVector21.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector21.xyz;
          workingVector21.xyz = workingVector21.xyz + workingVector8.xyz;
          workingVector20.w = dot(workingVector21.xyz, workingVector21.xyz);
          workingVector20.w = rsqrt(workingVector20.w);
          workingVector22.xyz = workingVector21.xyz * workingVector20.www;
          workingVector21.w = dot(workingVector5.xyz, workingVector22.xyz);
          workingVector22.w = max(0, workingVector21.w);
          workingVector21.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector21.w;
          workingVector21.w = workingVector21.w / workingVector8.w;
          workingVector21.w = max(0, workingVector21.w);
          workingVector21.w = workingVector21.w + -workingVector22.w;
          workingVector21.w = workingVector4.w * workingVector21.w + workingVector22.w;
          workingVector22.x = dot(-workingVector5.xyz, workingVector22.xyz);
          workingVector22.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector22.x;
          workingVector22.x = workingVector22.x / workingVector8.w;
          workingVector22.x = max(0, workingVector22.x);
          workingVector22.x = workingVector22.x * workingVector4.w;
          workingVector21.xyz = workingVector21.xyz * workingVector20.www + -workingVector11.xyz;
          workingVector20.w = dot(workingVector21.xyz, workingVector21.xyz);
          workingVector20.w = rsqrt(workingVector20.w);
          workingVector21.xyz = workingVector21.xyz * workingVector20.www;
          workingVector20.w = dot(workingVector5.xyz, workingVector21.xyz);
          workingVector20.w = max(0, workingVector20.w);
          workingVector20.w = workingVector20.w * workingVector20.w;
          workingVector20.w = workingVector20.w * workingVector11.w + 1;
          workingVector20.w = workingVector20.w * workingVector20.w;
          workingVector20.w = 3.14159274 * workingVector20.w;
          workingVector20.w = workingVector10.w / workingVector20.w;
          workingVector22.y = workingVector22.w * workingVector9.w + workingVector12.w;
          workingVector22.y = 9.99999975e-005 + workingVector22.y;
          workingVector22.y = workingVector22.w / workingVector22.y;
          workingVector22.y = workingVector22.y * workingVector13.w;
          workingVector21.x = dot(-workingVector11.xyz, workingVector21.xyz);
          workingVector21.x = max(0, workingVector21.x);
          workingVector21.x = 1 + -workingVector21.x;
          workingVector21.x = max(0, workingVector21.x);
          workingVector21.y = workingVector21.x * workingVector21.x;
          workingVector21.y = workingVector21.y * workingVector21.y;
          workingVector21.x = workingVector21.y * workingVector21.x;
          workingVector21.xyz = workingVector15.xyz * workingVector21.xxx + workingVector9.xyz;
          workingVector23.xyz = float3(1,1,1) + -workingVector21.xyz;
          workingVector23.xyz = workingVector23.xyz * workingVector21.www;
          workingVector23.xyz = workingVector23.xyz * workingVector16.xyz;
          workingVector24.xyz = workingVector22.xxx * workingVector16.xyz;
          workingVector21.xyz = workingVector21.xyz * workingVector20.www;
          workingVector21.xyz = workingVector21.xyz * workingVector22.yyy;
          workingVector20.w = workingVector22.w * workingVector6.w;
          workingVector20.w = workingVector20.w * 4 + 9.99999975e-005;
          workingVector21.xyz = workingVector21.xyz / workingVector20.www;
          workingVector21.xyz = workingVector22.www * workingVector21.xyz;
          workingVector20.w = RD_COMPARISON_MASK((int)workingVector19.w >= 0);
          if (workingVector20.w != 0) {
            workingVector22.x = sampledResource10[workingVector19.w].val[0/4];
            workingVector22.y = sampledResource10[workingVector19.w].val[0/4+1];
            workingVector22.z = sampledResource10[workingVector19.w].val[0/4+2];
            workingVector22.w = sampledResource10[workingVector19.w].val[0/4+3];
            workingVector22.xyz = -varyingTexCoord3.xyz + workingVector22.xyz;
            workingVector20.w = abs(workingVector22.x) + abs(workingVector22.y);
            workingVector20.w = workingVector20.w + abs(workingVector22.z);
            workingVector20.w = workingVector20.w * workingVector20.w;
            workingVector21.w = dot(workingVector22.xyz, workingVector22.xyz);
            workingVector20.w = workingVector14.w ? workingVector20.w : workingVector21.w;
            workingVector21.w = workingVector22.w * workingVector22.w;
            workingVector21.w = RD_COMPARISON_MASK(workingVector20.w < workingVector21.w);
            if (workingVector21.w != 0) {
              if (workingVector15.w != 0) {
                workingVector25.x = sampledResource10[workingVector19.w].val[32/4];
                workingVector25.y = sampledResource10[workingVector19.w].val[32/4+1];
                workingVector25.z = sampledResource10[workingVector19.w].val[32/4+2];
                workingVector25.w = sampledResource10[workingVector19.w].val[32/4+3];
                workingVector26.x = sampledResource10[workingVector19.w].val[48/4];
                workingVector26.y = sampledResource10[workingVector19.w].val[48/4+1];
                workingVector26.z = sampledResource10[workingVector19.w].val[48/4+2];
                workingVector26.w = sampledResource10[workingVector19.w].val[48/4+3];
                workingVector27.x = sampledResource10[workingVector19.w].val[64/4];
                workingVector27.y = sampledResource10[workingVector19.w].val[64/4+1];
                workingVector27.z = sampledResource10[workingVector19.w].val[64/4+2];
                workingVector27.w = sampledResource10[workingVector19.w].val[64/4+3];
                workingVector28.x = sampledResource10[workingVector19.w].val[80/4];
                workingVector28.y = sampledResource10[workingVector19.w].val[80/4+1];
                workingVector28.z = sampledResource10[workingVector19.w].val[80/4+2];
                workingVector28.w = sampledResource10[workingVector19.w].val[80/4+3];
                workingVector29.x = sampledResource10[workingVector19.w].val[96/4];
                workingVector29.y = sampledResource10[workingVector19.w].val[96/4+1];
                workingVector29.z = sampledResource10[workingVector19.w].val[96/4+2];
                workingVector29.w = sampledResource10[workingVector19.w].val[96/4+3];
                workingVector30.x = sampledResource10[workingVector19.w].val[112/4];
                workingVector30.y = sampledResource10[workingVector19.w].val[112/4+1];
                workingVector30.z = sampledResource10[workingVector19.w].val[112/4+2];
                workingVector30.w = sampledResource10[workingVector19.w].val[112/4+3];
                workingVector31.xyz = -workingVector20.xyz + workingVector12.xyz;
                workingVector20.xyz = RD_COMPARISON_MASK(abs(workingVector31.xxy) >= abs(workingVector31.yzz));
                workingVector20.x = workingVector20.y ? workingVector20.x : 0;
                workingVector22.xyz = RD_COMPARISON_MASK(workingVector31.xyz >= float3(0,0,0));
                workingVector22.xyz = workingVector22.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                workingVector20.y = workingVector20.z ? workingVector22.y : workingVector22.z;
                workingVector20.x = workingVector20.x ? workingVector22.x : workingVector20.y;
                workingVector32.xyzw = RD_COMPARISON_MASK((int4)workingVector20.xxxx == int4(1,2,3,4));
                workingVector20.x = RD_COMPARISON_MASK((int)workingVector20.x == 5);
                workingVector25.xyzw = workingVector20.xxxx ? workingVector30.xyzw : workingVector25.xyzw;
                workingVector25.xyzw = workingVector32.wwww ? workingVector29.xyzw : workingVector25.xyzw;
                workingVector25.xyzw = workingVector32.zzzz ? workingVector28.xyzw : workingVector25.xyzw;
                workingVector25.xyzw = workingVector32.yyyy ? workingVector27.xyzw : workingVector25.xyzw;
                workingVector25.xyzw = workingVector32.xxxx ? workingVector26.xyzw : workingVector25.xyzw;
                workingVector20.yz = RD_COMPARISON_MASK(workingVector25.zw == float2(0,0));
                workingVector20.y = workingVector20.z ? workingVector20.y : 0;
                if (workingVector20.y == 0) {
                  workingVector31.w = -workingVector31.x;
                  workingVector20.xy = workingVector20.xx ? workingVector31.xz : workingVector31.zw;
                  workingVector20.xz = workingVector32.ww ? -workingVector31.xz : workingVector20.xy;
                  workingVector22.xyz = float3(-1,1,1) * workingVector31.xzy;
                  workingVector20.y = workingVector22.z;
                  workingVector20.xyz = workingVector32.zzz ? workingVector22.xyz : workingVector20.xyz;
                  workingVector20.xyz = workingVector32.yyy ? -workingVector31.xzy : workingVector20.xyz;
                  workingVector22.xyz = float3(-1,1,1) * workingVector31.zyx;
                  workingVector20.xyz = workingVector32.xxx ? workingVector22.xyz : workingVector20.xyz;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector20.yyyy;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector20.xxxx + workingVector26.xyzw;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector20.zzzz + workingVector26.xyzw;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector26.xyzw;
                  workingVector21.w = dot(-workingVector31.xyz, -workingVector31.xyz);
                  workingVector21.w = rsqrt(workingVector21.w);
                  workingVector22.xyz = -workingVector31.xyz * workingVector21.www;
                  workingVector21.w = dot(workingVector22.xyz, workingVector4.xyz);
                  workingVector21.w = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector21.w);
                  workingVector21.w = min(1, workingVector21.w);
                  workingVector22.x = -workingVector21.w * workingVector21.w + 1;
                  workingVector22.x = sqrt(workingVector22.x);
                  workingVector21.w = workingVector22.x / workingVector21.w;
                  workingVector21.w = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector21.w + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                  workingVector22.xyz = workingVector25.zzw + -workingVector25.xxy;
                  workingVector27.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector22.xyz;
                  workingVector22.x = max(1, workingVector27.x);
                  workingVector22.x = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector22.x;
                  workingVector26.z = -workingVector21.w * workingVector22.x + workingVector26.z;
                  workingVector26.xyz = workingVector26.xyz / workingVector26.www;
                  workingVector28.xy = workingVector26.xy * float2(0.5,0.5) + float2(0.5,0.5);
                  workingVector27.xw = workingVector25.xy + workingVector17.yz;
                  workingVector25.zw = workingVector25.zw + -workingVector17.yz;
                  workingVector28.z = 1 + -workingVector28.y;
                  workingVector28.xy = workingVector28.xz * workingVector27.yz;
                  workingVector28.xy = floor(workingVector28.xy);
                  workingVector28.xy = float2(0.5,0.5) + workingVector28.xy;
                  workingVector27.yz = workingVector28.xy / workingVector27.yz;
                  workingVector22.xy = workingVector27.yz * workingVector22.yz + workingVector25.xy;
                  workingVector22.xy = max(workingVector22.xy, workingVector27.xw);
                  workingVector22.xy = min(workingVector22.xy, workingVector25.zw);
                  workingVector21.w = materialTexture1.SampleLevel(textureSampler1, workingVector22.xy, 0).x;
                  workingVector22.x = RD_COMPARISON_MASK(workingVector21.w >= workingVector26.z);
                  workingVector22.x = workingVector22.x ? 1.000000 : 0;
                  workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.xyzw * workingVector26.yyyy;
                  workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.xyzw * workingVector26.xxxx + workingVector25.xyzw;
                  workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.xyzw * workingVector21.wwww + workingVector25.xyzw;
                  workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.xyzw + workingVector25.xyzw;
                  workingVector25.xyz = workingVector25.xyz / workingVector25.www;
                  workingVector20.x = dot(workingVector20.xyz, workingVector20.xyz);
                  workingVector20.y = dot(workingVector25.xyz, workingVector25.xyz);
                  workingVector20.xy = sqrt(workingVector20.xy);
                  workingVector20.x = workingVector20.x + -workingVector20.y;
                  workingVector20.x = saturate(RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector20.x);
                  workingVector20.y = workingVector20.x * -2 + 3;
                  workingVector20.x = workingVector20.x * workingVector20.x;
                  workingVector20.x = -workingVector20.y * workingVector20.x + 1;
                  workingVector20.x = workingVector17.w ? workingVector20.x : 1;
                } else {
                  workingVector20.x = 1;
                  workingVector22.x = 0;
                }
              } else {
                workingVector22.x = 1;
                workingVector20.x = 1;
              }
              workingVector20.y = max(0.100000001, workingVector20.w);
              workingVector20.y = 1 / workingVector20.y;
              workingVector20.z = workingVector22.w * workingVector22.w + 9.99999975e-005;
              workingVector20.z = workingVector20.w / workingVector20.z;
              workingVector20.z = -workingVector20.z * workingVector20.z + 1;
              workingVector20.z = max(0, workingVector20.z);
              workingVector20.z = workingVector20.z * workingVector20.z;
              workingVector20.w = workingVector20.y * workingVector20.z;
              workingVector20.y = -workingVector20.y * workingVector20.z + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
              workingVector20.y = 1 + workingVector20.y;
              workingVector20.y = saturate(workingVector20.y * workingVector17.x);
              workingVector20.z = workingVector20.y * -2 + 3;
              workingVector20.y = workingVector20.y * workingVector20.y;
              workingVector20.y = workingVector20.z * workingVector20.y;
              workingVector20.y = saturate(workingVector20.y * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
              workingVector20.y = workingVector20.w * workingVector20.y;
              workingVector20.y = workingVector16.w ? workingVector20.y : workingVector20.w;
              workingVector25.x = sampledResource10[workingVector19.w].val[16/4];
              workingVector25.y = sampledResource10[workingVector19.w].val[16/4+1];
              workingVector25.z = sampledResource10[workingVector19.w].val[16/4+2];
              workingVector25.w = sampledResource10[workingVector19.w].val[16/4+3];
              workingVector22.yzw = workingVector25.xyz * workingVector25.www;
              workingVector20.yzw = workingVector22.yzw * workingVector20.yyy;
            } else {
              workingVector22.x = 1;
              workingVector20.xyzw = float4(1,0,0,0);
            }
          } else {
            workingVector22.x = 1;
            workingVector20.xyzw = float4(1,0,0,0);
          }
          workingVector22.yzw = workingVector24.xyz * workingVector20.xxx;
          workingVector22.yzw = workingVector23.xyz * workingVector22.xxx + workingVector22.yzw;
          workingVector22.yzw = workingVector22.yzw * workingVector20.yzw;
          workingVector18.xyz = workingVector22.yzw * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector18.xyz;
          workingVector21.xyz = workingVector22.xxx * workingVector21.xyz;
          workingVector20.xyz = workingVector21.xyz * workingVector20.yzw;
          workingVector19.xyz = workingVector20.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector19.xyz;
          workingVector18.w = (int)workingVector18.w + 1;
        }
      } else {
        workingVector18.xyz = float3(0,0,0);
        workingVector19.xyz = float3(0,0,0);
      }
      workingVector4.w = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
      workingVector14.xyz = workingVector4.www * workingVector18.xyz + workingVector14.xyz;
      workingVector13.xyz = workingVector4.www * workingVector19.xyz + workingVector13.xyz;
    }
    workingVector4.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    workingVector2.w = workingVector2.w ? workingVector4.w : 0;
#endif
    if (workingVector2.w != 0) {
      workingVector6.xyz = float3(-0.5,-0.5,-0.5) + workingVector6.xyz;
      workingVector6.xyz = workingVector4.xyz * float3(0.200000003,0.200000003,0.200000003) + workingVector6.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.xyz = floor(workingVector6.xyz);
      workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xyz;
      workingVector12.xyz = floor(workingVector12.xyz);
      workingVector12.xyz = (int3)workingVector12.xyz;
      bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector2.w = (((uint)workingVector12.y << 16) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
      workingVector4.w = (int)workingVector12.z & 0x0000ffff;
      workingVector12.xyz = (int3)workingVector12.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector13.xyz = (uint3)workingVector12.xyz >> int3(24,24,24);
      workingVector12.xyz = (int3)workingVector12.xyz ^ (int3)workingVector13.xyz;
      workingVector12.xyz = (int3)workingVector12.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector5.w = (int)workingVector12.x ^ 0x88b16480;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.xyz = floor(workingVector6.xyz);
      workingVector8.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
      workingVector8.xyz = floor(workingVector8.xyz);
      workingVector8.xyz = (int3)workingVector8.xyz;
      bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector2.w = (((uint)workingVector8.y << 16) & bitMask.w) | ((uint)workingVector8.x & ~bitMask.w);
      bitMask.w = ((~(-1 << 16)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector8.z << 0) & bitMask.w) | ((uint)0x00020000 & ~bitMask.w);
      workingVector8.xyz = (int3)workingVector8.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector11.xyz = (uint3)workingVector8.xyz >> int3(24,24,24);
      workingVector8.xyz = (int3)workingVector8.xyz ^ (int3)workingVector11.xyz;
      workingVector8.xyz = (int3)workingVector8.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector5.w = (int)workingVector8.x ^ 0x88b16480;
#endif
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector5.w = (int)workingVector12.y ^ (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = (int)workingVector8.y ^ (int)workingVector5.w;
#endif
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector5.w = (int)workingVector12.z ^ (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = (int)workingVector8.z ^ (int)workingVector5.w;
#endif
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector5.w = (int)workingVector5.w ^ 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = (int)workingVector5.w ^ 0x90210f61;
#endif
      workingVector6.w = (uint)workingVector5.w >> 13;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
      workingVector6.w = (uint)workingVector5.w >> 15;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector6.w = (uint)workingVector5.w >> 16;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector5.w = (int)workingVector5.w & 0x0000ffff;
      workingVector6.w = workingVector5.w ? 0 : 1;
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.w;
      workingVector6.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
      workingVector6.w = (int)workingVector6.w + -1;
      workingVector7.w = (int)workingVector5.w & (int)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.x = workingVector7.w;
      workingVector12.yzw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.x = workingVector7.w;
      workingVector8.yzw = float3(0,0,0);
#endif
      while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector12.y >= 8);
        if (workingVector8.w != 0) break;
        workingVector13.x = sampledResource7[workingVector12.x].val[0/4];
        workingVector13.y = sampledResource7[workingVector12.x].val[0/4+1];
        workingVector13.z = sampledResource7[workingVector12.x].val[0/4+2];
        workingVector13.w = sampledResource7[workingVector12.x].val[0/4+3];
        workingVector8.w = (int)workingVector13.z & 0x0000ffff;
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector8.w);
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector13.x);
        workingVector8.w = workingVector8.w ? workingVector10.w : 0;
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector13.y);
        workingVector8.w = workingVector8.w ? workingVector10.w : 0;
        workingVector10.w = workingVector8.w ? workingVector13.w : workingVector12.z;
        workingVector13.x = workingVector12.w ? workingVector12.z : workingVector10.w;
        workingVector13.y = (int)workingVector8.w | (int)workingVector12.w;
        workingVector8.w = (int)workingVector12.x + 1;
        workingVector12.x = (int)workingVector6.w & (int)workingVector8.w;
        workingVector8.w = (int)workingVector9.w | (int)workingVector13.y;
        if (workingVector8.w != 0) {
          workingVector12.zw = workingVector13.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.y >= 8);
        if (workingVector9.w != 0) break;
        workingVector11.x = sampledResource7[workingVector8.x].val[0/4];
        workingVector11.y = sampledResource7[workingVector8.x].val[0/4+1];
        workingVector11.z = sampledResource7[workingVector8.x].val[0/4+2];
        workingVector11.w = sampledResource7[workingVector8.x].val[0/4+3];
        workingVector9.w = (int)workingVector11.z & 0x0000ffff;
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector9.w);
        workingVector11.x = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector11.x);
        workingVector9.w = workingVector9.w ? workingVector11.x : 0;
        workingVector11.x = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector11.y);
        workingVector9.w = workingVector9.w ? workingVector11.x : 0;
        workingVector11.x = workingVector9.w ? workingVector11.w : workingVector8.z;
        workingVector11.x = workingVector8.w ? workingVector8.z : workingVector11.x;
        workingVector11.y = (int)workingVector8.w | (int)workingVector9.w;
        workingVector9.w = (int)workingVector8.x + 1;
        workingVector8.x = (int)workingVector6.w & (int)workingVector9.w;
        workingVector9.w = (int)workingVector10.w | (int)workingVector11.y;
        if (workingVector9.w != 0) {
          workingVector8.zw = workingVector11.xy;
#endif
          break;
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.y = (int)workingVector12.y + 1;
        workingVector12.zw = workingVector13.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.y = (int)workingVector8.y + 1;
        workingVector8.zw = workingVector11.xy;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      if (workingVector12.w != 0) {
        workingVector12.xyw = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
        workingVector12.xyw = floor(workingVector12.xyw);
        workingVector6.xyz = -workingVector12.xyw * float3(16,16,16) + workingVector6.xyz;
        workingVector2.w = (uint)workingVector12.z >> 2;
        workingVector13.xyz = RD_COMPARISON_MASK(abs(workingVector4.xyz) >= float3(1,1,1));
        workingVector4.w = (int)workingVector13.y | (int)workingVector13.x;
        workingVector4.w = (int)workingVector13.z | (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      if (workingVector8.w != 0) {
        workingVector8.xyw = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
        workingVector8.xyw = floor(workingVector8.xyw);
        workingVector6.xyz = -workingVector8.xyw * float3(16,16,16) + workingVector6.xyz;
        workingVector2.w = (uint)workingVector8.z >> 2;
        workingVector11.xyz = RD_COMPARISON_MASK(abs(workingVector4.xyz) >= float3(1,1,1));
        workingVector4.w = (int)workingVector11.y | (int)workingVector11.x;
        workingVector4.w = (int)workingVector11.z | (int)workingVector4.w;
#endif
        if (workingVector4.w != 0) {
          workingVector4.w = dot(workingVector6.xyz, abs(workingVector4.xyz));
          workingVector5.w = dot(workingVector6.yzx, abs(workingVector4.xyz));
          workingVector6.w = dot(workingVector6.zxy, abs(workingVector4.xyz));
          workingVector7.w = workingVector4.x + workingVector4.y;
          workingVector0.w = varyingNormal0.z * workingVector0.w + workingVector7.w;
          workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
          workingVector7.w = ceil(workingVector4.w);
          workingVector4.w = floor(workingVector4.w);
          workingVector0.w = workingVector0.w ? workingVector7.w : workingVector4.w;
          workingVector4.w = floor(workingVector5.w);
          workingVector7.w = floor(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = abs(workingVector4.zxy) * workingVector4.www;
          workingVector13.xyz = abs(workingVector4.xyz) * workingVector0.www + workingVector13.xyz;
          workingVector13.xyz = abs(workingVector4.yzx) * workingVector7.www + workingVector13.xyz;
          workingVector14.xyz = workingVector13.xyz + abs(workingVector4.zxy);
          workingVector15.xyz = workingVector13.xyz + abs(workingVector4.yzx);
          workingVector16.xyz = workingVector14.xyz + abs(workingVector4.yzx);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector11.xyz = abs(workingVector4.zxy) * workingVector4.www;
          workingVector11.xyz = abs(workingVector4.xyz) * workingVector0.www + workingVector11.xyz;
          workingVector11.xyz = abs(workingVector4.yzx) * workingVector7.www + workingVector11.xyz;
          workingVector12.xyz = workingVector11.xyz + abs(workingVector4.zxy);
          workingVector15.xyz = workingVector11.xyz + abs(workingVector4.yzx);
          workingVector16.xyz = workingVector12.xyz + abs(workingVector4.yzx);
#endif
          workingVector0.w = workingVector5.w + -workingVector4.w;
          workingVector4.w = -workingVector7.w + workingVector6.w;
          workingVector5.w = 1 + -workingVector0.w;
          workingVector6.w = 1 + -workingVector4.w;
          workingVector7.w = workingVector6.w * workingVector5.w;
          workingVector6.w = workingVector6.w * workingVector0.w;
          workingVector5.w = workingVector5.w * workingVector4.w;
          workingVector0.w = workingVector4.w * workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(0,0,0));
#endif
          workingVector4.w = workingVector17.y ? workingVector17.x : 0;
          workingVector4.w = workingVector17.z ? workingVector4.w : 0;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(16,16,16));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector8.w = workingVector17.y ? workingVector17.x : 0;
          workingVector8.w = workingVector17.z ? workingVector8.w : 0;
          workingVector4.w = (int)workingVector4.w & (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector8.z = workingVector17.y ? workingVector17.x : 0;
          workingVector8.z = workingVector17.z ? workingVector8.z : 0;
          workingVector4.w = (int)workingVector4.w & (int)workingVector8.z;
#endif
          if (workingVector4.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector17.xyz = (uint3)workingVector13.xyz;
            workingVector18.xyz = (uint3)workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector17.xyz = (uint3)workingVector11.xyz;
            workingVector18.xyz = (uint3)workingVector12.xyz;
#endif
            workingVector19.xyz = (uint3)workingVector15.xyz;
            workingVector20.xyz = (uint3)workingVector16.xyz;
            workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
            workingVector4.w = (int)workingVector17.x + (int)workingVector17.y;
            workingVector4.w = (int)workingVector17.z + (int)workingVector4.w;
            workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
            workingVector17.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector17.yzw = workingVector21.xyz * workingVector21.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector4.w = (int)workingVector18.x + (int)workingVector18.y;
            workingVector4.w = (int)workingVector18.z + (int)workingVector4.w;
            workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
            workingVector18.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector18.yzw = workingVector21.xyz * workingVector21.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector4.w = (int)workingVector19.x + (int)workingVector19.y;
            workingVector4.w = (int)workingVector19.z + (int)workingVector4.w;
            workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
            workingVector19.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector19.yzw = workingVector21.xyz * workingVector21.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector4.w = (int)workingVector20.x + (int)workingVector20.y;
            workingVector4.w = (int)workingVector20.z + (int)workingVector4.w;
            workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
            workingVector20.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector20.yzw = workingVector21.xyz * workingVector21.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
          } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector21.xyz = workingVector12.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector21.xyz = workingVector8.xyw * float3(16,16,16) + workingVector11.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector11.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector22.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector22.x;
            workingVector4.w = (int)workingVector23.y + (int)workingVector4.w;
            workingVector4.w = (int)workingVector22.y + (int)workingVector4.w;
            workingVector4.w = (int)workingVector23.z + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector9.w = (int)workingVector13.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector11.xyz = (uint3)workingVector11.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
            workingVector9.w = (int)workingVector11.z + (int)workingVector9.w;
#endif
            workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xy = (int2)workingVector2.ww + int2(4096,4097);
            workingVector10.w = sampledResource8[workingVector13.x].val[0/4];
            workingVector11.w = 1 << (int)icb[workingVector4.w+4].x;
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector4.w = (int)workingVector13.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.xy = (int2)workingVector2.ww + int2(4096,4097);
            workingVector10.w = sampledResource8[workingVector11.x].val[0/4];
            workingVector11.x = 1 << (int)icb[workingVector4.w+4].x;
            workingVector11.x = workingVector10.w ? workingVector11.x : 0;
            workingVector11.x = RD_COMPARISON_MASK((int)workingVector11.x == 0);
            workingVector4.w = (int)workingVector11.y + (int)icb[workingVector4.w+4].x;
#endif
            workingVector4.w = sampledResource8[workingVector4.w].val[0/4];
            workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xzw = float3(0.0625,0.0625,0.0625) * workingVector21.xyz;
            workingVector13.xzw = floor(workingVector13.xzw);
            workingVector13.xzw = -workingVector13.xzw * float3(16,16,16) + workingVector21.xyz;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector4.w = (int)workingVector4.w + (int)workingVector12.z;
            workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector22.xyz = float3(0.0625,0.0625,0.0625) * workingVector21.xyz;
            workingVector22.xyz = floor(workingVector22.xyz);
            workingVector21.xyz = -workingVector22.xyz * float3(16,16,16) + workingVector21.xyz;
            workingVector21.xyz = (uint3)workingVector21.xyz;
            bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.z = (((uint)workingVector21.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector21.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.z = (((uint)workingVector21.y << 0) & bitMask.z) | ((uint)workingVector11.z & ~bitMask.z);
            workingVector11.z = (int)workingVector11.w + (int)workingVector11.z;
            workingVector4.w = (int)workingVector4.w + (int)workingVector11.z;
            workingVector4.w = workingVector8.z ? workingVector9.w : workingVector4.w;
            workingVector8.z = workingVector8.z ? 0 : workingVector11.x;
#endif
            workingVector21.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xzw = workingVector22.xyz * workingVector22.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector21.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.xzw = workingVector22.xyz * workingVector22.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector21.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector8.zzz ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector8.xyw * float3(16,16,16) + workingVector12.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector21.x;
            workingVector4.w = (int)workingVector22.y + (int)workingVector4.w;
            workingVector4.w = (int)workingVector21.y + (int)workingVector4.w;
            workingVector4.w = (int)workingVector22.z + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.z + (int)workingVector9.w;
#endif
            workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = 1 << (int)icb[workingVector4.w+4].x;
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector4.w = (int)workingVector13.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.x = 1 << (int)icb[workingVector4.w+4].x;
            workingVector12.x = workingVector10.w ? workingVector12.x : 0;
            workingVector12.x = RD_COMPARISON_MASK((int)workingVector12.x == 0);
            workingVector4.w = (int)workingVector11.y + (int)icb[workingVector4.w+4].x;
#endif
            workingVector4.w = sampledResource8[workingVector4.w].val[0/4];
            workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xzw = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector4.w = (int)workingVector4.w + (int)workingVector12.z;
            workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector14.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.yzw = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.yzw = floor(workingVector12.yzw);
            workingVector11.xzw = -workingVector12.yzw * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xzw = (uint3)workingVector11.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.w + (int)workingVector11.x;
            workingVector4.w = (int)workingVector4.w + (int)workingVector11.x;
            workingVector4.w = workingVector8.z ? workingVector9.w : workingVector4.w;
            workingVector8.z = workingVector8.z ? 0 : workingVector12.x;
            workingVector12.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector21.xyzw = workingVector12.xyzw ? float4(0,0,0,0) : 0;
#endif
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xzw = workingVector21.xyz * workingVector21.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector14.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.xzw = workingVector21.xyz * workingVector21.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector12.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.zzz ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector8.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector12.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
#endif
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector14.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector12.y = (((uint)workingVector12.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector12.x;
#endif
            workingVector4.w = (int)workingVector21.y + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = (int)workingVector14.y + (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = (int)workingVector12.y + (int)workingVector4.w;
#endif
            workingVector4.w = (int)workingVector21.z + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector14.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.z + (int)workingVector9.w;
#endif
            workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = 1 << (int)icb[workingVector4.w+4].x;
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector4.w = (int)workingVector13.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.x = 1 << (int)icb[workingVector4.w+4].x;
            workingVector12.x = workingVector10.w ? workingVector12.x : 0;
            workingVector12.x = RD_COMPARISON_MASK((int)workingVector12.x == 0);
            workingVector4.w = (int)workingVector11.y + (int)icb[workingVector4.w+4].x;
#endif
            workingVector4.w = sampledResource8[workingVector4.w].val[0/4];
            workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xzw = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector4.w = (int)workingVector4.w + (int)workingVector12.z;
            workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector14.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector15.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.yzw = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.yzw = floor(workingVector12.yzw);
            workingVector11.xzw = -workingVector12.yzw * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xzw = (uint3)workingVector11.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.w + (int)workingVector11.x;
            workingVector4.w = (int)workingVector4.w + (int)workingVector11.x;
            workingVector4.w = workingVector8.z ? workingVector9.w : workingVector4.w;
            workingVector8.z = workingVector8.z ? 0 : workingVector12.x;
            workingVector12.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector15.xyzw = workingVector12.xyzw ? float4(0,0,0,0) : 0;
#endif
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xzw = workingVector15.xyz * workingVector15.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector14.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.xzw = workingVector15.xyz * workingVector15.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector12.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector8.zzz ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector8.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector12.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#endif
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector14.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector12.y = (((uint)workingVector12.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector4.w = (int)workingVector4.w + (int)workingVector12.x;
#endif
            workingVector4.w = (int)workingVector15.y + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = (int)workingVector14.y + (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = (int)workingVector12.y + (int)workingVector4.w;
#endif
            workingVector4.w = (int)workingVector15.z + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector14.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.z + (int)workingVector9.w;
#endif
            workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = 1 << (int)icb[workingVector4.w+4].x;
            workingVector10.w = (int)workingVector10.w & (int)workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.x = 1 << (int)icb[workingVector4.w+4].x;
            workingVector10.w = workingVector10.w ? workingVector12.x : 0;
#endif
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = (int)workingVector13.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = (int)workingVector11.y + (int)icb[workingVector4.w+4].x;
#endif
            workingVector4.w = sampledResource8[workingVector4.w].val[0/4];
            workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector11.w = (int)workingVector13.z + (int)workingVector11.w;
            workingVector4.w = (int)workingVector4.w + (int)workingVector11.w;
            workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
            workingVector8.w = workingVector8.w ? 0 : workingVector10.w;
            workingVector13.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
            workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
            workingVector14.xyzw = (uint4)workingVector14.xyzw;
            workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
            workingVector13.yzw = workingVector14.xyz * workingVector14.www;
            workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
            workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
            workingVector20.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector11.xyz = -workingVector12.xyz * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xyz = (uint3)workingVector11.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.y << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.z + (int)workingVector11.x;
            workingVector4.w = (int)workingVector4.w + (int)workingVector11.x;
            workingVector4.w = workingVector8.z ? workingVector9.w : workingVector4.w;
            workingVector8.z = workingVector8.z ? 0 : workingVector10.w;
            workingVector11.x = sampledResource8[workingVector4.w].val[0/4];
            workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
            workingVector12.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
            workingVector12.xyzw = (uint4)workingVector12.xyzw;
            workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
            workingVector11.yzw = workingVector12.xyz * workingVector12.www;
            workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
            workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
            workingVector20.xyz = workingVector8.zzz ? float3(0,0,0) : workingVector11.xyz;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = workingVector18.xyz * workingVector6.www;
          workingVector13.xyz = workingVector17.xyz * workingVector7.www + workingVector13.xyz;
          workingVector13.xyz = workingVector19.xyz * workingVector5.www + workingVector13.xyz;
          workingVector13.xyz = workingVector20.xyz * workingVector0.www + workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector11.xyz = workingVector18.xyz * workingVector6.www;
          workingVector11.xyz = workingVector17.xyz * workingVector7.www + workingVector11.xyz;
          workingVector11.xyz = workingVector19.xyz * workingVector5.www + workingVector11.xyz;
          workingVector11.xyz = workingVector20.xyz * workingVector0.www + workingVector11.xyz;
#endif
        } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyz = floor(workingVector6.xyz);
          workingVector6.xyz = -workingVector14.xyz + workingVector6.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = floor(workingVector6.xyz);
          workingVector6.xyz = -workingVector12.xyz + workingVector6.xyz;
#endif
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector6.xyx >= workingVector6.yzz);
          bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector15.x << 0) & bitMask.w) | ((uint)workingVector15.y & ~bitMask.w);
          workingVector0.w = (int)workingVector15.z + (int)workingVector0.w;
          workingVector4.w = min(workingVector6.x, workingVector6.y);
          workingVector5.w = max(workingVector6.x, workingVector6.y);
          workingVector6.x = min(workingVector4.w, workingVector6.z);
          workingVector6.y = max(workingVector5.w, workingVector6.z);
          workingVector5.w = min(workingVector5.w, workingVector6.z);
          workingVector4.w = max(workingVector5.w, workingVector4.w);
          workingVector5.w = 1 + -workingVector6.y;
          workingVector6.y = workingVector6.y + -workingVector4.w;
          workingVector4.w = workingVector4.w + -workingVector6.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(0,0,0));
#endif
          workingVector6.z = workingVector15.y ? workingVector15.x : 0;
          workingVector6.z = workingVector15.z ? workingVector6.z : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector15.xyz = float3(1,1,1) + workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xyz = float3(1,1,1) + workingVector12.xyz;
#endif
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(16,16,16));
          workingVector6.w = workingVector16.y ? workingVector16.x : 0;
          workingVector6.w = workingVector16.z ? workingVector6.w : 0;
          workingVector6.z = (int)workingVector6.w & (int)workingVector6.z;
          if (workingVector6.z != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector16.xyz = (uint3)workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector16.xyz = (uint3)workingVector12.xyz;
#endif
            workingVector6.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector17.xz = workingVector6.zw ? float2(0,0) : 0;
            workingVector17.yw = icb[workingVector0.w+4].yz;
            workingVector18.xyz = (int3)workingVector16.xyz + (int3)workingVector17.ywx;
            workingVector17.xy = icb[workingVector0.w+12].yz;
            workingVector17.xyz = (int3)workingVector16.xyz + (int3)workingVector17.xyz;
            workingVector19.xyz = (int3)workingVector16.xyz + int3(1,1,1);
            workingVector6.zw = (uint2)workingVector16.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector16.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector2.w + (int)workingVector6.z;
            workingVector16.x = sampledResource8[workingVector6.z].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector16.yzw = workingVector20.xyz * workingVector20.www;
            workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
            workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector18.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector18.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector2.w + (int)workingVector6.z;
            workingVector18.x = sampledResource8[workingVector6.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector18.yzw = workingVector20.xyz * workingVector20.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector17.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector17.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector2.w + (int)workingVector6.z;
            workingVector17.x = sampledResource8[workingVector6.z].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector17.yzw = workingVector20.xyz * workingVector20.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector19.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector19.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector2.w + (int)workingVector6.z;
            workingVector19.x = sampledResource8[workingVector6.z].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector19.yzw = workingVector20.xyz * workingVector20.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
          } else {
            workingVector6.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector6.zw = workingVector6.zw ? float2(0,0) : 0;
            workingVector20.xy = (uint2)icb[workingVector0.w+4].yz;
            workingVector20.z = (uint)workingVector6.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xyz = workingVector20.xyz + workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = workingVector20.xyz + workingVector12.xyz;
#endif
            workingVector21.xy = (uint2)icb[workingVector0.w+12].yz;
            workingVector21.z = (uint)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector21.xyz = workingVector21.xyz + workingVector14.xyz;
            workingVector22.xyz = workingVector12.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector21.xyz = workingVector21.xyz + workingVector12.xyz;
            workingVector22.xyz = workingVector8.xyw * float3(16,16,16) + workingVector12.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector23.x << 0) & bitMask.w) | ((uint)workingVector24.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector23.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector23.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector24.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector24.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector6.w = (int)workingVector14.z + (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector6.w = (int)workingVector12.z + (int)workingVector6.w;
#endif
            workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xy = (int2)workingVector2.ww + int2(4096,4097);
            workingVector7.w = sampledResource8[workingVector14.x].val[0/4];
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xy = (int2)workingVector2.ww + int2(4096,4097);
            workingVector7.w = sampledResource8[workingVector12.x].val[0/4];
            workingVector8.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.z = (int)workingVector7.w & (int)workingVector8.z;
            workingVector8.z = RD_COMPARISON_MASK((int)workingVector8.z == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource8[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector14.xzw = floor(workingVector14.xzw);
            workingVector14.xzw = -workingVector14.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector12.xzw = floor(workingVector12.xzw);
            workingVector12.xzw = -workingVector12.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.w + (int)workingVector9.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector6.z = workingVector6.z ? 0 : workingVector8.z;
#endif
            workingVector22.x = sampledResource8[workingVector0.w].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector23.xyz * workingVector23.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector22.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector12.xyw * float3(16,16,16) + workingVector20.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector23.xyz * workingVector23.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector22.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector8.xyw * float3(16,16,16) + workingVector20.xyz;
#endif
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector20.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector20.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector22.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector22.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector22.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector23.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector23.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector20.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector6.w = (int)workingVector20.z + (int)workingVector6.w;
            workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.z = (int)workingVector7.w & (int)workingVector8.z;
            workingVector8.z = RD_COMPARISON_MASK((int)workingVector8.z == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource8[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
#endif
            workingVector20.xyz = floor(workingVector20.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.w + (int)workingVector9.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector6.z = workingVector6.z ? 0 : workingVector8.z;
#endif
            workingVector20.x = sampledResource8[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector22.xyz * workingVector22.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector20.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector12.xyw * float3(16,16,16) + workingVector21.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector22.xyz * workingVector22.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector20.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector8.xyw * float3(16,16,16) + workingVector21.xyz;
#endif
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector21.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector21.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector20.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector22.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector21.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector6.w = (int)workingVector20.z + (int)workingVector6.w;
            workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.z = (int)workingVector7.w & (int)workingVector8.z;
            workingVector8.z = RD_COMPARISON_MASK((int)workingVector8.z == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource8[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
#endif
            workingVector20.xyz = floor(workingVector20.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector9.w = (int)workingVector12.w + (int)workingVector9.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector6.z = workingVector6.z ? 0 : workingVector8.z;
#endif
            workingVector20.x = sampledResource8[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector21.xyz * workingVector21.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector20.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector12.xyz = workingVector12.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector14.xzw = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector21.xyz * workingVector21.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector20.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector8.xyz = workingVector8.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector12.xzw = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
#endif
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector14.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector12.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector12.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector20.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector20.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector6.w = (int)workingVector14.w + (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector6.w = (int)workingVector12.w + (int)workingVector6.w;
#endif
            workingVector2.w = (int)workingVector2.w + (int)workingVector6.w;
            workingVector6.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector6.w = (int)workingVector6.w & (int)workingVector7.w;
            workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource8[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xyz;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector12.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector12.xyz;
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector7.w = (int)workingVector12.z + (int)workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector8.xyz = -workingVector12.xyz * float3(16,16,16) + workingVector8.xyz;
            workingVector8.xyz = (uint3)workingVector8.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector8.y << 0) & bitMask.w) | ((uint)workingVector8.x & ~bitMask.w);
            workingVector7.w = (int)workingVector8.z + (int)workingVector7.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector0.w = workingVector6.z ? workingVector2.w : workingVector0.w;
            workingVector2.w = workingVector6.z ? 0 : workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.x = sampledResource8[workingVector0.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector14.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
            workingVector14.xyzw = (uint4)workingVector14.xyzw;
            workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
            workingVector12.yzw = workingVector14.xyz * workingVector14.www;
            workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
            workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
            workingVector19.xyz = workingVector2.www ? float3(0,0,0) : workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.x = sampledResource8[workingVector0.w].val[0/4];
            workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
            workingVector12.xyzw = (int4)workingVector8.xyzw & int4(255,255,255,255);
            workingVector12.xyzw = (uint4)workingVector12.xyzw;
            workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
            workingVector8.yzw = workingVector12.xyz * workingVector12.www;
            workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
            workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
            workingVector19.xyz = workingVector2.www ? float3(0,0,0) : workingVector8.xyz;
#endif
          }
          workingVector6.yzw = workingVector18.xyz * workingVector6.yyy;
          workingVector6.yzw = workingVector16.xyz * workingVector5.www + workingVector6.yzw;
          workingVector6.yzw = workingVector17.xyz * workingVector4.www + workingVector6.yzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = workingVector19.xyz * workingVector6.xxx + workingVector6.yzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector11.xyz = workingVector19.xyz * workingVector6.xxx + workingVector6.yzw;
#endif
        }
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = float3(0,0,0);
#endif
      }
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector13.xyz = workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = workingVector10.xyz;
#endif
    }
    workingVector6.xyz = workingVector1.www * workingVector0.xyz;
    workingVector0.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
    workingVector1.w = workingVector0.w * workingVector0.w;
    workingVector1.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector1.w;
    workingVector0.w = workingVector0.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector1.w;
    workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector1.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector12.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector12.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector12.xyz;
    workingVector12.xyz = workingVector13.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector12.xyz;
    workingVector13.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector12.xyz = max(workingVector13.xyz, workingVector12.xyz);
    workingVector6.xyz = workingVector12.xyz * workingVector6.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector8.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
    workingVector8.xyz = workingVector11.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector8.xyz;
    workingVector11.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector8.xyz = max(workingVector11.xyz, workingVector8.xyz);
    workingVector6.xyz = workingVector8.xyz * workingVector6.xyz;
#endif
    workingVector6.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector6.xyz;
    workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector12.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector12.xyz + workingVector0.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector8.xyz + workingVector0.xyz;
#endif
    workingVector0.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector0.xyz;
    workingVector0.xyz = varyingTexCoord8.yyy * workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector0.xyz;
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = float3(0,0,0);
    workingVector10.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector14.xyz = float3(0,0,0);
    workingVector13.xyz = float3(0,0,0);
#endif
    workingVector6.xyz = float3(0,0,0);
    workingVector0.xyz = float3(0,0,0);
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector6.xyz = workingVector6.xyz + workingVector11.xyz;
  workingVector6.xyz = workingVector6.xyz + workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector6.xyz = workingVector6.xyz + workingVector14.xyz;
  workingVector6.xyz = workingVector6.xyz + workingVector13.xyz;
#endif
  workingVector0.xyz = workingVector6.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector6.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
#endif
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.w != 0) {
    workingVector4.w = workingVector3.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector4.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector4.w;
    workingVector4.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector4.w;
    workingVector4.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector4.w);
    workingVector5.w = RD_COMPARISON_MASK(0 < workingVector4.w);
    if (workingVector5.w != 0) {
      workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector5.w != 0) {
        workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector5.w = workingVector0.w ? workingVector5.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector10.xyz = max(workingVector10.xyz, workingVector6.xyz);
        workingVector10.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector10.xyz;
        workingVector10.xyz = workingVector5.www ? workingVector10.xyz : 0;
        workingVector10.xyz = max(float3(1,1,1), workingVector10.xyz);
        workingVector10.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector6.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector8.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector6.xyz = max(workingVector8.xyz, workingVector6.xyz);
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector5.www ? workingVector6.xyz : 0;
        workingVector6.xyz = max(float3(1,1,1), workingVector6.xyz);
        workingVector6.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector6.xyz;
#endif
      } else {
        workingVector5.w = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector5.w = rsqrt(workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = workingVector5.www * workingVector2.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.xyz = workingVector5.www * workingVector2.xyz;
#endif
        workingVector2.xz = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector13.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector12.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
#endif
        workingVector2.z = workingVector2.z + -workingVector2.x;
        workingVector2.y = workingVector2.y * workingVector5.w + -workingVector2.x;
        workingVector2.z = 1 / workingVector2.z;
        workingVector2.z = saturate(workingVector2.y * workingVector2.z);
        workingVector5.w = workingVector2.z * -2 + 3;
        workingVector2.z = workingVector2.z * workingVector2.z;
        workingVector2.z = -workingVector5.w * workingVector2.z + 1;
        workingVector5.w = workingVector2.z * workingVector2.z;
        workingVector2.z = workingVector5.w * workingVector2.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = dot(workingVector11.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector6.w = dot(workingVector11.xyz, RD_UNIFORM_MOON_DIR.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = dot(workingVector8.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector6.w = dot(workingVector8.xyz, RD_UNIFORM_MOON_DIR.xyz);
#endif
        workingVector7.w = workingVector5.w * workingVector5.w + 1;
        workingVector7.w = RD_UNIFORM_SUN_COLOR.w * workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector8.w = workingVector6.w * workingVector6.w + 1;
        workingVector8.w = RD_UNIFORM_MOON_COLOR.w * workingVector8.w;
        workingVector8.w = 0.75 * workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.x = workingVector6.w * workingVector6.w + 1;
        workingVector8.x = RD_UNIFORM_MOON_COLOR.w * workingVector8.x;
#endif
        workingVector2.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector2.x;
        workingVector2.x = 1 / workingVector2.x;
        workingVector2.x = saturate(workingVector2.y * workingVector2.x);
        workingVector2.y = workingVector2.x * -2 + 3;
        workingVector2.x = workingVector2.x * workingVector2.x;
        workingVector2.x = -workingVector2.y * workingVector2.x + 1;
        workingVector2.y = workingVector2.x * workingVector2.x;
        workingVector2.x = workingVector2.y * workingVector2.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector11.xyz = workingVector2.xxx * workingVector11.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector11.xyz;
        workingVector11.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector11.xyz;
        workingVector2.x = workingVector7.w * 0.75 + workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.yzw = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector8.yzw = workingVector2.xxx * workingVector8.yzw + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector8.yzw = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector8.yzw;
        workingVector8.xyzw = float4(0.75,0.0795774683,0.0795774683,0.0795774683) * workingVector8.xyzw;
        workingVector2.x = workingVector7.w * 0.75 + workingVector8.x;
#endif
        workingVector2.y = max(0, workingVector5.w);
        workingVector2.y = log2(workingVector2.y);
        workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
        workingVector2.y = exp2(workingVector2.y);
        workingVector2.y = min(1, workingVector2.y);
        workingVector5.w = max(0, workingVector6.w);
        workingVector5.w = log2(workingVector5.w);
        workingVector5.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector5.w;
        workingVector5.w = exp2(workingVector5.w);
        workingVector5.w = min(1, workingVector5.w);
        workingVector6.w = -workingVector2.y * 1.79999995 + 1.80999994;
        workingVector7.w = sqrt(workingVector6.w);
        workingVector6.w = workingVector7.w * workingVector6.w;
        workingVector6.w = 0.0361000001 / workingVector6.w;
        workingVector7.w = -workingVector5.w * 1.79999995 + 1.80999994;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector8.w = sqrt(workingVector7.w);
        workingVector7.w = workingVector8.w * workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.x = sqrt(workingVector7.w);
        workingVector7.w = workingVector8.x * workingVector7.w;
#endif
        workingVector7.w = 0.0361000001 / workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector12.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector2.yyy;
        workingVector13.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector13.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector5.www;
        workingVector13.xyz = workingVector13.xyz * workingVector7.www;
        workingVector14.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector2.zzz;
        workingVector14.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector14.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector6.www + workingVector13.xyz;
        workingVector12.xyz = workingVector14.xyz * workingVector12.xyz;
        workingVector2.xyz = workingVector11.xyz * workingVector2.xxx + workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector11.xyz;
        workingVector11.xyz = workingVector11.xyz * workingVector2.yyy;
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector12.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector5.www;
        workingVector12.xyz = workingVector12.xyz * workingVector7.www;
        workingVector13.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector2.zzz;
        workingVector13.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector13.xyz;
        workingVector11.xyz = workingVector11.xyz * workingVector6.www + workingVector12.xyz;
        workingVector11.xyz = workingVector13.xyz * workingVector11.xyz;
        workingVector2.xyz = workingVector8.yzw * workingVector2.xxx + workingVector11.xyz;
#endif
        workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector6.w = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector11.xyz = workingVector6.www * workingVector11.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector10.xyz = workingVector5.www ? workingVector11.xyz : workingVector2.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector8.xyz = workingVector6.www * workingVector8.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector6.xyz = workingVector5.www ? workingVector8.xyz : workingVector2.xyz;
#endif
      }
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.xyz = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.xyz = float3(0,0,0);
#endif
    workingVector4.w = 0;
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector2.xyz = workingVector10.xyz + -workingVector0.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector2.xyz = workingVector6.xyz + -workingVector0.xyz;
#endif
  workingVector0.xyz = workingVector4.www * workingVector2.xyz + workingVector0.xyz;
  if (workingVector2.w != 0) {
    workingVector2.xy = float2(1,1) + workingVector3.xy;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xy = float2(0.5,0.5) * workingVector2.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.xy = float2(0.5,0.5) * workingVector2.xy;
#endif
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector3.yy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector3.xx + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector3.zz + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
    workingVector2.x = -workingVector2.x / workingVector2.y;
    workingVector2.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector2.x;
    workingVector2.y = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector2.x = workingVector2.x / workingVector2.y;
    workingVector2.x = workingVector2.x * 53.5981483 + 1;
    workingVector2.x = log2(workingVector2.x);
    workingVector2.x = 0.173286796 * workingVector2.x;
    workingVector2.y = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector2.z = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector2.x = workingVector2.x * workingVector2.z + -0.5;
    workingVector2.z = (int)workingVector2.x;
    workingVector2.y = (int)workingVector2.y + -2;
    workingVector2.z = max(0, (int)workingVector2.z);
    workingVector2.y = min((int)workingVector2.z, (int)workingVector2.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.z = (int)workingVector2.y;
    workingVector2.x = saturate(-workingVector10.z + workingVector2.x);
    workingVector11.xyzw = materialTexture4.SampleLevel(textureSampler4, workingVector10.xyz, 0).xyzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.z = (int)workingVector2.y;
    workingVector2.x = saturate(-workingVector6.z + workingVector2.x);
    workingVector8.xyzw = materialTexture4.SampleLevel(textureSampler4, workingVector6.xyz, 0).xyzw;
#endif
    workingVector2.y = (int)workingVector2.y + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.w = (int)workingVector2.y;
    workingVector10.xyzw = materialTexture4.SampleLevel(textureSampler4, workingVector10.xyw, 0).xyzw;
    workingVector10.xyzw = workingVector10.xyzw + -workingVector11.xyzw;
    workingVector10.xyzw = workingVector2.xxxx * workingVector10.xyzw + workingVector11.xyzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.w = (int)workingVector2.y;
    workingVector6.xyzw = materialTexture4.SampleLevel(textureSampler4, workingVector6.xyw, 0).xyzw;
    workingVector6.xyzw = workingVector6.xyzw + -workingVector8.xyzw;
    workingVector6.xyzw = workingVector2.xxxx * workingVector6.xyzw + workingVector8.xyzw;
#endif
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xyzw = float4(0,0,0,1);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.xyzw = float4(0,0,0,1);
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.xyz = workingVector10.www * workingVector0.xyz + workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector0.xyz = workingVector6.www * workingVector0.xyz + workingVector6.xyz;
#endif
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector2.x != 0) {
    workingVector2.x = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.x = max(1, workingVector2.x);
    workingVector2.y = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.x = saturate(workingVector2.y / workingVector2.x);
    workingVector2.y = workingVector2.x * workingVector2.x;
    workingVector2.x = workingVector2.y * workingVector2.x;
    workingVector2.x = RD_UNIFORM_IBL_PARAMETERS.x * workingVector2.x;
    workingVector2.y = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector2.z = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector4.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector7.yyy;
    workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector7.xxx + workingVector10.xyz;
    workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector7.zzz + workingVector10.xyz;
    workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector10.xyz;
    workingVector11.xyz = workingVector4.www ? workingVector7.xyz : varyingTexCoord3.xyz;
    workingVector10.xyz = workingVector4.www ? workingVector10.xyz : workingVector1.xyz;
    workingVector11.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector11.xyz;
    workingVector4.w = dot(workingVector11.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector7.yyy;
    workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector7.xxx + workingVector6.xyz;
    workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector7.zzz + workingVector6.xyz;
    workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector6.xyz;
    workingVector8.xyz = workingVector4.www ? workingVector7.xyz : varyingTexCoord3.xyz;
    workingVector6.xyz = workingVector4.www ? workingVector6.xyz : workingVector1.xyz;
    workingVector8.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector8.xyz;
    workingVector4.w = dot(workingVector8.xyz, workingVector8.xyz);
#endif
    workingVector4.w = rsqrt(workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = workingVector11.xyz * workingVector4.www;
    workingVector4.w = dot(workingVector10.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = workingVector8.xyz * workingVector4.www;
    workingVector4.w = dot(workingVector6.xyz, workingVector6.xyz);
#endif
    workingVector4.w = rsqrt(workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector10.xyz = workingVector10.xyz * workingVector4.www;
    workingVector4.w = dot(workingVector11.xyz, workingVector4.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.xyz = workingVector6.xyz * workingVector4.www;
    workingVector4.w = dot(workingVector8.xyz, workingVector4.xyz);
#endif
    workingVector4.w = workingVector4.w + workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = workingVector4.xyz * -workingVector4.www + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector4.xyz = workingVector4.xyz * -workingVector4.www + workingVector8.xyz;
#endif
    workingVector2.z = RD_COMPARISON_MASK((int)workingVector2.z == 1);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xz = float2(1,1) + -varyingTexCoord8.zz;
    workingVector5.w = workingVector11.x * workingVector11.x;
    workingVector6.w = -workingVector11.x * workingVector11.x + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xz = float2(1,1) + -varyingTexCoord8.zz;
    workingVector5.w = workingVector8.x * workingVector8.x;
    workingVector6.w = -workingVector8.x * workingVector8.x + 1;
#endif
    workingVector7.w = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector6.w = workingVector7.w * workingVector6.w;
    workingVector5.w = workingVector5.w * workingVector5.w;
    workingVector5.w = -workingVector5.w * workingVector5.w + 1;
    workingVector5.w = workingVector5.w * workingVector7.w;
    workingVector2.z = workingVector2.z ? workingVector6.w : workingVector5.w;
    workingVector5.w = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector5.w = (int)workingVector5.w + 2;
    workingVector6.w = (int)workingVector5.w & 0x80000000;
    workingVector5.w = max((int)-workingVector5.w, (int)workingVector5.w);
    workingVector5.w = (uint)workingVector5.w % 3;
    workingVector7.w = -(int)workingVector5.w;
    workingVector5.w = workingVector6.w ? workingVector7.w : workingVector5.w;
    workingVector4.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector12.xyz = materialTexture6.SampleLevel(textureSampler6, workingVector4.xyzw, workingVector2.z).xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector11.xyz = materialTexture6.SampleLevel(textureSampler6, workingVector4.xyzw, workingVector2.z).xyz;
#endif
    workingVector4.w = (int)workingVector5.w;
    workingVector4.xyz = materialTexture6.SampleLevel(textureSampler6, workingVector4.xyzw, workingVector2.z).xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector12.xyz = workingVector12.xyz + -workingVector4.xyz;
    workingVector4.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector12.xyz + workingVector4.xyz;
    workingVector12.xyz = float3(301.724121,301.724121,301.724121) * workingVector4.xyz;
    workingVector4.xyz = workingVector2.yyy ? workingVector12.xyz : workingVector4.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector11.xyz = workingVector11.xyz + -workingVector4.xyz;
    workingVector4.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector11.xyz + workingVector4.xyz;
    workingVector11.xyz = float3(301.724121,301.724121,301.724121) * workingVector4.xyz;
    workingVector4.xyz = workingVector2.yyy ? workingVector11.xyz : workingVector4.xyz;
#endif
    workingVector2.xyz = workingVector4.xyz * workingVector2.xxx;
    workingVector2.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector2.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
    workingVector12.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector4.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector11.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector10.xyz;
    workingVector12.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz;
#endif
    workingVector4.w = saturate(dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz + -workingVector6.xyz;
    workingVector4.xyz = workingVector4.www * workingVector4.xyz + workingVector6.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector11.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz + -workingVector4.xyz;
    workingVector4.xyz = workingVector4.www * workingVector11.xyz + workingVector4.xyz;
#endif
    workingVector4.xyz = varyingTexCoord8.xxx * workingVector4.xyz;
    workingVector4.w = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector5.w = dot(workingVector4.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.w = RD_COMPARISON_MASK(workingVector4.w < workingVector5.w);
    workingVector4.xyz = workingVector4.www ? workingVector4.xyz : 0;
    workingVector4.xyz = workingVector4.www ? workingVector4.xyz : workingVector2.xyz;
    workingVector2.xyz = workingVector0.www ? workingVector4.xyz : workingVector2.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.y = saturate(dot(workingVector5.xyz, -workingVector10.xyz));
    workingVector4.xy = materialTexture0.Sample(textureSampler0, workingVector11.yz).xy;
    workingVector4.xyz = workingVector8.xyz * workingVector4.xxx + workingVector4.yyy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.y = saturate(dot(workingVector5.xyz, -workingVector6.xyz));
    workingVector4.xy = materialTexture0.Sample(textureSampler0, workingVector8.yz).xy;
    workingVector4.xyz = workingVector9.xyz * workingVector4.xxx + workingVector4.yyy;
#endif
    workingVector2.xyz = workingVector4.xyz * workingVector2.xyz;
    workingVector3.w = workingVector3.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector3.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector3.w;
    workingVector3.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector3.w;
    workingVector4.x = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector3.w);
    workingVector4.x = 1 + -workingVector4.x;
    workingVector4.xyz = workingVector4.xxx * workingVector2.xyz;
    workingVector4.w = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector3.w = saturate(workingVector3.w / workingVector4.w);
    workingVector3.w = 1 + -workingVector3.w;
    workingVector2.xyz = workingVector3.www * workingVector2.xyz;
    workingVector2.xyz = workingVector1.www ? workingVector4.xyz : workingVector2.xyz;
    if (workingVector2.w != 0) {
      workingVector4.xy = float2(1,1) + workingVector3.xy;
      workingVector4.xy = float2(0.5,0.5) * workingVector4.xy;
      workingVector3.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector3.yy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector3.xx + workingVector3.yw;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector3.zz + workingVector3.xy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector3.xy;
      workingVector1.w = -workingVector3.x / workingVector3.y;
      workingVector1.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.w;
      workingVector2.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector1.w = workingVector1.w / workingVector2.w;
      workingVector1.w = workingVector1.w * 53.5981483 + 1;
      workingVector1.w = log2(workingVector1.w);
      workingVector1.w = 0.173286796 * workingVector1.w;
      workingVector2.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector3.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector1.w = workingVector1.w * workingVector3.x + -0.5;
      workingVector3.x = (int)workingVector1.w;
      workingVector2.w = (int)workingVector2.w + -2;
      workingVector3.x = max(0, (int)workingVector3.x);
      workingVector2.w = min((int)workingVector3.x, (int)workingVector2.w);
      workingVector4.z = (int)workingVector2.w;
      workingVector1.w = saturate(-workingVector4.z + workingVector1.w);
      workingVector3.x = materialTexture4.SampleLevel(textureSampler4, workingVector4.xyz, 0).w;
      workingVector2.w = (int)workingVector2.w + 1;
      workingVector4.w = (int)workingVector2.w;
      workingVector2.w = materialTexture4.SampleLevel(textureSampler4, workingVector4.xyw, 0).w;
      workingVector2.w = workingVector2.w + -workingVector3.x;
      workingVector1.w = workingVector1.w * workingVector2.w + workingVector3.x;
      workingVector2.xyz = workingVector1.www * workingVector2.xyz;
    }
  } else {
    if (workingVector0.w != 0) {
      workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector7.yyy;
      workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector7.xxx + workingVector3.xyz;
      workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector7.zzz + workingVector3.xyz;
      workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector3.xyz;
      workingVector1.xyz = workingVector0.www ? workingVector3.xyz : workingVector1.xyz;
      workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector1.xyz = workingVector1.xyz * workingVector0.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector3.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
      workingVector4.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector3.xyz;
      workingVector0.w = saturate(dot(workingVector4.xyz, float3(0.212599993,0.715200007,0.0722000003)));
      workingVector3.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector3.xyz + -workingVector6.xyz;
      workingVector3.xyz = workingVector0.www * workingVector3.xyz + workingVector6.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector3.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
      workingVector4.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector10.xyz;
      workingVector6.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz;
      workingVector0.w = saturate(dot(workingVector6.xyz, float3(0.212599993,0.715200007,0.0722000003)));
      workingVector4.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz + -workingVector3.xyz;
      workingVector3.xyz = workingVector0.www * workingVector4.xyz + workingVector3.xyz;
#endif
      workingVector3.xyz = varyingTexCoord8.xxx * workingVector3.xyz;
      workingVector0.w = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
      workingVector3.xyz = workingVector0.www ? workingVector3.xyz : 0;
      workingVector1.x = saturate(dot(workingVector5.xyz, -workingVector1.xyz));
      workingVector1.y = 1 + -varyingTexCoord8.z;
      workingVector1.xy = materialTexture0.Sample(textureSampler0, workingVector1.xy).xy;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector1.xyz = workingVector8.xyz * workingVector1.xxx + workingVector1.yyy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector1.xyz = workingVector9.xyz * workingVector1.xxx + workingVector1.yyy;
#endif
      workingVector2.xyz = workingVector3.xyz * workingVector1.xyz;
    } else {
      workingVector2.xyz = float3(0,0,0);
    }
  }
  workingVector0.xyz = workingVector2.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture2.Sample(textureSampler2, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    fragmentColor0.xyz = workingVector0.xyz * workingVector0.www;
  } else {
    fragmentColor0.xyz = workingVector0.xyz;
  }
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float productValue = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f;
    float productValue1 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue2 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f;
    float productValue3 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * varyingColor0.w) + productValue2;
    float productValue6 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3;
    float productValue7 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4;
    float productValue8 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue313 = productValue * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue314 = productValue * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue315 = productValue * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue112 = ceil(productValue1);
    float productValue316 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue313) * scalarValue112) + productValue313;
    float productValue317 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue314) * scalarValue112) + productValue314;
    float productValue318 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue315) * scalarValue112) + productValue315;
    float productValue319 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue316) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue316;
    float productValue320 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue317) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue317;
    float productValue321 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue318) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue318;
#endif
    uint comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue9 = floor(quotientValue1 * 0.25f);
        float productValue10 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = uint(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue10 * productValue10) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue9 * productValue9) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f))));
    }
    else
    {
        comparisonValue = 0u;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        exponentialValue = exp2(log2(max(productValue6, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue7, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue8, 0.0f)) * 2.2000000476837158203125f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = exp2(log2(max(productValue319, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue320, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue321, 0.0f)) * 2.2000000476837158203125f);
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        exponentialValue = (productValue6 <= 0.040449999272823333740234375f) ? (productValue6 * 0.077399380505084991455078125f) : exp2(log2((productValue6 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue7 <= 0.040449999272823333740234375f) ? (productValue7 * 0.077399380505084991455078125f) : exp2(log2((productValue7 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue8 <= 0.040449999272823333740234375f) ? (productValue8 * 0.077399380505084991455078125f) : exp2(log2((productValue8 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = (productValue319 <= 0.040449999272823333740234375f) ? (productValue319 * 0.077399380505084991455078125f) : exp2(log2((productValue319 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue320 <= 0.040449999272823333740234375f) ? (productValue320 * 0.077399380505084991455078125f) : exp2(log2((productValue320 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue321 <= 0.040449999272823333740234375f) ? (productValue321 * 0.077399380505084991455078125f) : exp2(log2((productValue321 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#endif
    }
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)));
    float multiplyAddValue8 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue9 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue8;
    float multiplyAddValue10 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue8;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue8;
    float inverseLengthValue1 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue11 = inverseLengthValue1 * varyingNormal0.x;
    float productValue12 = inverseLengthValue1 * varyingNormal0.y;
    float productValue13 = inverseLengthValue1 * varyingNormal0.z;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue12, productValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue12, productValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue13, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue12, productValue11 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue3 = (-0.0f) - multiplyAddValue6;
#endif
    float sumValue = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
    float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_WORLD_ORIGIN.y;
    float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue1 = ddx_coarse(multiplyAddValue4);
    float scalarValue2 = ddx_coarse(multiplyAddValue5);
    float scalarValue3 = ddx_coarse(multiplyAddValue6);
    float inverseLengthValue2 = rsqrt(dot(float3(scalarValue1, scalarValue2, scalarValue3), float3(scalarValue1, scalarValue2, scalarValue3)));
    float productValue14 = inverseLengthValue2 * scalarValue1;
    float productValue15 = inverseLengthValue2 * scalarValue2;
    float productValue16 = inverseLengthValue2 * scalarValue3;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float sumValue3 = (-0.0f) - multiplyAddValue6;
#endif
    float sumValue4 = ddy_coarse((-0.0f) - multiplyAddValue4);
    float sumValue5 = ddy_coarse((-0.0f) - multiplyAddValue5);
    float scalarValue4 = ddy_coarse(sumValue3);
    float inverseLengthValue3 = rsqrt(dot(float3(sumValue4, sumValue5, scalarValue4), float3(sumValue4, sumValue5, scalarValue4)));
    float productValue17 = inverseLengthValue3 * sumValue4;
    float productValue18 = inverseLengthValue3 * sumValue5;
    float productValue19 = inverseLengthValue3 * scalarValue4;
    float productValue20 = (productValue19 * productValue15) - (productValue18 * productValue16);
    float productValue21 = (productValue17 * productValue16) - (productValue19 * productValue14);
    float productValue22 = (productValue18 * productValue14) - (productValue17 * productValue15);
    float inverseLengthValue4 = rsqrt(dot(float3(productValue20, productValue21, productValue22), float3(productValue20, productValue21, productValue22)));
    float productValue23 = productValue20 * inverseLengthValue4;
    float productValue24 = productValue21 * inverseLengthValue4;
    float productValue25 = productValue22 * inverseLengthValue4;
    float multiplyAddValue15 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue25, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue24, productValue23 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue16 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue25, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue24, productValue23 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue17 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue25, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue24, productValue23 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17)));
    float quotientValue2 = round((inverseLengthValue5 * multiplyAddValue15) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue3 = round((inverseLengthValue5 * multiplyAddValue16) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue4 = round((inverseLengthValue5 * multiplyAddValue17) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue6 = rsqrt(dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(quotientValue2, quotientValue3, quotientValue4)));
    float productValue26 = inverseLengthValue6 * quotientValue2;
    float productValue27 = inverseLengthValue6 * quotientValue3;
    float productValue28 = inverseLengthValue6 * quotientValue4;
    float productValue29 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue5 = productValue29 - (sumValue - (floor(sumValue / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue6 = productValue29 - (sumValue1 - (floor(sumValue1 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue7 = productValue29 - (sumValue2 - (floor(sumValue2 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(productValue26, productValue27, productValue28));
    float productValue30 = ((quotientValue5 + sumValue) - (dotProductValue * productValue26)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue31 = ((sumValue1 - (dotProductValue * productValue27)) + quotientValue6) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue32 = ((sumValue2 - (dotProductValue * productValue28)) + quotientValue7) + RD_UNIFORM_WORLD_ORIGIN.z;
    float sumValue6 = 1.0f - varyingTexCoord8.x;
    float productValue33 = sumValue6 * 0.039999999105930328369140625f;
    float productValue34 = (exponentialValue * varyingTexCoord8.x) + productValue33;
    float productValue35 = (exponentialValue1 * varyingTexCoord8.x) + productValue33;
    float productValue36 = (exponentialValue2 * varyingTexCoord8.x) + productValue33;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue37 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue37, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue37 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue37, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue37 * productValue37) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue37, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float sampledTextureValue;
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
        sampledTextureValue = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue11, productValue12, productValue13)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
    }
    else
    {
        sampledTextureValue = 1.0f;
    }
    float clampedValue4 = clamp(((RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float nonlinearValue = sqrt(((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6));
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue39;
    float productValue40;
#endif
    float productValue41;
    float productValue42;
    float productValue43;
    float productValue44;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue9;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    float intermediateValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue45;
    float productValue46;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue45;
    float productValue46;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
#endif
    if (multiplyAddValue11 != 1.0f)
    {
        float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
        float quotientValue8 = multiplyAddValue4 / sumValue7;
        float quotientValue9 = multiplyAddValue5 / sumValue7;
        float quotientValue10 = multiplyAddValue6 / sumValue7;
        float sumValue8 = (-0.0f) - quotientValue8;
        float sumValue9 = (-0.0f) - quotientValue9;
        float sumValue10 = (-0.0f) - quotientValue10;
        float productValue38 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * varyingTexCoord8.w;
        bool conditionValue = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue10;
        float intermediateValue12;
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
        float intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue11;
        float intermediateValue13;
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
#endif
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.9999997473787516355514526367188e-05f))
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue10 = 0.0f;
            intermediateValue12 = 0.0f;
            intermediateValue14 = 0.0f;
            intermediateValue16 = 0.0f;
            intermediateValue18 = 0.0f;
            intermediateValue20 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue15 = 0.0f;
            intermediateValue16 = 0.0f;
            intermediateValue17 = 0.0f;
            intermediateValue18 = 0.0f;
            intermediateValue19 = 0.0f;
            intermediateValue20 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue11 = 0.0f;
            intermediateValue13 = 0.0f;
            intermediateValue15 = 0.0f;
            intermediateValue17 = 0.0f;
            intermediateValue19 = 0.0f;
            intermediateValue21 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue16 = 0.0f;
            intermediateValue17 = 0.0f;
            intermediateValue18 = 0.0f;
            intermediateValue19 = 0.0f;
            intermediateValue20 = 0.0f;
            intermediateValue21 = 0.0f;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue68;
            float intermediateValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue59;
            float intermediateValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue70;
            float intermediateValue25;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue61;
            float intermediateValue23;
#endif
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
                float dotProductValue1 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(inverseLengthValue7 * multiplyAddValue18, inverseLengthValue7 * multiplyAddValue19, inverseLengthValue7 * multiplyAddValue20)), 0.0f);
                float clampedValue5 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue1 = (clampedValue5 * productValue11) + (conditionValue ? productValue30 : varyingTexCoord3.x);
                float comparisonValue2 = (clampedValue5 * productValue12) + (conditionValue ? productValue31 : varyingTexCoord3.y);
                float comparisonValue3 = (clampedValue5 * productValue13) + (conditionValue ? productValue32 : varyingTexCoord3.z);
                uint clampedValue6 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue25;
                float intermediateValue36;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue23;
                float intermediateValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue26;
                float intermediateValue37;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue24;
                float intermediateValue36;
#endif
                if (int(clampedValue6) > int(0u))
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue35;
                    float intermediateValue37;
                    uint intermediateValue48;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue34;
                    float intermediateValue36;
                    uint intermediateValue54;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue36;
                    float intermediateValue38;
                    uint intermediateValue49;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue35;
                    float intermediateValue37;
                    uint intermediateValue55;
#endif
                    float scalarValue5 = 1.0f;
                    float scalarValue6 = 1.0f;
                    uint scalarValue7 = 0u;
                    uint scalarValue8 = 0u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint quotientValue13;
                    bool intermediateValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint quotientValue15;
                    bool intermediateValue56;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint quotientValue13;
                    bool intermediateValue51;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint quotientValue15;
                    bool intermediateValue57;
#endif
                    for (;;)
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue11 = scalarValue8 + 364u;
                        quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue11 / 4u][sumValue11 % 4u])) + scalarValue7), int(8u)));
                        intermediateValue50 = int(scalarValue7) < int(quotientValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint sumValue131 = scalarValue8 + 372u;
                        quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue131 / 4u][sumValue131 % 4u])) + scalarValue7), int(8u)));
                        intermediateValue56 = int(scalarValue7) < int(quotientValue15);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue11 = scalarValue8 + 364u;
                        quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue11 / 4u][sumValue11 % 4u])) + scalarValue7), int(8u)));
                        intermediateValue51 = int(scalarValue7) < int(quotientValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint sumValue131 = scalarValue8 + 372u;
                        quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue131 / 4u][sumValue131 % 4u])) + scalarValue7), int(8u)));
                        intermediateValue57 = int(scalarValue7) < int(quotientValue15);
#endif
                        uint branchMergedValue;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float branchMergedValue5;
#endif
                        float branchMergedValue6;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        if (intermediateValue50)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float branchMergedValue7;
                        if (intermediateValue56)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        if (intermediateValue51)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float branchMergedValue7;
                        if (intermediateValue57)
#endif
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue57;
                            float intermediateValue58;
                            uint intermediateValue59;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue73;
                            float intermediateValue74;
                            uint intermediateValue75;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue58;
                            float intermediateValue59;
                            uint intermediateValue60;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue74;
                            float intermediateValue75;
                            uint intermediateValue76;
#endif
                            float scalarValue9 = scalarValue5;
                            float scalarValue10 = scalarValue6;
                            uint scalarValue11 = scalarValue7;
                            uint bitwiseValue10;
                            float multiplyAddValue35;
                            float multiplyAddValue36;
                            float multiplyAddValue37;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            bool comparisonValue19;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            bool comparisonValue18;
#endif
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue11 << 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint sumValue12 = bitwiseValue10 + 92u;
                                uint sumValue13 = bitwiseValue10 + 93u;
#endif
                                uint sumValue14 = bitwiseValue10 + 94u;
                                uint sumValue15 = bitwiseValue10 + 95u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                multiplyAddValue35 = mad(fragmentConstants[sumValue14].x, comparisonValue3, mad(fragmentConstants[sumValue13].x, comparisonValue2, fragmentConstants[sumValue12].x * comparisonValue1)) + fragmentConstants[sumValue15].x;
                                multiplyAddValue36 = mad(fragmentConstants[sumValue14].y, comparisonValue3, mad(fragmentConstants[sumValue13].y, comparisonValue2, fragmentConstants[sumValue12].y * comparisonValue1)) + fragmentConstants[sumValue15].y;
                                multiplyAddValue37 = mad(fragmentConstants[sumValue14].z, comparisonValue3, mad(fragmentConstants[sumValue13].z, comparisonValue2, fragmentConstants[sumValue12].z * comparisonValue1)) + fragmentConstants[sumValue15].z;
                                comparisonValue19 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint sumValue132 = bitwiseValue10 + 96u;
                                uint sumValue133 = bitwiseValue10 + 97u;
                                multiplyAddValue35 = mad(fragmentConstants[sumValue132].x, comparisonValue3, mad(fragmentConstants[sumValue15].x, comparisonValue2, fragmentConstants[sumValue14].x * comparisonValue1)) + fragmentConstants[sumValue133].x;
                                multiplyAddValue36 = mad(fragmentConstants[sumValue132].y, comparisonValue3, mad(fragmentConstants[sumValue15].y, comparisonValue2, fragmentConstants[sumValue14].y * comparisonValue1)) + fragmentConstants[sumValue133].y;
                                multiplyAddValue37 = mad(fragmentConstants[sumValue132].z, comparisonValue3, mad(fragmentConstants[sumValue15].z, comparisonValue2, fragmentConstants[sumValue14].z * comparisonValue1)) + fragmentConstants[sumValue133].z;
                                comparisonValue18 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
#endif
                                uint branchMergedValue1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float branchMergedValue7;
#endif
                                float branchMergedValue8;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if (comparisonValue19)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float branchMergedValue9;
                                if (comparisonValue18)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue16 = scalarValue11 + 616u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue134 = scalarValue11 + 628u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue174 = scalarValue11 + 620u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue188 = scalarValue11 + 632u;
#endif
                                    uint sumValue17 = scalarValue11 + 49u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue11 = min(max(dotProductValue1, fragmentConstants[sumValue16 / 4u][sumValue16 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue11 * quotientValue11)) / quotientValue11) * fragmentConstants[sumValue17].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue24 = min(max(dotProductValue1, fragmentConstants[sumValue134 / 4u][sumValue134 % 4u]), 1.0f);
                                    float nonlinearValue5 = (sqrt(1.0f - (quotientValue24 * quotientValue24)) / quotientValue24) * fragmentConstants[sumValue17].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue34 = min(max(dotProductValue1, fragmentConstants[sumValue174 / 4u][sumValue174 % 4u]), 1.0f);
                                    float nonlinearValue6 = (sqrt(1.0f - (quotientValue34 * quotientValue34)) / quotientValue34) * fragmentConstants[sumValue17].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue37 = min(max(dotProductValue1, fragmentConstants[sumValue188 / 4u][sumValue188 % 4u]), 1.0f);
                                    float nonlinearValue7 = (sqrt(1.0f - (quotientValue37 * quotientValue37)) / quotientValue37) * fragmentConstants[sumValue17].z;
#endif
                                    float productValue53 = (multiplyAddValue35 * 0.5f) + 0.5f;
                                    float productValue60 = 0.5f - (multiplyAddValue36 * 0.5f);
                                    uint sumValue18 = bitwiseValue10 + 19u;
                                    float nonlinearValue2 = sqrt((((fragmentConstants[sumValue18].x * fragmentConstants[sumValue18].x) + (fragmentConstants[sumValue18].y * fragmentConstants[sumValue18].y)) + (fragmentConstants[sumValue18].z * fragmentConstants[sumValue18].z)) + (fragmentConstants[sumValue18].w * fragmentConstants[sumValue18].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                    uint comparisonValue4 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue17].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue12 = uint(int(comparisonValue4) / int(2u));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float intermediateValue116;
                                    float intermediateValue117;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float intermediateValue141;
                                    float intermediateValue142;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float intermediateValue117;
                                    float intermediateValue118;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float intermediateValue142;
                                    float intermediateValue143;
#endif
                                    if (int(comparisonValue4) > int(0u))
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        float sumValue85;
                                        float productValue173;
                                        float intermediateValue147;
                                        float intermediateValue148;
                                        uint intermediateValue149;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        float sumValue100;
                                        float productValue206;
                                        float intermediateValue180;
                                        float intermediateValue181;
                                        uint intermediateValue182;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        float sumValue85;
                                        float productValue175;
                                        float intermediateValue148;
                                        float intermediateValue149;
                                        uint intermediateValue150;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        float sumValue100;
                                        float productValue208;
                                        float intermediateValue181;
                                        float intermediateValue182;
                                        uint intermediateValue183;
#endif
                                        float scalarValue12 = 0.0f;
                                        float scalarValue13 = 0.0f;
                                        uint scalarValue14 = 0u;
                                        for (;;)
                                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                            intermediateValue147 = scalarValue12;
                                            intermediateValue148 = scalarValue13;
                                            intermediateValue149 = 0u;
                                            float intermediateValue194;
                                            float intermediateValue151;
                                            float intermediateValue152;
                                            float intermediateValue153;
                                            float intermediateValue154;
                                            float productValue181;
                                            float productValue182;
                                            bool comparisonValue44;
                                            float sumValue95;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                            intermediateValue180 = scalarValue12;
                                            intermediateValue181 = scalarValue13;
                                            intermediateValue182 = 0u;
                                            float intermediateValue236;
                                            float intermediateValue184;
                                            float intermediateValue185;
                                            float intermediateValue186;
                                            float intermediateValue187;
                                            float productValue220;
                                            float productValue221;
                                            bool comparisonValue47;
                                            float sumValue110;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                            intermediateValue148 = scalarValue12;
                                            intermediateValue149 = scalarValue13;
                                            intermediateValue150 = 0u;
                                            float intermediateValue195;
                                            float intermediateValue152;
                                            float intermediateValue153;
                                            float intermediateValue154;
                                            float intermediateValue155;
                                            float productValue183;
                                            float productValue184;
                                            bool comparisonValue44;
                                            float sumValue95;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                            intermediateValue181 = scalarValue12;
                                            intermediateValue182 = scalarValue13;
                                            intermediateValue183 = 0u;
                                            float intermediateValue237;
                                            float intermediateValue185;
                                            float intermediateValue186;
                                            float intermediateValue187;
                                            float intermediateValue188;
                                            float productValue222;
                                            float productValue223;
                                            bool comparisonValue47;
                                            float sumValue110;
#endif
                                            for (;;)
                                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float productValue62 = (productValue53 + ((float(int(intermediateValue149 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float productValue249 = (productValue53 + ((float(int(intermediateValue182 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float productValue322 = (productValue53 + ((float(int(intermediateValue150 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float productValue341 = (productValue53 + ((float(int(intermediateValue183 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#endif
                                                float productValue63 = (productValue60 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue14 - quotientValue12)) + 0.5f))) * fragmentConstants[sumValue17].x;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float4 vectorValue = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue62, productValue63, float(int(scalarValue11))));
                                                intermediateValue151 = vectorValue.x;
                                                intermediateValue152 = vectorValue.y;
                                                intermediateValue153 = vectorValue.z;
                                                intermediateValue154 = vectorValue.w;
                                                productValue181 = frac((productValue62 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue182 = frac((productValue63 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue7 = clamp((multiplyAddValue37 - intermediateValue151) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue8 = clamp((multiplyAddValue37 - intermediateValue152) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue9 = clamp((multiplyAddValue37 - intermediateValue153) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue10 = clamp((multiplyAddValue37 - intermediateValue154) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue64 = 1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)));
                                                float productValue65 = 1.0f - ((clampedValue10 * clampedValue10) * (3.0f - (clampedValue10 * 2.0f)));
                                                float productValue66 = (((1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)))) - productValue65) * productValue181) + productValue65;
                                                productValue173 = (productValue66 + intermediateValue148) + ((((((1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)))) - productValue64) * productValue181) + productValue64) - productValue66) * productValue182);
                                                comparisonValue44 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue95 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue44)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float4 vectorValue3 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue249, productValue63, float(int(scalarValue11))));
                                                intermediateValue184 = vectorValue3.x;
                                                intermediateValue185 = vectorValue3.y;
                                                intermediateValue186 = vectorValue3.z;
                                                intermediateValue187 = vectorValue3.w;
                                                productValue220 = frac((productValue249 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue221 = frac((productValue63 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue21 = clamp((multiplyAddValue37 - intermediateValue184) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue22 = clamp((multiplyAddValue37 - intermediateValue185) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue23 = clamp((multiplyAddValue37 - intermediateValue186) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue25 = clamp((multiplyAddValue37 - intermediateValue187) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue250 = 1.0f - ((clampedValue21 * clampedValue21) * (3.0f - (clampedValue21 * 2.0f)));
                                                float productValue251 = 1.0f - ((clampedValue25 * clampedValue25) * (3.0f - (clampedValue25 * 2.0f)));
                                                float productValue252 = (((1.0f - ((clampedValue23 * clampedValue23) * (3.0f - (clampedValue23 * 2.0f)))) - productValue251) * productValue220) + productValue251;
                                                productValue206 = (productValue252 + intermediateValue181) + ((((((1.0f - ((clampedValue22 * clampedValue22) * (3.0f - (clampedValue22 * 2.0f)))) - productValue250) * productValue220) + productValue250) - productValue252) * productValue221);
                                                comparisonValue47 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue110 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue5;
                                                float branchMergedValue5;
                                                if (comparisonValue47)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue322, productValue63, float(int(scalarValue11))));
                                                intermediateValue152 = vectorValue6.x;
                                                intermediateValue153 = vectorValue6.y;
                                                intermediateValue154 = vectorValue6.z;
                                                intermediateValue155 = vectorValue6.w;
                                                productValue183 = frac((productValue322 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue184 = frac((productValue63 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue8 = clamp((multiplyAddValue37 - intermediateValue152) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue9 = clamp((multiplyAddValue37 - intermediateValue153) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue10 = clamp((multiplyAddValue37 - intermediateValue154) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue30 = clamp((multiplyAddValue37 - intermediateValue155) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue323 = 1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)));
                                                float productValue324 = 1.0f - ((clampedValue30 * clampedValue30) * (3.0f - (clampedValue30 * 2.0f)));
                                                float productValue325 = (((1.0f - ((clampedValue10 * clampedValue10) * (3.0f - (clampedValue10 * 2.0f)))) - productValue324) * productValue183) + productValue324;
                                                productValue175 = (productValue325 + intermediateValue149) + ((((((1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)))) - productValue323) * productValue183) + productValue323) - productValue325) * productValue184);
                                                comparisonValue44 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue95 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue6;
                                                float branchMergedValue4;
                                                if (comparisonValue44)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float4 vectorValue9 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue341, productValue63, float(int(scalarValue11))));
                                                intermediateValue185 = vectorValue9.x;
                                                intermediateValue186 = vectorValue9.y;
                                                intermediateValue187 = vectorValue9.z;
                                                intermediateValue188 = vectorValue9.w;
                                                productValue222 = frac((productValue341 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue223 = frac((productValue63 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue22 = clamp((multiplyAddValue37 - intermediateValue185) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue23 = clamp((multiplyAddValue37 - intermediateValue186) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue25 = clamp((multiplyAddValue37 - intermediateValue187) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue31 = clamp((multiplyAddValue37 - intermediateValue188) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue342 = 1.0f - ((clampedValue22 * clampedValue22) * (3.0f - (clampedValue22 * 2.0f)));
                                                float productValue343 = 1.0f - ((clampedValue31 * clampedValue31) * (3.0f - (clampedValue31 * 2.0f)));
                                                float productValue344 = (((1.0f - ((clampedValue25 * clampedValue25) * (3.0f - (clampedValue25 * 2.0f)))) - productValue343) * productValue222) + productValue343;
                                                productValue208 = (productValue344 + intermediateValue182) + ((((((1.0f - ((clampedValue23 * clampedValue23) * (3.0f - (clampedValue23 * 2.0f)))) - productValue342) * productValue222) + productValue342) - productValue344) * productValue223);
                                                comparisonValue47 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue110 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue7;
                                                float branchMergedValue5;
                                                if (comparisonValue47)
#endif
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    branchMergedValue4 = float(intermediateValue154 >= sumValue95);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    branchMergedValue5 = float(intermediateValue187 >= sumValue110);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    branchMergedValue4 = float(intermediateValue155 >= sumValue95);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    branchMergedValue5 = float(intermediateValue188 >= sumValue110);
#endif
                                                }
                                                else
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    float comparisonValue5 = (intermediateValue151 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue6 = (intermediateValue154 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue7 = ((((intermediateValue153 < sumValue95) ? 0.0f : 1.0f) - comparisonValue6) * productValue181) + comparisonValue6;
                                                    branchMergedValue4 = (((((((intermediateValue152 < sumValue95) ? 0.0f : 1.0f) - comparisonValue5) * productValue181) + comparisonValue5) - comparisonValue7) * productValue182) + comparisonValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    float comparisonValue70 = (intermediateValue184 < sumValue110) ? 0.0f : 1.0f;
                                                    float comparisonValue71 = (intermediateValue187 < sumValue110) ? 0.0f : 1.0f;
                                                    float comparisonValue72 = ((((intermediateValue186 < sumValue110) ? 0.0f : 1.0f) - comparisonValue71) * productValue220) + comparisonValue71;
                                                    branchMergedValue5 = (((((((intermediateValue185 < sumValue110) ? 0.0f : 1.0f) - comparisonValue70) * productValue220) + comparisonValue70) - comparisonValue72) * productValue221) + comparisonValue72;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    float comparisonValue98 = (intermediateValue152 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue99 = (intermediateValue155 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue100 = ((((intermediateValue154 < sumValue95) ? 0.0f : 1.0f) - comparisonValue99) * productValue183) + comparisonValue99;
                                                    branchMergedValue4 = (((((((intermediateValue153 < sumValue95) ? 0.0f : 1.0f) - comparisonValue98) * productValue183) + comparisonValue98) - comparisonValue100) * productValue184) + comparisonValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    float comparisonValue113 = (intermediateValue185 < sumValue110) ? 0.0f : 1.0f;
                                                    float comparisonValue114 = (intermediateValue188 < sumValue110) ? 0.0f : 1.0f;
                                                    float comparisonValue115 = ((((intermediateValue187 < sumValue110) ? 0.0f : 1.0f) - comparisonValue114) * productValue222) + comparisonValue114;
                                                    branchMergedValue5 = (((((((intermediateValue186 < sumValue110) ? 0.0f : 1.0f) - comparisonValue113) * productValue222) + comparisonValue113) - comparisonValue115) * productValue223) + comparisonValue115;
#endif
                                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                intermediateValue194 = branchMergedValue4;
                                                sumValue85 = intermediateValue194 + intermediateValue147;
                                                uint sumValue19 = intermediateValue149 + 1u;
                                                if (sumValue19 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                intermediateValue236 = branchMergedValue5;
                                                sumValue100 = intermediateValue236 + intermediateValue180;
                                                uint sumValue135 = intermediateValue182 + 1u;
                                                if (sumValue135 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                intermediateValue195 = branchMergedValue4;
                                                sumValue85 = intermediateValue195 + intermediateValue148;
                                                uint sumValue175 = intermediateValue150 + 1u;
                                                if (sumValue175 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                intermediateValue237 = branchMergedValue5;
                                                sumValue100 = intermediateValue237 + intermediateValue181;
                                                uint sumValue189 = intermediateValue183 + 1u;
                                                if (sumValue189 == comparisonValue4)
#endif
                                                {
                                                    break;
                                                }
                                                else
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    intermediateValue147 = sumValue85;
                                                    intermediateValue148 = productValue173;
                                                    intermediateValue149 = sumValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    intermediateValue180 = sumValue100;
                                                    intermediateValue181 = productValue206;
                                                    intermediateValue182 = sumValue135;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    intermediateValue148 = sumValue85;
                                                    intermediateValue149 = productValue175;
                                                    intermediateValue150 = sumValue175;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    intermediateValue181 = sumValue100;
                                                    intermediateValue182 = productValue208;
                                                    intermediateValue183 = sumValue189;
#endif
                                                    continue;
                                                }
                                            }
                                            uint sumValue20 = scalarValue14 + 1u;
                                            if (sumValue20 == comparisonValue4)
                                            {
                                                break;
                                            }
                                            else
                                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                scalarValue12 = sumValue85;
                                                scalarValue13 = productValue173;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                scalarValue12 = sumValue100;
                                                scalarValue13 = productValue206;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                scalarValue12 = sumValue85;
                                                scalarValue13 = productValue175;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                scalarValue12 = sumValue100;
                                                scalarValue13 = productValue208;
#endif
                                                scalarValue14 = sumValue20;
                                                continue;
                                            }
                                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue116 = sumValue85;
                                        intermediateValue117 = productValue173;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue141 = sumValue100;
                                        intermediateValue142 = productValue206;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue117 = sumValue85;
                                        intermediateValue118 = productValue175;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue142 = sumValue100;
                                        intermediateValue143 = productValue208;
#endif
                                    }
                                    else
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue116 = 0.0f;
                                        intermediateValue117 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue141 = 0.0f;
                                        intermediateValue142 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue117 = 0.0f;
                                        intermediateValue118 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue142 = 0.0f;
                                        intermediateValue143 = 0.0f;
#endif
                                    }
                                    float productValue67 = float(int(comparisonValue4 * comparisonValue4));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = quotientValue13;
                                    branchMergedValue7 = min(scalarValue10, intermediateValue116 / productValue67);
                                    branchMergedValue8 = min(scalarValue9, intermediateValue117 / productValue67);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = quotientValue15;
                                    branchMergedValue8 = min(scalarValue10, intermediateValue141 / productValue67);
                                    branchMergedValue9 = min(scalarValue9, intermediateValue142 / productValue67);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = quotientValue13;
                                    branchMergedValue7 = min(scalarValue10, intermediateValue117 / productValue67);
                                    branchMergedValue8 = min(scalarValue9, intermediateValue118 / productValue67);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = quotientValue15;
                                    branchMergedValue8 = min(scalarValue10, intermediateValue142 / productValue67);
                                    branchMergedValue9 = min(scalarValue9, intermediateValue143 / productValue67);
#endif
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue11 + 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    branchMergedValue7 = scalarValue10;
                                    branchMergedValue8 = scalarValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    branchMergedValue8 = scalarValue10;
                                    branchMergedValue9 = scalarValue9;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue59 = branchMergedValue1;
                                intermediateValue58 = branchMergedValue7;
                                intermediateValue57 = branchMergedValue8;
                                if (int(intermediateValue59) < int(quotientValue13))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue75 = branchMergedValue1;
                                intermediateValue74 = branchMergedValue8;
                                intermediateValue73 = branchMergedValue9;
                                if (int(intermediateValue75) < int(quotientValue15))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue60 = branchMergedValue1;
                                intermediateValue59 = branchMergedValue7;
                                intermediateValue58 = branchMergedValue8;
                                if (int(intermediateValue60) < int(quotientValue13))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue76 = branchMergedValue1;
                                intermediateValue75 = branchMergedValue8;
                                intermediateValue74 = branchMergedValue9;
                                if (int(intermediateValue76) < int(quotientValue15))
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    scalarValue9 = intermediateValue57;
                                    scalarValue10 = intermediateValue58;
                                    scalarValue11 = intermediateValue59;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    scalarValue9 = intermediateValue73;
                                    scalarValue10 = intermediateValue74;
                                    scalarValue11 = intermediateValue75;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    scalarValue9 = intermediateValue58;
                                    scalarValue10 = intermediateValue59;
                                    scalarValue11 = intermediateValue60;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    scalarValue9 = intermediateValue74;
                                    scalarValue10 = intermediateValue75;
                                    scalarValue11 = intermediateValue76;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue59;
                            branchMergedValue5 = intermediateValue58;
                            branchMergedValue6 = intermediateValue57;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue = intermediateValue75;
                            branchMergedValue6 = intermediateValue74;
                            branchMergedValue7 = intermediateValue73;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue60;
                            branchMergedValue5 = intermediateValue59;
                            branchMergedValue6 = intermediateValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue = intermediateValue76;
                            branchMergedValue6 = intermediateValue75;
                            branchMergedValue7 = intermediateValue74;
#endif
                        }
                        else
                        {
                            branchMergedValue = scalarValue7;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            branchMergedValue5 = scalarValue6;
                            branchMergedValue6 = scalarValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue6 = scalarValue6;
                            branchMergedValue7 = scalarValue5;
#endif
                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue48 = branchMergedValue;
                        intermediateValue37 = branchMergedValue5;
                        intermediateValue35 = branchMergedValue6;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue54 = branchMergedValue;
                        intermediateValue36 = branchMergedValue6;
                        intermediateValue34 = branchMergedValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue49 = branchMergedValue;
                        intermediateValue38 = branchMergedValue5;
                        intermediateValue36 = branchMergedValue6;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue55 = branchMergedValue;
                        intermediateValue37 = branchMergedValue6;
                        intermediateValue35 = branchMergedValue7;
#endif
                        uint sumValue21 = scalarValue8 + 1u;
                        if (sumValue21 == clampedValue6)
                        {
                            break;
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            scalarValue5 = intermediateValue35;
                            scalarValue6 = intermediateValue37;
                            scalarValue7 = intermediateValue48;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            scalarValue5 = intermediateValue34;
                            scalarValue6 = intermediateValue36;
                            scalarValue7 = intermediateValue54;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            scalarValue5 = intermediateValue36;
                            scalarValue6 = intermediateValue38;
                            scalarValue7 = intermediateValue49;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            scalarValue5 = intermediateValue35;
                            scalarValue6 = intermediateValue37;
                            scalarValue7 = intermediateValue55;
#endif
                            scalarValue8 = sumValue21;
                            continue;
                        }
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue25 = intermediateValue35;
                    intermediateValue36 = intermediateValue37;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue23 = intermediateValue34;
                    intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue26 = intermediateValue36;
                    intermediateValue37 = intermediateValue38;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue24 = intermediateValue35;
                    intermediateValue36 = intermediateValue37;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue25 = 1.0f;
                    intermediateValue36 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue23 = 1.0f;
                    intermediateValue35 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue26 = 1.0f;
                    intermediateValue37 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue24 = 1.0f;
                    intermediateValue36 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue52;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue53;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue59;
#endif
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
                    float scalarValue15 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue21 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue1))) - ((sqrt(1.0f - (scalarValue15 * scalarValue15)) / scalarValue15) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue22 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue1)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue23 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue1)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    uint comparisonValue8 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue8 >> 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue11;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue17;
#endif
                    if ((multiplyAddValue23 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue22 >= 0.0f) && (multiplyAddValue22 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue23 >= 0.0f)))
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue63;
                        float intermediateValue99;
                        uint intermediateValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue43;
                        float intermediateValue128;
                        uint intermediateValue129;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue63;
                        float intermediateValue100;
                        uint intermediateValue101;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue43;
                        float intermediateValue129;
                        uint intermediateValue130;
#endif
                        float scalarValue16 = 0.0f;
                        uint scalarValue17 = 0u;
                        for (;;)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue99 = scalarValue16;
                            intermediateValue100 = 0u;
                            float intermediateValue139;
                            float productValue169;
                            float productValue170;
                            bool comparisonValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue128 = scalarValue16;
                            intermediateValue129 = 0u;
                            float intermediateValue157;
                            float productValue202;
                            float productValue203;
                            bool comparisonValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue100 = scalarValue16;
                            intermediateValue101 = 0u;
                            float intermediateValue140;
                            float productValue171;
                            float productValue172;
                            bool comparisonValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue129 = scalarValue16;
                            intermediateValue130 = 0u;
                            float intermediateValue158;
                            float productValue204;
                            float productValue205;
                            bool comparisonValue27;
#endif
                            for (;;)
                            {
                                float productValue69 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                productValue169 = (productValue69 * (float(int(intermediateValue100 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                productValue170 = (productValue69 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue30 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                productValue202 = (productValue69 * (float(int(intermediateValue129 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                productValue203 = (productValue69 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue27 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                productValue171 = (productValue69 * (float(int(intermediateValue101 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                productValue172 = (productValue69 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue30 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                productValue204 = (productValue69 * (float(int(intermediateValue130 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                productValue205 = (productValue69 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue27 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#endif
                                float branchMergedValue2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if (comparisonValue30)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                if (comparisonValue27)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue169, productValue170, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue202, productValue203, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue171, productValue172, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue204, productValue205, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue169, productValue170, dotProductValue2));
                                    float productValue71 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue169) + 0.5f);
                                    float comparisonValue9 = (vectorValue1.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue10 = (vectorValue1.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue11 = ((((vectorValue1.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue10) * productValue71) + comparisonValue10;
                                    branchMergedValue2 = (((((((vectorValue1.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue9) * productValue71) + comparisonValue9) - comparisonValue11) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue170) + 0.5f)) + comparisonValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue4 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue202, productValue203, dotProductValue2));
                                    float productValue253 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue202) + 0.5f);
                                    float comparisonValue73 = (vectorValue4.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue74 = (vectorValue4.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue75 = ((((vectorValue4.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue74) * productValue253) + comparisonValue74;
                                    branchMergedValue2 = (((((((vectorValue4.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue73) * productValue253) + comparisonValue73) - comparisonValue75) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue203) + 0.5f)) + comparisonValue75;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue7 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue171, productValue172, dotProductValue2));
                                    float productValue326 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue171) + 0.5f);
                                    float comparisonValue101 = (vectorValue7.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue102 = (vectorValue7.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue103 = ((((vectorValue7.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue102) * productValue326) + comparisonValue102;
                                    branchMergedValue2 = (((((((vectorValue7.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue101) * productValue326) + comparisonValue101) - comparisonValue103) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue172) + 0.5f)) + comparisonValue103;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue10 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue204, productValue205, dotProductValue2));
                                    float productValue345 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue204) + 0.5f);
                                    float comparisonValue116 = (vectorValue10.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue117 = (vectorValue10.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue118 = ((((vectorValue10.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue117) * productValue345) + comparisonValue117;
                                    branchMergedValue2 = (((((((vectorValue10.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue116) * productValue345) + comparisonValue116) - comparisonValue118) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue205) + 0.5f)) + comparisonValue118;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue139 = branchMergedValue2;
                                sumValue63 = intermediateValue139 + intermediateValue99;
                                uint sumValue22 = intermediateValue100 + 1u;
                                if (int(sumValue22) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue157 = branchMergedValue2;
                                sumValue43 = intermediateValue157 + intermediateValue128;
                                uint sumValue136 = intermediateValue129 + 1u;
                                if (int(sumValue136) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue140 = branchMergedValue2;
                                sumValue63 = intermediateValue140 + intermediateValue100;
                                uint sumValue176 = intermediateValue101 + 1u;
                                if (int(sumValue176) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue158 = branchMergedValue2;
                                sumValue43 = intermediateValue158 + intermediateValue129;
                                uint sumValue190 = intermediateValue130 + 1u;
                                if (int(sumValue190) < int(comparisonValue8))
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue99 = sumValue63;
                                    intermediateValue100 = sumValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue128 = sumValue43;
                                    intermediateValue129 = sumValue136;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue100 = sumValue63;
                                    intermediateValue101 = sumValue176;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue129 = sumValue43;
                                    intermediateValue130 = sumValue190;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue23 = scalarValue17 + 1u;
                            if (int(sumValue23) < int(comparisonValue8))
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue16 = sumValue63;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue16 = sumValue43;
#endif
                                scalarValue17 = sumValue23;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue11 = sumValue63 / float(int(comparisonValue8 * comparisonValue8));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue17 = sumValue43 / float(int(comparisonValue8 * comparisonValue8));
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue11 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue17 = 1.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue52 = branchMergedValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue58 = branchMergedValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue53 = branchMergedValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue59 = branchMergedValue17;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue52 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue58 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue53 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue59 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue61;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue77;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue62;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue78;
#endif
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
                    float multiplyAddValue24 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue18 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue25 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue24) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue18 * scalarValue18)) / scalarValue18) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue26 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue24) * 0.5f) + 0.5f;
                    float multiplyAddValue27 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue24) * 0.5f);
                    uint comparisonValue12 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue14 = uint(int(comparisonValue12) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue92;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue105;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue93;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue106;
#endif
                    if (int(comparisonValue12) > int(0u))
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue65;
                        float intermediateValue119;
                        uint intermediateValue120;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue45;
                        float intermediateValue144;
                        uint intermediateValue145;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue65;
                        float intermediateValue120;
                        uint intermediateValue121;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue45;
                        float intermediateValue145;
                        uint intermediateValue146;
#endif
                        float scalarValue19 = 0.0f;
                        uint scalarValue20 = 0u;
                        for (;;)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue119 = scalarValue19;
                            intermediateValue120 = 0u;
                            float intermediateValue155;
                            float4 intermediateValue121;
                            float productValue176;
                            float productValue177;
                            bool comparisonValue34;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue144 = scalarValue19;
                            intermediateValue145 = 0u;
                            float intermediateValue188;
                            float4 intermediateValue146;
                            float productValue209;
                            float productValue210;
                            bool comparisonValue37;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue120 = scalarValue19;
                            intermediateValue121 = 0u;
                            float intermediateValue156;
                            float4 intermediateValue122;
                            float productValue178;
                            float productValue179;
                            bool comparisonValue34;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue145 = scalarValue19;
                            intermediateValue146 = 0u;
                            float intermediateValue189;
                            float4 intermediateValue147;
                            float productValue211;
                            float productValue212;
                            bool comparisonValue37;
#endif
                            for (;;)
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue121 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue176 = (multiplyAddValue26 + ((float(int(intermediateValue120 - quotientValue14)) + 0.5f) * intermediateValue121.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue177 = (multiplyAddValue27 + (intermediateValue121.x * (float(int(scalarValue20 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue34 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue34)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue146 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue209 = (multiplyAddValue26 + ((float(int(intermediateValue145 - quotientValue14)) + 0.5f) * intermediateValue146.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue210 = (multiplyAddValue27 + (intermediateValue146.x * (float(int(scalarValue20 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue37 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue4;
                                if (comparisonValue37)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue122 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue178 = (multiplyAddValue26 + ((float(int(intermediateValue121 - quotientValue14)) + 0.5f) * intermediateValue122.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue179 = (multiplyAddValue27 + (intermediateValue122.x * (float(int(scalarValue20 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue34 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue34)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue147 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue211 = (multiplyAddValue26 + ((float(int(intermediateValue146 - quotientValue14)) + 0.5f) * intermediateValue147.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue212 = (multiplyAddValue27 + (intermediateValue147.x * (float(int(scalarValue20 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue37 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue4;
                                if (comparisonValue37)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue176, productValue177, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue209, productValue210, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue178, productValue179, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue211, productValue212, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue176, productValue177, dotProductValue3));
                                    float productValue72 = frac((productValue176 * intermediateValue121.z) + 0.5f);
                                    float comparisonValue13 = (vectorValue2.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue14 = (vectorValue2.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue15 = ((((vectorValue2.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue14) * productValue72) + comparisonValue14;
                                    branchMergedValue3 = (((((((vectorValue2.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue13) * productValue72) + comparisonValue13) - comparisonValue15) * frac((productValue177 * intermediateValue121.z) + 0.5f)) + comparisonValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue209, productValue210, dotProductValue3));
                                    float productValue254 = frac((productValue209 * intermediateValue146.z) + 0.5f);
                                    float comparisonValue76 = (vectorValue5.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue77 = (vectorValue5.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue78 = ((((vectorValue5.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue77) * productValue254) + comparisonValue77;
                                    branchMergedValue4 = (((((((vectorValue5.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue76) * productValue254) + comparisonValue76) - comparisonValue78) * frac((productValue210 * intermediateValue146.z) + 0.5f)) + comparisonValue78;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue8 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue178, productValue179, dotProductValue3));
                                    float productValue327 = frac((productValue178 * intermediateValue122.z) + 0.5f);
                                    float comparisonValue104 = (vectorValue8.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue105 = (vectorValue8.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue106 = ((((vectorValue8.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue105) * productValue327) + comparisonValue105;
                                    branchMergedValue3 = (((((((vectorValue8.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue104) * productValue327) + comparisonValue104) - comparisonValue106) * frac((productValue179 * intermediateValue122.z) + 0.5f)) + comparisonValue106;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue11 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue211, productValue212, dotProductValue3));
                                    float productValue346 = frac((productValue211 * intermediateValue147.z) + 0.5f);
                                    float comparisonValue119 = (vectorValue11.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue120 = (vectorValue11.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue121 = ((((vectorValue11.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue120) * productValue346) + comparisonValue120;
                                    branchMergedValue4 = (((((((vectorValue11.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue119) * productValue346) + comparisonValue119) - comparisonValue121) * frac((productValue212 * intermediateValue147.z) + 0.5f)) + comparisonValue121;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue155 = branchMergedValue3;
                                sumValue65 = intermediateValue155 + intermediateValue119;
                                uint sumValue24 = intermediateValue120 + 1u;
                                if (sumValue24 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue188 = branchMergedValue4;
                                sumValue45 = intermediateValue188 + intermediateValue144;
                                uint sumValue137 = intermediateValue145 + 1u;
                                if (sumValue137 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue156 = branchMergedValue3;
                                sumValue65 = intermediateValue156 + intermediateValue120;
                                uint sumValue177 = intermediateValue121 + 1u;
                                if (sumValue177 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue189 = branchMergedValue4;
                                sumValue45 = intermediateValue189 + intermediateValue145;
                                uint sumValue191 = intermediateValue146 + 1u;
                                if (sumValue191 == comparisonValue12)
#endif
                                {
                                    break;
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue119 = sumValue65;
                                    intermediateValue120 = sumValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue144 = sumValue45;
                                    intermediateValue145 = sumValue137;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue120 = sumValue65;
                                    intermediateValue121 = sumValue177;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue145 = sumValue45;
                                    intermediateValue146 = sumValue191;
#endif
                                    continue;
                                }
                            }
                            uint sumValue25 = scalarValue20 + 1u;
                            if (sumValue25 == comparisonValue12)
                            {
                                break;
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue19 = sumValue65;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue19 = sumValue45;
#endif
                                scalarValue20 = sumValue25;
                                continue;
                            }
                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue92 = sumValue65;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue105 = sumValue45;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue93 = sumValue65;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue106 = sumValue45;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue92 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue105 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue93 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue106 = 0.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float quotientValue16 = intermediateValue92 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue12;
                    if (quotientValue16 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float quotientValue25 = intermediateValue105 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue18;
                    if (quotientValue25 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float quotientValue35 = intermediateValue93 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue12;
                    if (quotientValue35 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float quotientValue38 = intermediateValue106 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue18;
                    if (quotientValue38 < 1.0f)
#endif
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        branchMergedValue12 = min(1.0f, max(quotientValue16, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        branchMergedValue18 = min(1.0f, max(quotientValue25, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        branchMergedValue12 = min(1.0f, max(quotientValue35, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        branchMergedValue18 = min(1.0f, max(quotientValue38, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue12 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue18 = 1.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue61 = branchMergedValue12;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue77 = branchMergedValue18;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue62 = branchMergedValue12;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue78 = branchMergedValue18;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue61 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue77 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue62 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue78 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float scalarValue21 = min(intermediateValue36, min(intermediateValue52, intermediateValue61));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float scalarValue70 = min(intermediateValue35, min(intermediateValue58, intermediateValue77));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float scalarValue113 = min(intermediateValue37, min(intermediateValue53, intermediateValue62));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float scalarValue126 = min(intermediateValue36, min(intermediateValue59, intermediateValue78));
#endif
                float productValue73 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue11 = clamp((sumValue3 - productValue73) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue73), 0.0f, 1.0f);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue68 = (((clampedValue11 * clampedValue11) * (1.0f - scalarValue21)) * (3.0f - (clampedValue11 * 2.0f))) + scalarValue21;
                intermediateValue24 = intermediateValue25;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue59 = (((clampedValue11 * clampedValue11) * (1.0f - scalarValue70)) * (3.0f - (clampedValue11 * 2.0f))) + scalarValue70;
                intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue70 = (((clampedValue11 * clampedValue11) * (1.0f - scalarValue113)) * (3.0f - (clampedValue11 * 2.0f))) + scalarValue113;
                intermediateValue25 = intermediateValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue61 = (((clampedValue11 * clampedValue11) * (1.0f - scalarValue126)) * (3.0f - (clampedValue11 * 2.0f))) + scalarValue126;
                intermediateValue23 = intermediateValue24;
#endif
            }
            else
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue68 = 1.0f;
                intermediateValue24 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue59 = 1.0f;
                intermediateValue22 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue70 = 1.0f;
                intermediateValue25 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue61 = 1.0f;
                intermediateValue23 = 1.0f;
#endif
            }
            float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
            float productValue74 = inverseLengthValue8 * multiplyAddValue28;
            float productValue75 = inverseLengthValue8 * multiplyAddValue29;
            float productValue76 = inverseLengthValue8 * multiplyAddValue30;
            float productValue77 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue);
            float productValue78 = productValue77 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue79 = productValue77 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue80 = productValue77 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue74, productValue75, productValue76));
            float scalarValue22 = max(dotProductValue4, 0.0f);
            float dotProductValue5 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
            float sumValue26 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue81 = sumValue26 * sumValue26;
            float sumValue27 = productValue74 - quotientValue8;
            float sumValue28 = productValue75 - quotientValue9;
            float sumValue29 = productValue76 - quotientValue10;
            float inverseLengthValue9 = rsqrt(dot(float3(sumValue27, sumValue28, sumValue29), float3(sumValue27, sumValue28, sumValue29)));
            float productValue82 = inverseLengthValue9 * sumValue27;
            float productValue83 = inverseLengthValue9 * sumValue28;
            float productValue84 = inverseLengthValue9 * sumValue29;
            float scalarValue23 = max(varyingTexCoord8.z, 0.0500000007450580596923828125f);
            float productValue85 = scalarValue23 * scalarValue23;
            float productValue86 = productValue85 * productValue85;
            float dotProductValue6 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue82, productValue83, productValue84)), 0.0f);
            float productValue87 = ((dotProductValue6 * dotProductValue6) * (productValue86 + (-1.0f))) + 1.0f;
            float productValue88 = productValue85 * 0.5f;
            float sumValue30 = 1.0f - productValue88;
            float sumValue31 = productValue88 + 9.9999997473787516355514526367188e-05f;
            float clampedValue12 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue82, productValue83, productValue84)), 0.0f), 0.0f, 1.0f);
            float productValue89 = clampedValue12 * clampedValue12;
            float productValue90 = (productValue89 * productValue89) * clampedValue12;
            float productValue91 = (productValue90 * (1.0f - productValue34)) + productValue34;
            float productValue92 = (productValue90 * (1.0f - productValue35)) + productValue35;
            float productValue93 = (productValue90 * (1.0f - productValue36)) + productValue36;
            float quotientValue17 = ((dotProductValue5 / ((sumValue30 * dotProductValue5) + sumValue31)) * (productValue86 / ((productValue87 * productValue87) * 3.1415927410125732421875f))) * (scalarValue22 / ((sumValue30 * scalarValue22) + sumValue31));
            float productValue94 = ((scalarValue22 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float quotientValue18 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f) - scalarValue22) * productValue38) + scalarValue22) * productValue68;
            float dotProductValue7 = (intermediateValue24 * productValue38) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue74, productValue75, productValue76)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float quotientValue26 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f) - scalarValue22) * productValue38) + scalarValue22) * productValue59;
            float dotProductValue17 = (intermediateValue22 * productValue38) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue74, productValue75, productValue76)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float quotientValue36 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f) - scalarValue22) * productValue38) + scalarValue22) * productValue70;
            float dotProductValue23 = (intermediateValue25 * productValue38) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue74, productValue75, productValue76)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float quotientValue39 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f) - scalarValue22) * productValue38) + scalarValue22) * productValue61;
            float dotProductValue25 = (intermediateValue23 * productValue38) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue74, productValue75, productValue76)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue81, 0.0f);
#endif
            float productValue95 = sumValue6 * 0.3183098733425140380859375f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue96 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue68);
            intermediateValue10 = (productValue96 * productValue78) * ((productValue91 * quotientValue17) / productValue94);
            intermediateValue12 = (productValue96 * productValue79) * ((productValue92 * quotientValue17) / productValue94);
            intermediateValue14 = (productValue96 * productValue80) * ((productValue93 * quotientValue17) / productValue94);
            intermediateValue16 = (((productValue95 * exponentialValue) * productValue78) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue91) * quotientValue18) + dotProductValue7);
            intermediateValue18 = (((productValue95 * exponentialValue1) * productValue79) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue92) * quotientValue18) + dotProductValue7);
            intermediateValue20 = (((productValue95 * exponentialValue2) * productValue80) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue93) * quotientValue18) + dotProductValue7);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue255 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue59);
            intermediateValue15 = (productValue255 * productValue78) * ((productValue91 * quotientValue17) / productValue94);
            intermediateValue16 = (productValue255 * productValue79) * ((productValue92 * quotientValue17) / productValue94);
            intermediateValue17 = (productValue255 * productValue80) * ((productValue93 * quotientValue17) / productValue94);
            intermediateValue18 = (((productValue95 * exponentialValue) * productValue78) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue91) * quotientValue26) + dotProductValue17);
            intermediateValue19 = (((productValue95 * exponentialValue1) * productValue79) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue92) * quotientValue26) + dotProductValue17);
            intermediateValue20 = (((productValue95 * exponentialValue2) * productValue80) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue93) * quotientValue26) + dotProductValue17);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue328 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue70);
            intermediateValue11 = (productValue328 * productValue78) * ((productValue91 * quotientValue17) / productValue94);
            intermediateValue13 = (productValue328 * productValue79) * ((productValue92 * quotientValue17) / productValue94);
            intermediateValue15 = (productValue328 * productValue80) * ((productValue93 * quotientValue17) / productValue94);
            intermediateValue17 = (((productValue95 * exponentialValue) * productValue78) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue91) * quotientValue36) + dotProductValue23);
            intermediateValue19 = (((productValue95 * exponentialValue1) * productValue79) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue92) * quotientValue36) + dotProductValue23);
            intermediateValue21 = (((productValue95 * exponentialValue2) * productValue80) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue93) * quotientValue36) + dotProductValue23);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue347 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue61);
            intermediateValue16 = (productValue347 * productValue78) * ((productValue91 * quotientValue17) / productValue94);
            intermediateValue17 = (productValue347 * productValue79) * ((productValue92 * quotientValue17) / productValue94);
            intermediateValue18 = (productValue347 * productValue80) * ((productValue93 * quotientValue17) / productValue94);
            intermediateValue19 = (((productValue95 * exponentialValue) * productValue78) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue91) * quotientValue39) + dotProductValue25);
            intermediateValue20 = (((productValue95 * exponentialValue1) * productValue79) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue92) * quotientValue39) + dotProductValue25);
            intermediateValue21 = (((productValue95 * exponentialValue2) * productValue80) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue93) * quotientValue39) + dotProductValue25);
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue45;
        float productValue46;
        float productValue47;
        float productValue48;
        float productValue49;
        float productValue50;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue79 = conditionValue2 ? productValue30 : varyingTexCoord3.x;
            float comparisonValue80 = conditionValue2 ? productValue31 : varyingTexCoord3.y;
            float comparisonValue81 = conditionValue2 ? productValue32 : varyingTexCoord3.z;
            float productValue256 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
            float productValue257 = productValue256 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue30;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
            {
                intermediateValue30 = 0.0f;
            }
            else
            {
                float branchMergedValue15;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                {
                    branchMergedValue15 = 1.0f;
                }
                else
                {
                    branchMergedValue15 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue30 = branchMergedValue15;
            }
            float quotientValue27 = min(floor(min(max((productValue257 + multiplyAddValue4) / (productValue257 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue28 = min(floor(min(max((productValue256 + multiplyAddValue5) / (productValue256 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue43;
            bool intermediateValue45;
            uint intermediateValue46;
            if ((intermediateValue30 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue27 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue30 < 0.0f) || ((quotientValue27 < 0.0f) || (quotientValue28 < 0.0f))))))
            {
                intermediateValue43 = intermediateValue44;
                intermediateValue45 = false;
                intermediateValue46 = 0u;
            }
            else
            {
                uint scalarValue71 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue258 = uint(int(((quotientValue28 + (intermediateValue30 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue27)) * scalarValue71;
                intermediateValue43 = productValue258;
                intermediateValue45 = true;
                intermediateValue46 = productValue258 + scalarValue71;
            }
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            float intermediateValue66;
            float intermediateValue68;
            float intermediateValue70;
            if (intermediateValue45 && (int(intermediateValue43) < int(intermediateValue46)))
            {
                float intermediateValue113;
                float quotientValue19;
                float dotProductValue15;
                float sumValue52;
                float sumValue53;
                float sumValue54;
                float quotientValue21;
                float quotientValue22;
                float quotientValue23;
                float intermediateValue159;
                float intermediateValue160;
                float intermediateValue161;
                float intermediateValue162;
                float intermediateValue164;
                float intermediateValue61;
                float intermediateValue63;
                float intermediateValue65;
                float intermediateValue67;
                float intermediateValue69;
                float intermediateValue71;
                uint scalarValue72 = intermediateValue43;
                float scalarValue73 = 0.0f;
                float scalarValue74 = 0.0f;
                float scalarValue75 = 0.0f;
                float scalarValue76 = 0.0f;
                float scalarValue77 = 0.0f;
                float scalarValue78 = 0.0f;
                uint loadedBufferValue3;
                for (;;)
                {
                    loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue72).x)));
                    if (int(loadedBufferValue3) < int(0u))
                    {
                        intermediateValue61 = scalarValue73;
                        intermediateValue63 = scalarValue74;
                        intermediateValue65 = scalarValue75;
                        intermediateValue67 = scalarValue76;
                        intermediateValue69 = scalarValue77;
                        intermediateValue71 = scalarValue78;
                        break;
                    }
                    else
                    {
                        uint productValue259 = loadedBufferValue3 * 32u;
                        float4 loadedBufferValue36 = asfloat(uint4(rdLoad_zLights(productValue259).x, rdLoad_zLights(productValue259 + 1u).x, rdLoad_zLights(productValue259 + 2u).x, rdLoad_zLights(productValue259 + 3u).x));
                        float scalarValue79 = loadedBufferValue36.x;
                        float scalarValue80 = loadedBufferValue36.y;
                        float scalarValue81 = loadedBufferValue36.z;
                        float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                        float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                        float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                        float inverseLengthValue14 = rsqrt(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
                        float productValue260 = inverseLengthValue14 * multiplyAddValue42;
                        float productValue261 = inverseLengthValue14 * multiplyAddValue43;
                        float productValue262 = inverseLengthValue14 * multiplyAddValue44;
                        float dotProductValue18 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue260, productValue261, productValue262));
                        intermediateValue113 = max(dotProductValue18, 0.0f);
                        float dotProductValue19 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
                        float sumValue138 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue263 = sumValue138 * sumValue138;
                        quotientValue19 = ((max((dotProductValue18 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue263, 0.0f) - intermediateValue113) * productValue38) + intermediateValue113;
                        dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue260, productValue261, productValue262)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue263, 0.0f) * productValue38;
                        float sumValue139 = productValue260 - quotientValue8;
                        float sumValue140 = productValue261 - quotientValue9;
                        float sumValue141 = productValue262 - quotientValue10;
                        float inverseLengthValue15 = rsqrt(dot(float3(sumValue139, sumValue140, sumValue141), float3(sumValue139, sumValue140, sumValue141)));
                        float productValue264 = inverseLengthValue15 * sumValue139;
                        float productValue265 = inverseLengthValue15 * sumValue140;
                        float productValue266 = inverseLengthValue15 * sumValue141;
                        float scalarValue82 = max(varyingTexCoord8.z, 0.0500000007450580596923828125f);
                        float productValue267 = scalarValue82 * scalarValue82;
                        float productValue268 = productValue267 * productValue267;
                        float dotProductValue20 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue264, productValue265, productValue266)), 0.0f);
                        float productValue269 = ((dotProductValue20 * dotProductValue20) * (productValue268 + (-1.0f))) + 1.0f;
                        float productValue270 = productValue267 * 0.5f;
                        float sumValue142 = 1.0f - productValue270;
                        float sumValue143 = productValue270 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue26 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue264, productValue265, productValue266)), 0.0f), 0.0f, 1.0f);
                        float productValue271 = clampedValue26 * clampedValue26;
                        float productValue272 = (productValue271 * productValue271) * clampedValue26;
                        float productValue273 = (productValue272 * (1.0f - productValue34)) + productValue34;
                        float productValue274 = (productValue272 * (1.0f - productValue35)) + productValue35;
                        float productValue275 = (productValue272 * (1.0f - productValue36)) + productValue36;
                        sumValue52 = 1.0f - productValue273;
                        sumValue53 = 1.0f - productValue274;
                        sumValue54 = 1.0f - productValue275;
                        float quotientValue29 = ((dotProductValue19 / ((sumValue142 * dotProductValue19) + sumValue143)) * (productValue268 / ((productValue269 * productValue269) * 3.1415927410125732421875f))) * (intermediateValue113 / ((sumValue142 * intermediateValue113) + sumValue143));
                        float productValue276 = ((intermediateValue113 * 4.0f) * dotProductValue19) + 9.9999997473787516355514526367188e-05f;
                        quotientValue21 = (productValue273 * quotientValue29) / productValue276;
                        quotientValue22 = (productValue274 * quotientValue29) / productValue276;
                        quotientValue23 = (productValue275 * quotientValue29) / productValue276;
                        float sumValue144 = scalarValue79 - varyingTexCoord3.x;
                        float sumValue145 = scalarValue80 - varyingTexCoord3.y;
                        float sumValue146 = scalarValue81 - varyingTexCoord3.z;
                        float productValue211;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue147 = (abs(sumValue145) + abs(sumValue144)) + abs(sumValue146);
                            productValue211 = sumValue147 * sumValue147;
                        }
                        else
                        {
                            productValue211 = dot(float3(sumValue144, sumValue145, sumValue146), float3(sumValue144, sumValue145, sumValue146));
                        }
                        float scalarValue83 = loadedBufferValue36.w;
                        float productValue277 = scalarValue83 * scalarValue83;
                        float branchMergedValue3;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        if (!(productValue211 >= productValue277))
                        {
                            float intermediateValue163;
                            float intermediateValue165;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue278 = (loadedBufferValue3 * 32u) + 8u;
                                float4 loadedBufferValue37 = asfloat(uint4(rdLoad_zLights(productValue278).x, rdLoad_zLights(productValue278 + 1u).x, rdLoad_zLights(productValue278 + 2u).x, rdLoad_zLights(productValue278 + 3u).x));
                                uint productValue279 = (loadedBufferValue3 * 32u) + 12u;
                                float4 loadedBufferValue38 = asfloat(uint4(rdLoad_zLights(productValue279).x, rdLoad_zLights(productValue279 + 1u).x, rdLoad_zLights(productValue279 + 2u).x, rdLoad_zLights(productValue279 + 3u).x));
                                uint productValue280 = (loadedBufferValue3 * 32u) + 16u;
                                float4 loadedBufferValue39 = asfloat(uint4(rdLoad_zLights(productValue280).x, rdLoad_zLights(productValue280 + 1u).x, rdLoad_zLights(productValue280 + 2u).x, rdLoad_zLights(productValue280 + 3u).x));
                                uint productValue281 = (loadedBufferValue3 * 32u) + 20u;
                                float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue281).x, rdLoad_zLights(productValue281 + 1u).x, rdLoad_zLights(productValue281 + 2u).x, rdLoad_zLights(productValue281 + 3u).x));
                                uint productValue282 = (loadedBufferValue3 * 32u) + 24u;
                                float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue282).x, rdLoad_zLights(productValue282 + 1u).x, rdLoad_zLights(productValue282 + 2u).x, rdLoad_zLights(productValue282 + 3u).x));
                                uint productValue283 = (loadedBufferValue3 * 32u) + 28u;
                                float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue283).x, rdLoad_zLights(productValue283 + 1u).x, rdLoad_zLights(productValue283 + 2u).x, rdLoad_zLights(productValue283 + 3u).x));
                                float sumValue148 = comparisonValue79 - scalarValue79;
                                float sumValue149 = comparisonValue80 - scalarValue80;
                                float sumValue150 = comparisonValue81 - scalarValue81;
                                float scalarValue84 = abs(sumValue148);
                                float scalarValue85 = abs(sumValue149);
                                float scalarValue86 = abs(sumValue150);
                                uint comparisonValue57;
                                if ((scalarValue84 >= scalarValue85) && (scalarValue84 >= scalarValue86))
                                {
                                    comparisonValue57 = uint(!(sumValue148 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue24;
                                    if (!(scalarValue85 >= scalarValue86))
                                    {
                                        branchMergedValue24 = (sumValue150 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue24 = (sumValue149 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue57 = branchMergedValue24;
                                }
                                float sumValue151 = (-0.0f) - sumValue148;
                                float intermediateValue239;
                                float intermediateValue240;
                                float intermediateValue241;
                                float intermediateValue242;
                                float sumValue127;
                                float intermediateValue243;
                                float intermediateValue244;
                                if (comparisonValue57 == 1u)
                                {
                                    intermediateValue239 = loadedBufferValue38.x;
                                    intermediateValue240 = loadedBufferValue38.y;
                                    intermediateValue241 = loadedBufferValue38.z;
                                    intermediateValue242 = loadedBufferValue38.w;
                                    sumValue127 = (-0.0f) - sumValue150;
                                    intermediateValue243 = sumValue149;
                                    intermediateValue244 = sumValue148;
                                }
                                else
                                {
                                    float branchMergedValue25;
                                    float branchMergedValue54;
                                    float branchMergedValue55;
                                    float branchMergedValue56;
                                    float branchMergedValue57;
                                    float branchMergedValue58;
                                    float branchMergedValue59;
                                    if (comparisonValue57 == 2u)
                                    {
                                        branchMergedValue25 = (-0.0f) - sumValue149;
                                        branchMergedValue54 = (-0.0f) - sumValue150;
                                        branchMergedValue55 = sumValue151;
                                        branchMergedValue56 = loadedBufferValue39.w;
                                        branchMergedValue57 = loadedBufferValue39.z;
                                        branchMergedValue58 = loadedBufferValue39.y;
                                        branchMergedValue59 = loadedBufferValue39.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue72;
                                        float branchMergedValue74;
                                        float branchMergedValue75;
                                        float branchMergedValue76;
                                        float branchMergedValue77;
                                        float branchMergedValue78;
                                        float branchMergedValue79;
                                        if (comparisonValue57 == 3u)
                                        {
                                            branchMergedValue72 = sumValue149;
                                            branchMergedValue74 = sumValue150;
                                            branchMergedValue75 = sumValue151;
                                            branchMergedValue76 = loadedBufferValue40.w;
                                            branchMergedValue77 = loadedBufferValue40.z;
                                            branchMergedValue78 = loadedBufferValue40.y;
                                            branchMergedValue79 = loadedBufferValue40.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue84;
                                            float branchMergedValue85;
                                            float branchMergedValue86;
                                            float branchMergedValue87;
                                            float branchMergedValue88;
                                            float branchMergedValue89;
                                            float branchMergedValue90;
                                            if (comparisonValue57 == 4u)
                                            {
                                                branchMergedValue84 = (-0.0f) - sumValue150;
                                                branchMergedValue85 = sumValue149;
                                                branchMergedValue86 = sumValue151;
                                                branchMergedValue87 = loadedBufferValue41.w;
                                                branchMergedValue88 = loadedBufferValue41.z;
                                                branchMergedValue89 = loadedBufferValue41.y;
                                                branchMergedValue90 = loadedBufferValue41.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue82 = comparisonValue57 == 5u;
                                                branchMergedValue84 = comparisonValue82 ? sumValue150 : sumValue151;
                                                branchMergedValue85 = sumValue149;
                                                branchMergedValue86 = comparisonValue82 ? sumValue148 : sumValue150;
                                                branchMergedValue87 = comparisonValue82 ? loadedBufferValue42.w : loadedBufferValue37.w;
                                                branchMergedValue88 = comparisonValue82 ? loadedBufferValue42.z : loadedBufferValue37.z;
                                                branchMergedValue89 = comparisonValue82 ? loadedBufferValue42.y : loadedBufferValue37.y;
                                                branchMergedValue90 = comparisonValue82 ? loadedBufferValue42.x : loadedBufferValue37.x;
                                            }
                                            branchMergedValue72 = branchMergedValue84;
                                            branchMergedValue74 = branchMergedValue85;
                                            branchMergedValue75 = branchMergedValue86;
                                            branchMergedValue76 = branchMergedValue87;
                                            branchMergedValue77 = branchMergedValue88;
                                            branchMergedValue78 = branchMergedValue89;
                                            branchMergedValue79 = branchMergedValue90;
                                        }
                                        branchMergedValue25 = branchMergedValue72;
                                        branchMergedValue54 = branchMergedValue74;
                                        branchMergedValue55 = branchMergedValue75;
                                        branchMergedValue56 = branchMergedValue76;
                                        branchMergedValue57 = branchMergedValue77;
                                        branchMergedValue58 = branchMergedValue78;
                                        branchMergedValue59 = branchMergedValue79;
                                    }
                                    intermediateValue239 = branchMergedValue59;
                                    intermediateValue240 = branchMergedValue58;
                                    intermediateValue241 = branchMergedValue57;
                                    intermediateValue242 = branchMergedValue56;
                                    sumValue127 = branchMergedValue55;
                                    intermediateValue243 = branchMergedValue54;
                                    intermediateValue244 = branchMergedValue25;
                                }
                                float branchMergedValue21;
                                float branchMergedValue35;
                                if ((intermediateValue241 == 0.0f) && (intermediateValue242 == 0.0f))
                                {
                                    branchMergedValue21 = 1.0f;
                                    branchMergedValue35 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue45 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue16 = rsqrt(dot(float3(productValue11, productValue12, productValue13), float3(productValue11, productValue12, productValue13)));
                                    float sumValue152 = (-0.0f) - sumValue149;
                                    float sumValue153 = (-0.0f) - sumValue150;
                                    float inverseLengthValue17 = rsqrt(dot(float3(sumValue151, sumValue152, sumValue153), float3(sumValue151, sumValue152, sumValue153)));
                                    float dotProductValue21 = min(max(dot(float3(inverseLengthValue17 * sumValue151, inverseLengthValue17 * sumValue152, inverseLengthValue17 * sumValue153), float3(inverseLengthValue16 * productValue11, inverseLengthValue16 * productValue12, inverseLengthValue16 * productValue13)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue154 = intermediateValue241 - intermediateValue239;
                                    float productValue284 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue154;
                                    float multiplyAddValue46 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue45;
                                    float multiplyAddValue47 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue45;
                                    float quotientValue30 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue155 = intermediateValue242 - intermediateValue240;
                                    float productValue285 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue155;
                                    float4 sampledTextureValue10 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue46 * 0.5f) + 0.5f) * productValue284) + 0.5f) / productValue284) * sumValue154) + intermediateValue239, quotientValue30 + intermediateValue239), intermediateValue241 - quotientValue30), min(max((((floor((0.5f - (multiplyAddValue47 * 0.5f)) * productValue285) + 0.5f) / productValue285) * sumValue155) + intermediateValue240, quotientValue31 + intermediateValue240), intermediateValue242 - quotientValue31)), 0.0f);
                                    float scalarValue87 = sampledTextureValue10.x;
                                    float multiplyAddValue48 = float(scalarValue87 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue284, 1.0f)) * (((sqrt(1.0f - (dotProductValue21 * dotProductValue21)) / dotProductValue21) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue45));
                                    float branchMergedValue71;
                                    float branchMergedValue73;
                                    if (productValue38 > 0.0f)
                                    {
                                        float multiplyAddValue49 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue87, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue50 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue87, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue49;
                                        float multiplyAddValue51 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue87, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue49;
                                        float multiplyAddValue52 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue87, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue49;
                                        float clampedValue27 = clamp((sqrt(((intermediateValue243 * intermediateValue243) + (sumValue127 * sumValue127)) + (intermediateValue244 * intermediateValue244)) - sqrt(((multiplyAddValue51 * multiplyAddValue51) + (multiplyAddValue50 * multiplyAddValue50)) + (multiplyAddValue52 * multiplyAddValue52))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue71 = 1.0f - ((clampedValue27 * clampedValue27) * (3.0f - (clampedValue27 * 2.0f)));
                                        branchMergedValue73 = multiplyAddValue48;
                                    }
                                    else
                                    {
                                        branchMergedValue71 = 1.0f;
                                        branchMergedValue73 = multiplyAddValue48;
                                    }
                                    branchMergedValue21 = branchMergedValue71;
                                    branchMergedValue35 = branchMergedValue73;
                                }
                                intermediateValue163 = branchMergedValue35;
                                intermediateValue165 = branchMergedValue21;
                            }
                            else
                            {
                                intermediateValue163 = 1.0f;
                                intermediateValue165 = 1.0f;
                            }
                            uint productValue286 = (loadedBufferValue3 * 32u) + 4u;
                            float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue286).x, rdLoad_zLights(productValue286 + 1u).x, rdLoad_zLights(productValue286 + 2u).x, rdLoad_zLights(productValue286 + 3u).x));
                            float quotientValue32 = productValue211 / (productValue277 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue28 = clamp(1.0f - (quotientValue32 * quotientValue32), 0.0f, 1.0f);
                            float quotientValue33 = (clampedValue28 * clampedValue28) * (1.0f / max(productValue211, 0.100000001490116119384765625f));
                            float clampedValue24;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue29 = clamp(((1.0f - quotientValue33) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue24 = clamp((((clampedValue29 * clampedValue29) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue29 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue33;
                            }
                            else
                            {
                                clampedValue24 = quotientValue33;
                            }
                            float productValue287 = clampedValue24 * loadedBufferValue43.w;
                            branchMergedValue3 = intermediateValue165;
                            branchMergedValue10 = intermediateValue163;
                            branchMergedValue11 = productValue287 * loadedBufferValue43.z;
                            branchMergedValue12 = productValue287 * loadedBufferValue43.y;
                            branchMergedValue13 = productValue287 * loadedBufferValue43.x;
                        }
                        else
                        {
                            branchMergedValue3 = 1.0f;
                            branchMergedValue10 = 1.0f;
                            branchMergedValue11 = 0.0f;
                            branchMergedValue12 = 0.0f;
                            branchMergedValue13 = 0.0f;
                        }
                        intermediateValue164 = branchMergedValue3;
                        intermediateValue162 = branchMergedValue10;
                        intermediateValue161 = branchMergedValue11;
                        intermediateValue160 = branchMergedValue12;
                        intermediateValue159 = branchMergedValue13;
                        float productValue288 = intermediateValue162 * quotientValue19;
                        float productValue289 = dotProductValue15 * intermediateValue164;
                        float productValue290 = sumValue6 * 0.3183098733425140380859375f;
                        float productValue291 = ((((productValue290 * exponentialValue) * intermediateValue159) * (productValue289 + (productValue288 * sumValue52))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue76;
                        float productValue292 = ((((productValue290 * exponentialValue1) * intermediateValue160) * (productValue289 + (productValue288 * sumValue53))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue77;
                        float productValue293 = ((((productValue290 * exponentialValue2) * intermediateValue161) * (productValue289 + (productValue288 * sumValue54))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue78;
                        float productValue294 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue162 * intermediateValue113);
                        float productValue295 = ((productValue294 * quotientValue21) * intermediateValue159) + scalarValue73;
                        float productValue296 = ((productValue294 * quotientValue22) * intermediateValue160) + scalarValue74;
                        float productValue297 = ((productValue294 * quotientValue23) * intermediateValue161) + scalarValue75;
                        uint sumValue156 = scalarValue72 + 1u;
                        if (int(sumValue156) < int(intermediateValue46))
                        {
                            scalarValue72 = sumValue156;
                            scalarValue73 = productValue295;
                            scalarValue74 = productValue296;
                            scalarValue75 = productValue297;
                            scalarValue76 = productValue291;
                            scalarValue77 = productValue292;
                            scalarValue78 = productValue293;
                            continue;
                        }
                        else
                        {
                            intermediateValue61 = productValue295;
                            intermediateValue63 = productValue296;
                            intermediateValue65 = productValue297;
                            intermediateValue67 = productValue291;
                            intermediateValue69 = productValue292;
                            intermediateValue71 = productValue293;
                            break;
                        }
                    }
                }
                intermediateValue60 = intermediateValue61;
                intermediateValue62 = intermediateValue63;
                intermediateValue64 = intermediateValue65;
                intermediateValue66 = intermediateValue67;
                intermediateValue68 = intermediateValue69;
                intermediateValue70 = intermediateValue71;
            }
            else
            {
                intermediateValue60 = 0.0f;
                intermediateValue62 = 0.0f;
                intermediateValue64 = 0.0f;
                intermediateValue66 = 0.0f;
                intermediateValue68 = 0.0f;
                intermediateValue70 = 0.0f;
            }
            float sumValue157 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue45 = (sumValue157 * intermediateValue60) + intermediateValue15;
            productValue46 = (sumValue157 * intermediateValue62) + intermediateValue16;
            productValue47 = (sumValue157 * intermediateValue64) + intermediateValue17;
            productValue48 = (sumValue157 * intermediateValue66) + intermediateValue18;
            productValue49 = (sumValue157 * intermediateValue68) + intermediateValue19;
            productValue50 = (sumValue157 * intermediateValue70) + intermediateValue20;
        }
        else
        {
            productValue45 = intermediateValue15;
            productValue46 = intermediateValue16;
            productValue47 = intermediateValue17;
            productValue48 = intermediateValue18;
            productValue49 = intermediateValue19;
            productValue50 = intermediateValue20;
        }
        float intermediateValue31;
        float intermediateValue32;
        float intermediateValue33;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue47;
        float productValue48;
        float productValue49;
        float productValue50;
        float productValue51;
        float productValue52;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue79 = conditionValue2 ? productValue30 : varyingTexCoord3.x;
            float comparisonValue80 = conditionValue2 ? productValue31 : varyingTexCoord3.y;
            float comparisonValue81 = conditionValue2 ? productValue32 : varyingTexCoord3.z;
            float productValue256 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
            float productValue257 = productValue256 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue31;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
            {
                intermediateValue31 = 0.0f;
            }
            else
            {
                float branchMergedValue15;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                {
                    branchMergedValue15 = 1.0f;
                }
                else
                {
                    branchMergedValue15 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue31 = branchMergedValue15;
            }
            float quotientValue27 = min(floor(min(max((productValue257 + multiplyAddValue4) / (productValue257 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue28 = min(floor(min(max((productValue256 + multiplyAddValue5) / (productValue256 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue44;
            bool intermediateValue46;
            uint intermediateValue47;
            if ((intermediateValue31 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue27 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue31 < 0.0f) || ((quotientValue27 < 0.0f) || (quotientValue28 < 0.0f))))))
            {
                intermediateValue44 = intermediateValue45;
                intermediateValue46 = false;
                intermediateValue47 = 0u;
            }
            else
            {
                uint scalarValue71 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue348 = uint(int(((quotientValue28 + (intermediateValue31 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue27)) * scalarValue71;
                intermediateValue44 = productValue348;
                intermediateValue46 = true;
                intermediateValue47 = productValue348 + scalarValue71;
            }
            float intermediateValue61;
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            float intermediateValue69;
            float intermediateValue71;
            if (intermediateValue46 && (int(intermediateValue44) < int(intermediateValue47)))
            {
                float intermediateValue114;
                float quotientValue19;
                float dotProductValue15;
                float sumValue52;
                float sumValue53;
                float sumValue54;
                float quotientValue21;
                float quotientValue22;
                float quotientValue23;
                float intermediateValue160;
                float intermediateValue161;
                float intermediateValue162;
                float intermediateValue163;
                float intermediateValue165;
                float intermediateValue62;
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                float intermediateValue72;
                uint scalarValue127 = intermediateValue44;
                float scalarValue73 = 0.0f;
                float scalarValue74 = 0.0f;
                float scalarValue75 = 0.0f;
                float scalarValue76 = 0.0f;
                float scalarValue77 = 0.0f;
                float scalarValue78 = 0.0f;
                uint loadedBufferValue3;
                for (;;)
                {
                    loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue127).x)));
                    if (int(loadedBufferValue3) < int(0u))
                    {
                        intermediateValue62 = scalarValue73;
                        intermediateValue64 = scalarValue74;
                        intermediateValue66 = scalarValue75;
                        intermediateValue68 = scalarValue76;
                        intermediateValue70 = scalarValue77;
                        intermediateValue72 = scalarValue78;
                        break;
                    }
                    else
                    {
                        uint productValue259 = loadedBufferValue3 * 32u;
                        float4 loadedBufferValue36 = asfloat(uint4(rdLoad_zLights(productValue259).x, rdLoad_zLights(productValue259 + 1u).x, rdLoad_zLights(productValue259 + 2u).x, rdLoad_zLights(productValue259 + 3u).x));
                        float scalarValue79 = loadedBufferValue36.x;
                        float scalarValue80 = loadedBufferValue36.y;
                        float scalarValue81 = loadedBufferValue36.z;
                        float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                        float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                        float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue81, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue80, scalarValue79 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                        float inverseLengthValue14 = rsqrt(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
                        float productValue260 = inverseLengthValue14 * multiplyAddValue42;
                        float productValue261 = inverseLengthValue14 * multiplyAddValue43;
                        float productValue262 = inverseLengthValue14 * multiplyAddValue44;
                        float dotProductValue18 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue260, productValue261, productValue262));
                        intermediateValue114 = max(dotProductValue18, 0.0f);
                        float dotProductValue19 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
                        float sumValue138 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue263 = sumValue138 * sumValue138;
                        quotientValue19 = ((max((dotProductValue18 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue263, 0.0f) - intermediateValue114) * productValue38) + intermediateValue114;
                        dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue260, productValue261, productValue262)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue263, 0.0f) * productValue38;
                        float sumValue139 = productValue260 - quotientValue8;
                        float sumValue140 = productValue261 - quotientValue9;
                        float sumValue141 = productValue262 - quotientValue10;
                        float inverseLengthValue15 = rsqrt(dot(float3(sumValue139, sumValue140, sumValue141), float3(sumValue139, sumValue140, sumValue141)));
                        float productValue264 = inverseLengthValue15 * sumValue139;
                        float productValue265 = inverseLengthValue15 * sumValue140;
                        float productValue266 = inverseLengthValue15 * sumValue141;
                        float scalarValue82 = max(varyingTexCoord8.z, 0.0500000007450580596923828125f);
                        float productValue267 = scalarValue82 * scalarValue82;
                        float productValue268 = productValue267 * productValue267;
                        float dotProductValue20 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue264, productValue265, productValue266)), 0.0f);
                        float productValue269 = ((dotProductValue20 * dotProductValue20) * (productValue268 + (-1.0f))) + 1.0f;
                        float productValue270 = productValue267 * 0.5f;
                        float sumValue142 = 1.0f - productValue270;
                        float sumValue143 = productValue270 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue26 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue264, productValue265, productValue266)), 0.0f), 0.0f, 1.0f);
                        float productValue271 = clampedValue26 * clampedValue26;
                        float productValue272 = (productValue271 * productValue271) * clampedValue26;
                        float productValue273 = (productValue272 * (1.0f - productValue34)) + productValue34;
                        float productValue274 = (productValue272 * (1.0f - productValue35)) + productValue35;
                        float productValue275 = (productValue272 * (1.0f - productValue36)) + productValue36;
                        sumValue52 = 1.0f - productValue273;
                        sumValue53 = 1.0f - productValue274;
                        sumValue54 = 1.0f - productValue275;
                        float quotientValue40 = ((dotProductValue19 / ((sumValue142 * dotProductValue19) + sumValue143)) * (productValue268 / ((productValue269 * productValue269) * 3.1415927410125732421875f))) * (intermediateValue114 / ((sumValue142 * intermediateValue114) + sumValue143));
                        float productValue349 = ((intermediateValue114 * 4.0f) * dotProductValue19) + 9.9999997473787516355514526367188e-05f;
                        quotientValue21 = (productValue273 * quotientValue40) / productValue349;
                        quotientValue22 = (productValue274 * quotientValue40) / productValue349;
                        quotientValue23 = (productValue275 * quotientValue40) / productValue349;
                        float sumValue144 = scalarValue79 - varyingTexCoord3.x;
                        float sumValue145 = scalarValue80 - varyingTexCoord3.y;
                        float sumValue146 = scalarValue81 - varyingTexCoord3.z;
                        float productValue213;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue147 = (abs(sumValue145) + abs(sumValue144)) + abs(sumValue146);
                            productValue213 = sumValue147 * sumValue147;
                        }
                        else
                        {
                            productValue213 = dot(float3(sumValue144, sumValue145, sumValue146), float3(sumValue144, sumValue145, sumValue146));
                        }
                        float scalarValue83 = loadedBufferValue36.w;
                        float productValue277 = scalarValue83 * scalarValue83;
                        float branchMergedValue3;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        if (!(productValue213 >= productValue277))
                        {
                            float intermediateValue164;
                            float intermediateValue166;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue278 = (loadedBufferValue3 * 32u) + 8u;
                                float4 loadedBufferValue37 = asfloat(uint4(rdLoad_zLights(productValue278).x, rdLoad_zLights(productValue278 + 1u).x, rdLoad_zLights(productValue278 + 2u).x, rdLoad_zLights(productValue278 + 3u).x));
                                uint productValue279 = (loadedBufferValue3 * 32u) + 12u;
                                float4 loadedBufferValue38 = asfloat(uint4(rdLoad_zLights(productValue279).x, rdLoad_zLights(productValue279 + 1u).x, rdLoad_zLights(productValue279 + 2u).x, rdLoad_zLights(productValue279 + 3u).x));
                                uint productValue280 = (loadedBufferValue3 * 32u) + 16u;
                                float4 loadedBufferValue39 = asfloat(uint4(rdLoad_zLights(productValue280).x, rdLoad_zLights(productValue280 + 1u).x, rdLoad_zLights(productValue280 + 2u).x, rdLoad_zLights(productValue280 + 3u).x));
                                uint productValue281 = (loadedBufferValue3 * 32u) + 20u;
                                float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue281).x, rdLoad_zLights(productValue281 + 1u).x, rdLoad_zLights(productValue281 + 2u).x, rdLoad_zLights(productValue281 + 3u).x));
                                uint productValue282 = (loadedBufferValue3 * 32u) + 24u;
                                float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue282).x, rdLoad_zLights(productValue282 + 1u).x, rdLoad_zLights(productValue282 + 2u).x, rdLoad_zLights(productValue282 + 3u).x));
                                uint productValue283 = (loadedBufferValue3 * 32u) + 28u;
                                float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue283).x, rdLoad_zLights(productValue283 + 1u).x, rdLoad_zLights(productValue283 + 2u).x, rdLoad_zLights(productValue283 + 3u).x));
                                float sumValue148 = comparisonValue79 - scalarValue79;
                                float sumValue149 = comparisonValue80 - scalarValue80;
                                float sumValue150 = comparisonValue81 - scalarValue81;
                                float scalarValue84 = abs(sumValue148);
                                float scalarValue85 = abs(sumValue149);
                                float scalarValue86 = abs(sumValue150);
                                uint comparisonValue57;
                                if ((scalarValue84 >= scalarValue85) && (scalarValue84 >= scalarValue86))
                                {
                                    comparisonValue57 = uint(!(sumValue148 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue24;
                                    if (!(scalarValue85 >= scalarValue86))
                                    {
                                        branchMergedValue24 = (sumValue150 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue24 = (sumValue149 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue57 = branchMergedValue24;
                                }
                                float sumValue151 = (-0.0f) - sumValue148;
                                float intermediateValue240;
                                float intermediateValue241;
                                float intermediateValue242;
                                float intermediateValue243;
                                float sumValue127;
                                float intermediateValue244;
                                float intermediateValue245;
                                if (comparisonValue57 == 1u)
                                {
                                    intermediateValue240 = loadedBufferValue38.x;
                                    intermediateValue241 = loadedBufferValue38.y;
                                    intermediateValue242 = loadedBufferValue38.z;
                                    intermediateValue243 = loadedBufferValue38.w;
                                    sumValue127 = (-0.0f) - sumValue150;
                                    intermediateValue244 = sumValue149;
                                    intermediateValue245 = sumValue148;
                                }
                                else
                                {
                                    float branchMergedValue25;
                                    float branchMergedValue54;
                                    float branchMergedValue55;
                                    float branchMergedValue56;
                                    float branchMergedValue57;
                                    float branchMergedValue58;
                                    float branchMergedValue59;
                                    if (comparisonValue57 == 2u)
                                    {
                                        branchMergedValue25 = (-0.0f) - sumValue149;
                                        branchMergedValue54 = (-0.0f) - sumValue150;
                                        branchMergedValue55 = sumValue151;
                                        branchMergedValue56 = loadedBufferValue39.w;
                                        branchMergedValue57 = loadedBufferValue39.z;
                                        branchMergedValue58 = loadedBufferValue39.y;
                                        branchMergedValue59 = loadedBufferValue39.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue72;
                                        float branchMergedValue74;
                                        float branchMergedValue75;
                                        float branchMergedValue76;
                                        float branchMergedValue77;
                                        float branchMergedValue78;
                                        float branchMergedValue79;
                                        if (comparisonValue57 == 3u)
                                        {
                                            branchMergedValue72 = sumValue149;
                                            branchMergedValue74 = sumValue150;
                                            branchMergedValue75 = sumValue151;
                                            branchMergedValue76 = loadedBufferValue40.w;
                                            branchMergedValue77 = loadedBufferValue40.z;
                                            branchMergedValue78 = loadedBufferValue40.y;
                                            branchMergedValue79 = loadedBufferValue40.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue84;
                                            float branchMergedValue85;
                                            float branchMergedValue86;
                                            float branchMergedValue87;
                                            float branchMergedValue88;
                                            float branchMergedValue89;
                                            float branchMergedValue90;
                                            if (comparisonValue57 == 4u)
                                            {
                                                branchMergedValue84 = (-0.0f) - sumValue150;
                                                branchMergedValue85 = sumValue149;
                                                branchMergedValue86 = sumValue151;
                                                branchMergedValue87 = loadedBufferValue41.w;
                                                branchMergedValue88 = loadedBufferValue41.z;
                                                branchMergedValue89 = loadedBufferValue41.y;
                                                branchMergedValue90 = loadedBufferValue41.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue82 = comparisonValue57 == 5u;
                                                branchMergedValue84 = comparisonValue82 ? sumValue150 : sumValue151;
                                                branchMergedValue85 = sumValue149;
                                                branchMergedValue86 = comparisonValue82 ? sumValue148 : sumValue150;
                                                branchMergedValue87 = comparisonValue82 ? loadedBufferValue42.w : loadedBufferValue37.w;
                                                branchMergedValue88 = comparisonValue82 ? loadedBufferValue42.z : loadedBufferValue37.z;
                                                branchMergedValue89 = comparisonValue82 ? loadedBufferValue42.y : loadedBufferValue37.y;
                                                branchMergedValue90 = comparisonValue82 ? loadedBufferValue42.x : loadedBufferValue37.x;
                                            }
                                            branchMergedValue72 = branchMergedValue84;
                                            branchMergedValue74 = branchMergedValue85;
                                            branchMergedValue75 = branchMergedValue86;
                                            branchMergedValue76 = branchMergedValue87;
                                            branchMergedValue77 = branchMergedValue88;
                                            branchMergedValue78 = branchMergedValue89;
                                            branchMergedValue79 = branchMergedValue90;
                                        }
                                        branchMergedValue25 = branchMergedValue72;
                                        branchMergedValue54 = branchMergedValue74;
                                        branchMergedValue55 = branchMergedValue75;
                                        branchMergedValue56 = branchMergedValue76;
                                        branchMergedValue57 = branchMergedValue77;
                                        branchMergedValue58 = branchMergedValue78;
                                        branchMergedValue59 = branchMergedValue79;
                                    }
                                    intermediateValue240 = branchMergedValue59;
                                    intermediateValue241 = branchMergedValue58;
                                    intermediateValue242 = branchMergedValue57;
                                    intermediateValue243 = branchMergedValue56;
                                    sumValue127 = branchMergedValue55;
                                    intermediateValue244 = branchMergedValue54;
                                    intermediateValue245 = branchMergedValue25;
                                }
                                float branchMergedValue21;
                                float branchMergedValue35;
                                if ((intermediateValue242 == 0.0f) && (intermediateValue243 == 0.0f))
                                {
                                    branchMergedValue21 = 1.0f;
                                    branchMergedValue35 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue53 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue245, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue244, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue16 = rsqrt(dot(float3(productValue11, productValue12, productValue13), float3(productValue11, productValue12, productValue13)));
                                    float sumValue152 = (-0.0f) - sumValue149;
                                    float sumValue153 = (-0.0f) - sumValue150;
                                    float inverseLengthValue17 = rsqrt(dot(float3(sumValue151, sumValue152, sumValue153), float3(sumValue151, sumValue152, sumValue153)));
                                    float dotProductValue21 = min(max(dot(float3(inverseLengthValue17 * sumValue151, inverseLengthValue17 * sumValue152, inverseLengthValue17 * sumValue153), float3(inverseLengthValue16 * productValue11, inverseLengthValue16 * productValue12, inverseLengthValue16 * productValue13)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue155 = intermediateValue242 - intermediateValue240;
                                    float productValue350 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue155;
                                    float multiplyAddValue54 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue245, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue244, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue53;
                                    float multiplyAddValue55 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue245, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue244, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue53;
                                    float quotientValue30 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue192 = intermediateValue243 - intermediateValue241;
                                    float productValue351 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue192;
                                    float4 sampledTextureValue15 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue54 * 0.5f) + 0.5f) * productValue350) + 0.5f) / productValue350) * sumValue155) + intermediateValue240, quotientValue30 + intermediateValue240), intermediateValue242 - quotientValue30), min(max((((floor((0.5f - (multiplyAddValue55 * 0.5f)) * productValue351) + 0.5f) / productValue351) * sumValue192) + intermediateValue241, quotientValue31 + intermediateValue241), intermediateValue243 - quotientValue31)), 0.0f);
                                    float scalarValue128 = sampledTextureValue15.x;
                                    float multiplyAddValue56 = float(scalarValue128 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue245, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue244, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue350, 1.0f)) * (((sqrt(1.0f - (dotProductValue21 * dotProductValue21)) / dotProductValue21) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue53));
                                    float branchMergedValue71;
                                    float branchMergedValue73;
                                    if (productValue38 > 0.0f)
                                    {
                                        float multiplyAddValue57 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue128, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue58 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue128, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue57;
                                        float multiplyAddValue59 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue128, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue57;
                                        float multiplyAddValue60 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue128, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue57;
                                        float clampedValue32 = clamp((sqrt(((intermediateValue244 * intermediateValue244) + (sumValue127 * sumValue127)) + (intermediateValue245 * intermediateValue245)) - sqrt(((multiplyAddValue59 * multiplyAddValue59) + (multiplyAddValue58 * multiplyAddValue58)) + (multiplyAddValue60 * multiplyAddValue60))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue71 = 1.0f - ((clampedValue32 * clampedValue32) * (3.0f - (clampedValue32 * 2.0f)));
                                        branchMergedValue73 = multiplyAddValue56;
                                    }
                                    else
                                    {
                                        branchMergedValue71 = 1.0f;
                                        branchMergedValue73 = multiplyAddValue56;
                                    }
                                    branchMergedValue21 = branchMergedValue71;
                                    branchMergedValue35 = branchMergedValue73;
                                }
                                intermediateValue164 = branchMergedValue35;
                                intermediateValue166 = branchMergedValue21;
                            }
                            else
                            {
                                intermediateValue164 = 1.0f;
                                intermediateValue166 = 1.0f;
                            }
                            uint productValue286 = (loadedBufferValue3 * 32u) + 4u;
                            float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue286).x, rdLoad_zLights(productValue286 + 1u).x, rdLoad_zLights(productValue286 + 2u).x, rdLoad_zLights(productValue286 + 3u).x));
                            float quotientValue41 = productValue213 / (productValue277 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue33 = clamp(1.0f - (quotientValue41 * quotientValue41), 0.0f, 1.0f);
                            float quotientValue42 = (clampedValue33 * clampedValue33) * (1.0f / max(productValue213, 0.100000001490116119384765625f));
                            float clampedValue24;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue34 = clamp(((1.0f - quotientValue42) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue24 = clamp((((clampedValue34 * clampedValue34) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue34 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue42;
                            }
                            else
                            {
                                clampedValue24 = quotientValue42;
                            }
                            float productValue287 = clampedValue24 * loadedBufferValue43.w;
                            branchMergedValue3 = intermediateValue166;
                            branchMergedValue10 = intermediateValue164;
                            branchMergedValue11 = productValue287 * loadedBufferValue43.z;
                            branchMergedValue12 = productValue287 * loadedBufferValue43.y;
                            branchMergedValue13 = productValue287 * loadedBufferValue43.x;
                        }
                        else
                        {
                            branchMergedValue3 = 1.0f;
                            branchMergedValue10 = 1.0f;
                            branchMergedValue11 = 0.0f;
                            branchMergedValue12 = 0.0f;
                            branchMergedValue13 = 0.0f;
                        }
                        intermediateValue165 = branchMergedValue3;
                        intermediateValue163 = branchMergedValue10;
                        intermediateValue162 = branchMergedValue11;
                        intermediateValue161 = branchMergedValue12;
                        intermediateValue160 = branchMergedValue13;
                        float productValue352 = intermediateValue163 * quotientValue19;
                        float productValue353 = dotProductValue15 * intermediateValue165;
                        float productValue290 = sumValue6 * 0.3183098733425140380859375f;
                        float productValue354 = ((((productValue290 * exponentialValue) * intermediateValue160) * (productValue353 + (productValue352 * sumValue52))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue76;
                        float productValue355 = ((((productValue290 * exponentialValue1) * intermediateValue161) * (productValue353 + (productValue352 * sumValue53))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue77;
                        float productValue356 = ((((productValue290 * exponentialValue2) * intermediateValue162) * (productValue353 + (productValue352 * sumValue54))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue78;
                        float productValue357 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue163 * intermediateValue114);
                        float productValue358 = ((productValue357 * quotientValue21) * intermediateValue160) + scalarValue73;
                        float productValue359 = ((productValue357 * quotientValue22) * intermediateValue161) + scalarValue74;
                        float productValue360 = ((productValue357 * quotientValue23) * intermediateValue162) + scalarValue75;
                        uint sumValue193 = scalarValue127 + 1u;
                        if (int(sumValue193) < int(intermediateValue47))
                        {
                            scalarValue127 = sumValue193;
                            scalarValue73 = productValue358;
                            scalarValue74 = productValue359;
                            scalarValue75 = productValue360;
                            scalarValue76 = productValue354;
                            scalarValue77 = productValue355;
                            scalarValue78 = productValue356;
                            continue;
                        }
                        else
                        {
                            intermediateValue62 = productValue358;
                            intermediateValue64 = productValue359;
                            intermediateValue66 = productValue360;
                            intermediateValue68 = productValue354;
                            intermediateValue70 = productValue355;
                            intermediateValue72 = productValue356;
                            break;
                        }
                    }
                }
                intermediateValue61 = intermediateValue62;
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
                intermediateValue67 = intermediateValue68;
                intermediateValue69 = intermediateValue70;
                intermediateValue71 = intermediateValue72;
            }
            else
            {
                intermediateValue61 = 0.0f;
                intermediateValue63 = 0.0f;
                intermediateValue65 = 0.0f;
                intermediateValue67 = 0.0f;
                intermediateValue69 = 0.0f;
                intermediateValue71 = 0.0f;
            }
            float sumValue157 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue47 = (sumValue157 * intermediateValue61) + intermediateValue16;
            productValue48 = (sumValue157 * intermediateValue63) + intermediateValue17;
            productValue49 = (sumValue157 * intermediateValue65) + intermediateValue18;
            productValue50 = (sumValue157 * intermediateValue67) + intermediateValue19;
            productValue51 = (sumValue157 * intermediateValue69) + intermediateValue20;
            productValue52 = (sumValue157 * intermediateValue71) + intermediateValue21;
        }
        else
        {
            productValue47 = intermediateValue16;
            productValue48 = intermediateValue17;
            productValue49 = intermediateValue18;
            productValue50 = intermediateValue19;
            productValue51 = intermediateValue20;
            productValue52 = intermediateValue21;
        }
        float intermediateValue32;
        float intermediateValue33;
        float intermediateValue34;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#endif
        {
            float productValue103 = ((varyingTexCoord3.x + (-0.5f)) + (productValue11 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue104 = ((varyingTexCoord3.y + (-0.5f)) + (productValue12 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue111 = ((varyingTexCoord3.z + (-0.5f)) + (productValue13 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue112 = floor(productValue103 * 0.0625f) * 16.0f;
            float productValue113 = floor(productValue104 * 0.0625f) * 16.0f;
            float productValue114 = floor(productValue111 * 0.0625f) * 16.0f;
            uint productValue115 = uint(int(floor(float(int(uint(int(floor(productValue103))))) * 0.0625f)));
            uint productValue116 = uint(int(floor(float(int(uint(int(floor(productValue104))))) * 0.0625f)));
            uint productValue117 = uint(int(floor(float(int(uint(int(floor(productValue111))))) * 0.0625f)));
            float sumValue32 = productValue103 - productValue112;
            float sumValue33 = productValue104 - productValue113;
            float sumValue34 = productValue111 - productValue114;
            uint bitwiseValue1 = (productValue116 << 16u) | (productValue115 & 65535u);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue2 = productValue117 & 65535u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue35 = (productValue117 & 65535u) | 131072u;
#endif
            uint productValue118 = productValue115 * 1540483477u;
            uint productValue119 = productValue116 * 1540483477u;
            uint productValue120 = productValue117 * 1540483477u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue3 = ((((((((productValue118 >> 24u) ^ productValue118) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue119 >> 24u) ^ productValue119) * 1540483477u)) * 1540483477u) ^ (((productValue120 >> 24u) ^ productValue120) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue17 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue36 = (((((((((productValue118 >> 24u) ^ productValue118) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue119 >> 24u) ^ productValue119) * 1540483477u)) * 1540483477u) ^ (((productValue120 >> 24u) ^ productValue120) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue37 = ((bitwiseValue36 >> 13u) ^ bitwiseValue36) * 1540483477u;
            uint bitwiseValue38 = (bitwiseValue37 >> 15u) ^ bitwiseValue37;
            uint bitwiseValue39 = bitwiseValue38 >> 16u;
            uint bitwiseValue40 = bitwiseValue38 & 65535u;
            uint comparisonValue83 = uint(bitwiseValue40 == bitwiseValue39) | (bitwiseValue40 ^ bitwiseValue39);
#endif
            uint sumValue35 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            bool intermediateValue44;
            uint scalarValue24 = comparisonValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            bool intermediateValue72;
            uint scalarValue88 = comparisonValue83;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            bool intermediateValue45;
            uint scalarValue24 = comparisonValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            bool intermediateValue73;
            uint scalarValue88 = comparisonValue83;
#endif
            uint scalarValue25 = 0u;
            uint scalarValue26 = 0u;
            uint loadedBufferValue;
            uint bitwiseValue7;
            for (;;)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bitwiseValue7 = scalarValue24 & sumValue35;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bitwiseValue7 = scalarValue88 & sumValue35;
#endif
                uint loadedBufferValue1 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bool loadedBufferValue2 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue1 == comparisonValue17));
                loadedBufferValue = loadedBufferValue2 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue25;
                if ((loadedBufferValue1 == 0u) || loadedBufferValue2)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bool loadedBufferValue44 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue35) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue1 == comparisonValue83));
                loadedBufferValue = loadedBufferValue44 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue25;
                if ((loadedBufferValue1 == 0u) || loadedBufferValue44)
#endif
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue44 = loadedBufferValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue72 = loadedBufferValue44;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue45 = loadedBufferValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue73 = loadedBufferValue44;
#endif
                    break;
                }
                else
                {
                    uint sumValue36 = scalarValue26 + 1u;
                    if (int(sumValue36) < int(8u))
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        scalarValue24 = bitwiseValue7 + 1u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        scalarValue88 = bitwiseValue7 + 1u;
#endif
                        scalarValue25 = loadedBufferValue;
                        scalarValue26 = sumValue36;
                        continue;
                    }
                    else
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue44 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue72 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue45 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue73 = false;
#endif
                        break;
                    }
                }
            }
            uint bitwiseValue9 = loadedBufferValue >> 2u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue9;
            float branchMergedValue17;
            float branchMergedValue18;
            if (intermediateValue44)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue16;
            float branchMergedValue29;
            float branchMergedValue30;
            if (intermediateValue72)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue9;
            float branchMergedValue17;
            float branchMergedValue18;
            if (intermediateValue45)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue16;
            float branchMergedValue29;
            float branchMergedValue30;
            if (intermediateValue73)
#endif
            {
                float scalarValue27 = abs(productValue11);
                float scalarValue28 = abs(productValue12);
                float scalarValue29 = abs(productValue13);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue48;
                float branchMergedValue50;
                float branchMergedValue51;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue65;
                float branchMergedValue69;
                float branchMergedValue70;
#endif
                if (((scalarValue27 >= 1.0f) || (scalarValue28 >= 1.0f)) || (scalarValue29 >= 1.0f))
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue156;
                    float intermediateValue157;
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue165;
                    float intermediateValue167;
                    float intermediateValue169;
                    float intermediateValue171;
                    float intermediateValue172;
                    float intermediateValue173;
                    float productValue130;
                    float productValue131;
                    float productValue132;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float sumValue42;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float productValue133;
                    float productValue134;
                    float productValue135;
                    float productValue136;
                    bool comparisonValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue198;
                    float intermediateValue199;
                    float intermediateValue200;
                    float intermediateValue201;
                    float intermediateValue203;
                    float intermediateValue205;
                    float intermediateValue207;
                    float intermediateValue209;
                    float intermediateValue211;
                    float intermediateValue213;
                    float intermediateValue214;
                    float intermediateValue215;
                    float productValue186;
                    float productValue187;
                    float productValue188;
                    float sumValue58;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    float sumValue65;
                    float sumValue66;
                    float productValue189;
                    float productValue190;
                    float productValue191;
                    float productValue192;
                    bool comparisonValue23;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue157;
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue162;
                    float intermediateValue164;
                    float intermediateValue166;
                    float intermediateValue168;
                    float intermediateValue170;
                    float intermediateValue172;
                    float intermediateValue173;
                    float intermediateValue174;
                    float productValue132;
                    float productValue133;
                    float productValue134;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float sumValue42;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float productValue135;
                    float productValue136;
                    float productValue137;
                    float productValue138;
                    bool comparisonValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue199;
                    float intermediateValue200;
                    float intermediateValue201;
                    float intermediateValue202;
                    float intermediateValue204;
                    float intermediateValue206;
                    float intermediateValue208;
                    float intermediateValue210;
                    float intermediateValue212;
                    float intermediateValue214;
                    float intermediateValue215;
                    float intermediateValue216;
                    float productValue188;
                    float productValue189;
                    float productValue190;
                    float sumValue58;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    float sumValue65;
                    float sumValue66;
                    float productValue191;
                    float productValue192;
                    float productValue193;
                    float productValue194;
                    bool comparisonValue23;
#endif
                    for (;;)
                    {
                        float dotProductValue8 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue27, scalarValue28, scalarValue29));
                        float dotProductValue9 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue29, scalarValue27, scalarValue28));
                        float dotProductValue10 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue28, scalarValue29, scalarValue27));
                        float comparisonValue26 = ((inverseLengthValue1 * ((varyingNormal0.y + varyingNormal0.x) + varyingNormal0.z)) > 0.0f) ? ceil(dotProductValue8) : floor(dotProductValue8);
                        float scalarValue30 = floor(dotProductValue9);
                        float scalarValue31 = floor(dotProductValue10);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue130 = ((comparisonValue26 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                        productValue131 = ((comparisonValue26 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                        productValue132 = ((comparisonValue26 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                        sumValue37 = productValue130 + scalarValue29;
                        sumValue38 = productValue131 + scalarValue27;
                        sumValue39 = productValue132 + scalarValue28;
                        sumValue40 = productValue130 + scalarValue28;
                        sumValue41 = productValue131 + scalarValue29;
                        sumValue42 = productValue132 + scalarValue27;
                        sumValue43 = sumValue37 + scalarValue28;
                        sumValue44 = sumValue41 + scalarValue27;
                        sumValue45 = sumValue39 + scalarValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue186 = ((comparisonValue26 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                        productValue187 = ((comparisonValue26 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                        productValue188 = ((comparisonValue26 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                        sumValue58 = productValue186 + scalarValue29;
                        sumValue59 = productValue187 + scalarValue27;
                        sumValue60 = productValue188 + scalarValue28;
                        sumValue61 = productValue186 + scalarValue28;
                        sumValue62 = productValue187 + scalarValue29;
                        sumValue63 = productValue188 + scalarValue27;
                        sumValue64 = sumValue58 + scalarValue28;
                        sumValue65 = sumValue62 + scalarValue27;
                        sumValue66 = sumValue60 + scalarValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue132 = ((comparisonValue26 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                        productValue133 = ((comparisonValue26 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                        productValue134 = ((comparisonValue26 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                        sumValue37 = productValue132 + scalarValue29;
                        sumValue38 = productValue133 + scalarValue27;
                        sumValue39 = productValue134 + scalarValue28;
                        sumValue40 = productValue132 + scalarValue28;
                        sumValue41 = productValue133 + scalarValue29;
                        sumValue42 = productValue134 + scalarValue27;
                        sumValue43 = sumValue37 + scalarValue28;
                        sumValue44 = sumValue41 + scalarValue27;
                        sumValue45 = sumValue39 + scalarValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue188 = ((comparisonValue26 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                        productValue189 = ((comparisonValue26 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                        productValue190 = ((comparisonValue26 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                        sumValue58 = productValue188 + scalarValue29;
                        sumValue59 = productValue189 + scalarValue27;
                        sumValue60 = productValue190 + scalarValue28;
                        sumValue61 = productValue188 + scalarValue28;
                        sumValue62 = productValue189 + scalarValue29;
                        sumValue63 = productValue190 + scalarValue27;
                        sumValue64 = sumValue58 + scalarValue28;
                        sumValue65 = sumValue62 + scalarValue27;
                        sumValue66 = sumValue60 + scalarValue27;
#endif
                        float sumValue46 = dotProductValue9 - scalarValue30;
                        float sumValue47 = dotProductValue10 - scalarValue31;
                        float sumValue48 = 1.0f - sumValue46;
                        float sumValue49 = 1.0f - sumValue47;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue133 = sumValue49 * sumValue48;
                        productValue134 = sumValue49 * sumValue46;
                        productValue135 = sumValue48 * sumValue47;
                        productValue136 = sumValue47 * sumValue46;
                        comparisonValue16 = ((productValue132 >= 0.0f) && ((productValue130 >= 0.0f) && (productValue131 >= 0.0f))) && ((sumValue45 < 16.0f) && ((sumValue43 < 16.0f) && (sumValue44 < 16.0f)));
                        if (comparisonValue16)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue189 = sumValue49 * sumValue48;
                        productValue190 = sumValue49 * sumValue46;
                        productValue191 = sumValue48 * sumValue47;
                        productValue192 = sumValue47 * sumValue46;
                        comparisonValue23 = ((productValue188 >= 0.0f) && ((productValue186 >= 0.0f) && (productValue187 >= 0.0f))) && ((sumValue66 < 16.0f) && ((sumValue64 < 16.0f) && (sumValue65 < 16.0f)));
                        if (comparisonValue23)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue135 = sumValue49 * sumValue48;
                        productValue136 = sumValue49 * sumValue46;
                        productValue137 = sumValue48 * sumValue47;
                        productValue138 = sumValue47 * sumValue46;
                        comparisonValue16 = ((productValue134 >= 0.0f) && ((productValue132 >= 0.0f) && (productValue133 >= 0.0f))) && ((sumValue45 < 16.0f) && ((sumValue43 < 16.0f) && (sumValue44 < 16.0f)));
                        if (comparisonValue16)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue191 = sumValue49 * sumValue48;
                        productValue192 = sumValue49 * sumValue46;
                        productValue193 = sumValue48 * sumValue47;
                        productValue194 = sumValue47 * sumValue46;
                        comparisonValue23 = ((productValue190 >= 0.0f) && ((productValue188 >= 0.0f) && (productValue189 >= 0.0f))) && ((sumValue66 < 16.0f) && ((sumValue64 < 16.0f) && (sumValue65 < 16.0f)));
                        if (comparisonValue23)
#endif
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint4 loadedBufferValue4 = rdLoad_voxelBuffer(((uint(productValue131) + bitwiseValue9) + (uint(productValue132) << 4u)) + (uint(productValue130) << 8u));
                            uint scalarValue32 = loadedBufferValue4.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint4 loadedBufferValue45 = rdLoad_voxelBuffer(((uint(productValue187) + bitwiseValue9) + (uint(productValue188) << 4u)) + (uint(productValue186) << 8u));
                            uint scalarValue89 = loadedBufferValue45.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint4 loadedBufferValue61 = rdLoad_voxelBuffer(((uint(productValue133) + bitwiseValue9) + (uint(productValue134) << 4u)) + (uint(productValue132) << 8u));
                            uint scalarValue114 = loadedBufferValue61.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint4 loadedBufferValue66 = rdLoad_voxelBuffer(((uint(productValue189) + bitwiseValue9) + (uint(productValue190) << 4u)) + (uint(productValue188) << 8u));
                            uint scalarValue129 = loadedBufferValue66.x;
#endif
                            float bitwiseValue13;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue110;
                            float intermediateValue111;
                            if (scalarValue32 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue148;
                            float intermediateValue149;
                            if (scalarValue89 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue111;
                            float intermediateValue112;
                            if (scalarValue114 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue149;
                            float intermediateValue150;
                            if (scalarValue129 == 0u)
#endif
                            {
                                bitwiseValue13 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue110 = 0.0f;
                                intermediateValue111 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue148 = 0.0f;
                                intermediateValue149 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue111 = 0.0f;
                                intermediateValue112 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue149 = 0.0f;
                                intermediateValue150 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue11 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue32 & 255u);
                                intermediateValue110 = bitwiseValue11 * float((scalarValue32 >> 8u) & 255u);
                                intermediateValue111 = bitwiseValue11 * float((scalarValue32 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue41 = float(scalarValue89 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue41 * float(scalarValue89 & 255u);
                                intermediateValue148 = bitwiseValue41 * float((scalarValue89 >> 8u) & 255u);
                                intermediateValue149 = bitwiseValue41 * float((scalarValue89 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue59 = float(scalarValue114 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue59 * float(scalarValue114 & 255u);
                                intermediateValue111 = bitwiseValue59 * float((scalarValue114 >> 8u) & 255u);
                                intermediateValue112 = bitwiseValue59 * float((scalarValue114 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue66 = float(scalarValue129 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue66 * float(scalarValue129 & 255u);
                                intermediateValue149 = bitwiseValue66 * float((scalarValue129 >> 8u) & 255u);
                                intermediateValue150 = bitwiseValue66 * float((scalarValue129 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue5 = rdLoad_voxelBuffer(((uint(sumValue38) + bitwiseValue9) + (uint(sumValue39) << 4u)) + (uint(sumValue37) << 8u));
                            uint scalarValue33 = loadedBufferValue5.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue46 = rdLoad_voxelBuffer(((uint(sumValue59) + bitwiseValue9) + (uint(sumValue60) << 4u)) + (uint(sumValue58) << 8u));
                            uint scalarValue90 = loadedBufferValue46.x;
#endif
                            float bitwiseValue17;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue122;
                            float intermediateValue123;
                            if (scalarValue33 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue166;
                            float intermediateValue167;
                            if (scalarValue90 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue123;
                            float intermediateValue124;
                            if (scalarValue33 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue167;
                            float intermediateValue168;
                            if (scalarValue90 == 0u)
#endif
                            {
                                bitwiseValue17 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue122 = 0.0f;
                                intermediateValue123 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue166 = 0.0f;
                                intermediateValue167 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue123 = 0.0f;
                                intermediateValue124 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue167 = 0.0f;
                                intermediateValue168 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue12 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue33 & 255u);
                                intermediateValue122 = bitwiseValue12 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue123 = bitwiseValue12 * float((scalarValue33 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue42 = float(scalarValue90 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue42 * float(scalarValue90 & 255u);
                                intermediateValue166 = bitwiseValue42 * float((scalarValue90 >> 8u) & 255u);
                                intermediateValue167 = bitwiseValue42 * float((scalarValue90 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue12 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue33 & 255u);
                                intermediateValue123 = bitwiseValue12 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue124 = bitwiseValue12 * float((scalarValue33 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue42 = float(scalarValue90 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue42 * float(scalarValue90 & 255u);
                                intermediateValue167 = bitwiseValue42 * float((scalarValue90 >> 8u) & 255u);
                                intermediateValue168 = bitwiseValue42 * float((scalarValue90 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue6 = rdLoad_voxelBuffer(((uint(sumValue41) + bitwiseValue9) + (uint(sumValue42) << 4u)) + (uint(sumValue40) << 8u));
                            uint scalarValue34 = loadedBufferValue6.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue47 = rdLoad_voxelBuffer(((uint(sumValue62) + bitwiseValue9) + (uint(sumValue63) << 4u)) + (uint(sumValue61) << 8u));
                            uint scalarValue91 = loadedBufferValue47.x;
#endif
                            float bitwiseValue21;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue141;
                            float intermediateValue142;
                            if (scalarValue34 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue192;
                            float intermediateValue193;
                            if (scalarValue91 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue142;
                            float intermediateValue143;
                            if (scalarValue34 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue193;
                            float intermediateValue194;
                            if (scalarValue91 == 0u)
#endif
                            {
                                bitwiseValue21 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue141 = 0.0f;
                                intermediateValue142 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue192 = 0.0f;
                                intermediateValue193 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue142 = 0.0f;
                                intermediateValue143 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue193 = 0.0f;
                                intermediateValue194 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue34 & 255u);
                                intermediateValue141 = bitwiseValue14 * float((scalarValue34 >> 8u) & 255u);
                                intermediateValue142 = bitwiseValue14 * float((scalarValue34 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue7 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                            uint scalarValue35 = loadedBufferValue7.x;
                            float branchMergedValue15;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue44;
                            float branchMergedValue45;
                            if (scalarValue35 == 0u)
                            {
                                branchMergedValue15 = 0.0f;
                                branchMergedValue26 = 0.0f;
                                branchMergedValue27 = 0.0f;
                                branchMergedValue28 = intermediateValue142;
                                branchMergedValue29 = intermediateValue141;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue123;
                                branchMergedValue32 = intermediateValue122;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue111;
                                branchMergedValue44 = intermediateValue110;
                                branchMergedValue45 = bitwiseValue13;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue15 = bitwiseValue16 * float((scalarValue35 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue35 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue35 & 255u);
                                branchMergedValue28 = intermediateValue142;
                                branchMergedValue29 = intermediateValue141;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue123;
                                branchMergedValue32 = intermediateValue122;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue111;
                                branchMergedValue44 = intermediateValue110;
                                branchMergedValue45 = bitwiseValue13;
                            }
                            intermediateValue156 = branchMergedValue45;
                            intermediateValue157 = branchMergedValue44;
                            intermediateValue158 = branchMergedValue34;
                            intermediateValue159 = branchMergedValue33;
                            intermediateValue161 = branchMergedValue32;
                            intermediateValue163 = branchMergedValue31;
                            intermediateValue165 = branchMergedValue30;
                            intermediateValue167 = branchMergedValue29;
                            intermediateValue169 = branchMergedValue28;
                            intermediateValue171 = branchMergedValue27;
                            intermediateValue172 = branchMergedValue26;
                            intermediateValue173 = branchMergedValue15;
                            break;
                        }
                        else
                        {
                            float intermediateValue125;
                            float intermediateValue126;
                            float intermediateValue127;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            uint comparisonValue24;
                            bool comparisonValue25;
                            for (;;)
                            {
                                sumValue66 = productValue130 + productValue112;
                                sumValue67 = productValue131 + productValue113;
                                sumValue68 = productValue132 + productValue114;
                                uint comparisonValue31 = ((((uint(productValue130 >= 16.0f) << 1u) | uint(productValue130 < 0.0f)) | (uint(productValue131 < 0.0f) << 2u)) | (uint(productValue131 >= 16.0f) << 3u)) | (uint(productValue132 < 0.0f) << 4u);
                                comparisonValue24 = intermediateValue[comparisonValue31 | (uint(productValue132 >= 16.0f) << 5u)];
                                comparisonValue25 = ((((comparisonValue31 | (uint(productValue132 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue31 & 31u))) == 0u;
                                uint loadedBufferValue8;
                                if (comparisonValue25)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                    {
                                        intermediateValue125 = 0.0f;
                                        intermediateValue126 = 0.0f;
                                        intermediateValue127 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue8 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue24).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue8 = ((((uint(productValue132) << 4u) & 240u) | (uint(productValue131) & 15u)) | ((uint(productValue130) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                uint scalarValue36 = loadedBufferValue9.x;
                                if (scalarValue36 == 0u)
                                {
                                    intermediateValue125 = 0.0f;
                                    intermediateValue126 = 0.0f;
                                    intermediateValue127 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue125 = bitwiseValue18 * float(scalarValue36 & 255u);
                                intermediateValue126 = bitwiseValue18 * float((scalarValue36 >> 8u) & 255u);
                                intermediateValue127 = bitwiseValue18 * float((scalarValue36 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue160;
                            float intermediateValue162;
                            float intermediateValue164;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue87 = sumValue37 + productValue112;
                                sumValue88 = sumValue38 + productValue113;
                                sumValue89 = sumValue39 + productValue114;
                                uint comparisonValue35 = ((((uint(sumValue37 >= 16.0f) << 1u) | uint(sumValue37 < 0.0f)) | (uint(sumValue38 < 0.0f) << 2u)) | (uint(sumValue38 >= 16.0f) << 3u)) | (uint(sumValue39 < 0.0f) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue35 | (uint(sumValue39 >= 16.0f) << 5u)];
                                comparisonValue37 = ((((comparisonValue35 | (uint(sumValue39 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                                uint loadedBufferValue15;
                                if (comparisonValue37)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue160 = 0.0f;
                                        intermediateValue162 = 0.0f;
                                        intermediateValue164 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue15 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue36).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue15 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                uint scalarValue37 = loadedBufferValue12.x;
                                if (scalarValue37 == 0u)
                                {
                                    intermediateValue160 = 0.0f;
                                    intermediateValue162 = 0.0f;
                                    intermediateValue164 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue160 = bitwiseValue20 * float(scalarValue37 & 255u);
                                intermediateValue162 = bitwiseValue20 * float((scalarValue37 >> 8u) & 255u);
                                intermediateValue164 = bitwiseValue20 * float((scalarValue37 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue166;
                            float intermediateValue168;
                            float intermediateValue170;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue46;
                            bool comparisonValue47;
                            for (;;)
                            {
                                sumValue96 = sumValue40 + productValue112;
                                sumValue97 = sumValue41 + productValue113;
                                sumValue98 = sumValue42 + productValue114;
                                uint comparisonValue38 = ((((uint(sumValue40 >= 16.0f) << 1u) | uint(sumValue40 < 0.0f)) | (uint(sumValue41 < 0.0f) << 2u)) | (uint(sumValue41 >= 16.0f) << 3u)) | (uint(sumValue42 < 0.0f) << 4u);
                                comparisonValue46 = intermediateValue[comparisonValue38 | (uint(sumValue42 >= 16.0f) << 5u)];
                                comparisonValue47 = ((((comparisonValue38 | (uint(sumValue42 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue47)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue46 & 31u))) == 0u)
                                    {
                                        intermediateValue166 = 0.0f;
                                        intermediateValue168 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue46).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue38 = loadedBufferValue14.x;
                                if (scalarValue38 == 0u)
                                {
                                    intermediateValue166 = 0.0f;
                                    intermediateValue168 = 0.0f;
                                    intermediateValue170 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue166 = bitwiseValue22 * float(scalarValue38 & 255u);
                                intermediateValue168 = bitwiseValue22 * float((scalarValue38 >> 8u) & 255u);
                                intermediateValue170 = bitwiseValue22 * float((scalarValue38 >> 16u) & 255u);
                                break;
                            }
                            float sumValue50 = sumValue43 + productValue112;
                            float sumValue51 = sumValue44 + productValue113;
                            float sumValue69 = sumValue45 + productValue114;
                            uint comparisonValue41 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                            uint comparisonValue48 = comparisonValue41 | (uint(sumValue45 >= 16.0f) << 5u);
                            uint loadedBufferValue23;
                            if ((((comparisonValue48 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue41 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue48] & 31u))) == 0u)
                                {
                                    intermediateValue156 = intermediateValue125;
                                    intermediateValue157 = intermediateValue126;
                                    intermediateValue158 = intermediateValue127;
                                    intermediateValue159 = intermediateValue160;
                                    intermediateValue161 = intermediateValue162;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = intermediateValue170;
                                    intermediateValue171 = 0.0f;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue48]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue39 = loadedBufferValue16.x;
                            if (scalarValue39 == 0u)
                            {
                                intermediateValue156 = intermediateValue125;
                                intermediateValue157 = intermediateValue126;
                                intermediateValue158 = intermediateValue127;
                                intermediateValue159 = intermediateValue160;
                                intermediateValue161 = intermediateValue162;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = 0.0f;
                                intermediateValue172 = 0.0f;
                                intermediateValue173 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue156 = intermediateValue125;
                            intermediateValue157 = intermediateValue126;
                            intermediateValue158 = intermediateValue127;
                            intermediateValue159 = intermediateValue160;
                            intermediateValue161 = intermediateValue162;
                            intermediateValue163 = intermediateValue164;
                            intermediateValue165 = intermediateValue166;
                            intermediateValue167 = intermediateValue168;
                            intermediateValue169 = intermediateValue170;
                            intermediateValue171 = bitwiseValue23 * float(scalarValue39 & 255u);
                            intermediateValue172 = bitwiseValue23 * float((scalarValue39 >> 8u) & 255u);
                            intermediateValue173 = bitwiseValue23 * float((scalarValue39 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue48 = (((intermediateValue163 * productValue134) + (intermediateValue158 * productValue133)) + (intermediateValue169 * productValue135)) + (intermediateValue173 * productValue136);
                    branchMergedValue50 = (((intermediateValue161 * productValue134) + (intermediateValue157 * productValue133)) + (intermediateValue167 * productValue135)) + (intermediateValue172 * productValue136);
                    branchMergedValue51 = (((intermediateValue159 * productValue134) + (intermediateValue156 * productValue133)) + (intermediateValue165 * productValue135)) + (intermediateValue171 * productValue136);
                }
                else
                {
                    float intermediateValue175;
                    float intermediateValue176;
                    float intermediateValue177;
                    float intermediateValue178;
                    float intermediateValue180;
                    float intermediateValue182;
                    float intermediateValue184;
                    float intermediateValue186;
                    float intermediateValue188;
                    float intermediateValue190;
                    float intermediateValue191;
                    float intermediateValue192;
                    float intermediateValue76;
                    float intermediateValue77;
                    float intermediateValue78;
                    uint intermediateValue79;
                    uint intermediateValue80;
                    uint intermediateValue81;
                    float intermediateValue84;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float sumValue58;
                    bool comparisonValue18;
                    uint productValue137;
                    uint productValue138;
                    uint productValue139;
                    uint productValue140;
                    uint productValue141;
                    uint productValue142;
                    for (;;)
                    {
                        intermediateValue76 = floor(sumValue32);
                        intermediateValue77 = floor(sumValue33);
                        intermediateValue78 = floor(sumValue34);
                        float sumValue80 = sumValue32 - intermediateValue76;
                        float sumValue81 = sumValue33 - intermediateValue77;
                        float sumValue82 = sumValue34 - intermediateValue78;
                        uint comparisonValue51 = ((uint(sumValue81 >= sumValue82) << 1u) | uint(sumValue80 >= sumValue81)) | (uint(sumValue80 >= sumValue82) << 2u);
                        intermediateValue79 = uint(intermediateValue76);
                        intermediateValue80 = uint(intermediateValue77);
                        intermediateValue81 = uint(intermediateValue78);
                        float scalarValue40 = min(sumValue80, sumValue81);
                        float scalarValue41 = max(sumValue80, sumValue81);
                        intermediateValue84 = min(scalarValue40, sumValue82);
                        float scalarValue42 = max(scalarValue41, sumValue82);
                        float scalarValue43 = max(min(scalarValue41, sumValue82), scalarValue40);
                        sumValue53 = 1.0f - scalarValue42;
                        sumValue54 = scalarValue42 - scalarValue43;
                        sumValue55 = scalarValue43 - intermediateValue84;
                        sumValue56 = intermediateValue76 + 1.0f;
                        sumValue57 = intermediateValue77 + 1.0f;
                        sumValue58 = intermediateValue78 + 1.0f;
                        comparisonValue18 = (((intermediateValue76 >= 0.0f) && (intermediateValue77 >= 0.0f)) && (intermediateValue78 >= 0.0f)) && (((sumValue56 < 16.0f) && (sumValue57 < 16.0f)) && (sumValue58 < 16.0f));
                        productValue137 = 0u + (comparisonValue51 * 3u);
                        productValue138 = 1u + (comparisonValue51 * 3u);
                        productValue139 = 2u + (comparisonValue51 * 3u);
                        productValue140 = 0u + (comparisonValue51 * 3u);
                        productValue141 = 1u + (comparisonValue51 * 3u);
                        productValue142 = 2u + (comparisonValue51 * 3u);
                        if (comparisonValue18)
                        {
                            uint bitwiseValue25 = intermediateValue81 << 4u;
                            uint sumValue83 = intermediateValue80 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue83 + (intermediateValue79 << 8u);
                            uint4 loadedBufferValue18 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue44 = loadedBufferValue18.x;
                            float bitwiseValue15;
                            float intermediateValue113;
                            float intermediateValue114;
                            if (scalarValue44 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue113 = 0.0f;
                                intermediateValue114 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue44 & 255u);
                                intermediateValue113 = bitwiseValue27 * float((scalarValue44 >> 8u) & 255u);
                                intermediateValue114 = bitwiseValue27 * float((scalarValue44 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue20 = rdLoad_voxelBuffer(((intermediateValue1[productValue138] + sumValue83) + ((intermediateValue1[productValue137] + intermediateValue79) << 8u)) + ((intermediateValue1[productValue139] + intermediateValue81) << 4u));
                            uint scalarValue45 = loadedBufferValue20.x;
                            float bitwiseValue19;
                            float intermediateValue129;
                            float intermediateValue130;
                            if (scalarValue45 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue129 = 0.0f;
                                intermediateValue130 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue45 & 255u);
                                intermediateValue129 = bitwiseValue28 * float((scalarValue45 >> 8u) & 255u);
                                intermediateValue130 = bitwiseValue28 * float((scalarValue45 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue22 = rdLoad_voxelBuffer(((intermediateValue2[productValue141] + sumValue83) + ((intermediateValue2[productValue140] + intermediateValue79) << 8u)) + ((intermediateValue2[productValue142] + intermediateValue81) << 4u));
                            uint scalarValue46 = loadedBufferValue22.x;
                            float bitwiseValue24;
                            float intermediateValue144;
                            float intermediateValue145;
                            if (scalarValue46 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue144 = 0.0f;
                                intermediateValue145 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue46 & 255u);
                                intermediateValue144 = bitwiseValue29 * float((scalarValue46 >> 8u) & 255u);
                                intermediateValue145 = bitwiseValue29 * float((scalarValue46 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue27 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue47 = loadedBufferValue27.x;
                            float branchMergedValue16;
                            float branchMergedValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue43 = float(scalarValue91 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue43 * float(scalarValue91 & 255u);
                                intermediateValue192 = bitwiseValue43 * float((scalarValue91 >> 8u) & 255u);
                                intermediateValue193 = bitwiseValue43 * float((scalarValue91 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue48 = rdLoad_voxelBuffer(((uint(sumValue65) + bitwiseValue9) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u));
                            uint scalarValue92 = loadedBufferValue48.x;
                            float branchMergedValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue34 & 255u);
                                intermediateValue142 = bitwiseValue14 * float((scalarValue34 >> 8u) & 255u);
                                intermediateValue143 = bitwiseValue14 * float((scalarValue34 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue7 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                            uint scalarValue35 = loadedBufferValue7.x;
                            float branchMergedValue15;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue44;
                            float branchMergedValue45;
                            if (scalarValue35 == 0u)
                            {
                                branchMergedValue15 = 0.0f;
                                branchMergedValue26 = 0.0f;
                                branchMergedValue27 = 0.0f;
                                branchMergedValue28 = intermediateValue143;
                                branchMergedValue29 = intermediateValue142;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue124;
                                branchMergedValue32 = intermediateValue123;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue112;
                                branchMergedValue44 = intermediateValue111;
                                branchMergedValue45 = bitwiseValue13;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue15 = bitwiseValue16 * float((scalarValue35 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue35 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue35 & 255u);
                                branchMergedValue28 = intermediateValue143;
                                branchMergedValue29 = intermediateValue142;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue124;
                                branchMergedValue32 = intermediateValue123;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue112;
                                branchMergedValue44 = intermediateValue111;
                                branchMergedValue45 = bitwiseValue13;
                            }
                            intermediateValue157 = branchMergedValue45;
                            intermediateValue158 = branchMergedValue44;
                            intermediateValue159 = branchMergedValue34;
                            intermediateValue160 = branchMergedValue33;
                            intermediateValue162 = branchMergedValue32;
                            intermediateValue164 = branchMergedValue31;
                            intermediateValue166 = branchMergedValue30;
                            intermediateValue168 = branchMergedValue29;
                            intermediateValue170 = branchMergedValue28;
                            intermediateValue172 = branchMergedValue27;
                            intermediateValue173 = branchMergedValue26;
                            intermediateValue174 = branchMergedValue15;
                            break;
                        }
                        else
                        {
                            float intermediateValue126;
                            float intermediateValue127;
                            float intermediateValue128;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            uint comparisonValue24;
                            bool comparisonValue25;
                            for (;;)
                            {
                                sumValue66 = productValue132 + productValue112;
                                sumValue67 = productValue133 + productValue113;
                                sumValue68 = productValue134 + productValue114;
                                uint comparisonValue107 = ((((uint(productValue132 >= 16.0f) << 1u) | uint(productValue132 < 0.0f)) | (uint(productValue133 < 0.0f) << 2u)) | (uint(productValue133 >= 16.0f) << 3u)) | (uint(productValue134 < 0.0f) << 4u);
                                comparisonValue24 = intermediateValue[comparisonValue107 | (uint(productValue134 >= 16.0f) << 5u)];
                                comparisonValue25 = ((((comparisonValue107 | (uint(productValue134 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue107 & 31u))) == 0u;
                                uint loadedBufferValue8;
                                if (comparisonValue25)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                    {
                                        intermediateValue126 = 0.0f;
                                        intermediateValue127 = 0.0f;
                                        intermediateValue128 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue8 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue24).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue8 = ((((uint(productValue134) << 4u) & 240u) | (uint(productValue133) & 15u)) | ((uint(productValue132) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                uint scalarValue36 = loadedBufferValue9.x;
                                if (scalarValue36 == 0u)
                                {
                                    intermediateValue126 = 0.0f;
                                    intermediateValue127 = 0.0f;
                                    intermediateValue128 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue126 = bitwiseValue18 * float(scalarValue36 & 255u);
                                intermediateValue127 = bitwiseValue18 * float((scalarValue36 >> 8u) & 255u);
                                intermediateValue128 = bitwiseValue18 * float((scalarValue36 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue161;
                            float intermediateValue163;
                            float intermediateValue165;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue87 = sumValue37 + productValue112;
                                sumValue88 = sumValue38 + productValue113;
                                sumValue89 = sumValue39 + productValue114;
                                uint comparisonValue35 = ((((uint(sumValue37 >= 16.0f) << 1u) | uint(sumValue37 < 0.0f)) | (uint(sumValue38 < 0.0f) << 2u)) | (uint(sumValue38 >= 16.0f) << 3u)) | (uint(sumValue39 < 0.0f) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue35 | (uint(sumValue39 >= 16.0f) << 5u)];
                                comparisonValue37 = ((((comparisonValue35 | (uint(sumValue39 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                                uint loadedBufferValue15;
                                if (comparisonValue37)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue161 = 0.0f;
                                        intermediateValue163 = 0.0f;
                                        intermediateValue165 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue15 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue36).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue15 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                uint scalarValue37 = loadedBufferValue12.x;
                                if (scalarValue37 == 0u)
                                {
                                    intermediateValue161 = 0.0f;
                                    intermediateValue163 = 0.0f;
                                    intermediateValue165 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue161 = bitwiseValue20 * float(scalarValue37 & 255u);
                                intermediateValue163 = bitwiseValue20 * float((scalarValue37 >> 8u) & 255u);
                                intermediateValue165 = bitwiseValue20 * float((scalarValue37 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue167;
                            float intermediateValue169;
                            float intermediateValue171;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue46;
                            bool comparisonValue47;
                            for (;;)
                            {
                                sumValue96 = sumValue40 + productValue112;
                                sumValue97 = sumValue41 + productValue113;
                                sumValue98 = sumValue42 + productValue114;
                                uint comparisonValue38 = ((((uint(sumValue40 >= 16.0f) << 1u) | uint(sumValue40 < 0.0f)) | (uint(sumValue41 < 0.0f) << 2u)) | (uint(sumValue41 >= 16.0f) << 3u)) | (uint(sumValue42 < 0.0f) << 4u);
                                comparisonValue46 = intermediateValue[comparisonValue38 | (uint(sumValue42 >= 16.0f) << 5u)];
                                comparisonValue47 = ((((comparisonValue38 | (uint(sumValue42 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue47)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue46 & 31u))) == 0u)
                                    {
                                        intermediateValue167 = 0.0f;
                                        intermediateValue169 = 0.0f;
                                        intermediateValue171 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue46).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue38 = loadedBufferValue14.x;
                                if (scalarValue38 == 0u)
                                {
                                    intermediateValue167 = 0.0f;
                                    intermediateValue169 = 0.0f;
                                    intermediateValue171 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue167 = bitwiseValue22 * float(scalarValue38 & 255u);
                                intermediateValue169 = bitwiseValue22 * float((scalarValue38 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue22 * float((scalarValue38 >> 16u) & 255u);
                                break;
                            }
                            float sumValue50 = sumValue43 + productValue112;
                            float sumValue51 = sumValue44 + productValue113;
                            float sumValue69 = sumValue45 + productValue114;
                            uint comparisonValue41 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                            uint comparisonValue48 = comparisonValue41 | (uint(sumValue45 >= 16.0f) << 5u);
                            uint loadedBufferValue23;
                            if ((((comparisonValue48 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue41 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue48] & 31u))) == 0u)
                                {
                                    intermediateValue157 = intermediateValue126;
                                    intermediateValue158 = intermediateValue127;
                                    intermediateValue159 = intermediateValue128;
                                    intermediateValue160 = intermediateValue161;
                                    intermediateValue162 = intermediateValue163;
                                    intermediateValue164 = intermediateValue165;
                                    intermediateValue166 = intermediateValue167;
                                    intermediateValue168 = intermediateValue169;
                                    intermediateValue170 = intermediateValue171;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                    intermediateValue174 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue48]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue39 = loadedBufferValue16.x;
                            if (scalarValue39 == 0u)
                            {
                                intermediateValue157 = intermediateValue126;
                                intermediateValue158 = intermediateValue127;
                                intermediateValue159 = intermediateValue128;
                                intermediateValue160 = intermediateValue161;
                                intermediateValue162 = intermediateValue163;
                                intermediateValue164 = intermediateValue165;
                                intermediateValue166 = intermediateValue167;
                                intermediateValue168 = intermediateValue169;
                                intermediateValue170 = intermediateValue171;
                                intermediateValue172 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue157 = intermediateValue126;
                            intermediateValue158 = intermediateValue127;
                            intermediateValue159 = intermediateValue128;
                            intermediateValue160 = intermediateValue161;
                            intermediateValue162 = intermediateValue163;
                            intermediateValue164 = intermediateValue165;
                            intermediateValue166 = intermediateValue167;
                            intermediateValue168 = intermediateValue169;
                            intermediateValue170 = intermediateValue171;
                            intermediateValue172 = bitwiseValue23 * float(scalarValue39 & 255u);
                            intermediateValue173 = bitwiseValue23 * float((scalarValue39 >> 8u) & 255u);
                            intermediateValue174 = bitwiseValue23 * float((scalarValue39 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue48 = (((intermediateValue164 * productValue136) + (intermediateValue159 * productValue135)) + (intermediateValue170 * productValue137)) + (intermediateValue174 * productValue138);
                    branchMergedValue50 = (((intermediateValue162 * productValue136) + (intermediateValue158 * productValue135)) + (intermediateValue168 * productValue137)) + (intermediateValue173 * productValue138);
                    branchMergedValue51 = (((intermediateValue160 * productValue136) + (intermediateValue157 * productValue135)) + (intermediateValue166 * productValue137)) + (intermediateValue172 * productValue138);
                }
                else
                {
                    float intermediateValue176;
                    float intermediateValue177;
                    float intermediateValue178;
                    float intermediateValue179;
                    float intermediateValue181;
                    float intermediateValue183;
                    float intermediateValue185;
                    float intermediateValue187;
                    float intermediateValue189;
                    float intermediateValue191;
                    float intermediateValue192;
                    float intermediateValue193;
                    float intermediateValue77;
                    float intermediateValue78;
                    float intermediateValue79;
                    uint intermediateValue80;
                    uint intermediateValue81;
                    uint intermediateValue82;
                    float intermediateValue85;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float sumValue58;
                    bool comparisonValue18;
                    uint productValue139;
                    uint productValue140;
                    uint productValue141;
                    uint productValue142;
                    uint productValue143;
                    uint productValue144;
                    for (;;)
                    {
                        intermediateValue77 = floor(sumValue32);
                        intermediateValue78 = floor(sumValue33);
                        intermediateValue79 = floor(sumValue34);
                        float sumValue178 = sumValue32 - intermediateValue77;
                        float sumValue179 = sumValue33 - intermediateValue78;
                        float sumValue180 = sumValue34 - intermediateValue79;
                        uint comparisonValue108 = ((uint(sumValue179 >= sumValue180) << 1u) | uint(sumValue178 >= sumValue179)) | (uint(sumValue178 >= sumValue180) << 2u);
                        intermediateValue80 = uint(intermediateValue77);
                        intermediateValue81 = uint(intermediateValue78);
                        intermediateValue82 = uint(intermediateValue79);
                        float scalarValue115 = min(sumValue178, sumValue179);
                        float scalarValue116 = max(sumValue178, sumValue179);
                        intermediateValue85 = min(scalarValue115, sumValue180);
                        float scalarValue117 = max(scalarValue116, sumValue180);
                        float scalarValue118 = max(min(scalarValue116, sumValue180), scalarValue115);
                        sumValue53 = 1.0f - scalarValue117;
                        sumValue54 = scalarValue117 - scalarValue118;
                        sumValue55 = scalarValue118 - intermediateValue85;
                        sumValue56 = intermediateValue77 + 1.0f;
                        sumValue57 = intermediateValue78 + 1.0f;
                        sumValue58 = intermediateValue79 + 1.0f;
                        comparisonValue18 = (((intermediateValue77 >= 0.0f) && (intermediateValue78 >= 0.0f)) && (intermediateValue79 >= 0.0f)) && (((sumValue56 < 16.0f) && (sumValue57 < 16.0f)) && (sumValue58 < 16.0f));
                        productValue139 = 0u + (comparisonValue108 * 3u);
                        productValue140 = 1u + (comparisonValue108 * 3u);
                        productValue141 = 2u + (comparisonValue108 * 3u);
                        productValue142 = 0u + (comparisonValue108 * 3u);
                        productValue143 = 1u + (comparisonValue108 * 3u);
                        productValue144 = 2u + (comparisonValue108 * 3u);
                        if (comparisonValue18)
                        {
                            uint bitwiseValue60 = intermediateValue82 << 4u;
                            uint sumValue181 = intermediateValue81 + bitwiseValue9;
                            uint bitwiseValue61 = sumValue181 + (intermediateValue80 << 8u);
                            uint4 loadedBufferValue62 = rdLoad_voxelBuffer(bitwiseValue61 + bitwiseValue60);
                            uint scalarValue119 = loadedBufferValue62.x;
                            float bitwiseValue15;
                            float intermediateValue114;
                            float intermediateValue115;
                            if (scalarValue119 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue114 = 0.0f;
                                intermediateValue115 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue62 = float(scalarValue119 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue62 * float(scalarValue119 & 255u);
                                intermediateValue114 = bitwiseValue62 * float((scalarValue119 >> 8u) & 255u);
                                intermediateValue115 = bitwiseValue62 * float((scalarValue119 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue63 = rdLoad_voxelBuffer(((intermediateValue1[productValue140] + sumValue181) + ((intermediateValue1[productValue139] + intermediateValue80) << 8u)) + ((intermediateValue1[productValue141] + intermediateValue82) << 4u));
                            uint scalarValue120 = loadedBufferValue63.x;
                            float bitwiseValue19;
                            float intermediateValue130;
                            float intermediateValue131;
                            if (scalarValue120 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue130 = 0.0f;
                                intermediateValue131 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue63 = float(scalarValue120 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue63 * float(scalarValue120 & 255u);
                                intermediateValue130 = bitwiseValue63 * float((scalarValue120 >> 8u) & 255u);
                                intermediateValue131 = bitwiseValue63 * float((scalarValue120 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue64 = rdLoad_voxelBuffer(((intermediateValue2[productValue143] + sumValue181) + ((intermediateValue2[productValue142] + intermediateValue80) << 8u)) + ((intermediateValue2[productValue144] + intermediateValue82) << 4u));
                            uint scalarValue121 = loadedBufferValue64.x;
                            float bitwiseValue24;
                            float intermediateValue145;
                            float intermediateValue146;
                            if (scalarValue121 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue145 = 0.0f;
                                intermediateValue146 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue64 = float(scalarValue121 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue64 * float(scalarValue121 & 255u);
                                intermediateValue145 = bitwiseValue64 * float((scalarValue121 >> 8u) & 255u);
                                intermediateValue146 = bitwiseValue64 * float((scalarValue121 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue65 = rdLoad_voxelBuffer((bitwiseValue61 + 273u) + bitwiseValue60);
                            uint scalarValue122 = loadedBufferValue65.x;
                            float branchMergedValue16;
                            float branchMergedValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue43 = float(scalarValue91 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue43 * float(scalarValue91 & 255u);
                                intermediateValue193 = bitwiseValue43 * float((scalarValue91 >> 8u) & 255u);
                                intermediateValue194 = bitwiseValue43 * float((scalarValue91 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue48 = rdLoad_voxelBuffer(((uint(sumValue65) + bitwiseValue9) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u));
                            uint scalarValue92 = loadedBufferValue48.x;
                            float branchMergedValue22;
#endif
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float branchMergedValue46;
                            float branchMergedValue47;
                            if (scalarValue47 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float branchMergedValue44;
                            float branchMergedValue60;
                            float branchMergedValue61;
                            if (scalarValue92 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float branchMergedValue46;
                            float branchMergedValue47;
                            if (scalarValue122 == 0u)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue16 = 0.0f;
                                branchMergedValue35 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue22 = 0.0f;
#endif
                                branchMergedValue36 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue37 = bitwiseValue15;
                                branchMergedValue38 = intermediateValue113;
                                branchMergedValue39 = intermediateValue114;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue129;
                                branchMergedValue42 = intermediateValue130;
                                branchMergedValue43 = bitwiseValue24;
                                branchMergedValue46 = intermediateValue144;
                                branchMergedValue47 = intermediateValue145;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue37 = 0.0f;
                                branchMergedValue38 = intermediateValue193;
                                branchMergedValue39 = intermediateValue192;
                                branchMergedValue40 = bitwiseValue21;
                                branchMergedValue41 = intermediateValue167;
                                branchMergedValue42 = intermediateValue166;
                                branchMergedValue43 = bitwiseValue17;
                                branchMergedValue44 = intermediateValue149;
                                branchMergedValue60 = intermediateValue148;
                                branchMergedValue61 = bitwiseValue13;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue37 = bitwiseValue15;
                                branchMergedValue38 = intermediateValue114;
                                branchMergedValue39 = intermediateValue115;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue130;
                                branchMergedValue42 = intermediateValue131;
                                branchMergedValue43 = bitwiseValue24;
                                branchMergedValue46 = intermediateValue145;
                                branchMergedValue47 = intermediateValue146;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue37 = 0.0f;
                                branchMergedValue38 = intermediateValue194;
                                branchMergedValue39 = intermediateValue193;
                                branchMergedValue40 = bitwiseValue21;
                                branchMergedValue41 = intermediateValue168;
                                branchMergedValue42 = intermediateValue167;
                                branchMergedValue43 = bitwiseValue17;
                                branchMergedValue44 = intermediateValue150;
                                branchMergedValue60 = intermediateValue149;
                                branchMergedValue61 = bitwiseValue13;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue30 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue16 = bitwiseValue30 * float(scalarValue47 & 255u);
                                branchMergedValue35 = bitwiseValue30 * float((scalarValue47 >> 8u) & 255u);
                                branchMergedValue36 = bitwiseValue30 * float((scalarValue47 >> 16u) & 255u);
                                branchMergedValue37 = bitwiseValue15;
                                branchMergedValue38 = intermediateValue113;
                                branchMergedValue39 = intermediateValue114;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue129;
                                branchMergedValue42 = intermediateValue130;
                                branchMergedValue43 = bitwiseValue24;
                                branchMergedValue46 = intermediateValue144;
                                branchMergedValue47 = intermediateValue145;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue44 = float(scalarValue92 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue22 = bitwiseValue44 * float((scalarValue92 >> 16u) & 255u);
                                branchMergedValue36 = bitwiseValue44 * float((scalarValue92 >> 8u) & 255u);
                                branchMergedValue37 = bitwiseValue44 * float(scalarValue92 & 255u);
                                branchMergedValue38 = intermediateValue193;
                                branchMergedValue39 = intermediateValue192;
                                branchMergedValue40 = bitwiseValue21;
                                branchMergedValue41 = intermediateValue167;
                                branchMergedValue42 = intermediateValue166;
                                branchMergedValue43 = bitwiseValue17;
                                branchMergedValue44 = intermediateValue149;
                                branchMergedValue60 = intermediateValue148;
                                branchMergedValue61 = bitwiseValue13;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue65 = float(scalarValue122 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue16 = bitwiseValue65 * float(scalarValue122 & 255u);
                                branchMergedValue35 = bitwiseValue65 * float((scalarValue122 >> 8u) & 255u);
                                branchMergedValue36 = bitwiseValue65 * float((scalarValue122 >> 16u) & 255u);
                                branchMergedValue37 = bitwiseValue15;
                                branchMergedValue38 = intermediateValue114;
                                branchMergedValue39 = intermediateValue115;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue130;
                                branchMergedValue42 = intermediateValue131;
                                branchMergedValue43 = bitwiseValue24;
                                branchMergedValue46 = intermediateValue145;
                                branchMergedValue47 = intermediateValue146;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue44 = float(scalarValue92 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue22 = bitwiseValue44 * float((scalarValue92 >> 16u) & 255u);
                                branchMergedValue36 = bitwiseValue44 * float((scalarValue92 >> 8u) & 255u);
                                branchMergedValue37 = bitwiseValue44 * float(scalarValue92 & 255u);
                                branchMergedValue38 = intermediateValue194;
                                branchMergedValue39 = intermediateValue193;
                                branchMergedValue40 = bitwiseValue21;
                                branchMergedValue41 = intermediateValue168;
                                branchMergedValue42 = intermediateValue167;
                                branchMergedValue43 = bitwiseValue17;
                                branchMergedValue44 = intermediateValue150;
                                branchMergedValue60 = intermediateValue149;
                                branchMergedValue61 = bitwiseValue13;
#endif
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue175 = branchMergedValue37;
                            intermediateValue176 = branchMergedValue38;
                            intermediateValue177 = branchMergedValue39;
                            intermediateValue178 = branchMergedValue40;
                            intermediateValue180 = branchMergedValue41;
                            intermediateValue182 = branchMergedValue42;
                            intermediateValue184 = branchMergedValue43;
                            intermediateValue186 = branchMergedValue46;
                            intermediateValue188 = branchMergedValue47;
                            intermediateValue190 = branchMergedValue16;
                            intermediateValue191 = branchMergedValue35;
                            intermediateValue192 = branchMergedValue36;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue198 = branchMergedValue61;
                            intermediateValue199 = branchMergedValue60;
                            intermediateValue200 = branchMergedValue44;
                            intermediateValue201 = branchMergedValue43;
                            intermediateValue203 = branchMergedValue42;
                            intermediateValue205 = branchMergedValue41;
                            intermediateValue207 = branchMergedValue40;
                            intermediateValue209 = branchMergedValue39;
                            intermediateValue211 = branchMergedValue38;
                            intermediateValue213 = branchMergedValue37;
                            intermediateValue214 = branchMergedValue36;
                            intermediateValue215 = branchMergedValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue176 = branchMergedValue37;
                            intermediateValue177 = branchMergedValue38;
                            intermediateValue178 = branchMergedValue39;
                            intermediateValue179 = branchMergedValue40;
                            intermediateValue181 = branchMergedValue41;
                            intermediateValue183 = branchMergedValue42;
                            intermediateValue185 = branchMergedValue43;
                            intermediateValue187 = branchMergedValue46;
                            intermediateValue189 = branchMergedValue47;
                            intermediateValue191 = branchMergedValue16;
                            intermediateValue192 = branchMergedValue35;
                            intermediateValue193 = branchMergedValue36;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue199 = branchMergedValue61;
                            intermediateValue200 = branchMergedValue60;
                            intermediateValue201 = branchMergedValue44;
                            intermediateValue202 = branchMergedValue43;
                            intermediateValue204 = branchMergedValue42;
                            intermediateValue206 = branchMergedValue41;
                            intermediateValue208 = branchMergedValue40;
                            intermediateValue210 = branchMergedValue39;
                            intermediateValue212 = branchMergedValue38;
                            intermediateValue214 = branchMergedValue37;
                            intermediateValue215 = branchMergedValue36;
                            intermediateValue216 = branchMergedValue22;
#endif
                            break;
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue132;
                            float intermediateValue133;
                            float intermediateValue134;
                            float sumValue70;
                            float sumValue71;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            float sumValue75;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            uint comparisonValue27;
                            bool comparisonValue28;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue169;
                            float intermediateValue170;
                            float intermediateValue171;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue29;
                            bool comparisonValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue133;
                            float intermediateValue134;
                            float intermediateValue135;
                            float sumValue70;
                            float sumValue71;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            float sumValue75;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            uint comparisonValue27;
                            bool comparisonValue28;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue170;
                            float intermediateValue171;
                            float intermediateValue172;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue29;
                            bool comparisonValue30;
#endif
                            for (;;)
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                sumValue70 = float(intermediateValue1[productValue137]) + intermediateValue76;
                                sumValue71 = float(intermediateValue1[productValue138]) + intermediateValue77;
                                sumValue72 = float(intermediateValue1[productValue139]) + intermediateValue78;
                                sumValue73 = float(intermediateValue2[productValue140]) + intermediateValue76;
                                sumValue74 = float(intermediateValue2[productValue141]) + intermediateValue77;
                                sumValue75 = float(intermediateValue2[productValue142]) + intermediateValue78;
                                sumValue76 = intermediateValue76 + productValue112;
                                sumValue77 = intermediateValue77 + productValue113;
                                sumValue78 = intermediateValue78 + productValue114;
                                uint comparisonValue54 = ((((uint(intermediateValue76 >= 16.0f) << 1u) | uint(intermediateValue76 < 0.0f)) | (uint(intermediateValue77 < 0.0f) << 2u)) | (uint(intermediateValue77 >= 16.0f) << 3u)) | (uint(intermediateValue78 < 0.0f) << 4u);
                                comparisonValue27 = intermediateValue[comparisonValue54 | (uint(intermediateValue78 >= 16.0f) << 5u)];
                                comparisonValue28 = ((((comparisonValue54 | (uint(intermediateValue78 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue54 & 31u))) == 0u;
                                uint loadedBufferValue11;
                                if (comparisonValue28)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                sumValue87 = productValue186 + productValue112;
                                sumValue88 = productValue187 + productValue113;
                                sumValue89 = productValue188 + productValue114;
                                uint comparisonValue84 = ((((uint(productValue186 >= 16.0f) << 1u) | uint(productValue186 < 0.0f)) | (uint(productValue187 < 0.0f) << 2u)) | (uint(productValue187 >= 16.0f) << 3u)) | (uint(productValue188 < 0.0f) << 4u);
                                comparisonValue29 = intermediateValue[comparisonValue84 | (uint(productValue188 >= 16.0f) << 5u)];
                                comparisonValue30 = ((((comparisonValue84 | (uint(productValue188 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue84 & 31u))) == 0u;
                                uint loadedBufferValue10;
                                if (comparisonValue30)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                sumValue70 = float(intermediateValue1[productValue139]) + intermediateValue77;
                                sumValue71 = float(intermediateValue1[productValue140]) + intermediateValue78;
                                sumValue72 = float(intermediateValue1[productValue141]) + intermediateValue79;
                                sumValue73 = float(intermediateValue2[productValue142]) + intermediateValue77;
                                sumValue74 = float(intermediateValue2[productValue143]) + intermediateValue78;
                                sumValue75 = float(intermediateValue2[productValue144]) + intermediateValue79;
                                sumValue76 = intermediateValue77 + productValue112;
                                sumValue77 = intermediateValue78 + productValue113;
                                sumValue78 = intermediateValue79 + productValue114;
                                uint comparisonValue109 = ((((uint(intermediateValue77 >= 16.0f) << 1u) | uint(intermediateValue77 < 0.0f)) | (uint(intermediateValue78 < 0.0f) << 2u)) | (uint(intermediateValue78 >= 16.0f) << 3u)) | (uint(intermediateValue79 < 0.0f) << 4u);
                                comparisonValue27 = intermediateValue[comparisonValue109 | (uint(intermediateValue79 >= 16.0f) << 5u)];
                                comparisonValue28 = ((((comparisonValue109 | (uint(intermediateValue79 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue109 & 31u))) == 0u;
                                uint loadedBufferValue11;
                                if (comparisonValue28)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                sumValue87 = productValue188 + productValue112;
                                sumValue88 = productValue189 + productValue113;
                                sumValue89 = productValue190 + productValue114;
                                uint comparisonValue122 = ((((uint(productValue188 >= 16.0f) << 1u) | uint(productValue188 < 0.0f)) | (uint(productValue189 < 0.0f) << 2u)) | (uint(productValue189 >= 16.0f) << 3u)) | (uint(productValue190 < 0.0f) << 4u);
                                comparisonValue29 = intermediateValue[comparisonValue122 | (uint(productValue190 >= 16.0f) << 5u)];
                                comparisonValue30 = ((((comparisonValue122 | (uint(productValue190 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue122 & 31u))) == 0u;
                                uint loadedBufferValue10;
                                if (comparisonValue30)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue27 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue29 & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue132 = 0.0f;
                                        intermediateValue133 = 0.0f;
                                        intermediateValue134 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue133 = 0.0f;
                                        intermediateValue134 = 0.0f;
                                        intermediateValue135 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
                                        intermediateValue172 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue11 = ((((uint(sumValue76 - (floor(sumValue76 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue27).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue10 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue29).x >> 2u);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    loadedBufferValue11 = ((((intermediateValue79 << 8u) & 3840u) | (intermediateValue80 & 15u)) | ((intermediateValue81 << 4u) & 240u)) + bitwiseValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    loadedBufferValue10 = ((((uint(productValue188) << 4u) & 240u) | (uint(productValue187) & 15u)) | ((uint(productValue186) << 8u) & 3840u)) + bitwiseValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    loadedBufferValue11 = ((((intermediateValue80 << 8u) & 3840u) | (intermediateValue81 & 15u)) | ((intermediateValue82 << 4u) & 240u)) + bitwiseValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    loadedBufferValue10 = ((((uint(productValue190) << 4u) & 240u) | (uint(productValue189) & 15u)) | ((uint(productValue188) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue29 = rdLoad_voxelBuffer(loadedBufferValue11);
                                uint scalarValue48 = loadedBufferValue29.x;
                                if (scalarValue48 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue49 = rdLoad_voxelBuffer(loadedBufferValue10);
                                uint scalarValue93 = loadedBufferValue49.x;
                                if (scalarValue93 == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue132 = 0.0f;
                                    intermediateValue133 = 0.0f;
                                    intermediateValue134 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue169 = 0.0f;
                                    intermediateValue170 = 0.0f;
                                    intermediateValue171 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue133 = 0.0f;
                                    intermediateValue134 = 0.0f;
                                    intermediateValue135 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue170 = 0.0f;
                                    intermediateValue171 = 0.0f;
                                    intermediateValue172 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue132 = bitwiseValue31 * float(scalarValue48 & 255u);
                                intermediateValue133 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                intermediateValue134 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue45 = float(scalarValue93 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue169 = bitwiseValue45 * float(scalarValue93 & 255u);
                                intermediateValue170 = bitwiseValue45 * float((scalarValue93 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue45 * float((scalarValue93 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue133 = bitwiseValue31 * float(scalarValue48 & 255u);
                                intermediateValue134 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                intermediateValue135 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue45 = float(scalarValue93 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue170 = bitwiseValue45 * float(scalarValue93 & 255u);
                                intermediateValue171 = bitwiseValue45 * float((scalarValue93 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue45 * float((scalarValue93 >> 16u) & 255u);
#endif
                                break;
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue179;
                            float intermediateValue181;
                            float intermediateValue183;
                            float sumValue90;
                            float sumValue91;
                            float sumValue92;
                            uint comparisonValue39;
                            bool comparisonValue40;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue202;
                            float intermediateValue204;
                            float intermediateValue206;
                            float sumValue103;
                            float sumValue104;
                            float sumValue105;
                            uint comparisonValue42;
                            bool comparisonValue43;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue180;
                            float intermediateValue182;
                            float intermediateValue184;
                            float sumValue90;
                            float sumValue91;
                            float sumValue92;
                            uint comparisonValue39;
                            bool comparisonValue40;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue203;
                            float intermediateValue205;
                            float intermediateValue207;
                            float sumValue103;
                            float sumValue104;
                            float sumValue105;
                            uint comparisonValue42;
                            bool comparisonValue43;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue90 = sumValue70 + productValue112;
                                sumValue91 = sumValue71 + productValue113;
                                sumValue92 = sumValue72 + productValue114;
                                uint comparisonValue58 = ((((uint(sumValue70 >= 16.0f) << 1u) | uint(sumValue70 < 0.0f)) | (uint(sumValue71 < 0.0f) << 2u)) | (uint(sumValue71 >= 16.0f) << 3u)) | (uint(sumValue72 < 0.0f) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue58 | (uint(sumValue72 >= 16.0f) << 5u)];
                                comparisonValue40 = ((((comparisonValue58 | (uint(sumValue72 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue58 & 31u))) == 0u;
                                uint loadedBufferValue17;
                                if (comparisonValue40)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue103 = sumValue58 + productValue112;
                                sumValue104 = sumValue59 + productValue113;
                                sumValue105 = sumValue60 + productValue114;
                                uint comparisonValue85 = ((((uint(sumValue58 >= 16.0f) << 1u) | uint(sumValue58 < 0.0f)) | (uint(sumValue59 < 0.0f) << 2u)) | (uint(sumValue59 >= 16.0f) << 3u)) | (uint(sumValue60 < 0.0f) << 4u);
                                comparisonValue42 = intermediateValue[comparisonValue85 | (uint(sumValue60 >= 16.0f) << 5u)];
                                comparisonValue43 = ((((comparisonValue85 | (uint(sumValue60 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue85 & 31u))) == 0u;
                                uint loadedBufferValue24;
                                if (comparisonValue43)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue39 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue42 & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue179 = 0.0f;
                                        intermediateValue181 = 0.0f;
                                        intermediateValue183 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue202 = 0.0f;
                                        intermediateValue204 = 0.0f;
                                        intermediateValue206 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue180 = 0.0f;
                                        intermediateValue182 = 0.0f;
                                        intermediateValue184 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue203 = 0.0f;
                                        intermediateValue205 = 0.0f;
                                        intermediateValue207 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue17 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue91 - (floor(sumValue91 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue39).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue24 = ((((uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue42).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue17 = ((((uint(sumValue70) << 8u) & 3840u) | (uint(sumValue71) & 15u)) | ((uint(sumValue72) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue24 = ((((uint(sumValue60) << 4u) & 240u) | (uint(sumValue59) & 15u)) | ((uint(sumValue58) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue31 = rdLoad_voxelBuffer(loadedBufferValue17);
                                uint scalarValue49 = loadedBufferValue31.x;
                                if (scalarValue49 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue50 = rdLoad_voxelBuffer(loadedBufferValue24);
                                uint scalarValue94 = loadedBufferValue50.x;
                                if (scalarValue94 == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue179 = 0.0f;
                                    intermediateValue181 = 0.0f;
                                    intermediateValue183 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue202 = 0.0f;
                                    intermediateValue204 = 0.0f;
                                    intermediateValue206 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue180 = 0.0f;
                                    intermediateValue182 = 0.0f;
                                    intermediateValue184 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue203 = 0.0f;
                                    intermediateValue205 = 0.0f;
                                    intermediateValue207 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue32 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue179 = bitwiseValue32 * float(scalarValue49 & 255u);
                                intermediateValue181 = bitwiseValue32 * float((scalarValue49 >> 8u) & 255u);
                                intermediateValue183 = bitwiseValue32 * float((scalarValue49 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue46 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue202 = bitwiseValue46 * float(scalarValue94 & 255u);
                                intermediateValue204 = bitwiseValue46 * float((scalarValue94 >> 8u) & 255u);
                                intermediateValue206 = bitwiseValue46 * float((scalarValue94 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue32 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue180 = bitwiseValue32 * float(scalarValue49 & 255u);
                                intermediateValue182 = bitwiseValue32 * float((scalarValue49 >> 8u) & 255u);
                                intermediateValue184 = bitwiseValue32 * float((scalarValue49 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue46 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue203 = bitwiseValue46 * float(scalarValue94 & 255u);
                                intermediateValue205 = bitwiseValue46 * float((scalarValue94 >> 8u) & 255u);
                                intermediateValue207 = bitwiseValue46 * float((scalarValue94 >> 16u) & 255u);
#endif
                                break;
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue185;
                            float intermediateValue187;
                            float intermediateValue189;
                            float sumValue99;
                            float sumValue100;
                            float sumValue101;
                            uint comparisonValue49;
                            bool comparisonValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue208;
                            float intermediateValue210;
                            float intermediateValue212;
                            float sumValue114;
                            float sumValue115;
                            float sumValue116;
                            uint comparisonValue52;
                            bool comparisonValue53;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue186;
                            float intermediateValue188;
                            float intermediateValue190;
                            float sumValue99;
                            float sumValue100;
                            float sumValue101;
                            uint comparisonValue49;
                            bool comparisonValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue209;
                            float intermediateValue211;
                            float intermediateValue213;
                            float sumValue114;
                            float sumValue115;
                            float sumValue116;
                            uint comparisonValue52;
                            bool comparisonValue53;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue99 = sumValue73 + productValue112;
                                sumValue100 = sumValue74 + productValue113;
                                sumValue101 = sumValue75 + productValue114;
                                uint comparisonValue59 = ((((uint(sumValue73 >= 16.0f) << 1u) | uint(sumValue73 < 0.0f)) | (uint(sumValue74 < 0.0f) << 2u)) | (uint(sumValue74 >= 16.0f) << 3u)) | (uint(sumValue75 < 0.0f) << 4u);
                                comparisonValue49 = intermediateValue[comparisonValue59 | (uint(sumValue75 >= 16.0f) << 5u)];
                                comparisonValue50 = ((((comparisonValue59 | (uint(sumValue75 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue59 & 31u))) == 0u;
                                uint loadedBufferValue21;
                                if (comparisonValue50)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue114 = sumValue61 + productValue112;
                                sumValue115 = sumValue62 + productValue113;
                                sumValue116 = sumValue63 + productValue114;
                                uint comparisonValue86 = ((((uint(sumValue61 >= 16.0f) << 1u) | uint(sumValue61 < 0.0f)) | (uint(sumValue62 < 0.0f) << 2u)) | (uint(sumValue62 >= 16.0f) << 3u)) | (uint(sumValue63 < 0.0f) << 4u);
                                comparisonValue52 = intermediateValue[comparisonValue86 | (uint(sumValue63 >= 16.0f) << 5u)];
                                comparisonValue53 = ((((comparisonValue86 | (uint(sumValue63 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue86 & 31u))) == 0u;
                                uint loadedBufferValue28;
                                if (comparisonValue53)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue49 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue52 & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue185 = 0.0f;
                                        intermediateValue187 = 0.0f;
                                        intermediateValue189 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue208 = 0.0f;
                                        intermediateValue210 = 0.0f;
                                        intermediateValue212 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue186 = 0.0f;
                                        intermediateValue188 = 0.0f;
                                        intermediateValue190 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue209 = 0.0f;
                                        intermediateValue211 = 0.0f;
                                        intermediateValue213 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue21 = ((((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue100 - (floor(sumValue100 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue101 - (floor(sumValue101 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue49).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue28 = ((((uint(sumValue114 - (floor(sumValue114 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue115 - (floor(sumValue115 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue116 - (floor(sumValue116 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue52).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue21 = ((((uint(sumValue73) << 8u) & 3840u) | (uint(sumValue74) & 15u)) | ((uint(sumValue75) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue28 = ((((uint(sumValue63) << 4u) & 240u) | (uint(sumValue62) & 15u)) | ((uint(sumValue61) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue33 = rdLoad_voxelBuffer(loadedBufferValue21);
                                uint scalarValue50 = loadedBufferValue33.x;
                                if (scalarValue50 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue51 = rdLoad_voxelBuffer(loadedBufferValue28);
                                uint scalarValue95 = loadedBufferValue51.x;
                                if (scalarValue95 == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue185 = 0.0f;
                                    intermediateValue187 = 0.0f;
                                    intermediateValue189 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue208 = 0.0f;
                                    intermediateValue210 = 0.0f;
                                    intermediateValue212 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue186 = 0.0f;
                                    intermediateValue188 = 0.0f;
                                    intermediateValue190 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue209 = 0.0f;
                                    intermediateValue211 = 0.0f;
                                    intermediateValue213 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue33 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue185 = bitwiseValue33 * float(scalarValue50 & 255u);
                                intermediateValue187 = bitwiseValue33 * float((scalarValue50 >> 8u) & 255u);
                                intermediateValue189 = bitwiseValue33 * float((scalarValue50 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue47 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue208 = bitwiseValue47 * float(scalarValue95 & 255u);
                                intermediateValue210 = bitwiseValue47 * float((scalarValue95 >> 8u) & 255u);
                                intermediateValue212 = bitwiseValue47 * float((scalarValue95 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue33 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue186 = bitwiseValue33 * float(scalarValue50 & 255u);
                                intermediateValue188 = bitwiseValue33 * float((scalarValue50 >> 8u) & 255u);
                                intermediateValue190 = bitwiseValue33 * float((scalarValue50 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue47 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue209 = bitwiseValue47 * float(scalarValue95 & 255u);
                                intermediateValue211 = bitwiseValue47 * float((scalarValue95 >> 8u) & 255u);
                                intermediateValue213 = bitwiseValue47 * float((scalarValue95 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float sumValue84 = sumValue56 + productValue112;
                            float sumValue86 = sumValue57 + productValue113;
                            float sumValue102 = sumValue58 + productValue114;
                            uint comparisonValue60 = ((((uint(sumValue56 >= 16.0f) << 1u) | uint(sumValue56 < 0.0f)) | (uint(sumValue57 < 0.0f) << 2u)) | (uint(sumValue57 >= 16.0f) << 3u)) | (uint(sumValue58 < 0.0f) << 4u);
                            uint comparisonValue61 = comparisonValue60 | (uint(sumValue58 >= 16.0f) << 5u);
                            uint loadedBufferValue25;
                            if ((((comparisonValue61 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue60 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float sumValue158 = sumValue64 + productValue112;
                            float sumValue159 = sumValue65 + productValue113;
                            float sumValue160 = sumValue66 + productValue114;
                            uint comparisonValue87 = ((((uint(sumValue64 >= 16.0f) << 1u) | uint(sumValue64 < 0.0f)) | (uint(sumValue65 < 0.0f) << 2u)) | (uint(sumValue65 >= 16.0f) << 3u)) | (uint(sumValue66 < 0.0f) << 4u);
                            uint comparisonValue88 = comparisonValue87 | (uint(sumValue66 >= 16.0f) << 5u);
                            uint loadedBufferValue32;
                            if ((((comparisonValue88 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue87 & 31u))) == 0u)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue61] & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue88] & 31u))) == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue175 = intermediateValue132;
                                    intermediateValue176 = intermediateValue133;
                                    intermediateValue177 = intermediateValue134;
                                    intermediateValue178 = intermediateValue179;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = 0.0f;
                                    intermediateValue191 = 0.0f;
                                    intermediateValue192 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue198 = intermediateValue169;
                                    intermediateValue199 = intermediateValue170;
                                    intermediateValue200 = intermediateValue171;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = intermediateValue212;
                                    intermediateValue213 = 0.0f;
                                    intermediateValue214 = 0.0f;
                                    intermediateValue215 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue176 = intermediateValue133;
                                    intermediateValue177 = intermediateValue134;
                                    intermediateValue178 = intermediateValue135;
                                    intermediateValue179 = intermediateValue180;
                                    intermediateValue181 = intermediateValue182;
                                    intermediateValue183 = intermediateValue184;
                                    intermediateValue185 = intermediateValue186;
                                    intermediateValue187 = intermediateValue188;
                                    intermediateValue189 = intermediateValue190;
                                    intermediateValue191 = 0.0f;
                                    intermediateValue192 = 0.0f;
                                    intermediateValue193 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue199 = intermediateValue170;
                                    intermediateValue200 = intermediateValue171;
                                    intermediateValue201 = intermediateValue172;
                                    intermediateValue202 = intermediateValue203;
                                    intermediateValue204 = intermediateValue205;
                                    intermediateValue206 = intermediateValue207;
                                    intermediateValue208 = intermediateValue209;
                                    intermediateValue210 = intermediateValue211;
                                    intermediateValue212 = intermediateValue213;
                                    intermediateValue214 = 0.0f;
                                    intermediateValue215 = 0.0f;
                                    intermediateValue216 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue25 = ((((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue86 - (floor(sumValue86 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue61]).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                loadedBufferValue32 = ((((uint(sumValue158 - (floor(sumValue158 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue159 - (floor(sumValue159 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue160 - (floor(sumValue160 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue88]).x >> 2u);
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue25 = ((((uint(sumValue56) << 8u) & 3840u) | (uint(sumValue57) & 15u)) | ((uint(sumValue58) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                loadedBufferValue32 = ((((uint(sumValue66) << 4u) & 240u) | (uint(sumValue65) & 15u)) | ((uint(sumValue64) << 8u) & 3840u)) + bitwiseValue9;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue35 = rdLoad_voxelBuffer(loadedBufferValue25);
                            uint scalarValue51 = loadedBufferValue35.x;
                            if (scalarValue51 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue52 = rdLoad_voxelBuffer(loadedBufferValue32);
                            uint scalarValue96 = loadedBufferValue52.x;
                            if (scalarValue96 == 0u)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue175 = intermediateValue132;
                                intermediateValue176 = intermediateValue133;
                                intermediateValue177 = intermediateValue134;
                                intermediateValue178 = intermediateValue179;
                                intermediateValue180 = intermediateValue181;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = 0.0f;
                                intermediateValue191 = 0.0f;
                                intermediateValue192 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue198 = intermediateValue169;
                                intermediateValue199 = intermediateValue170;
                                intermediateValue200 = intermediateValue171;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = intermediateValue212;
                                intermediateValue213 = 0.0f;
                                intermediateValue214 = 0.0f;
                                intermediateValue215 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue176 = intermediateValue133;
                                intermediateValue177 = intermediateValue134;
                                intermediateValue178 = intermediateValue135;
                                intermediateValue179 = intermediateValue180;
                                intermediateValue181 = intermediateValue182;
                                intermediateValue183 = intermediateValue184;
                                intermediateValue185 = intermediateValue186;
                                intermediateValue187 = intermediateValue188;
                                intermediateValue189 = intermediateValue190;
                                intermediateValue191 = 0.0f;
                                intermediateValue192 = 0.0f;
                                intermediateValue193 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue199 = intermediateValue170;
                                intermediateValue200 = intermediateValue171;
                                intermediateValue201 = intermediateValue172;
                                intermediateValue202 = intermediateValue203;
                                intermediateValue204 = intermediateValue205;
                                intermediateValue206 = intermediateValue207;
                                intermediateValue208 = intermediateValue209;
                                intermediateValue210 = intermediateValue211;
                                intermediateValue212 = intermediateValue213;
                                intermediateValue214 = 0.0f;
                                intermediateValue215 = 0.0f;
                                intermediateValue216 = 0.0f;
#endif
                                break;
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float bitwiseValue34 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue175 = intermediateValue132;
                            intermediateValue176 = intermediateValue133;
                            intermediateValue177 = intermediateValue134;
                            intermediateValue178 = intermediateValue179;
                            intermediateValue180 = intermediateValue181;
                            intermediateValue182 = intermediateValue183;
                            intermediateValue184 = intermediateValue185;
                            intermediateValue186 = intermediateValue187;
                            intermediateValue188 = intermediateValue189;
                            intermediateValue190 = bitwiseValue34 * float(scalarValue51 & 255u);
                            intermediateValue191 = bitwiseValue34 * float((scalarValue51 >> 8u) & 255u);
                            intermediateValue192 = bitwiseValue34 * float((scalarValue51 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float bitwiseValue48 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue198 = intermediateValue169;
                            intermediateValue199 = intermediateValue170;
                            intermediateValue200 = intermediateValue171;
                            intermediateValue201 = intermediateValue202;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = intermediateValue206;
                            intermediateValue207 = intermediateValue208;
                            intermediateValue209 = intermediateValue210;
                            intermediateValue211 = intermediateValue212;
                            intermediateValue213 = bitwiseValue48 * float(scalarValue96 & 255u);
                            intermediateValue214 = bitwiseValue48 * float((scalarValue96 >> 8u) & 255u);
                            intermediateValue215 = bitwiseValue48 * float((scalarValue96 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float bitwiseValue34 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue176 = intermediateValue133;
                            intermediateValue177 = intermediateValue134;
                            intermediateValue178 = intermediateValue135;
                            intermediateValue179 = intermediateValue180;
                            intermediateValue181 = intermediateValue182;
                            intermediateValue183 = intermediateValue184;
                            intermediateValue185 = intermediateValue186;
                            intermediateValue187 = intermediateValue188;
                            intermediateValue189 = intermediateValue190;
                            intermediateValue191 = bitwiseValue34 * float(scalarValue51 & 255u);
                            intermediateValue192 = bitwiseValue34 * float((scalarValue51 >> 8u) & 255u);
                            intermediateValue193 = bitwiseValue34 * float((scalarValue51 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float bitwiseValue48 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue199 = intermediateValue170;
                            intermediateValue200 = intermediateValue171;
                            intermediateValue201 = intermediateValue172;
                            intermediateValue202 = intermediateValue203;
                            intermediateValue204 = intermediateValue205;
                            intermediateValue206 = intermediateValue207;
                            intermediateValue208 = intermediateValue209;
                            intermediateValue210 = intermediateValue211;
                            intermediateValue212 = intermediateValue213;
                            intermediateValue214 = bitwiseValue48 * float(scalarValue96 & 255u);
                            intermediateValue215 = bitwiseValue48 * float((scalarValue96 >> 8u) & 255u);
                            intermediateValue216 = bitwiseValue48 * float((scalarValue96 >> 16u) & 255u);
#endif
                            break;
                        }
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue48 = (((intermediateValue182 * sumValue54) + (intermediateValue177 * sumValue53)) + (intermediateValue188 * sumValue55)) + (intermediateValue192 * intermediateValue84);
                    branchMergedValue50 = (((intermediateValue180 * sumValue54) + (intermediateValue176 * sumValue53)) + (intermediateValue186 * sumValue55)) + (intermediateValue191 * intermediateValue84);
                    branchMergedValue51 = (((intermediateValue178 * sumValue54) + (intermediateValue175 * sumValue53)) + (intermediateValue184 * sumValue55)) + (intermediateValue190 * intermediateValue84);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue65 = (((intermediateValue203 * productValue190) + (intermediateValue199 * productValue189)) + (intermediateValue209 * productValue191)) + (intermediateValue214 * productValue192);
                    branchMergedValue69 = (((intermediateValue201 * productValue190) + (intermediateValue198 * productValue189)) + (intermediateValue207 * productValue191)) + (intermediateValue213 * productValue192);
                    branchMergedValue70 = (((intermediateValue205 * productValue190) + (intermediateValue200 * productValue189)) + (intermediateValue211 * productValue191)) + (intermediateValue215 * productValue192);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue48 = (((intermediateValue183 * sumValue54) + (intermediateValue178 * sumValue53)) + (intermediateValue189 * sumValue55)) + (intermediateValue193 * intermediateValue85);
                    branchMergedValue50 = (((intermediateValue181 * sumValue54) + (intermediateValue177 * sumValue53)) + (intermediateValue187 * sumValue55)) + (intermediateValue192 * intermediateValue85);
                    branchMergedValue51 = (((intermediateValue179 * sumValue54) + (intermediateValue176 * sumValue53)) + (intermediateValue185 * sumValue55)) + (intermediateValue191 * intermediateValue85);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue65 = (((intermediateValue204 * productValue192) + (intermediateValue200 * productValue191)) + (intermediateValue210 * productValue193)) + (intermediateValue215 * productValue194);
                    branchMergedValue69 = (((intermediateValue202 * productValue192) + (intermediateValue199 * productValue191)) + (intermediateValue208 * productValue193)) + (intermediateValue214 * productValue194);
                    branchMergedValue70 = (((intermediateValue206 * productValue192) + (intermediateValue201 * productValue191)) + (intermediateValue212 * productValue193)) + (intermediateValue216 * productValue194);
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue9 = branchMergedValue48;
                branchMergedValue17 = branchMergedValue50;
                branchMergedValue18 = branchMergedValue51;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                else
                {
                    float intermediateValue217;
                    float intermediateValue218;
                    float intermediateValue219;
                    float intermediateValue220;
                    float intermediateValue222;
                    float intermediateValue224;
                    float intermediateValue226;
                    float intermediateValue228;
                    float intermediateValue230;
                    float intermediateValue232;
                    float intermediateValue233;
                    float intermediateValue234;
                    float intermediateValue117;
                    float intermediateValue118;
                    float intermediateValue119;
                    uint intermediateValue120;
                    uint intermediateValue121;
                    uint intermediateValue122;
                    float intermediateValue125;
                    float sumValue74;
                    float sumValue75;
                    float sumValue76;
                    float sumValue77;
                    float sumValue78;
                    float sumValue79;
                    bool comparisonValue25;
                    uint productValue193;
                    uint productValue194;
                    uint productValue195;
                    uint productValue196;
                    uint productValue197;
                    uint productValue198;
                    for (;;)
                    {
                        intermediateValue117 = floor(sumValue32);
                        intermediateValue118 = floor(sumValue33);
                        intermediateValue119 = floor(sumValue34);
                        float sumValue161 = sumValue32 - intermediateValue117;
                        float sumValue162 = sumValue33 - intermediateValue118;
                        float sumValue163 = sumValue34 - intermediateValue119;
                        uint comparisonValue89 = ((uint(sumValue162 >= sumValue163) << 1u) | uint(sumValue161 >= sumValue162)) | (uint(sumValue161 >= sumValue163) << 2u);
                        intermediateValue120 = uint(intermediateValue117);
                        intermediateValue121 = uint(intermediateValue118);
                        intermediateValue122 = uint(intermediateValue119);
                        float scalarValue97 = min(sumValue161, sumValue162);
                        float scalarValue98 = max(sumValue161, sumValue162);
                        intermediateValue125 = min(scalarValue97, sumValue163);
                        float scalarValue99 = max(scalarValue98, sumValue163);
                        float scalarValue100 = max(min(scalarValue98, sumValue163), scalarValue97);
                        sumValue74 = 1.0f - scalarValue99;
                        sumValue75 = scalarValue99 - scalarValue100;
                        sumValue76 = scalarValue100 - intermediateValue125;
                        sumValue77 = intermediateValue117 + 1.0f;
                        sumValue78 = intermediateValue118 + 1.0f;
                        sumValue79 = intermediateValue119 + 1.0f;
                        comparisonValue25 = (((intermediateValue117 >= 0.0f) && (intermediateValue118 >= 0.0f)) && (intermediateValue119 >= 0.0f)) && (((sumValue77 < 16.0f) && (sumValue78 < 16.0f)) && (sumValue79 < 16.0f));
                        productValue193 = 0u + (comparisonValue89 * 3u);
                        productValue194 = 1u + (comparisonValue89 * 3u);
                        productValue195 = 2u + (comparisonValue89 * 3u);
                        productValue196 = 0u + (comparisonValue89 * 3u);
                        productValue197 = 1u + (comparisonValue89 * 3u);
                        productValue198 = 2u + (comparisonValue89 * 3u);
                        if (comparisonValue25)
                        {
                            uint bitwiseValue49 = intermediateValue122 << 4u;
                            uint sumValue164 = intermediateValue121 + bitwiseValue9;
                            uint bitwiseValue50 = sumValue164 + (intermediateValue120 << 8u);
                            uint4 loadedBufferValue53 = rdLoad_voxelBuffer(bitwiseValue50 + bitwiseValue49);
                            uint scalarValue101 = loadedBufferValue53.x;
                            float bitwiseValue15;
                            float intermediateValue151;
                            float intermediateValue152;
                            if (scalarValue101 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue151 = 0.0f;
                                intermediateValue152 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue51 = float(scalarValue101 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue51 * float(scalarValue101 & 255u);
                                intermediateValue151 = bitwiseValue51 * float((scalarValue101 >> 8u) & 255u);
                                intermediateValue152 = bitwiseValue51 * float((scalarValue101 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue54 = rdLoad_voxelBuffer(((intermediateValue1[productValue194] + sumValue164) + ((intermediateValue1[productValue193] + intermediateValue120) << 8u)) + ((intermediateValue1[productValue195] + intermediateValue122) << 4u));
                            uint scalarValue102 = loadedBufferValue54.x;
                            float bitwiseValue19;
                            float intermediateValue173;
                            float intermediateValue174;
                            if (scalarValue102 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue52 = float(scalarValue102 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue52 * float(scalarValue102 & 255u);
                                intermediateValue173 = bitwiseValue52 * float((scalarValue102 >> 8u) & 255u);
                                intermediateValue174 = bitwiseValue52 * float((scalarValue102 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue55 = rdLoad_voxelBuffer(((intermediateValue2[productValue197] + sumValue164) + ((intermediateValue2[productValue196] + intermediateValue120) << 8u)) + ((intermediateValue2[productValue198] + intermediateValue122) << 4u));
                            uint scalarValue103 = loadedBufferValue55.x;
                            float bitwiseValue24;
                            float intermediateValue195;
                            float intermediateValue196;
                            if (scalarValue103 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue195 = 0.0f;
                                intermediateValue196 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue53 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue53 * float(scalarValue103 & 255u);
                                intermediateValue195 = bitwiseValue53 * float((scalarValue103 >> 8u) & 255u);
                                intermediateValue196 = bitwiseValue53 * float((scalarValue103 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue56 = rdLoad_voxelBuffer((bitwiseValue50 + 273u) + bitwiseValue49);
                            uint scalarValue104 = loadedBufferValue56.x;
                            float branchMergedValue23;
                            float branchMergedValue45;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue50;
                            float branchMergedValue51;
                            float branchMergedValue52;
                            float branchMergedValue53;
                            float branchMergedValue62;
                            float branchMergedValue63;
                            if (scalarValue104 == 0u)
                            {
                                branchMergedValue23 = 0.0f;
                                branchMergedValue45 = 0.0f;
                                branchMergedValue46 = 0.0f;
                                branchMergedValue47 = intermediateValue196;
                                branchMergedValue48 = intermediateValue195;
                                branchMergedValue49 = bitwiseValue24;
                                branchMergedValue50 = intermediateValue174;
                                branchMergedValue51 = intermediateValue173;
                                branchMergedValue52 = bitwiseValue19;
                                branchMergedValue53 = intermediateValue152;
                                branchMergedValue62 = intermediateValue151;
                                branchMergedValue63 = bitwiseValue15;
                            }
                            else
                            {
                                float bitwiseValue54 = float(scalarValue104 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue23 = bitwiseValue54 * float((scalarValue104 >> 16u) & 255u);
                                branchMergedValue45 = bitwiseValue54 * float((scalarValue104 >> 8u) & 255u);
                                branchMergedValue46 = bitwiseValue54 * float(scalarValue104 & 255u);
                                branchMergedValue47 = intermediateValue196;
                                branchMergedValue48 = intermediateValue195;
                                branchMergedValue49 = bitwiseValue24;
                                branchMergedValue50 = intermediateValue174;
                                branchMergedValue51 = intermediateValue173;
                                branchMergedValue52 = bitwiseValue19;
                                branchMergedValue53 = intermediateValue152;
                                branchMergedValue62 = intermediateValue151;
                                branchMergedValue63 = bitwiseValue15;
                            }
                            intermediateValue217 = branchMergedValue63;
                            intermediateValue218 = branchMergedValue62;
                            intermediateValue219 = branchMergedValue53;
                            intermediateValue220 = branchMergedValue52;
                            intermediateValue222 = branchMergedValue51;
                            intermediateValue224 = branchMergedValue50;
                            intermediateValue226 = branchMergedValue49;
                            intermediateValue228 = branchMergedValue48;
                            intermediateValue230 = branchMergedValue47;
                            intermediateValue232 = branchMergedValue46;
                            intermediateValue233 = branchMergedValue45;
                            intermediateValue234 = branchMergedValue23;
                            break;
                        }
                        else
                        {
                            float intermediateValue176;
                            float intermediateValue177;
                            float intermediateValue178;
                            float sumValue91;
                            float sumValue92;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            float sumValue99;
                            uint comparisonValue32;
                            bool comparisonValue33;
                            for (;;)
                            {
                                sumValue91 = float(intermediateValue1[productValue193]) + intermediateValue117;
                                sumValue92 = float(intermediateValue1[productValue194]) + intermediateValue118;
                                sumValue93 = float(intermediateValue1[productValue195]) + intermediateValue119;
                                sumValue94 = float(intermediateValue2[productValue196]) + intermediateValue117;
                                sumValue95 = float(intermediateValue2[productValue197]) + intermediateValue118;
                                sumValue96 = float(intermediateValue2[productValue198]) + intermediateValue119;
                                sumValue97 = intermediateValue117 + productValue112;
                                sumValue98 = intermediateValue118 + productValue113;
                                sumValue99 = intermediateValue119 + productValue114;
                                uint comparisonValue90 = ((((uint(intermediateValue117 >= 16.0f) << 1u) | uint(intermediateValue117 < 0.0f)) | (uint(intermediateValue118 < 0.0f) << 2u)) | (uint(intermediateValue118 >= 16.0f) << 3u)) | (uint(intermediateValue119 < 0.0f) << 4u);
                                comparisonValue32 = intermediateValue[comparisonValue90 | (uint(intermediateValue119 >= 16.0f) << 5u)];
                                comparisonValue33 = ((((comparisonValue90 | (uint(intermediateValue119 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue90 & 31u))) == 0u;
                                uint loadedBufferValue13;
                                if (comparisonValue33)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue32 & 31u))) == 0u)
                                    {
                                        intermediateValue176 = 0.0f;
                                        intermediateValue177 = 0.0f;
                                        intermediateValue178 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue13 = ((((uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue32).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue13 = ((((intermediateValue120 << 8u) & 3840u) | (intermediateValue121 & 15u)) | ((intermediateValue122 << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue57 = rdLoad_voxelBuffer(loadedBufferValue13);
                                uint scalarValue105 = loadedBufferValue57.x;
                                if (scalarValue105 == 0u)
                                {
                                    intermediateValue176 = 0.0f;
                                    intermediateValue177 = 0.0f;
                                    intermediateValue178 = 0.0f;
                                    break;
                                }
                                float bitwiseValue55 = float(scalarValue105 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue176 = bitwiseValue55 * float(scalarValue105 & 255u);
                                intermediateValue177 = bitwiseValue55 * float((scalarValue105 >> 8u) & 255u);
                                intermediateValue178 = bitwiseValue55 * float((scalarValue105 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue221;
                            float intermediateValue223;
                            float intermediateValue225;
                            float sumValue106;
                            float sumValue107;
                            float sumValue108;
                            uint comparisonValue45;
                            bool comparisonValue46;
                            for (;;)
                            {
                                sumValue106 = sumValue91 + productValue112;
                                sumValue107 = sumValue92 + productValue113;
                                sumValue108 = sumValue93 + productValue114;
                                uint comparisonValue91 = ((((uint(sumValue91 >= 16.0f) << 1u) | uint(sumValue91 < 0.0f)) | (uint(sumValue92 < 0.0f) << 2u)) | (uint(sumValue92 >= 16.0f) << 3u)) | (uint(sumValue93 < 0.0f) << 4u);
                                comparisonValue45 = intermediateValue[comparisonValue91 | (uint(sumValue93 >= 16.0f) << 5u)];
                                comparisonValue46 = ((((comparisonValue91 | (uint(sumValue93 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue91 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue46)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                    {
                                        intermediateValue221 = 0.0f;
                                        intermediateValue223 = 0.0f;
                                        intermediateValue225 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue26 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue45).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue26 = ((((uint(sumValue91) << 8u) & 3840u) | (uint(sumValue92) & 15u)) | ((uint(sumValue93) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue58 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue106 = loadedBufferValue58.x;
                                if (scalarValue106 == 0u)
                                {
                                    intermediateValue221 = 0.0f;
                                    intermediateValue223 = 0.0f;
                                    intermediateValue225 = 0.0f;
                                    break;
                                }
                                float bitwiseValue56 = float(scalarValue106 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue221 = bitwiseValue56 * float(scalarValue106 & 255u);
                                intermediateValue223 = bitwiseValue56 * float((scalarValue106 >> 8u) & 255u);
                                intermediateValue225 = bitwiseValue56 * float((scalarValue106 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue227;
                            float intermediateValue229;
                            float intermediateValue231;
                            float sumValue117;
                            float sumValue118;
                            float sumValue119;
                            uint comparisonValue55;
                            bool comparisonValue56;
                            for (;;)
                            {
                                sumValue117 = sumValue94 + productValue112;
                                sumValue118 = sumValue95 + productValue113;
                                sumValue119 = sumValue96 + productValue114;
                                uint comparisonValue92 = ((((uint(sumValue94 >= 16.0f) << 1u) | uint(sumValue94 < 0.0f)) | (uint(sumValue95 < 0.0f) << 2u)) | (uint(sumValue95 >= 16.0f) << 3u)) | (uint(sumValue96 < 0.0f) << 4u);
                                comparisonValue55 = intermediateValue[comparisonValue92 | (uint(sumValue96 >= 16.0f) << 5u)];
                                comparisonValue56 = ((((comparisonValue92 | (uint(sumValue96 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue92 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue56)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue55 & 31u))) == 0u)
                                    {
                                        intermediateValue227 = 0.0f;
                                        intermediateValue229 = 0.0f;
                                        intermediateValue231 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue117 - (floor(sumValue117 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue118 - (floor(sumValue118 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue119 - (floor(sumValue119 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue55).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue94) << 8u) & 3840u) | (uint(sumValue95) & 15u)) | ((uint(sumValue96) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue59 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue107 = loadedBufferValue59.x;
                                if (scalarValue107 == 0u)
                                {
                                    intermediateValue227 = 0.0f;
                                    intermediateValue229 = 0.0f;
                                    intermediateValue231 = 0.0f;
                                    break;
                                }
                                float bitwiseValue57 = float(scalarValue107 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue227 = bitwiseValue57 * float(scalarValue107 & 255u);
                                intermediateValue229 = bitwiseValue57 * float((scalarValue107 >> 8u) & 255u);
                                intermediateValue231 = bitwiseValue57 * float((scalarValue107 >> 16u) & 255u);
                                break;
                            }
                            float sumValue165 = sumValue77 + productValue112;
                            float sumValue166 = sumValue78 + productValue113;
                            float sumValue167 = sumValue79 + productValue114;
                            uint comparisonValue93 = ((((uint(sumValue77 >= 16.0f) << 1u) | uint(sumValue77 < 0.0f)) | (uint(sumValue78 < 0.0f) << 2u)) | (uint(sumValue78 >= 16.0f) << 3u)) | (uint(sumValue79 < 0.0f) << 4u);
                            uint comparisonValue94 = comparisonValue93 | (uint(sumValue79 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue94 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue93 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue94] & 31u))) == 0u)
                                {
                                    intermediateValue217 = intermediateValue176;
                                    intermediateValue218 = intermediateValue177;
                                    intermediateValue219 = intermediateValue178;
                                    intermediateValue220 = intermediateValue221;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = intermediateValue225;
                                    intermediateValue226 = intermediateValue227;
                                    intermediateValue228 = intermediateValue229;
                                    intermediateValue230 = intermediateValue231;
                                    intermediateValue232 = 0.0f;
                                    intermediateValue233 = 0.0f;
                                    intermediateValue234 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue165 - (floor(sumValue165 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue166 - (floor(sumValue166 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue167 - (floor(sumValue167 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue94]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue34 = ((((uint(sumValue77) << 8u) & 3840u) | (uint(sumValue78) & 15u)) | ((uint(sumValue79) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue60 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue108 = loadedBufferValue60.x;
                            if (scalarValue108 == 0u)
                            {
                                intermediateValue217 = intermediateValue176;
                                intermediateValue218 = intermediateValue177;
                                intermediateValue219 = intermediateValue178;
                                intermediateValue220 = intermediateValue221;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = intermediateValue225;
                                intermediateValue226 = intermediateValue227;
                                intermediateValue228 = intermediateValue229;
                                intermediateValue230 = intermediateValue231;
                                intermediateValue232 = 0.0f;
                                intermediateValue233 = 0.0f;
                                intermediateValue234 = 0.0f;
                                break;
                            }
                            float bitwiseValue58 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue217 = intermediateValue176;
                            intermediateValue218 = intermediateValue177;
                            intermediateValue219 = intermediateValue178;
                            intermediateValue220 = intermediateValue221;
                            intermediateValue222 = intermediateValue223;
                            intermediateValue224 = intermediateValue225;
                            intermediateValue226 = intermediateValue227;
                            intermediateValue228 = intermediateValue229;
                            intermediateValue230 = intermediateValue231;
                            intermediateValue232 = bitwiseValue58 * float(scalarValue108 & 255u);
                            intermediateValue233 = bitwiseValue58 * float((scalarValue108 >> 8u) & 255u);
                            intermediateValue234 = bitwiseValue58 * float((scalarValue108 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue65 = (((intermediateValue222 * sumValue75) + (intermediateValue218 * sumValue74)) + (intermediateValue228 * sumValue76)) + (intermediateValue233 * intermediateValue125);
                    branchMergedValue69 = (((intermediateValue220 * sumValue75) + (intermediateValue217 * sumValue74)) + (intermediateValue226 * sumValue76)) + (intermediateValue232 * intermediateValue125);
                    branchMergedValue70 = (((intermediateValue224 * sumValue75) + (intermediateValue219 * sumValue74)) + (intermediateValue230 * sumValue76)) + (intermediateValue234 * intermediateValue125);
                }
                branchMergedValue16 = branchMergedValue65;
                branchMergedValue29 = branchMergedValue69;
                branchMergedValue30 = branchMergedValue70;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                else
                {
                    float intermediateValue218;
                    float intermediateValue219;
                    float intermediateValue220;
                    float intermediateValue221;
                    float intermediateValue223;
                    float intermediateValue225;
                    float intermediateValue227;
                    float intermediateValue229;
                    float intermediateValue231;
                    float intermediateValue233;
                    float intermediateValue234;
                    float intermediateValue235;
                    float intermediateValue118;
                    float intermediateValue119;
                    float intermediateValue120;
                    uint intermediateValue121;
                    uint intermediateValue122;
                    uint intermediateValue123;
                    float intermediateValue126;
                    float sumValue74;
                    float sumValue75;
                    float sumValue76;
                    float sumValue77;
                    float sumValue78;
                    float sumValue79;
                    bool comparisonValue25;
                    uint productValue195;
                    uint productValue196;
                    uint productValue197;
                    uint productValue198;
                    uint productValue199;
                    uint productValue200;
                    for (;;)
                    {
                        intermediateValue118 = floor(sumValue32);
                        intermediateValue119 = floor(sumValue33);
                        intermediateValue120 = floor(sumValue34);
                        float sumValue194 = sumValue32 - intermediateValue118;
                        float sumValue195 = sumValue33 - intermediateValue119;
                        float sumValue196 = sumValue34 - intermediateValue120;
                        uint comparisonValue123 = ((uint(sumValue195 >= sumValue196) << 1u) | uint(sumValue194 >= sumValue195)) | (uint(sumValue194 >= sumValue196) << 2u);
                        intermediateValue121 = uint(intermediateValue118);
                        intermediateValue122 = uint(intermediateValue119);
                        intermediateValue123 = uint(intermediateValue120);
                        float scalarValue130 = min(sumValue194, sumValue195);
                        float scalarValue131 = max(sumValue194, sumValue195);
                        intermediateValue126 = min(scalarValue130, sumValue196);
                        float scalarValue132 = max(scalarValue131, sumValue196);
                        float scalarValue133 = max(min(scalarValue131, sumValue196), scalarValue130);
                        sumValue74 = 1.0f - scalarValue132;
                        sumValue75 = scalarValue132 - scalarValue133;
                        sumValue76 = scalarValue133 - intermediateValue126;
                        sumValue77 = intermediateValue118 + 1.0f;
                        sumValue78 = intermediateValue119 + 1.0f;
                        sumValue79 = intermediateValue120 + 1.0f;
                        comparisonValue25 = (((intermediateValue118 >= 0.0f) && (intermediateValue119 >= 0.0f)) && (intermediateValue120 >= 0.0f)) && (((sumValue77 < 16.0f) && (sumValue78 < 16.0f)) && (sumValue79 < 16.0f));
                        productValue195 = 0u + (comparisonValue123 * 3u);
                        productValue196 = 1u + (comparisonValue123 * 3u);
                        productValue197 = 2u + (comparisonValue123 * 3u);
                        productValue198 = 0u + (comparisonValue123 * 3u);
                        productValue199 = 1u + (comparisonValue123 * 3u);
                        productValue200 = 2u + (comparisonValue123 * 3u);
                        if (comparisonValue25)
                        {
                            uint bitwiseValue67 = intermediateValue123 << 4u;
                            uint sumValue197 = intermediateValue122 + bitwiseValue9;
                            uint bitwiseValue68 = sumValue197 + (intermediateValue121 << 8u);
                            uint4 loadedBufferValue67 = rdLoad_voxelBuffer(bitwiseValue68 + bitwiseValue67);
                            uint scalarValue134 = loadedBufferValue67.x;
                            float bitwiseValue15;
                            float intermediateValue152;
                            float intermediateValue153;
                            if (scalarValue134 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue152 = 0.0f;
                                intermediateValue153 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue69 = float(scalarValue134 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue69 * float(scalarValue134 & 255u);
                                intermediateValue152 = bitwiseValue69 * float((scalarValue134 >> 8u) & 255u);
                                intermediateValue153 = bitwiseValue69 * float((scalarValue134 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue68 = rdLoad_voxelBuffer(((intermediateValue1[productValue196] + sumValue197) + ((intermediateValue1[productValue195] + intermediateValue121) << 8u)) + ((intermediateValue1[productValue197] + intermediateValue123) << 4u));
                            uint scalarValue135 = loadedBufferValue68.x;
                            float bitwiseValue19;
                            float intermediateValue174;
                            float intermediateValue175;
                            if (scalarValue135 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue174 = 0.0f;
                                intermediateValue175 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue70 = float(scalarValue135 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue70 * float(scalarValue135 & 255u);
                                intermediateValue174 = bitwiseValue70 * float((scalarValue135 >> 8u) & 255u);
                                intermediateValue175 = bitwiseValue70 * float((scalarValue135 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue69 = rdLoad_voxelBuffer(((intermediateValue2[productValue199] + sumValue197) + ((intermediateValue2[productValue198] + intermediateValue121) << 8u)) + ((intermediateValue2[productValue200] + intermediateValue123) << 4u));
                            uint scalarValue136 = loadedBufferValue69.x;
                            float bitwiseValue24;
                            float intermediateValue196;
                            float intermediateValue197;
                            if (scalarValue136 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue196 = 0.0f;
                                intermediateValue197 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue71 = float(scalarValue136 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue71 * float(scalarValue136 & 255u);
                                intermediateValue196 = bitwiseValue71 * float((scalarValue136 >> 8u) & 255u);
                                intermediateValue197 = bitwiseValue71 * float((scalarValue136 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue70 = rdLoad_voxelBuffer((bitwiseValue68 + 273u) + bitwiseValue67);
                            uint scalarValue137 = loadedBufferValue70.x;
                            float branchMergedValue23;
                            float branchMergedValue45;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue50;
                            float branchMergedValue51;
                            float branchMergedValue52;
                            float branchMergedValue53;
                            float branchMergedValue62;
                            float branchMergedValue63;
                            if (scalarValue137 == 0u)
                            {
                                branchMergedValue23 = 0.0f;
                                branchMergedValue45 = 0.0f;
                                branchMergedValue46 = 0.0f;
                                branchMergedValue47 = intermediateValue197;
                                branchMergedValue48 = intermediateValue196;
                                branchMergedValue49 = bitwiseValue24;
                                branchMergedValue50 = intermediateValue175;
                                branchMergedValue51 = intermediateValue174;
                                branchMergedValue52 = bitwiseValue19;
                                branchMergedValue53 = intermediateValue153;
                                branchMergedValue62 = intermediateValue152;
                                branchMergedValue63 = bitwiseValue15;
                            }
                            else
                            {
                                float bitwiseValue72 = float(scalarValue137 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue23 = bitwiseValue72 * float((scalarValue137 >> 16u) & 255u);
                                branchMergedValue45 = bitwiseValue72 * float((scalarValue137 >> 8u) & 255u);
                                branchMergedValue46 = bitwiseValue72 * float(scalarValue137 & 255u);
                                branchMergedValue47 = intermediateValue197;
                                branchMergedValue48 = intermediateValue196;
                                branchMergedValue49 = bitwiseValue24;
                                branchMergedValue50 = intermediateValue175;
                                branchMergedValue51 = intermediateValue174;
                                branchMergedValue52 = bitwiseValue19;
                                branchMergedValue53 = intermediateValue153;
                                branchMergedValue62 = intermediateValue152;
                                branchMergedValue63 = bitwiseValue15;
                            }
                            intermediateValue218 = branchMergedValue63;
                            intermediateValue219 = branchMergedValue62;
                            intermediateValue220 = branchMergedValue53;
                            intermediateValue221 = branchMergedValue52;
                            intermediateValue223 = branchMergedValue51;
                            intermediateValue225 = branchMergedValue50;
                            intermediateValue227 = branchMergedValue49;
                            intermediateValue229 = branchMergedValue48;
                            intermediateValue231 = branchMergedValue47;
                            intermediateValue233 = branchMergedValue46;
                            intermediateValue234 = branchMergedValue45;
                            intermediateValue235 = branchMergedValue23;
                            break;
                        }
                        else
                        {
                            float intermediateValue177;
                            float intermediateValue178;
                            float intermediateValue179;
                            float sumValue91;
                            float sumValue92;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            float sumValue99;
                            uint comparisonValue32;
                            bool comparisonValue33;
                            for (;;)
                            {
                                sumValue91 = float(intermediateValue1[productValue195]) + intermediateValue118;
                                sumValue92 = float(intermediateValue1[productValue196]) + intermediateValue119;
                                sumValue93 = float(intermediateValue1[productValue197]) + intermediateValue120;
                                sumValue94 = float(intermediateValue2[productValue198]) + intermediateValue118;
                                sumValue95 = float(intermediateValue2[productValue199]) + intermediateValue119;
                                sumValue96 = float(intermediateValue2[productValue200]) + intermediateValue120;
                                sumValue97 = intermediateValue118 + productValue112;
                                sumValue98 = intermediateValue119 + productValue113;
                                sumValue99 = intermediateValue120 + productValue114;
                                uint comparisonValue124 = ((((uint(intermediateValue118 >= 16.0f) << 1u) | uint(intermediateValue118 < 0.0f)) | (uint(intermediateValue119 < 0.0f) << 2u)) | (uint(intermediateValue119 >= 16.0f) << 3u)) | (uint(intermediateValue120 < 0.0f) << 4u);
                                comparisonValue32 = intermediateValue[comparisonValue124 | (uint(intermediateValue120 >= 16.0f) << 5u)];
                                comparisonValue33 = ((((comparisonValue124 | (uint(intermediateValue120 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue124 & 31u))) == 0u;
                                uint loadedBufferValue13;
                                if (comparisonValue33)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue32 & 31u))) == 0u)
                                    {
                                        intermediateValue177 = 0.0f;
                                        intermediateValue178 = 0.0f;
                                        intermediateValue179 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue13 = ((((uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue32).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue13 = ((((intermediateValue121 << 8u) & 3840u) | (intermediateValue122 & 15u)) | ((intermediateValue123 << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue57 = rdLoad_voxelBuffer(loadedBufferValue13);
                                uint scalarValue105 = loadedBufferValue57.x;
                                if (scalarValue105 == 0u)
                                {
                                    intermediateValue177 = 0.0f;
                                    intermediateValue178 = 0.0f;
                                    intermediateValue179 = 0.0f;
                                    break;
                                }
                                float bitwiseValue55 = float(scalarValue105 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue177 = bitwiseValue55 * float(scalarValue105 & 255u);
                                intermediateValue178 = bitwiseValue55 * float((scalarValue105 >> 8u) & 255u);
                                intermediateValue179 = bitwiseValue55 * float((scalarValue105 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue222;
                            float intermediateValue224;
                            float intermediateValue226;
                            float sumValue106;
                            float sumValue107;
                            float sumValue108;
                            uint comparisonValue45;
                            bool comparisonValue46;
                            for (;;)
                            {
                                sumValue106 = sumValue91 + productValue112;
                                sumValue107 = sumValue92 + productValue113;
                                sumValue108 = sumValue93 + productValue114;
                                uint comparisonValue91 = ((((uint(sumValue91 >= 16.0f) << 1u) | uint(sumValue91 < 0.0f)) | (uint(sumValue92 < 0.0f) << 2u)) | (uint(sumValue92 >= 16.0f) << 3u)) | (uint(sumValue93 < 0.0f) << 4u);
                                comparisonValue45 = intermediateValue[comparisonValue91 | (uint(sumValue93 >= 16.0f) << 5u)];
                                comparisonValue46 = ((((comparisonValue91 | (uint(sumValue93 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue91 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue46)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                    {
                                        intermediateValue222 = 0.0f;
                                        intermediateValue224 = 0.0f;
                                        intermediateValue226 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue26 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue45).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue26 = ((((uint(sumValue91) << 8u) & 3840u) | (uint(sumValue92) & 15u)) | ((uint(sumValue93) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue58 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue106 = loadedBufferValue58.x;
                                if (scalarValue106 == 0u)
                                {
                                    intermediateValue222 = 0.0f;
                                    intermediateValue224 = 0.0f;
                                    intermediateValue226 = 0.0f;
                                    break;
                                }
                                float bitwiseValue56 = float(scalarValue106 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue222 = bitwiseValue56 * float(scalarValue106 & 255u);
                                intermediateValue224 = bitwiseValue56 * float((scalarValue106 >> 8u) & 255u);
                                intermediateValue226 = bitwiseValue56 * float((scalarValue106 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue228;
                            float intermediateValue230;
                            float intermediateValue232;
                            float sumValue117;
                            float sumValue118;
                            float sumValue119;
                            uint comparisonValue55;
                            bool comparisonValue56;
                            for (;;)
                            {
                                sumValue117 = sumValue94 + productValue112;
                                sumValue118 = sumValue95 + productValue113;
                                sumValue119 = sumValue96 + productValue114;
                                uint comparisonValue92 = ((((uint(sumValue94 >= 16.0f) << 1u) | uint(sumValue94 < 0.0f)) | (uint(sumValue95 < 0.0f) << 2u)) | (uint(sumValue95 >= 16.0f) << 3u)) | (uint(sumValue96 < 0.0f) << 4u);
                                comparisonValue55 = intermediateValue[comparisonValue92 | (uint(sumValue96 >= 16.0f) << 5u)];
                                comparisonValue56 = ((((comparisonValue92 | (uint(sumValue96 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue92 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue56)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue55 & 31u))) == 0u)
                                    {
                                        intermediateValue228 = 0.0f;
                                        intermediateValue230 = 0.0f;
                                        intermediateValue232 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue117 - (floor(sumValue117 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue118 - (floor(sumValue118 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue119 - (floor(sumValue119 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue55).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue94) << 8u) & 3840u) | (uint(sumValue95) & 15u)) | ((uint(sumValue96) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue59 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue107 = loadedBufferValue59.x;
                                if (scalarValue107 == 0u)
                                {
                                    intermediateValue228 = 0.0f;
                                    intermediateValue230 = 0.0f;
                                    intermediateValue232 = 0.0f;
                                    break;
                                }
                                float bitwiseValue57 = float(scalarValue107 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue228 = bitwiseValue57 * float(scalarValue107 & 255u);
                                intermediateValue230 = bitwiseValue57 * float((scalarValue107 >> 8u) & 255u);
                                intermediateValue232 = bitwiseValue57 * float((scalarValue107 >> 16u) & 255u);
                                break;
                            }
                            float sumValue165 = sumValue77 + productValue112;
                            float sumValue166 = sumValue78 + productValue113;
                            float sumValue167 = sumValue79 + productValue114;
                            uint comparisonValue93 = ((((uint(sumValue77 >= 16.0f) << 1u) | uint(sumValue77 < 0.0f)) | (uint(sumValue78 < 0.0f) << 2u)) | (uint(sumValue78 >= 16.0f) << 3u)) | (uint(sumValue79 < 0.0f) << 4u);
                            uint comparisonValue94 = comparisonValue93 | (uint(sumValue79 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue94 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue93 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue94] & 31u))) == 0u)
                                {
                                    intermediateValue218 = intermediateValue177;
                                    intermediateValue219 = intermediateValue178;
                                    intermediateValue220 = intermediateValue179;
                                    intermediateValue221 = intermediateValue222;
                                    intermediateValue223 = intermediateValue224;
                                    intermediateValue225 = intermediateValue226;
                                    intermediateValue227 = intermediateValue228;
                                    intermediateValue229 = intermediateValue230;
                                    intermediateValue231 = intermediateValue232;
                                    intermediateValue233 = 0.0f;
                                    intermediateValue234 = 0.0f;
                                    intermediateValue235 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue165 - (floor(sumValue165 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue166 - (floor(sumValue166 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue167 - (floor(sumValue167 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue94]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue34 = ((((uint(sumValue77) << 8u) & 3840u) | (uint(sumValue78) & 15u)) | ((uint(sumValue79) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue60 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue108 = loadedBufferValue60.x;
                            if (scalarValue108 == 0u)
                            {
                                intermediateValue218 = intermediateValue177;
                                intermediateValue219 = intermediateValue178;
                                intermediateValue220 = intermediateValue179;
                                intermediateValue221 = intermediateValue222;
                                intermediateValue223 = intermediateValue224;
                                intermediateValue225 = intermediateValue226;
                                intermediateValue227 = intermediateValue228;
                                intermediateValue229 = intermediateValue230;
                                intermediateValue231 = intermediateValue232;
                                intermediateValue233 = 0.0f;
                                intermediateValue234 = 0.0f;
                                intermediateValue235 = 0.0f;
                                break;
                            }
                            float bitwiseValue58 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue218 = intermediateValue177;
                            intermediateValue219 = intermediateValue178;
                            intermediateValue220 = intermediateValue179;
                            intermediateValue221 = intermediateValue222;
                            intermediateValue223 = intermediateValue224;
                            intermediateValue225 = intermediateValue226;
                            intermediateValue227 = intermediateValue228;
                            intermediateValue229 = intermediateValue230;
                            intermediateValue231 = intermediateValue232;
                            intermediateValue233 = bitwiseValue58 * float(scalarValue108 & 255u);
                            intermediateValue234 = bitwiseValue58 * float((scalarValue108 >> 8u) & 255u);
                            intermediateValue235 = bitwiseValue58 * float((scalarValue108 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue65 = (((intermediateValue223 * sumValue75) + (intermediateValue219 * sumValue74)) + (intermediateValue229 * sumValue76)) + (intermediateValue234 * intermediateValue126);
                    branchMergedValue69 = (((intermediateValue221 * sumValue75) + (intermediateValue218 * sumValue74)) + (intermediateValue227 * sumValue76)) + (intermediateValue233 * intermediateValue126);
                    branchMergedValue70 = (((intermediateValue225 * sumValue75) + (intermediateValue220 * sumValue74)) + (intermediateValue231 * sumValue76)) + (intermediateValue235 * intermediateValue126);
                }
                branchMergedValue16 = branchMergedValue65;
                branchMergedValue29 = branchMergedValue69;
                branchMergedValue30 = branchMergedValue70;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue9 = 0.0f;
                branchMergedValue17 = 0.0f;
                branchMergedValue18 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue16 = 0.0f;
                branchMergedValue29 = 0.0f;
                branchMergedValue30 = 0.0f;
#endif
            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue21 = branchMergedValue18;
            intermediateValue22 = branchMergedValue17;
            intermediateValue23 = branchMergedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue31 = branchMergedValue29;
            intermediateValue32 = branchMergedValue16;
            intermediateValue33 = branchMergedValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue22 = branchMergedValue18;
            intermediateValue23 = branchMergedValue17;
            intermediateValue24 = branchMergedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue32 = branchMergedValue29;
            intermediateValue33 = branchMergedValue16;
            intermediateValue34 = branchMergedValue30;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue21 = clampedValue1;
            intermediateValue22 = clampedValue2;
            intermediateValue23 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue31 = clampedValue1;
            intermediateValue32 = clampedValue2;
            intermediateValue33 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue22 = clampedValue1;
            intermediateValue23 = clampedValue2;
            intermediateValue24 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue32 = clampedValue1;
            intermediateValue33 = clampedValue2;
            intermediateValue34 = clampedValue3;
#endif
        }
        float productValue121 = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
        float productValue122 = productValue121 * productValue121;
        float productValue123 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue121 - productValue122)) + productValue122) * RD_UNIFORM_TILE_LIGHT_INTENSITY.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
        float productValue124 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue6;
        float dotProductValue11 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float productValue125 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * varyingTexCoord8.y) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue39 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue125;
        productValue40 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue125;
        productValue41 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue125;
        productValue42 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue21), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue124;
        productValue43 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue124;
        productValue44 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue23), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue124;
        intermediateValue9 = intermediateValue10;
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = intermediateValue16;
        intermediateValue17 = intermediateValue18;
        intermediateValue19 = intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue39 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue125;
        productValue40 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue125;
        productValue41 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue125;
        productValue42 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue31), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue124;
        productValue43 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue32), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue124;
        productValue44 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue33), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue124;
        intermediateValue9 = productValue45;
        intermediateValue10 = productValue46;
        intermediateValue11 = productValue47;
        intermediateValue12 = productValue48;
        intermediateValue13 = productValue49;
        intermediateValue14 = productValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue41 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue125;
        productValue42 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue125;
        productValue43 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue125;
        productValue44 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue124;
        productValue45 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue23), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue124;
        productValue46 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue24), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue124;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = intermediateValue13;
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = intermediateValue17;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue41 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue125;
        productValue42 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue125;
        productValue43 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue125;
        productValue44 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue32), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue124;
        productValue45 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue33), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue124;
        productValue46 = (max((productValue123 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue34), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue124;
        intermediateValue10 = productValue47;
        intermediateValue11 = productValue48;
        intermediateValue12 = productValue49;
        intermediateValue13 = productValue50;
        intermediateValue14 = productValue51;
        intermediateValue15 = productValue52;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue39 = 0.0f;
        productValue40 = 0.0f;
#endif
        productValue41 = 0.0f;
        productValue42 = 0.0f;
        productValue43 = 0.0f;
        productValue44 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue9 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue15 = 0.0f;
        intermediateValue17 = 0.0f;
        intermediateValue19 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue9 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue45 = 0.0f;
        productValue46 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue20 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue45 = 0.0f;
        productValue46 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue15 = 0.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float sumValue109 = ((productValue42 + productValue39) + intermediateValue9) + intermediateValue15;
    float sumValue111 = ((productValue43 + productValue40) + intermediateValue11) + intermediateValue17;
    float sumValue112 = ((productValue44 + productValue41) + intermediateValue13) + intermediateValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float sumValue168 = ((productValue42 + productValue39) + intermediateValue9) + intermediateValue12;
    float sumValue169 = ((productValue43 + productValue40) + intermediateValue10) + intermediateValue13;
    float sumValue170 = ((productValue44 + productValue41) + intermediateValue11) + intermediateValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float sumValue182 = ((productValue44 + productValue41) + intermediateValue10) + intermediateValue16;
    float sumValue183 = ((productValue45 + productValue42) + intermediateValue12) + intermediateValue18;
    float sumValue184 = ((productValue46 + productValue43) + intermediateValue14) + intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float sumValue198 = ((productValue44 + productValue41) + intermediateValue10) + intermediateValue13;
    float sumValue199 = ((productValue45 + productValue42) + intermediateValue11) + intermediateValue14;
    float sumValue200 = ((productValue46 + productValue43) + intermediateValue12) + intermediateValue15;
#endif
    float sumValue113 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue120 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue121 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue113, sumValue120, sumValue121), float3(sumValue113, sumValue120, sumValue121)));
    float productValue126 = inverseLengthValue10 * sumValue113;
    float productValue127 = inverseLengthValue10 * sumValue120;
    float productValue128 = inverseLengthValue10 * sumValue121;
    bool comparisonValue62 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    bool comparisonValue63 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue48;
    float productValue49;
    float productValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue54;
    float productValue55;
    float productValue56;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue50;
    float productValue51;
    float productValue52;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue56;
    float productValue57;
    float productValue58;
#endif
    if ((comparisonValue62 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue63)
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue48 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue49 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue50 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue54 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue55 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue56 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue50 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue51 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue52 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue56 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue57 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue58 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue48 = 0.0f;
        productValue49 = 0.0f;
        productValue50 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue54 = 0.0f;
        productValue55 = 0.0f;
        productValue56 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue50 = 0.0f;
        productValue51 = 0.0f;
        productValue52 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue56 = 0.0f;
        productValue57 = 0.0f;
        productValue58 = 0.0f;
#endif
    }
    bool comparisonValue64 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    bool comparisonValue65 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue28;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue27;
    float intermediateValue28;
#endif
    float intermediateValue29;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue30;
    float intermediateValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue30;
#endif
    if (comparisonValue65)
    {
        float clampedValue13 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue10;
        float branchMergedValue19;
        float branchMergedValue20;
        float branchMergedValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue14;
        float branchMergedValue26;
        float branchMergedValue27;
        float branchMergedValue28;
#endif
        if (clampedValue13 > 0.0f)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue49;
            float branchMergedValue52;
            float branchMergedValue53;
            float branchMergedValue54;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue64;
            float branchMergedValue66;
            float branchMergedValue67;
            float branchMergedValue68;
#endif
            if (comparisonValue62)
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue49 = max(productValue50, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue52 = max(productValue49, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue53 = RD_UNIFORM_FOG_COLOR.x * max(productValue48, 1.0f);
                branchMergedValue54 = clampedValue13;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue64 = clampedValue13;
                branchMergedValue66 = max(productValue56, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue67 = max(productValue55, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue68 = RD_UNIFORM_FOG_COLOR.x * max(productValue54, 1.0f);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue49 = max(productValue52, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue52 = max(productValue51, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue53 = RD_UNIFORM_FOG_COLOR.x * max(productValue50, 1.0f);
                branchMergedValue54 = clampedValue13;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue64 = clampedValue13;
                branchMergedValue66 = max(productValue58, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue67 = max(productValue57, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue68 = RD_UNIFORM_FOG_COLOR.x * max(productValue56, 1.0f);
#endif
            }
            else
            {
                float clampedValue14 = clamp(((productValue127 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue129 = 1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)));
                float productValue145 = (productValue129 * productValue129) * productValue129;
                float dotProductValue12 = dot(float3(productValue126, productValue127, productValue128), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue13 = dot(float3(productValue126, productValue127, productValue128), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue122 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue15 = clamp((productValue127 - sumValue122) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue122), 0.0f, 1.0f);
                float productValue146 = 1.0f - ((clampedValue15 * clampedValue15) * (3.0f - (clampedValue15 * 2.0f)));
                float productValue147 = (productValue146 * productValue146) * productValue146;
                float productValue148 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue13 * dotProductValue13) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue16 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue17 = clamp(exp2(log2(max(dotProductValue13, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue149 = 1.809999942779541015625f - (clampedValue16 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue149) * productValue149);
                float productValue150 = 1.809999942779541015625f - (clampedValue17 * 1.7999999523162841796875f);
                float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue150) * productValue150);
                float productValue151 = clampedValue16 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue152 = clampedValue17 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue153 = (((productValue145 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue152 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue151 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue147 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue148)) * 0.079577468335628509521484375f;
                float productValue154 = (((productValue145 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue152 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue151 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue147 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue148)) * 0.079577468335628509521484375f;
                float productValue155 = (((productValue145 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue152 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue151 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue147 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue148)) * 0.079577468335628509521484375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue55;
                float branchMergedValue56;
                float branchMergedValue57;
                float branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue80;
                float branchMergedValue81;
                float branchMergedValue82;
                float branchMergedValue83;
#endif
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue52 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue55 = ((productValue155 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue56 = ((productValue154 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue57 = ((productValue153 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue58 = clampedValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue80 = clampedValue13;
                    branchMergedValue81 = ((productValue155 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue82 = ((productValue154 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue83 = ((productValue153 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue55 = productValue155;
                    branchMergedValue56 = productValue154;
                    branchMergedValue57 = productValue153;
                    branchMergedValue58 = clampedValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue80 = clampedValue13;
                    branchMergedValue81 = productValue155;
                    branchMergedValue82 = productValue154;
                    branchMergedValue83 = productValue153;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue49 = branchMergedValue55;
                branchMergedValue52 = branchMergedValue56;
                branchMergedValue53 = branchMergedValue57;
                branchMergedValue54 = branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue64 = branchMergedValue80;
                branchMergedValue66 = branchMergedValue81;
                branchMergedValue67 = branchMergedValue82;
                branchMergedValue68 = branchMergedValue83;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue10 = branchMergedValue49;
            branchMergedValue19 = branchMergedValue52;
            branchMergedValue20 = branchMergedValue53;
            branchMergedValue21 = branchMergedValue54;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue14 = branchMergedValue64;
            branchMergedValue26 = branchMergedValue66;
            branchMergedValue27 = branchMergedValue67;
            branchMergedValue28 = branchMergedValue68;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue10 = 0.0f;
            branchMergedValue19 = 0.0f;
            branchMergedValue20 = 0.0f;
            branchMergedValue21 = clampedValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue14 = clampedValue13;
            branchMergedValue26 = 0.0f;
            branchMergedValue27 = 0.0f;
            branchMergedValue28 = 0.0f;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue28 = branchMergedValue21;
        intermediateValue29 = branchMergedValue20;
        intermediateValue30 = branchMergedValue19;
        intermediateValue31 = branchMergedValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue26 = branchMergedValue14;
        intermediateValue27 = branchMergedValue28;
        intermediateValue28 = branchMergedValue27;
        intermediateValue29 = branchMergedValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue29 = branchMergedValue21;
        intermediateValue30 = branchMergedValue20;
        intermediateValue31 = branchMergedValue19;
        intermediateValue32 = branchMergedValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue27 = branchMergedValue14;
        intermediateValue28 = branchMergedValue28;
        intermediateValue29 = branchMergedValue27;
        intermediateValue30 = branchMergedValue26;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue28 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue26 = 0.0f;
        intermediateValue27 = 0.0f;
        intermediateValue28 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue27 = 0.0f;
        intermediateValue28 = 0.0f;
#endif
        intermediateValue29 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue30 = 0.0f;
        intermediateValue31 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue30 = 0.0f;
        intermediateValue31 = 0.0f;
        intermediateValue32 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue30 = 0.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue97;
    float productValue98;
    float productValue99;
    float productValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue105;
    float productValue106;
    float productValue107;
    float productValue108;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue99;
    float productValue100;
    float productValue101;
    float productValue102;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue107;
    float productValue108;
    float productValue109;
    float productValue110;
#endif
    if (comparisonValue64)
    {
        float productValue156 = (multiplyAddValue9 + 1.0f) * 0.5f;
        float productValue157 = (multiplyAddValue10 + 1.0f) * 0.5f;
        uint scalarValue53 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue31 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue53))) + (-0.5f);
        uint sumValue123 = uint(min(int(uint(max(int(uint(int(multiplyAddValue31))), int(0u)))), int(scalarValue53 + 4294967294u)));
        float scalarValue54 = float(int(sumValue123));
        float sumValue124 = min(max(multiplyAddValue31 - scalarValue54, 0.0f), 1.0f);
        float4 sampledTextureValue1 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue156, productValue157, scalarValue54), 0.0f);
        float scalarValue55 = sampledTextureValue1.x;
        float scalarValue56 = sampledTextureValue1.y;
        float scalarValue57 = sampledTextureValue1.z;
        float scalarValue58 = sampledTextureValue1.w;
        float4 sampledTextureValue2 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue156, productValue157, float(int(sumValue123 + 1u))), 0.0f);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue97 = ((sampledTextureValue2.x - scalarValue55) * sumValue124) + scalarValue55;
        productValue98 = ((sampledTextureValue2.y - scalarValue56) * sumValue124) + scalarValue56;
        productValue99 = ((sampledTextureValue2.z - scalarValue57) * sumValue124) + scalarValue57;
        productValue100 = ((sampledTextureValue2.w - scalarValue58) * sumValue124) + scalarValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue105 = ((sampledTextureValue2.x - scalarValue55) * sumValue124) + scalarValue55;
        productValue106 = ((sampledTextureValue2.y - scalarValue56) * sumValue124) + scalarValue56;
        productValue107 = ((sampledTextureValue2.z - scalarValue57) * sumValue124) + scalarValue57;
        productValue108 = ((sampledTextureValue2.w - scalarValue58) * sumValue124) + scalarValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue99 = ((sampledTextureValue2.x - scalarValue55) * sumValue124) + scalarValue55;
        productValue100 = ((sampledTextureValue2.y - scalarValue56) * sumValue124) + scalarValue56;
        productValue101 = ((sampledTextureValue2.z - scalarValue57) * sumValue124) + scalarValue57;
        productValue102 = ((sampledTextureValue2.w - scalarValue58) * sumValue124) + scalarValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue107 = ((sampledTextureValue2.x - scalarValue55) * sumValue124) + scalarValue55;
        productValue108 = ((sampledTextureValue2.y - scalarValue56) * sumValue124) + scalarValue56;
        productValue109 = ((sampledTextureValue2.z - scalarValue57) * sumValue124) + scalarValue57;
        productValue110 = ((sampledTextureValue2.w - scalarValue58) * sumValue124) + scalarValue58;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue97 = 0.0f;
        productValue98 = 0.0f;
        productValue99 = 0.0f;
        productValue100 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue105 = 0.0f;
        productValue106 = 0.0f;
        productValue107 = 0.0f;
        productValue108 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue99 = 0.0f;
        productValue100 = 0.0f;
        productValue101 = 0.0f;
        productValue102 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue107 = 0.0f;
        productValue108 = 0.0f;
        productValue109 = 0.0f;
        productValue110 = 1.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue71;
    float intermediateValue72;
    float intermediateValue73;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue87;
    float intermediateValue88;
    float intermediateValue89;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue72;
    float intermediateValue73;
    float intermediateValue74;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue88;
    float intermediateValue89;
    float intermediateValue90;
#endif
    if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
    {
        bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue64;
        float intermediateValue65;
        float intermediateValue66;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue80;
        float intermediateValue81;
        float intermediateValue82;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue65;
        float intermediateValue66;
        float intermediateValue67;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue81;
        float intermediateValue82;
        float intermediateValue83;
#endif
        float multiplyAddValue32;
        float multiplyAddValue33;
        float multiplyAddValue34;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue64 = productValue30;
            intermediateValue65 = productValue31;
            intermediateValue66 = productValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue80 = productValue30;
            intermediateValue81 = productValue31;
            intermediateValue82 = productValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue65 = productValue30;
            intermediateValue66 = productValue31;
            intermediateValue67 = productValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue81 = productValue30;
            intermediateValue82 = productValue31;
            intermediateValue83 = productValue32;
#endif
            multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue64 = varyingTexCoord3.x;
            intermediateValue65 = varyingTexCoord3.y;
            intermediateValue66 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue80 = varyingTexCoord3.x;
            intermediateValue81 = varyingTexCoord3.y;
            intermediateValue82 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue65 = varyingTexCoord3.x;
            intermediateValue66 = varyingTexCoord3.y;
            intermediateValue67 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue81 = varyingTexCoord3.x;
            intermediateValue82 = varyingTexCoord3.y;
            intermediateValue83 = varyingTexCoord3.z;
#endif
            multiplyAddValue32 = multiplyAddValue4;
            multiplyAddValue33 = multiplyAddValue5;
            multiplyAddValue34 = multiplyAddValue6;
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float sumValue125 = intermediateValue64 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue126 = intermediateValue65 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue128 = intermediateValue66 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue11 = rsqrt(dot(float3(sumValue125, sumValue126, sumValue128), float3(sumValue125, sumValue126, sumValue128)));
        float productValue158 = inverseLengthValue11 * sumValue125;
        float productValue159 = inverseLengthValue11 * sumValue126;
        float productValue160 = inverseLengthValue11 * sumValue128;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float sumValue171 = intermediateValue80 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue172 = intermediateValue81 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue173 = intermediateValue82 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue18 = rsqrt(dot(float3(sumValue171, sumValue172, sumValue173), float3(sumValue171, sumValue172, sumValue173)));
        float productValue298 = inverseLengthValue18 * sumValue171;
        float productValue299 = inverseLengthValue18 * sumValue172;
        float productValue300 = inverseLengthValue18 * sumValue173;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float sumValue185 = intermediateValue65 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue186 = intermediateValue66 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue187 = intermediateValue67 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue19 = rsqrt(dot(float3(sumValue185, sumValue186, sumValue187), float3(sumValue185, sumValue186, sumValue187)));
        float productValue329 = inverseLengthValue19 * sumValue185;
        float productValue330 = inverseLengthValue19 * sumValue186;
        float productValue331 = inverseLengthValue19 * sumValue187;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float sumValue201 = intermediateValue81 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue202 = intermediateValue82 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue203 = intermediateValue83 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue20 = rsqrt(dot(float3(sumValue201, sumValue202, sumValue203), float3(sumValue201, sumValue202, sumValue203)));
        float productValue361 = inverseLengthValue20 * sumValue201;
        float productValue362 = inverseLengthValue20 * sumValue202;
        float productValue363 = inverseLengthValue20 * sumValue203;
#endif
        float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34), float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34)));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float dotProductValue14 = dot(float3(productValue158, productValue159, productValue160), float3(productValue11, productValue12, productValue13)) * 2.0f;
        float productValue161 = productValue158 - (dotProductValue14 * productValue11);
        float productValue162 = productValue159 - (dotProductValue14 * productValue12);
        float productValue174 = productValue160 - (dotProductValue14 * productValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float dotProductValue22 = dot(float3(productValue298, productValue299, productValue300), float3(productValue11, productValue12, productValue13)) * 2.0f;
        float productValue301 = productValue298 - (dotProductValue22 * productValue11);
        float productValue302 = productValue299 - (dotProductValue22 * productValue12);
        float productValue303 = productValue300 - (dotProductValue22 * productValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float dotProductValue24 = dot(float3(productValue329, productValue330, productValue331), float3(productValue11, productValue12, productValue13)) * 2.0f;
        float productValue332 = productValue329 - (dotProductValue24 * productValue11);
        float productValue333 = productValue330 - (dotProductValue24 * productValue12);
        float productValue334 = productValue331 - (dotProductValue24 * productValue13);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float dotProductValue26 = dot(float3(productValue361, productValue362, productValue363), float3(productValue11, productValue12, productValue13)) * 2.0f;
        float productValue364 = productValue361 - (dotProductValue26 * productValue11);
        float productValue365 = productValue362 - (dotProductValue26 * productValue12);
        float productValue366 = productValue363 - (dotProductValue26 * productValue13);
#endif
        float sumValue129 = 1.0f - varyingTexCoord8.z;
        float productValue180 = sumValue129 * sumValue129;
        float productValue185 = productValue180 * productValue180;
        precise float comparisonValue66 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue180 : (productValue185 * productValue185));
        precise float productValue201 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue66;
        uint scalarValue59 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float4 sampledTextureValue3 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue161, productValue162, productValue174, float(int(scalarValue59))), productValue201);
        float4 sampledTextureValue4 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue161, productValue162, productValue174, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue201);
        float scalarValue60 = sampledTextureValue4.x;
        float scalarValue61 = sampledTextureValue4.y;
        float scalarValue62 = sampledTextureValue4.z;
        float productValue207 = ((sampledTextureValue3.x - scalarValue60) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue60;
        float productValue214 = ((sampledTextureValue3.y - scalarValue61) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue61;
        float productValue215 = ((sampledTextureValue3.z - scalarValue62) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue62;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float4 sampledTextureValue11 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue301, productValue302, productValue303, float(int(scalarValue59))), productValue201);
        float4 sampledTextureValue12 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue301, productValue302, productValue303, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue201);
        float scalarValue109 = sampledTextureValue12.x;
        float scalarValue110 = sampledTextureValue12.y;
        float scalarValue111 = sampledTextureValue12.z;
        float productValue304 = ((sampledTextureValue11.x - scalarValue109) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue109;
        float productValue305 = ((sampledTextureValue11.y - scalarValue110) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue110;
        float productValue306 = ((sampledTextureValue11.z - scalarValue111) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue111;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float4 sampledTextureValue13 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue332, productValue333, productValue334, float(int(scalarValue59))), productValue201);
        float4 sampledTextureValue14 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue332, productValue333, productValue334, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue201);
        float scalarValue123 = sampledTextureValue14.x;
        float scalarValue124 = sampledTextureValue14.y;
        float scalarValue125 = sampledTextureValue14.z;
        float productValue335 = ((sampledTextureValue13.x - scalarValue123) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue123;
        float productValue336 = ((sampledTextureValue13.y - scalarValue124) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue124;
        float productValue337 = ((sampledTextureValue13.z - scalarValue125) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue125;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float4 sampledTextureValue16 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue364, productValue365, productValue366, float(int(scalarValue59))), productValue201);
        float4 sampledTextureValue17 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue364, productValue365, productValue366, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue201);
        float scalarValue138 = sampledTextureValue17.x;
        float scalarValue139 = sampledTextureValue17.y;
        float scalarValue140 = sampledTextureValue17.z;
        float productValue367 = ((sampledTextureValue16.x - scalarValue138) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue138;
        float productValue368 = ((sampledTextureValue16.y - scalarValue139) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue139;
        float productValue369 = ((sampledTextureValue16.z - scalarValue140) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue140;
#endif
        float productValue216 = (((clampedValue4 * clampedValue4) * clampedValue4) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float comparisonValue67 = (conditionValue1 ? (productValue207 * 301.72412109375f) : productValue207) * productValue216;
        float comparisonValue68 = (conditionValue1 ? (productValue214 * 301.72412109375f) : productValue214) * productValue216;
        float comparisonValue69 = (conditionValue1 ? (productValue215 * 301.72412109375f) : productValue215) * productValue216;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float comparisonValue95 = (conditionValue1 ? (productValue304 * 301.72412109375f) : productValue304) * productValue216;
        float comparisonValue96 = (conditionValue1 ? (productValue305 * 301.72412109375f) : productValue305) * productValue216;
        float comparisonValue97 = (conditionValue1 ? (productValue306 * 301.72412109375f) : productValue306) * productValue216;
        float comparisonValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float comparisonValue110 = (conditionValue1 ? (productValue335 * 301.72412109375f) : productValue335) * productValue216;
        float comparisonValue111 = (conditionValue1 ? (productValue336 * 301.72412109375f) : productValue336) * productValue216;
        float comparisonValue112 = (conditionValue1 ? (productValue337 * 301.72412109375f) : productValue337) * productValue216;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float comparisonValue125 = (conditionValue1 ? (productValue367 * 301.72412109375f) : productValue367) * productValue216;
        float comparisonValue126 = (conditionValue1 ? (productValue368 * 301.72412109375f) : productValue368) * productValue216;
        float comparisonValue127 = (conditionValue1 ? (productValue369 * 301.72412109375f) : productValue369) * productValue216;
        float comparisonValue19;
#endif
        float comparisonValue20;
        float comparisonValue21;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float comparisonValue22;
#endif
        if (comparisonValue63)
        {
            float productValue217 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue218 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue219 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue224 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue225 = productValue224 * clampedValue1;
            float productValue226 = productValue224 * clampedValue2;
            float productValue227 = productValue224 * clampedValue3;
            float clampedValue18 = clamp(dot(float3(productValue225, productValue226, productValue227), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue228 = ((clampedValue18 * (productValue225 - productValue217)) + productValue217) * varyingTexCoord8.x;
            float productValue229 = ((clampedValue18 * (productValue226 - productValue218)) + productValue218) * varyingTexCoord8.x;
            float productValue230 = ((clampedValue18 * (productValue227 - productValue219)) + productValue219) * varyingTexCoord8.x;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float intermediateValue103;
            float intermediateValue104;
            float intermediateValue105;
            bool intermediateValue106;
            if (!(dot(float3(comparisonValue67, comparisonValue68, comparisonValue69), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue228, productValue229, productValue230), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float intermediateValue132;
            float intermediateValue133;
            float intermediateValue134;
            bool intermediateValue135;
            if (!(dot(float3(comparisonValue95, comparisonValue96, comparisonValue97), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue228, productValue229, productValue230), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float intermediateValue104;
            float intermediateValue105;
            float intermediateValue106;
            bool intermediateValue107;
            if (!(dot(float3(comparisonValue110, comparisonValue111, comparisonValue112), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue228, productValue229, productValue230), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float intermediateValue133;
            float intermediateValue134;
            float intermediateValue135;
            bool intermediateValue136;
            if (!(dot(float3(comparisonValue125, comparisonValue126, comparisonValue127), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue228, productValue229, productValue230), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#endif
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                intermediateValue103 = productValue228;
                intermediateValue104 = productValue229;
                intermediateValue105 = productValue230;
                intermediateValue106 = true;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                intermediateValue132 = productValue228;
                intermediateValue133 = productValue229;
                intermediateValue134 = productValue230;
                intermediateValue135 = true;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                intermediateValue104 = productValue228;
                intermediateValue105 = productValue229;
                intermediateValue106 = productValue230;
                intermediateValue107 = true;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                intermediateValue133 = productValue228;
                intermediateValue134 = productValue229;
                intermediateValue135 = productValue230;
                intermediateValue136 = true;
#endif
            }
            else
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                intermediateValue103 = 0.0f;
                intermediateValue104 = 0.0f;
                intermediateValue105 = 0.0f;
                intermediateValue106 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                intermediateValue132 = 0.0f;
                intermediateValue133 = 0.0f;
                intermediateValue134 = 0.0f;
                intermediateValue135 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                intermediateValue104 = 0.0f;
                intermediateValue105 = 0.0f;
                intermediateValue106 = 0.0f;
                intermediateValue107 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                intermediateValue133 = 0.0f;
                intermediateValue134 = 0.0f;
                intermediateValue135 = 0.0f;
                intermediateValue136 = false;
#endif
            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            comparisonValue20 = intermediateValue106 ? intermediateValue103 : comparisonValue67;
            comparisonValue21 = intermediateValue106 ? intermediateValue104 : comparisonValue68;
            comparisonValue22 = intermediateValue106 ? intermediateValue105 : comparisonValue69;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            comparisonValue19 = intermediateValue135 ? intermediateValue132 : comparisonValue95;
            comparisonValue20 = intermediateValue135 ? intermediateValue133 : comparisonValue96;
            comparisonValue21 = intermediateValue135 ? intermediateValue134 : comparisonValue97;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            comparisonValue20 = intermediateValue107 ? intermediateValue104 : comparisonValue110;
            comparisonValue21 = intermediateValue107 ? intermediateValue105 : comparisonValue111;
            comparisonValue22 = intermediateValue107 ? intermediateValue106 : comparisonValue112;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            comparisonValue19 = intermediateValue136 ? intermediateValue133 : comparisonValue125;
            comparisonValue20 = intermediateValue136 ? intermediateValue134 : comparisonValue126;
            comparisonValue21 = intermediateValue136 ? intermediateValue135 : comparisonValue127;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            comparisonValue20 = comparisonValue67;
            comparisonValue21 = comparisonValue68;
            comparisonValue22 = comparisonValue69;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            comparisonValue19 = comparisonValue95;
            comparisonValue20 = comparisonValue96;
            comparisonValue21 = comparisonValue97;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            comparisonValue20 = comparisonValue110;
            comparisonValue21 = comparisonValue111;
            comparisonValue22 = comparisonValue112;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            comparisonValue19 = comparisonValue125;
            comparisonValue20 = comparisonValue126;
            comparisonValue21 = comparisonValue127;
#endif
        }
        float4 sampledTextureValue5 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3((-0.0f) - (multiplyAddValue32 * inverseLengthValue12), (-0.0f) - (multiplyAddValue33 * inverseLengthValue12), (-0.0f) - (multiplyAddValue34 * inverseLengthValue12))), 0.0f, 1.0f), sumValue129));
        float scalarValue63 = sampledTextureValue5.x;
        float scalarValue64 = sampledTextureValue5.y;
        float quotientValue20 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
        float clampedValue19 = 1.0f - clamp(comparisonValue65 ? (quotientValue20 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue20 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue231 = (((scalarValue63 * productValue34) + scalarValue64) * comparisonValue20) * clampedValue19;
        float productValue232 = (((scalarValue63 * productValue35) + scalarValue64) * comparisonValue21) * clampedValue19;
        float productValue233 = (((scalarValue63 * productValue36) + scalarValue64) * comparisonValue22) * clampedValue19;
        float branchMergedValue14;
        float branchMergedValue24;
        float branchMergedValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue307 = (((scalarValue63 * productValue34) + scalarValue64) * comparisonValue19) * clampedValue19;
        float productValue308 = (((scalarValue63 * productValue35) + scalarValue64) * comparisonValue20) * clampedValue19;
        float productValue309 = (((scalarValue63 * productValue36) + scalarValue64) * comparisonValue21) * clampedValue19;
        float branchMergedValue20;
        float branchMergedValue33;
        float branchMergedValue34;
#endif
        if (comparisonValue64)
        {
            float productValue234 = (multiplyAddValue9 + 1.0f) * 0.5f;
            float productValue235 = (multiplyAddValue10 + 1.0f) * 0.5f;
            uint scalarValue65 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue41 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue65))) + (-0.5f);
            uint sumValue130 = uint(min(int(uint(max(int(uint(int(multiplyAddValue41))), int(0u)))), int(scalarValue65 + 4294967294u)));
            float scalarValue66 = float(int(sumValue130));
            float4 sampledTextureValue6 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue234, productValue235, scalarValue66), 0.0f);
            float scalarValue67 = sampledTextureValue6.w;
            float sampledTextureValue7 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue234, productValue235, float(int(sumValue130 + 1u))), 0.0f).w - scalarValue67) * min(max(multiplyAddValue41 - scalarValue66, 0.0f), 1.0f)) + scalarValue67;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue14 = sampledTextureValue7 * productValue231;
            branchMergedValue24 = sampledTextureValue7 * productValue233;
            branchMergedValue25 = sampledTextureValue7 * productValue232;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue20 = sampledTextureValue7 * productValue309;
            branchMergedValue33 = sampledTextureValue7 * productValue308;
            branchMergedValue34 = sampledTextureValue7 * productValue307;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue14 = productValue231;
            branchMergedValue24 = productValue233;
            branchMergedValue25 = productValue232;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue20 = productValue309;
            branchMergedValue33 = productValue308;
            branchMergedValue34 = productValue307;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue71 = branchMergedValue14;
        intermediateValue72 = branchMergedValue25;
        intermediateValue73 = branchMergedValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue87 = branchMergedValue34;
        intermediateValue88 = branchMergedValue33;
        intermediateValue89 = branchMergedValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue72 = branchMergedValue14;
        intermediateValue73 = branchMergedValue25;
        intermediateValue74 = branchMergedValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue88 = branchMergedValue34;
        intermediateValue89 = branchMergedValue33;
        intermediateValue90 = branchMergedValue20;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue13;
        float branchMergedValue22;
        float branchMergedValue23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue19;
        float branchMergedValue31;
        float branchMergedValue32;
#endif
        if (comparisonValue63)
        {
            float multiplyAddValue38;
            float multiplyAddValue39;
            float multiplyAddValue40;
            if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
            {
                multiplyAddValue38 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue32, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue31, productValue30 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            }
            else
            {
                multiplyAddValue38 = multiplyAddValue4;
                multiplyAddValue39 = multiplyAddValue5;
                multiplyAddValue40 = multiplyAddValue6;
            }
            float inverseLengthValue13 = rsqrt(dot(float3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40), float3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40)));
            float productValue236 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue237 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue238 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue239 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue240 = productValue239 * clampedValue1;
            float productValue241 = productValue239 * clampedValue2;
            float productValue242 = productValue239 * clampedValue3;
            float clampedValue20 = clamp(dot(float3(productValue240, productValue241, productValue242), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue243 = ((clampedValue20 * (productValue240 - productValue236)) + productValue236) * varyingTexCoord8.x;
            float productValue244 = ((clampedValue20 * (productValue241 - productValue237)) + productValue237) * varyingTexCoord8.x;
            float productValue245 = ((clampedValue20 * (productValue242 - productValue238)) + productValue238) * varyingTexCoord8.x;
            bool dotProductValue16 = dot(float3(productValue243, productValue244, productValue245), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) <= 0.0f;
            float4 sampledTextureValue8 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3((-0.0f) - (multiplyAddValue38 * inverseLengthValue13), (-0.0f) - (multiplyAddValue39 * inverseLengthValue13), (-0.0f) - (multiplyAddValue40 * inverseLengthValue13))), 0.0f, 1.0f), 1.0f - varyingTexCoord8.z));
            float scalarValue68 = sampledTextureValue8.x;
            float scalarValue69 = sampledTextureValue8.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue13 = ((scalarValue68 * productValue34) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue243);
            branchMergedValue22 = ((scalarValue68 * productValue36) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue245);
            branchMergedValue23 = ((scalarValue68 * productValue35) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue244);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue19 = ((scalarValue68 * productValue36) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue245);
            branchMergedValue31 = ((scalarValue68 * productValue35) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue244);
            branchMergedValue32 = ((scalarValue68 * productValue34) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue243);
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue13 = 0.0f;
            branchMergedValue22 = 0.0f;
            branchMergedValue23 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue19 = 0.0f;
            branchMergedValue31 = 0.0f;
            branchMergedValue32 = 0.0f;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue71 = branchMergedValue13;
        intermediateValue72 = branchMergedValue23;
        intermediateValue73 = branchMergedValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue87 = branchMergedValue32;
        intermediateValue88 = branchMergedValue31;
        intermediateValue89 = branchMergedValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue72 = branchMergedValue13;
        intermediateValue73 = branchMergedValue23;
        intermediateValue74 = branchMergedValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue88 = branchMergedValue32;
        intermediateValue89 = branchMergedValue31;
        intermediateValue90 = branchMergedValue19;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue246 = ((productValue100 * (((intermediateValue29 - sumValue109) * intermediateValue28) + sumValue109)) + productValue97) + intermediateValue71;
    float productValue247 = ((productValue100 * (((intermediateValue30 - sumValue111) * intermediateValue28) + sumValue111)) + productValue98) + intermediateValue72;
    float productValue248 = ((productValue100 * (((intermediateValue31 - sumValue112) * intermediateValue28) + sumValue112)) + productValue99) + intermediateValue73;
    float productValue163;
    float productValue164;
    float productValue165;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue310 = ((productValue108 * (((intermediateValue27 - sumValue168) * intermediateValue26) + sumValue168)) + productValue105) + intermediateValue87;
    float productValue311 = ((productValue108 * (((intermediateValue28 - sumValue169) * intermediateValue26) + sumValue169)) + productValue106) + intermediateValue88;
    float productValue312 = ((productValue108 * (((intermediateValue29 - sumValue170) * intermediateValue26) + sumValue170)) + productValue107) + intermediateValue89;
    float productValue165;
    float productValue166;
    float productValue167;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue338 = ((productValue102 * (((intermediateValue30 - sumValue182) * intermediateValue29) + sumValue182)) + productValue99) + intermediateValue72;
    float productValue339 = ((productValue102 * (((intermediateValue31 - sumValue183) * intermediateValue29) + sumValue183)) + productValue100) + intermediateValue73;
    float productValue340 = ((productValue102 * (((intermediateValue32 - sumValue184) * intermediateValue29) + sumValue184)) + productValue101) + intermediateValue74;
    float productValue165;
    float productValue166;
    float productValue167;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue370 = ((productValue110 * (((intermediateValue28 - sumValue198) * intermediateValue27) + sumValue198)) + productValue107) + intermediateValue88;
    float productValue371 = ((productValue110 * (((intermediateValue29 - sumValue199) * intermediateValue27) + sumValue199)) + productValue108) + intermediateValue89;
    float productValue372 = ((productValue110 * (((intermediateValue30 - sumValue200) * intermediateValue27) + sumValue200)) + productValue109) + intermediateValue90;
    float productValue167;
    float productValue168;
    float productValue169;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue9 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue163 = sampledTextureValue9 * productValue246;
        productValue164 = sampledTextureValue9 * productValue247;
        productValue165 = sampledTextureValue9 * productValue248;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue165 = sampledTextureValue9 * productValue310;
        productValue166 = sampledTextureValue9 * productValue311;
        productValue167 = sampledTextureValue9 * productValue312;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue165 = sampledTextureValue9 * productValue338;
        productValue166 = sampledTextureValue9 * productValue339;
        productValue167 = sampledTextureValue9 * productValue340;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue167 = sampledTextureValue9 * productValue370;
        productValue168 = sampledTextureValue9 * productValue371;
        productValue169 = sampledTextureValue9 * productValue372;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue163 = productValue246;
        productValue164 = productValue247;
        productValue165 = productValue248;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue165 = productValue310;
        productValue166 = productValue311;
        productValue167 = productValue312;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue165 = productValue338;
        productValue166 = productValue339;
        productValue167 = productValue340;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue167 = productValue370;
        productValue168 = productValue371;
        productValue169 = productValue372;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue163;
    fragmentColor0.y = productValue164;
    fragmentColor0.z = productValue165;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue165;
    fragmentColor0.y = productValue166;
    fragmentColor0.z = productValue167;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    fragmentColor0.x = productValue167;
    fragmentColor0.y = productValue168;
    fragmentColor0.z = productValue169;
#endif
    fragmentColor0.w = (comparisonValue != 0u) ? 0.0f : 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord8 = stage_input.varyingTexCoord8;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
