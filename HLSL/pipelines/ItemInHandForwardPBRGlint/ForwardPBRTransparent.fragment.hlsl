// ItemInHandForwardPBRGlint / ForwardPBRTransparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ItemInHandForwardPBRGlint/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord2 : TEXCOORD2,
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
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25,workingVector26;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.zw;
  workingVector0.zw = workingVector0.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector1.w = workingVector2.x * 0.25 + workingVector2.y;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = 0.75 * workingVector0.w;
  workingVector0.z = workingVector0.z * 0.5 + workingVector0.w;
  workingVector0.z = frac(workingVector0.z);
  workingVector0.z = workingVector1.w * 0.25 + workingVector0.z;
  workingVector0.z = workingVector0.z * 64 + 0.5;
  workingVector0.z = 0.015625 * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.z >= workingVector0.y);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  fragmentColor0.w = workingVector0.x ? 0 : 1;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector0.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector0.wwww + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector0.yyyy;
  workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector0.xxxx + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector0.zzzz + workingVector2.xyzw;
  workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector0.wwww + workingVector2.xyzw;
  workingVector2.xyz = workingVector2.xyz / workingVector2.www;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector3.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector4.xyz;
  workingVector5.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector6.xyz = ddx_coarse(workingVector0.zxy);
  workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xyz = -workingVector0.yzx;
  workingVector7.xyz = ddy_coarse(workingVector7.xyz);
  workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector7.xyz = -workingVector0.xyz;
  workingVector8.xyz = ddy_coarse(workingVector7.yzx);
  workingVector1.w = dot(workingVector8.xyz, workingVector8.xyz);
#endif
  workingVector1.w = rsqrt(workingVector1.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xyz = workingVector7.xyz * workingVector1.www;
  workingVector8.xyz = workingVector7.xyz * workingVector6.xyz;
  workingVector6.xyz = workingVector6.zxy * workingVector7.yzx + -workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector8.xyz = workingVector8.xyz * workingVector1.www;
  workingVector9.xyz = workingVector8.xyz * workingVector6.xyz;
  workingVector6.xyz = workingVector6.zxy * workingVector8.yzx + -workingVector9.xyz;
#endif
  workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector6.yyy;
  workingVector6.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector6.xxx + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector6.yyy;
  workingVector6.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector6.xxx + workingVector8.xyz;
#endif
  workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector6.zzz + workingVector6.xyw;
  workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector6.xyz = workingVector6.xyz * workingVector1.www;
  workingVector6.xyz = workingVector6.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector6.xyz = round(workingVector6.xyz);
  workingVector6.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector6.xyz;
  workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xyz = workingVector5.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector7.xyz = floor(workingVector7.xyz);
  workingVector7.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector7.xyz + workingVector5.xyz;
  workingVector7.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector7.xyz;
  workingVector1.w = dot(workingVector7.xyz, workingVector6.xyz);
  workingVector6.xyz = -workingVector1.www * workingVector6.xyz + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector8.xyz = workingVector5.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector8.xyz = floor(workingVector8.xyz);
  workingVector8.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector8.xyz + workingVector5.xyz;
  workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector8.xyz;
  workingVector1.w = dot(workingVector8.xyz, workingVector6.xyz);
  workingVector6.xyz = -workingVector1.www * workingVector6.xyz + workingVector8.xyz;
#endif
  workingVector6.xyz = workingVector6.xyz + workingVector5.xyz;
  workingVector6.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector6.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector1.w = workingVector7.y ? workingVector7.x : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector8.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector1.w = workingVector8.y ? workingVector8.x : 0;
#endif
  if (workingVector1.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector7.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector7.xy;
    workingVector7.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector1.w = materialTexture4.Sample(textureSampler4, workingVector7.xyz).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector8.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector8.xy;
    workingVector8.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector1.w = materialTexture4.Sample(textureSampler4, workingVector8.xyz).x;
#endif
    workingVector1.w = workingVector1.w + workingVector1.w;
    workingVector2.w = saturate(workingVector3.y);
    workingVector1.w = workingVector2.w * workingVector1.w;
    workingVector1.w = log2(workingVector1.w);
    workingVector1.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector1.w;
    workingVector1.w = exp2(workingVector1.w);
    workingVector2.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector1.w = workingVector2.w * workingVector1.w;
  } else {
    workingVector1.w = 1;
  }
  workingVector2.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector2.w = sqrt(workingVector2.w);
  workingVector3.w = RD_COMPARISON_MASK(workingVector2.z != 1.000000);
  if (workingVector3.w != 0) {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    workingVector7.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
    workingVector7.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector7.xyz + float3(1,1,1);
    workingVector8.xyz = workingVector7.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector7.xyz;
    workingVector7.xyz = varyingColor0.www * workingVector8.xyz + workingVector7.xyz;
    workingVector8.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector7.xyz;
    workingVector7.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector8.xyz + workingVector7.xyz;
    workingVector8.xyzw = frac(varyingTexCoord2.xyzw);
    workingVector9.xyz = materialTexture1.Sample(textureSampler1, workingVector8.xy).xyz;
    workingVector8.xyz = materialTexture1.Sample(textureSampler1, workingVector8.zw).xyz;
    workingVector8.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector8.xyz;
    workingVector8.xyz = workingVector9.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector8.xyz;
    workingVector7.xyz = workingVector8.xyz * workingVector8.xyz + workingVector7.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    workingVector8.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
    workingVector8.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector8.xyz + float3(1,1,1);
    workingVector9.xyz = workingVector8.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector8.xyz;
    workingVector8.xyz = varyingColor0.www * workingVector9.xyz + workingVector8.xyz;
    workingVector9.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector9.xyz + workingVector8.xyz;
    workingVector9.xyzw = frac(varyingTexCoord2.xyzw);
    workingVector10.xyz = materialTexture1.Sample(textureSampler1, workingVector9.xy).xyz;
    workingVector9.xyz = materialTexture1.Sample(textureSampler1, workingVector9.zw).xyz;
    workingVector9.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector9.xyz;
    workingVector9.xyz = workingVector10.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector9.xyz;
    workingVector8.xyz = workingVector9.xyz * workingVector9.xyz + workingVector8.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    workingVector7.xy = float2(-1,-1) + varyingColor0.xy;
    workingVector7.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector7.xy + float2(1,1);
    workingVector7.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector7.xxx;
    workingVector3.w = ceil(workingVector7.y);
    workingVector8.xyz = workingVector7.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector7.xzw;
    workingVector7.xyz = workingVector3.www * workingVector8.xyz + workingVector7.xzw;
    workingVector8.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector7.xyz;
    workingVector7.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector8.xyz + workingVector7.xyz;
    workingVector8.xyzw = frac(varyingTexCoord2.xyzw);
    workingVector9.xyz = materialTexture1.Sample(textureSampler1, workingVector8.xy).xyz;
    workingVector8.xyz = materialTexture1.Sample(textureSampler1, workingVector8.zw).xyz;
    workingVector8.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector8.xyz;
    workingVector8.xyz = workingVector9.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector8.xyz;
    workingVector7.xyz = workingVector8.xyz * workingVector8.xyz + workingVector7.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    workingVector8.xy = float2(-1,-1) + varyingColor0.xy;
    workingVector8.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector8.xy + float2(1,1);
    workingVector8.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector8.xxx;
    workingVector3.w = ceil(workingVector8.y);
    workingVector9.xyz = workingVector8.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector8.xzw;
    workingVector8.xyz = workingVector3.www * workingVector9.xyz + workingVector8.xzw;
    workingVector9.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector9.xyz + workingVector8.xyz;
    workingVector9.xyzw = frac(varyingTexCoord2.xyzw);
    workingVector10.xyz = materialTexture1.Sample(textureSampler1, workingVector9.xy).xyz;
    workingVector9.xyz = materialTexture1.Sample(textureSampler1, workingVector9.zw).xyz;
    workingVector9.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector9.xyz;
    workingVector9.xyz = workingVector10.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector9.xyz;
    workingVector8.xyz = workingVector9.xyz * workingVector9.xyz + workingVector8.xyz;
#endif
    workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector8.xyz = max(float3(0,0,0), workingVector7.xyz);
    workingVector8.xyz = log2(workingVector8.xyz);
    workingVector8.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector8.xyz;
    workingVector8.xyz = exp2(workingVector8.xyz);
    workingVector9.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector7.xyz;
    workingVector10.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector7.xyz;
    workingVector10.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector10.xyz;
    workingVector10.xyz = log2(workingVector10.xyz);
    workingVector10.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector10.xyz;
    workingVector10.xyz = exp2(workingVector10.xyz);
    workingVector7.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector7.xyz);
    workingVector7.xyz = workingVector7.xyz ? workingVector9.xyz : workingVector10.xyz;
    workingVector7.xyz = workingVector3.www ? workingVector8.xyz : workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = max(float3(0,0,0), workingVector8.xyz);
    workingVector9.xyz = log2(workingVector9.xyz);
    workingVector9.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector9.xyz;
    workingVector9.xyz = exp2(workingVector9.xyz);
    workingVector10.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector8.xyz;
    workingVector11.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector8.xyz;
    workingVector11.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector11.xyz;
    workingVector11.xyz = log2(workingVector11.xyz);
    workingVector11.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector11.xyz;
    workingVector11.xyz = exp2(workingVector11.xyz);
    workingVector8.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector8.xyz);
    workingVector8.xyz = workingVector8.xyz ? workingVector10.xyz : workingVector11.xyz;
    workingVector8.xyz = workingVector3.www ? workingVector9.xyz : workingVector8.xyz;
    workingVector3.w = 9.99999975e-005 + workingVector2.w;
    workingVector9.xyz = workingVector0.xyz / workingVector3.www;
    workingVector3.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
    workingVector3.w = RD_COMPARISON_MASK(0 < (int)workingVector3.w);
    workingVector10.xyz = workingVector3.www ? workingVector6.xyz : varyingTexCoord3.xyz;
#endif
    workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector4.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector3.w = workingVector3.w ? workingVector4.w : 0;
    if (workingVector3.w == 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector3.w = 9.99999975e-005 + workingVector2.w;
      workingVector8.xyz = workingVector0.xyz / workingVector3.www;
#endif
      workingVector3.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector3.w = RD_COMPARISON_MASK((int)workingVector3.w == 1);
      if (workingVector3.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector3.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector3.w = RD_COMPARISON_MASK(0 < (int)workingVector3.w);
        workingVector9.xyz = workingVector3.www ? workingVector6.xyz : varyingTexCoord3.xyz;
        workingVector10.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector10.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector10.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector10.xyz;
        workingVector3.w = dot(workingVector10.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector11.xyz;
        workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector11.xyz;
        workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector11.xyz;
        workingVector3.w = dot(workingVector11.xyz, workingVector11.xyz);
#endif
        workingVector3.w = rsqrt(workingVector3.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = workingVector10.xyz * workingVector3.www;
        workingVector3.w = dot(workingVector4.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = workingVector11.xyz * workingVector3.www;
        workingVector3.w = dot(workingVector4.xyz, workingVector11.xyz);
#endif
        workingVector3.w = max(0, workingVector3.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
#endif
        workingVector4.w = 1 + -workingVector3.w;
        workingVector4.w = max(0, workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector9.xyz = workingVector10.xyz * workingVector4.www + workingVector9.xyz;
        workingVector10.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector4.w = dot(workingVector10.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector11.xyz = workingVector11.xyz * workingVector4.www + workingVector10.xyz;
        workingVector12.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector4.w = dot(workingVector12.xyzw, float4(1,1,1,1));
#endif
        workingVector4.w = (int)workingVector4.w;
        workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xz = float2(1,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.xz = float2(1,0);
#endif
        workingVector6.w = 0;
        while (true) {
          workingVector7.w = RD_COMPARISON_MASK((int)workingVector6.w >= (int)workingVector4.w);
          if (workingVector7.w != 0) break;
          workingVector7.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector6.w+0].xyzw);
          workingVector7.w = (int)workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector7.w = (int)workingVector7.w + (int)workingVector10.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector7.w = (int)workingVector7.w + (int)workingVector12.z;
#endif
          workingVector7.w = min(8, (int)workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector8.w = workingVector10.x;
          workingVector9.w = workingVector10.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector8.w = workingVector12.x;
          workingVector9.w = workingVector12.z;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.y = RD_COMPARISON_MASK((int)workingVector9.w >= (int)workingVector7.w);
            if (workingVector10.y != 0) break;
            workingVector10.y = (uint)workingVector9.w << 2;
            workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+59].xyz * workingVector9.yyy;
            workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+58].xyz * workingVector9.xxx + workingVector11.xyz;
            workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+60].xyz * workingVector9.zzz + workingVector11.xyz;
            workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+61].xyz + workingVector11.xyz;
            workingVector12.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector11.xyz));
            workingVector10.y = workingVector12.y ? workingVector12.x : 0;
            workingVector10.y = workingVector12.z ? workingVector10.y : 0;
            if (workingVector10.y != 0) {
              workingVector10.y = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector9.w+0].xyzw);
              workingVector10.y = max(workingVector10.y, workingVector3.w);
              workingVector10.y = min(1, workingVector10.y);
              workingVector10.w = -workingVector10.y * workingVector10.y + 1;
              workingVector10.w = sqrt(workingVector10.w);
              workingVector10.y = workingVector10.w / workingVector10.y;
              workingVector10.y = fragmentVectorConstants1[workingVector9.w+17].z * workingVector10.y + fragmentVectorConstants1[workingVector9.w+17].y;
              workingVector12.xy = workingVector11.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector10.w = fragmentVectorConstants1[workingVector9.w+17].w + 0.5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w >= (int)workingVector7.w);
            if (workingVector10.w != 0) break;
            workingVector10.w = (uint)workingVector9.w << 2;
            workingVector13.xyz = fragmentVectorConstants1[workingVector10.w+61].xyz * workingVector11.yyy;
            workingVector13.xyz = fragmentVectorConstants1[workingVector10.w+60].xyz * workingVector11.xxx + workingVector13.xyz;
            workingVector13.xyz = fragmentVectorConstants1[workingVector10.w+62].xyz * workingVector11.zzz + workingVector13.xyz;
            workingVector13.xyz = fragmentVectorConstants1[workingVector10.w+63].xyz + workingVector13.xyz;
            workingVector14.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector13.xyz));
            workingVector10.w = workingVector14.y ? workingVector14.x : 0;
            workingVector10.w = workingVector14.z ? workingVector10.w : 0;
            if (workingVector10.w != 0) {
              workingVector10.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector9.w+0].xyzw);
              workingVector10.w = max(workingVector10.w, workingVector3.w);
              workingVector10.w = min(1, workingVector10.w);
              workingVector11.w = -workingVector10.w * workingVector10.w + 1;
              workingVector11.w = sqrt(workingVector11.w);
              workingVector10.w = workingVector11.w / workingVector10.w;
              workingVector10.w = fragmentVectorConstants1[workingVector9.w+17].z * workingVector10.w + fragmentVectorConstants1[workingVector9.w+17].y;
              workingVector14.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector11.w = fragmentVectorConstants1[workingVector9.w+17].w + 0.5;
              workingVector11.w = (int)workingVector11.w;
              workingVector11.w = max(1, (int)workingVector11.w);
              workingVector11.w = min(9, (int)workingVector11.w);
              workingVector11.w = workingVector5.w ? 1 : workingVector11.w;
              workingVector12.y = (uint)workingVector11.w >> 1;
              workingVector14.z = 1 + -workingVector14.y;
              workingVector15.z = (int)workingVector9.w;
              workingVector10.w = workingVector13.z + -workingVector10.w;
              workingVector12.w = 0;
              workingVector13.x = 0;
              while (true) {
                workingVector13.y = RD_COMPARISON_MASK((int)workingVector13.x >= (int)workingVector11.w);
                if (workingVector13.y != 0) break;
                workingVector13.y = (int)-workingVector12.y + (int)workingVector13.x;
                workingVector13.y = (int)workingVector13.y;
                workingVector16.y = 0.5 + workingVector13.y;
                workingVector13.y = workingVector12.w;
                workingVector13.z = 0;
                while (true) {
                  workingVector13.w = RD_COMPARISON_MASK((int)workingVector13.z >= (int)workingVector11.w);
                  if (workingVector13.w != 0) break;
                  workingVector13.w = (int)-workingVector12.y + (int)workingVector13.z;
                  workingVector13.w = (int)workingVector13.w;
                  workingVector16.x = 0.5 + workingVector13.w;
                  workingVector14.yw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector16.xy;
                  workingVector14.yw = fragmentVectorConstants1[workingVector9.w+17].xx * workingVector14.yw;
                  workingVector15.xy = workingVector14.xz * fragmentVectorConstants1[workingVector9.w+17].xx + workingVector14.yw;
                  workingVector17.xyzw = materialTexture6.Gather(textureSampler6, workingVector15.xyz).xyzw;
                  workingVector14.yw = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector14.yw = frac(workingVector14.yw);
                  workingVector13.w = RD_COMPARISON_MASK(workingVector17.w >= workingVector10.w);
                  workingVector13.w = workingVector13.w ? 1.000000 : 0;
                  workingVector13.w = workingVector13.y + workingVector13.w;
                  workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector10.wwww);
                  workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                  workingVector15.xy = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector15.xy = workingVector18.zy + workingVector15.xy;
                  workingVector15.xy = workingVector14.yy * workingVector15.xy + workingVector18.wx;
                  workingVector14.y = workingVector15.y + -workingVector15.x;
                  workingVector14.y = workingVector14.w * workingVector14.y + workingVector15.x;
                  workingVector14.y = workingVector14.y + workingVector13.y;
                  workingVector13.y = workingVector5.w ? workingVector13.w : workingVector14.y;
                  workingVector13.z = (int)workingVector13.z + 1;
                }
                workingVector12.w = workingVector13.y;
                workingVector13.x = (int)workingVector13.x + 1;
              }
              workingVector10.w = (int)workingVector11.w * (int)workingVector11.w;
#endif
              workingVector10.w = (int)workingVector10.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector10.w = max(1, (int)workingVector10.w);
              workingVector10.w = min(9, (int)workingVector10.w);
              workingVector10.w = workingVector5.w ? 1 : workingVector10.w;
              workingVector11.x = (uint)workingVector10.w >> 1;
              workingVector12.z = 1 + -workingVector12.y;
              workingVector13.z = (int)workingVector9.w;
              workingVector10.y = workingVector11.z + -workingVector10.y;
              workingVector11.yz = float2(0,0);
              while (true) {
                workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.z >= (int)workingVector10.w);
                if (workingVector11.w != 0) break;
                workingVector11.w = (int)-workingVector11.x + (int)workingVector11.z;
                workingVector11.w = (int)workingVector11.w;
                workingVector14.y = 0.5 + workingVector11.w;
                workingVector11.w = workingVector11.y;
                workingVector12.y = 0;
                while (true) {
                  workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.y >= (int)workingVector10.w);
                  if (workingVector12.w != 0) break;
                  workingVector12.w = (int)-workingVector11.x + (int)workingVector12.y;
                  workingVector12.w = (int)workingVector12.w;
                  workingVector14.x = 0.5 + workingVector12.w;
                  workingVector14.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector14.xy;
                  workingVector14.xz = fragmentVectorConstants1[workingVector9.w+17].xx * workingVector14.xz;
                  workingVector13.xy = workingVector12.xz * fragmentVectorConstants1[workingVector9.w+17].xx + workingVector14.xz;
                  workingVector15.xyzw = materialTexture6.Gather(textureSampler6, workingVector13.xyz).xyzw;
                  workingVector13.xy = workingVector13.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector13.xy = frac(workingVector13.xy);
                  workingVector12.w = RD_COMPARISON_MASK(workingVector15.w >= workingVector10.y);
                  workingVector12.w = workingVector12.w ? 1.000000 : 0;
                  workingVector12.w = workingVector12.w + workingVector11.w;
                  workingVector15.xyzw = RD_COMPARISON_MASK(workingVector15.xyzw >= workingVector10.yyyy);
                  workingVector16.xyzw = workingVector15.xyzw ? float4(1,1,1,1) : 0;
                  workingVector14.xz = workingVector15.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector14.xz = workingVector16.zy + workingVector14.xz;
                  workingVector13.xw = workingVector13.xx * workingVector14.xz + workingVector16.wx;
                  workingVector13.w = workingVector13.w + -workingVector13.x;
                  workingVector13.x = workingVector13.y * workingVector13.w + workingVector13.x;
                  workingVector13.x = workingVector13.x + workingVector11.w;
                  workingVector11.w = workingVector5.w ? workingVector12.w : workingVector13.x;
                  workingVector12.y = (int)workingVector12.y + 1;
                }
                workingVector11.y = workingVector11.w;
                workingVector11.z = (int)workingVector11.z + 1;
              }
              workingVector10.y = (int)workingVector10.w * (int)workingVector10.w;
              workingVector10.y = (int)workingVector10.y;
              workingVector10.y = workingVector11.y / workingVector10.y;
              workingVector8.w = min(workingVector10.y, workingVector8.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.w = workingVector12.w / workingVector10.w;
              workingVector8.w = min(workingVector10.w, workingVector8.w);
#endif
              workingVector9.w = workingVector7.w;
            } else {
              workingVector9.w = (int)workingVector9.w + 1;
            }
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector10.x = workingVector8.w;
          workingVector10.z = workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.x = workingVector8.w;
          workingVector12.z = workingVector9.w;
#endif
          workingVector6.w = (int)workingVector6.w + 1;
        }
        workingVector4.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector4.w = RD_COMPARISON_MASK(0 < (int)workingVector4.w);
        if (workingVector4.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector10.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector9.yyy;
          workingVector10.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector9.xxx + workingVector10.yzw;
          workingVector10.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector9.zzz + workingVector10.yzw;
          workingVector10.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector10.yzw;
          workingVector11.xy = workingVector10.yz * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector11.z = 1 + -workingVector11.y;
          workingVector10.yz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector11.xz;
          workingVector11.xy = RD_COMPARISON_MASK(workingVector10.yz >= float2(0,0));
          workingVector11.zw = RD_COMPARISON_MASK(workingVector10.yz < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector4.w = workingVector11.z ? workingVector11.x : 0;
          workingVector4.w = workingVector11.y ? workingVector4.w : 0;
          workingVector4.w = workingVector11.w ? workingVector4.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector11.yyy;
          workingVector12.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector11.xxx + workingVector12.yzw;
          workingVector12.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector11.zzz + workingVector12.yzw;
          workingVector12.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector12.yzw;
          workingVector13.xy = workingVector12.yz * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector13.z = 1 + -workingVector13.y;
          workingVector12.yz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector13.xz;
          workingVector13.xy = RD_COMPARISON_MASK(workingVector12.yz >= float2(0,0));
          workingVector13.zw = RD_COMPARISON_MASK(workingVector12.yz < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector4.w = workingVector13.z ? workingVector13.x : 0;
          workingVector4.w = workingVector13.y ? workingVector4.w : 0;
          workingVector4.w = workingVector13.w ? workingVector4.w : 0;
#endif
          if (workingVector4.w != 0) {
            workingVector4.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector3.w);
            workingVector4.w = min(1, workingVector4.w);
            workingVector6.w = -workingVector4.w * workingVector4.w + 1;
            workingVector6.w = sqrt(workingVector6.w);
            workingVector4.w = workingVector6.w / workingVector4.w;
            workingVector4.w = fragmentVectorConstants1[workingVector9.w+17].z * workingVector4.w + fragmentVectorConstants1[workingVector9.w+17].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = workingVector10.w + -workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = workingVector12.w + -workingVector4.w;
#endif
            workingVector4.w = min(1, workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xy = workingVector5.ww ? float2(1,1) : float2(2,4);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xy = workingVector5.ww ? float2(1,1) : float2(2,4);
#endif
            workingVector6.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.z = 1 + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.z = 1 + workingVector6.w;
#endif
            workingVector6.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
            workingVector7.w = 0;
            workingVector8.w = 0;
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector11.x);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector13.x);
#endif
              if (workingVector9.w != 0) break;
              workingVector9.w = (int)workingVector6.w + (int)workingVector8.w;
              workingVector9.w = (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.y = 0.5 + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector15.y = 0.5 + workingVector9.w;
#endif
              workingVector9.w = workingVector7.w;
              workingVector10.w = 0;
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector11.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector11.x);
                if (workingVector11.z != 0) break;
                workingVector11.z = (int)workingVector6.w + (int)workingVector10.w;
                workingVector11.z = (int)workingVector11.z;
                workingVector13.x = 0.5 + workingVector11.z;
                workingVector11.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector13.xy;
                workingVector12.xy = workingVector11.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector10.yz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector13.x);
                if (workingVector11.w != 0) break;
                workingVector11.w = (int)workingVector6.w + (int)workingVector10.w;
                workingVector11.w = (int)workingVector11.w;
                workingVector15.x = 0.5 + workingVector11.w;
                workingVector13.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector15.xy;
                workingVector14.xy = workingVector13.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector12.yz;
#endif
                if (workingVector5.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector11.z = materialTexture6.SampleLevel(textureSampler6, workingVector12.xyz, 0).x;
                  workingVector11.z = RD_COMPARISON_MASK(workingVector11.z >= workingVector4.w);
                  workingVector11.z = workingVector11.z ? 1.000000 : 0;
                  workingVector9.w = workingVector11.z + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector11.w = materialTexture6.SampleLevel(textureSampler6, workingVector14.xyz, 0).x;
                  workingVector11.w = RD_COMPARISON_MASK(workingVector11.w >= workingVector4.w);
                  workingVector11.w = workingVector11.w ? 1.000000 : 0;
                  workingVector9.w = workingVector11.w + workingVector9.w;
#endif
                } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector14.xyzw = materialTexture6.Gather(textureSampler6, workingVector12.xyz).xyzw;
                  workingVector11.zw = workingVector12.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector11.zw = frac(workingVector11.zw);
                  workingVector14.xyzw = RD_COMPARISON_MASK(workingVector14.xyzw >= workingVector4.wwww);
                  workingVector15.xyzw = workingVector14.xyzw ? float4(1,1,1,1) : 0;
                  workingVector12.xy = workingVector14.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector12.xy = workingVector15.zy + workingVector12.xy;
                  workingVector12.xy = workingVector11.zz * workingVector12.xy + workingVector15.wx;
                  workingVector11.z = workingVector12.y + -workingVector12.x;
                  workingVector11.z = workingVector11.w * workingVector11.z + workingVector12.x;
                  workingVector9.w = workingVector11.z + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector16.xyzw = materialTexture6.Gather(textureSampler6, workingVector14.xyz).xyzw;
                  workingVector13.zw = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector13.zw = frac(workingVector13.zw);
                  workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector4.wwww);
                  workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                  workingVector14.xy = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector14.xy = workingVector17.zy + workingVector14.xy;
                  workingVector14.xy = workingVector13.zz * workingVector14.xy + workingVector17.wx;
                  workingVector11.w = workingVector14.y + -workingVector14.x;
                  workingVector11.w = workingVector13.w * workingVector11.w + workingVector14.x;
                  workingVector9.w = workingVector11.w + workingVector9.w;
#endif
                }
                workingVector10.w = (int)workingVector10.w + 1;
              }
              workingVector7.w = workingVector9.w;
              workingVector8.w = (int)workingVector8.w + 1;
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = workingVector7.w / workingVector11.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = workingVector7.w / workingVector13.y;
#endif
          } else {
            workingVector4.w = 1;
          }
        } else {
          workingVector4.w = 1;
        }
        workingVector6.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
        workingVector7.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector7.w = RD_COMPARISON_MASK(0 < (int)workingVector7.w);
        workingVector6.w = workingVector6.w ? workingVector7.w : 0;
        if (workingVector6.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector9.yyyy;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector9.xxxx + workingVector11.xyzw;
          workingVector9.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector9.zzzz + workingVector11.xyzw;
          workingVector9.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector9.xyzw;
          workingVector9.xyzw = workingVector9.xyzw / workingVector9.wwww;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector11.yyyy;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector11.xxxx + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector11.zzzz + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector11.xyzw;
          workingVector11.xyzw = workingVector11.xyzw / workingVector11.wwww;
#endif
          workingVector3.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector3.w);
          workingVector3.w = min(1, workingVector3.w);
          workingVector6.w = -workingVector3.w * workingVector3.w + 1;
          workingVector6.w = sqrt(workingVector6.w);
          workingVector3.w = workingVector6.w / workingVector3.w;
          workingVector3.w = fragmentVectorConstants1[workingVector9.w+17].z * workingVector3.w + fragmentVectorConstants1[workingVector9.w+17].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector3.w = workingVector3.w / workingVector9.w;
          workingVector3.w = workingVector9.z + -workingVector3.w;
          workingVector9.xy = workingVector9.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector9.z = 1 + -workingVector9.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector3.w = workingVector3.w / workingVector11.w;
          workingVector3.w = workingVector11.z + -workingVector3.w;
          workingVector11.xy = workingVector11.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector11.z = 1 + -workingVector11.y;
#endif
          workingVector6.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector6.w = (int)workingVector6.w;
          workingVector6.w = max(1, (int)workingVector6.w);
          workingVector6.w = min(9, (int)workingVector6.w);
          workingVector6.w = workingVector5.w ? 1 : workingVector6.w;
          workingVector7.w = (uint)workingVector6.w >> 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#endif
          workingVector8.w = 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector9.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.w = 0;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.y >= (int)workingVector6.w);
            if (workingVector9.w != 0) break;
            workingVector9.w = (int)-workingVector7.w + (int)workingVector9.y;
            workingVector9.w = (int)workingVector9.w;
            workingVector12.y = 0.5 + workingVector9.w;
            workingVector9.w = workingVector8.w;
            workingVector10.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w >= (int)workingVector6.w);
            if (workingVector10.w != 0) break;
            workingVector10.w = (int)-workingVector7.w + (int)workingVector9.w;
            workingVector10.w = (int)workingVector10.w;
            workingVector14.y = 0.5 + workingVector10.w;
            workingVector10.w = workingVector8.w;
            workingVector11.y = 0;
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.y >= (int)workingVector6.w);
              if (workingVector10.z != 0) break;
              workingVector10.z = (int)-workingVector7.w + (int)workingVector10.y;
              workingVector10.z = (int)workingVector10.z;
              workingVector12.x = 0.5 + workingVector10.z;
              workingVector10.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector12.xy;
              workingVector10.zw = fragmentVectorConstants1[workingVector9.w+17].xx * workingVector10.zw;
              workingVector11.xy = workingVector9.xz * fragmentVectorConstants1[workingVector9.w+17].xx + workingVector10.zw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.y >= (int)workingVector6.w);
              if (workingVector11.w != 0) break;
              workingVector11.w = (int)-workingVector7.w + (int)workingVector11.y;
              workingVector11.w = (int)workingVector11.w;
              workingVector14.x = 0.5 + workingVector11.w;
              workingVector12.yz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector14.xy;
              workingVector12.yz = fragmentVectorConstants1[workingVector9.w+17].xx * workingVector12.yz;
              workingVector13.xy = workingVector11.xz * fragmentVectorConstants1[workingVector9.w+17].xx + workingVector12.yz;
#endif
              if (workingVector5.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector10.z = materialTexture6.SampleLevel(textureSampler6, workingVector11.xyz, 0).x;
                workingVector10.z = RD_COMPARISON_MASK(workingVector10.z >= workingVector3.w);
                workingVector10.z = workingVector10.z ? 1.000000 : 0;
                workingVector9.w = workingVector10.z + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector11.w = materialTexture6.SampleLevel(textureSampler6, workingVector13.xyz, 0).x;
                workingVector11.w = RD_COMPARISON_MASK(workingVector11.w >= workingVector3.w);
                workingVector11.w = workingVector11.w ? 1.000000 : 0;
                workingVector10.w = workingVector11.w + workingVector10.w;
#endif
              } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector13.xyzw = materialTexture6.Gather(textureSampler6, workingVector11.xyz).xyzw;
                workingVector10.zw = workingVector11.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector10.zw = frac(workingVector10.zw);
                workingVector13.xyzw = RD_COMPARISON_MASK(workingVector13.xyzw >= workingVector3.wwww);
                workingVector14.xyzw = workingVector13.xyzw ? float4(1,1,1,1) : 0;
                workingVector11.xy = workingVector13.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector11.xy = workingVector14.zy + workingVector11.xy;
                workingVector11.xy = workingVector10.zz * workingVector11.xy + workingVector14.wx;
                workingVector10.z = workingVector11.y + -workingVector11.x;
                workingVector10.z = workingVector10.w * workingVector10.z + workingVector11.x;
                workingVector9.w = workingVector10.z + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector15.xyzw = materialTexture6.Gather(textureSampler6, workingVector13.xyz).xyzw;
                workingVector12.yz = workingVector13.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector12.yz = frac(workingVector12.yz);
                workingVector15.xyzw = RD_COMPARISON_MASK(workingVector15.xyzw >= workingVector3.wwww);
                workingVector16.xyzw = workingVector15.xyzw ? float4(1,1,1,1) : 0;
                workingVector13.xy = workingVector15.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector13.xy = workingVector16.zy + workingVector13.xy;
                workingVector12.yw = workingVector12.yy * workingVector13.xy + workingVector16.wx;
                workingVector11.w = workingVector12.w + -workingVector12.y;
                workingVector11.w = workingVector12.z * workingVector11.w + workingVector12.y;
                workingVector10.w = workingVector11.w + workingVector10.w;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector10.y = (int)workingVector10.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.y = (int)workingVector11.y + 1;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector8.w = workingVector9.w;
            workingVector9.y = (int)workingVector9.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector8.w = workingVector10.w;
            workingVector9.w = (int)workingVector9.w + 1;
#endif
          }
          workingVector3.w = (int)workingVector6.w * (int)workingVector6.w;
          workingVector3.w = (int)workingVector3.w;
          workingVector3.w = workingVector8.w / workingVector3.w;
          workingVector5.w = RD_COMPARISON_MASK(workingVector3.w < 1);
          workingVector6.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector3.w = max(workingVector6.w, workingVector3.w);
          workingVector3.w = min(1, workingVector3.w);
          workingVector3.w = workingVector5.w ? workingVector3.w : 1;
        } else {
          workingVector3.w = 1;
        }
        workingVector3.w = min(workingVector4.w, workingVector3.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector3.w = min(workingVector10.x, workingVector3.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector3.w = min(workingVector12.x, workingVector3.w);
#endif
        workingVector4.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector4.w = min(8, workingVector4.w);
        workingVector4.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector4.w;
        workingVector4.w = max(0, workingVector4.w);
        workingVector5.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector4.w;
        workingVector4.w = -workingVector4.w + -workingVector0.z;
        workingVector5.w = 1 / workingVector5.w;
        workingVector4.w = saturate(workingVector5.w * workingVector4.w);
        workingVector5.w = workingVector4.w * -2 + 3;
        workingVector4.w = workingVector4.w * workingVector4.w;
        workingVector4.w = workingVector5.w * workingVector4.w;
        workingVector5.w = 1 + -workingVector3.w;
        workingVector3.w = workingVector4.w * workingVector5.w + workingVector3.w;
      } else {
        workingVector3.w = 1;
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector9.xyz;
      workingVector4.w = dot(workingVector9.xyz, workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector11.xyz;
      workingVector4.w = dot(workingVector11.xyz, workingVector11.xyz);
#endif
      workingVector4.w = rsqrt(workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.xyz = workingVector9.xyz * workingVector4.www;
      workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector11.xyz = workingVector11.xyz * workingVector1.www;
      workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector11.xyz;
      workingVector1.w = dot(workingVector4.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector12.xyz = workingVector11.xyz * workingVector4.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector13.xyz = workingVector13.xyz * workingVector1.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector13.xyz;
      workingVector1.w = dot(workingVector4.xyz, workingVector12.xyz);
#endif
      workingVector1.w = max(0, workingVector1.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector5.w = dot(workingVector4.xyz, -workingVector8.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = dot(workingVector4.xyz, -workingVector9.xyz);
#endif
      workingVector5.w = max(0, workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.xyz = workingVector9.xyz * workingVector4.www + -workingVector8.xyz;
      workingVector4.w = dot(workingVector9.xyz, workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = workingVector11.xyz * workingVector4.www + -workingVector9.xyz;
      workingVector4.w = dot(workingVector11.xyz, workingVector11.xyz);
#endif
      workingVector4.w = rsqrt(workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.xyz = workingVector9.xyz * workingVector4.www;
      workingVector4.w = dot(workingVector4.xyz, workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = workingVector11.xyz * workingVector4.www;
      workingVector4.w = dot(workingVector4.xyz, workingVector11.xyz);
#endif
      workingVector4.w = max(0, workingVector4.w);
      workingVector4.w = workingVector4.w * workingVector4.w;
      workingVector4.w = workingVector4.w * -0.9375 + 1;
      workingVector4.w = workingVector4.w * workingVector4.w;
      workingVector4.w = 3.14159274 * workingVector4.w;
      workingVector4.w = 0.0625 / workingVector4.w;
      workingVector6.w = workingVector5.w * 0.875 + 0.125100002;
      workingVector6.w = workingVector5.w / workingVector6.w;
      workingVector7.w = workingVector1.w * 0.875 + 0.125100002;
      workingVector7.w = workingVector1.w / workingVector7.w;
      workingVector6.w = workingVector7.w * workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector7.w = dot(-workingVector8.xyz, workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.w = dot(-workingVector9.xyz, workingVector11.xyz);
#endif
      workingVector7.w = max(0, workingVector7.w);
      workingVector7.w = 1 + -workingVector7.w;
      workingVector7.w = max(0, workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector8.x = workingVector7.w * workingVector7.w;
      workingVector8.x = workingVector8.x * workingVector8.x;
      workingVector7.w = workingVector8.x * workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.w = workingVector7.w * workingVector7.w;
      workingVector8.w = workingVector8.w * workingVector8.w;
      workingVector7.w = workingVector8.w * workingVector7.w;
#endif
      workingVector7.w = workingVector7.w * 0.959999979 + 0.0399999991;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector8.x = 1 + -workingVector7.w;
      workingVector8.x = workingVector8.x * workingVector1.w;
      workingVector8.xyz = workingVector8.xxx * workingVector7.xyz;
      workingVector8.xyz = workingVector8.xyz * workingVector3.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.w = 1 + -workingVector7.w;
      workingVector8.w = workingVector8.w * workingVector1.w;
      workingVector11.xyz = workingVector8.xyz * workingVector8.www;
      workingVector11.xyz = workingVector11.xyz * workingVector3.www;
#endif
      workingVector4.w = workingVector7.w * workingVector4.w;
      workingVector4.w = workingVector4.w * workingVector6.w;
      workingVector5.w = workingVector5.w * workingVector1.w;
      workingVector5.w = workingVector5.w * 4 + 9.99999975e-005;
      workingVector4.w = workingVector4.w / workingVector5.w;
      workingVector1.w = workingVector4.w * workingVector1.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector8.xyz = workingVector8.xyz * workingVector11.xyz;
      workingVector8.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector8.xyz;
      workingVector8.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = workingVector11.xyz * workingVector13.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector11.xyz;
      workingVector11.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector11.xyz;
#endif
      workingVector1.w = workingVector1.w * workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.xyz = workingVector1.www * workingVector11.xyz;
      workingVector9.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector12.xyz = workingVector1.www * workingVector13.xyz;
      workingVector12.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector12.xyz;
#endif
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector8.xyz = float3(0,0,0);
      workingVector9.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.xyz = float3(0,0,0);
      workingVector12.xyz = float3(0,0,0);
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
    if (workingVector1.w != 0) {
      workingVector3.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector0.z;
      workingVector4.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector3.w;
      workingVector5.w = workingVector3.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector0.x;
      workingVector4.w = workingVector4.w + workingVector4.w;
      workingVector4.w = saturate(workingVector5.w / workingVector4.w);
      workingVector5.w = -workingVector0.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector0.y;
      workingVector3.w = workingVector3.w + workingVector3.w;
      workingVector3.w = saturate(workingVector5.w / workingVector3.w);
      workingVector13.xy = RD_COMPARISON_MASK(-workingVector0.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
      workingVector5.w = log2(-workingVector0.z);
      workingVector5.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector5.w;
      workingVector5.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector5.w);
      workingVector14.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
      workingVector5.w = workingVector14.x * workingVector5.w;
      workingVector5.w = floor(workingVector5.w);
      workingVector5.w = 2 + workingVector5.w;
      workingVector5.w = min(workingVector5.w, workingVector14.y);
      workingVector5.w = workingVector13.y ? 1 : workingVector5.w;
      workingVector5.w = workingVector13.x ? 0 : workingVector5.w;
      workingVector4.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector4.w;
      workingVector4.w = floor(workingVector4.w);
      workingVector4.w = min(workingVector4.w, workingVector14.z);
      workingVector3.w = RD_UNIFORM_CLUSTER_DIMENSIONS.y * workingVector3.w;
      workingVector3.w = floor(workingVector3.w);
      workingVector3.w = min(workingVector3.w, workingVector14.w);
      workingVector6.w = RD_COMPARISON_MASK(workingVector4.w < 0);
      workingVector7.w = RD_COMPARISON_MASK(workingVector3.w < 0);
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      workingVector7.w = RD_COMPARISON_MASK(workingVector5.w < 0);
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      workingVector7.w = RD_COMPARISON_MASK(workingVector4.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      workingVector7.w = RD_COMPARISON_MASK(workingVector3.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      workingVector7.w = RD_COMPARISON_MASK(workingVector5.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      if (workingVector6.w == 0) {
        workingVector3.w = workingVector3.w * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector4.w;
        workingVector4.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector5.w;
        workingVector3.w = workingVector4.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector3.w;
        workingVector3.w = (int)workingVector3.w;
        workingVector4.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
        workingVector5.w = (int)workingVector3.w * (int)workingVector4.w;
        workingVector3.w = mad((int)workingVector3.w, (int)workingVector4.w, (int)workingVector4.w);
        workingVector4.w = dot(workingVector4.xyz, -workingVector9.xyz);
        workingVector4.w = max(0, workingVector4.w);
        workingVector6.w = workingVector4.w * 0.875 + 0.125100002;
        workingVector6.w = workingVector4.w / workingVector6.w;
        workingVector13.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector8.xyz;
        workingVector7.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
        workingVector8.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
        workingVector9.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
        workingVector10.w = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
        workingVector14.xy = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
        workingVector10.w = 1 / workingVector10.w;
        workingVector15.xyz = float3(0,0,0);
        workingVector16.xyz = float3(0,0,0);
        workingVector11.w = workingVector5.w;
        while (true) {
          workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector3.w);
          if (workingVector12.w != 0) break;
          workingVector12.w = sampledResource10[workingVector11.w].val[0/4];
          workingVector12.w = (int)workingVector12.w;
          workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w < 0);
          if (workingVector13.w != 0) {
            break;
          }
          workingVector17.x = sampledResource11[workingVector12.w].val[0/4];
          workingVector17.y = sampledResource11[workingVector12.w].val[0/4+1];
          workingVector17.z = sampledResource11[workingVector12.w].val[0/4+2];
          workingVector18.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector17.yyy;
          workingVector18.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector17.xxx + workingVector18.xyz;
          workingVector18.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector17.zzz + workingVector18.xyz;
          workingVector18.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector18.xyz;
          workingVector18.xyz = workingVector18.xyz + workingVector7.xyz;
          workingVector13.w = dot(workingVector18.xyz, workingVector18.xyz);
          workingVector13.w = rsqrt(workingVector13.w);
          workingVector19.xyz = workingVector18.xyz * workingVector13.www;
          workingVector14.z = dot(workingVector4.xyz, workingVector19.xyz);
          workingVector14.z = max(0, workingVector14.z);
          workingVector18.xyz = workingVector18.xyz * workingVector13.www + -workingVector9.xyz;
          workingVector13.w = dot(workingVector18.xyz, workingVector18.xyz);
          workingVector13.w = rsqrt(workingVector13.w);
          workingVector18.xyz = workingVector18.xyz * workingVector13.www;
          workingVector13.w = dot(workingVector4.xyz, workingVector18.xyz);
          workingVector13.w = max(0, workingVector13.w);
          workingVector13.w = workingVector13.w * workingVector13.w;
          workingVector13.w = workingVector13.w * -0.9375 + 1;
          workingVector13.w = workingVector13.w * workingVector13.w;
          workingVector13.w = 3.14159274 * workingVector13.w;
          workingVector13.w = 0.0625 / workingVector13.w;
          workingVector14.w = workingVector14.z * 0.875 + 0.125100002;
          workingVector14.w = workingVector14.z / workingVector14.w;
          workingVector14.w = workingVector14.w * workingVector6.w;
          workingVector15.w = dot(-workingVector9.xyz, workingVector18.xyz);
          workingVector15.w = max(0, workingVector15.w);
          workingVector15.w = 1 + -workingVector15.w;
          workingVector15.w = max(0, workingVector15.w);
          workingVector16.w = workingVector15.w * workingVector15.w;
          workingVector16.w = workingVector16.w * workingVector16.w;
          workingVector15.w = workingVector16.w * workingVector15.w;
          workingVector15.w = workingVector15.w * 0.959999979 + 0.0399999991;
          workingVector16.w = 1 + -workingVector15.w;
          workingVector16.w = workingVector16.w * workingVector14.z;
          workingVector18.xyz = workingVector16.www * workingVector13.xyz;
          workingVector13.w = workingVector15.w * workingVector13.w;
          workingVector13.w = workingVector13.w * workingVector14.w;
          workingVector14.w = workingVector14.z * workingVector4.w;
          workingVector14.w = workingVector14.w * 4 + 9.99999975e-005;
          workingVector13.w = workingVector13.w / workingVector14.w;
          workingVector13.w = workingVector14.z * workingVector13.w;
          workingVector14.z = RD_COMPARISON_MASK((int)workingVector12.w >= 0);
          if (workingVector14.z != 0) {
            workingVector19.x = sampledResource11[workingVector12.w].val[0/4];
            workingVector19.y = sampledResource11[workingVector12.w].val[0/4+1];
            workingVector19.z = sampledResource11[workingVector12.w].val[0/4+2];
            workingVector19.w = sampledResource11[workingVector12.w].val[0/4+3];
            workingVector19.xyz = -varyingTexCoord3.xyz + workingVector19.xyz;
            workingVector14.z = abs(workingVector19.x) + abs(workingVector19.y);
            workingVector14.z = workingVector14.z + abs(workingVector19.z);
            workingVector14.z = workingVector14.z * workingVector14.z;
            workingVector14.w = dot(workingVector19.xyz, workingVector19.xyz);
            workingVector14.z = workingVector7.w ? workingVector14.z : workingVector14.w;
            workingVector14.w = workingVector19.w * workingVector19.w;
            workingVector14.w = RD_COMPARISON_MASK(workingVector14.z < workingVector14.w);
            if (workingVector14.w != 0) {
              if (workingVector8.w != 0) {
                workingVector20.x = sampledResource11[workingVector12.w].val[32/4];
                workingVector20.y = sampledResource11[workingVector12.w].val[32/4+1];
                workingVector20.z = sampledResource11[workingVector12.w].val[32/4+2];
                workingVector20.w = sampledResource11[workingVector12.w].val[32/4+3];
                workingVector21.x = sampledResource11[workingVector12.w].val[48/4];
                workingVector21.y = sampledResource11[workingVector12.w].val[48/4+1];
                workingVector21.z = sampledResource11[workingVector12.w].val[48/4+2];
                workingVector21.w = sampledResource11[workingVector12.w].val[48/4+3];
                workingVector22.x = sampledResource11[workingVector12.w].val[64/4];
                workingVector22.y = sampledResource11[workingVector12.w].val[64/4+1];
                workingVector22.z = sampledResource11[workingVector12.w].val[64/4+2];
                workingVector22.w = sampledResource11[workingVector12.w].val[64/4+3];
                workingVector23.x = sampledResource11[workingVector12.w].val[80/4];
                workingVector23.y = sampledResource11[workingVector12.w].val[80/4+1];
                workingVector23.z = sampledResource11[workingVector12.w].val[80/4+2];
                workingVector23.w = sampledResource11[workingVector12.w].val[80/4+3];
                workingVector24.x = sampledResource11[workingVector12.w].val[96/4];
                workingVector24.y = sampledResource11[workingVector12.w].val[96/4+1];
                workingVector24.z = sampledResource11[workingVector12.w].val[96/4+2];
                workingVector24.w = sampledResource11[workingVector12.w].val[96/4+3];
                workingVector25.x = sampledResource11[workingVector12.w].val[112/4];
                workingVector25.y = sampledResource11[workingVector12.w].val[112/4+1];
                workingVector25.z = sampledResource11[workingVector12.w].val[112/4+2];
                workingVector25.w = sampledResource11[workingVector12.w].val[112/4+3];
                workingVector17.xyz = -workingVector17.xyz + workingVector10.xyz;
                workingVector19.xyz = RD_COMPARISON_MASK(abs(workingVector17.xxy) >= abs(workingVector17.yzz));
                workingVector14.w = workingVector19.y ? workingVector19.x : 0;
                workingVector26.xyz = RD_COMPARISON_MASK(workingVector17.xyz >= float3(0,0,0));
                workingVector26.xyz = workingVector26.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                workingVector15.w = workingVector19.z ? workingVector26.y : workingVector26.z;
                workingVector14.w = workingVector14.w ? workingVector26.x : workingVector15.w;
                workingVector26.xyzw = RD_COMPARISON_MASK((int4)workingVector14.wwww == int4(1,2,3,4));
                workingVector14.w = RD_COMPARISON_MASK((int)workingVector14.w == 5);
                workingVector20.xyzw = workingVector14.wwww ? workingVector25.xyzw : workingVector20.xyzw;
                workingVector20.xyzw = workingVector26.wwww ? workingVector24.xyzw : workingVector20.xyzw;
                workingVector20.xyzw = workingVector26.zzzz ? workingVector23.xyzw : workingVector20.xyzw;
                workingVector20.xyzw = workingVector26.yyyy ? workingVector22.xyzw : workingVector20.xyzw;
                workingVector19.xy = workingVector26.xx ? workingVector21.zw : workingVector20.zw;
                workingVector20.zw = RD_COMPARISON_MASK(workingVector19.xy == float2(0,0));
                workingVector15.w = workingVector20.w ? workingVector20.z : 0;
                if (workingVector15.w == 0) {
                  workingVector17.w = -workingVector17.x;
                  workingVector20.zw = workingVector14.ww ? workingVector17.xz : workingVector17.zw;
                  workingVector22.xz = workingVector26.ww ? -workingVector17.xz : workingVector20.zw;
                  workingVector23.xyz = float3(-1,1,1) * workingVector17.xzy;
                  workingVector22.y = workingVector23.z;
                  workingVector22.xyz = workingVector26.zzz ? workingVector23.xyz : workingVector22.xyz;
                  workingVector22.xyz = workingVector26.yyy ? -workingVector17.xzy : workingVector22.xyz;
                  workingVector20.xy = workingVector26.xx ? workingVector21.xy : workingVector20.xy;
                  workingVector21.xyz = float3(-1,1,1) * workingVector17.zyx;
                  workingVector21.xyz = workingVector26.xxx ? workingVector21.xyz : workingVector22.xyz;
                  workingVector22.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector21.yyyy;
                  workingVector22.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector21.xxxx + workingVector22.xyzw;
                  workingVector21.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector21.zzzz + workingVector22.xyzw;
                  workingVector21.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector21.xyzw;
                  workingVector14.w = dot(-workingVector17.xyz, -workingVector17.xyz);
                  workingVector14.w = rsqrt(workingVector14.w);
                  workingVector17.xyz = -workingVector17.xyz * workingVector14.www;
                  workingVector14.w = dot(workingVector17.xyz, workingVector3.xyz);
                  workingVector14.w = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector14.w);
                  workingVector14.w = min(1, workingVector14.w);
                  workingVector15.w = -workingVector14.w * workingVector14.w + 1;
                  workingVector15.w = sqrt(workingVector15.w);
                  workingVector14.w = workingVector15.w / workingVector14.w;
                  workingVector14.w = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector14.w + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                  workingVector17.xyz = -workingVector20.xxy + workingVector19.xxy;
                  workingVector22.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector17.xyz;
                  workingVector15.w = max(1, workingVector22.x);
                  workingVector15.w = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector15.w;
                  workingVector21.z = -workingVector14.w * workingVector15.w + workingVector21.z;
                  workingVector21.xyz = workingVector21.xyz / workingVector21.www;
                  workingVector23.xy = workingVector21.xy * float2(0.5,0.5) + float2(0.5,0.5);
                  workingVector17.xw = workingVector20.xy + workingVector14.xy;
                  workingVector19.xy = workingVector19.xy + -workingVector14.xy;
                  workingVector23.z = 1 + -workingVector23.y;
                  workingVector20.zw = workingVector23.xz * workingVector22.yz;
                  workingVector20.zw = floor(workingVector20.zw);
                  workingVector20.zw = float2(0.5,0.5) + workingVector20.zw;
                  workingVector20.zw = workingVector20.zw / workingVector22.yz;
                  workingVector17.yz = workingVector20.zw * workingVector17.yz + workingVector20.xy;
                  workingVector17.xy = max(workingVector17.yz, workingVector17.xw);
                  workingVector17.xy = min(workingVector17.xy, workingVector19.xy);
                  workingVector14.w = materialTexture2.SampleLevel(textureSampler2, workingVector17.xy, 0).x;
                  workingVector14.w = RD_COMPARISON_MASK(workingVector14.w >= workingVector21.z);
                  workingVector14.w = workingVector14.w ? 1.000000 : 0;
                } else {
                  workingVector14.w = 0;
                }
              } else {
                workingVector14.w = 1;
              }
              workingVector15.w = max(0.100000001, workingVector14.z);
              workingVector15.w = 1 / workingVector15.w;
              workingVector16.w = workingVector19.w * workingVector19.w + 9.99999975e-005;
              workingVector14.z = workingVector14.z / workingVector16.w;
              workingVector14.z = -workingVector14.z * workingVector14.z + 1;
              workingVector14.z = max(0, workingVector14.z);
              workingVector14.z = workingVector14.z * workingVector14.z;
              workingVector16.w = workingVector15.w * workingVector14.z;
              workingVector14.z = -workingVector15.w * workingVector14.z + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
              workingVector14.z = 1 + workingVector14.z;
              workingVector14.z = saturate(workingVector14.z * workingVector10.w);
              workingVector15.w = workingVector14.z * -2 + 3;
              workingVector14.z = workingVector14.z * workingVector14.z;
              workingVector14.z = workingVector15.w * workingVector14.z;
              workingVector14.z = saturate(workingVector14.z * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
              workingVector14.z = workingVector16.w * workingVector14.z;
              workingVector14.z = workingVector9.w ? workingVector14.z : workingVector16.w;
              workingVector17.x = sampledResource11[workingVector12.w].val[16/4];
              workingVector17.y = sampledResource11[workingVector12.w].val[16/4+1];
              workingVector17.z = sampledResource11[workingVector12.w].val[16/4+2];
              workingVector17.w = sampledResource11[workingVector12.w].val[16/4+3];
              workingVector17.xyz = workingVector17.xyz * workingVector17.www;
              workingVector17.xyz = workingVector17.xyz * workingVector14.zzz;
            } else {
              workingVector17.xyz = float3(0,0,0);
              workingVector14.w = 1;
            }
          } else {
            workingVector17.xyz = float3(0,0,0);
            workingVector14.w = 1;
          }
          workingVector18.xyz = workingVector18.xyz * workingVector14.www;
          workingVector18.xyz = workingVector18.xyz * workingVector17.xyz;
          workingVector15.xyz = workingVector18.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector15.xyz;
          workingVector12.w = workingVector14.w * workingVector13.w;
          workingVector17.xyz = workingVector12.www * workingVector17.xyz;
          workingVector16.xyz = workingVector17.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector16.xyz;
          workingVector11.w = (int)workingVector11.w + 1;
        }
      } else {
        workingVector15.xyz = float3(0,0,0);
        workingVector16.xyz = float3(0,0,0);
      }
      workingVector3.w = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
      workingVector11.xyz = workingVector3.www * workingVector15.xyz + workingVector11.xyz;
      workingVector12.xyz = workingVector3.www * workingVector16.xyz + workingVector12.xyz;
    }
    workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    workingVector1.w = workingVector1.w ? workingVector3.w : 0;
#endif
    if (workingVector1.w != 0) {
      workingVector5.xyz = float3(-0.5,-0.5,-0.5) + workingVector5.xyz;
      workingVector5.xyz = workingVector3.xyz * float3(0.200000003,0.200000003,0.200000003) + workingVector5.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.xyz = floor(workingVector5.xyz);
      workingVector10.xyz = float3(0.0625,0.0625,0.0625) * workingVector10.xyz;
      workingVector10.xyz = floor(workingVector10.xyz);
      workingVector10.xyz = (int3)workingVector10.xyz;
      bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector1.w = (((uint)workingVector10.y << 16) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
      workingVector3.w = (int)workingVector10.z & 0x0000ffff;
      workingVector10.xyz = (int3)workingVector10.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector11.xyz = (uint3)workingVector10.xyz >> int3(24,24,24);
      workingVector10.xyz = (int3)workingVector10.xyz ^ (int3)workingVector11.xyz;
      workingVector10.xyz = (int3)workingVector10.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector4.w = (int)workingVector10.x ^ 0x88b16480;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.xyz = floor(workingVector5.xyz);
      workingVector7.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
      workingVector7.xyz = floor(workingVector7.xyz);
      workingVector7.xyz = (int3)workingVector7.xyz;
      bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector1.w = (((uint)workingVector7.y << 16) & bitMask.w) | ((uint)workingVector7.x & ~bitMask.w);
      bitMask.w = ((~(-1 << 16)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector7.z << 0) & bitMask.w) | ((uint)0x00020000 & ~bitMask.w);
      workingVector7.xyz = (int3)workingVector7.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector9.xyz = (uint3)workingVector7.xyz >> int3(24,24,24);
      workingVector7.xyz = (int3)workingVector7.xyz ^ (int3)workingVector9.xyz;
      workingVector7.xyz = (int3)workingVector7.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector4.w = (int)workingVector7.x ^ 0x88b16480;
#endif
      workingVector4.w = (int)workingVector4.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.w = (int)workingVector10.y ^ (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector4.w = (int)workingVector7.y ^ (int)workingVector4.w;
#endif
      workingVector4.w = (int)workingVector4.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.w = (int)workingVector10.z ^ (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector4.w = (int)workingVector7.z ^ (int)workingVector4.w;
#endif
      workingVector4.w = (int)workingVector4.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.w = (int)workingVector4.w ^ 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector4.w = (int)workingVector4.w ^ 0x90210f61;
#endif
      workingVector5.w = (uint)workingVector4.w >> 13;
      workingVector4.w = (int)workingVector4.w ^ (int)workingVector5.w;
      workingVector4.w = (int)workingVector4.w * 0x5bd1e995;
      workingVector5.w = (uint)workingVector4.w >> 15;
      workingVector4.w = (int)workingVector4.w ^ (int)workingVector5.w;
      workingVector5.w = (uint)workingVector4.w >> 16;
      workingVector4.w = (int)workingVector4.w ^ (int)workingVector5.w;
      workingVector4.w = (int)workingVector4.w & 0x0000ffff;
      workingVector5.w = workingVector4.w ? 0 : 1;
      workingVector4.w = (int)workingVector4.w | (int)workingVector5.w;
      workingVector5.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
      workingVector5.w = (int)workingVector5.w + -1;
      workingVector6.w = (int)workingVector4.w & (int)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.x = workingVector6.w;
      workingVector10.yzw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.x = workingVector6.w;
      workingVector7.yzw = float3(0,0,0);
#endif
      while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector7.w = RD_COMPARISON_MASK((int)workingVector10.y >= 8);
        if (workingVector7.w != 0) break;
        workingVector11.x = sampledResource8[workingVector10.x].val[0/4];
        workingVector11.y = sampledResource8[workingVector10.x].val[0/4+1];
        workingVector11.z = sampledResource8[workingVector10.x].val[0/4+2];
        workingVector11.w = sampledResource8[workingVector10.x].val[0/4+3];
        workingVector7.w = (int)workingVector11.z & 0x0000ffff;
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
        workingVector7.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector7.w);
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector11.x);
        workingVector7.w = workingVector7.w ? workingVector9.w : 0;
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector3.w == (int)workingVector11.y);
        workingVector7.w = workingVector7.w ? workingVector9.w : 0;
        workingVector9.w = workingVector7.w ? workingVector11.w : workingVector10.z;
        workingVector11.x = workingVector10.w ? workingVector10.z : workingVector9.w;
        workingVector11.y = (int)workingVector7.w | (int)workingVector10.w;
        workingVector7.w = (int)workingVector10.x + 1;
        workingVector10.x = (int)workingVector5.w & (int)workingVector7.w;
        workingVector7.w = (int)workingVector8.w | (int)workingVector11.y;
        if (workingVector7.w != 0) {
          workingVector10.zw = workingVector11.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.y >= 8);
        if (workingVector8.w != 0) break;
        workingVector9.x = sampledResource8[workingVector7.x].val[0/4];
        workingVector9.y = sampledResource8[workingVector7.x].val[0/4+1];
        workingVector9.z = sampledResource8[workingVector7.x].val[0/4+2];
        workingVector9.w = sampledResource8[workingVector7.x].val[0/4+3];
        workingVector8.w = (int)workingVector9.z & 0x0000ffff;
        workingVector9.z = RD_COMPARISON_MASK((int)workingVector8.w == 0);
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector8.w);
        workingVector9.x = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector9.x);
        workingVector8.w = workingVector8.w ? workingVector9.x : 0;
        workingVector9.x = RD_COMPARISON_MASK((int)workingVector3.w == (int)workingVector9.y);
        workingVector8.w = workingVector8.w ? workingVector9.x : 0;
        workingVector9.x = workingVector8.w ? workingVector9.w : workingVector7.z;
        workingVector9.x = workingVector7.w ? workingVector7.z : workingVector9.x;
        workingVector9.y = (int)workingVector7.w | (int)workingVector8.w;
        workingVector8.w = (int)workingVector7.x + 1;
        workingVector7.x = (int)workingVector5.w & (int)workingVector8.w;
        workingVector8.w = (int)workingVector9.z | (int)workingVector9.y;
        if (workingVector8.w != 0) {
          workingVector7.zw = workingVector9.xy;
#endif
          break;
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.y = (int)workingVector10.y + 1;
        workingVector10.zw = workingVector11.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector7.y = (int)workingVector7.y + 1;
        workingVector7.zw = workingVector9.xy;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      if (workingVector10.w != 0) {
        workingVector10.xyw = float3(0.0625,0.0625,0.0625) * workingVector5.xyz;
        workingVector10.xyw = floor(workingVector10.xyw);
        workingVector5.xyz = -workingVector10.xyw * float3(16,16,16) + workingVector5.xyz;
        workingVector1.w = (uint)workingVector10.z >> 2;
        workingVector11.xyz = RD_COMPARISON_MASK(abs(workingVector3.xyz) >= float3(1,1,1));
        workingVector3.w = (int)workingVector11.y | (int)workingVector11.x;
        workingVector3.w = (int)workingVector11.z | (int)workingVector3.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      if (workingVector7.w != 0) {
        workingVector7.xyw = float3(0.0625,0.0625,0.0625) * workingVector5.xyz;
        workingVector7.xyw = floor(workingVector7.xyw);
        workingVector5.xyz = -workingVector7.xyw * float3(16,16,16) + workingVector5.xyz;
        workingVector1.w = (uint)workingVector7.z >> 2;
        workingVector9.xyz = RD_COMPARISON_MASK(abs(workingVector3.xyz) >= float3(1,1,1));
        workingVector3.w = (int)workingVector9.y | (int)workingVector9.x;
        workingVector3.w = (int)workingVector9.z | (int)workingVector3.w;
#endif
        if (workingVector3.w != 0) {
          workingVector3.w = dot(workingVector5.xyz, abs(workingVector3.xyz));
          workingVector4.w = dot(workingVector5.yzx, abs(workingVector3.xyz));
          workingVector5.w = dot(workingVector5.zxy, abs(workingVector3.xyz));
          workingVector6.w = workingVector3.x + workingVector3.y;
          workingVector0.w = varyingNormal0.z * workingVector0.w + workingVector6.w;
          workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
          workingVector6.w = ceil(workingVector3.w);
          workingVector3.w = floor(workingVector3.w);
          workingVector0.w = workingVector0.w ? workingVector6.w : workingVector3.w;
          workingVector3.w = floor(workingVector4.w);
          workingVector6.w = floor(workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = abs(workingVector3.zxy) * workingVector3.www;
          workingVector11.xyz = abs(workingVector3.xyz) * workingVector0.www + workingVector11.xyz;
          workingVector11.xyz = abs(workingVector3.yzx) * workingVector6.www + workingVector11.xyz;
          workingVector12.xyz = workingVector11.xyz + abs(workingVector3.zxy);
          workingVector13.xyz = workingVector11.xyz + abs(workingVector3.yzx);
          workingVector14.xyz = workingVector12.xyz + abs(workingVector3.yzx);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.xyz = abs(workingVector3.zxy) * workingVector3.www;
          workingVector9.xyz = abs(workingVector3.xyz) * workingVector0.www + workingVector9.xyz;
          workingVector9.xyz = abs(workingVector3.yzx) * workingVector6.www + workingVector9.xyz;
          workingVector10.xyz = workingVector9.xyz + abs(workingVector3.zxy);
          workingVector13.xyz = workingVector9.xyz + abs(workingVector3.yzx);
          workingVector14.xyz = workingVector10.xyz + abs(workingVector3.yzx);
#endif
          workingVector0.w = workingVector4.w + -workingVector3.w;
          workingVector3.w = -workingVector6.w + workingVector5.w;
          workingVector4.w = 1 + -workingVector0.w;
          workingVector5.w = 1 + -workingVector3.w;
          workingVector6.w = workingVector5.w * workingVector4.w;
          workingVector5.w = workingVector5.w * workingVector0.w;
          workingVector4.w = workingVector4.w * workingVector3.w;
          workingVector0.w = workingVector3.w * workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector9.xyz >= float3(0,0,0));
#endif
          workingVector3.w = workingVector15.y ? workingVector15.x : 0;
          workingVector3.w = workingVector15.z ? workingVector3.w : 0;
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(16,16,16));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector7.w = workingVector15.y ? workingVector15.x : 0;
          workingVector7.w = workingVector15.z ? workingVector7.w : 0;
          workingVector3.w = (int)workingVector3.w & (int)workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector7.z = workingVector15.y ? workingVector15.x : 0;
          workingVector7.z = workingVector15.z ? workingVector7.z : 0;
          workingVector3.w = (int)workingVector3.w & (int)workingVector7.z;
#endif
          if (workingVector3.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = (uint3)workingVector11.xyz;
            workingVector16.xyz = (uint3)workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector15.xyz = (uint3)workingVector9.xyz;
            workingVector16.xyz = (uint3)workingVector10.xyz;
#endif
            workingVector17.xyz = (uint3)workingVector13.xyz;
            workingVector18.xyz = (uint3)workingVector14.xyz;
            workingVector15.xz = (uint2)workingVector15.zx << int2(4,8);
            workingVector3.w = (int)workingVector15.x + (int)workingVector15.y;
            workingVector3.w = (int)workingVector15.z + (int)workingVector3.w;
            workingVector3.w = (int)workingVector1.w + (int)workingVector3.w;
            workingVector15.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector15.yzw = workingVector19.xyz * workingVector19.www;
            workingVector15.yzw = float3(6,6,6) * workingVector15.yzw;
            workingVector15.xyz = workingVector15.xxx ? workingVector15.yzw : float3(0,0,0);
            workingVector16.xz = (uint2)workingVector16.zx << int2(4,8);
            workingVector3.w = (int)workingVector16.x + (int)workingVector16.y;
            workingVector3.w = (int)workingVector16.z + (int)workingVector3.w;
            workingVector3.w = (int)workingVector1.w + (int)workingVector3.w;
            workingVector16.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector16.yzw = workingVector19.xyz * workingVector19.www;
            workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
            workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
            workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
            workingVector3.w = (int)workingVector17.x + (int)workingVector17.y;
            workingVector3.w = (int)workingVector17.z + (int)workingVector3.w;
            workingVector3.w = (int)workingVector1.w + (int)workingVector3.w;
            workingVector17.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector17.yzw = workingVector19.xyz * workingVector19.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector3.w = (int)workingVector18.x + (int)workingVector18.y;
            workingVector3.w = (int)workingVector18.z + (int)workingVector3.w;
            workingVector3.w = (int)workingVector1.w + (int)workingVector3.w;
            workingVector18.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector18.yzw = workingVector19.xyz * workingVector19.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
          } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector19.xyz = workingVector10.xyw * float3(16,16,16) + workingVector11.xyz;
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector11.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector19.xyz = workingVector7.xyw * float3(16,16,16) + workingVector9.xyz;
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector9.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector9.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector3.w = (int)workingVector3.w + (int)workingVector20.x;
            workingVector3.w = (int)workingVector21.y + (int)workingVector3.w;
            workingVector3.w = (int)workingVector20.y + (int)workingVector3.w;
            workingVector3.w = (int)workingVector21.z + (int)workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector11.xyz = (uint3)workingVector11.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
            workingVector8.w = (int)workingVector11.z + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector9.xyz = (uint3)workingVector9.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.z = (((uint)workingVector9.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector9.y << 0) & bitMask.w) | ((uint)workingVector9.x & ~bitMask.w);
            workingVector8.w = (int)workingVector9.z + (int)workingVector8.w;
#endif
            workingVector8.w = (int)workingVector1.w + (int)workingVector8.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xy = (int2)workingVector1.ww + int2(4096,4097);
            workingVector9.w = sampledResource9[workingVector11.x].val[0/4];
            workingVector10.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector10.z = (int)workingVector9.w & (int)workingVector10.z;
            workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
            workingVector3.w = (int)workingVector11.y + (int)icb[workingVector3.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.xy = (int2)workingVector1.ww + int2(4096,4097);
            workingVector9.x = sampledResource9[workingVector9.x].val[0/4];
            workingVector9.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector9.z = (int)workingVector9.z & (int)workingVector9.x;
            workingVector9.z = RD_COMPARISON_MASK((int)workingVector9.z == 0);
            workingVector3.w = (int)workingVector9.y + (int)icb[workingVector3.w+4].x;
#endif
            workingVector3.w = sampledResource9[workingVector3.w].val[0/4];
            workingVector3.w = (uint)workingVector3.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xzw = float3(0.0625,0.0625,0.0625) * workingVector19.xyz;
            workingVector11.xzw = floor(workingVector11.xzw);
            workingVector11.xzw = -workingVector11.xzw * float3(16,16,16) + workingVector19.xyz;
            workingVector11.xzw = (uint3)workingVector11.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.w + (int)workingVector11.x;
            workingVector3.w = (int)workingVector3.w + (int)workingVector11.x;
            workingVector3.w = workingVector7.w ? workingVector8.w : workingVector3.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector19.xyz;
            workingVector20.xyz = floor(workingVector20.xyz);
            workingVector19.xyz = -workingVector20.xyz * float3(16,16,16) + workingVector19.xyz;
            workingVector19.xyz = (uint3)workingVector19.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector19.z = (((uint)workingVector19.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector19.y << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
            workingVector9.w = (int)workingVector19.z + (int)workingVector9.w;
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.w;
            workingVector3.w = workingVector7.z ? workingVector8.w : workingVector3.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.z;
#endif
            workingVector19.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xzw = workingVector20.xyz * workingVector20.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector19.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector15.xyz = workingVector7.www ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector10.xyw * float3(16,16,16) + workingVector12.xyz;
            workingVector19.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector19.yzw = workingVector20.xyz * workingVector20.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector15.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector19.xyz;
            workingVector19.xyz = workingVector7.xyw * float3(16,16,16) + workingVector10.xyz;
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector10.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector9.z = (((uint)workingVector20.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector9.w = (((uint)workingVector20.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.z;
            workingVector3.w = (int)workingVector21.y + (int)workingVector3.w;
            workingVector3.w = (int)workingVector9.w + (int)workingVector3.w;
            workingVector3.w = (int)workingVector21.z + (int)workingVector3.w;
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector10.xyz = (uint3)workingVector10.xyz;
            bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.z = (((uint)workingVector10.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.w = (((uint)workingVector10.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector9.z & ~bitMask.w);
            workingVector8.w = (int)workingVector9.w + (int)workingVector8.w;
            workingVector8.w = (int)workingVector1.w + (int)workingVector8.w;
            workingVector9.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector9.z = (int)workingVector9.z & (int)workingVector9.x;
            workingVector9.z = RD_COMPARISON_MASK((int)workingVector9.z == 0);
            workingVector3.w = (int)workingVector9.y + (int)icb[workingVector3.w+4].x;
            workingVector3.w = sampledResource9[workingVector3.w].val[0/4];
            workingVector3.w = (uint)workingVector3.w >> 2;
            workingVector10.xyz = float3(0.0625,0.0625,0.0625) * workingVector19.xyz;
            workingVector10.xyz = floor(workingVector10.xyz);
            workingVector10.xyz = -workingVector10.xyz * float3(16,16,16) + workingVector19.xyz;
            workingVector10.xyz = (uint3)workingVector10.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector9.w = (int)workingVector10.z + (int)workingVector9.w;
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.w;
            workingVector3.w = workingVector7.z ? workingVector8.w : workingVector3.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.z;
            workingVector10.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector10.yzw = workingVector19.xyz * workingVector19.www;
            workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
            workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
            workingVector16.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector10.xyz;
            workingVector10.xyz = workingVector7.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector19.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector19.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector19.y = (((uint)workingVector19.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector3.w = (int)workingVector3.w + (int)workingVector19.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector9.z = (((uint)workingVector19.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector9.w = (((uint)workingVector19.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.z;
#endif
            workingVector3.w = (int)workingVector20.y + (int)workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector3.w = (int)workingVector19.y + (int)workingVector3.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector3.w = (int)workingVector9.w + (int)workingVector3.w;
#endif
            workingVector3.w = (int)workingVector20.z + (int)workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.z + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector9.z & ~bitMask.w);
            workingVector8.w = (int)workingVector9.w + (int)workingVector8.w;
#endif
            workingVector8.w = (int)workingVector1.w + (int)workingVector8.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector10.z = (int)workingVector9.w & (int)workingVector10.z;
            workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
            workingVector3.w = (int)workingVector11.y + (int)icb[workingVector3.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector9.z = (int)workingVector9.z & (int)workingVector9.x;
            workingVector9.z = RD_COMPARISON_MASK((int)workingVector9.z == 0);
            workingVector3.w = (int)workingVector9.y + (int)icb[workingVector3.w+4].x;
#endif
            workingVector3.w = sampledResource9[workingVector3.w].val[0/4];
            workingVector3.w = (uint)workingVector3.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector11.xzw = -workingVector12.xyz * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xzw = (uint3)workingVector11.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.w + (int)workingVector11.x;
            workingVector3.w = (int)workingVector3.w + (int)workingVector11.x;
            workingVector3.w = workingVector7.w ? workingVector8.w : workingVector3.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.z;
            workingVector12.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
            workingVector11.xzw = workingVector19.xyz * workingVector19.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector12.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector7.www ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector10.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector12.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector19.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector10.xyz;
            workingVector13.xyz = floor(workingVector13.xyz);
            workingVector10.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector10.xyz;
            workingVector10.xyz = (uint3)workingVector10.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector9.w = (int)workingVector10.z + (int)workingVector9.w;
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.w;
            workingVector3.w = workingVector7.z ? workingVector8.w : workingVector3.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.z;
            workingVector10.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
            workingVector13.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
            workingVector13.xyzw = (uint4)workingVector13.xyzw;
            workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
            workingVector10.yzw = workingVector13.xyz * workingVector13.www;
            workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
            workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
            workingVector17.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector10.xyz;
            workingVector10.xyz = workingVector7.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector13.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector19.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector19.y = (((uint)workingVector19.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector19.z = (((uint)workingVector19.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector12.y = (((uint)workingVector12.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector3.w = (int)workingVector3.w + (int)workingVector12.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.z;
#endif
            workingVector3.w = (int)workingVector19.y + (int)workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector3.w = (int)workingVector12.y + (int)workingVector3.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector3.w = (int)workingVector9.w + (int)workingVector3.w;
#endif
            workingVector3.w = (int)workingVector19.z + (int)workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.z + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector13.xyz = (uint3)workingVector14.xyz;
            bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector9.z & ~bitMask.w);
            workingVector8.w = (int)workingVector9.w + (int)workingVector8.w;
#endif
            workingVector8.w = (int)workingVector1.w + (int)workingVector8.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector10.z = (int)workingVector9.w & (int)workingVector10.z;
            workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
            workingVector3.w = (int)workingVector11.y + (int)icb[workingVector3.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector9.x = (int)workingVector9.z & (int)workingVector9.x;
            workingVector9.x = RD_COMPARISON_MASK((int)workingVector9.x == 0);
            workingVector3.w = (int)workingVector9.y + (int)icb[workingVector3.w+4].x;
#endif
            workingVector3.w = sampledResource9[workingVector3.w].val[0/4];
            workingVector3.w = (uint)workingVector3.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector11.xzw = -workingVector12.xyz * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xzw = (uint3)workingVector11.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 0) & bitMask.x) | ((uint)workingVector11.x & ~bitMask.x);
            workingVector11.x = (int)workingVector11.w + (int)workingVector11.x;
            workingVector3.w = (int)workingVector3.w + (int)workingVector11.x;
            workingVector3.w = workingVector7.w ? workingVector8.w : workingVector3.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.z;
            workingVector12.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector13.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
            workingVector13.xyzw = (uint4)workingVector13.xyzw;
            workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
            workingVector11.xzw = workingVector13.xyz * workingVector13.www;
            workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
            workingVector11.xzw = workingVector12.xxx ? workingVector11.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector7.www ? float3(0,0,0) : workingVector11.xzw;
            workingVector11.xzw = workingVector10.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector12.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector13.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector3.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector12.y = (((uint)workingVector12.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector3.w = (int)workingVector3.w + (int)workingVector12.x;
            workingVector3.w = (int)workingVector13.y + (int)workingVector3.w;
            workingVector3.w = (int)workingVector12.y + (int)workingVector3.w;
            workingVector3.w = (int)workingVector13.z + (int)workingVector3.w;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector3.w+4].x < 0);
            workingVector12.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector1.w + (int)workingVector8.w;
            workingVector10.z = 1 << (int)icb[workingVector3.w+4].x;
            workingVector9.w = (int)workingVector9.w & (int)workingVector10.z;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
            workingVector3.w = (int)workingVector11.y + (int)icb[workingVector3.w+4].x;
            workingVector3.w = sampledResource9[workingVector3.w].val[0/4];
            workingVector3.w = (uint)workingVector3.w >> 2;
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector11.xyz = -workingVector12.xyz * float3(16,16,16) + workingVector11.xzw;
            workingVector11.xyz = (uint3)workingVector11.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.z = (((uint)workingVector11.y << 0) & bitMask.z) | ((uint)workingVector11.x & ~bitMask.z);
            workingVector10.z = (int)workingVector11.z + (int)workingVector10.z;
            workingVector3.w = (int)workingVector3.w + (int)workingVector10.z;
            workingVector3.w = workingVector7.w ? workingVector8.w : workingVector3.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector9.w;
            workingVector11.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
            workingVector12.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
            workingVector12.xyzw = (uint4)workingVector12.xyzw;
            workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
            workingVector11.yzw = workingVector12.xyz * workingVector12.www;
            workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
            workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
            workingVector18.xyz = workingVector7.www ? float3(0,0,0) : workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.yzw = float3(0.0625,0.0625,0.0625) * workingVector10.xyz;
            workingVector9.yzw = floor(workingVector9.yzw);
            workingVector9.yzw = -workingVector9.yzw * float3(16,16,16) + workingVector10.xyz;
            workingVector9.yzw = (uint3)workingVector9.yzw;
            bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.y = (((uint)workingVector9.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.w = (((uint)workingVector9.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.y = (((uint)workingVector9.z << 0) & bitMask.y) | ((uint)workingVector9.y & ~bitMask.y);
            workingVector9.y = (int)workingVector9.w + (int)workingVector9.y;
            workingVector3.w = (int)workingVector3.w + (int)workingVector9.y;
            workingVector3.w = workingVector7.z ? workingVector8.w : workingVector3.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.x;
            workingVector9.x = sampledResource9[workingVector3.w].val[0/4];
            workingVector9.yzw = (uint3)workingVector9.xxx >> int3(8,16,24);
            workingVector10.xyzw = workingVector9.xyzw ? float4(0,0,0,0) : 0;
            workingVector10.xyzw = (uint4)workingVector10.xyzw;
            workingVector10.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector10.xyzw;
            workingVector9.yzw = workingVector10.xyz * workingVector10.www;
            workingVector9.yzw = float3(6,6,6) * workingVector9.yzw;
            workingVector9.xyz = workingVector9.xxx ? workingVector9.yzw : float3(0,0,0);
            workingVector18.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector9.xyz;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = workingVector16.xyz * workingVector5.www;
          workingVector11.xyz = workingVector15.xyz * workingVector6.www + workingVector11.xyz;
          workingVector11.xyz = workingVector17.xyz * workingVector4.www + workingVector11.xyz;
          workingVector11.xyz = workingVector18.xyz * workingVector0.www + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.xyz = workingVector16.xyz * workingVector5.www;
          workingVector9.xyz = workingVector15.xyz * workingVector6.www + workingVector9.xyz;
          workingVector9.xyz = workingVector17.xyz * workingVector4.www + workingVector9.xyz;
          workingVector9.xyz = workingVector18.xyz * workingVector0.www + workingVector9.xyz;
#endif
        } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector12.xyz = floor(workingVector5.xyz);
          workingVector5.xyz = -workingVector12.xyz + workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector10.xyz = floor(workingVector5.xyz);
          workingVector5.xyz = -workingVector10.xyz + workingVector5.xyz;
#endif
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector5.xyx >= workingVector5.yzz);
          bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector13.y & ~bitMask.w);
          workingVector0.w = (int)workingVector13.z + (int)workingVector0.w;
          workingVector3.w = min(workingVector5.x, workingVector5.y);
          workingVector4.w = max(workingVector5.x, workingVector5.y);
          workingVector5.x = min(workingVector3.w, workingVector5.z);
          workingVector5.y = max(workingVector4.w, workingVector5.z);
          workingVector4.w = min(workingVector4.w, workingVector5.z);
          workingVector3.w = max(workingVector4.w, workingVector3.w);
          workingVector4.w = 1 + -workingVector5.y;
          workingVector5.y = workingVector5.y + -workingVector3.w;
          workingVector3.w = workingVector3.w + -workingVector5.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(0,0,0));
#endif
          workingVector5.z = workingVector13.y ? workingVector13.x : 0;
          workingVector5.z = workingVector13.z ? workingVector5.z : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = float3(1,1,1) + workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.xyz = float3(1,1,1) + workingVector10.xyz;
#endif
          workingVector14.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(16,16,16));
          workingVector5.w = workingVector14.y ? workingVector14.x : 0;
          workingVector5.w = workingVector14.z ? workingVector5.w : 0;
          workingVector5.z = (int)workingVector5.w & (int)workingVector5.z;
          if (workingVector5.z != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = (uint3)workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xyz = (uint3)workingVector10.xyz;
#endif
            workingVector5.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector15.xz = workingVector5.zw ? float2(0,0) : 0;
            workingVector15.yw = icb[workingVector0.w+4].yz;
            workingVector16.xyz = (int3)workingVector14.xyz + (int3)workingVector15.ywx;
            workingVector15.xy = icb[workingVector0.w+12].yz;
            workingVector15.xyz = (int3)workingVector14.xyz + (int3)workingVector15.xyz;
            workingVector17.xyz = (int3)workingVector14.xyz + int3(1,1,1);
            workingVector5.zw = (uint2)workingVector14.zx << int2(4,8);
            workingVector5.z = (int)workingVector5.z + (int)workingVector14.y;
            workingVector5.z = (int)workingVector5.w + (int)workingVector5.z;
            workingVector5.z = (int)workingVector1.w + (int)workingVector5.z;
            workingVector14.x = sampledResource9[workingVector5.z].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector18.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
            workingVector18.xyzw = (uint4)workingVector18.xyzw;
            workingVector18.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector18.xyzw;
            workingVector14.yzw = workingVector18.xyz * workingVector18.www;
            workingVector14.yzw = float3(6,6,6) * workingVector14.yzw;
            workingVector14.xyz = workingVector14.xxx ? workingVector14.yzw : float3(0,0,0);
            workingVector5.zw = (uint2)workingVector16.zx << int2(4,8);
            workingVector5.z = (int)workingVector5.z + (int)workingVector16.y;
            workingVector5.z = (int)workingVector5.w + (int)workingVector5.z;
            workingVector5.z = (int)workingVector1.w + (int)workingVector5.z;
            workingVector16.x = sampledResource9[workingVector5.z].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector18.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector18.xyzw = (uint4)workingVector18.xyzw;
            workingVector18.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector18.xyzw;
            workingVector16.yzw = workingVector18.xyz * workingVector18.www;
            workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
            workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
            workingVector5.zw = (uint2)workingVector15.zx << int2(4,8);
            workingVector5.z = (int)workingVector5.z + (int)workingVector15.y;
            workingVector5.z = (int)workingVector5.w + (int)workingVector5.z;
            workingVector5.z = (int)workingVector1.w + (int)workingVector5.z;
            workingVector15.x = sampledResource9[workingVector5.z].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector18.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
            workingVector18.xyzw = (uint4)workingVector18.xyzw;
            workingVector18.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector18.xyzw;
            workingVector15.yzw = workingVector18.xyz * workingVector18.www;
            workingVector15.yzw = float3(6,6,6) * workingVector15.yzw;
            workingVector15.xyz = workingVector15.xxx ? workingVector15.yzw : float3(0,0,0);
            workingVector5.zw = (uint2)workingVector17.zx << int2(4,8);
            workingVector5.z = (int)workingVector5.z + (int)workingVector17.y;
            workingVector5.z = (int)workingVector5.w + (int)workingVector5.z;
            workingVector5.z = (int)workingVector1.w + (int)workingVector5.z;
            workingVector17.x = sampledResource9[workingVector5.z].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector18.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector18.xyzw = (uint4)workingVector18.xyzw;
            workingVector18.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector18.xyzw;
            workingVector17.yzw = workingVector18.xyz * workingVector18.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
          } else {
            workingVector5.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector5.zw = workingVector5.zw ? float2(0,0) : 0;
            workingVector18.xy = (uint2)icb[workingVector0.w+4].yz;
            workingVector18.z = (uint)workingVector5.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector18.xyz = workingVector18.xyz + workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector18.xyz = workingVector18.xyz + workingVector10.xyz;
#endif
            workingVector19.xy = (uint2)icb[workingVector0.w+12].yz;
            workingVector19.z = (uint)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector19.xyz = workingVector19.xyz + workingVector12.xyz;
            workingVector20.xyz = workingVector10.xyw * float3(16,16,16) + workingVector12.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector19.xyz = workingVector19.xyz + workingVector10.xyz;
            workingVector20.xyz = workingVector7.xyw * float3(16,16,16) + workingVector10.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector10.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.z = (((uint)workingVector21.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector21.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector5.z;
            workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector5.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector22.z + (int)workingVector0.w;
            workingVector5.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector5.w = (int)workingVector12.z + (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xyz = (uint3)workingVector10.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector5.w = (int)workingVector10.z + (int)workingVector5.w;
#endif
            workingVector5.w = (int)workingVector1.w + (int)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xy = (int2)workingVector1.ww + int2(4096,4097);
            workingVector6.w = sampledResource9[workingVector12.x].val[0/4];
            workingVector7.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.w = (int)workingVector6.w & (int)workingVector7.w;
            workingVector7.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xy = (int2)workingVector1.ww + int2(4096,4097);
            workingVector6.w = sampledResource9[workingVector10.x].val[0/4];
            workingVector7.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.z = (int)workingVector6.w & (int)workingVector7.z;
            workingVector7.z = RD_COMPARISON_MASK((int)workingVector7.z == 0);
            workingVector0.w = (int)workingVector10.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = float3(0.0625,0.0625,0.0625) * workingVector20.xyz;
            workingVector12.xzw = floor(workingVector12.xzw);
            workingVector12.xzw = -workingVector12.xzw * float3(16,16,16) + workingVector20.xyz;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.w + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = float3(0.0625,0.0625,0.0625) * workingVector20.xyz;
            workingVector10.xzw = floor(workingVector10.xzw);
            workingVector10.xzw = -workingVector10.xzw * float3(16,16,16) + workingVector20.xyz;
            workingVector10.xzw = (uint3)workingVector10.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector10.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector10.z << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector8.w = (int)workingVector10.w + (int)workingVector8.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector0.w = workingVector5.z ? workingVector5.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector5.z = workingVector5.z ? 0 : workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector5.z = workingVector5.z ? 0 : workingVector7.z;
#endif
            workingVector20.x = sampledResource9[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = workingVector21.xyz * workingVector21.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector20.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector14.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector10.xyw * float3(16,16,16) + workingVector18.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = workingVector21.xyz * workingVector21.www;
            workingVector10.xzw = float3(6,6,6) * workingVector10.xzw;
            workingVector10.xzw = workingVector20.xxx ? workingVector10.xzw : float3(0,0,0);
            workingVector14.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector10.xzw;
            workingVector10.xzw = workingVector7.xyw * float3(16,16,16) + workingVector18.xyz;
#endif
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector18.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector18.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.z = (((uint)workingVector20.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector20.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector5.z;
            workingVector0.w = (int)workingVector21.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector5.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector21.z + (int)workingVector0.w;
            workingVector5.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector18.xyz = (uint3)workingVector18.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector18.x = (((uint)workingVector18.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector18.z = (((uint)workingVector18.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector18.y << 0) & bitMask.w) | ((uint)workingVector18.x & ~bitMask.w);
            workingVector5.w = (int)workingVector18.z + (int)workingVector5.w;
            workingVector5.w = (int)workingVector1.w + (int)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.w = (int)workingVector6.w & (int)workingVector7.w;
            workingVector7.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.z = (int)workingVector6.w & (int)workingVector7.z;
            workingVector7.z = RD_COMPARISON_MASK((int)workingVector7.z == 0);
            workingVector0.w = (int)workingVector10.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector18.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector18.xyz = float3(0.0625,0.0625,0.0625) * workingVector10.xzw;
#endif
            workingVector18.xyz = floor(workingVector18.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = -workingVector18.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.w + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = -workingVector18.xyz * float3(16,16,16) + workingVector10.xzw;
            workingVector10.xzw = (uint3)workingVector10.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector10.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector10.z << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector8.w = (int)workingVector10.w + (int)workingVector8.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector0.w = workingVector5.z ? workingVector5.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector5.z = workingVector5.z ? 0 : workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector5.z = workingVector5.z ? 0 : workingVector7.z;
#endif
            workingVector18.x = sampledResource9[workingVector0.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = workingVector20.xyz * workingVector20.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector18.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector10.xyw * float3(16,16,16) + workingVector19.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = workingVector20.xyz * workingVector20.www;
            workingVector10.xzw = float3(6,6,6) * workingVector10.xzw;
            workingVector10.xzw = workingVector18.xxx ? workingVector10.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector10.xzw;
            workingVector10.xzw = workingVector7.xyw * float3(16,16,16) + workingVector19.xyz;
#endif
            workingVector18.xyz = RD_COMPARISON_MASK(workingVector19.xyz < float3(0,0,0));
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector19.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector18.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.z = (((uint)workingVector18.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector18.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector5.z;
            workingVector0.w = (int)workingVector20.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector5.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector20.z + (int)workingVector0.w;
            workingVector5.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector18.xyz = (uint3)workingVector19.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector18.x = (((uint)workingVector18.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector18.z = (((uint)workingVector18.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector18.y << 0) & bitMask.w) | ((uint)workingVector18.x & ~bitMask.w);
            workingVector5.w = (int)workingVector18.z + (int)workingVector5.w;
            workingVector5.w = (int)workingVector1.w + (int)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.w = (int)workingVector6.w & (int)workingVector7.w;
            workingVector7.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.z = 1 << (int)icb[workingVector0.w+4].x;
            workingVector7.z = (int)workingVector6.w & (int)workingVector7.z;
            workingVector7.z = RD_COMPARISON_MASK((int)workingVector7.z == 0);
            workingVector0.w = (int)workingVector10.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector18.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector18.xyz = float3(0.0625,0.0625,0.0625) * workingVector10.xzw;
#endif
            workingVector18.xyz = floor(workingVector18.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = -workingVector18.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector8.w = (int)workingVector12.w + (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = -workingVector18.xyz * float3(16,16,16) + workingVector10.xzw;
            workingVector10.xzw = (uint3)workingVector10.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector10.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector10.z << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector8.w = (int)workingVector10.w + (int)workingVector8.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector0.w = workingVector5.z ? workingVector5.w : workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector5.z = workingVector5.z ? 0 : workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector5.z = workingVector5.z ? 0 : workingVector7.z;
#endif
            workingVector18.x = sampledResource9[workingVector0.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector19.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector19.xyzw = (uint4)workingVector19.xyzw;
            workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = workingVector19.xyz * workingVector19.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector18.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector15.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector12.xzw;
            workingVector10.xyz = workingVector10.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector12.xzw = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = workingVector19.xyz * workingVector19.www;
            workingVector10.xzw = float3(6,6,6) * workingVector10.xzw;
            workingVector10.xzw = workingVector18.xxx ? workingVector10.xzw : float3(0,0,0);
            workingVector15.xyz = workingVector5.zzz ? float3(0,0,0) : workingVector10.xzw;
            workingVector7.xyz = workingVector7.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector10.xzw = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
#endif
            workingVector18.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector18.x = (((uint)workingVector18.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector18.y = (((uint)workingVector18.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector18.z = (((uint)workingVector18.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector12.x << 0) & bitMask.w) | ((uint)workingVector18.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.z = (((uint)workingVector12.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector12.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector10.x << 0) & bitMask.w) | ((uint)workingVector18.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector5.z = (((uint)workingVector10.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector5.w = (((uint)workingVector10.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector5.z;
            workingVector0.w = (int)workingVector18.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector5.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector18.z + (int)workingVector0.w;
            workingVector5.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xzw = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector12.z << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector5.w = (int)workingVector12.w + (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xzw = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector10.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector5.w = (((uint)workingVector10.z << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector5.w = (int)workingVector10.w + (int)workingVector5.w;
#endif
            workingVector1.w = (int)workingVector1.w + (int)workingVector5.w;
            workingVector5.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector5.w = (int)workingVector5.w & (int)workingVector6.w;
            workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector12.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector10.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector10.xyz;
            workingVector12.xyz = floor(workingVector12.xyz);
            workingVector10.xyz = -workingVector12.xyz * float3(16,16,16) + workingVector10.xyz;
            workingVector10.xyz = (uint3)workingVector10.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
            workingVector6.w = (int)workingVector10.z + (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
            workingVector10.xyz = floor(workingVector10.xyz);
            workingVector7.xyz = -workingVector10.xyz * float3(16,16,16) + workingVector7.xyz;
            workingVector7.xyz = (uint3)workingVector7.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.z = (((uint)workingVector7.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector7.y << 0) & bitMask.w) | ((uint)workingVector7.x & ~bitMask.w);
            workingVector6.w = (int)workingVector7.z + (int)workingVector6.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.w;
            workingVector0.w = workingVector5.z ? workingVector1.w : workingVector0.w;
            workingVector1.w = workingVector5.z ? 0 : workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.x = sampledResource9[workingVector0.w].val[0/4];
            workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
            workingVector12.xyzw = (int4)workingVector10.xyzw & int4(255,255,255,255);
            workingVector12.xyzw = (uint4)workingVector12.xyzw;
            workingVector12.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector12.xyzw;
            workingVector10.yzw = workingVector12.xyz * workingVector12.www;
            workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
            workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
            workingVector17.xyz = workingVector1.www ? float3(0,0,0) : workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.x = sampledResource9[workingVector0.w].val[0/4];
            workingVector7.yzw = (uint3)workingVector7.xxx >> int3(8,16,24);
            workingVector10.xyzw = (int4)workingVector7.xyzw & int4(255,255,255,255);
            workingVector10.xyzw = (uint4)workingVector10.xyzw;
            workingVector10.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector10.xyzw;
            workingVector7.yzw = workingVector10.xyz * workingVector10.www;
            workingVector7.yzw = float3(6,6,6) * workingVector7.yzw;
            workingVector7.xyz = workingVector7.xxx ? workingVector7.yzw : float3(0,0,0);
            workingVector17.xyz = workingVector1.www ? float3(0,0,0) : workingVector7.xyz;
#endif
          }
          workingVector5.yzw = workingVector16.xyz * workingVector5.yyy;
          workingVector5.yzw = workingVector14.xyz * workingVector4.www + workingVector5.yzw;
          workingVector5.yzw = workingVector15.xyz * workingVector3.www + workingVector5.yzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = workingVector17.xyz * workingVector5.xxx + workingVector5.yzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.xyz = workingVector17.xyz * workingVector5.xxx + workingVector5.yzw;
#endif
        }
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.xyz = float3(0,0,0);
#endif
      }
    } else {
      workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
      workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.w;
      workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 9.99999975e-005);
      workingVector1.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
      workingVector0.w = workingVector0.w ? workingVector1.w : 0;
      workingVector5.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
      workingVector1.w = workingVector5.x * 0.600000024 + 0.400000006;
      workingVector1.w = workingVector1.w * 0.600000024 + 0.400000006;
      workingVector5.y = workingVector5.x * workingVector1.w;
      workingVector1.w = workingVector5.x * workingVector5.x;
      workingVector1.w = workingVector1.w * 0.600000024 + 0.400000006;
      workingVector5.z = workingVector5.x * workingVector1.w;
      workingVector5.xyz = min(float3(1,1,1), workingVector5.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = workingVector0.www ? workingVector5.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.xyz = workingVector0.www ? workingVector5.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
#endif
    }
    workingVector0.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
    workingVector1.w = workingVector0.w * workingVector0.w;
    workingVector1.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector1.w;
    workingVector0.w = workingVector0.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector1.w;
    workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector1.w;
    workingVector5.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector5.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector5.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector5.xyz = workingVector11.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector5.xyz;
    workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector5.xyz = max(workingVector10.xyz, workingVector5.xyz);
    workingVector5.xyz = workingVector7.xyz * workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector5.xyz = workingVector9.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector5.xyz;
    workingVector7.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector5.xyz = max(workingVector7.xyz, workingVector5.xyz);
    workingVector5.xyz = workingVector8.xyz * workingVector5.xyz;
#endif
    workingVector5.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector5.xyz;
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector8.xyz = float3(0,0,0);
    workingVector9.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector11.xyz = float3(0,0,0);
    workingVector12.xyz = float3(0,0,0);
#endif
    workingVector5.xyz = float3(0,0,0);
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector5.xyz = workingVector5.xyz + workingVector8.xyz;
  workingVector5.xyz = workingVector5.xyz + workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector5.xyz = workingVector5.xyz + workingVector11.xyz;
  workingVector5.xyz = workingVector5.xyz + workingVector12.xyz;
#endif
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.w != 0) {
    workingVector4.w = workingVector2.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector4.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector4.w;
    workingVector4.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector4.w;
    workingVector4.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector4.w);
    workingVector5.w = RD_COMPARISON_MASK(0 < workingVector4.w);
    if (workingVector5.w != 0) {
      workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector5.w != 0) {
        workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector5.w = workingVector0.w ? workingVector5.w : 0;
        workingVector7.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector8.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector7.xyz = max(workingVector8.xyz, workingVector7.xyz);
        workingVector7.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector7.xyz;
        workingVector7.xyz = workingVector5.www ? workingVector7.xyz : 0;
        workingVector7.xyz = max(float3(1,1,1), workingVector7.xyz);
        workingVector7.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector7.xyz;
      } else {
        workingVector5.w = dot(workingVector1.xyz, workingVector1.xyz);
        workingVector5.w = rsqrt(workingVector5.w);
        workingVector8.xyz = workingVector5.www * workingVector1.xyz;
        workingVector1.xz = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector9.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector10.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector1.z = workingVector1.z + -workingVector1.x;
        workingVector1.y = workingVector1.y * workingVector5.w + -workingVector1.x;
        workingVector1.z = 1 / workingVector1.z;
        workingVector1.z = saturate(workingVector1.y * workingVector1.z);
        workingVector5.w = workingVector1.z * -2 + 3;
        workingVector1.z = workingVector1.z * workingVector1.z;
        workingVector1.z = -workingVector5.w * workingVector1.z + 1;
        workingVector5.w = workingVector1.z * workingVector1.z;
        workingVector1.z = workingVector5.w * workingVector1.z;
        workingVector5.w = dot(workingVector8.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector6.w = dot(workingVector8.xyz, RD_UNIFORM_MOON_DIR.xyz);
        workingVector7.w = workingVector5.w * workingVector5.w + 1;
        workingVector7.w = RD_UNIFORM_SUN_COLOR.w * workingVector7.w;
        workingVector8.x = workingVector6.w * workingVector6.w + 1;
        workingVector8.x = RD_UNIFORM_MOON_COLOR.w * workingVector8.x;
        workingVector1.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector1.x;
        workingVector1.x = 1 / workingVector1.x;
        workingVector1.x = saturate(workingVector1.y * workingVector1.x);
        workingVector1.y = workingVector1.x * -2 + 3;
        workingVector1.x = workingVector1.x * workingVector1.x;
        workingVector1.x = -workingVector1.y * workingVector1.x + 1;
        workingVector1.y = workingVector1.x * workingVector1.x;
        workingVector1.x = workingVector1.y * workingVector1.x;
        workingVector8.yzw = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector8.yzw = workingVector1.xxx * workingVector8.yzw + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector8.yzw = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector8.yzw;
        workingVector8.xyzw = float4(0.75,0.0795774683,0.0795774683,0.0795774683) * workingVector8.xyzw;
        workingVector1.x = workingVector7.w * 0.75 + workingVector8.x;
        workingVector1.y = max(0, workingVector5.w);
        workingVector1.y = log2(workingVector1.y);
        workingVector1.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector1.y;
        workingVector1.y = exp2(workingVector1.y);
        workingVector1.y = min(1, workingVector1.y);
        workingVector5.w = max(0, workingVector6.w);
        workingVector5.w = log2(workingVector5.w);
        workingVector5.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector5.w;
        workingVector5.w = exp2(workingVector5.w);
        workingVector5.w = min(1, workingVector5.w);
        workingVector6.w = -workingVector1.y * 1.79999995 + 1.80999994;
        workingVector7.w = sqrt(workingVector6.w);
        workingVector6.w = workingVector7.w * workingVector6.w;
        workingVector6.w = 0.0361000001 / workingVector6.w;
        workingVector7.w = -workingVector5.w * 1.79999995 + 1.80999994;
        workingVector8.x = sqrt(workingVector7.w);
        workingVector7.w = workingVector8.x * workingVector7.w;
        workingVector7.w = 0.0361000001 / workingVector7.w;
        workingVector9.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector9.xyz;
        workingVector9.xyz = workingVector9.xyz * workingVector1.yyy;
        workingVector10.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector10.xyz;
        workingVector10.xyz = workingVector10.xyz * workingVector5.www;
        workingVector10.xyz = workingVector10.xyz * workingVector7.www;
        workingVector11.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector1.zzz;
        workingVector11.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector11.xyz;
        workingVector9.xyz = workingVector9.xyz * workingVector6.www + workingVector10.xyz;
        workingVector9.xyz = workingVector11.xyz * workingVector9.xyz;
        workingVector1.xyz = workingVector8.yzw * workingVector1.xxx + workingVector9.xyz;
        workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector6.w = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector8.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector1.xyz;
        workingVector8.xyz = workingVector6.www * workingVector8.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector7.xyz = workingVector5.www ? workingVector8.xyz : workingVector1.xyz;
      }
    } else {
      workingVector7.xyz = float3(0,0,0);
    }
  } else {
    workingVector7.xyz = float3(0,0,0);
    workingVector4.w = 0;
  }
  workingVector1.xyz = workingVector7.xyz + -workingVector5.xyz;
  workingVector1.xyz = workingVector4.www * workingVector1.xyz + workingVector5.xyz;
  if (workingVector3.w != 0) {
    workingVector5.xy = float2(1,1) + workingVector2.xy;
    workingVector5.xy = float2(0.5,0.5) * workingVector5.xy;
    workingVector7.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
    workingVector7.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector7.xy;
    workingVector7.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector7.xy;
    workingVector7.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector7.xy;
    workingVector4.w = -workingVector7.x / workingVector7.y;
    workingVector4.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector4.w;
    workingVector6.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector4.w = workingVector4.w / workingVector6.w;
    workingVector4.w = workingVector4.w * 53.5981483 + 1;
    workingVector4.w = log2(workingVector4.w);
    workingVector4.w = 0.173286796 * workingVector4.w;
    workingVector6.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector7.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector4.w = workingVector4.w * workingVector7.x + -0.5;
    workingVector7.x = (int)workingVector4.w;
    workingVector6.w = (int)workingVector6.w + -2;
    workingVector7.x = max(0, (int)workingVector7.x);
    workingVector6.w = min((int)workingVector7.x, (int)workingVector6.w);
    workingVector5.z = (int)workingVector6.w;
    workingVector4.w = saturate(-workingVector5.z + workingVector4.w);
    workingVector7.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector5.xyz, 0).xyzw;
    workingVector5.z = (int)workingVector6.w + 1;
    workingVector5.w = (int)workingVector5.z;
    workingVector5.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector5.xyw, 0).xyzw;
    workingVector5.xyzw = workingVector5.xyzw + -workingVector7.xyzw;
    workingVector5.xyzw = workingVector4.wwww * workingVector5.xyzw + workingVector7.xyzw;
  } else {
    workingVector5.xyzw = float4(0,0,0,1);
  }
  workingVector1.xyz = workingVector5.www * workingVector1.xyz + workingVector5.xyz;
  workingVector4.w = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector4.w != 0) {
    workingVector4.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector4.w = max(1, workingVector4.w);
    workingVector5.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector4.w = saturate(workingVector5.x / workingVector4.w);
    workingVector5.x = workingVector4.w * workingVector4.w;
    workingVector4.w = workingVector5.x * workingVector4.w;
    workingVector4.w = RD_UNIFORM_IBL_PARAMETERS.x * workingVector4.w;
    workingVector5.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector5.y = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector5.z = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
    workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
    workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector7.xyz;
    workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector7.xyz;
    workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector7.xyz;
    workingVector6.xyz = workingVector5.zzz ? workingVector6.xyz : varyingTexCoord3.xyz;
    workingVector0.xyz = workingVector5.zzz ? workingVector7.xyz : workingVector0.xyz;
    workingVector6.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector6.xyz;
    workingVector5.z = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector5.z = rsqrt(workingVector5.z);
    workingVector6.xyz = workingVector6.xyz * workingVector5.zzz;
    workingVector5.z = dot(workingVector0.xyz, workingVector0.xyz);
    workingVector5.z = rsqrt(workingVector5.z);
    workingVector0.xyz = workingVector5.zzz * workingVector0.xyz;
    workingVector5.z = dot(workingVector6.xyz, workingVector3.xyz);
    workingVector5.z = workingVector5.z + workingVector5.z;
    workingVector6.xyz = workingVector3.xyz * -workingVector5.zzz + workingVector6.xyz;
    workingVector3.x = RD_COMPARISON_MASK((int)workingVector5.y == 1);
    workingVector3.y = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector3.yz = float2(0.75,0.99609375) * workingVector3.yy;
    workingVector3.x = workingVector3.x ? workingVector3.y : workingVector3.z;
    workingVector3.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector3.y = (int)workingVector3.y + 2;
    workingVector3.z = (int)workingVector3.y & 0x80000000;
    workingVector3.y = max((int)-workingVector3.y, (int)workingVector3.y);
    workingVector3.y = (uint)workingVector3.y % 3;
    workingVector5.y = -(int)workingVector3.y;
    workingVector3.y = workingVector3.z ? workingVector5.y : workingVector3.y;
    workingVector6.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
    workingVector5.yzw = materialTexture7.SampleLevel(textureSampler7, workingVector6.xyzw, workingVector3.x).xyz;
    workingVector6.w = (int)workingVector3.y;
    workingVector3.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector6.xyzw, workingVector3.x).xyz;
    workingVector5.yzw = workingVector5.yzw + -workingVector3.xyz;
    workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector5.yzw + workingVector3.xyz;
    workingVector5.yzw = float3(301.724121,301.724121,301.724121) * workingVector3.xyz;
    workingVector3.xyz = workingVector5.xxx ? workingVector5.yzw : workingVector3.xyz;
    workingVector3.xyz = workingVector3.xyz * workingVector4.www;
    workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector3.xyz;
    workingVector4.w = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.w = RD_COMPARISON_MASK(workingVector4.w < 0);
    workingVector5.xyz = workingVector4.www ? float3(0,0,0) : workingVector3.xyz;
    workingVector3.xyz = workingVector0.www ? workingVector5.xyz : workingVector3.xyz;
    workingVector0.x = saturate(dot(workingVector4.xyz, -workingVector0.xyz));
    workingVector0.y = 0.5;
    workingVector0.xy = materialTexture0.Sample(textureSampler0, workingVector0.xy).xy;
    workingVector0.x = workingVector0.x * 0.0399999991 + workingVector0.y;
    workingVector0.xyz = workingVector3.xyz * workingVector0.xxx;
    workingVector0.w = workingVector2.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector0.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.w;
    workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
    workingVector2.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.w);
    workingVector2.w = 1 + -workingVector2.w;
    workingVector3.xyz = workingVector2.www * workingVector0.xyz;
    workingVector2.w = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector0.w = saturate(workingVector0.w / workingVector2.w);
    workingVector0.w = 1 + -workingVector0.w;
    workingVector0.xyz = workingVector0.xyz * workingVector0.www;
    workingVector0.xyz = workingVector1.www ? workingVector3.xyz : workingVector0.xyz;
    if (workingVector3.w != 0) {
      workingVector3.xy = float2(1,1) + workingVector2.xy;
      workingVector3.xy = float2(0.5,0.5) * workingVector3.xy;
      workingVector2.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
      workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector2.yw;
      workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector2.xy;
      workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
      workingVector0.w = -workingVector2.x / workingVector2.y;
      workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
      workingVector1.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector0.w = workingVector0.w / workingVector1.w;
      workingVector0.w = workingVector0.w * 53.5981483 + 1;
      workingVector0.w = log2(workingVector0.w);
      workingVector0.w = 0.173286796 * workingVector0.w;
      workingVector1.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector2.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector0.w = workingVector0.w * workingVector2.x + -0.5;
      workingVector2.x = (int)workingVector0.w;
      workingVector1.w = (int)workingVector1.w + -2;
      workingVector2.x = max(0, (int)workingVector2.x);
      workingVector1.w = min((int)workingVector2.x, (int)workingVector1.w);
      workingVector3.z = (int)workingVector1.w;
      workingVector0.w = saturate(-workingVector3.z + workingVector0.w);
      workingVector2.x = materialTexture5.SampleLevel(textureSampler5, workingVector3.xyz, 0).w;
      workingVector1.w = (int)workingVector1.w + 1;
      workingVector3.w = (int)workingVector1.w;
      workingVector1.w = materialTexture5.SampleLevel(textureSampler5, workingVector3.xyw, 0).w;
      workingVector1.w = workingVector1.w + -workingVector2.x;
      workingVector0.w = workingVector0.w * workingVector1.w + workingVector2.x;
      workingVector0.xyz = workingVector0.www * workingVector0.xyz;
    }
  } else {
    workingVector0.xyz = float3(0,0,0);
  }
  workingVector0.xyz = workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture3.Sample(textureSampler3, float2(0.5,0.5)).x;
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
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue248 = productValue * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue249 = productValue * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue250 = productValue * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue101 = ceil(productValue1);
    float productValue251 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue248) * scalarValue101) + productValue248;
    float productValue252 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue249) * scalarValue101) + productValue249;
    float productValue253 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue250) * scalarValue101) + productValue250;
#endif
    float4 sampledTextureValue = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue1 = glintTextureTexture.Sample(glintTextureSampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue6 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue7 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue8 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue1.z + sampledTextureValue.z);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue9 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) + (productValue6 * productValue6);
    float productValue10 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) + (productValue7 * productValue7);
    float productValue11 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) + (productValue8 * productValue8);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue254 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue251) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue251) + (productValue6 * productValue6);
    float productValue255 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue252) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue252) + (productValue7 * productValue7);
    float productValue256 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue253) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue253) + (productValue8 * productValue8);
#endif
    uint comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue12 = floor(quotientValue1 * 0.25f);
        float productValue13 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = uint(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue13 * productValue13) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue12 * productValue12) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f))));
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
        exponentialValue = exp2(log2(max(productValue9, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue10, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue11, 0.0f)) * 2.2000000476837158203125f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = exp2(log2(max(productValue254, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue255, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue256, 0.0f)) * 2.2000000476837158203125f);
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        exponentialValue = (productValue9 <= 0.040449999272823333740234375f) ? (productValue9 * 0.077399380505084991455078125f) : exp2(log2((productValue9 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue10 <= 0.040449999272823333740234375f) ? (productValue10 * 0.077399380505084991455078125f) : exp2(log2((productValue10 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue11 <= 0.040449999272823333740234375f) ? (productValue11 * 0.077399380505084991455078125f) : exp2(log2((productValue11 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = (productValue254 <= 0.040449999272823333740234375f) ? (productValue254 * 0.077399380505084991455078125f) : exp2(log2((productValue254 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue255 <= 0.040449999272823333740234375f) ? (productValue255 * 0.077399380505084991455078125f) : exp2(log2((productValue255 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue256 <= 0.040449999272823333740234375f) ? (productValue256 * 0.077399380505084991455078125f) : exp2(log2((productValue256 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
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
    float productValue14 = inverseLengthValue1 * varyingNormal0.x;
    float productValue15 = inverseLengthValue1 * varyingNormal0.y;
    float productValue16 = inverseLengthValue1 * varyingNormal0.z;
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue15, productValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue15, productValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue16, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue15, productValue14 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
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
    float productValue17 = inverseLengthValue2 * scalarValue1;
    float productValue18 = inverseLengthValue2 * scalarValue2;
    float productValue19 = inverseLengthValue2 * scalarValue3;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float sumValue3 = (-0.0f) - multiplyAddValue6;
#endif
    float sumValue4 = ddy_coarse((-0.0f) - multiplyAddValue4);
    float sumValue5 = ddy_coarse((-0.0f) - multiplyAddValue5);
    float scalarValue4 = ddy_coarse(sumValue3);
    float inverseLengthValue3 = rsqrt(dot(float3(sumValue4, sumValue5, scalarValue4), float3(sumValue4, sumValue5, scalarValue4)));
    float productValue20 = inverseLengthValue3 * sumValue4;
    float productValue21 = inverseLengthValue3 * sumValue5;
    float productValue22 = inverseLengthValue3 * scalarValue4;
    float productValue23 = (productValue22 * productValue18) - (productValue21 * productValue19);
    float productValue24 = (productValue20 * productValue19) - (productValue22 * productValue17);
    float productValue25 = (productValue21 * productValue17) - (productValue20 * productValue18);
    float inverseLengthValue4 = rsqrt(dot(float3(productValue23, productValue24, productValue25), float3(productValue23, productValue24, productValue25)));
    float productValue26 = productValue23 * inverseLengthValue4;
    float productValue27 = productValue24 * inverseLengthValue4;
    float productValue28 = productValue25 * inverseLengthValue4;
    float multiplyAddValue15 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue28, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue27, productValue26 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue16 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue28, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue27, productValue26 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue17 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue28, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue27, productValue26 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17)));
    float quotientValue2 = round((inverseLengthValue5 * multiplyAddValue15) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue3 = round((inverseLengthValue5 * multiplyAddValue16) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue4 = round((inverseLengthValue5 * multiplyAddValue17) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue6 = rsqrt(dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(quotientValue2, quotientValue3, quotientValue4)));
    float productValue29 = inverseLengthValue6 * quotientValue2;
    float productValue30 = inverseLengthValue6 * quotientValue3;
    float productValue31 = inverseLengthValue6 * quotientValue4;
    float productValue32 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue5 = productValue32 - (sumValue - (floor(sumValue / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue6 = productValue32 - (sumValue1 - (floor(sumValue1 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue7 = productValue32 - (sumValue2 - (floor(sumValue2 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(productValue29, productValue30, productValue31));
    float productValue33 = ((quotientValue5 + sumValue) - (dotProductValue * productValue29)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue34 = ((sumValue1 - (dotProductValue * productValue30)) + quotientValue6) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue35 = ((sumValue2 - (dotProductValue * productValue31)) + quotientValue7) + RD_UNIFORM_WORLD_ORIGIN.z;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue36 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue36, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue36 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue36, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue36 * productValue36) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue36, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float sampledTextureValue2;
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
        sampledTextureValue2 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue14, productValue15, productValue16)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
    }
    else
    {
        sampledTextureValue2 = 1.0f;
    }
    float clampedValue4 = clamp(((RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float nonlinearValue = sqrt(((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6));
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue37;
    float productValue38;
#endif
    float productValue39;
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
    float productValue40;
    float productValue41;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue40;
    float productValue41;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
#endif
    if (multiplyAddValue11 != 1.0f)
    {
        float sumValue6 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
        float quotientValue8 = multiplyAddValue4 / sumValue6;
        float quotientValue9 = multiplyAddValue5 / sumValue6;
        float quotientValue10 = multiplyAddValue6 / sumValue6;
        float sumValue7 = (-0.0f) - quotientValue8;
        float sumValue8 = (-0.0f) - quotientValue9;
        float sumValue9 = (-0.0f) - quotientValue10;
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
            float productValue61;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue54;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue63;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue56;
#endif
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
                float dotProductValue1 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(inverseLengthValue7 * multiplyAddValue18, inverseLengthValue7 * multiplyAddValue19, inverseLengthValue7 * multiplyAddValue20)), 0.0f);
                float clampedValue5 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue1 = (clampedValue5 * productValue14) + (conditionValue ? productValue33 : varyingTexCoord3.x);
                float comparisonValue2 = (clampedValue5 * productValue15) + (conditionValue ? productValue34 : varyingTexCoord3.y);
                float comparisonValue3 = (clampedValue5 * productValue16) + (conditionValue ? productValue35 : varyingTexCoord3.z);
                uint clampedValue6 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue32;
#endif
                if (int(clampedValue6) > int(0u))
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue32;
                    uint intermediateValue42;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue31;
                    uint intermediateValue48;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue33;
                    uint intermediateValue43;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue32;
                    uint intermediateValue49;
#endif
                    float scalarValue5 = 1.0f;
                    uint scalarValue6 = 0u;
                    uint scalarValue7 = 0u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint quotientValue12;
                    bool intermediateValue44;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint quotientValue14;
                    bool intermediateValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint quotientValue12;
                    bool intermediateValue45;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint quotientValue14;
                    bool intermediateValue51;
#endif
                    for (;;)
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue10 = scalarValue7 + 228u;
                        quotientValue12 = uint(min(int(uint(int(fragmentConstants[sumValue10 / 4u][sumValue10 % 4u])) + scalarValue6), int(8u)));
                        intermediateValue44 = int(scalarValue6) < int(quotientValue12);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        if (intermediateValue44)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint sumValue124 = scalarValue7 + 236u;
                        quotientValue14 = uint(min(int(uint(int(fragmentConstants[sumValue124 / 4u][sumValue124 % 4u])) + scalarValue6), int(8u)));
                        intermediateValue50 = int(scalarValue6) < int(quotientValue14);
                        float branchMergedValue;
                        uint branchMergedValue6;
                        if (intermediateValue50)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue10 = scalarValue7 + 228u;
                        quotientValue12 = uint(min(int(uint(int(fragmentConstants[sumValue10 / 4u][sumValue10 % 4u])) + scalarValue6), int(8u)));
                        intermediateValue45 = int(scalarValue6) < int(quotientValue12);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        if (intermediateValue45)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint sumValue124 = scalarValue7 + 236u;
                        quotientValue14 = uint(min(int(uint(int(fragmentConstants[sumValue124 / 4u][sumValue124 % 4u])) + scalarValue6), int(8u)));
                        intermediateValue51 = int(scalarValue6) < int(quotientValue14);
                        float branchMergedValue;
                        uint branchMergedValue6;
                        if (intermediateValue51)
#endif
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue54;
                            uint intermediateValue55;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue70;
                            uint intermediateValue71;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue55;
                            uint intermediateValue56;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue71;
                            uint intermediateValue72;
#endif
                            float scalarValue8 = scalarValue5;
                            uint scalarValue9 = scalarValue6;
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
                                uint bitwiseValue = scalarValue9 << 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint sumValue11 = bitwiseValue + 58u;
                                uint sumValue12 = bitwiseValue + 59u;
#endif
                                uint sumValue13 = bitwiseValue + 60u;
                                uint sumValue14 = bitwiseValue + 61u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                multiplyAddValue35 = mad(fragmentConstants[sumValue13].x, comparisonValue3, mad(fragmentConstants[sumValue12].x, comparisonValue2, fragmentConstants[sumValue11].x * comparisonValue1)) + fragmentConstants[sumValue14].x;
                                multiplyAddValue36 = mad(fragmentConstants[sumValue13].y, comparisonValue3, mad(fragmentConstants[sumValue12].y, comparisonValue2, fragmentConstants[sumValue11].y * comparisonValue1)) + fragmentConstants[sumValue14].y;
                                multiplyAddValue37 = mad(fragmentConstants[sumValue13].z, comparisonValue3, mad(fragmentConstants[sumValue12].z, comparisonValue2, fragmentConstants[sumValue11].z * comparisonValue1)) + fragmentConstants[sumValue14].z;
                                comparisonValue19 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
                                uint branchMergedValue1;
                                float branchMergedValue6;
                                if (comparisonValue19)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint sumValue125 = bitwiseValue + 62u;
                                uint sumValue126 = bitwiseValue + 63u;
                                multiplyAddValue35 = mad(fragmentConstants[sumValue125].x, comparisonValue3, mad(fragmentConstants[sumValue14].x, comparisonValue2, fragmentConstants[sumValue13].x * comparisonValue1)) + fragmentConstants[sumValue126].x;
                                multiplyAddValue36 = mad(fragmentConstants[sumValue125].y, comparisonValue3, mad(fragmentConstants[sumValue14].y, comparisonValue2, fragmentConstants[sumValue13].y * comparisonValue1)) + fragmentConstants[sumValue126].y;
                                multiplyAddValue37 = mad(fragmentConstants[sumValue125].z, comparisonValue3, mad(fragmentConstants[sumValue14].z, comparisonValue2, fragmentConstants[sumValue13].z * comparisonValue1)) + fragmentConstants[sumValue126].z;
                                comparisonValue18 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                if (comparisonValue18)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue15 = scalarValue9 + 488u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue127 = scalarValue9 + 500u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue164 = scalarValue9 + 492u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue178 = scalarValue9 + 504u;
#endif
                                    uint sumValue16 = scalarValue9 + 17u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue11 = min(max(dotProductValue1, fragmentConstants[sumValue15 / 4u][sumValue15 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue11 * quotientValue11)) / quotientValue11) * fragmentConstants[sumValue16].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue20 = min(max(dotProductValue1, fragmentConstants[sumValue127 / 4u][sumValue127 % 4u]), 1.0f);
                                    float nonlinearValue4 = (sqrt(1.0f - (quotientValue20 * quotientValue20)) / quotientValue20) * fragmentConstants[sumValue16].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue29 = min(max(dotProductValue1, fragmentConstants[sumValue164 / 4u][sumValue164 % 4u]), 1.0f);
                                    float nonlinearValue5 = (sqrt(1.0f - (quotientValue29 * quotientValue29)) / quotientValue29) * fragmentConstants[sumValue16].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue32 = min(max(dotProductValue1, fragmentConstants[sumValue178 / 4u][sumValue178 % 4u]), 1.0f);
                                    float nonlinearValue6 = (sqrt(1.0f - (quotientValue32 * quotientValue32)) / quotientValue32) * fragmentConstants[sumValue16].z;
#endif
                                    float productValue48 = (multiplyAddValue35 * 0.5f) + 0.5f;
                                    float productValue55 = 0.5f - (multiplyAddValue36 * 0.5f);
                                    uint comparisonValue4 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue16].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue13 = uint(int(comparisonValue4) / int(2u));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float intermediateValue103;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float intermediateValue126;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float intermediateValue104;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float intermediateValue127;
#endif
                                    if (int(comparisonValue4) > int(0u))
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        float sumValue80;
                                        float intermediateValue132;
                                        uint intermediateValue133;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        float sumValue90;
                                        float intermediateValue161;
                                        uint intermediateValue162;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        float sumValue80;
                                        float intermediateValue133;
                                        uint intermediateValue134;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        float sumValue90;
                                        float intermediateValue162;
                                        uint intermediateValue163;
#endif
                                        float scalarValue10 = 0.0f;
                                        uint scalarValue11 = 0u;
                                        for (;;)
                                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                            intermediateValue132 = scalarValue10;
                                            intermediateValue133 = 0u;
                                            float intermediateValue176;
                                            float productValue140;
                                            float4 intermediateValue134;
                                            float intermediateValue135;
                                            float intermediateValue136;
                                            float productValue141;
                                            bool comparisonValue41;
                                            float sumValue90;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                            intermediateValue161 = scalarValue10;
                                            intermediateValue162 = 0u;
                                            float intermediateValue214;
                                            float productValue170;
                                            float4 intermediateValue163;
                                            float intermediateValue164;
                                            float intermediateValue165;
                                            float productValue171;
                                            bool comparisonValue44;
                                            float sumValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                            intermediateValue133 = scalarValue10;
                                            intermediateValue134 = 0u;
                                            float intermediateValue177;
                                            float productValue142;
                                            float4 intermediateValue135;
                                            float intermediateValue136;
                                            float intermediateValue137;
                                            float productValue143;
                                            bool comparisonValue41;
                                            float sumValue90;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                            intermediateValue162 = scalarValue10;
                                            intermediateValue163 = 0u;
                                            float intermediateValue215;
                                            float productValue172;
                                            float4 intermediateValue164;
                                            float intermediateValue165;
                                            float intermediateValue166;
                                            float productValue173;
                                            bool comparisonValue44;
                                            float sumValue100;
#endif
                                            for (;;)
                                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float productValue57 = (productValue48 + ((float(int(intermediateValue133 - quotientValue13)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue16].x;
                                                productValue140 = (productValue55 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue11 - quotientValue13)) + 0.5f))) * fragmentConstants[sumValue16].x;
                                                intermediateValue134 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue57, productValue140, float(int(scalarValue9))));
                                                intermediateValue135 = intermediateValue134.w;
                                                intermediateValue136 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                                productValue141 = frac((productValue57 * intermediateValue136) + 0.5f);
                                                comparisonValue41 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue90 = (multiplyAddValue37 - fragmentConstants[sumValue16].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue41)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float productValue195 = (productValue48 + ((float(int(intermediateValue162 - quotientValue13)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue16].x;
                                                productValue170 = (productValue55 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue11 - quotientValue13)) + 0.5f))) * fragmentConstants[sumValue16].x;
                                                intermediateValue163 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue195, productValue170, float(int(scalarValue9))));
                                                intermediateValue164 = intermediateValue163.w;
                                                intermediateValue165 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                                productValue171 = frac((productValue195 * intermediateValue165) + 0.5f);
                                                comparisonValue44 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue100 = (multiplyAddValue37 - fragmentConstants[sumValue16].y) - nonlinearValue4;
                                                float branchMergedValue5;
                                                if (comparisonValue44)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float productValue257 = (productValue48 + ((float(int(intermediateValue134 - quotientValue13)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue16].x;
                                                productValue142 = (productValue55 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue11 - quotientValue13)) + 0.5f))) * fragmentConstants[sumValue16].x;
                                                intermediateValue135 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue257, productValue142, float(int(scalarValue9))));
                                                intermediateValue136 = intermediateValue135.w;
                                                intermediateValue137 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                                productValue143 = frac((productValue257 * intermediateValue137) + 0.5f);
                                                comparisonValue41 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue90 = (multiplyAddValue37 - fragmentConstants[sumValue16].y) - nonlinearValue5;
                                                float branchMergedValue4;
                                                if (comparisonValue41)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float productValue275 = (productValue48 + ((float(int(intermediateValue163 - quotientValue13)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue16].x;
                                                productValue172 = (productValue55 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue11 - quotientValue13)) + 0.5f))) * fragmentConstants[sumValue16].x;
                                                intermediateValue164 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue275, productValue172, float(int(scalarValue9))));
                                                intermediateValue165 = intermediateValue164.w;
                                                intermediateValue166 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                                productValue173 = frac((productValue275 * intermediateValue166) + 0.5f);
                                                comparisonValue44 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue100 = (multiplyAddValue37 - fragmentConstants[sumValue16].y) - nonlinearValue6;
                                                float branchMergedValue5;
                                                if (comparisonValue44)
#endif
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    branchMergedValue4 = float(intermediateValue135 >= sumValue90);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    branchMergedValue5 = float(intermediateValue164 >= sumValue100);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    branchMergedValue4 = float(intermediateValue136 >= sumValue90);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    branchMergedValue5 = float(intermediateValue165 >= sumValue100);
#endif
                                                }
                                                else
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    float comparisonValue5 = (intermediateValue134.x < sumValue90) ? 0.0f : 1.0f;
                                                    float comparisonValue6 = (intermediateValue135 < sumValue90) ? 0.0f : 1.0f;
                                                    float comparisonValue7 = ((((intermediateValue134.z < sumValue90) ? 0.0f : 1.0f) - comparisonValue6) * productValue141) + comparisonValue6;
                                                    branchMergedValue4 = (frac((productValue140 * intermediateValue136) + 0.5f) * ((((((intermediateValue134.y < sumValue90) ? 0.0f : 1.0f) - comparisonValue5) * productValue141) + comparisonValue5) - comparisonValue7)) + comparisonValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    float comparisonValue67 = (intermediateValue163.x < sumValue100) ? 0.0f : 1.0f;
                                                    float comparisonValue68 = (intermediateValue164 < sumValue100) ? 0.0f : 1.0f;
                                                    float comparisonValue69 = ((((intermediateValue163.z < sumValue100) ? 0.0f : 1.0f) - comparisonValue68) * productValue171) + comparisonValue68;
                                                    branchMergedValue5 = (frac((productValue170 * intermediateValue165) + 0.5f) * ((((((intermediateValue163.y < sumValue100) ? 0.0f : 1.0f) - comparisonValue67) * productValue171) + comparisonValue67) - comparisonValue69)) + comparisonValue69;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    float comparisonValue94 = (intermediateValue135.x < sumValue90) ? 0.0f : 1.0f;
                                                    float comparisonValue95 = (intermediateValue136 < sumValue90) ? 0.0f : 1.0f;
                                                    float comparisonValue96 = ((((intermediateValue135.z < sumValue90) ? 0.0f : 1.0f) - comparisonValue95) * productValue143) + comparisonValue95;
                                                    branchMergedValue4 = (frac((productValue142 * intermediateValue137) + 0.5f) * ((((((intermediateValue135.y < sumValue90) ? 0.0f : 1.0f) - comparisonValue94) * productValue143) + comparisonValue94) - comparisonValue96)) + comparisonValue96;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    float comparisonValue109 = (intermediateValue164.x < sumValue100) ? 0.0f : 1.0f;
                                                    float comparisonValue110 = (intermediateValue165 < sumValue100) ? 0.0f : 1.0f;
                                                    float comparisonValue111 = ((((intermediateValue164.z < sumValue100) ? 0.0f : 1.0f) - comparisonValue110) * productValue173) + comparisonValue110;
                                                    branchMergedValue5 = (frac((productValue172 * intermediateValue166) + 0.5f) * ((((((intermediateValue164.y < sumValue100) ? 0.0f : 1.0f) - comparisonValue109) * productValue173) + comparisonValue109) - comparisonValue111)) + comparisonValue111;
#endif
                                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                intermediateValue176 = branchMergedValue4;
                                                sumValue80 = intermediateValue176 + intermediateValue132;
                                                uint sumValue17 = intermediateValue133 + 1u;
                                                if (sumValue17 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                intermediateValue214 = branchMergedValue5;
                                                sumValue90 = intermediateValue214 + intermediateValue161;
                                                uint sumValue128 = intermediateValue162 + 1u;
                                                if (sumValue128 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                intermediateValue177 = branchMergedValue4;
                                                sumValue80 = intermediateValue177 + intermediateValue133;
                                                uint sumValue165 = intermediateValue134 + 1u;
                                                if (sumValue165 == comparisonValue4)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                intermediateValue215 = branchMergedValue5;
                                                sumValue90 = intermediateValue215 + intermediateValue162;
                                                uint sumValue179 = intermediateValue163 + 1u;
                                                if (sumValue179 == comparisonValue4)
#endif
                                                {
                                                    break;
                                                }
                                                else
                                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    intermediateValue132 = sumValue80;
                                                    intermediateValue133 = sumValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    intermediateValue161 = sumValue90;
                                                    intermediateValue162 = sumValue128;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                    intermediateValue133 = sumValue80;
                                                    intermediateValue134 = sumValue165;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                    intermediateValue162 = sumValue90;
                                                    intermediateValue163 = sumValue179;
#endif
                                                    continue;
                                                }
                                            }
                                            uint sumValue18 = scalarValue11 + 1u;
                                            if (sumValue18 == comparisonValue4)
                                            {
                                                break;
                                            }
                                            else
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                scalarValue10 = sumValue80;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                scalarValue10 = sumValue90;
#endif
                                                scalarValue11 = sumValue18;
                                                continue;
                                            }
                                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue103 = sumValue80;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue126 = sumValue90;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue104 = sumValue80;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue127 = sumValue90;
#endif
                                    }
                                    else
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue103 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue126 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue104 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue127 = 0.0f;
#endif
                                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = quotientValue12;
                                    branchMergedValue6 = min(scalarValue8, intermediateValue103 / float(int(comparisonValue4 * comparisonValue4)));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = min(scalarValue8, intermediateValue126 / float(int(comparisonValue4 * comparisonValue4)));
                                    branchMergedValue7 = quotientValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = quotientValue12;
                                    branchMergedValue6 = min(scalarValue8, intermediateValue104 / float(int(comparisonValue4 * comparisonValue4)));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = min(scalarValue8, intermediateValue127 / float(int(comparisonValue4 * comparisonValue4)));
                                    branchMergedValue7 = quotientValue14;
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    branchMergedValue1 = scalarValue9 + 1u;
                                    branchMergedValue6 = scalarValue8;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    branchMergedValue1 = scalarValue8;
                                    branchMergedValue7 = scalarValue9 + 1u;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue55 = branchMergedValue1;
                                intermediateValue54 = branchMergedValue6;
                                if (int(intermediateValue55) < int(quotientValue12))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue70 = branchMergedValue1;
                                intermediateValue71 = branchMergedValue7;
                                if (int(intermediateValue71) < int(quotientValue14))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue56 = branchMergedValue1;
                                intermediateValue55 = branchMergedValue6;
                                if (int(intermediateValue56) < int(quotientValue12))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue71 = branchMergedValue1;
                                intermediateValue72 = branchMergedValue7;
                                if (int(intermediateValue72) < int(quotientValue14))
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    scalarValue8 = intermediateValue54;
                                    scalarValue9 = intermediateValue55;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    scalarValue8 = intermediateValue70;
                                    scalarValue9 = intermediateValue71;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    scalarValue8 = intermediateValue55;
                                    scalarValue9 = intermediateValue56;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    scalarValue8 = intermediateValue71;
                                    scalarValue9 = intermediateValue72;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue55;
                            branchMergedValue5 = intermediateValue54;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue = intermediateValue70;
                            branchMergedValue6 = intermediateValue71;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue56;
                            branchMergedValue5 = intermediateValue55;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue = intermediateValue71;
                            branchMergedValue6 = intermediateValue72;
#endif
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            branchMergedValue = scalarValue6;
                            branchMergedValue5 = scalarValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue = scalarValue5;
                            branchMergedValue6 = scalarValue6;
#endif
                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue42 = branchMergedValue;
                        intermediateValue32 = branchMergedValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue31 = branchMergedValue;
                        intermediateValue48 = branchMergedValue6;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue43 = branchMergedValue;
                        intermediateValue33 = branchMergedValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue32 = branchMergedValue;
                        intermediateValue49 = branchMergedValue6;
#endif
                        uint sumValue19 = scalarValue7 + 1u;
                        if (sumValue19 == clampedValue6)
                        {
                            break;
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            scalarValue5 = intermediateValue32;
                            scalarValue6 = intermediateValue42;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            scalarValue5 = intermediateValue31;
                            scalarValue6 = intermediateValue48;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            scalarValue5 = intermediateValue33;
                            scalarValue6 = intermediateValue43;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            scalarValue5 = intermediateValue32;
                            scalarValue6 = intermediateValue49;
#endif
                            scalarValue7 = sumValue19;
                            continue;
                        }
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue31 = intermediateValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue32 = intermediateValue33;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue31 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue30 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue32 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue46;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue52;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue47;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue53;
#endif
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
                    float scalarValue12 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue21 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue1))) - ((sqrt(1.0f - (scalarValue12 * scalarValue12)) / scalarValue12) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue22 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue1)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue23 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue3, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue2, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue1)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    uint comparisonValue8 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue1 = comparisonValue8 >> 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue14;
#endif
                    if ((multiplyAddValue23 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue22 >= 0.0f) && (multiplyAddValue22 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue23 >= 0.0f)))
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue59;
                        float intermediateValue90;
                        uint intermediateValue91;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue39;
                        float intermediateValue117;
                        uint intermediateValue118;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue59;
                        float intermediateValue91;
                        uint intermediateValue92;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue39;
                        float intermediateValue118;
                        uint intermediateValue119;
#endif
                        float scalarValue13 = 0.0f;
                        uint scalarValue14 = 0u;
                        for (;;)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue90 = scalarValue13;
                            intermediateValue91 = 0u;
                            float intermediateValue124;
                            float productValue131;
                            float productValue132;
                            bool comparisonValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue117 = scalarValue13;
                            intermediateValue118 = 0u;
                            float intermediateValue140;
                            float productValue156;
                            float productValue157;
                            bool comparisonValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue91 = scalarValue13;
                            intermediateValue92 = 0u;
                            float intermediateValue125;
                            float productValue133;
                            float productValue134;
                            bool comparisonValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue118 = scalarValue13;
                            intermediateValue119 = 0u;
                            float intermediateValue141;
                            float productValue158;
                            float productValue159;
                            bool comparisonValue24;
#endif
                            for (;;)
                            {
                                float productValue58 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                productValue131 = (productValue58 * (float(int(intermediateValue91 - bitwiseValue1)) + 0.5f)) + multiplyAddValue22;
                                productValue132 = (productValue58 * (float(int(scalarValue14 - bitwiseValue1)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue27 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                productValue156 = (productValue58 * (float(int(intermediateValue118 - bitwiseValue1)) + 0.5f)) + multiplyAddValue22;
                                productValue157 = (productValue58 * (float(int(scalarValue14 - bitwiseValue1)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue24 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                productValue133 = (productValue58 * (float(int(intermediateValue92 - bitwiseValue1)) + 0.5f)) + multiplyAddValue22;
                                productValue134 = (productValue58 * (float(int(scalarValue14 - bitwiseValue1)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue27 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                productValue158 = (productValue58 * (float(int(intermediateValue119 - bitwiseValue1)) + 0.5f)) + multiplyAddValue22;
                                productValue159 = (productValue58 * (float(int(scalarValue14 - bitwiseValue1)) + 0.5f)) + multiplyAddValue23;
                                comparisonValue24 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#endif
                                float branchMergedValue2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if (comparisonValue27)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                if (comparisonValue24)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue131, productValue132, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue156, productValue157, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue133, productValue134, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue158, productValue159, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue131, productValue132, dotProductValue2));
                                    float productValue59 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue131) + 0.5f);
                                    float comparisonValue9 = (vectorValue.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue10 = (vectorValue.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue11 = ((((vectorValue.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue10) * productValue59) + comparisonValue10;
                                    branchMergedValue2 = (((((((vectorValue.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue9) * productValue59) + comparisonValue9) - comparisonValue11) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue132) + 0.5f)) + comparisonValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue156, productValue157, dotProductValue2));
                                    float productValue196 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue156) + 0.5f);
                                    float comparisonValue70 = (vectorValue2.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue71 = (vectorValue2.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue72 = ((((vectorValue2.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue71) * productValue196) + comparisonValue71;
                                    branchMergedValue2 = (((((((vectorValue2.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue70) * productValue196) + comparisonValue70) - comparisonValue72) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue157) + 0.5f)) + comparisonValue72;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue4 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue133, productValue134, dotProductValue2));
                                    float productValue258 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue133) + 0.5f);
                                    float comparisonValue97 = (vectorValue4.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue98 = (vectorValue4.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue99 = ((((vectorValue4.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue98) * productValue258) + comparisonValue98;
                                    branchMergedValue2 = (((((((vectorValue4.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue97) * productValue258) + comparisonValue97) - comparisonValue99) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue134) + 0.5f)) + comparisonValue99;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue158, productValue159, dotProductValue2));
                                    float productValue276 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue158) + 0.5f);
                                    float comparisonValue112 = (vectorValue6.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue113 = (vectorValue6.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue114 = ((((vectorValue6.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue113) * productValue276) + comparisonValue113;
                                    branchMergedValue2 = (((((((vectorValue6.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue112) * productValue276) + comparisonValue112) - comparisonValue114) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue159) + 0.5f)) + comparisonValue114;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue124 = branchMergedValue2;
                                sumValue59 = intermediateValue124 + intermediateValue90;
                                uint sumValue20 = intermediateValue91 + 1u;
                                if (int(sumValue20) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue140 = branchMergedValue2;
                                sumValue39 = intermediateValue140 + intermediateValue117;
                                uint sumValue129 = intermediateValue118 + 1u;
                                if (int(sumValue129) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue125 = branchMergedValue2;
                                sumValue59 = intermediateValue125 + intermediateValue91;
                                uint sumValue166 = intermediateValue92 + 1u;
                                if (int(sumValue166) < int(comparisonValue8))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue141 = branchMergedValue2;
                                sumValue39 = intermediateValue141 + intermediateValue118;
                                uint sumValue180 = intermediateValue119 + 1u;
                                if (int(sumValue180) < int(comparisonValue8))
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue90 = sumValue59;
                                    intermediateValue91 = sumValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue117 = sumValue39;
                                    intermediateValue118 = sumValue129;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue91 = sumValue59;
                                    intermediateValue92 = sumValue166;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue118 = sumValue39;
                                    intermediateValue119 = sumValue180;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue21 = scalarValue14 + 1u;
                            if (int(sumValue21) < int(comparisonValue8))
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue13 = sumValue59;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue13 = sumValue39;
#endif
                                scalarValue14 = sumValue21;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue9 = sumValue59 / float(int(comparisonValue8 * comparisonValue8));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue14 = sumValue39 / float(int(comparisonValue8 * comparisonValue8));
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue9 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue14 = 1.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue46 = branchMergedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue52 = branchMergedValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue47 = branchMergedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue53 = branchMergedValue14;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue46 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue52 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue47 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue53 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue57;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue73;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float intermediateValue58;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float intermediateValue74;
#endif
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
                    float multiplyAddValue24 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue15 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue25 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue24) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue15 * scalarValue15)) / scalarValue15) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue26 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue24) * 0.5f) + 0.5f;
                    float multiplyAddValue27 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue3, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue2, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue1)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue24) * 0.5f);
                    uint comparisonValue12 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue15 = uint(int(comparisonValue12) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue84;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue97;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue85;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue98;
#endif
                    if (int(comparisonValue12) > int(0u))
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue61;
                        float intermediateValue105;
                        uint intermediateValue106;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue41;
                        float intermediateValue128;
                        uint intermediateValue129;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        float sumValue61;
                        float intermediateValue106;
                        uint intermediateValue107;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        float sumValue41;
                        float intermediateValue129;
                        uint intermediateValue130;
#endif
                        float scalarValue16 = 0.0f;
                        uint scalarValue17 = 0u;
                        for (;;)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue105 = scalarValue16;
                            intermediateValue106 = 0u;
                            float intermediateValue137;
                            float4 intermediateValue107;
                            float productValue136;
                            float productValue137;
                            bool comparisonValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue128 = scalarValue16;
                            intermediateValue129 = 0u;
                            float intermediateValue166;
                            float4 intermediateValue130;
                            float productValue161;
                            float productValue162;
                            bool comparisonValue34;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue106 = scalarValue16;
                            intermediateValue107 = 0u;
                            float intermediateValue138;
                            float4 intermediateValue108;
                            float productValue138;
                            float productValue139;
                            bool comparisonValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue129 = scalarValue16;
                            intermediateValue130 = 0u;
                            float intermediateValue167;
                            float4 intermediateValue131;
                            float productValue163;
                            float productValue164;
                            bool comparisonValue34;
#endif
                            for (;;)
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue107 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue136 = (multiplyAddValue26 + ((float(int(intermediateValue106 - quotientValue15)) + 0.5f) * intermediateValue107.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue137 = (multiplyAddValue27 + (intermediateValue107.x * (float(int(scalarValue17 - quotientValue15)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue31 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue31)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue130 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue161 = (multiplyAddValue26 + ((float(int(intermediateValue129 - quotientValue15)) + 0.5f) * intermediateValue130.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue162 = (multiplyAddValue27 + (intermediateValue130.x * (float(int(scalarValue17 - quotientValue15)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue34 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue4;
                                if (comparisonValue34)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue108 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue138 = (multiplyAddValue26 + ((float(int(intermediateValue107 - quotientValue15)) + 0.5f) * intermediateValue108.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue139 = (multiplyAddValue27 + (intermediateValue108.x * (float(int(scalarValue17 - quotientValue15)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue31 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue31)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue131 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue163 = (multiplyAddValue26 + ((float(int(intermediateValue130 - quotientValue15)) + 0.5f) * intermediateValue131.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue164 = (multiplyAddValue27 + (intermediateValue131.x * (float(int(scalarValue17 - quotientValue15)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue34 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue4;
                                if (comparisonValue34)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue136, productValue137, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue161, productValue162, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue138, productValue139, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue163, productValue164, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue136, productValue137, dotProductValue3));
                                    float productValue60 = frac((productValue136 * intermediateValue107.z) + 0.5f);
                                    float comparisonValue13 = (vectorValue1.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue14 = (vectorValue1.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue15 = ((((vectorValue1.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue14) * productValue60) + comparisonValue14;
                                    branchMergedValue3 = (((((((vectorValue1.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue13) * productValue60) + comparisonValue13) - comparisonValue15) * frac((productValue137 * intermediateValue107.z) + 0.5f)) + comparisonValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue3 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue161, productValue162, dotProductValue3));
                                    float productValue197 = frac((productValue161 * intermediateValue130.z) + 0.5f);
                                    float comparisonValue73 = (vectorValue3.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue74 = (vectorValue3.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue75 = ((((vectorValue3.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue74) * productValue197) + comparisonValue74;
                                    branchMergedValue4 = (((((((vectorValue3.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue73) * productValue197) + comparisonValue73) - comparisonValue75) * frac((productValue162 * intermediateValue130.z) + 0.5f)) + comparisonValue75;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue138, productValue139, dotProductValue3));
                                    float productValue259 = frac((productValue138 * intermediateValue108.z) + 0.5f);
                                    float comparisonValue100 = (vectorValue5.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue101 = (vectorValue5.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue102 = ((((vectorValue5.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue101) * productValue259) + comparisonValue101;
                                    branchMergedValue3 = (((((((vectorValue5.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue100) * productValue259) + comparisonValue100) - comparisonValue102) * frac((productValue139 * intermediateValue108.z) + 0.5f)) + comparisonValue102;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float4 vectorValue7 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue163, productValue164, dotProductValue3));
                                    float productValue277 = frac((productValue163 * intermediateValue131.z) + 0.5f);
                                    float comparisonValue115 = (vectorValue7.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue116 = (vectorValue7.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                    float comparisonValue117 = ((((vectorValue7.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue116) * productValue277) + comparisonValue116;
                                    branchMergedValue4 = (((((((vectorValue7.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue115) * productValue277) + comparisonValue115) - comparisonValue117) * frac((productValue164 * intermediateValue131.z) + 0.5f)) + comparisonValue117;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue137 = branchMergedValue3;
                                sumValue61 = intermediateValue137 + intermediateValue105;
                                uint sumValue22 = intermediateValue106 + 1u;
                                if (sumValue22 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue166 = branchMergedValue4;
                                sumValue41 = intermediateValue166 + intermediateValue128;
                                uint sumValue130 = intermediateValue129 + 1u;
                                if (sumValue130 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue138 = branchMergedValue3;
                                sumValue61 = intermediateValue138 + intermediateValue106;
                                uint sumValue167 = intermediateValue107 + 1u;
                                if (sumValue167 == comparisonValue12)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue167 = branchMergedValue4;
                                sumValue41 = intermediateValue167 + intermediateValue129;
                                uint sumValue181 = intermediateValue130 + 1u;
                                if (sumValue181 == comparisonValue12)
#endif
                                {
                                    break;
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue105 = sumValue61;
                                    intermediateValue106 = sumValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue128 = sumValue41;
                                    intermediateValue129 = sumValue130;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue106 = sumValue61;
                                    intermediateValue107 = sumValue167;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue129 = sumValue41;
                                    intermediateValue130 = sumValue181;
#endif
                                    continue;
                                }
                            }
                            uint sumValue23 = scalarValue17 + 1u;
                            if (sumValue23 == comparisonValue12)
                            {
                                break;
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue16 = sumValue61;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue16 = sumValue41;
#endif
                                scalarValue17 = sumValue23;
                                continue;
                            }
                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue84 = sumValue61;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue97 = sumValue41;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue85 = sumValue61;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue98 = sumValue41;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue84 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue97 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue85 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue98 = 0.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float quotientValue16 = intermediateValue84 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue11;
                    if (quotientValue16 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float quotientValue21 = intermediateValue97 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue16;
                    if (quotientValue21 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float quotientValue30 = intermediateValue85 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue11;
                    if (quotientValue30 < 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float quotientValue33 = intermediateValue98 / float(int(comparisonValue12 * comparisonValue12));
                    float branchMergedValue16;
                    if (quotientValue33 < 1.0f)
#endif
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        branchMergedValue11 = min(1.0f, max(quotientValue16, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        branchMergedValue16 = min(1.0f, max(quotientValue21, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        branchMergedValue11 = min(1.0f, max(quotientValue30, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        branchMergedValue16 = min(1.0f, max(quotientValue33, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue11 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue16 = 1.0f;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue57 = branchMergedValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue73 = branchMergedValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue58 = branchMergedValue11;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue74 = branchMergedValue16;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue57 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue73 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue58 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue74 = 1.0f;
#endif
                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float scalarValue18 = min(intermediateValue31, min(intermediateValue46, intermediateValue57));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float scalarValue61 = min(intermediateValue30, min(intermediateValue52, intermediateValue73));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                float scalarValue102 = min(intermediateValue32, min(intermediateValue47, intermediateValue58));
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                float scalarValue115 = min(intermediateValue31, min(intermediateValue53, intermediateValue74));
#endif
                float productValue62 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue7 = clamp((sumValue3 - productValue62) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue62), 0.0f, 1.0f);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue61 = (((clampedValue7 * clampedValue7) * (1.0f - scalarValue18)) * (3.0f - (clampedValue7 * 2.0f))) + scalarValue18;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue54 = (((clampedValue7 * clampedValue7) * (1.0f - scalarValue61)) * (3.0f - (clampedValue7 * 2.0f))) + scalarValue61;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue63 = (((clampedValue7 * clampedValue7) * (1.0f - scalarValue102)) * (3.0f - (clampedValue7 * 2.0f))) + scalarValue102;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue56 = (((clampedValue7 * clampedValue7) * (1.0f - scalarValue115)) * (3.0f - (clampedValue7 * 2.0f))) + scalarValue115;
#endif
            }
            else
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue61 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue54 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                productValue63 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                productValue56 = 1.0f;
#endif
            }
            float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
            float productValue64 = inverseLengthValue8 * multiplyAddValue28;
            float productValue65 = inverseLengthValue8 * multiplyAddValue29;
            float productValue66 = inverseLengthValue8 * multiplyAddValue30;
            float productValue67 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue2);
            float productValue68 = productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue69 = productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue70 = productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue64, productValue65, productValue66)), 0.0f);
            float dotProductValue5 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue7, sumValue8, sumValue9)), 0.0f);
            float sumValue24 = productValue64 - quotientValue8;
            float sumValue25 = productValue65 - quotientValue9;
            float sumValue26 = productValue66 - quotientValue10;
            float inverseLengthValue9 = rsqrt(dot(float3(sumValue24, sumValue25, sumValue26), float3(sumValue24, sumValue25, sumValue26)));
            float productValue71 = inverseLengthValue9 * sumValue24;
            float productValue72 = inverseLengthValue9 * sumValue25;
            float productValue73 = inverseLengthValue9 * sumValue26;
            float dotProductValue6 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue71, productValue72, productValue73)), 0.0f);
            float productValue74 = 1.0f - ((dotProductValue6 * dotProductValue6) * 0.9375f);
            float clampedValue8 = clamp(1.0f - max(dot(float3(sumValue7, sumValue8, sumValue9), float3(productValue71, productValue72, productValue73)), 0.0f), 0.0f, 1.0f);
            float productValue75 = clampedValue8 * clampedValue8;
            float productValue76 = (productValue75 * productValue75) * (clampedValue8 * 0.959999978542327880859375f);
            float sumValue27 = 0.959999978542327880859375f - productValue76;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue77 = dotProductValue4 * productValue61;
            float productValue78 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue77 * 0.3183098733425140380859375f);
            float quotientValue17 = (((((dotProductValue5 / ((dotProductValue5 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue74 * productValue74))) * (dotProductValue4 / ((dotProductValue4 * 0.875f) + 0.12510000169277191162109375f))) * (productValue76 + 0.039999999105930328369140625f)) / (((dotProductValue4 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f)) * productValue77;
            intermediateValue10 = (quotientValue17 * productValue68) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue12 = (quotientValue17 * productValue69) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue14 = (quotientValue17 * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue16 = ((productValue78 * exponentialValue) * productValue68) * sumValue27;
            intermediateValue18 = ((productValue78 * exponentialValue1) * productValue69) * sumValue27;
            intermediateValue20 = ((productValue78 * exponentialValue2) * productValue70) * sumValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue198 = dotProductValue4 * productValue54;
            float productValue199 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue198 * 0.3183098733425140380859375f);
            float quotientValue22 = (((((dotProductValue5 / ((dotProductValue5 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue74 * productValue74))) * (dotProductValue4 / ((dotProductValue4 * 0.875f) + 0.12510000169277191162109375f))) * (productValue76 + 0.039999999105930328369140625f)) / (((dotProductValue4 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f)) * productValue198;
            intermediateValue15 = (quotientValue22 * productValue68) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue16 = (quotientValue22 * productValue69) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue17 = (quotientValue22 * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue18 = ((productValue199 * exponentialValue) * productValue68) * sumValue27;
            intermediateValue19 = ((productValue199 * exponentialValue1) * productValue69) * sumValue27;
            intermediateValue20 = ((productValue199 * exponentialValue2) * productValue70) * sumValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float productValue260 = dotProductValue4 * productValue63;
            float productValue261 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue260 * 0.3183098733425140380859375f);
            float quotientValue31 = (((((dotProductValue5 / ((dotProductValue5 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue74 * productValue74))) * (dotProductValue4 / ((dotProductValue4 * 0.875f) + 0.12510000169277191162109375f))) * (productValue76 + 0.039999999105930328369140625f)) / (((dotProductValue4 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f)) * productValue260;
            intermediateValue11 = (quotientValue31 * productValue68) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue13 = (quotientValue31 * productValue69) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue15 = (quotientValue31 * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue17 = ((productValue261 * exponentialValue) * productValue68) * sumValue27;
            intermediateValue19 = ((productValue261 * exponentialValue1) * productValue69) * sumValue27;
            intermediateValue21 = ((productValue261 * exponentialValue2) * productValue70) * sumValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float productValue278 = dotProductValue4 * productValue56;
            float productValue279 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue278 * 0.3183098733425140380859375f);
            float quotientValue34 = (((((dotProductValue5 / ((dotProductValue5 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue74 * productValue74))) * (dotProductValue4 / ((dotProductValue4 * 0.875f) + 0.12510000169277191162109375f))) * (productValue76 + 0.039999999105930328369140625f)) / (((dotProductValue4 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f)) * productValue278;
            intermediateValue16 = (quotientValue34 * productValue68) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue17 = (quotientValue34 * productValue69) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue18 = (quotientValue34 * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
            intermediateValue19 = ((productValue279 * exponentialValue) * productValue68) * sumValue27;
            intermediateValue20 = ((productValue279 * exponentialValue1) * productValue69) * sumValue27;
            intermediateValue21 = ((productValue279 * exponentialValue2) * productValue70) * sumValue27;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue40;
        float productValue41;
        float productValue42;
        float productValue43;
        float productValue44;
        float productValue45;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue76 = conditionValue2 ? productValue33 : varyingTexCoord3.x;
            float comparisonValue77 = conditionValue2 ? productValue34 : varyingTexCoord3.y;
            float comparisonValue78 = conditionValue2 ? productValue35 : varyingTexCoord3.z;
            float productValue200 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
            float productValue201 = productValue200 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue26;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
            {
                intermediateValue26 = 0.0f;
            }
            else
            {
                float branchMergedValue12;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                {
                    branchMergedValue12 = 1.0f;
                }
                else
                {
                    branchMergedValue12 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue26 = branchMergedValue12;
            }
            float quotientValue23 = min(floor(min(max((productValue201 + multiplyAddValue4) / (productValue201 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue24 = min(floor(min(max((productValue200 + multiplyAddValue5) / (productValue200 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue38;
            bool intermediateValue40;
            uint intermediateValue41;
            if ((intermediateValue26 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue24 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue23 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue26 < 0.0f) || ((quotientValue23 < 0.0f) || (quotientValue24 < 0.0f))))))
            {
                intermediateValue38 = intermediateValue39;
                intermediateValue40 = false;
                intermediateValue41 = 0u;
            }
            else
            {
                uint scalarValue62 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue202 = uint(int(((quotientValue24 + (intermediateValue26 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue23)) * scalarValue62;
                intermediateValue38 = productValue202;
                intermediateValue40 = true;
                intermediateValue41 = productValue202 + scalarValue62;
            }
            float intermediateValue57;
            float intermediateValue59;
            float intermediateValue61;
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            if (intermediateValue40 && (int(intermediateValue38) < int(intermediateValue41)))
            {
                float dotProductValue10;
                float sumValue45;
                float quotientValue18;
                float intermediateValue142;
                float intermediateValue143;
                float intermediateValue144;
                float intermediateValue145;
                float intermediateValue58;
                float intermediateValue60;
                float intermediateValue62;
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float scalarValue63 = 0.0f;
                float scalarValue64 = 0.0f;
                float scalarValue65 = 0.0f;
                float scalarValue66 = 0.0f;
                float scalarValue67 = 0.0f;
                float scalarValue68 = 0.0f;
                uint scalarValue69 = intermediateValue38;
                uint loadedBufferValue3;
                for (;;)
                {
                    loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue69).x)));
                    if (int(loadedBufferValue3) < int(0u))
                    {
                        intermediateValue58 = scalarValue63;
                        intermediateValue60 = scalarValue64;
                        intermediateValue62 = scalarValue65;
                        intermediateValue64 = scalarValue66;
                        intermediateValue66 = scalarValue67;
                        intermediateValue68 = scalarValue68;
                        break;
                    }
                    else
                    {
                        uint productValue203 = loadedBufferValue3 * 32u;
                        float4 loadedBufferValue36 = asfloat(uint4(rdLoad_zLights(productValue203).x, rdLoad_zLights(productValue203 + 1u).x, rdLoad_zLights(productValue203 + 2u).x, rdLoad_zLights(productValue203 + 3u).x));
                        float scalarValue70 = loadedBufferValue36.x;
                        float scalarValue71 = loadedBufferValue36.y;
                        float scalarValue72 = loadedBufferValue36.z;
                        float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                        float multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                        float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                        float inverseLengthValue13 = rsqrt(dot(float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41), float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41)));
                        float productValue204 = inverseLengthValue13 * multiplyAddValue39;
                        float productValue205 = inverseLengthValue13 * multiplyAddValue40;
                        float productValue206 = inverseLengthValue13 * multiplyAddValue41;
                        dotProductValue10 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue204, productValue205, productValue206)), 0.0f);
                        float dotProductValue14 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue7, sumValue8, sumValue9)), 0.0f);
                        float sumValue131 = productValue204 - quotientValue8;
                        float sumValue132 = productValue205 - quotientValue9;
                        float sumValue133 = productValue206 - quotientValue10;
                        float inverseLengthValue14 = rsqrt(dot(float3(sumValue131, sumValue132, sumValue133), float3(sumValue131, sumValue132, sumValue133)));
                        float productValue207 = inverseLengthValue14 * sumValue131;
                        float productValue208 = inverseLengthValue14 * sumValue132;
                        float productValue209 = inverseLengthValue14 * sumValue133;
                        float dotProductValue15 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue207, productValue208, productValue209)), 0.0f);
                        float productValue210 = 1.0f - ((dotProductValue15 * dotProductValue15) * 0.9375f);
                        float clampedValue15 = clamp(1.0f - max(dot(float3(sumValue7, sumValue8, sumValue9), float3(productValue207, productValue208, productValue209)), 0.0f), 0.0f, 1.0f);
                        float productValue211 = clampedValue15 * clampedValue15;
                        float productValue212 = (productValue211 * productValue211) * (clampedValue15 * 0.959999978542327880859375f);
                        sumValue45 = 0.959999978542327880859375f - productValue212;
                        quotientValue18 = ((((dotProductValue14 / ((dotProductValue14 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue210 * productValue210))) * (dotProductValue10 / ((dotProductValue10 * 0.875f) + 0.12510000169277191162109375f))) * (productValue212 + 0.039999999105930328369140625f)) / (((dotProductValue10 * 4.0f) * dotProductValue14) + 9.9999997473787516355514526367188e-05f);
                        float sumValue134 = scalarValue70 - varyingTexCoord3.x;
                        float sumValue135 = scalarValue71 - varyingTexCoord3.y;
                        float sumValue136 = scalarValue72 - varyingTexCoord3.z;
                        float productValue163;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue137 = (abs(sumValue135) + abs(sumValue134)) + abs(sumValue136);
                            productValue163 = sumValue137 * sumValue137;
                        }
                        else
                        {
                            productValue163 = dot(float3(sumValue134, sumValue135, sumValue136), float3(sumValue134, sumValue135, sumValue136));
                        }
                        float scalarValue73 = loadedBufferValue36.w;
                        float productValue213 = scalarValue73 * scalarValue73;
                        float branchMergedValue3;
                        float branchMergedValue8;
                        float branchMergedValue9;
                        float branchMergedValue10;
                        if (!(productValue163 >= productValue213))
                        {
                            float intermediateValue146;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue214 = (loadedBufferValue3 * 32u) + 8u;
                                float4 loadedBufferValue37 = asfloat(uint4(rdLoad_zLights(productValue214).x, rdLoad_zLights(productValue214 + 1u).x, rdLoad_zLights(productValue214 + 2u).x, rdLoad_zLights(productValue214 + 3u).x));
                                uint productValue215 = (loadedBufferValue3 * 32u) + 12u;
                                float4 loadedBufferValue38 = asfloat(uint4(rdLoad_zLights(productValue215).x, rdLoad_zLights(productValue215 + 1u).x, rdLoad_zLights(productValue215 + 2u).x, rdLoad_zLights(productValue215 + 3u).x));
                                uint productValue216 = (loadedBufferValue3 * 32u) + 16u;
                                float4 loadedBufferValue39 = asfloat(uint4(rdLoad_zLights(productValue216).x, rdLoad_zLights(productValue216 + 1u).x, rdLoad_zLights(productValue216 + 2u).x, rdLoad_zLights(productValue216 + 3u).x));
                                uint productValue217 = (loadedBufferValue3 * 32u) + 20u;
                                float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue217).x, rdLoad_zLights(productValue217 + 1u).x, rdLoad_zLights(productValue217 + 2u).x, rdLoad_zLights(productValue217 + 3u).x));
                                uint productValue218 = (loadedBufferValue3 * 32u) + 24u;
                                float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue218).x, rdLoad_zLights(productValue218 + 1u).x, rdLoad_zLights(productValue218 + 2u).x, rdLoad_zLights(productValue218 + 3u).x));
                                uint productValue219 = (loadedBufferValue3 * 32u) + 28u;
                                float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue219).x, rdLoad_zLights(productValue219 + 1u).x, rdLoad_zLights(productValue219 + 2u).x, rdLoad_zLights(productValue219 + 3u).x));
                                float sumValue138 = comparisonValue76 - scalarValue70;
                                float sumValue139 = comparisonValue77 - scalarValue71;
                                float sumValue140 = comparisonValue78 - scalarValue72;
                                float scalarValue74 = abs(sumValue138);
                                float scalarValue75 = abs(sumValue139);
                                float scalarValue76 = abs(sumValue140);
                                uint comparisonValue54;
                                if ((scalarValue74 >= scalarValue75) && (scalarValue74 >= scalarValue76))
                                {
                                    comparisonValue54 = uint(!(sumValue138 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue21;
                                    if (!(scalarValue75 >= scalarValue76))
                                    {
                                        branchMergedValue21 = (sumValue140 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue21 = (sumValue139 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue54 = branchMergedValue21;
                                }
                                float sumValue141 = (-0.0f) - sumValue138;
                                float intermediateValue217;
                                float intermediateValue218;
                                float intermediateValue219;
                                float intermediateValue220;
                                float sumValue117;
                                float intermediateValue221;
                                float intermediateValue222;
                                if (comparisonValue54 == 1u)
                                {
                                    intermediateValue217 = loadedBufferValue38.x;
                                    intermediateValue218 = loadedBufferValue38.y;
                                    intermediateValue219 = loadedBufferValue38.z;
                                    intermediateValue220 = loadedBufferValue38.w;
                                    sumValue117 = (-0.0f) - sumValue140;
                                    intermediateValue221 = sumValue139;
                                    intermediateValue222 = sumValue138;
                                }
                                else
                                {
                                    float branchMergedValue22;
                                    float branchMergedValue50;
                                    float branchMergedValue51;
                                    float branchMergedValue52;
                                    float branchMergedValue53;
                                    float branchMergedValue54;
                                    float branchMergedValue55;
                                    if (comparisonValue54 == 2u)
                                    {
                                        branchMergedValue22 = (-0.0f) - sumValue139;
                                        branchMergedValue50 = (-0.0f) - sumValue140;
                                        branchMergedValue51 = sumValue141;
                                        branchMergedValue52 = loadedBufferValue39.w;
                                        branchMergedValue53 = loadedBufferValue39.z;
                                        branchMergedValue54 = loadedBufferValue39.y;
                                        branchMergedValue55 = loadedBufferValue39.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue67;
                                        float branchMergedValue68;
                                        float branchMergedValue69;
                                        float branchMergedValue70;
                                        float branchMergedValue71;
                                        float branchMergedValue72;
                                        float branchMergedValue73;
                                        if (comparisonValue54 == 3u)
                                        {
                                            branchMergedValue67 = sumValue139;
                                            branchMergedValue68 = sumValue140;
                                            branchMergedValue69 = sumValue141;
                                            branchMergedValue70 = loadedBufferValue40.w;
                                            branchMergedValue71 = loadedBufferValue40.z;
                                            branchMergedValue72 = loadedBufferValue40.y;
                                            branchMergedValue73 = loadedBufferValue40.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue78;
                                            float branchMergedValue79;
                                            float branchMergedValue80;
                                            float branchMergedValue81;
                                            float branchMergedValue82;
                                            float branchMergedValue83;
                                            float branchMergedValue84;
                                            if (comparisonValue54 == 4u)
                                            {
                                                branchMergedValue78 = (-0.0f) - sumValue140;
                                                branchMergedValue79 = sumValue139;
                                                branchMergedValue80 = sumValue141;
                                                branchMergedValue81 = loadedBufferValue41.w;
                                                branchMergedValue82 = loadedBufferValue41.z;
                                                branchMergedValue83 = loadedBufferValue41.y;
                                                branchMergedValue84 = loadedBufferValue41.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue79 = comparisonValue54 == 5u;
                                                branchMergedValue78 = comparisonValue79 ? sumValue140 : sumValue141;
                                                branchMergedValue79 = sumValue139;
                                                branchMergedValue80 = comparisonValue79 ? sumValue138 : sumValue140;
                                                branchMergedValue81 = comparisonValue79 ? loadedBufferValue42.w : loadedBufferValue37.w;
                                                branchMergedValue82 = comparisonValue79 ? loadedBufferValue42.z : loadedBufferValue37.z;
                                                branchMergedValue83 = comparisonValue79 ? loadedBufferValue42.y : loadedBufferValue37.y;
                                                branchMergedValue84 = comparisonValue79 ? loadedBufferValue42.x : loadedBufferValue37.x;
                                            }
                                            branchMergedValue67 = branchMergedValue78;
                                            branchMergedValue68 = branchMergedValue79;
                                            branchMergedValue69 = branchMergedValue80;
                                            branchMergedValue70 = branchMergedValue81;
                                            branchMergedValue71 = branchMergedValue82;
                                            branchMergedValue72 = branchMergedValue83;
                                            branchMergedValue73 = branchMergedValue84;
                                        }
                                        branchMergedValue22 = branchMergedValue67;
                                        branchMergedValue50 = branchMergedValue68;
                                        branchMergedValue51 = branchMergedValue69;
                                        branchMergedValue52 = branchMergedValue70;
                                        branchMergedValue53 = branchMergedValue71;
                                        branchMergedValue54 = branchMergedValue72;
                                        branchMergedValue55 = branchMergedValue73;
                                    }
                                    intermediateValue217 = branchMergedValue55;
                                    intermediateValue218 = branchMergedValue54;
                                    intermediateValue219 = branchMergedValue53;
                                    intermediateValue220 = branchMergedValue52;
                                    sumValue117 = branchMergedValue51;
                                    intermediateValue221 = branchMergedValue50;
                                    intermediateValue222 = branchMergedValue22;
                                }
                                float branchMergedValue18;
                                if ((intermediateValue219 == 0.0f) && (intermediateValue220 == 0.0f))
                                {
                                    branchMergedValue18 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue42 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue222, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue221, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue15 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
                                    float sumValue142 = (-0.0f) - sumValue139;
                                    float sumValue143 = (-0.0f) - sumValue140;
                                    float inverseLengthValue16 = rsqrt(dot(float3(sumValue141, sumValue142, sumValue143), float3(sumValue141, sumValue142, sumValue143)));
                                    float dotProductValue16 = min(max(dot(float3(inverseLengthValue16 * sumValue141, inverseLengthValue16 * sumValue142, inverseLengthValue16 * sumValue143), float3(inverseLengthValue15 * productValue14, inverseLengthValue15 * productValue15, inverseLengthValue15 * productValue16)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue144 = intermediateValue219 - intermediateValue217;
                                    float productValue220 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue144;
                                    float quotientValue25 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue26 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue145 = intermediateValue220 - intermediateValue218;
                                    float productValue221 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue145;
                                    float sampledTextureValue11 = float(pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue222, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue221, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue42) * 0.5f) + 0.5f) * productValue220) + 0.5f) / productValue220) * sumValue144) + intermediateValue217, quotientValue25 + intermediateValue217), intermediateValue219 - quotientValue25), min(max((((floor((0.5f - (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue222, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue221, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue42) * 0.5f)) * productValue221) + 0.5f) / productValue221) * sumValue145) + intermediateValue218, quotientValue26 + intermediateValue218), intermediateValue220 - quotientValue26)), 0.0f).x >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue222, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue221, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue220, 1.0f)) * (((sqrt(1.0f - (dotProductValue16 * dotProductValue16)) / dotProductValue16) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue42));
                                    branchMergedValue18 = sampledTextureValue11;
                                }
                                intermediateValue146 = branchMergedValue18;
                            }
                            else
                            {
                                intermediateValue146 = 1.0f;
                            }
                            uint productValue222 = (loadedBufferValue3 * 32u) + 4u;
                            float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue222).x, rdLoad_zLights(productValue222 + 1u).x, rdLoad_zLights(productValue222 + 2u).x, rdLoad_zLights(productValue222 + 3u).x));
                            float quotientValue27 = productValue163 / (productValue213 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue16 = clamp(1.0f - (quotientValue27 * quotientValue27), 0.0f, 1.0f);
                            float quotientValue28 = (clampedValue16 * clampedValue16) * (1.0f / max(productValue163, 0.100000001490116119384765625f));
                            float clampedValue18;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue17 = clamp(((1.0f - quotientValue28) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue18 = clamp((((clampedValue17 * clampedValue17) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue17 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue28;
                            }
                            else
                            {
                                clampedValue18 = quotientValue28;
                            }
                            float productValue223 = clampedValue18 * loadedBufferValue43.w;
                            branchMergedValue3 = productValue223 * loadedBufferValue43.x;
                            branchMergedValue8 = intermediateValue146;
                            branchMergedValue9 = productValue223 * loadedBufferValue43.z;
                            branchMergedValue10 = productValue223 * loadedBufferValue43.y;
                        }
                        else
                        {
                            branchMergedValue3 = 0.0f;
                            branchMergedValue8 = 1.0f;
                            branchMergedValue9 = 0.0f;
                            branchMergedValue10 = 0.0f;
                        }
                        intermediateValue142 = branchMergedValue3;
                        intermediateValue145 = branchMergedValue8;
                        intermediateValue144 = branchMergedValue9;
                        intermediateValue143 = branchMergedValue10;
                        float productValue224 = intermediateValue145 * dotProductValue10;
                        float productValue225 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue224 * 0.3183098733425140380859375f);
                        float productValue226 = (((productValue225 * exponentialValue) * sumValue45) * intermediateValue142) + scalarValue66;
                        float productValue227 = (((productValue225 * exponentialValue1) * sumValue45) * intermediateValue143) + scalarValue67;
                        float productValue228 = (((productValue225 * exponentialValue2) * sumValue45) * intermediateValue144) + scalarValue68;
                        float productValue229 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (productValue224 * quotientValue18);
                        float productValue230 = (productValue229 * intermediateValue142) + scalarValue63;
                        float productValue231 = (productValue229 * intermediateValue143) + scalarValue64;
                        float productValue232 = (productValue229 * intermediateValue144) + scalarValue65;
                        uint sumValue146 = scalarValue69 + 1u;
                        if (int(sumValue146) < int(intermediateValue41))
                        {
                            scalarValue63 = productValue230;
                            scalarValue64 = productValue231;
                            scalarValue65 = productValue232;
                            scalarValue66 = productValue226;
                            scalarValue67 = productValue227;
                            scalarValue68 = productValue228;
                            scalarValue69 = sumValue146;
                            continue;
                        }
                        else
                        {
                            intermediateValue58 = productValue230;
                            intermediateValue60 = productValue231;
                            intermediateValue62 = productValue232;
                            intermediateValue64 = productValue226;
                            intermediateValue66 = productValue227;
                            intermediateValue68 = productValue228;
                            break;
                        }
                    }
                }
                intermediateValue57 = intermediateValue58;
                intermediateValue59 = intermediateValue60;
                intermediateValue61 = intermediateValue62;
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
                intermediateValue67 = intermediateValue68;
            }
            else
            {
                intermediateValue57 = 0.0f;
                intermediateValue59 = 0.0f;
                intermediateValue61 = 0.0f;
                intermediateValue63 = 0.0f;
                intermediateValue65 = 0.0f;
                intermediateValue67 = 0.0f;
            }
            float sumValue147 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue40 = (sumValue147 * intermediateValue57) + intermediateValue15;
            productValue41 = (sumValue147 * intermediateValue59) + intermediateValue16;
            productValue42 = (sumValue147 * intermediateValue61) + intermediateValue17;
            productValue43 = (sumValue147 * intermediateValue63) + intermediateValue18;
            productValue44 = (sumValue147 * intermediateValue65) + intermediateValue19;
            productValue45 = (sumValue147 * intermediateValue67) + intermediateValue20;
        }
        else
        {
            productValue40 = intermediateValue15;
            productValue41 = intermediateValue16;
            productValue42 = intermediateValue17;
            productValue43 = intermediateValue18;
            productValue44 = intermediateValue19;
            productValue45 = intermediateValue20;
        }
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue42;
        float productValue43;
        float productValue44;
        float productValue45;
        float productValue46;
        float productValue47;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue76 = conditionValue2 ? productValue33 : varyingTexCoord3.x;
            float comparisonValue77 = conditionValue2 ? productValue34 : varyingTexCoord3.y;
            float comparisonValue78 = conditionValue2 ? productValue35 : varyingTexCoord3.z;
            float productValue200 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
            float productValue201 = productValue200 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue27;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
            {
                intermediateValue27 = 0.0f;
            }
            else
            {
                float branchMergedValue12;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                {
                    branchMergedValue12 = 1.0f;
                }
                else
                {
                    branchMergedValue12 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue27 = branchMergedValue12;
            }
            float quotientValue23 = min(floor(min(max((productValue201 + multiplyAddValue4) / (productValue201 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue24 = min(floor(min(max((productValue200 + multiplyAddValue5) / (productValue200 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue39;
            bool intermediateValue41;
            uint intermediateValue42;
            if ((intermediateValue27 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue24 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue23 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue27 < 0.0f) || ((quotientValue23 < 0.0f) || (quotientValue24 < 0.0f))))))
            {
                intermediateValue39 = intermediateValue40;
                intermediateValue41 = false;
                intermediateValue42 = 0u;
            }
            else
            {
                uint scalarValue62 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue280 = uint(int(((quotientValue24 + (intermediateValue27 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue23)) * scalarValue62;
                intermediateValue39 = productValue280;
                intermediateValue41 = true;
                intermediateValue42 = productValue280 + scalarValue62;
            }
            float intermediateValue58;
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            float intermediateValue66;
            float intermediateValue68;
            if (intermediateValue41 && (int(intermediateValue39) < int(intermediateValue42)))
            {
                float dotProductValue10;
                float sumValue45;
                float quotientValue18;
                float intermediateValue143;
                float intermediateValue144;
                float intermediateValue145;
                float intermediateValue146;
                float intermediateValue59;
                float intermediateValue61;
                float intermediateValue63;
                float intermediateValue65;
                float intermediateValue67;
                float intermediateValue69;
                float scalarValue63 = 0.0f;
                float scalarValue64 = 0.0f;
                float scalarValue65 = 0.0f;
                float scalarValue66 = 0.0f;
                float scalarValue67 = 0.0f;
                float scalarValue68 = 0.0f;
                uint scalarValue116 = intermediateValue39;
                uint loadedBufferValue3;
                for (;;)
                {
                    loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue116).x)));
                    if (int(loadedBufferValue3) < int(0u))
                    {
                        intermediateValue59 = scalarValue63;
                        intermediateValue61 = scalarValue64;
                        intermediateValue63 = scalarValue65;
                        intermediateValue65 = scalarValue66;
                        intermediateValue67 = scalarValue67;
                        intermediateValue69 = scalarValue68;
                        break;
                    }
                    else
                    {
                        uint productValue203 = loadedBufferValue3 * 32u;
                        float4 loadedBufferValue36 = asfloat(uint4(rdLoad_zLights(productValue203).x, rdLoad_zLights(productValue203 + 1u).x, rdLoad_zLights(productValue203 + 2u).x, rdLoad_zLights(productValue203 + 3u).x));
                        float scalarValue70 = loadedBufferValue36.x;
                        float scalarValue71 = loadedBufferValue36.y;
                        float scalarValue72 = loadedBufferValue36.z;
                        float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                        float multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                        float multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue72, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue71, scalarValue70 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                        float inverseLengthValue13 = rsqrt(dot(float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41), float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41)));
                        float productValue204 = inverseLengthValue13 * multiplyAddValue39;
                        float productValue205 = inverseLengthValue13 * multiplyAddValue40;
                        float productValue206 = inverseLengthValue13 * multiplyAddValue41;
                        dotProductValue10 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue204, productValue205, productValue206)), 0.0f);
                        float dotProductValue14 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue7, sumValue8, sumValue9)), 0.0f);
                        float sumValue131 = productValue204 - quotientValue8;
                        float sumValue132 = productValue205 - quotientValue9;
                        float sumValue133 = productValue206 - quotientValue10;
                        float inverseLengthValue14 = rsqrt(dot(float3(sumValue131, sumValue132, sumValue133), float3(sumValue131, sumValue132, sumValue133)));
                        float productValue207 = inverseLengthValue14 * sumValue131;
                        float productValue208 = inverseLengthValue14 * sumValue132;
                        float productValue209 = inverseLengthValue14 * sumValue133;
                        float dotProductValue15 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue207, productValue208, productValue209)), 0.0f);
                        float productValue210 = 1.0f - ((dotProductValue15 * dotProductValue15) * 0.9375f);
                        float clampedValue15 = clamp(1.0f - max(dot(float3(sumValue7, sumValue8, sumValue9), float3(productValue207, productValue208, productValue209)), 0.0f), 0.0f, 1.0f);
                        float productValue211 = clampedValue15 * clampedValue15;
                        float productValue212 = (productValue211 * productValue211) * (clampedValue15 * 0.959999978542327880859375f);
                        sumValue45 = 0.959999978542327880859375f - productValue212;
                        quotientValue18 = ((((dotProductValue14 / ((dotProductValue14 * 0.875f) + 0.12510000169277191162109375f)) * (0.01989436708390712738037109375f / (productValue210 * productValue210))) * (dotProductValue10 / ((dotProductValue10 * 0.875f) + 0.12510000169277191162109375f))) * (productValue212 + 0.039999999105930328369140625f)) / (((dotProductValue10 * 4.0f) * dotProductValue14) + 9.9999997473787516355514526367188e-05f);
                        float sumValue134 = scalarValue70 - varyingTexCoord3.x;
                        float sumValue135 = scalarValue71 - varyingTexCoord3.y;
                        float sumValue136 = scalarValue72 - varyingTexCoord3.z;
                        float productValue165;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue137 = (abs(sumValue135) + abs(sumValue134)) + abs(sumValue136);
                            productValue165 = sumValue137 * sumValue137;
                        }
                        else
                        {
                            productValue165 = dot(float3(sumValue134, sumValue135, sumValue136), float3(sumValue134, sumValue135, sumValue136));
                        }
                        float scalarValue73 = loadedBufferValue36.w;
                        float productValue213 = scalarValue73 * scalarValue73;
                        float branchMergedValue3;
                        float branchMergedValue8;
                        float branchMergedValue9;
                        float branchMergedValue10;
                        if (!(productValue165 >= productValue213))
                        {
                            float intermediateValue147;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue214 = (loadedBufferValue3 * 32u) + 8u;
                                float4 loadedBufferValue37 = asfloat(uint4(rdLoad_zLights(productValue214).x, rdLoad_zLights(productValue214 + 1u).x, rdLoad_zLights(productValue214 + 2u).x, rdLoad_zLights(productValue214 + 3u).x));
                                uint productValue215 = (loadedBufferValue3 * 32u) + 12u;
                                float4 loadedBufferValue38 = asfloat(uint4(rdLoad_zLights(productValue215).x, rdLoad_zLights(productValue215 + 1u).x, rdLoad_zLights(productValue215 + 2u).x, rdLoad_zLights(productValue215 + 3u).x));
                                uint productValue216 = (loadedBufferValue3 * 32u) + 16u;
                                float4 loadedBufferValue39 = asfloat(uint4(rdLoad_zLights(productValue216).x, rdLoad_zLights(productValue216 + 1u).x, rdLoad_zLights(productValue216 + 2u).x, rdLoad_zLights(productValue216 + 3u).x));
                                uint productValue217 = (loadedBufferValue3 * 32u) + 20u;
                                float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue217).x, rdLoad_zLights(productValue217 + 1u).x, rdLoad_zLights(productValue217 + 2u).x, rdLoad_zLights(productValue217 + 3u).x));
                                uint productValue218 = (loadedBufferValue3 * 32u) + 24u;
                                float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue218).x, rdLoad_zLights(productValue218 + 1u).x, rdLoad_zLights(productValue218 + 2u).x, rdLoad_zLights(productValue218 + 3u).x));
                                uint productValue219 = (loadedBufferValue3 * 32u) + 28u;
                                float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue219).x, rdLoad_zLights(productValue219 + 1u).x, rdLoad_zLights(productValue219 + 2u).x, rdLoad_zLights(productValue219 + 3u).x));
                                float sumValue138 = comparisonValue76 - scalarValue70;
                                float sumValue139 = comparisonValue77 - scalarValue71;
                                float sumValue140 = comparisonValue78 - scalarValue72;
                                float scalarValue74 = abs(sumValue138);
                                float scalarValue75 = abs(sumValue139);
                                float scalarValue76 = abs(sumValue140);
                                uint comparisonValue54;
                                if ((scalarValue74 >= scalarValue75) && (scalarValue74 >= scalarValue76))
                                {
                                    comparisonValue54 = uint(!(sumValue138 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue21;
                                    if (!(scalarValue75 >= scalarValue76))
                                    {
                                        branchMergedValue21 = (sumValue140 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue21 = (sumValue139 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue54 = branchMergedValue21;
                                }
                                float sumValue141 = (-0.0f) - sumValue138;
                                float intermediateValue218;
                                float intermediateValue219;
                                float intermediateValue220;
                                float intermediateValue221;
                                float sumValue117;
                                float intermediateValue222;
                                float intermediateValue223;
                                if (comparisonValue54 == 1u)
                                {
                                    intermediateValue218 = loadedBufferValue38.x;
                                    intermediateValue219 = loadedBufferValue38.y;
                                    intermediateValue220 = loadedBufferValue38.z;
                                    intermediateValue221 = loadedBufferValue38.w;
                                    sumValue117 = (-0.0f) - sumValue140;
                                    intermediateValue222 = sumValue139;
                                    intermediateValue223 = sumValue138;
                                }
                                else
                                {
                                    float branchMergedValue22;
                                    float branchMergedValue50;
                                    float branchMergedValue51;
                                    float branchMergedValue52;
                                    float branchMergedValue53;
                                    float branchMergedValue54;
                                    float branchMergedValue55;
                                    if (comparisonValue54 == 2u)
                                    {
                                        branchMergedValue22 = (-0.0f) - sumValue139;
                                        branchMergedValue50 = (-0.0f) - sumValue140;
                                        branchMergedValue51 = sumValue141;
                                        branchMergedValue52 = loadedBufferValue39.w;
                                        branchMergedValue53 = loadedBufferValue39.z;
                                        branchMergedValue54 = loadedBufferValue39.y;
                                        branchMergedValue55 = loadedBufferValue39.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue67;
                                        float branchMergedValue68;
                                        float branchMergedValue69;
                                        float branchMergedValue70;
                                        float branchMergedValue71;
                                        float branchMergedValue72;
                                        float branchMergedValue73;
                                        if (comparisonValue54 == 3u)
                                        {
                                            branchMergedValue67 = sumValue139;
                                            branchMergedValue68 = sumValue140;
                                            branchMergedValue69 = sumValue141;
                                            branchMergedValue70 = loadedBufferValue40.w;
                                            branchMergedValue71 = loadedBufferValue40.z;
                                            branchMergedValue72 = loadedBufferValue40.y;
                                            branchMergedValue73 = loadedBufferValue40.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue78;
                                            float branchMergedValue79;
                                            float branchMergedValue80;
                                            float branchMergedValue81;
                                            float branchMergedValue82;
                                            float branchMergedValue83;
                                            float branchMergedValue84;
                                            if (comparisonValue54 == 4u)
                                            {
                                                branchMergedValue78 = (-0.0f) - sumValue140;
                                                branchMergedValue79 = sumValue139;
                                                branchMergedValue80 = sumValue141;
                                                branchMergedValue81 = loadedBufferValue41.w;
                                                branchMergedValue82 = loadedBufferValue41.z;
                                                branchMergedValue83 = loadedBufferValue41.y;
                                                branchMergedValue84 = loadedBufferValue41.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue79 = comparisonValue54 == 5u;
                                                branchMergedValue78 = comparisonValue79 ? sumValue140 : sumValue141;
                                                branchMergedValue79 = sumValue139;
                                                branchMergedValue80 = comparisonValue79 ? sumValue138 : sumValue140;
                                                branchMergedValue81 = comparisonValue79 ? loadedBufferValue42.w : loadedBufferValue37.w;
                                                branchMergedValue82 = comparisonValue79 ? loadedBufferValue42.z : loadedBufferValue37.z;
                                                branchMergedValue83 = comparisonValue79 ? loadedBufferValue42.y : loadedBufferValue37.y;
                                                branchMergedValue84 = comparisonValue79 ? loadedBufferValue42.x : loadedBufferValue37.x;
                                            }
                                            branchMergedValue67 = branchMergedValue78;
                                            branchMergedValue68 = branchMergedValue79;
                                            branchMergedValue69 = branchMergedValue80;
                                            branchMergedValue70 = branchMergedValue81;
                                            branchMergedValue71 = branchMergedValue82;
                                            branchMergedValue72 = branchMergedValue83;
                                            branchMergedValue73 = branchMergedValue84;
                                        }
                                        branchMergedValue22 = branchMergedValue67;
                                        branchMergedValue50 = branchMergedValue68;
                                        branchMergedValue51 = branchMergedValue69;
                                        branchMergedValue52 = branchMergedValue70;
                                        branchMergedValue53 = branchMergedValue71;
                                        branchMergedValue54 = branchMergedValue72;
                                        branchMergedValue55 = branchMergedValue73;
                                    }
                                    intermediateValue218 = branchMergedValue55;
                                    intermediateValue219 = branchMergedValue54;
                                    intermediateValue220 = branchMergedValue53;
                                    intermediateValue221 = branchMergedValue52;
                                    sumValue117 = branchMergedValue51;
                                    intermediateValue222 = branchMergedValue50;
                                    intermediateValue223 = branchMergedValue22;
                                }
                                float branchMergedValue18;
                                if ((intermediateValue220 == 0.0f) && (intermediateValue221 == 0.0f))
                                {
                                    branchMergedValue18 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue43 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue223, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue222, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue15 = rsqrt(dot(float3(productValue14, productValue15, productValue16), float3(productValue14, productValue15, productValue16)));
                                    float sumValue142 = (-0.0f) - sumValue139;
                                    float sumValue143 = (-0.0f) - sumValue140;
                                    float inverseLengthValue16 = rsqrt(dot(float3(sumValue141, sumValue142, sumValue143), float3(sumValue141, sumValue142, sumValue143)));
                                    float dotProductValue16 = min(max(dot(float3(inverseLengthValue16 * sumValue141, inverseLengthValue16 * sumValue142, inverseLengthValue16 * sumValue143), float3(inverseLengthValue15 * productValue14, inverseLengthValue15 * productValue15, inverseLengthValue15 * productValue16)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue145 = intermediateValue220 - intermediateValue218;
                                    float productValue281 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue145;
                                    float quotientValue25 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue26 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue182 = intermediateValue221 - intermediateValue219;
                                    float productValue282 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue182;
                                    float sampledTextureValue16 = float(pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue223, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue222, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue43) * 0.5f) + 0.5f) * productValue281) + 0.5f) / productValue281) * sumValue145) + intermediateValue218, quotientValue25 + intermediateValue218), intermediateValue220 - quotientValue25), min(max((((floor((0.5f - (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue223, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue222, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue43) * 0.5f)) * productValue282) + 0.5f) / productValue282) * sumValue182) + intermediateValue219, quotientValue26 + intermediateValue219), intermediateValue221 - quotientValue26)), 0.0f).x >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue223, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue222, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue117)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue281, 1.0f)) * (((sqrt(1.0f - (dotProductValue16 * dotProductValue16)) / dotProductValue16) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue43));
                                    branchMergedValue18 = sampledTextureValue16;
                                }
                                intermediateValue147 = branchMergedValue18;
                            }
                            else
                            {
                                intermediateValue147 = 1.0f;
                            }
                            uint productValue222 = (loadedBufferValue3 * 32u) + 4u;
                            float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue222).x, rdLoad_zLights(productValue222 + 1u).x, rdLoad_zLights(productValue222 + 2u).x, rdLoad_zLights(productValue222 + 3u).x));
                            float quotientValue35 = productValue165 / (productValue213 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue19 = clamp(1.0f - (quotientValue35 * quotientValue35), 0.0f, 1.0f);
                            float quotientValue36 = (clampedValue19 * clampedValue19) * (1.0f / max(productValue165, 0.100000001490116119384765625f));
                            float clampedValue18;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue20 = clamp(((1.0f - quotientValue36) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue18 = clamp((((clampedValue20 * clampedValue20) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue20 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue36;
                            }
                            else
                            {
                                clampedValue18 = quotientValue36;
                            }
                            float productValue223 = clampedValue18 * loadedBufferValue43.w;
                            branchMergedValue3 = productValue223 * loadedBufferValue43.x;
                            branchMergedValue8 = intermediateValue147;
                            branchMergedValue9 = productValue223 * loadedBufferValue43.z;
                            branchMergedValue10 = productValue223 * loadedBufferValue43.y;
                        }
                        else
                        {
                            branchMergedValue3 = 0.0f;
                            branchMergedValue8 = 1.0f;
                            branchMergedValue9 = 0.0f;
                            branchMergedValue10 = 0.0f;
                        }
                        intermediateValue143 = branchMergedValue3;
                        intermediateValue146 = branchMergedValue8;
                        intermediateValue145 = branchMergedValue9;
                        intermediateValue144 = branchMergedValue10;
                        float productValue283 = intermediateValue146 * dotProductValue10;
                        float productValue284 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (productValue283 * 0.3183098733425140380859375f);
                        float productValue285 = (((productValue284 * exponentialValue) * sumValue45) * intermediateValue143) + scalarValue66;
                        float productValue286 = (((productValue284 * exponentialValue1) * sumValue45) * intermediateValue144) + scalarValue67;
                        float productValue287 = (((productValue284 * exponentialValue2) * sumValue45) * intermediateValue145) + scalarValue68;
                        float productValue288 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (productValue283 * quotientValue18);
                        float productValue289 = (productValue288 * intermediateValue143) + scalarValue63;
                        float productValue290 = (productValue288 * intermediateValue144) + scalarValue64;
                        float productValue291 = (productValue288 * intermediateValue145) + scalarValue65;
                        uint sumValue183 = scalarValue116 + 1u;
                        if (int(sumValue183) < int(intermediateValue42))
                        {
                            scalarValue63 = productValue289;
                            scalarValue64 = productValue290;
                            scalarValue65 = productValue291;
                            scalarValue66 = productValue285;
                            scalarValue67 = productValue286;
                            scalarValue68 = productValue287;
                            scalarValue116 = sumValue183;
                            continue;
                        }
                        else
                        {
                            intermediateValue59 = productValue289;
                            intermediateValue61 = productValue290;
                            intermediateValue63 = productValue291;
                            intermediateValue65 = productValue285;
                            intermediateValue67 = productValue286;
                            intermediateValue69 = productValue287;
                            break;
                        }
                    }
                }
                intermediateValue58 = intermediateValue59;
                intermediateValue60 = intermediateValue61;
                intermediateValue62 = intermediateValue63;
                intermediateValue64 = intermediateValue65;
                intermediateValue66 = intermediateValue67;
                intermediateValue68 = intermediateValue69;
            }
            else
            {
                intermediateValue58 = 0.0f;
                intermediateValue60 = 0.0f;
                intermediateValue62 = 0.0f;
                intermediateValue64 = 0.0f;
                intermediateValue66 = 0.0f;
                intermediateValue68 = 0.0f;
            }
            float sumValue147 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue42 = (sumValue147 * intermediateValue58) + intermediateValue16;
            productValue43 = (sumValue147 * intermediateValue60) + intermediateValue17;
            productValue44 = (sumValue147 * intermediateValue62) + intermediateValue18;
            productValue45 = (sumValue147 * intermediateValue64) + intermediateValue19;
            productValue46 = (sumValue147 * intermediateValue66) + intermediateValue20;
            productValue47 = (sumValue147 * intermediateValue68) + intermediateValue21;
        }
        else
        {
            productValue42 = intermediateValue16;
            productValue43 = intermediateValue17;
            productValue44 = intermediateValue18;
            productValue45 = intermediateValue19;
            productValue46 = intermediateValue20;
            productValue47 = intermediateValue21;
        }
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#endif
        {
            float productValue79 = ((varyingTexCoord3.x + (-0.5f)) + (productValue14 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue80 = ((varyingTexCoord3.y + (-0.5f)) + (productValue15 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue81 = ((varyingTexCoord3.z + (-0.5f)) + (productValue16 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue88 = floor(productValue79 * 0.0625f) * 16.0f;
            float productValue89 = floor(productValue80 * 0.0625f) * 16.0f;
            float productValue96 = floor(productValue81 * 0.0625f) * 16.0f;
            uint productValue97 = uint(int(floor(float(int(uint(int(floor(productValue79))))) * 0.0625f)));
            uint productValue98 = uint(int(floor(float(int(uint(int(floor(productValue80))))) * 0.0625f)));
            uint productValue99 = uint(int(floor(float(int(uint(int(floor(productValue81))))) * 0.0625f)));
            float sumValue28 = productValue79 - productValue88;
            float sumValue29 = productValue80 - productValue89;
            float sumValue30 = productValue81 - productValue96;
            uint bitwiseValue2 = (productValue98 << 16u) | (productValue97 & 65535u);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue3 = productValue99 & 65535u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue35 = (productValue99 & 65535u) | 131072u;
#endif
            uint productValue100 = productValue97 * 1540483477u;
            uint productValue101 = productValue98 * 1540483477u;
            uint productValue102 = productValue99 * 1540483477u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue4 = ((((((((productValue100 >> 24u) ^ productValue100) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue101 >> 24u) ^ productValue101) * 1540483477u)) * 1540483477u) ^ (((productValue102 >> 24u) ^ productValue102) * 1540483477u)) * 1540483477u;
            uint bitwiseValue5 = ((bitwiseValue4 >> 13u) ^ bitwiseValue4) * 1540483477u;
            uint bitwiseValue6 = (bitwiseValue5 >> 15u) ^ bitwiseValue5;
            uint bitwiseValue8 = bitwiseValue6 >> 16u;
            uint bitwiseValue9 = bitwiseValue6 & 65535u;
            uint comparisonValue17 = uint(bitwiseValue9 == bitwiseValue8) | (bitwiseValue9 ^ bitwiseValue8);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue36 = (((((((((productValue100 >> 24u) ^ productValue100) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue101 >> 24u) ^ productValue101) * 1540483477u)) * 1540483477u) ^ (((productValue102 >> 24u) ^ productValue102) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue37 = ((bitwiseValue36 >> 13u) ^ bitwiseValue36) * 1540483477u;
            uint bitwiseValue38 = (bitwiseValue37 >> 15u) ^ bitwiseValue37;
            uint bitwiseValue39 = bitwiseValue38 >> 16u;
            uint bitwiseValue40 = bitwiseValue38 & 65535u;
            uint comparisonValue80 = uint(bitwiseValue40 == bitwiseValue39) | (bitwiseValue40 ^ bitwiseValue39);
#endif
            uint sumValue31 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            bool intermediateValue39;
            uint scalarValue19 = comparisonValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            bool intermediateValue69;
            uint scalarValue77 = comparisonValue80;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            bool intermediateValue40;
            uint scalarValue19 = comparisonValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            bool intermediateValue70;
            uint scalarValue77 = comparisonValue80;
#endif
            uint scalarValue20 = 0u;
            uint scalarValue21 = 0u;
            uint loadedBufferValue;
            uint bitwiseValue7;
            for (;;)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bitwiseValue7 = scalarValue19 & sumValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bitwiseValue7 = scalarValue77 & sumValue31;
#endif
                uint loadedBufferValue1 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bool loadedBufferValue2 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue3) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue2) && (loadedBufferValue1 == comparisonValue17));
                loadedBufferValue = loadedBufferValue2 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue20;
                if ((loadedBufferValue1 == 0u) || loadedBufferValue2)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bool loadedBufferValue44 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue35) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue2) && (loadedBufferValue1 == comparisonValue80));
                loadedBufferValue = loadedBufferValue44 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue20;
                if ((loadedBufferValue1 == 0u) || loadedBufferValue44)
#endif
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue39 = loadedBufferValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue69 = loadedBufferValue44;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue40 = loadedBufferValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue70 = loadedBufferValue44;
#endif
                    break;
                }
                else
                {
                    uint sumValue32 = scalarValue21 + 1u;
                    if (int(sumValue32) < int(8u))
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        scalarValue19 = bitwiseValue7 + 1u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        scalarValue77 = bitwiseValue7 + 1u;
#endif
                        scalarValue20 = loadedBufferValue;
                        scalarValue21 = sumValue32;
                        continue;
                    }
                    else
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue39 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue69 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue40 = false;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        intermediateValue70 = false;
#endif
                        break;
                    }
                }
            }
            uint bitwiseValue10 = loadedBufferValue >> 2u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue7;
            float branchMergedValue15;
            float branchMergedValue16;
            if (intermediateValue39)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue13;
            float branchMergedValue26;
            float branchMergedValue27;
            if (intermediateValue69)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue7;
            float branchMergedValue15;
            float branchMergedValue16;
            if (intermediateValue40)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue13;
            float branchMergedValue26;
            float branchMergedValue27;
            if (intermediateValue70)
#endif
            {
                float scalarValue22 = abs(productValue14);
                float scalarValue23 = abs(productValue15);
                float scalarValue24 = abs(productValue16);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue46;
                float branchMergedValue48;
                float branchMergedValue49;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue61;
                float branchMergedValue65;
                float branchMergedValue66;
#endif
                if (((scalarValue22 >= 1.0f) || (scalarValue23 >= 1.0f)) || (scalarValue24 >= 1.0f))
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue138;
                    float intermediateValue139;
                    float intermediateValue140;
                    float intermediateValue141;
                    float intermediateValue143;
                    float intermediateValue145;
                    float intermediateValue147;
                    float intermediateValue149;
                    float intermediateValue151;
                    float intermediateValue153;
                    float intermediateValue154;
                    float intermediateValue155;
                    float productValue115;
                    float productValue116;
                    float productValue117;
                    float sumValue33;
                    float sumValue34;
                    float sumValue35;
                    float sumValue36;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float productValue118;
                    float productValue119;
                    float productValue120;
                    float productValue121;
                    bool comparisonValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
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
                    float productValue140;
                    float productValue141;
                    float productValue142;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float productValue143;
                    float productValue144;
                    float productValue145;
                    float productValue146;
                    bool comparisonValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float intermediateValue139;
                    float intermediateValue140;
                    float intermediateValue141;
                    float intermediateValue142;
                    float intermediateValue144;
                    float intermediateValue146;
                    float intermediateValue148;
                    float intermediateValue150;
                    float intermediateValue152;
                    float intermediateValue154;
                    float intermediateValue155;
                    float intermediateValue156;
                    float productValue117;
                    float productValue118;
                    float productValue119;
                    float sumValue33;
                    float sumValue34;
                    float sumValue35;
                    float sumValue36;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float productValue120;
                    float productValue121;
                    float productValue122;
                    float productValue123;
                    bool comparisonValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float intermediateValue177;
                    float intermediateValue178;
                    float intermediateValue179;
                    float intermediateValue180;
                    float intermediateValue182;
                    float intermediateValue184;
                    float intermediateValue186;
                    float intermediateValue188;
                    float intermediateValue190;
                    float intermediateValue192;
                    float intermediateValue193;
                    float intermediateValue194;
                    float productValue142;
                    float productValue143;
                    float productValue144;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float productValue145;
                    float productValue146;
                    float productValue147;
                    float productValue148;
                    bool comparisonValue20;
#endif
                    for (;;)
                    {
                        float dotProductValue7 = dot(float3(sumValue28, sumValue29, sumValue30), float3(scalarValue22, scalarValue23, scalarValue24));
                        float dotProductValue8 = dot(float3(sumValue28, sumValue29, sumValue30), float3(scalarValue24, scalarValue22, scalarValue23));
                        float dotProductValue9 = dot(float3(sumValue28, sumValue29, sumValue30), float3(scalarValue23, scalarValue24, scalarValue22));
                        float comparisonValue23 = ((inverseLengthValue1 * ((varyingNormal0.y + varyingNormal0.x) + varyingNormal0.z)) > 0.0f) ? ceil(dotProductValue7) : floor(dotProductValue7);
                        float scalarValue25 = floor(dotProductValue8);
                        float scalarValue26 = floor(dotProductValue9);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue115 = ((comparisonValue23 * scalarValue22) + (scalarValue25 * scalarValue24)) + (scalarValue26 * scalarValue23);
                        productValue116 = ((comparisonValue23 * scalarValue23) + (scalarValue25 * scalarValue22)) + (scalarValue26 * scalarValue24);
                        productValue117 = ((comparisonValue23 * scalarValue24) + (scalarValue25 * scalarValue23)) + (scalarValue26 * scalarValue22);
                        sumValue33 = productValue115 + scalarValue24;
                        sumValue34 = productValue116 + scalarValue22;
                        sumValue35 = productValue117 + scalarValue23;
                        sumValue36 = productValue115 + scalarValue23;
                        sumValue37 = productValue116 + scalarValue24;
                        sumValue38 = productValue117 + scalarValue22;
                        sumValue39 = sumValue33 + scalarValue23;
                        sumValue40 = sumValue37 + scalarValue22;
                        sumValue41 = sumValue35 + scalarValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue140 = ((comparisonValue23 * scalarValue22) + (scalarValue25 * scalarValue24)) + (scalarValue26 * scalarValue23);
                        productValue141 = ((comparisonValue23 * scalarValue23) + (scalarValue25 * scalarValue22)) + (scalarValue26 * scalarValue24);
                        productValue142 = ((comparisonValue23 * scalarValue24) + (scalarValue25 * scalarValue23)) + (scalarValue26 * scalarValue22);
                        sumValue49 = productValue140 + scalarValue24;
                        sumValue50 = productValue141 + scalarValue22;
                        sumValue51 = productValue142 + scalarValue23;
                        sumValue52 = productValue140 + scalarValue23;
                        sumValue53 = productValue141 + scalarValue24;
                        sumValue54 = productValue142 + scalarValue22;
                        sumValue55 = sumValue49 + scalarValue23;
                        sumValue56 = sumValue53 + scalarValue22;
                        sumValue57 = sumValue51 + scalarValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue117 = ((comparisonValue23 * scalarValue22) + (scalarValue25 * scalarValue24)) + (scalarValue26 * scalarValue23);
                        productValue118 = ((comparisonValue23 * scalarValue23) + (scalarValue25 * scalarValue22)) + (scalarValue26 * scalarValue24);
                        productValue119 = ((comparisonValue23 * scalarValue24) + (scalarValue25 * scalarValue23)) + (scalarValue26 * scalarValue22);
                        sumValue33 = productValue117 + scalarValue24;
                        sumValue34 = productValue118 + scalarValue22;
                        sumValue35 = productValue119 + scalarValue23;
                        sumValue36 = productValue117 + scalarValue23;
                        sumValue37 = productValue118 + scalarValue24;
                        sumValue38 = productValue119 + scalarValue22;
                        sumValue39 = sumValue33 + scalarValue23;
                        sumValue40 = sumValue37 + scalarValue22;
                        sumValue41 = sumValue35 + scalarValue22;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue142 = ((comparisonValue23 * scalarValue22) + (scalarValue25 * scalarValue24)) + (scalarValue26 * scalarValue23);
                        productValue143 = ((comparisonValue23 * scalarValue23) + (scalarValue25 * scalarValue22)) + (scalarValue26 * scalarValue24);
                        productValue144 = ((comparisonValue23 * scalarValue24) + (scalarValue25 * scalarValue23)) + (scalarValue26 * scalarValue22);
                        sumValue49 = productValue142 + scalarValue24;
                        sumValue50 = productValue143 + scalarValue22;
                        sumValue51 = productValue144 + scalarValue23;
                        sumValue52 = productValue142 + scalarValue23;
                        sumValue53 = productValue143 + scalarValue24;
                        sumValue54 = productValue144 + scalarValue22;
                        sumValue55 = sumValue49 + scalarValue23;
                        sumValue56 = sumValue53 + scalarValue22;
                        sumValue57 = sumValue51 + scalarValue22;
#endif
                        float sumValue42 = dotProductValue8 - scalarValue25;
                        float sumValue43 = dotProductValue9 - scalarValue26;
                        float sumValue44 = 1.0f - sumValue42;
                        float sumValue46 = 1.0f - sumValue43;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue118 = sumValue46 * sumValue44;
                        productValue119 = sumValue46 * sumValue42;
                        productValue120 = sumValue44 * sumValue43;
                        productValue121 = sumValue43 * sumValue42;
                        comparisonValue16 = ((productValue117 >= 0.0f) && ((productValue115 >= 0.0f) && (productValue116 >= 0.0f))) && ((sumValue41 < 16.0f) && ((sumValue39 < 16.0f) && (sumValue40 < 16.0f)));
                        if (comparisonValue16)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue143 = sumValue46 * sumValue44;
                        productValue144 = sumValue46 * sumValue42;
                        productValue145 = sumValue44 * sumValue43;
                        productValue146 = sumValue43 * sumValue42;
                        comparisonValue20 = ((productValue142 >= 0.0f) && ((productValue140 >= 0.0f) && (productValue141 >= 0.0f))) && ((sumValue57 < 16.0f) && ((sumValue55 < 16.0f) && (sumValue56 < 16.0f)));
                        if (comparisonValue20)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        productValue120 = sumValue46 * sumValue44;
                        productValue121 = sumValue46 * sumValue42;
                        productValue122 = sumValue44 * sumValue43;
                        productValue123 = sumValue43 * sumValue42;
                        comparisonValue16 = ((productValue119 >= 0.0f) && ((productValue117 >= 0.0f) && (productValue118 >= 0.0f))) && ((sumValue41 < 16.0f) && ((sumValue39 < 16.0f) && (sumValue40 < 16.0f)));
                        if (comparisonValue16)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        productValue145 = sumValue46 * sumValue44;
                        productValue146 = sumValue46 * sumValue42;
                        productValue147 = sumValue44 * sumValue43;
                        productValue148 = sumValue43 * sumValue42;
                        comparisonValue20 = ((productValue144 >= 0.0f) && ((productValue142 >= 0.0f) && (productValue143 >= 0.0f))) && ((sumValue57 < 16.0f) && ((sumValue55 < 16.0f) && (sumValue56 < 16.0f)));
                        if (comparisonValue20)
#endif
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint4 loadedBufferValue4 = rdLoad_voxelBuffer(((uint(productValue116) + bitwiseValue10) + (uint(productValue117) << 4u)) + (uint(productValue115) << 8u));
                            uint scalarValue27 = loadedBufferValue4.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint4 loadedBufferValue45 = rdLoad_voxelBuffer(((uint(productValue141) + bitwiseValue10) + (uint(productValue142) << 4u)) + (uint(productValue140) << 8u));
                            uint scalarValue78 = loadedBufferValue45.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint4 loadedBufferValue61 = rdLoad_voxelBuffer(((uint(productValue118) + bitwiseValue10) + (uint(productValue119) << 4u)) + (uint(productValue117) << 8u));
                            uint scalarValue103 = loadedBufferValue61.x;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint4 loadedBufferValue66 = rdLoad_voxelBuffer(((uint(productValue143) + bitwiseValue10) + (uint(productValue144) << 4u)) + (uint(productValue142) << 8u));
                            uint scalarValue117 = loadedBufferValue66.x;
#endif
                            float bitwiseValue13;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue97;
                            float intermediateValue98;
                            if (scalarValue27 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue132;
                            float intermediateValue133;
                            if (scalarValue78 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue98;
                            float intermediateValue99;
                            if (scalarValue103 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue133;
                            float intermediateValue134;
                            if (scalarValue117 == 0u)
#endif
                            {
                                bitwiseValue13 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue97 = 0.0f;
                                intermediateValue98 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue132 = 0.0f;
                                intermediateValue133 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue98 = 0.0f;
                                intermediateValue99 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue133 = 0.0f;
                                intermediateValue134 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue11 = float(scalarValue27 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue27 & 255u);
                                intermediateValue97 = bitwiseValue11 * float((scalarValue27 >> 8u) & 255u);
                                intermediateValue98 = bitwiseValue11 * float((scalarValue27 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue41 = float(scalarValue78 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue41 * float(scalarValue78 & 255u);
                                intermediateValue132 = bitwiseValue41 * float((scalarValue78 >> 8u) & 255u);
                                intermediateValue133 = bitwiseValue41 * float((scalarValue78 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue59 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue59 * float(scalarValue103 & 255u);
                                intermediateValue98 = bitwiseValue59 * float((scalarValue103 >> 8u) & 255u);
                                intermediateValue99 = bitwiseValue59 * float((scalarValue103 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue66 = float(scalarValue117 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue66 * float(scalarValue117 & 255u);
                                intermediateValue133 = bitwiseValue66 * float((scalarValue117 >> 8u) & 255u);
                                intermediateValue134 = bitwiseValue66 * float((scalarValue117 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue5 = rdLoad_voxelBuffer(((uint(sumValue34) + bitwiseValue10) + (uint(sumValue35) << 4u)) + (uint(sumValue33) << 8u));
                            uint scalarValue28 = loadedBufferValue5.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue46 = rdLoad_voxelBuffer(((uint(sumValue50) + bitwiseValue10) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u));
                            uint scalarValue79 = loadedBufferValue46.x;
#endif
                            float bitwiseValue17;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue108;
                            float intermediateValue109;
                            if (scalarValue28 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue147;
                            float intermediateValue148;
                            if (scalarValue79 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue109;
                            float intermediateValue110;
                            if (scalarValue28 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue148;
                            float intermediateValue149;
                            if (scalarValue79 == 0u)
#endif
                            {
                                bitwiseValue17 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue108 = 0.0f;
                                intermediateValue109 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue147 = 0.0f;
                                intermediateValue148 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue109 = 0.0f;
                                intermediateValue110 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue148 = 0.0f;
                                intermediateValue149 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue12 = float(scalarValue28 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue28 & 255u);
                                intermediateValue108 = bitwiseValue12 * float((scalarValue28 >> 8u) & 255u);
                                intermediateValue109 = bitwiseValue12 * float((scalarValue28 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue42 = float(scalarValue79 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue42 * float(scalarValue79 & 255u);
                                intermediateValue147 = bitwiseValue42 * float((scalarValue79 >> 8u) & 255u);
                                intermediateValue148 = bitwiseValue42 * float((scalarValue79 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue12 = float(scalarValue28 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue28 & 255u);
                                intermediateValue109 = bitwiseValue12 * float((scalarValue28 >> 8u) & 255u);
                                intermediateValue110 = bitwiseValue12 * float((scalarValue28 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue42 = float(scalarValue79 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue42 * float(scalarValue79 & 255u);
                                intermediateValue148 = bitwiseValue42 * float((scalarValue79 >> 8u) & 255u);
                                intermediateValue149 = bitwiseValue42 * float((scalarValue79 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue6 = rdLoad_voxelBuffer(((uint(sumValue37) + bitwiseValue10) + (uint(sumValue38) << 4u)) + (uint(sumValue36) << 8u));
                            uint scalarValue29 = loadedBufferValue6.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue47 = rdLoad_voxelBuffer(((uint(sumValue53) + bitwiseValue10) + (uint(sumValue54) << 4u)) + (uint(sumValue52) << 8u));
                            uint scalarValue80 = loadedBufferValue47.x;
#endif
                            float bitwiseValue21;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue126;
                            float intermediateValue127;
                            if (scalarValue29 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue170;
                            float intermediateValue171;
                            if (scalarValue80 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue127;
                            float intermediateValue128;
                            if (scalarValue29 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue171;
                            float intermediateValue172;
                            if (scalarValue80 == 0u)
#endif
                            {
                                bitwiseValue21 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue126 = 0.0f;
                                intermediateValue127 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue170 = 0.0f;
                                intermediateValue171 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue127 = 0.0f;
                                intermediateValue128 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue171 = 0.0f;
                                intermediateValue172 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue29 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue29 & 255u);
                                intermediateValue126 = bitwiseValue14 * float((scalarValue29 >> 8u) & 255u);
                                intermediateValue127 = bitwiseValue14 * float((scalarValue29 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue43 = float(scalarValue80 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue43 * float(scalarValue80 & 255u);
                                intermediateValue170 = bitwiseValue43 * float((scalarValue80 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue43 * float((scalarValue80 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue29 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue29 & 255u);
                                intermediateValue127 = bitwiseValue14 * float((scalarValue29 >> 8u) & 255u);
                                intermediateValue128 = bitwiseValue14 * float((scalarValue29 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue43 = float(scalarValue80 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue43 * float(scalarValue80 & 255u);
                                intermediateValue171 = bitwiseValue43 * float((scalarValue80 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue43 * float((scalarValue80 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue7 = rdLoad_voxelBuffer(((uint(sumValue40) + bitwiseValue10) + (uint(sumValue41) << 4u)) + (uint(sumValue39) << 8u));
                            uint scalarValue30 = loadedBufferValue7.x;
                            float branchMergedValue13;
                            float branchMergedValue24;
                            float branchMergedValue25;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue48 = rdLoad_voxelBuffer(((uint(sumValue56) + bitwiseValue10) + (uint(sumValue57) << 4u)) + (uint(sumValue55) << 8u));
                            uint scalarValue81 = loadedBufferValue48.x;
                            float branchMergedValue19;
#endif
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            if (scalarValue30 == 0u)
                            {
                                branchMergedValue13 = intermediateValue97;
                                branchMergedValue24 = bitwiseValue13;
                                branchMergedValue25 = 0.0f;
                                branchMergedValue26 = 0.0f;
                                branchMergedValue27 = 0.0f;
                                branchMergedValue28 = intermediateValue127;
                                branchMergedValue29 = intermediateValue126;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue109;
                                branchMergedValue32 = intermediateValue108;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue98;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue30 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue13 = intermediateValue97;
                                branchMergedValue24 = bitwiseValue13;
                                branchMergedValue25 = bitwiseValue16 * float((scalarValue30 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue30 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue30 & 255u);
                                branchMergedValue28 = intermediateValue127;
                                branchMergedValue29 = intermediateValue126;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue109;
                                branchMergedValue32 = intermediateValue108;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue98;
                            }
                            intermediateValue138 = branchMergedValue24;
                            intermediateValue139 = branchMergedValue13;
                            intermediateValue140 = branchMergedValue34;
                            intermediateValue141 = branchMergedValue33;
                            intermediateValue143 = branchMergedValue32;
                            intermediateValue145 = branchMergedValue31;
                            intermediateValue147 = branchMergedValue30;
                            intermediateValue149 = branchMergedValue29;
                            intermediateValue151 = branchMergedValue28;
                            intermediateValue153 = branchMergedValue27;
                            intermediateValue154 = branchMergedValue26;
                            intermediateValue155 = branchMergedValue25;
                            break;
                        }
                        else
                        {
                            float intermediateValue111;
                            float intermediateValue112;
                            float intermediateValue113;
                            float sumValue62;
                            float sumValue63;
                            float sumValue64;
                            uint comparisonValue21;
                            bool comparisonValue22;
                            for (;;)
                            {
                                sumValue62 = productValue115 + productValue88;
                                sumValue63 = productValue116 + productValue89;
                                sumValue64 = productValue117 + productValue96;
                                uint comparisonValue28 = ((((uint(productValue115 >= 16.0f) << 1u) | uint(productValue115 < 0.0f)) | (uint(productValue116 < 0.0f) << 2u)) | (uint(productValue116 >= 16.0f) << 3u)) | (uint(productValue117 < 0.0f) << 4u);
                                comparisonValue21 = intermediateValue[comparisonValue28 | (uint(productValue117 >= 16.0f) << 5u)];
                                comparisonValue22 = ((((comparisonValue28 | (uint(productValue117 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue28 & 31u))) == 0u;
                                uint loadedBufferValue8;
                                if (comparisonValue22)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue21 & 31u))) == 0u)
                                    {
                                        intermediateValue111 = 0.0f;
                                        intermediateValue112 = 0.0f;
                                        intermediateValue113 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue8 = ((((uint(sumValue62 - (floor(sumValue62 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue63 - (floor(sumValue63 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue64 - (floor(sumValue64 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue21).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue8 = ((((uint(productValue117) << 4u) & 240u) | (uint(productValue116) & 15u)) | ((uint(productValue115) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                uint scalarValue31 = loadedBufferValue9.x;
                                if (scalarValue31 == 0u)
                                {
                                    intermediateValue111 = 0.0f;
                                    intermediateValue112 = 0.0f;
                                    intermediateValue113 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue31 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue111 = bitwiseValue18 * float(scalarValue31 & 255u);
                                intermediateValue112 = bitwiseValue18 * float((scalarValue31 >> 8u) & 255u);
                                intermediateValue113 = bitwiseValue18 * float((scalarValue31 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue142;
                            float intermediateValue144;
                            float intermediateValue146;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue33;
                            bool comparisonValue34;
                            for (;;)
                            {
                                sumValue82 = sumValue33 + productValue88;
                                sumValue83 = sumValue34 + productValue89;
                                sumValue84 = sumValue35 + productValue96;
                                uint comparisonValue32 = ((((uint(sumValue33 >= 16.0f) << 1u) | uint(sumValue33 < 0.0f)) | (uint(sumValue34 < 0.0f) << 2u)) | (uint(sumValue34 >= 16.0f) << 3u)) | (uint(sumValue35 < 0.0f) << 4u);
                                comparisonValue33 = intermediateValue[comparisonValue32 | (uint(sumValue35 >= 16.0f) << 5u)];
                                comparisonValue34 = ((((comparisonValue32 | (uint(sumValue35 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue32 & 31u))) == 0u;
                                uint loadedBufferValue15;
                                if (comparisonValue34)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue33 & 31u))) == 0u)
                                    {
                                        intermediateValue142 = 0.0f;
                                        intermediateValue144 = 0.0f;
                                        intermediateValue146 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue15 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue33).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue15 = ((((uint(sumValue35) << 4u) & 240u) | (uint(sumValue34) & 15u)) | ((uint(sumValue33) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                uint scalarValue32 = loadedBufferValue12.x;
                                if (scalarValue32 == 0u)
                                {
                                    intermediateValue142 = 0.0f;
                                    intermediateValue144 = 0.0f;
                                    intermediateValue146 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue142 = bitwiseValue20 * float(scalarValue32 & 255u);
                                intermediateValue144 = bitwiseValue20 * float((scalarValue32 >> 8u) & 255u);
                                intermediateValue146 = bitwiseValue20 * float((scalarValue32 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue148;
                            float intermediateValue150;
                            float intermediateValue152;
                            float sumValue91;
                            float sumValue92;
                            float sumValue93;
                            uint comparisonValue43;
                            bool comparisonValue44;
                            for (;;)
                            {
                                sumValue91 = sumValue36 + productValue88;
                                sumValue92 = sumValue37 + productValue89;
                                sumValue93 = sumValue38 + productValue96;
                                uint comparisonValue35 = ((((uint(sumValue36 >= 16.0f) << 1u) | uint(sumValue36 < 0.0f)) | (uint(sumValue37 < 0.0f) << 2u)) | (uint(sumValue37 >= 16.0f) << 3u)) | (uint(sumValue38 < 0.0f) << 4u);
                                comparisonValue43 = intermediateValue[comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)];
                                comparisonValue44 = ((((comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue44)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue43 & 31u))) == 0u)
                                    {
                                        intermediateValue148 = 0.0f;
                                        intermediateValue150 = 0.0f;
                                        intermediateValue152 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue91 - (floor(sumValue91 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue43).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(sumValue38) << 4u) & 240u) | (uint(sumValue37) & 15u)) | ((uint(sumValue36) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue33 = loadedBufferValue14.x;
                                if (scalarValue33 == 0u)
                                {
                                    intermediateValue148 = 0.0f;
                                    intermediateValue150 = 0.0f;
                                    intermediateValue152 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue148 = bitwiseValue22 * float(scalarValue33 & 255u);
                                intermediateValue150 = bitwiseValue22 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue152 = bitwiseValue22 * float((scalarValue33 >> 16u) & 255u);
                                break;
                            }
                            float sumValue47 = sumValue39 + productValue88;
                            float sumValue48 = sumValue40 + productValue89;
                            float sumValue58 = sumValue41 + productValue96;
                            uint comparisonValue38 = ((((uint(sumValue39 >= 16.0f) << 1u) | uint(sumValue39 < 0.0f)) | (uint(sumValue40 < 0.0f) << 2u)) | (uint(sumValue40 >= 16.0f) << 3u)) | (uint(sumValue41 < 0.0f) << 4u);
                            uint comparisonValue45 = comparisonValue38 | (uint(sumValue41 >= 16.0f) << 5u);
                            uint loadedBufferValue23;
                            if ((((comparisonValue45 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue45] & 31u))) == 0u)
                                {
                                    intermediateValue138 = intermediateValue111;
                                    intermediateValue139 = intermediateValue112;
                                    intermediateValue140 = intermediateValue113;
                                    intermediateValue141 = intermediateValue142;
                                    intermediateValue143 = intermediateValue144;
                                    intermediateValue145 = intermediateValue146;
                                    intermediateValue147 = intermediateValue148;
                                    intermediateValue149 = intermediateValue150;
                                    intermediateValue151 = intermediateValue152;
                                    intermediateValue153 = 0.0f;
                                    intermediateValue154 = 0.0f;
                                    intermediateValue155 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue47 - (floor(sumValue47 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue48 - (floor(sumValue48 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue58 - (floor(sumValue58 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue45]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue41) << 4u) & 240u) | (uint(sumValue40) & 15u)) | ((uint(sumValue39) << 8u) & 3840u)) + bitwiseValue10;
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue34 = loadedBufferValue16.x;
                            if (scalarValue34 == 0u)
                            {
                                intermediateValue138 = intermediateValue111;
                                intermediateValue139 = intermediateValue112;
                                intermediateValue140 = intermediateValue113;
                                intermediateValue141 = intermediateValue142;
                                intermediateValue143 = intermediateValue144;
                                intermediateValue145 = intermediateValue146;
                                intermediateValue147 = intermediateValue148;
                                intermediateValue149 = intermediateValue150;
                                intermediateValue151 = intermediateValue152;
                                intermediateValue153 = 0.0f;
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue138 = intermediateValue111;
                            intermediateValue139 = intermediateValue112;
                            intermediateValue140 = intermediateValue113;
                            intermediateValue141 = intermediateValue142;
                            intermediateValue143 = intermediateValue144;
                            intermediateValue145 = intermediateValue146;
                            intermediateValue147 = intermediateValue148;
                            intermediateValue149 = intermediateValue150;
                            intermediateValue151 = intermediateValue152;
                            intermediateValue153 = bitwiseValue23 * float(scalarValue34 & 255u);
                            intermediateValue154 = bitwiseValue23 * float((scalarValue34 >> 8u) & 255u);
                            intermediateValue155 = bitwiseValue23 * float((scalarValue34 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue46 = (((intermediateValue143 * productValue119) + (intermediateValue139 * productValue118)) + (intermediateValue149 * productValue120)) + (intermediateValue154 * productValue121);
                    branchMergedValue48 = (((intermediateValue141 * productValue119) + (intermediateValue138 * productValue118)) + (intermediateValue147 * productValue120)) + (intermediateValue153 * productValue121);
                    branchMergedValue49 = (((intermediateValue145 * productValue119) + (intermediateValue140 * productValue118)) + (intermediateValue151 * productValue120)) + (intermediateValue155 * productValue121);
                }
                else
                {
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
                    float intermediateValue69;
                    float intermediateValue70;
                    float intermediateValue71;
                    uint intermediateValue72;
                    uint intermediateValue73;
                    uint intermediateValue74;
                    float intermediateValue77;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    bool comparisonValue18;
                    uint productValue122;
                    uint productValue123;
                    uint productValue124;
                    uint productValue125;
                    uint productValue126;
                    uint productValue127;
                    for (;;)
                    {
                        intermediateValue69 = floor(sumValue28);
                        intermediateValue70 = floor(sumValue29);
                        intermediateValue71 = floor(sumValue30);
                        float sumValue60 = sumValue28 - intermediateValue69;
                        float sumValue75 = sumValue29 - intermediateValue70;
                        float sumValue76 = sumValue30 - intermediateValue71;
                        uint comparisonValue48 = ((uint(sumValue75 >= sumValue76) << 1u) | uint(sumValue60 >= sumValue75)) | (uint(sumValue60 >= sumValue76) << 2u);
                        intermediateValue72 = uint(intermediateValue69);
                        intermediateValue73 = uint(intermediateValue70);
                        intermediateValue74 = uint(intermediateValue71);
                        float scalarValue35 = min(sumValue60, sumValue75);
                        float scalarValue36 = max(sumValue60, sumValue75);
                        intermediateValue77 = min(scalarValue35, sumValue76);
                        float scalarValue37 = max(scalarValue36, sumValue76);
                        float scalarValue38 = max(min(scalarValue36, sumValue76), scalarValue35);
                        sumValue49 = 1.0f - scalarValue37;
                        sumValue50 = scalarValue37 - scalarValue38;
                        sumValue51 = scalarValue38 - intermediateValue77;
                        sumValue52 = intermediateValue69 + 1.0f;
                        sumValue53 = intermediateValue70 + 1.0f;
                        sumValue54 = intermediateValue71 + 1.0f;
                        comparisonValue18 = (((intermediateValue69 >= 0.0f) && (intermediateValue70 >= 0.0f)) && (intermediateValue71 >= 0.0f)) && (((sumValue52 < 16.0f) && (sumValue53 < 16.0f)) && (sumValue54 < 16.0f));
                        productValue122 = 0u + (comparisonValue48 * 3u);
                        productValue123 = 1u + (comparisonValue48 * 3u);
                        productValue124 = 2u + (comparisonValue48 * 3u);
                        productValue125 = 0u + (comparisonValue48 * 3u);
                        productValue126 = 1u + (comparisonValue48 * 3u);
                        productValue127 = 2u + (comparisonValue48 * 3u);
                        if (comparisonValue18)
                        {
                            uint bitwiseValue25 = intermediateValue74 << 4u;
                            uint sumValue99 = intermediateValue73 + bitwiseValue10;
                            uint bitwiseValue26 = sumValue99 + (intermediateValue72 << 8u);
                            uint4 loadedBufferValue18 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue39 = loadedBufferValue18.x;
                            float bitwiseValue15;
                            float intermediateValue100;
                            float intermediateValue101;
                            if (scalarValue39 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue100 = 0.0f;
                                intermediateValue101 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue39 & 255u);
                                intermediateValue100 = bitwiseValue27 * float((scalarValue39 >> 8u) & 255u);
                                intermediateValue101 = bitwiseValue27 * float((scalarValue39 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue20 = rdLoad_voxelBuffer(((intermediateValue1[productValue123] + sumValue99) + ((intermediateValue1[productValue122] + intermediateValue72) << 8u)) + ((intermediateValue1[productValue124] + intermediateValue74) << 4u));
                            uint scalarValue40 = loadedBufferValue20.x;
                            float bitwiseValue19;
                            float intermediateValue115;
                            float intermediateValue116;
                            if (scalarValue40 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue115 = 0.0f;
                                intermediateValue116 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue40 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue40 & 255u);
                                intermediateValue115 = bitwiseValue28 * float((scalarValue40 >> 8u) & 255u);
                                intermediateValue116 = bitwiseValue28 * float((scalarValue40 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue22 = rdLoad_voxelBuffer(((intermediateValue2[productValue126] + sumValue99) + ((intermediateValue2[productValue125] + intermediateValue72) << 8u)) + ((intermediateValue2[productValue127] + intermediateValue74) << 4u));
                            uint scalarValue41 = loadedBufferValue22.x;
                            float bitwiseValue24;
                            float intermediateValue129;
                            float intermediateValue130;
                            if (scalarValue41 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue129 = 0.0f;
                                intermediateValue130 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue41 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue41 & 255u);
                                intermediateValue129 = bitwiseValue29 * float((scalarValue41 >> 8u) & 255u);
                                intermediateValue130 = bitwiseValue29 * float((scalarValue41 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue27 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue42 = loadedBufferValue27.x;
                            float branchMergedValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            if (scalarValue30 == 0u)
                            {
                                branchMergedValue13 = intermediateValue98;
                                branchMergedValue24 = bitwiseValue13;
                                branchMergedValue25 = 0.0f;
                                branchMergedValue26 = 0.0f;
                                branchMergedValue27 = 0.0f;
                                branchMergedValue28 = intermediateValue128;
                                branchMergedValue29 = intermediateValue127;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue110;
                                branchMergedValue32 = intermediateValue109;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue99;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue30 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue13 = intermediateValue98;
                                branchMergedValue24 = bitwiseValue13;
                                branchMergedValue25 = bitwiseValue16 * float((scalarValue30 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue30 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue30 & 255u);
                                branchMergedValue28 = intermediateValue128;
                                branchMergedValue29 = intermediateValue127;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue110;
                                branchMergedValue32 = intermediateValue109;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue99;
                            }
                            intermediateValue139 = branchMergedValue24;
                            intermediateValue140 = branchMergedValue13;
                            intermediateValue141 = branchMergedValue34;
                            intermediateValue142 = branchMergedValue33;
                            intermediateValue144 = branchMergedValue32;
                            intermediateValue146 = branchMergedValue31;
                            intermediateValue148 = branchMergedValue30;
                            intermediateValue150 = branchMergedValue29;
                            intermediateValue152 = branchMergedValue28;
                            intermediateValue154 = branchMergedValue27;
                            intermediateValue155 = branchMergedValue26;
                            intermediateValue156 = branchMergedValue25;
                            break;
                        }
                        else
                        {
                            float intermediateValue112;
                            float intermediateValue113;
                            float intermediateValue114;
                            float sumValue62;
                            float sumValue63;
                            float sumValue64;
                            uint comparisonValue21;
                            bool comparisonValue22;
                            for (;;)
                            {
                                sumValue62 = productValue117 + productValue88;
                                sumValue63 = productValue118 + productValue89;
                                sumValue64 = productValue119 + productValue96;
                                uint comparisonValue103 = ((((uint(productValue117 >= 16.0f) << 1u) | uint(productValue117 < 0.0f)) | (uint(productValue118 < 0.0f) << 2u)) | (uint(productValue118 >= 16.0f) << 3u)) | (uint(productValue119 < 0.0f) << 4u);
                                comparisonValue21 = intermediateValue[comparisonValue103 | (uint(productValue119 >= 16.0f) << 5u)];
                                comparisonValue22 = ((((comparisonValue103 | (uint(productValue119 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue103 & 31u))) == 0u;
                                uint loadedBufferValue8;
                                if (comparisonValue22)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue21 & 31u))) == 0u)
                                    {
                                        intermediateValue112 = 0.0f;
                                        intermediateValue113 = 0.0f;
                                        intermediateValue114 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue8 = ((((uint(sumValue62 - (floor(sumValue62 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue63 - (floor(sumValue63 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue64 - (floor(sumValue64 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue21).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue8 = ((((uint(productValue119) << 4u) & 240u) | (uint(productValue118) & 15u)) | ((uint(productValue117) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                uint scalarValue31 = loadedBufferValue9.x;
                                if (scalarValue31 == 0u)
                                {
                                    intermediateValue112 = 0.0f;
                                    intermediateValue113 = 0.0f;
                                    intermediateValue114 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue31 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue112 = bitwiseValue18 * float(scalarValue31 & 255u);
                                intermediateValue113 = bitwiseValue18 * float((scalarValue31 >> 8u) & 255u);
                                intermediateValue114 = bitwiseValue18 * float((scalarValue31 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue143;
                            float intermediateValue145;
                            float intermediateValue147;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue33;
                            bool comparisonValue34;
                            for (;;)
                            {
                                sumValue82 = sumValue33 + productValue88;
                                sumValue83 = sumValue34 + productValue89;
                                sumValue84 = sumValue35 + productValue96;
                                uint comparisonValue32 = ((((uint(sumValue33 >= 16.0f) << 1u) | uint(sumValue33 < 0.0f)) | (uint(sumValue34 < 0.0f) << 2u)) | (uint(sumValue34 >= 16.0f) << 3u)) | (uint(sumValue35 < 0.0f) << 4u);
                                comparisonValue33 = intermediateValue[comparisonValue32 | (uint(sumValue35 >= 16.0f) << 5u)];
                                comparisonValue34 = ((((comparisonValue32 | (uint(sumValue35 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue32 & 31u))) == 0u;
                                uint loadedBufferValue15;
                                if (comparisonValue34)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue33 & 31u))) == 0u)
                                    {
                                        intermediateValue143 = 0.0f;
                                        intermediateValue145 = 0.0f;
                                        intermediateValue147 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue15 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue33).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue15 = ((((uint(sumValue35) << 4u) & 240u) | (uint(sumValue34) & 15u)) | ((uint(sumValue33) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                uint scalarValue32 = loadedBufferValue12.x;
                                if (scalarValue32 == 0u)
                                {
                                    intermediateValue143 = 0.0f;
                                    intermediateValue145 = 0.0f;
                                    intermediateValue147 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue143 = bitwiseValue20 * float(scalarValue32 & 255u);
                                intermediateValue145 = bitwiseValue20 * float((scalarValue32 >> 8u) & 255u);
                                intermediateValue147 = bitwiseValue20 * float((scalarValue32 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue149;
                            float intermediateValue151;
                            float intermediateValue153;
                            float sumValue91;
                            float sumValue92;
                            float sumValue93;
                            uint comparisonValue43;
                            bool comparisonValue44;
                            for (;;)
                            {
                                sumValue91 = sumValue36 + productValue88;
                                sumValue92 = sumValue37 + productValue89;
                                sumValue93 = sumValue38 + productValue96;
                                uint comparisonValue35 = ((((uint(sumValue36 >= 16.0f) << 1u) | uint(sumValue36 < 0.0f)) | (uint(sumValue37 < 0.0f) << 2u)) | (uint(sumValue37 >= 16.0f) << 3u)) | (uint(sumValue38 < 0.0f) << 4u);
                                comparisonValue43 = intermediateValue[comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)];
                                comparisonValue44 = ((((comparisonValue35 | (uint(sumValue38 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue35 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue44)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue43 & 31u))) == 0u)
                                    {
                                        intermediateValue149 = 0.0f;
                                        intermediateValue151 = 0.0f;
                                        intermediateValue153 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue91 - (floor(sumValue91 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue43).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(sumValue38) << 4u) & 240u) | (uint(sumValue37) & 15u)) | ((uint(sumValue36) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue33 = loadedBufferValue14.x;
                                if (scalarValue33 == 0u)
                                {
                                    intermediateValue149 = 0.0f;
                                    intermediateValue151 = 0.0f;
                                    intermediateValue153 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue149 = bitwiseValue22 * float(scalarValue33 & 255u);
                                intermediateValue151 = bitwiseValue22 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue153 = bitwiseValue22 * float((scalarValue33 >> 16u) & 255u);
                                break;
                            }
                            float sumValue47 = sumValue39 + productValue88;
                            float sumValue48 = sumValue40 + productValue89;
                            float sumValue58 = sumValue41 + productValue96;
                            uint comparisonValue38 = ((((uint(sumValue39 >= 16.0f) << 1u) | uint(sumValue39 < 0.0f)) | (uint(sumValue40 < 0.0f) << 2u)) | (uint(sumValue40 >= 16.0f) << 3u)) | (uint(sumValue41 < 0.0f) << 4u);
                            uint comparisonValue45 = comparisonValue38 | (uint(sumValue41 >= 16.0f) << 5u);
                            uint loadedBufferValue23;
                            if ((((comparisonValue45 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue38 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue45] & 31u))) == 0u)
                                {
                                    intermediateValue139 = intermediateValue112;
                                    intermediateValue140 = intermediateValue113;
                                    intermediateValue141 = intermediateValue114;
                                    intermediateValue142 = intermediateValue143;
                                    intermediateValue144 = intermediateValue145;
                                    intermediateValue146 = intermediateValue147;
                                    intermediateValue148 = intermediateValue149;
                                    intermediateValue150 = intermediateValue151;
                                    intermediateValue152 = intermediateValue153;
                                    intermediateValue154 = 0.0f;
                                    intermediateValue155 = 0.0f;
                                    intermediateValue156 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue47 - (floor(sumValue47 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue48 - (floor(sumValue48 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue58 - (floor(sumValue58 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue45]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue41) << 4u) & 240u) | (uint(sumValue40) & 15u)) | ((uint(sumValue39) << 8u) & 3840u)) + bitwiseValue10;
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue34 = loadedBufferValue16.x;
                            if (scalarValue34 == 0u)
                            {
                                intermediateValue139 = intermediateValue112;
                                intermediateValue140 = intermediateValue113;
                                intermediateValue141 = intermediateValue114;
                                intermediateValue142 = intermediateValue143;
                                intermediateValue144 = intermediateValue145;
                                intermediateValue146 = intermediateValue147;
                                intermediateValue148 = intermediateValue149;
                                intermediateValue150 = intermediateValue151;
                                intermediateValue152 = intermediateValue153;
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
                                intermediateValue156 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue139 = intermediateValue112;
                            intermediateValue140 = intermediateValue113;
                            intermediateValue141 = intermediateValue114;
                            intermediateValue142 = intermediateValue143;
                            intermediateValue144 = intermediateValue145;
                            intermediateValue146 = intermediateValue147;
                            intermediateValue148 = intermediateValue149;
                            intermediateValue150 = intermediateValue151;
                            intermediateValue152 = intermediateValue153;
                            intermediateValue154 = bitwiseValue23 * float(scalarValue34 & 255u);
                            intermediateValue155 = bitwiseValue23 * float((scalarValue34 >> 8u) & 255u);
                            intermediateValue156 = bitwiseValue23 * float((scalarValue34 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue46 = (((intermediateValue144 * productValue121) + (intermediateValue140 * productValue120)) + (intermediateValue150 * productValue122)) + (intermediateValue155 * productValue123);
                    branchMergedValue48 = (((intermediateValue142 * productValue121) + (intermediateValue139 * productValue120)) + (intermediateValue148 * productValue122)) + (intermediateValue154 * productValue123);
                    branchMergedValue49 = (((intermediateValue146 * productValue121) + (intermediateValue141 * productValue120)) + (intermediateValue152 * productValue122)) + (intermediateValue156 * productValue123);
                }
                else
                {
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue165;
                    float intermediateValue167;
                    float intermediateValue169;
                    float intermediateValue171;
                    float intermediateValue173;
                    float intermediateValue174;
                    float intermediateValue175;
                    float intermediateValue70;
                    float intermediateValue71;
                    float intermediateValue72;
                    uint intermediateValue73;
                    uint intermediateValue74;
                    uint intermediateValue75;
                    float intermediateValue78;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    bool comparisonValue18;
                    uint productValue124;
                    uint productValue125;
                    uint productValue126;
                    uint productValue127;
                    uint productValue128;
                    uint productValue129;
                    for (;;)
                    {
                        intermediateValue70 = floor(sumValue28);
                        intermediateValue71 = floor(sumValue29);
                        intermediateValue72 = floor(sumValue30);
                        float sumValue168 = sumValue28 - intermediateValue70;
                        float sumValue169 = sumValue29 - intermediateValue71;
                        float sumValue170 = sumValue30 - intermediateValue72;
                        uint comparisonValue104 = ((uint(sumValue169 >= sumValue170) << 1u) | uint(sumValue168 >= sumValue169)) | (uint(sumValue168 >= sumValue170) << 2u);
                        intermediateValue73 = uint(intermediateValue70);
                        intermediateValue74 = uint(intermediateValue71);
                        intermediateValue75 = uint(intermediateValue72);
                        float scalarValue104 = min(sumValue168, sumValue169);
                        float scalarValue105 = max(sumValue168, sumValue169);
                        intermediateValue78 = min(scalarValue104, sumValue170);
                        float scalarValue106 = max(scalarValue105, sumValue170);
                        float scalarValue107 = max(min(scalarValue105, sumValue170), scalarValue104);
                        sumValue49 = 1.0f - scalarValue106;
                        sumValue50 = scalarValue106 - scalarValue107;
                        sumValue51 = scalarValue107 - intermediateValue78;
                        sumValue52 = intermediateValue70 + 1.0f;
                        sumValue53 = intermediateValue71 + 1.0f;
                        sumValue54 = intermediateValue72 + 1.0f;
                        comparisonValue18 = (((intermediateValue70 >= 0.0f) && (intermediateValue71 >= 0.0f)) && (intermediateValue72 >= 0.0f)) && (((sumValue52 < 16.0f) && (sumValue53 < 16.0f)) && (sumValue54 < 16.0f));
                        productValue124 = 0u + (comparisonValue104 * 3u);
                        productValue125 = 1u + (comparisonValue104 * 3u);
                        productValue126 = 2u + (comparisonValue104 * 3u);
                        productValue127 = 0u + (comparisonValue104 * 3u);
                        productValue128 = 1u + (comparisonValue104 * 3u);
                        productValue129 = 2u + (comparisonValue104 * 3u);
                        if (comparisonValue18)
                        {
                            uint bitwiseValue60 = intermediateValue75 << 4u;
                            uint sumValue171 = intermediateValue74 + bitwiseValue10;
                            uint bitwiseValue61 = sumValue171 + (intermediateValue73 << 8u);
                            uint4 loadedBufferValue62 = rdLoad_voxelBuffer(bitwiseValue61 + bitwiseValue60);
                            uint scalarValue108 = loadedBufferValue62.x;
                            float bitwiseValue15;
                            float intermediateValue101;
                            float intermediateValue102;
                            if (scalarValue108 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue101 = 0.0f;
                                intermediateValue102 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue62 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue62 * float(scalarValue108 & 255u);
                                intermediateValue101 = bitwiseValue62 * float((scalarValue108 >> 8u) & 255u);
                                intermediateValue102 = bitwiseValue62 * float((scalarValue108 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue63 = rdLoad_voxelBuffer(((intermediateValue1[productValue125] + sumValue171) + ((intermediateValue1[productValue124] + intermediateValue73) << 8u)) + ((intermediateValue1[productValue126] + intermediateValue75) << 4u));
                            uint scalarValue109 = loadedBufferValue63.x;
                            float bitwiseValue19;
                            float intermediateValue116;
                            float intermediateValue117;
                            if (scalarValue109 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue116 = 0.0f;
                                intermediateValue117 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue63 = float(scalarValue109 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue63 * float(scalarValue109 & 255u);
                                intermediateValue116 = bitwiseValue63 * float((scalarValue109 >> 8u) & 255u);
                                intermediateValue117 = bitwiseValue63 * float((scalarValue109 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue64 = rdLoad_voxelBuffer(((intermediateValue2[productValue128] + sumValue171) + ((intermediateValue2[productValue127] + intermediateValue73) << 8u)) + ((intermediateValue2[productValue129] + intermediateValue75) << 4u));
                            uint scalarValue110 = loadedBufferValue64.x;
                            float bitwiseValue24;
                            float intermediateValue130;
                            float intermediateValue131;
                            if (scalarValue110 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue130 = 0.0f;
                                intermediateValue131 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue64 = float(scalarValue110 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue64 * float(scalarValue110 & 255u);
                                intermediateValue130 = bitwiseValue64 * float((scalarValue110 >> 8u) & 255u);
                                intermediateValue131 = bitwiseValue64 * float((scalarValue110 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue65 = rdLoad_voxelBuffer((bitwiseValue61 + 273u) + bitwiseValue60);
                            uint scalarValue111 = loadedBufferValue65.x;
                            float branchMergedValue14;
#endif
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float branchMergedValue56;
                            float branchMergedValue57;
                            if (scalarValue81 == 0u)
                            {
                                branchMergedValue19 = 0.0f;
                                branchMergedValue32 = 0.0f;
                                branchMergedValue33 = 0.0f;
                                branchMergedValue34 = intermediateValue171;
                                branchMergedValue35 = intermediateValue170;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue148;
                                branchMergedValue38 = intermediateValue147;
                                branchMergedValue39 = bitwiseValue17;
                                branchMergedValue40 = intermediateValue133;
                                branchMergedValue56 = intermediateValue132;
                                branchMergedValue57 = bitwiseValue13;
                            }
                            else
                            {
                                float bitwiseValue44 = float(scalarValue81 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue19 = bitwiseValue44 * float((scalarValue81 >> 8u) & 255u);
                                branchMergedValue32 = bitwiseValue44 * float((scalarValue81 >> 16u) & 255u);
                                branchMergedValue33 = bitwiseValue44 * float(scalarValue81 & 255u);
                                branchMergedValue34 = intermediateValue171;
                                branchMergedValue35 = intermediateValue170;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue148;
                                branchMergedValue38 = intermediateValue147;
                                branchMergedValue39 = bitwiseValue17;
                                branchMergedValue40 = intermediateValue133;
                                branchMergedValue56 = intermediateValue132;
                                branchMergedValue57 = bitwiseValue13;
                            }
                            intermediateValue176 = branchMergedValue57;
                            intermediateValue177 = branchMergedValue56;
                            intermediateValue178 = branchMergedValue40;
                            intermediateValue179 = branchMergedValue39;
                            intermediateValue181 = branchMergedValue38;
                            intermediateValue183 = branchMergedValue37;
                            intermediateValue185 = branchMergedValue36;
                            intermediateValue187 = branchMergedValue35;
                            intermediateValue189 = branchMergedValue34;
                            intermediateValue191 = branchMergedValue33;
                            intermediateValue192 = branchMergedValue19;
                            intermediateValue193 = branchMergedValue32;
                            break;
                        }
                        else
                        {
                            float intermediateValue150;
                            float intermediateValue151;
                            float intermediateValue152;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            uint comparisonValue26;
                            bool comparisonValue27;
                            for (;;)
                            {
                                sumValue77 = productValue140 + productValue88;
                                sumValue78 = productValue141 + productValue89;
                                sumValue79 = productValue142 + productValue96;
                                uint comparisonValue81 = ((((uint(productValue140 >= 16.0f) << 1u) | uint(productValue140 < 0.0f)) | (uint(productValue141 < 0.0f) << 2u)) | (uint(productValue141 >= 16.0f) << 3u)) | (uint(productValue142 < 0.0f) << 4u);
                                comparisonValue26 = intermediateValue[comparisonValue81 | (uint(productValue142 >= 16.0f) << 5u)];
                                comparisonValue27 = ((((comparisonValue81 | (uint(productValue142 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue81 & 31u))) == 0u;
                                uint loadedBufferValue10;
                                if (comparisonValue27)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue26 & 31u))) == 0u)
                                    {
                                        intermediateValue150 = 0.0f;
                                        intermediateValue151 = 0.0f;
                                        intermediateValue152 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue10 = ((((uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue79 - (floor(sumValue79 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue26).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue10 = ((((uint(productValue142) << 4u) & 240u) | (uint(productValue141) & 15u)) | ((uint(productValue140) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue49 = rdLoad_voxelBuffer(loadedBufferValue10);
                                uint scalarValue82 = loadedBufferValue49.x;
                                if (scalarValue82 == 0u)
                                {
                                    intermediateValue150 = 0.0f;
                                    intermediateValue151 = 0.0f;
                                    intermediateValue152 = 0.0f;
                                    break;
                                }
                                float bitwiseValue45 = float(scalarValue82 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue150 = bitwiseValue45 * float(scalarValue82 & 255u);
                                intermediateValue151 = bitwiseValue45 * float((scalarValue82 >> 8u) & 255u);
                                intermediateValue152 = bitwiseValue45 * float((scalarValue82 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue180;
                            float intermediateValue182;
                            float intermediateValue184;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue39;
                            bool comparisonValue40;
                            for (;;)
                            {
                                sumValue93 = sumValue49 + productValue88;
                                sumValue94 = sumValue50 + productValue89;
                                sumValue95 = sumValue51 + productValue96;
                                uint comparisonValue82 = ((((uint(sumValue49 >= 16.0f) << 1u) | uint(sumValue49 < 0.0f)) | (uint(sumValue50 < 0.0f) << 2u)) | (uint(sumValue50 >= 16.0f) << 3u)) | (uint(sumValue51 < 0.0f) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue82 | (uint(sumValue51 >= 16.0f) << 5u)];
                                comparisonValue40 = ((((comparisonValue82 | (uint(sumValue51 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue82 & 31u))) == 0u;
                                uint loadedBufferValue24;
                                if (comparisonValue40)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue180 = 0.0f;
                                        intermediateValue182 = 0.0f;
                                        intermediateValue184 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue24 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue39).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue24 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue50 = rdLoad_voxelBuffer(loadedBufferValue24);
                                uint scalarValue83 = loadedBufferValue50.x;
                                if (scalarValue83 == 0u)
                                {
                                    intermediateValue180 = 0.0f;
                                    intermediateValue182 = 0.0f;
                                    intermediateValue184 = 0.0f;
                                    break;
                                }
                                float bitwiseValue46 = float(scalarValue83 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue180 = bitwiseValue46 * float(scalarValue83 & 255u);
                                intermediateValue182 = bitwiseValue46 * float((scalarValue83 >> 8u) & 255u);
                                intermediateValue184 = bitwiseValue46 * float((scalarValue83 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue186;
                            float intermediateValue188;
                            float intermediateValue190;
                            float sumValue104;
                            float sumValue105;
                            float sumValue106;
                            uint comparisonValue49;
                            bool comparisonValue50;
                            for (;;)
                            {
                                sumValue104 = sumValue52 + productValue88;
                                sumValue105 = sumValue53 + productValue89;
                                sumValue106 = sumValue54 + productValue96;
                                uint comparisonValue57 = ((((uint(sumValue52 >= 16.0f) << 1u) | uint(sumValue52 < 0.0f)) | (uint(sumValue53 < 0.0f) << 2u)) | (uint(sumValue53 >= 16.0f) << 3u)) | (uint(sumValue54 < 0.0f) << 4u);
                                comparisonValue49 = intermediateValue[comparisonValue57 | (uint(sumValue54 >= 16.0f) << 5u)];
                                comparisonValue50 = ((((comparisonValue57 | (uint(sumValue54 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue57 & 31u))) == 0u;
                                uint loadedBufferValue28;
                                if (comparisonValue50)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue49 & 31u))) == 0u)
                                    {
                                        intermediateValue186 = 0.0f;
                                        intermediateValue188 = 0.0f;
                                        intermediateValue190 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue28 = ((((uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue49).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue28 = ((((uint(sumValue54) << 4u) & 240u) | (uint(sumValue53) & 15u)) | ((uint(sumValue52) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue51 = rdLoad_voxelBuffer(loadedBufferValue28);
                                uint scalarValue84 = loadedBufferValue51.x;
                                if (scalarValue84 == 0u)
                                {
                                    intermediateValue186 = 0.0f;
                                    intermediateValue188 = 0.0f;
                                    intermediateValue190 = 0.0f;
                                    break;
                                }
                                float bitwiseValue47 = float(scalarValue84 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue186 = bitwiseValue47 * float(scalarValue84 & 255u);
                                intermediateValue188 = bitwiseValue47 * float((scalarValue84 >> 8u) & 255u);
                                intermediateValue190 = bitwiseValue47 * float((scalarValue84 >> 16u) & 255u);
                                break;
                            }
                            float sumValue148 = sumValue55 + productValue88;
                            float sumValue149 = sumValue56 + productValue89;
                            float sumValue150 = sumValue57 + productValue96;
                            uint comparisonValue83 = ((((uint(sumValue55 >= 16.0f) << 1u) | uint(sumValue55 < 0.0f)) | (uint(sumValue56 < 0.0f) << 2u)) | (uint(sumValue56 >= 16.0f) << 3u)) | (uint(sumValue57 < 0.0f) << 4u);
                            uint comparisonValue84 = comparisonValue83 | (uint(sumValue57 >= 16.0f) << 5u);
                            uint loadedBufferValue32;
                            if ((((comparisonValue84 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue83 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue84] & 31u))) == 0u)
                                {
                                    intermediateValue176 = intermediateValue150;
                                    intermediateValue177 = intermediateValue151;
                                    intermediateValue178 = intermediateValue152;
                                    intermediateValue179 = intermediateValue180;
                                    intermediateValue181 = intermediateValue182;
                                    intermediateValue183 = intermediateValue184;
                                    intermediateValue185 = intermediateValue186;
                                    intermediateValue187 = intermediateValue188;
                                    intermediateValue189 = intermediateValue190;
                                    intermediateValue191 = 0.0f;
                                    intermediateValue192 = 0.0f;
                                    intermediateValue193 = 0.0f;
                                    break;
                                }
                                loadedBufferValue32 = ((((uint(sumValue148 - (floor(sumValue148 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue149 - (floor(sumValue149 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue150 - (floor(sumValue150 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue84]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue32 = ((((uint(sumValue57) << 4u) & 240u) | (uint(sumValue56) & 15u)) | ((uint(sumValue55) << 8u) & 3840u)) + bitwiseValue10;
                            }
                            uint4 loadedBufferValue52 = rdLoad_voxelBuffer(loadedBufferValue32);
                            uint scalarValue85 = loadedBufferValue52.x;
                            if (scalarValue85 == 0u)
                            {
                                intermediateValue176 = intermediateValue150;
                                intermediateValue177 = intermediateValue151;
                                intermediateValue178 = intermediateValue152;
                                intermediateValue179 = intermediateValue180;
                                intermediateValue181 = intermediateValue182;
                                intermediateValue183 = intermediateValue184;
                                intermediateValue185 = intermediateValue186;
                                intermediateValue187 = intermediateValue188;
                                intermediateValue189 = intermediateValue190;
                                intermediateValue191 = 0.0f;
                                intermediateValue192 = 0.0f;
                                intermediateValue193 = 0.0f;
                                break;
                            }
                            float bitwiseValue48 = float(scalarValue85 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue176 = intermediateValue150;
                            intermediateValue177 = intermediateValue151;
                            intermediateValue178 = intermediateValue152;
                            intermediateValue179 = intermediateValue180;
                            intermediateValue181 = intermediateValue182;
                            intermediateValue183 = intermediateValue184;
                            intermediateValue185 = intermediateValue186;
                            intermediateValue187 = intermediateValue188;
                            intermediateValue189 = intermediateValue190;
                            intermediateValue191 = bitwiseValue48 * float(scalarValue85 & 255u);
                            intermediateValue192 = bitwiseValue48 * float((scalarValue85 >> 8u) & 255u);
                            intermediateValue193 = bitwiseValue48 * float((scalarValue85 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue61 = (((intermediateValue183 * productValue144) + (intermediateValue178 * productValue143)) + (intermediateValue189 * productValue145)) + (intermediateValue193 * productValue146);
                    branchMergedValue65 = (((intermediateValue181 * productValue144) + (intermediateValue177 * productValue143)) + (intermediateValue187 * productValue145)) + (intermediateValue192 * productValue146);
                    branchMergedValue66 = (((intermediateValue179 * productValue144) + (intermediateValue176 * productValue143)) + (intermediateValue185 * productValue145)) + (intermediateValue191 * productValue146);
                }
                else
                {
                    float intermediateValue195;
                    float intermediateValue196;
                    float intermediateValue197;
                    float intermediateValue198;
                    float intermediateValue200;
                    float intermediateValue202;
                    float intermediateValue204;
                    float intermediateValue206;
                    float intermediateValue208;
                    float intermediateValue210;
                    float intermediateValue211;
                    float intermediateValue212;
                    float intermediateValue106;
                    float intermediateValue107;
                    float intermediateValue108;
                    uint intermediateValue109;
                    uint intermediateValue110;
                    uint intermediateValue111;
                    float intermediateValue114;
                    float sumValue65;
                    float sumValue66;
                    float sumValue67;
                    float sumValue68;
                    float sumValue69;
                    float sumValue70;
                    bool comparisonValue22;
                    uint productValue147;
                    uint productValue148;
                    uint productValue149;
                    uint productValue150;
                    uint productValue151;
                    uint productValue152;
                    for (;;)
                    {
                        intermediateValue106 = floor(sumValue28);
                        intermediateValue107 = floor(sumValue29);
                        intermediateValue108 = floor(sumValue30);
                        float sumValue151 = sumValue28 - intermediateValue106;
                        float sumValue152 = sumValue29 - intermediateValue107;
                        float sumValue153 = sumValue30 - intermediateValue108;
                        uint comparisonValue85 = ((uint(sumValue152 >= sumValue153) << 1u) | uint(sumValue151 >= sumValue152)) | (uint(sumValue151 >= sumValue153) << 2u);
                        intermediateValue109 = uint(intermediateValue106);
                        intermediateValue110 = uint(intermediateValue107);
                        intermediateValue111 = uint(intermediateValue108);
                        float scalarValue86 = min(sumValue151, sumValue152);
                        float scalarValue87 = max(sumValue151, sumValue152);
                        intermediateValue114 = min(scalarValue86, sumValue153);
                        float scalarValue88 = max(scalarValue87, sumValue153);
                        float scalarValue89 = max(min(scalarValue87, sumValue153), scalarValue86);
                        sumValue65 = 1.0f - scalarValue88;
                        sumValue66 = scalarValue88 - scalarValue89;
                        sumValue67 = scalarValue89 - intermediateValue114;
                        sumValue68 = intermediateValue106 + 1.0f;
                        sumValue69 = intermediateValue107 + 1.0f;
                        sumValue70 = intermediateValue108 + 1.0f;
                        comparisonValue22 = (((intermediateValue106 >= 0.0f) && (intermediateValue107 >= 0.0f)) && (intermediateValue108 >= 0.0f)) && (((sumValue68 < 16.0f) && (sumValue69 < 16.0f)) && (sumValue70 < 16.0f));
                        productValue147 = 0u + (comparisonValue85 * 3u);
                        productValue148 = 1u + (comparisonValue85 * 3u);
                        productValue149 = 2u + (comparisonValue85 * 3u);
                        productValue150 = 0u + (comparisonValue85 * 3u);
                        productValue151 = 1u + (comparisonValue85 * 3u);
                        productValue152 = 2u + (comparisonValue85 * 3u);
                        if (comparisonValue22)
                        {
                            uint bitwiseValue49 = intermediateValue111 << 4u;
                            uint sumValue154 = intermediateValue110 + bitwiseValue10;
                            uint bitwiseValue50 = sumValue154 + (intermediateValue109 << 8u);
                            uint4 loadedBufferValue53 = rdLoad_voxelBuffer(bitwiseValue50 + bitwiseValue49);
                            uint scalarValue90 = loadedBufferValue53.x;
                            float bitwiseValue15;
                            float intermediateValue135;
                            float intermediateValue136;
                            if (scalarValue90 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue135 = 0.0f;
                                intermediateValue136 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue51 = float(scalarValue90 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue51 * float(scalarValue90 & 255u);
                                intermediateValue135 = bitwiseValue51 * float((scalarValue90 >> 8u) & 255u);
                                intermediateValue136 = bitwiseValue51 * float((scalarValue90 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue54 = rdLoad_voxelBuffer(((intermediateValue1[productValue148] + sumValue154) + ((intermediateValue1[productValue147] + intermediateValue109) << 8u)) + ((intermediateValue1[productValue149] + intermediateValue111) << 4u));
                            uint scalarValue91 = loadedBufferValue54.x;
                            float bitwiseValue19;
                            float intermediateValue154;
                            float intermediateValue155;
                            if (scalarValue91 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue52 = float(scalarValue91 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue52 * float(scalarValue91 & 255u);
                                intermediateValue154 = bitwiseValue52 * float((scalarValue91 >> 8u) & 255u);
                                intermediateValue155 = bitwiseValue52 * float((scalarValue91 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue55 = rdLoad_voxelBuffer(((intermediateValue2[productValue151] + sumValue154) + ((intermediateValue2[productValue150] + intermediateValue109) << 8u)) + ((intermediateValue2[productValue152] + intermediateValue111) << 4u));
                            uint scalarValue92 = loadedBufferValue55.x;
                            float bitwiseValue24;
                            float intermediateValue173;
                            float intermediateValue174;
                            if (scalarValue92 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue53 = float(scalarValue92 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue53 * float(scalarValue92 & 255u);
                                intermediateValue173 = bitwiseValue53 * float((scalarValue92 >> 8u) & 255u);
                                intermediateValue174 = bitwiseValue53 * float((scalarValue92 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue56 = rdLoad_voxelBuffer((bitwiseValue50 + 273u) + bitwiseValue49);
                            uint scalarValue93 = loadedBufferValue56.x;
                            float branchMergedValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float branchMergedValue56;
                            float branchMergedValue57;
                            if (scalarValue81 == 0u)
                            {
                                branchMergedValue19 = 0.0f;
                                branchMergedValue32 = 0.0f;
                                branchMergedValue33 = 0.0f;
                                branchMergedValue34 = intermediateValue172;
                                branchMergedValue35 = intermediateValue171;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue149;
                                branchMergedValue38 = intermediateValue148;
                                branchMergedValue39 = bitwiseValue17;
                                branchMergedValue40 = intermediateValue134;
                                branchMergedValue56 = intermediateValue133;
                                branchMergedValue57 = bitwiseValue13;
                            }
                            else
                            {
                                float bitwiseValue44 = float(scalarValue81 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue19 = bitwiseValue44 * float((scalarValue81 >> 8u) & 255u);
                                branchMergedValue32 = bitwiseValue44 * float((scalarValue81 >> 16u) & 255u);
                                branchMergedValue33 = bitwiseValue44 * float(scalarValue81 & 255u);
                                branchMergedValue34 = intermediateValue172;
                                branchMergedValue35 = intermediateValue171;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue149;
                                branchMergedValue38 = intermediateValue148;
                                branchMergedValue39 = bitwiseValue17;
                                branchMergedValue40 = intermediateValue134;
                                branchMergedValue56 = intermediateValue133;
                                branchMergedValue57 = bitwiseValue13;
                            }
                            intermediateValue177 = branchMergedValue57;
                            intermediateValue178 = branchMergedValue56;
                            intermediateValue179 = branchMergedValue40;
                            intermediateValue180 = branchMergedValue39;
                            intermediateValue182 = branchMergedValue38;
                            intermediateValue184 = branchMergedValue37;
                            intermediateValue186 = branchMergedValue36;
                            intermediateValue188 = branchMergedValue35;
                            intermediateValue190 = branchMergedValue34;
                            intermediateValue192 = branchMergedValue33;
                            intermediateValue193 = branchMergedValue19;
                            intermediateValue194 = branchMergedValue32;
                            break;
                        }
                        else
                        {
                            float intermediateValue151;
                            float intermediateValue152;
                            float intermediateValue153;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            uint comparisonValue26;
                            bool comparisonValue27;
                            for (;;)
                            {
                                sumValue77 = productValue142 + productValue88;
                                sumValue78 = productValue143 + productValue89;
                                sumValue79 = productValue144 + productValue96;
                                uint comparisonValue118 = ((((uint(productValue142 >= 16.0f) << 1u) | uint(productValue142 < 0.0f)) | (uint(productValue143 < 0.0f) << 2u)) | (uint(productValue143 >= 16.0f) << 3u)) | (uint(productValue144 < 0.0f) << 4u);
                                comparisonValue26 = intermediateValue[comparisonValue118 | (uint(productValue144 >= 16.0f) << 5u)];
                                comparisonValue27 = ((((comparisonValue118 | (uint(productValue144 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue118 & 31u))) == 0u;
                                uint loadedBufferValue10;
                                if (comparisonValue27)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue26 & 31u))) == 0u)
                                    {
                                        intermediateValue151 = 0.0f;
                                        intermediateValue152 = 0.0f;
                                        intermediateValue153 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue10 = ((((uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue79 - (floor(sumValue79 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue26).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue10 = ((((uint(productValue144) << 4u) & 240u) | (uint(productValue143) & 15u)) | ((uint(productValue142) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue49 = rdLoad_voxelBuffer(loadedBufferValue10);
                                uint scalarValue82 = loadedBufferValue49.x;
                                if (scalarValue82 == 0u)
                                {
                                    intermediateValue151 = 0.0f;
                                    intermediateValue152 = 0.0f;
                                    intermediateValue153 = 0.0f;
                                    break;
                                }
                                float bitwiseValue45 = float(scalarValue82 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue151 = bitwiseValue45 * float(scalarValue82 & 255u);
                                intermediateValue152 = bitwiseValue45 * float((scalarValue82 >> 8u) & 255u);
                                intermediateValue153 = bitwiseValue45 * float((scalarValue82 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue181;
                            float intermediateValue183;
                            float intermediateValue185;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue39;
                            bool comparisonValue40;
                            for (;;)
                            {
                                sumValue93 = sumValue49 + productValue88;
                                sumValue94 = sumValue50 + productValue89;
                                sumValue95 = sumValue51 + productValue96;
                                uint comparisonValue82 = ((((uint(sumValue49 >= 16.0f) << 1u) | uint(sumValue49 < 0.0f)) | (uint(sumValue50 < 0.0f) << 2u)) | (uint(sumValue50 >= 16.0f) << 3u)) | (uint(sumValue51 < 0.0f) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue82 | (uint(sumValue51 >= 16.0f) << 5u)];
                                comparisonValue40 = ((((comparisonValue82 | (uint(sumValue51 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue82 & 31u))) == 0u;
                                uint loadedBufferValue24;
                                if (comparisonValue40)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue181 = 0.0f;
                                        intermediateValue183 = 0.0f;
                                        intermediateValue185 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue24 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue39).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue24 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue50 = rdLoad_voxelBuffer(loadedBufferValue24);
                                uint scalarValue83 = loadedBufferValue50.x;
                                if (scalarValue83 == 0u)
                                {
                                    intermediateValue181 = 0.0f;
                                    intermediateValue183 = 0.0f;
                                    intermediateValue185 = 0.0f;
                                    break;
                                }
                                float bitwiseValue46 = float(scalarValue83 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue181 = bitwiseValue46 * float(scalarValue83 & 255u);
                                intermediateValue183 = bitwiseValue46 * float((scalarValue83 >> 8u) & 255u);
                                intermediateValue185 = bitwiseValue46 * float((scalarValue83 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue187;
                            float intermediateValue189;
                            float intermediateValue191;
                            float sumValue104;
                            float sumValue105;
                            float sumValue106;
                            uint comparisonValue49;
                            bool comparisonValue50;
                            for (;;)
                            {
                                sumValue104 = sumValue52 + productValue88;
                                sumValue105 = sumValue53 + productValue89;
                                sumValue106 = sumValue54 + productValue96;
                                uint comparisonValue57 = ((((uint(sumValue52 >= 16.0f) << 1u) | uint(sumValue52 < 0.0f)) | (uint(sumValue53 < 0.0f) << 2u)) | (uint(sumValue53 >= 16.0f) << 3u)) | (uint(sumValue54 < 0.0f) << 4u);
                                comparisonValue49 = intermediateValue[comparisonValue57 | (uint(sumValue54 >= 16.0f) << 5u)];
                                comparisonValue50 = ((((comparisonValue57 | (uint(sumValue54 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue57 & 31u))) == 0u;
                                uint loadedBufferValue28;
                                if (comparisonValue50)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue49 & 31u))) == 0u)
                                    {
                                        intermediateValue187 = 0.0f;
                                        intermediateValue189 = 0.0f;
                                        intermediateValue191 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue28 = ((((uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue49).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue28 = ((((uint(sumValue54) << 4u) & 240u) | (uint(sumValue53) & 15u)) | ((uint(sumValue52) << 8u) & 3840u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue51 = rdLoad_voxelBuffer(loadedBufferValue28);
                                uint scalarValue84 = loadedBufferValue51.x;
                                if (scalarValue84 == 0u)
                                {
                                    intermediateValue187 = 0.0f;
                                    intermediateValue189 = 0.0f;
                                    intermediateValue191 = 0.0f;
                                    break;
                                }
                                float bitwiseValue47 = float(scalarValue84 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue187 = bitwiseValue47 * float(scalarValue84 & 255u);
                                intermediateValue189 = bitwiseValue47 * float((scalarValue84 >> 8u) & 255u);
                                intermediateValue191 = bitwiseValue47 * float((scalarValue84 >> 16u) & 255u);
                                break;
                            }
                            float sumValue148 = sumValue55 + productValue88;
                            float sumValue149 = sumValue56 + productValue89;
                            float sumValue150 = sumValue57 + productValue96;
                            uint comparisonValue83 = ((((uint(sumValue55 >= 16.0f) << 1u) | uint(sumValue55 < 0.0f)) | (uint(sumValue56 < 0.0f) << 2u)) | (uint(sumValue56 >= 16.0f) << 3u)) | (uint(sumValue57 < 0.0f) << 4u);
                            uint comparisonValue84 = comparisonValue83 | (uint(sumValue57 >= 16.0f) << 5u);
                            uint loadedBufferValue32;
                            if ((((comparisonValue84 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue83 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue84] & 31u))) == 0u)
                                {
                                    intermediateValue177 = intermediateValue151;
                                    intermediateValue178 = intermediateValue152;
                                    intermediateValue179 = intermediateValue153;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = intermediateValue191;
                                    intermediateValue192 = 0.0f;
                                    intermediateValue193 = 0.0f;
                                    intermediateValue194 = 0.0f;
                                    break;
                                }
                                loadedBufferValue32 = ((((uint(sumValue148 - (floor(sumValue148 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue149 - (floor(sumValue149 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue150 - (floor(sumValue150 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue84]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue32 = ((((uint(sumValue57) << 4u) & 240u) | (uint(sumValue56) & 15u)) | ((uint(sumValue55) << 8u) & 3840u)) + bitwiseValue10;
                            }
                            uint4 loadedBufferValue52 = rdLoad_voxelBuffer(loadedBufferValue32);
                            uint scalarValue85 = loadedBufferValue52.x;
                            if (scalarValue85 == 0u)
                            {
                                intermediateValue177 = intermediateValue151;
                                intermediateValue178 = intermediateValue152;
                                intermediateValue179 = intermediateValue153;
                                intermediateValue180 = intermediateValue181;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = intermediateValue191;
                                intermediateValue192 = 0.0f;
                                intermediateValue193 = 0.0f;
                                intermediateValue194 = 0.0f;
                                break;
                            }
                            float bitwiseValue48 = float(scalarValue85 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue177 = intermediateValue151;
                            intermediateValue178 = intermediateValue152;
                            intermediateValue179 = intermediateValue153;
                            intermediateValue180 = intermediateValue181;
                            intermediateValue182 = intermediateValue183;
                            intermediateValue184 = intermediateValue185;
                            intermediateValue186 = intermediateValue187;
                            intermediateValue188 = intermediateValue189;
                            intermediateValue190 = intermediateValue191;
                            intermediateValue192 = bitwiseValue48 * float(scalarValue85 & 255u);
                            intermediateValue193 = bitwiseValue48 * float((scalarValue85 >> 8u) & 255u);
                            intermediateValue194 = bitwiseValue48 * float((scalarValue85 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue61 = (((intermediateValue184 * productValue146) + (intermediateValue179 * productValue145)) + (intermediateValue190 * productValue147)) + (intermediateValue194 * productValue148);
                    branchMergedValue65 = (((intermediateValue182 * productValue146) + (intermediateValue178 * productValue145)) + (intermediateValue188 * productValue147)) + (intermediateValue193 * productValue148);
                    branchMergedValue66 = (((intermediateValue180 * productValue146) + (intermediateValue177 * productValue145)) + (intermediateValue186 * productValue147)) + (intermediateValue192 * productValue148);
                }
                else
                {
                    float intermediateValue196;
                    float intermediateValue197;
                    float intermediateValue198;
                    float intermediateValue199;
                    float intermediateValue201;
                    float intermediateValue203;
                    float intermediateValue205;
                    float intermediateValue207;
                    float intermediateValue209;
                    float intermediateValue211;
                    float intermediateValue212;
                    float intermediateValue213;
                    float intermediateValue107;
                    float intermediateValue108;
                    float intermediateValue109;
                    uint intermediateValue110;
                    uint intermediateValue111;
                    uint intermediateValue112;
                    float intermediateValue115;
                    float sumValue65;
                    float sumValue66;
                    float sumValue67;
                    float sumValue68;
                    float sumValue69;
                    float sumValue70;
                    bool comparisonValue22;
                    uint productValue149;
                    uint productValue150;
                    uint productValue151;
                    uint productValue152;
                    uint productValue153;
                    uint productValue154;
                    for (;;)
                    {
                        intermediateValue107 = floor(sumValue28);
                        intermediateValue108 = floor(sumValue29);
                        intermediateValue109 = floor(sumValue30);
                        float sumValue184 = sumValue28 - intermediateValue107;
                        float sumValue185 = sumValue29 - intermediateValue108;
                        float sumValue186 = sumValue30 - intermediateValue109;
                        uint comparisonValue119 = ((uint(sumValue185 >= sumValue186) << 1u) | uint(sumValue184 >= sumValue185)) | (uint(sumValue184 >= sumValue186) << 2u);
                        intermediateValue110 = uint(intermediateValue107);
                        intermediateValue111 = uint(intermediateValue108);
                        intermediateValue112 = uint(intermediateValue109);
                        float scalarValue118 = min(sumValue184, sumValue185);
                        float scalarValue119 = max(sumValue184, sumValue185);
                        intermediateValue115 = min(scalarValue118, sumValue186);
                        float scalarValue120 = max(scalarValue119, sumValue186);
                        float scalarValue121 = max(min(scalarValue119, sumValue186), scalarValue118);
                        sumValue65 = 1.0f - scalarValue120;
                        sumValue66 = scalarValue120 - scalarValue121;
                        sumValue67 = scalarValue121 - intermediateValue115;
                        sumValue68 = intermediateValue107 + 1.0f;
                        sumValue69 = intermediateValue108 + 1.0f;
                        sumValue70 = intermediateValue109 + 1.0f;
                        comparisonValue22 = (((intermediateValue107 >= 0.0f) && (intermediateValue108 >= 0.0f)) && (intermediateValue109 >= 0.0f)) && (((sumValue68 < 16.0f) && (sumValue69 < 16.0f)) && (sumValue70 < 16.0f));
                        productValue149 = 0u + (comparisonValue119 * 3u);
                        productValue150 = 1u + (comparisonValue119 * 3u);
                        productValue151 = 2u + (comparisonValue119 * 3u);
                        productValue152 = 0u + (comparisonValue119 * 3u);
                        productValue153 = 1u + (comparisonValue119 * 3u);
                        productValue154 = 2u + (comparisonValue119 * 3u);
                        if (comparisonValue22)
                        {
                            uint bitwiseValue67 = intermediateValue112 << 4u;
                            uint sumValue187 = intermediateValue111 + bitwiseValue10;
                            uint bitwiseValue68 = sumValue187 + (intermediateValue110 << 8u);
                            uint4 loadedBufferValue67 = rdLoad_voxelBuffer(bitwiseValue68 + bitwiseValue67);
                            uint scalarValue122 = loadedBufferValue67.x;
                            float bitwiseValue15;
                            float intermediateValue136;
                            float intermediateValue137;
                            if (scalarValue122 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue136 = 0.0f;
                                intermediateValue137 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue69 = float(scalarValue122 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue69 * float(scalarValue122 & 255u);
                                intermediateValue136 = bitwiseValue69 * float((scalarValue122 >> 8u) & 255u);
                                intermediateValue137 = bitwiseValue69 * float((scalarValue122 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue68 = rdLoad_voxelBuffer(((intermediateValue1[productValue150] + sumValue187) + ((intermediateValue1[productValue149] + intermediateValue110) << 8u)) + ((intermediateValue1[productValue151] + intermediateValue112) << 4u));
                            uint scalarValue123 = loadedBufferValue68.x;
                            float bitwiseValue19;
                            float intermediateValue155;
                            float intermediateValue156;
                            if (scalarValue123 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue155 = 0.0f;
                                intermediateValue156 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue70 = float(scalarValue123 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue70 * float(scalarValue123 & 255u);
                                intermediateValue155 = bitwiseValue70 * float((scalarValue123 >> 8u) & 255u);
                                intermediateValue156 = bitwiseValue70 * float((scalarValue123 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue69 = rdLoad_voxelBuffer(((intermediateValue2[productValue153] + sumValue187) + ((intermediateValue2[productValue152] + intermediateValue110) << 8u)) + ((intermediateValue2[productValue154] + intermediateValue112) << 4u));
                            uint scalarValue124 = loadedBufferValue69.x;
                            float bitwiseValue24;
                            float intermediateValue174;
                            float intermediateValue175;
                            if (scalarValue124 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue174 = 0.0f;
                                intermediateValue175 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue71 = float(scalarValue124 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue71 * float(scalarValue124 & 255u);
                                intermediateValue174 = bitwiseValue71 * float((scalarValue124 >> 8u) & 255u);
                                intermediateValue175 = bitwiseValue71 * float((scalarValue124 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue70 = rdLoad_voxelBuffer((bitwiseValue68 + 273u) + bitwiseValue67);
                            uint scalarValue125 = loadedBufferValue70.x;
                            float branchMergedValue20;
#endif
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
                            float branchMergedValue44;
                            float branchMergedValue45;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            if (scalarValue42 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue58;
                            float branchMergedValue59;
                            if (scalarValue93 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            if (scalarValue111 == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue58;
                            float branchMergedValue59;
                            if (scalarValue125 == 0u)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue14 = 0.0f;
                                branchMergedValue35 = 0.0f;
                                branchMergedValue36 = bitwiseValue15;
                                branchMergedValue37 = intermediateValue100;
                                branchMergedValue38 = intermediateValue101;
                                branchMergedValue39 = bitwiseValue19;
                                branchMergedValue40 = intermediateValue115;
                                branchMergedValue41 = intermediateValue116;
                                branchMergedValue42 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue129;
                                branchMergedValue44 = intermediateValue130;
                                branchMergedValue45 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue20 = intermediateValue136;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = 0.0f;
                                branchMergedValue43 = 0.0f;
                                branchMergedValue44 = intermediateValue174;
                                branchMergedValue45 = intermediateValue173;
                                branchMergedValue46 = bitwiseValue24;
                                branchMergedValue47 = intermediateValue155;
                                branchMergedValue48 = intermediateValue154;
                                branchMergedValue49 = bitwiseValue19;
                                branchMergedValue58 = intermediateValue135;
                                branchMergedValue59 = bitwiseValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue14 = 0.0f;
                                branchMergedValue35 = 0.0f;
                                branchMergedValue36 = bitwiseValue15;
                                branchMergedValue37 = intermediateValue101;
                                branchMergedValue38 = intermediateValue102;
                                branchMergedValue39 = bitwiseValue19;
                                branchMergedValue40 = intermediateValue116;
                                branchMergedValue41 = intermediateValue117;
                                branchMergedValue42 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue130;
                                branchMergedValue44 = intermediateValue131;
                                branchMergedValue45 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue20 = intermediateValue137;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = 0.0f;
                                branchMergedValue43 = 0.0f;
                                branchMergedValue44 = intermediateValue175;
                                branchMergedValue45 = intermediateValue174;
                                branchMergedValue46 = bitwiseValue24;
                                branchMergedValue47 = intermediateValue156;
                                branchMergedValue48 = intermediateValue155;
                                branchMergedValue49 = bitwiseValue19;
                                branchMergedValue58 = intermediateValue136;
                                branchMergedValue59 = bitwiseValue15;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue30 = float(scalarValue42 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue14 = bitwiseValue30 * float((scalarValue42 >> 8u) & 255u);
                                branchMergedValue35 = bitwiseValue30 * float((scalarValue42 >> 16u) & 255u);
                                branchMergedValue36 = bitwiseValue15;
                                branchMergedValue37 = intermediateValue100;
                                branchMergedValue38 = intermediateValue101;
                                branchMergedValue39 = bitwiseValue19;
                                branchMergedValue40 = intermediateValue115;
                                branchMergedValue41 = intermediateValue116;
                                branchMergedValue42 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue129;
                                branchMergedValue44 = intermediateValue130;
                                branchMergedValue45 = bitwiseValue30 * float(scalarValue42 & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue54 = float(scalarValue93 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue20 = intermediateValue136;
                                branchMergedValue41 = bitwiseValue54 * float((scalarValue93 >> 16u) & 255u);
                                branchMergedValue42 = bitwiseValue54 * float((scalarValue93 >> 8u) & 255u);
                                branchMergedValue43 = bitwiseValue54 * float(scalarValue93 & 255u);
                                branchMergedValue44 = intermediateValue174;
                                branchMergedValue45 = intermediateValue173;
                                branchMergedValue46 = bitwiseValue24;
                                branchMergedValue47 = intermediateValue155;
                                branchMergedValue48 = intermediateValue154;
                                branchMergedValue49 = bitwiseValue19;
                                branchMergedValue58 = intermediateValue135;
                                branchMergedValue59 = bitwiseValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue65 = float(scalarValue111 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue14 = bitwiseValue65 * float((scalarValue111 >> 8u) & 255u);
                                branchMergedValue35 = bitwiseValue65 * float((scalarValue111 >> 16u) & 255u);
                                branchMergedValue36 = bitwiseValue15;
                                branchMergedValue37 = intermediateValue101;
                                branchMergedValue38 = intermediateValue102;
                                branchMergedValue39 = bitwiseValue19;
                                branchMergedValue40 = intermediateValue116;
                                branchMergedValue41 = intermediateValue117;
                                branchMergedValue42 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue130;
                                branchMergedValue44 = intermediateValue131;
                                branchMergedValue45 = bitwiseValue65 * float(scalarValue111 & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue72 = float(scalarValue125 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue20 = intermediateValue137;
                                branchMergedValue41 = bitwiseValue72 * float((scalarValue125 >> 16u) & 255u);
                                branchMergedValue42 = bitwiseValue72 * float((scalarValue125 >> 8u) & 255u);
                                branchMergedValue43 = bitwiseValue72 * float(scalarValue125 & 255u);
                                branchMergedValue44 = intermediateValue175;
                                branchMergedValue45 = intermediateValue174;
                                branchMergedValue46 = bitwiseValue24;
                                branchMergedValue47 = intermediateValue156;
                                branchMergedValue48 = intermediateValue155;
                                branchMergedValue49 = bitwiseValue19;
                                branchMergedValue58 = intermediateValue136;
                                branchMergedValue59 = bitwiseValue15;
#endif
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue157 = branchMergedValue36;
                            intermediateValue158 = branchMergedValue37;
                            intermediateValue159 = branchMergedValue38;
                            intermediateValue160 = branchMergedValue39;
                            intermediateValue162 = branchMergedValue40;
                            intermediateValue164 = branchMergedValue41;
                            intermediateValue166 = branchMergedValue42;
                            intermediateValue168 = branchMergedValue43;
                            intermediateValue170 = branchMergedValue44;
                            intermediateValue172 = branchMergedValue45;
                            intermediateValue173 = branchMergedValue14;
                            intermediateValue174 = branchMergedValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue195 = branchMergedValue59;
                            intermediateValue196 = branchMergedValue58;
                            intermediateValue197 = branchMergedValue20;
                            intermediateValue198 = branchMergedValue49;
                            intermediateValue200 = branchMergedValue48;
                            intermediateValue202 = branchMergedValue47;
                            intermediateValue204 = branchMergedValue46;
                            intermediateValue206 = branchMergedValue45;
                            intermediateValue208 = branchMergedValue44;
                            intermediateValue210 = branchMergedValue43;
                            intermediateValue211 = branchMergedValue42;
                            intermediateValue212 = branchMergedValue41;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue158 = branchMergedValue36;
                            intermediateValue159 = branchMergedValue37;
                            intermediateValue160 = branchMergedValue38;
                            intermediateValue161 = branchMergedValue39;
                            intermediateValue163 = branchMergedValue40;
                            intermediateValue165 = branchMergedValue41;
                            intermediateValue167 = branchMergedValue42;
                            intermediateValue169 = branchMergedValue43;
                            intermediateValue171 = branchMergedValue44;
                            intermediateValue173 = branchMergedValue45;
                            intermediateValue174 = branchMergedValue14;
                            intermediateValue175 = branchMergedValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue196 = branchMergedValue59;
                            intermediateValue197 = branchMergedValue58;
                            intermediateValue198 = branchMergedValue20;
                            intermediateValue199 = branchMergedValue49;
                            intermediateValue201 = branchMergedValue48;
                            intermediateValue203 = branchMergedValue47;
                            intermediateValue205 = branchMergedValue46;
                            intermediateValue207 = branchMergedValue45;
                            intermediateValue209 = branchMergedValue44;
                            intermediateValue211 = branchMergedValue43;
                            intermediateValue212 = branchMergedValue42;
                            intermediateValue213 = branchMergedValue41;
#endif
                            break;
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue118;
                            float intermediateValue119;
                            float intermediateValue120;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            float sumValue69;
                            float sumValue70;
                            float sumValue71;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue24;
                            bool comparisonValue25;
                            for (;;)
                            {
                                sumValue66 = float(intermediateValue1[productValue122]) + intermediateValue69;
                                sumValue67 = float(intermediateValue1[productValue123]) + intermediateValue70;
                                sumValue68 = float(intermediateValue1[productValue124]) + intermediateValue71;
                                sumValue69 = float(intermediateValue2[productValue125]) + intermediateValue69;
                                sumValue70 = float(intermediateValue2[productValue126]) + intermediateValue70;
                                sumValue71 = float(intermediateValue2[productValue127]) + intermediateValue71;
                                sumValue72 = intermediateValue69 + productValue88;
                                sumValue73 = intermediateValue70 + productValue89;
                                sumValue74 = intermediateValue71 + productValue96;
                                uint comparisonValue51 = ((((uint(intermediateValue69 >= 16.0f) << 1u) | uint(intermediateValue69 < 0.0f)) | (uint(intermediateValue70 < 0.0f) << 2u)) | (uint(intermediateValue70 >= 16.0f) << 3u)) | (uint(intermediateValue71 < 0.0f) << 4u);
                                comparisonValue24 = intermediateValue[comparisonValue51 | (uint(intermediateValue71 >= 16.0f) << 5u)];
                                comparisonValue25 = ((((comparisonValue51 | (uint(intermediateValue71 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue51 & 31u))) == 0u;
                                uint loadedBufferValue11;
                                if (comparisonValue25)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                    {
                                        intermediateValue118 = 0.0f;
                                        intermediateValue119 = 0.0f;
                                        intermediateValue120 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue11 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue24).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue11 = ((((intermediateValue72 << 8u) & 3840u) | (intermediateValue73 & 15u)) | ((intermediateValue74 << 4u) & 240u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue29 = rdLoad_voxelBuffer(loadedBufferValue11);
                                uint scalarValue43 = loadedBufferValue29.x;
                                if (scalarValue43 == 0u)
                                {
                                    intermediateValue118 = 0.0f;
                                    intermediateValue119 = 0.0f;
                                    intermediateValue120 = 0.0f;
                                    break;
                                }
                                float bitwiseValue31 = float(scalarValue43 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue118 = bitwiseValue31 * float(scalarValue43 & 255u);
                                intermediateValue119 = bitwiseValue31 * float((scalarValue43 >> 8u) & 255u);
                                intermediateValue120 = bitwiseValue31 * float((scalarValue43 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue161;
                            float intermediateValue163;
                            float intermediateValue165;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue157;
                            float intermediateValue158;
                            float intermediateValue159;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue119;
                            float intermediateValue120;
                            float intermediateValue121;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            float sumValue69;
                            float sumValue70;
                            float sumValue71;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue24;
                            bool comparisonValue25;
                            for (;;)
                            {
                                sumValue66 = float(intermediateValue1[productValue124]) + intermediateValue70;
                                sumValue67 = float(intermediateValue1[productValue125]) + intermediateValue71;
                                sumValue68 = float(intermediateValue1[productValue126]) + intermediateValue72;
                                sumValue69 = float(intermediateValue2[productValue127]) + intermediateValue70;
                                sumValue70 = float(intermediateValue2[productValue128]) + intermediateValue71;
                                sumValue71 = float(intermediateValue2[productValue129]) + intermediateValue72;
                                sumValue72 = intermediateValue70 + productValue88;
                                sumValue73 = intermediateValue71 + productValue89;
                                sumValue74 = intermediateValue72 + productValue96;
                                uint comparisonValue105 = ((((uint(intermediateValue70 >= 16.0f) << 1u) | uint(intermediateValue70 < 0.0f)) | (uint(intermediateValue71 < 0.0f) << 2u)) | (uint(intermediateValue71 >= 16.0f) << 3u)) | (uint(intermediateValue72 < 0.0f) << 4u);
                                comparisonValue24 = intermediateValue[comparisonValue105 | (uint(intermediateValue72 >= 16.0f) << 5u)];
                                comparisonValue25 = ((((comparisonValue105 | (uint(intermediateValue72 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue105 & 31u))) == 0u;
                                uint loadedBufferValue11;
                                if (comparisonValue25)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue24 & 31u))) == 0u)
                                    {
                                        intermediateValue119 = 0.0f;
                                        intermediateValue120 = 0.0f;
                                        intermediateValue121 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue11 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue24).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue11 = ((((intermediateValue73 << 8u) & 3840u) | (intermediateValue74 & 15u)) | ((intermediateValue75 << 4u) & 240u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue29 = rdLoad_voxelBuffer(loadedBufferValue11);
                                uint scalarValue43 = loadedBufferValue29.x;
                                if (scalarValue43 == 0u)
                                {
                                    intermediateValue119 = 0.0f;
                                    intermediateValue120 = 0.0f;
                                    intermediateValue121 = 0.0f;
                                    break;
                                }
                                float bitwiseValue31 = float(scalarValue43 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue119 = bitwiseValue31 * float(scalarValue43 & 255u);
                                intermediateValue120 = bitwiseValue31 * float((scalarValue43 >> 8u) & 255u);
                                intermediateValue121 = bitwiseValue31 * float((scalarValue43 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue162;
                            float intermediateValue164;
                            float intermediateValue166;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue158;
                            float intermediateValue159;
                            float intermediateValue160;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
#endif
                            float sumValue85;
                            float sumValue86;
                            float sumValue87;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint comparisonValue36;
                            bool comparisonValue37;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue29;
                            bool comparisonValue30;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue85 = sumValue66 + productValue88;
                                sumValue86 = sumValue67 + productValue89;
                                sumValue87 = sumValue68 + productValue96;
                                uint comparisonValue55 = ((((uint(sumValue66 >= 16.0f) << 1u) | uint(sumValue66 < 0.0f)) | (uint(sumValue67 < 0.0f) << 2u)) | (uint(sumValue67 >= 16.0f) << 3u)) | (uint(sumValue68 < 0.0f) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue55 | (uint(sumValue68 >= 16.0f) << 5u)];
                                comparisonValue37 = ((((comparisonValue55 | (uint(sumValue68 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue55 & 31u))) == 0u;
                                uint loadedBufferValue17;
                                if (comparisonValue37)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                sumValue81 = float(intermediateValue1[productValue147]) + intermediateValue106;
                                sumValue82 = float(intermediateValue1[productValue148]) + intermediateValue107;
                                sumValue83 = float(intermediateValue1[productValue149]) + intermediateValue108;
                                sumValue84 = float(intermediateValue2[productValue150]) + intermediateValue106;
                                sumValue85 = float(intermediateValue2[productValue151]) + intermediateValue107;
                                sumValue86 = float(intermediateValue2[productValue152]) + intermediateValue108;
                                sumValue87 = intermediateValue106 + productValue88;
                                sumValue88 = intermediateValue107 + productValue89;
                                sumValue89 = intermediateValue108 + productValue96;
                                uint comparisonValue86 = ((((uint(intermediateValue106 >= 16.0f) << 1u) | uint(intermediateValue106 < 0.0f)) | (uint(intermediateValue107 < 0.0f) << 2u)) | (uint(intermediateValue107 >= 16.0f) << 3u)) | (uint(intermediateValue108 < 0.0f) << 4u);
                                comparisonValue29 = intermediateValue[comparisonValue86 | (uint(intermediateValue108 >= 16.0f) << 5u)];
                                comparisonValue30 = ((((comparisonValue86 | (uint(intermediateValue108 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue86 & 31u))) == 0u;
                                uint loadedBufferValue13;
                                if (comparisonValue30)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                sumValue81 = float(intermediateValue1[productValue149]) + intermediateValue107;
                                sumValue82 = float(intermediateValue1[productValue150]) + intermediateValue108;
                                sumValue83 = float(intermediateValue1[productValue151]) + intermediateValue109;
                                sumValue84 = float(intermediateValue2[productValue152]) + intermediateValue107;
                                sumValue85 = float(intermediateValue2[productValue153]) + intermediateValue108;
                                sumValue86 = float(intermediateValue2[productValue154]) + intermediateValue109;
                                sumValue87 = intermediateValue107 + productValue88;
                                sumValue88 = intermediateValue108 + productValue89;
                                sumValue89 = intermediateValue109 + productValue96;
                                uint comparisonValue120 = ((((uint(intermediateValue107 >= 16.0f) << 1u) | uint(intermediateValue107 < 0.0f)) | (uint(intermediateValue108 < 0.0f) << 2u)) | (uint(intermediateValue108 >= 16.0f) << 3u)) | (uint(intermediateValue109 < 0.0f) << 4u);
                                comparisonValue29 = intermediateValue[comparisonValue120 | (uint(intermediateValue109 >= 16.0f) << 5u)];
                                comparisonValue30 = ((((comparisonValue120 | (uint(intermediateValue109 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue120 & 31u))) == 0u;
                                uint loadedBufferValue13;
                                if (comparisonValue30)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue36 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue29 & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue161 = 0.0f;
                                        intermediateValue163 = 0.0f;
                                        intermediateValue165 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue157 = 0.0f;
                                        intermediateValue158 = 0.0f;
                                        intermediateValue159 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue162 = 0.0f;
                                        intermediateValue164 = 0.0f;
                                        intermediateValue166 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue158 = 0.0f;
                                        intermediateValue159 = 0.0f;
                                        intermediateValue160 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue17 = ((((uint(sumValue85 - (floor(sumValue85 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue86 - (floor(sumValue86 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue36).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue13 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue29).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue17 = ((((uint(sumValue66) << 8u) & 3840u) | (uint(sumValue67) & 15u)) | ((uint(sumValue68) << 4u) & 240u)) + bitwiseValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    loadedBufferValue13 = ((((intermediateValue109 << 8u) & 3840u) | (intermediateValue110 & 15u)) | ((intermediateValue111 << 4u) & 240u)) + bitwiseValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    loadedBufferValue13 = ((((intermediateValue110 << 8u) & 3840u) | (intermediateValue111 & 15u)) | ((intermediateValue112 << 4u) & 240u)) + bitwiseValue10;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue31 = rdLoad_voxelBuffer(loadedBufferValue17);
                                uint scalarValue44 = loadedBufferValue31.x;
                                if (scalarValue44 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue57 = rdLoad_voxelBuffer(loadedBufferValue13);
                                uint scalarValue94 = loadedBufferValue57.x;
                                if (scalarValue94 == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue161 = 0.0f;
                                    intermediateValue163 = 0.0f;
                                    intermediateValue165 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue157 = 0.0f;
                                    intermediateValue158 = 0.0f;
                                    intermediateValue159 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue162 = 0.0f;
                                    intermediateValue164 = 0.0f;
                                    intermediateValue166 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue158 = 0.0f;
                                    intermediateValue159 = 0.0f;
                                    intermediateValue160 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue32 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue161 = bitwiseValue32 * float(scalarValue44 & 255u);
                                intermediateValue163 = bitwiseValue32 * float((scalarValue44 >> 8u) & 255u);
                                intermediateValue165 = bitwiseValue32 * float((scalarValue44 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue55 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue157 = bitwiseValue55 * float(scalarValue94 & 255u);
                                intermediateValue158 = bitwiseValue55 * float((scalarValue94 >> 8u) & 255u);
                                intermediateValue159 = bitwiseValue55 * float((scalarValue94 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue32 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue162 = bitwiseValue32 * float(scalarValue44 & 255u);
                                intermediateValue164 = bitwiseValue32 * float((scalarValue44 >> 8u) & 255u);
                                intermediateValue166 = bitwiseValue32 * float((scalarValue44 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue55 = float(scalarValue94 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue158 = bitwiseValue55 * float(scalarValue94 & 255u);
                                intermediateValue159 = bitwiseValue55 * float((scalarValue94 >> 8u) & 255u);
                                intermediateValue160 = bitwiseValue55 * float((scalarValue94 >> 16u) & 255u);
#endif
                                break;
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue167;
                            float intermediateValue169;
                            float intermediateValue171;
                            float sumValue94;
                            float sumValue95;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue199;
                            float intermediateValue201;
                            float intermediateValue203;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float intermediateValue168;
                            float intermediateValue170;
                            float intermediateValue172;
                            float sumValue94;
                            float sumValue95;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue200;
                            float intermediateValue202;
                            float intermediateValue204;
#endif
                            float sumValue96;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint comparisonValue46;
                            bool comparisonValue47;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue42;
                            bool comparisonValue43;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue94 = sumValue69 + productValue88;
                                sumValue95 = sumValue70 + productValue89;
                                sumValue96 = sumValue71 + productValue96;
                                uint comparisonValue56 = ((((uint(sumValue69 >= 16.0f) << 1u) | uint(sumValue69 < 0.0f)) | (uint(sumValue70 < 0.0f) << 2u)) | (uint(sumValue70 >= 16.0f) << 3u)) | (uint(sumValue71 < 0.0f) << 4u);
                                comparisonValue46 = intermediateValue[comparisonValue56 | (uint(sumValue71 >= 16.0f) << 5u)];
                                comparisonValue47 = ((((comparisonValue56 | (uint(sumValue71 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue56 & 31u))) == 0u;
                                uint loadedBufferValue21;
                                if (comparisonValue47)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue96 = sumValue81 + productValue88;
                                sumValue97 = sumValue82 + productValue89;
                                sumValue98 = sumValue83 + productValue96;
                                uint comparisonValue87 = ((((uint(sumValue81 >= 16.0f) << 1u) | uint(sumValue81 < 0.0f)) | (uint(sumValue82 < 0.0f) << 2u)) | (uint(sumValue82 >= 16.0f) << 3u)) | (uint(sumValue83 < 0.0f) << 4u);
                                comparisonValue42 = intermediateValue[comparisonValue87 | (uint(sumValue83 >= 16.0f) << 5u)];
                                comparisonValue43 = ((((comparisonValue87 | (uint(sumValue83 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue87 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue43)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue46 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue42 & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue167 = 0.0f;
                                        intermediateValue169 = 0.0f;
                                        intermediateValue171 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue199 = 0.0f;
                                        intermediateValue201 = 0.0f;
                                        intermediateValue203 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                        intermediateValue168 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue172 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                        intermediateValue200 = 0.0f;
                                        intermediateValue202 = 0.0f;
                                        intermediateValue204 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue21 = ((((uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue46).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue26 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue42).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue21 = ((((uint(sumValue69) << 8u) & 3840u) | (uint(sumValue70) & 15u)) | ((uint(sumValue71) << 4u) & 240u)) + bitwiseValue10;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue26 = ((((uint(sumValue81) << 8u) & 3840u) | (uint(sumValue82) & 15u)) | ((uint(sumValue83) << 4u) & 240u)) + bitwiseValue10;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue33 = rdLoad_voxelBuffer(loadedBufferValue21);
                                uint scalarValue45 = loadedBufferValue33.x;
                                if (scalarValue45 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue58 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue95 = loadedBufferValue58.x;
                                if (scalarValue95 == 0u)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue167 = 0.0f;
                                    intermediateValue169 = 0.0f;
                                    intermediateValue171 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue199 = 0.0f;
                                    intermediateValue201 = 0.0f;
                                    intermediateValue203 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue168 = 0.0f;
                                    intermediateValue170 = 0.0f;
                                    intermediateValue172 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    intermediateValue200 = 0.0f;
                                    intermediateValue202 = 0.0f;
                                    intermediateValue204 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue33 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue167 = bitwiseValue33 * float(scalarValue45 & 255u);
                                intermediateValue169 = bitwiseValue33 * float((scalarValue45 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue33 * float((scalarValue45 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue56 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue199 = bitwiseValue56 * float(scalarValue95 & 255u);
                                intermediateValue201 = bitwiseValue56 * float((scalarValue95 >> 8u) & 255u);
                                intermediateValue203 = bitwiseValue56 * float((scalarValue95 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue33 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue168 = bitwiseValue33 * float(scalarValue45 & 255u);
                                intermediateValue170 = bitwiseValue33 * float((scalarValue45 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue33 * float((scalarValue45 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue56 = float(scalarValue95 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue200 = bitwiseValue56 * float(scalarValue95 & 255u);
                                intermediateValue202 = bitwiseValue56 * float((scalarValue95 >> 8u) & 255u);
                                intermediateValue204 = bitwiseValue56 * float((scalarValue95 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float sumValue101 = sumValue52 + productValue88;
                            float sumValue102 = sumValue53 + productValue89;
                            float sumValue103 = sumValue54 + productValue96;
                            uint comparisonValue57 = ((((uint(sumValue52 >= 16.0f) << 1u) | uint(sumValue52 < 0.0f)) | (uint(sumValue53 < 0.0f) << 2u)) | (uint(sumValue53 >= 16.0f) << 3u)) | (uint(sumValue54 < 0.0f) << 4u);
                            uint comparisonValue58 = comparisonValue57 | (uint(sumValue54 >= 16.0f) << 5u);
                            uint loadedBufferValue25;
                            if ((((comparisonValue58 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue57 & 31u))) == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue205;
                            float intermediateValue207;
                            float intermediateValue209;
                            float sumValue107;
                            float sumValue108;
                            float sumValue109;
                            uint comparisonValue52;
                            bool comparisonValue53;
                            for (;;)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float intermediateValue206;
                            float intermediateValue208;
                            float intermediateValue210;
                            float sumValue107;
                            float sumValue108;
                            float sumValue109;
                            uint comparisonValue52;
                            bool comparisonValue53;
                            for (;;)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue58] & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue107 = sumValue84 + productValue88;
                                sumValue108 = sumValue85 + productValue89;
                                sumValue109 = sumValue86 + productValue96;
                                uint comparisonValue88 = ((((uint(sumValue84 >= 16.0f) << 1u) | uint(sumValue84 < 0.0f)) | (uint(sumValue85 < 0.0f) << 2u)) | (uint(sumValue85 >= 16.0f) << 3u)) | (uint(sumValue86 < 0.0f) << 4u);
                                comparisonValue52 = intermediateValue[comparisonValue88 | (uint(sumValue86 >= 16.0f) << 5u)];
                                comparisonValue53 = ((((comparisonValue88 | (uint(sumValue86 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue88 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue53)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue157 = intermediateValue118;
                                    intermediateValue158 = intermediateValue119;
                                    intermediateValue159 = intermediateValue120;
                                    intermediateValue160 = intermediateValue161;
                                    intermediateValue162 = intermediateValue163;
                                    intermediateValue164 = intermediateValue165;
                                    intermediateValue166 = intermediateValue167;
                                    intermediateValue168 = intermediateValue169;
                                    intermediateValue170 = intermediateValue171;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                    intermediateValue174 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue52 & 31u))) == 0u)
                                    {
                                        intermediateValue205 = 0.0f;
                                        intermediateValue207 = 0.0f;
                                        intermediateValue209 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue109 - (floor(sumValue109 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue52).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue84) << 8u) & 3840u) | (uint(sumValue85) & 15u)) | ((uint(sumValue86) << 4u) & 240u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue59 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue96 = loadedBufferValue59.x;
                                if (scalarValue96 == 0u)
                                {
                                    intermediateValue205 = 0.0f;
                                    intermediateValue207 = 0.0f;
                                    intermediateValue209 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    intermediateValue158 = intermediateValue119;
                                    intermediateValue159 = intermediateValue120;
                                    intermediateValue160 = intermediateValue121;
                                    intermediateValue161 = intermediateValue162;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = intermediateValue170;
                                    intermediateValue171 = intermediateValue172;
                                    intermediateValue173 = 0.0f;
                                    intermediateValue174 = 0.0f;
                                    intermediateValue175 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (comparisonValue52 & 31u))) == 0u)
                                    {
                                        intermediateValue206 = 0.0f;
                                        intermediateValue208 = 0.0f;
                                        intermediateValue210 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue109 - (floor(sumValue109 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + comparisonValue52).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue84) << 8u) & 3840u) | (uint(sumValue85) & 15u)) | ((uint(sumValue86) << 4u) & 240u)) + bitwiseValue10;
                                }
                                uint4 loadedBufferValue59 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue96 = loadedBufferValue59.x;
                                if (scalarValue96 == 0u)
                                {
                                    intermediateValue206 = 0.0f;
                                    intermediateValue208 = 0.0f;
                                    intermediateValue210 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue25 = ((((uint(sumValue101 - (floor(sumValue101 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue58]).x >> 2u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue57 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue205 = bitwiseValue57 * float(scalarValue96 & 255u);
                                intermediateValue207 = bitwiseValue57 * float((scalarValue96 >> 8u) & 255u);
                                intermediateValue209 = bitwiseValue57 * float((scalarValue96 >> 16u) & 255u);
                                break;
                            }
                            float sumValue155 = sumValue68 + productValue88;
                            float sumValue156 = sumValue69 + productValue89;
                            float sumValue157 = sumValue70 + productValue96;
                            uint comparisonValue89 = ((((uint(sumValue68 >= 16.0f) << 1u) | uint(sumValue68 < 0.0f)) | (uint(sumValue69 < 0.0f) << 2u)) | (uint(sumValue69 >= 16.0f) << 3u)) | (uint(sumValue70 < 0.0f) << 4u);
                            uint comparisonValue90 = comparisonValue89 | (uint(sumValue70 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue90 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue89 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue90] & 31u))) == 0u)
                                {
                                    intermediateValue195 = intermediateValue157;
                                    intermediateValue196 = intermediateValue158;
                                    intermediateValue197 = intermediateValue159;
                                    intermediateValue198 = intermediateValue199;
                                    intermediateValue200 = intermediateValue201;
                                    intermediateValue202 = intermediateValue203;
                                    intermediateValue204 = intermediateValue205;
                                    intermediateValue206 = intermediateValue207;
                                    intermediateValue208 = intermediateValue209;
                                    intermediateValue210 = 0.0f;
                                    intermediateValue211 = 0.0f;
                                    intermediateValue212 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue155 - (floor(sumValue155 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue156 - (floor(sumValue156 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue157 - (floor(sumValue157 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue90]).x >> 2u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue57 = float(scalarValue96 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue206 = bitwiseValue57 * float(scalarValue96 & 255u);
                                intermediateValue208 = bitwiseValue57 * float((scalarValue96 >> 8u) & 255u);
                                intermediateValue210 = bitwiseValue57 * float((scalarValue96 >> 16u) & 255u);
                                break;
                            }
                            float sumValue155 = sumValue68 + productValue88;
                            float sumValue156 = sumValue69 + productValue89;
                            float sumValue157 = sumValue70 + productValue96;
                            uint comparisonValue89 = ((((uint(sumValue68 >= 16.0f) << 1u) | uint(sumValue68 < 0.0f)) | (uint(sumValue69 < 0.0f) << 2u)) | (uint(sumValue69 >= 16.0f) << 3u)) | (uint(sumValue70 < 0.0f) << 4u);
                            uint comparisonValue90 = comparisonValue89 | (uint(sumValue70 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue90 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue89 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue10 + 4096u).x & (1u << (intermediateValue[comparisonValue90] & 31u))) == 0u)
                                {
                                    intermediateValue196 = intermediateValue158;
                                    intermediateValue197 = intermediateValue159;
                                    intermediateValue198 = intermediateValue160;
                                    intermediateValue199 = intermediateValue200;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = 0.0f;
                                    intermediateValue212 = 0.0f;
                                    intermediateValue213 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue155 - (floor(sumValue155 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue156 - (floor(sumValue156 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue157 - (floor(sumValue157 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue10 + 4097u) + intermediateValue[comparisonValue90]).x >> 2u);
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue25 = ((((uint(sumValue52) << 8u) & 3840u) | (uint(sumValue53) & 15u)) | ((uint(sumValue54) << 4u) & 240u)) + bitwiseValue10;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                loadedBufferValue34 = ((((uint(sumValue68) << 8u) & 3840u) | (uint(sumValue69) & 15u)) | ((uint(sumValue70) << 4u) & 240u)) + bitwiseValue10;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue35 = rdLoad_voxelBuffer(loadedBufferValue25);
                            uint scalarValue46 = loadedBufferValue35.x;
                            if (scalarValue46 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue60 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue97 = loadedBufferValue60.x;
                            if (scalarValue97 == 0u)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue157 = intermediateValue118;
                                intermediateValue158 = intermediateValue119;
                                intermediateValue159 = intermediateValue120;
                                intermediateValue160 = intermediateValue161;
                                intermediateValue162 = intermediateValue163;
                                intermediateValue164 = intermediateValue165;
                                intermediateValue166 = intermediateValue167;
                                intermediateValue168 = intermediateValue169;
                                intermediateValue170 = intermediateValue171;
                                intermediateValue172 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue195 = intermediateValue157;
                                intermediateValue196 = intermediateValue158;
                                intermediateValue197 = intermediateValue159;
                                intermediateValue198 = intermediateValue199;
                                intermediateValue200 = intermediateValue201;
                                intermediateValue202 = intermediateValue203;
                                intermediateValue204 = intermediateValue205;
                                intermediateValue206 = intermediateValue207;
                                intermediateValue208 = intermediateValue209;
                                intermediateValue210 = 0.0f;
                                intermediateValue211 = 0.0f;
                                intermediateValue212 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue158 = intermediateValue119;
                                intermediateValue159 = intermediateValue120;
                                intermediateValue160 = intermediateValue121;
                                intermediateValue161 = intermediateValue162;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = intermediateValue172;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                                intermediateValue175 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue196 = intermediateValue158;
                                intermediateValue197 = intermediateValue159;
                                intermediateValue198 = intermediateValue160;
                                intermediateValue199 = intermediateValue200;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = 0.0f;
                                intermediateValue212 = 0.0f;
                                intermediateValue213 = 0.0f;
#endif
                                break;
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float bitwiseValue34 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue157 = intermediateValue118;
                            intermediateValue158 = intermediateValue119;
                            intermediateValue159 = intermediateValue120;
                            intermediateValue160 = intermediateValue161;
                            intermediateValue162 = intermediateValue163;
                            intermediateValue164 = intermediateValue165;
                            intermediateValue166 = intermediateValue167;
                            intermediateValue168 = intermediateValue169;
                            intermediateValue170 = intermediateValue171;
                            intermediateValue172 = bitwiseValue34 * float(scalarValue46 & 255u);
                            intermediateValue173 = bitwiseValue34 * float((scalarValue46 >> 8u) & 255u);
                            intermediateValue174 = bitwiseValue34 * float((scalarValue46 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float bitwiseValue58 = float(scalarValue97 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue195 = intermediateValue157;
                            intermediateValue196 = intermediateValue158;
                            intermediateValue197 = intermediateValue159;
                            intermediateValue198 = intermediateValue199;
                            intermediateValue200 = intermediateValue201;
                            intermediateValue202 = intermediateValue203;
                            intermediateValue204 = intermediateValue205;
                            intermediateValue206 = intermediateValue207;
                            intermediateValue208 = intermediateValue209;
                            intermediateValue210 = bitwiseValue58 * float(scalarValue97 & 255u);
                            intermediateValue211 = bitwiseValue58 * float((scalarValue97 >> 8u) & 255u);
                            intermediateValue212 = bitwiseValue58 * float((scalarValue97 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float bitwiseValue34 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue158 = intermediateValue119;
                            intermediateValue159 = intermediateValue120;
                            intermediateValue160 = intermediateValue121;
                            intermediateValue161 = intermediateValue162;
                            intermediateValue163 = intermediateValue164;
                            intermediateValue165 = intermediateValue166;
                            intermediateValue167 = intermediateValue168;
                            intermediateValue169 = intermediateValue170;
                            intermediateValue171 = intermediateValue172;
                            intermediateValue173 = bitwiseValue34 * float(scalarValue46 & 255u);
                            intermediateValue174 = bitwiseValue34 * float((scalarValue46 >> 8u) & 255u);
                            intermediateValue175 = bitwiseValue34 * float((scalarValue46 >> 16u) & 255u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float bitwiseValue58 = float(scalarValue97 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue196 = intermediateValue158;
                            intermediateValue197 = intermediateValue159;
                            intermediateValue198 = intermediateValue160;
                            intermediateValue199 = intermediateValue200;
                            intermediateValue201 = intermediateValue202;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = intermediateValue206;
                            intermediateValue207 = intermediateValue208;
                            intermediateValue209 = intermediateValue210;
                            intermediateValue211 = bitwiseValue58 * float(scalarValue97 & 255u);
                            intermediateValue212 = bitwiseValue58 * float((scalarValue97 >> 8u) & 255u);
                            intermediateValue213 = bitwiseValue58 * float((scalarValue97 >> 16u) & 255u);
#endif
                            break;
                        }
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue46 = (((intermediateValue162 * sumValue50) + (intermediateValue158 * sumValue49)) + (intermediateValue168 * sumValue51)) + (intermediateValue173 * intermediateValue77);
                    branchMergedValue48 = (((intermediateValue160 * sumValue50) + (intermediateValue157 * sumValue49)) + (intermediateValue166 * sumValue51)) + (intermediateValue172 * intermediateValue77);
                    branchMergedValue49 = (((intermediateValue164 * sumValue50) + (intermediateValue159 * sumValue49)) + (intermediateValue170 * sumValue51)) + (intermediateValue174 * intermediateValue77);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue61 = (((intermediateValue202 * sumValue66) + (intermediateValue197 * sumValue65)) + (intermediateValue208 * sumValue67)) + (intermediateValue212 * intermediateValue114);
                    branchMergedValue65 = (((intermediateValue200 * sumValue66) + (intermediateValue196 * sumValue65)) + (intermediateValue206 * sumValue67)) + (intermediateValue211 * intermediateValue114);
                    branchMergedValue66 = (((intermediateValue198 * sumValue66) + (intermediateValue195 * sumValue65)) + (intermediateValue204 * sumValue67)) + (intermediateValue210 * intermediateValue114);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue46 = (((intermediateValue163 * sumValue50) + (intermediateValue159 * sumValue49)) + (intermediateValue169 * sumValue51)) + (intermediateValue174 * intermediateValue78);
                    branchMergedValue48 = (((intermediateValue161 * sumValue50) + (intermediateValue158 * sumValue49)) + (intermediateValue167 * sumValue51)) + (intermediateValue173 * intermediateValue78);
                    branchMergedValue49 = (((intermediateValue165 * sumValue50) + (intermediateValue160 * sumValue49)) + (intermediateValue171 * sumValue51)) + (intermediateValue175 * intermediateValue78);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue61 = (((intermediateValue203 * sumValue66) + (intermediateValue198 * sumValue65)) + (intermediateValue209 * sumValue67)) + (intermediateValue213 * intermediateValue115);
                    branchMergedValue65 = (((intermediateValue201 * sumValue66) + (intermediateValue197 * sumValue65)) + (intermediateValue207 * sumValue67)) + (intermediateValue212 * intermediateValue115);
                    branchMergedValue66 = (((intermediateValue199 * sumValue66) + (intermediateValue196 * sumValue65)) + (intermediateValue205 * sumValue67)) + (intermediateValue211 * intermediateValue115);
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue7 = branchMergedValue46;
                branchMergedValue15 = branchMergedValue48;
                branchMergedValue16 = branchMergedValue49;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue13 = branchMergedValue61;
                branchMergedValue26 = branchMergedValue65;
                branchMergedValue27 = branchMergedValue66;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue7 = 0.0f;
                branchMergedValue15 = 0.0f;
                branchMergedValue16 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue13 = 0.0f;
                branchMergedValue26 = 0.0f;
                branchMergedValue27 = 0.0f;
#endif
            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue21 = branchMergedValue15;
            intermediateValue22 = branchMergedValue7;
            intermediateValue23 = branchMergedValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue27 = branchMergedValue27;
            intermediateValue28 = branchMergedValue26;
            intermediateValue29 = branchMergedValue13;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue22 = branchMergedValue15;
            intermediateValue23 = branchMergedValue7;
            intermediateValue24 = branchMergedValue16;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue28 = branchMergedValue27;
            intermediateValue29 = branchMergedValue26;
            intermediateValue30 = branchMergedValue13;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue21 = clampedValue1;
            intermediateValue22 = clampedValue2;
            intermediateValue23 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue27 = clampedValue1;
            intermediateValue28 = clampedValue2;
            intermediateValue29 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue22 = clampedValue1;
            intermediateValue23 = clampedValue2;
            intermediateValue24 = clampedValue3;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue28 = clampedValue1;
            intermediateValue29 = clampedValue2;
            intermediateValue30 = clampedValue3;
#endif
        }
        float productValue103 = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
        float productValue104 = productValue103 * productValue103;
        float productValue105 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue103 - productValue104)) + productValue104) * RD_UNIFORM_TILE_LIGHT_INTENSITY.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue37 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue21), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue38 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue39 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue23), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        intermediateValue9 = intermediateValue10;
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = intermediateValue16;
        intermediateValue17 = intermediateValue18;
        intermediateValue19 = intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue37 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue27), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue38 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue28), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue39 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue29), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        intermediateValue9 = productValue40;
        intermediateValue10 = productValue41;
        intermediateValue11 = productValue42;
        intermediateValue12 = productValue43;
        intermediateValue13 = productValue44;
        intermediateValue14 = productValue45;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue39 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue40 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue23), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue41 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue24), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = intermediateValue13;
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = intermediateValue17;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue39 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue28), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue40 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue29), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        productValue41 = (max((productValue105 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue30), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w;
        intermediateValue10 = productValue42;
        intermediateValue11 = productValue43;
        intermediateValue12 = productValue44;
        intermediateValue13 = productValue45;
        intermediateValue14 = productValue46;
        intermediateValue15 = productValue47;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue37 = 0.0f;
        productValue38 = 0.0f;
#endif
        productValue39 = 0.0f;
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
        productValue40 = 0.0f;
        productValue41 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue20 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue40 = 0.0f;
        productValue41 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue15 = 0.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float sumValue110 = (intermediateValue9 + productValue37) + intermediateValue15;
    float sumValue111 = (intermediateValue11 + productValue38) + intermediateValue17;
    float sumValue112 = (intermediateValue13 + productValue39) + intermediateValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float sumValue158 = (intermediateValue9 + productValue37) + intermediateValue12;
    float sumValue159 = (intermediateValue10 + productValue38) + intermediateValue13;
    float sumValue160 = (intermediateValue11 + productValue39) + intermediateValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float sumValue172 = (intermediateValue10 + productValue39) + intermediateValue16;
    float sumValue173 = (intermediateValue12 + productValue40) + intermediateValue18;
    float sumValue174 = (intermediateValue14 + productValue41) + intermediateValue20;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float sumValue188 = (intermediateValue10 + productValue39) + intermediateValue13;
    float sumValue189 = (intermediateValue11 + productValue40) + intermediateValue14;
    float sumValue190 = (intermediateValue12 + productValue41) + intermediateValue15;
#endif
    float sumValue113 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue114 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue115 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue10 = rsqrt(dot(float3(sumValue113, sumValue114, sumValue115), float3(sumValue113, sumValue114, sumValue115)));
    float productValue106 = inverseLengthValue10 * sumValue113;
    float productValue107 = inverseLengthValue10 * sumValue114;
    float productValue108 = inverseLengthValue10 * sumValue115;
    bool comparisonValue59 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    bool comparisonValue60 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue43;
    float productValue44;
    float productValue45;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue49;
    float productValue50;
    float productValue51;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue45;
    float productValue46;
    float productValue47;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue51;
    float productValue52;
    float productValue53;
#endif
    if ((comparisonValue59 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue60)
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue43 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue44 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue45 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue49 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue50 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue51 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue45 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue46 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue47 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue51 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue52 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue53 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue43 = 0.0f;
        productValue44 = 0.0f;
        productValue45 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue49 = 0.0f;
        productValue50 = 0.0f;
        productValue51 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue45 = 0.0f;
        productValue46 = 0.0f;
        productValue47 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue51 = 0.0f;
        productValue52 = 0.0f;
        productValue53 = 0.0f;
#endif
    }
    bool comparisonValue61 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    bool comparisonValue62 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue23;
    float intermediateValue24;
#endif
    float intermediateValue25;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue26;
    float intermediateValue27;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue26;
#endif
    if (comparisonValue62)
    {
        float clampedValue9 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue8;
        float branchMergedValue17;
        float branchMergedValue18;
        float branchMergedValue19;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue11;
        float branchMergedValue23;
        float branchMergedValue24;
        float branchMergedValue25;
#endif
        if (clampedValue9 > 0.0f)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue47;
            float branchMergedValue50;
            float branchMergedValue51;
            float branchMergedValue52;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue60;
            float branchMergedValue62;
            float branchMergedValue63;
            float branchMergedValue64;
#endif
            if (comparisonValue59)
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue47 = RD_UNIFORM_FOG_COLOR.x * max(productValue43, 1.0f);
                branchMergedValue50 = max(productValue44, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue51 = max(productValue45, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue52 = clampedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue60 = clampedValue9;
                branchMergedValue62 = max(productValue51, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue63 = max(productValue50, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue64 = RD_UNIFORM_FOG_COLOR.x * max(productValue49, 1.0f);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue47 = RD_UNIFORM_FOG_COLOR.x * max(productValue45, 1.0f);
                branchMergedValue50 = max(productValue46, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue51 = max(productValue47, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue52 = clampedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue60 = clampedValue9;
                branchMergedValue62 = max(productValue53, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue63 = max(productValue52, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue64 = RD_UNIFORM_FOG_COLOR.x * max(productValue51, 1.0f);
#endif
            }
            else
            {
                float clampedValue10 = clamp(((productValue107 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue109 = 1.0f - ((clampedValue10 * clampedValue10) * (3.0f - (clampedValue10 * 2.0f)));
                float productValue110 = (productValue109 * productValue109) * productValue109;
                float dotProductValue11 = dot(float3(productValue106, productValue107, productValue108), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue12 = dot(float3(productValue106, productValue107, productValue108), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue116 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue11 = clamp((productValue107 - sumValue116) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue116), 0.0f, 1.0f);
                float productValue111 = 1.0f - ((clampedValue11 * clampedValue11) * (3.0f - (clampedValue11 * 2.0f)));
                float productValue130 = (productValue111 * productValue111) * productValue111;
                float productValue135 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue11 * dotProductValue11) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue12 = clamp(exp2(log2(max(dotProductValue11, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue13 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue155 = 1.809999942779541015625f - (clampedValue12 * 1.7999999523162841796875f);
                float nonlinearValue2 = 0.036100022494792938232421875f / (sqrt(productValue155) * productValue155);
                float productValue160 = 1.809999942779541015625f - (clampedValue13 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue160) * productValue160);
                float productValue166 = clampedValue12 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue167 = clampedValue13 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue168 = (((productValue110 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue167 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue3) + ((productValue166 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue2))) + (((productValue130 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue135)) * 0.079577468335628509521484375f;
                float productValue169 = (((productValue110 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue167 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue3) + ((productValue166 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue2))) + (((productValue130 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue135)) * 0.079577468335628509521484375f;
                float productValue174 = (((productValue110 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue167 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue3) + ((productValue166 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue2))) + (((productValue130 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue135)) * 0.079577468335628509521484375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue53;
                float branchMergedValue54;
                float branchMergedValue55;
                float branchMergedValue56;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue74;
                float branchMergedValue75;
                float branchMergedValue76;
                float branchMergedValue77;
#endif
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue47 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue53 = ((productValue168 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue54 = ((productValue169 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue55 = ((productValue174 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue56 = clampedValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue74 = clampedValue9;
                    branchMergedValue75 = ((productValue174 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue76 = ((productValue169 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue77 = ((productValue168 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue47) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue53 = productValue168;
                    branchMergedValue54 = productValue169;
                    branchMergedValue55 = productValue174;
                    branchMergedValue56 = clampedValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue74 = clampedValue9;
                    branchMergedValue75 = productValue174;
                    branchMergedValue76 = productValue169;
                    branchMergedValue77 = productValue168;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue47 = branchMergedValue53;
                branchMergedValue50 = branchMergedValue54;
                branchMergedValue51 = branchMergedValue55;
                branchMergedValue52 = branchMergedValue56;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue60 = branchMergedValue74;
                branchMergedValue62 = branchMergedValue75;
                branchMergedValue63 = branchMergedValue76;
                branchMergedValue64 = branchMergedValue77;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue8 = branchMergedValue47;
            branchMergedValue17 = branchMergedValue50;
            branchMergedValue18 = branchMergedValue51;
            branchMergedValue19 = branchMergedValue52;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue11 = branchMergedValue60;
            branchMergedValue23 = branchMergedValue62;
            branchMergedValue24 = branchMergedValue63;
            branchMergedValue25 = branchMergedValue64;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue8 = 0.0f;
            branchMergedValue17 = 0.0f;
            branchMergedValue18 = 0.0f;
            branchMergedValue19 = clampedValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue11 = clampedValue9;
            branchMergedValue23 = 0.0f;
            branchMergedValue24 = 0.0f;
            branchMergedValue25 = 0.0f;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue24 = branchMergedValue19;
        intermediateValue25 = branchMergedValue8;
        intermediateValue26 = branchMergedValue17;
        intermediateValue27 = branchMergedValue18;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue22 = branchMergedValue11;
        intermediateValue23 = branchMergedValue25;
        intermediateValue24 = branchMergedValue24;
        intermediateValue25 = branchMergedValue23;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue25 = branchMergedValue19;
        intermediateValue26 = branchMergedValue8;
        intermediateValue27 = branchMergedValue17;
        intermediateValue28 = branchMergedValue18;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue23 = branchMergedValue11;
        intermediateValue24 = branchMergedValue25;
        intermediateValue25 = branchMergedValue24;
        intermediateValue26 = branchMergedValue23;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue24 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue22 = 0.0f;
        intermediateValue23 = 0.0f;
        intermediateValue24 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue23 = 0.0f;
        intermediateValue24 = 0.0f;
#endif
        intermediateValue25 = 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue26 = 0.0f;
        intermediateValue27 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue26 = 0.0f;
        intermediateValue27 = 0.0f;
        intermediateValue28 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue26 = 0.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue82;
    float productValue83;
    float productValue84;
    float productValue85;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue90;
    float productValue91;
    float productValue92;
    float productValue93;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue84;
    float productValue85;
    float productValue86;
    float productValue87;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue92;
    float productValue93;
    float productValue94;
    float productValue95;
#endif
    if (comparisonValue61)
    {
        float productValue175 = (multiplyAddValue9 + 1.0f) * 0.5f;
        float productValue176 = (multiplyAddValue10 + 1.0f) * 0.5f;
        uint scalarValue48 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue31 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue48))) + (-0.5f);
        uint sumValue118 = uint(min(int(uint(max(int(uint(int(multiplyAddValue31))), int(0u)))), int(scalarValue48 + 4294967294u)));
        float scalarValue49 = float(int(sumValue118));
        float sumValue119 = min(max(multiplyAddValue31 - scalarValue49, 0.0f), 1.0f);
        float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue175, productValue176, scalarValue49), 0.0f);
        float scalarValue50 = sampledTextureValue3.x;
        float scalarValue51 = sampledTextureValue3.y;
        float scalarValue52 = sampledTextureValue3.z;
        float scalarValue53 = sampledTextureValue3.w;
        float4 sampledTextureValue4 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue175, productValue176, float(int(sumValue118 + 1u))), 0.0f);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue82 = ((sampledTextureValue4.x - scalarValue50) * sumValue119) + scalarValue50;
        productValue83 = ((sampledTextureValue4.y - scalarValue51) * sumValue119) + scalarValue51;
        productValue84 = ((sampledTextureValue4.z - scalarValue52) * sumValue119) + scalarValue52;
        productValue85 = ((sampledTextureValue4.w - scalarValue53) * sumValue119) + scalarValue53;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue90 = ((sampledTextureValue4.x - scalarValue50) * sumValue119) + scalarValue50;
        productValue91 = ((sampledTextureValue4.y - scalarValue51) * sumValue119) + scalarValue51;
        productValue92 = ((sampledTextureValue4.z - scalarValue52) * sumValue119) + scalarValue52;
        productValue93 = ((sampledTextureValue4.w - scalarValue53) * sumValue119) + scalarValue53;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue84 = ((sampledTextureValue4.x - scalarValue50) * sumValue119) + scalarValue50;
        productValue85 = ((sampledTextureValue4.y - scalarValue51) * sumValue119) + scalarValue51;
        productValue86 = ((sampledTextureValue4.z - scalarValue52) * sumValue119) + scalarValue52;
        productValue87 = ((sampledTextureValue4.w - scalarValue53) * sumValue119) + scalarValue53;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue92 = ((sampledTextureValue4.x - scalarValue50) * sumValue119) + scalarValue50;
        productValue93 = ((sampledTextureValue4.y - scalarValue51) * sumValue119) + scalarValue51;
        productValue94 = ((sampledTextureValue4.z - scalarValue52) * sumValue119) + scalarValue52;
        productValue95 = ((sampledTextureValue4.w - scalarValue53) * sumValue119) + scalarValue53;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue82 = 0.0f;
        productValue83 = 0.0f;
        productValue84 = 0.0f;
        productValue85 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue90 = 0.0f;
        productValue91 = 0.0f;
        productValue92 = 0.0f;
        productValue93 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue84 = 0.0f;
        productValue85 = 0.0f;
        productValue86 = 0.0f;
        productValue87 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue92 = 0.0f;
        productValue93 = 0.0f;
        productValue94 = 0.0f;
        productValue95 = 1.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue48;
    float intermediateValue49;
    float intermediateValue50;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float intermediateValue49;
    float intermediateValue50;
    float intermediateValue51;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue57;
#endif
    if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
    {
        bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue60;
        float intermediateValue61;
        float intermediateValue62;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue76;
        float intermediateValue77;
        float intermediateValue78;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float intermediateValue61;
        float intermediateValue62;
        float intermediateValue63;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float intermediateValue77;
        float intermediateValue78;
        float intermediateValue79;
#endif
        float multiplyAddValue32;
        float multiplyAddValue33;
        float multiplyAddValue34;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue60 = productValue33;
            intermediateValue61 = productValue34;
            intermediateValue62 = productValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue76 = productValue33;
            intermediateValue77 = productValue34;
            intermediateValue78 = productValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue61 = productValue33;
            intermediateValue62 = productValue34;
            intermediateValue63 = productValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue77 = productValue33;
            intermediateValue78 = productValue34;
            intermediateValue79 = productValue35;
#endif
            multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue35, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue34, productValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue35, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue34, productValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue35, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue34, productValue33 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue60 = varyingTexCoord3.x;
            intermediateValue61 = varyingTexCoord3.y;
            intermediateValue62 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue76 = varyingTexCoord3.x;
            intermediateValue77 = varyingTexCoord3.y;
            intermediateValue78 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue61 = varyingTexCoord3.x;
            intermediateValue62 = varyingTexCoord3.y;
            intermediateValue63 = varyingTexCoord3.z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue77 = varyingTexCoord3.x;
            intermediateValue78 = varyingTexCoord3.y;
            intermediateValue79 = varyingTexCoord3.z;
#endif
            multiplyAddValue32 = multiplyAddValue4;
            multiplyAddValue33 = multiplyAddValue5;
            multiplyAddValue34 = multiplyAddValue6;
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float sumValue120 = intermediateValue60 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue121 = intermediateValue61 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue122 = intermediateValue62 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue11 = rsqrt(dot(float3(sumValue120, sumValue121, sumValue122), float3(sumValue120, sumValue121, sumValue122)));
        float productValue177 = inverseLengthValue11 * sumValue120;
        float productValue178 = inverseLengthValue11 * sumValue121;
        float productValue179 = inverseLengthValue11 * sumValue122;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float sumValue161 = intermediateValue76 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue162 = intermediateValue77 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue163 = intermediateValue78 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue17 = rsqrt(dot(float3(sumValue161, sumValue162, sumValue163), float3(sumValue161, sumValue162, sumValue163)));
        float productValue233 = inverseLengthValue17 * sumValue161;
        float productValue234 = inverseLengthValue17 * sumValue162;
        float productValue235 = inverseLengthValue17 * sumValue163;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float sumValue175 = intermediateValue61 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue176 = intermediateValue62 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue177 = intermediateValue63 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue18 = rsqrt(dot(float3(sumValue175, sumValue176, sumValue177), float3(sumValue175, sumValue176, sumValue177)));
        float productValue262 = inverseLengthValue18 * sumValue175;
        float productValue263 = inverseLengthValue18 * sumValue176;
        float productValue264 = inverseLengthValue18 * sumValue177;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float sumValue191 = intermediateValue77 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue192 = intermediateValue78 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue193 = intermediateValue79 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue19 = rsqrt(dot(float3(sumValue191, sumValue192, sumValue193), float3(sumValue191, sumValue192, sumValue193)));
        float productValue292 = inverseLengthValue19 * sumValue191;
        float productValue293 = inverseLengthValue19 * sumValue192;
        float productValue294 = inverseLengthValue19 * sumValue193;
#endif
        float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34), float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34)));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float dotProductValue13 = dot(float3(productValue177, productValue178, productValue179), float3(productValue14, productValue15, productValue16)) * 2.0f;
        float productValue180 = productValue177 - (dotProductValue13 * productValue14);
        float productValue181 = productValue178 - (dotProductValue13 * productValue15);
        float productValue182 = productValue179 - (dotProductValue13 * productValue16);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float dotProductValue17 = dot(float3(productValue233, productValue234, productValue235), float3(productValue14, productValue15, productValue16)) * 2.0f;
        float productValue236 = productValue233 - (dotProductValue17 * productValue14);
        float productValue237 = productValue234 - (dotProductValue17 * productValue15);
        float productValue238 = productValue235 - (dotProductValue17 * productValue16);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float dotProductValue18 = dot(float3(productValue262, productValue263, productValue264), float3(productValue14, productValue15, productValue16)) * 2.0f;
        float productValue265 = productValue262 - (dotProductValue18 * productValue14);
        float productValue266 = productValue263 - (dotProductValue18 * productValue15);
        float productValue267 = productValue264 - (dotProductValue18 * productValue16);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float dotProductValue19 = dot(float3(productValue292, productValue293, productValue294), float3(productValue14, productValue15, productValue16)) * 2.0f;
        float productValue295 = productValue292 - (dotProductValue19 * productValue14);
        float productValue296 = productValue293 - (dotProductValue19 * productValue15);
        float productValue297 = productValue294 - (dotProductValue19 * productValue16);
#endif
        precise float comparisonValue63 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? 0.75f : 0.99609375f);
        uint scalarValue54 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float4 sampledTextureValue5 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue180, productValue181, productValue182, float(int(scalarValue54))), comparisonValue63);
        float4 sampledTextureValue6 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue180, productValue181, productValue182, float(int(uint(int(scalarValue54 + 2u) - int(3u) * (int(scalarValue54 + 2u) / int(3u)))))), comparisonValue63);
        float scalarValue55 = sampledTextureValue6.x;
        float scalarValue56 = sampledTextureValue6.y;
        float scalarValue57 = sampledTextureValue6.z;
        float productValue183 = ((sampledTextureValue5.x - scalarValue55) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue55;
        float productValue184 = ((sampledTextureValue5.y - scalarValue56) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue56;
        float productValue185 = ((sampledTextureValue5.z - scalarValue57) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue57;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float4 sampledTextureValue12 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue236, productValue237, productValue238, float(int(scalarValue54))), comparisonValue63);
        float4 sampledTextureValue13 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue236, productValue237, productValue238, float(int(uint(int(scalarValue54 + 2u) - int(3u) * (int(scalarValue54 + 2u) / int(3u)))))), comparisonValue63);
        float scalarValue98 = sampledTextureValue13.x;
        float scalarValue99 = sampledTextureValue13.y;
        float scalarValue100 = sampledTextureValue13.z;
        float productValue239 = ((sampledTextureValue12.x - scalarValue98) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue98;
        float productValue240 = ((sampledTextureValue12.y - scalarValue99) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue99;
        float productValue241 = ((sampledTextureValue12.z - scalarValue100) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float4 sampledTextureValue14 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue265, productValue266, productValue267, float(int(scalarValue54))), comparisonValue63);
        float4 sampledTextureValue15 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue265, productValue266, productValue267, float(int(uint(int(scalarValue54 + 2u) - int(3u) * (int(scalarValue54 + 2u) / int(3u)))))), comparisonValue63);
        float scalarValue112 = sampledTextureValue15.x;
        float scalarValue113 = sampledTextureValue15.y;
        float scalarValue114 = sampledTextureValue15.z;
        float productValue268 = ((sampledTextureValue14.x - scalarValue112) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue112;
        float productValue269 = ((sampledTextureValue14.y - scalarValue113) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue113;
        float productValue270 = ((sampledTextureValue14.z - scalarValue114) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue114;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float4 sampledTextureValue17 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue295, productValue296, productValue297, float(int(scalarValue54))), comparisonValue63);
        float4 sampledTextureValue18 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue295, productValue296, productValue297, float(int(uint(int(scalarValue54 + 2u) - int(3u) * (int(scalarValue54 + 2u) / int(3u)))))), comparisonValue63);
        float scalarValue126 = sampledTextureValue18.x;
        float scalarValue127 = sampledTextureValue18.y;
        float scalarValue128 = sampledTextureValue18.z;
        float productValue298 = ((sampledTextureValue17.x - scalarValue126) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue126;
        float productValue299 = ((sampledTextureValue17.y - scalarValue127) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue127;
        float productValue300 = ((sampledTextureValue17.z - scalarValue128) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue128;
#endif
        float productValue186 = (((clampedValue4 * clampedValue4) * clampedValue4) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float comparisonValue64 = (conditionValue1 ? (productValue183 * 301.72412109375f) : productValue183) * productValue186;
        float comparisonValue65 = (conditionValue1 ? (productValue184 * 301.72412109375f) : productValue184) * productValue186;
        float comparisonValue66 = (conditionValue1 ? (productValue185 * 301.72412109375f) : productValue185) * productValue186;
        float intermediateValue85;
        float intermediateValue86;
        float intermediateValue87;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float comparisonValue91 = (conditionValue1 ? (productValue239 * 301.72412109375f) : productValue239) * productValue186;
        float comparisonValue92 = (conditionValue1 ? (productValue240 * 301.72412109375f) : productValue240) * productValue186;
        float comparisonValue93 = (conditionValue1 ? (productValue241 * 301.72412109375f) : productValue241) * productValue186;
        float intermediateValue98;
        float intermediateValue99;
        float intermediateValue100;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float comparisonValue106 = (conditionValue1 ? (productValue268 * 301.72412109375f) : productValue268) * productValue186;
        float comparisonValue107 = (conditionValue1 ? (productValue269 * 301.72412109375f) : productValue269) * productValue186;
        float comparisonValue108 = (conditionValue1 ? (productValue270 * 301.72412109375f) : productValue270) * productValue186;
        float intermediateValue86;
        float intermediateValue87;
        float intermediateValue88;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float comparisonValue121 = (conditionValue1 ? (productValue298 * 301.72412109375f) : productValue298) * productValue186;
        float comparisonValue122 = (conditionValue1 ? (productValue299 * 301.72412109375f) : productValue299) * productValue186;
        float comparisonValue123 = (conditionValue1 ? (productValue300 * 301.72412109375f) : productValue300) * productValue186;
        float intermediateValue99;
        float intermediateValue100;
        float intermediateValue101;
#endif
        if (comparisonValue60)
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue12;
            float branchMergedValue22;
            float branchMergedValue23;
            if (((dot(float3(comparisonValue64, comparisonValue65, comparisonValue66), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue17;
            float branchMergedValue30;
            float branchMergedValue31;
            if (((dot(float3(comparisonValue91, comparisonValue92, comparisonValue93), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            float branchMergedValue12;
            float branchMergedValue22;
            float branchMergedValue23;
            if (((dot(float3(comparisonValue106, comparisonValue107, comparisonValue108), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            float branchMergedValue17;
            float branchMergedValue30;
            float branchMergedValue31;
            if (((dot(float3(comparisonValue121, comparisonValue122, comparisonValue123), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= 0.0f) ? 0.0f : 1.0f) == 1.0f)
#endif
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue12 = 0.0f;
                branchMergedValue22 = 0.0f;
                branchMergedValue23 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue17 = 0.0f;
                branchMergedValue30 = 0.0f;
                branchMergedValue31 = 0.0f;
#endif
            }
            else
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue12 = comparisonValue66;
                branchMergedValue22 = comparisonValue65;
                branchMergedValue23 = comparisonValue64;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue17 = comparisonValue93;
                branchMergedValue30 = comparisonValue92;
                branchMergedValue31 = comparisonValue91;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue12 = comparisonValue108;
                branchMergedValue22 = comparisonValue107;
                branchMergedValue23 = comparisonValue106;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                branchMergedValue17 = comparisonValue123;
                branchMergedValue30 = comparisonValue122;
                branchMergedValue31 = comparisonValue121;
#endif
            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue85 = branchMergedValue23;
            intermediateValue86 = branchMergedValue22;
            intermediateValue87 = branchMergedValue12;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue98 = branchMergedValue31;
            intermediateValue99 = branchMergedValue30;
            intermediateValue100 = branchMergedValue17;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue86 = branchMergedValue23;
            intermediateValue87 = branchMergedValue22;
            intermediateValue88 = branchMergedValue12;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue99 = branchMergedValue31;
            intermediateValue100 = branchMergedValue30;
            intermediateValue101 = branchMergedValue17;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue85 = comparisonValue64;
            intermediateValue86 = comparisonValue65;
            intermediateValue87 = comparisonValue66;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue98 = comparisonValue91;
            intermediateValue99 = comparisonValue92;
            intermediateValue100 = comparisonValue93;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue86 = comparisonValue106;
            intermediateValue87 = comparisonValue107;
            intermediateValue88 = comparisonValue108;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue99 = comparisonValue121;
            intermediateValue100 = comparisonValue122;
            intermediateValue101 = comparisonValue123;
#endif
        }
        float4 sampledTextureValue7 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3((-0.0f) - (multiplyAddValue32 * inverseLengthValue12), (-0.0f) - (multiplyAddValue33 * inverseLengthValue12), (-0.0f) - (multiplyAddValue34 * inverseLengthValue12))), 0.0f, 1.0f), 0.5f));
        float quotientValue19 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
        float clampedValue14 = (1.0f - clamp(comparisonValue62 ? (quotientValue19 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue19 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f)) * ((sampledTextureValue7.x * 0.039999999105930328369140625f) + sampledTextureValue7.y);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float productValue187 = clampedValue14 * intermediateValue85;
        float productValue188 = clampedValue14 * intermediateValue86;
        float productValue189 = clampedValue14 * intermediateValue87;
        float branchMergedValue10;
        float branchMergedValue20;
        float branchMergedValue21;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue242 = clampedValue14 * intermediateValue98;
        float productValue243 = clampedValue14 * intermediateValue99;
        float productValue244 = clampedValue14 * intermediateValue100;
        float branchMergedValue15;
        float branchMergedValue28;
        float branchMergedValue29;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        float productValue188 = clampedValue14 * intermediateValue86;
        float productValue189 = clampedValue14 * intermediateValue87;
        float productValue271 = clampedValue14 * intermediateValue88;
        float branchMergedValue10;
        float branchMergedValue20;
        float branchMergedValue21;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue243 = clampedValue14 * intermediateValue99;
        float productValue244 = clampedValue14 * intermediateValue100;
        float productValue301 = clampedValue14 * intermediateValue101;
        float branchMergedValue15;
        float branchMergedValue28;
        float branchMergedValue29;
#endif
        if (comparisonValue61)
        {
            float productValue190 = (multiplyAddValue9 + 1.0f) * 0.5f;
            float productValue191 = (multiplyAddValue10 + 1.0f) * 0.5f;
            uint scalarValue58 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue38 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue58))) + (-0.5f);
            uint sumValue123 = uint(min(int(uint(max(int(uint(int(multiplyAddValue38))), int(0u)))), int(scalarValue58 + 4294967294u)));
            float scalarValue59 = float(int(sumValue123));
            float4 sampledTextureValue8 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue190, productValue191, scalarValue59), 0.0f);
            float scalarValue60 = sampledTextureValue8.w;
            float sampledTextureValue9 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue190, productValue191, float(int(sumValue123 + 1u))), 0.0f).w - scalarValue60) * min(max(multiplyAddValue38 - scalarValue59, 0.0f), 1.0f)) + scalarValue60;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            branchMergedValue10 = sampledTextureValue9 * productValue189;
            branchMergedValue20 = sampledTextureValue9 * productValue188;
            branchMergedValue21 = sampledTextureValue9 * productValue187;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue15 = sampledTextureValue9 * productValue244;
            branchMergedValue28 = sampledTextureValue9 * productValue243;
            branchMergedValue29 = sampledTextureValue9 * productValue242;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            branchMergedValue10 = sampledTextureValue9 * productValue271;
            branchMergedValue20 = sampledTextureValue9 * productValue189;
            branchMergedValue21 = sampledTextureValue9 * productValue188;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue15 = sampledTextureValue9 * productValue301;
            branchMergedValue28 = sampledTextureValue9 * productValue244;
            branchMergedValue29 = sampledTextureValue9 * productValue243;
#endif
        }
        else
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            branchMergedValue10 = productValue189;
            branchMergedValue20 = productValue188;
            branchMergedValue21 = productValue187;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue15 = productValue244;
            branchMergedValue28 = productValue243;
            branchMergedValue29 = productValue242;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            branchMergedValue10 = productValue271;
            branchMergedValue20 = productValue189;
            branchMergedValue21 = productValue188;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue15 = productValue301;
            branchMergedValue28 = productValue244;
            branchMergedValue29 = productValue243;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue48 = branchMergedValue21;
        intermediateValue49 = branchMergedValue20;
        intermediateValue50 = branchMergedValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue54 = branchMergedValue29;
        intermediateValue55 = branchMergedValue28;
        intermediateValue56 = branchMergedValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue49 = branchMergedValue21;
        intermediateValue50 = branchMergedValue20;
        intermediateValue51 = branchMergedValue10;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue55 = branchMergedValue29;
        intermediateValue56 = branchMergedValue28;
        intermediateValue57 = branchMergedValue15;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue48 = 0.0f;
        intermediateValue49 = 0.0f;
        intermediateValue50 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue54 = 0.0f;
        intermediateValue55 = 0.0f;
        intermediateValue56 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue49 = 0.0f;
        intermediateValue50 = 0.0f;
        intermediateValue51 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue55 = 0.0f;
        intermediateValue56 = 0.0f;
        intermediateValue57 = 0.0f;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue192 = ((productValue85 * (((intermediateValue25 - sumValue110) * intermediateValue24) + sumValue110)) + productValue82) + intermediateValue48;
    float productValue193 = ((productValue85 * (((intermediateValue26 - sumValue111) * intermediateValue24) + sumValue111)) + productValue83) + intermediateValue49;
    float productValue194 = ((productValue85 * (((intermediateValue27 - sumValue112) * intermediateValue24) + sumValue112)) + productValue84) + intermediateValue50;
    float productValue112;
    float productValue113;
    float productValue114;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue245 = ((productValue93 * (((intermediateValue23 - sumValue158) * intermediateValue22) + sumValue158)) + productValue90) + intermediateValue54;
    float productValue246 = ((productValue93 * (((intermediateValue24 - sumValue159) * intermediateValue22) + sumValue159)) + productValue91) + intermediateValue55;
    float productValue247 = ((productValue93 * (((intermediateValue25 - sumValue160) * intermediateValue22) + sumValue160)) + productValue92) + intermediateValue56;
    float productValue121;
    float productValue122;
    float productValue123;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    float productValue272 = ((productValue87 * (((intermediateValue26 - sumValue172) * intermediateValue25) + sumValue172)) + productValue84) + intermediateValue49;
    float productValue273 = ((productValue87 * (((intermediateValue27 - sumValue173) * intermediateValue25) + sumValue173)) + productValue85) + intermediateValue50;
    float productValue274 = ((productValue87 * (((intermediateValue28 - sumValue174) * intermediateValue25) + sumValue174)) + productValue86) + intermediateValue51;
    float productValue114;
    float productValue115;
    float productValue116;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    float productValue302 = ((productValue95 * (((intermediateValue24 - sumValue188) * intermediateValue23) + sumValue188)) + productValue92) + intermediateValue55;
    float productValue303 = ((productValue95 * (((intermediateValue25 - sumValue189) * intermediateValue23) + sumValue189)) + productValue93) + intermediateValue56;
    float productValue304 = ((productValue95 * (((intermediateValue26 - sumValue190) * intermediateValue23) + sumValue190)) + productValue94) + intermediateValue57;
    float productValue123;
    float productValue124;
    float productValue125;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue10 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue112 = sampledTextureValue10 * productValue192;
        productValue113 = sampledTextureValue10 * productValue193;
        productValue114 = sampledTextureValue10 * productValue194;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue121 = sampledTextureValue10 * productValue245;
        productValue122 = sampledTextureValue10 * productValue246;
        productValue123 = sampledTextureValue10 * productValue247;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue114 = sampledTextureValue10 * productValue272;
        productValue115 = sampledTextureValue10 * productValue273;
        productValue116 = sampledTextureValue10 * productValue274;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue123 = sampledTextureValue10 * productValue302;
        productValue124 = sampledTextureValue10 * productValue303;
        productValue125 = sampledTextureValue10 * productValue304;
#endif
    }
    else
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue112 = productValue192;
        productValue113 = productValue193;
        productValue114 = productValue194;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue121 = productValue245;
        productValue122 = productValue246;
        productValue123 = productValue247;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        productValue114 = productValue272;
        productValue115 = productValue273;
        productValue116 = productValue274;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        productValue123 = productValue302;
        productValue124 = productValue303;
        productValue125 = productValue304;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue112;
    fragmentColor0.y = productValue113;
    fragmentColor0.z = productValue114;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    fragmentColor0.x = productValue121;
    fragmentColor0.y = productValue122;
    fragmentColor0.z = productValue123;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue114;
    fragmentColor0.y = productValue115;
    fragmentColor0.z = productValue116;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    fragmentColor0.x = productValue123;
    fragmentColor0.y = productValue124;
    fragmentColor0.z = productValue125;
#endif
    fragmentColor0.w = (comparisonValue != 0u) ? 0.0f : 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
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
