// ActorGlintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 14
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorGlintPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector2.y = 1 + -workingVector1.w;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(0 < workingVector2.x);
  workingVector2.x = workingVector2.x ? 1.000000 : 0;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw + -workingVector1.xyzw;
  workingVector0.xyzw = workingVector2.xxxx * workingVector0.xyzw + workingVector1.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.z = rsqrt(workingVector1.z);
  workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
  workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.z;
  workingVector1.w = 1 / workingVector1.w;
  workingVector1.z = saturate(workingVector1.z * workingVector1.w);
  workingVector1.w = workingVector1.z * -2 + 3;
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = workingVector1.w * workingVector1.z;
  workingVector2.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
  workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.xy = floor(workingVector2.xy);
  workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.xy;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.xyxy;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector2.zw = workingVector3.yw * workingVector3.yw;
  workingVector2.zw = float2(0.75,0.75) * workingVector2.zw;
  workingVector2.zw = workingVector3.xz * float2(0.5,0.5) + workingVector2.zw;
  workingVector2.zw = frac(workingVector2.zw);
  workingVector1.w = workingVector2.z * 0.25 + workingVector2.w;
  workingVector2.xy = floor(workingVector2.xy);
  workingVector2.y = workingVector2.y * workingVector2.y;
  workingVector2.y = 0.75 * workingVector2.y;
  workingVector2.x = workingVector2.x * 0.5 + workingVector2.y;
  workingVector2.x = frac(workingVector2.x);
  workingVector1.w = workingVector1.w * 0.25 + workingVector2.x;
  workingVector1.w = workingVector1.w * 64 + 0.5;
  workingVector1.w = 0.015625 * workingVector1.w;
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.w >= workingVector1.z);
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector2.y = 1 + -workingVector1.w;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(0 < workingVector2.x);
  workingVector2.x = workingVector2.x ? 1.000000 : 0;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw + -workingVector1.xyzw;
  workingVector0.xyzw = workingVector2.xxxx * workingVector0.xyzw + workingVector1.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.z = rsqrt(workingVector1.z);
  workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
  workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.z;
  workingVector1.w = 1 / workingVector1.w;
  workingVector1.z = saturate(workingVector1.z * workingVector1.w);
  workingVector1.w = workingVector1.z * -2 + 3;
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = workingVector1.w * workingVector1.z;
  workingVector2.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
  workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.xy = floor(workingVector2.xy);
  workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.xy;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.xyxy;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector2.zw = workingVector3.yw * workingVector3.yw;
  workingVector2.zw = float2(0.75,0.75) * workingVector2.zw;
  workingVector2.zw = workingVector3.xz * float2(0.5,0.5) + workingVector2.zw;
  workingVector2.zw = frac(workingVector2.zw);
  workingVector1.w = workingVector2.z * 0.25 + workingVector2.w;
  workingVector2.xy = floor(workingVector2.xy);
  workingVector2.y = workingVector2.y * workingVector2.y;
  workingVector2.y = 0.75 * workingVector2.y;
  workingVector2.x = workingVector2.x * 0.5 + workingVector2.y;
  workingVector2.x = frac(workingVector2.x);
  workingVector1.w = workingVector1.w * 0.25 + workingVector2.x;
  workingVector1.w = workingVector1.w * 64 + 0.5;
  workingVector1.w = 0.015625 * workingVector1.w;
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.w >= workingVector1.z);
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.yzyz;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector1.w = workingVector2.x * 0.25 + workingVector2.y;
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
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector1.z = 1 + -workingVector1.w;
  workingVector0.w = workingVector1.z * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.yzyz;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector1.w = workingVector2.x * 0.25 + workingVector2.y;
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
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  fragmentColor1.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  workingVector0.x = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector1.xyzw = (int4)workingVector0.xxxx & int4(1,4,8,16);
  workingVector1.xyzw = RD_COMPARISON_MASK((int4)workingVector1.wxyz == int4(16,1,4,8));
  if (workingVector1.y != 0) {
    workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).zyxw;
    workingVector0.x = (int)workingVector0.x & 2;
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 2);
    workingVector0.y = workingVector0.x ? workingVector2.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    workingVector0.x = workingVector2.z;
  } else {
    workingVector0.x = RD_UNIFORM_METALNESS_UNIFORM.x;
    workingVector2.y = RD_UNIFORM_EMISSIVE_UNIFORM.x;
    workingVector2.x = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
    workingVector0.y = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
  }
  workingVector0.z = (int)workingVector1.w | (int)workingVector1.z;
  workingVector0.z = (int)workingVector1.x | (int)workingVector0.z;
  if (workingVector0.z != 0) {
    if (workingVector1.z != 0) {
      workingVector3.xyz = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyz;
      workingVector3.xyz = workingVector3.xyz * float3(2,2,2) + float3(-1,-1,-1);
      workingVector1.x = -1;
    } else {
      if (workingVector1.w != 0) {
        materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
        workingVector0.zw = floatingPointResult.xy;
        workingVector4.xyzw = workingVector0.zzww;
        workingVector0.zw = varyingTexCoord0.xy * workingVector4.yw;
        workingVector0.zw = frac(workingVector0.zw);
        workingVector1.yz = float2(-0.5,-0.5) + workingVector0.zw;
        workingVector1.yz = RD_COMPARISON_MASK(abs(workingVector1.yz) < float2(0.0625,0.0625));
        workingVector0.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector0.zw);
        workingVector0.zw = workingVector0.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
        workingVector0.zw = varyingTexCoord0.xy + workingVector0.zw;
        workingVector0.zw = workingVector1.yz ? workingVector0.zw : varyingTexCoord0.xy;
        workingVector5.xyzw = materialTexture3.Gather(textureSampler3, workingVector0.zw).xyzw;
        workingVector4.xyzw = varyingTexCoord0.xxyy * workingVector4.xyzw + float4(0.5,0.5,0.5,0.5);
        workingVector4.xyzw = frac(workingVector4.xyzw);
        workingVector6.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector4.wwyy);
        workingVector5.xyzw = workingVector6.xyzw ? workingVector5.xyzy : workingVector5.wzwx;
        workingVector4.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector4.xyzw;
        workingVector4.xyzw = saturate(workingVector4.xyzw + workingVector4.xyzw);
        workingVector4.xyzw = (int4)workingVector4.xyzw;
        workingVector0.z = dot(workingVector5.xy, icb[workingVector4.x+0].xy);
        workingVector0.w = dot(workingVector5.xy, icb[workingVector4.y+0].xy);
        workingVector6.x = workingVector0.z + -workingVector0.w;
        workingVector0.z = dot(workingVector5.zw, icb[workingVector4.z+0].xy);
        workingVector0.w = dot(workingVector5.zw, icb[workingVector4.w+0].xy);
        workingVector6.y = workingVector0.z + -workingVector0.w;
        workingVector6.z = 0.25;
        workingVector0.z = dot(workingVector6.xyz, workingVector6.xyz);
        workingVector0.z = rsqrt(workingVector0.z);
        workingVector3.xyz = workingVector6.xyz * workingVector0.zzz;
        workingVector1.x = -1;
      } else {
        if (workingVector1.x != 0) {
          materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector0.zw = floatingPointResult.xy;
          workingVector4.xyzw = materialTexture3.SampleLevel(textureSampler3, varyingTexCoord0.xy, 0).xyzw;
          workingVector0.zw = varyingTexCoord0.xy * workingVector0.zw;
          workingVector0.zw = frac(workingVector0.zw);
          workingVector1.yz = RD_COMPARISON_MASK(workingVector0.zw >= float2(0.916666687,0.916666687));
          workingVector1.yz = workingVector1.yz ? float2(1,1) : 0;
          workingVector4.xyzw = workingVector4.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
          workingVector0.zw = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector0.zw);
          workingVector0.zw = workingVector0.zw ? float2(1,1) : 0;
          workingVector0.zw = workingVector0.zw * -workingVector4.yw;
          workingVector0.zw = workingVector1.yz * workingVector4.xz + workingVector0.zw;
          workingVector1.yz = RD_COMPARISON_MASK(abs(workingVector0.zw) >= float2(0.00499999989,0.00499999989));
          workingVector1.yz = workingVector1.yz ? float2(1,1) : 0;
          workingVector4.xy = workingVector1.yz * workingVector0.zw;
          workingVector4.z = 0.25;
          workingVector0.z = dot(workingVector4.xyz, workingVector4.xyz);
          workingVector0.z = rsqrt(workingVector0.z);
          workingVector3.xyz = workingVector4.xyz * workingVector0.zzz;
        }
      }
    }
    workingVector1.xyz = workingVector1.xxx ? workingVector3.xyz : float3(0,0,1);
    workingVector0.z = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector3.xyz = varyingTangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector4.xyz = varyingBitangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingNormal0.xyz, varyingNormal0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector5.xyz = varyingNormal0.xyz * workingVector0.zzz;
    workingVector4.xyz = workingVector4.xyz * workingVector1.yyy;
    workingVector1.xyw = workingVector3.xyz * workingVector1.xxx + workingVector4.xyz;
    workingVector1.xyz = workingVector5.xyz * workingVector1.zzz + workingVector1.xyw;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
  } else {
    workingVector1.xyz = varyingNormal0.xyz;
  }
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.y < workingVector0.x);
  workingVector0.x = workingVector0.x * 0.498039216 + 0.501960814;
  workingVector0.y = -workingVector0.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.z ? workingVector0.x : workingVector0.y;
  workingVector0.x = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.xy = float2(1,1) + -abs(workingVector0.yx);
  workingVector1.zw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector1.zw = workingVector1.zw ? float2(1,1) : 0;
  workingVector1.zw = workingVector1.zw * float2(2,2) + float2(-1,-1);
  workingVector1.xy = workingVector1.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.xy : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector3.yyy;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector1.xyz;
  workingVector0.zw = workingVector1.xy / workingVector1.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.xy + -workingVector0.zw;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector1.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.y = workingVector1.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.y = workingVector1.x * workingVector0.y;
  workingVector0.y = workingVector1.x * workingVector1.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.z = workingVector1.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector1.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.xy = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.x, workingVector1.y);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector1.w = 0.00392156886 * workingVector0.w;
  workingVector1.xyz = workingVector0.xyz / workingVector1.www;
  workingVector1.xyzw = saturate(workingVector1.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = 255 * RD_UNIFORM_BLOCK_LIGHT_COLOR.w;
  workingVector0.x = floor(workingVector0.x);
  workingVector0.x = (uint)workingVector0.x;
  workingVector0.xy = (int2)workingVector0.xx & int2(1,2);
  workingVector0.z = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.z = 255 * workingVector0.z;
  workingVector0.z = (uint)workingVector0.z;
  workingVector0.xy = workingVector0.xy ? float2(256,512) : float2(0,0);
  workingVector0.x = (int)workingVector0.x + (int)workingVector0.z;
  fragmentColor0.w = (int)workingVector0.y + (int)workingVector0.x;
  workingVector2.xy = saturate(workingVector2.xy);
  workingVector0.xy = float2(255,255) * workingVector2.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue10 = sampledTextureValue6.z;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue21 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue34 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue35 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue36 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue37 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue10 = sampledTextureValue6.z;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue21 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue45 = (productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue46 = (productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue47 = (productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10;
    float productValue48 = (productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue34 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue35 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue71 = float((((scalarValue8 + scalarValue9) + sampledTextureValue6.z) * (1.0f - scalarValue11)) > 0.0f);
    float productValue72 = (productValue71 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue73 = (productValue71 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue = floor(quotientValue1 * 0.25f);
        float productValue1 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue * productValue) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if ((((productValue21 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue37 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue48 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if (((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((((productValue71 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue2 = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue3 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue4 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue22 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((productValue21 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8);
    float productValue23 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((productValue21 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9);
    float productValue24 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((productValue21 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue38 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue34) - productValue34) * productValue37) + productValue34) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue39 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue35) - productValue35) * productValue37) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue40 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue36) - productValue36) * productValue37) + productValue36) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue49 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue45) - productValue45) * productValue48) + productValue45) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue50 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue46) - productValue46) * productValue48) + productValue46) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue51 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue47) - productValue47) * productValue48) + productValue47) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue56 = RD_UNIFORM_CHANGE_COLOR.x * productValue34;
    float productValue57 = RD_UNIFORM_CHANGE_COLOR.y * productValue34;
    float productValue58 = RD_UNIFORM_CHANGE_COLOR.z * productValue34;
    float scalarValue18 = ceil(productValue35);
    float productValue59 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue35) - productValue56) * scalarValue18) + productValue56) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue60 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue35) - productValue57) * scalarValue18) + productValue57) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue61 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue35) - productValue58) * scalarValue18) + productValue58) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue74 = RD_UNIFORM_CHANGE_COLOR.x * productValue72;
    float productValue75 = RD_UNIFORM_CHANGE_COLOR.y * productValue72;
    float productValue76 = RD_UNIFORM_CHANGE_COLOR.z * productValue72;
    float scalarValue21 = ceil(productValue73);
    float productValue77 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue73) - productValue74) * scalarValue21) + productValue74) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue78 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue73) - productValue75) * scalarValue21) + productValue75) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue79 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue73) - productValue76) * scalarValue21) + productValue76) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue6 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue7 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue1 = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue3 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue4 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue3.x;
        intermediateValue4 = sampledTextureValue3.y;
        intermediateValue5 = sampledTextureValue3.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    float intermediateValue7;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue4 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue3.x;
        intermediateValue5 = sampledTextureValue3.y;
        intermediateValue6 = sampledTextureValue3.z;
        intermediateValue7 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#endif
    float intermediateValue8;
    float intermediateValue9;
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float intermediateValue10;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue7 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue10;
#endif
    if ((scalarValue1 & 28u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
#endif
        if ((scalarValue1 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue1 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue1 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount687;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount687);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount712;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount712);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount710;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount710);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount735;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount735);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount717;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount717);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount739;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount739);
#endif
                    float4 sampledTextureValue4 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue8 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue9 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue8 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue8 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue2 = (((productValue9 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue9 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, 0.25f), float3(comparisonValue3, comparisonValue4, 0.25f)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue25 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue26 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue7 = (((productValue25 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue25 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue8 = (((productValue26 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue26 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float comparisonValue10 = ((abs(comparisonValue8) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue8;
                    float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue9, comparisonValue10, 0.25f), float3(comparisonValue9, comparisonValue10, 0.25f)));
                    branchMergedValue3 = comparisonValue9 * inverseLengthValue8;
                    branchMergedValue4 = comparisonValue10 * inverseLengthValue8;
                    branchMergedValue5 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue41 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue42 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue11 = (((productValue41 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue41 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue12 = (((productValue42 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue42 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float comparisonValue14 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                    float inverseLengthValue13 = rsqrt(dot(float3(comparisonValue13, comparisonValue14, 0.25f), float3(comparisonValue13, comparisonValue14, 0.25f)));
                    branchMergedValue3 = comparisonValue13 * inverseLengthValue13;
                    branchMergedValue4 = comparisonValue14 * inverseLengthValue13;
                    branchMergedValue5 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue52 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue53 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue15 = (((productValue52 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue52 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue16 = (((productValue53 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue53 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float comparisonValue18 = ((abs(comparisonValue16) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue16;
                    float inverseLengthValue15 = rsqrt(dot(float3(comparisonValue17, comparisonValue18, 0.25f), float3(comparisonValue17, comparisonValue18, 0.25f)));
                    branchMergedValue3 = comparisonValue17 * inverseLengthValue15;
                    branchMergedValue4 = comparisonValue18 * inverseLengthValue15;
                    branchMergedValue5 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue62 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue63 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue19 = (((productValue62 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue62 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue20 = (((productValue63 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue63 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float comparisonValue22 = ((abs(comparisonValue20) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue20;
                    float inverseLengthValue17 = rsqrt(dot(float3(comparisonValue21, comparisonValue22, 0.25f), float3(comparisonValue21, comparisonValue22, 0.25f)));
                    branchMergedValue3 = comparisonValue21 * inverseLengthValue17;
                    branchMergedValue4 = comparisonValue22 * inverseLengthValue17;
                    branchMergedValue5 = inverseLengthValue17 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue80 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue81 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue23 = (((productValue80 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue80 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue24 = (((productValue81 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue81 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float comparisonValue26 = ((abs(comparisonValue24) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue24;
                    float inverseLengthValue22 = rsqrt(dot(float3(comparisonValue25, comparisonValue26, 0.25f), float3(comparisonValue25, comparisonValue26, 0.25f)));
                    branchMergedValue3 = comparisonValue25 * inverseLengthValue22;
                    branchMergedValue4 = comparisonValue26 * inverseLengthValue22;
                    branchMergedValue5 = inverseLengthValue22 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount628;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount628);
                float productValue10 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue11 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = frac(productValue10);
                float scalarValue3 = frac(productValue11);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount653;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount653);
                float productValue27 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue28 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue27);
                float scalarValue13 = frac(productValue28);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount651;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount651);
                float productValue43 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue44 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue14 = frac(productValue43);
                float scalarValue15 = frac(productValue44);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount676;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount676);
                float productValue54 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue55 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue16 = frac(productValue54);
                float scalarValue17 = frac(productValue55);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount658;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount658);
                float productValue64 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue65 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue19 = frac(productValue64);
                float scalarValue20 = frac(productValue65);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount680;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount680);
                float productValue82 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue83 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue22 = frac(productValue82);
                float scalarValue23 = frac(productValue83);
#endif
                float comparisonValue5;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue2 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue12 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue14 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue3 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue13 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue20 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue3 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue5, comparisonValue6));
                float scalarValue4 = vectorValue2.x;
                float scalarValue5 = vectorValue2.y;
                float scalarValue6 = vectorValue2.z;
                float scalarValue7 = vectorValue2.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue = frac(productValue10 + 0.5f);
                float sumValue1 = frac(productValue11 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue6 = frac(productValue27 + 0.5f);
                float sumValue7 = frac(productValue28 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue9 = frac(productValue43 + 0.5f);
                float sumValue10 = frac(productValue44 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue12 = frac(productValue54 + 0.5f);
                float sumValue13 = frac(productValue55 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue15 = frac(productValue64 + 0.5f);
                float sumValue16 = frac(productValue65 + 0.5f);
                bool conditionValue10 = sumValue16 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue18 = frac(productValue82 + 0.5f);
                float sumValue19 = frac(productValue83 + 0.5f);
                bool conditionValue13 = sumValue19 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue2 = clampedValue4 - clampedValue5;
                bool conditionValue1 = sumValue > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float clampedValue6 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue2 = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * clampedValue6;
                branchMergedValue2 = inverseLengthValue2 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue3 ? scalarValue5 : scalarValue6;
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue6 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue6 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue8 = clampedValue8 - clampedValue9;
                bool conditionValue4 = sumValue6 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue4 ? scalarValue5 : scalarValue4;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue7 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue7 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue9 = rsqrt(dot(float3(sumValue8, clampedValue10, 0.25f), float3(sumValue8, clampedValue10, 0.25f)));
                branchMergedValue = inverseLengthValue9 * sumValue8;
                branchMergedValue1 = inverseLengthValue9 * clampedValue10;
                branchMergedValue2 = inverseLengthValue9 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue6 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue6 ? scalarValue5 : scalarValue6;
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue11 = clampedValue11 - clampedValue12;
                bool conditionValue7 = sumValue9 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue7 ? scalarValue5 : scalarValue4;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue14 = rsqrt(dot(float3(sumValue11, clampedValue13, 0.25f), float3(sumValue11, clampedValue13, 0.25f)));
                branchMergedValue = inverseLengthValue14 * sumValue11;
                branchMergedValue1 = inverseLengthValue14 * clampedValue13;
                branchMergedValue2 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue8 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue8 ? scalarValue5 : scalarValue6;
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue14 - clampedValue15;
                bool conditionValue9 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue9 ? scalarValue5 : scalarValue4;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue16 = rsqrt(dot(float3(sumValue14, clampedValue16, 0.25f), float3(sumValue14, clampedValue16, 0.25f)));
                branchMergedValue = inverseLengthValue16 * sumValue14;
                branchMergedValue1 = inverseLengthValue16 * clampedValue16;
                branchMergedValue2 = inverseLengthValue16 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue10 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue10 ? scalarValue5 : scalarValue6;
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue17 = clampedValue17 - clampedValue18;
                bool conditionValue11 = sumValue15 > 0.5f;
                intermediateValue[0u] = conditionValue11 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue11 ? scalarValue5 : scalarValue4;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue18 = rsqrt(dot(float3(sumValue17, clampedValue19, 0.25f), float3(sumValue17, clampedValue19, 0.25f)));
                branchMergedValue = inverseLengthValue18 * sumValue17;
                branchMergedValue1 = inverseLengthValue18 * clampedValue19;
                branchMergedValue2 = inverseLengthValue18 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue13 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue13 ? scalarValue5 : scalarValue6;
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue20 = clampedValue20 - clampedValue21;
                bool conditionValue14 = sumValue18 > 0.5f;
                intermediateValue[0u] = conditionValue14 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue14 ? scalarValue5 : scalarValue4;
                float clampedValue22 = intermediateValue[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue23 = rsqrt(dot(float3(sumValue20, clampedValue22, 0.25f), float3(sumValue20, clampedValue22, 0.25f)));
                branchMergedValue = inverseLengthValue23 * sumValue20;
                branchMergedValue1 = inverseLengthValue23 * clampedValue22;
                branchMergedValue2 = inverseLengthValue23 * 0.25f;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue5 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue14 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
            intermediateValue18 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue15 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue3 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue16, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue15, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue16, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue15, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue16, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue15, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue7 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue8 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue2;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue10 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue10 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue10 * varyingTangent0.z));
        float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue11 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue11 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue11 * multiplyAddValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue19 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue8 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue16, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue16, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue16, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue8 = inverseLengthValue20 * multiplyAddValue8;
        intermediateValue9 = inverseLengthValue20 * multiplyAddValue9;
        intermediateValue10 = inverseLengthValue20 * multiplyAddValue10;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue7 = rsqrt(dot(float3(intermediateValue7, intermediateValue8, intermediateValue9), float3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue12 = inverseLengthValue7 * intermediateValue7;
    float productValue13 = inverseLengthValue7 * intermediateValue8;
    float productValue14 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0f / ((abs(productValue13) + abs(productValue12)) + abs(productValue14));
    float productValue15 = quotientValue2 * productValue12;
    float productValue16 = quotientValue2 * productValue13;
    bool conditionValue2 = productValue14 < 0.0f;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float inverseLengthValue12 = rsqrt(dot(float3(intermediateValue11, intermediateValue12, intermediateValue13), float3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue29 = inverseLengthValue12 * intermediateValue11;
    float productValue30 = inverseLengthValue12 * intermediateValue12;
    float productValue31 = inverseLengthValue12 * intermediateValue13;
    float quotientValue3 = 1.0f / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue3 * productValue29;
    float productValue33 = quotientValue3 * productValue30;
    bool conditionValue5 = productValue31 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue21 = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue66 = inverseLengthValue21 * intermediateValue8;
    float productValue67 = inverseLengthValue21 * intermediateValue9;
    float productValue68 = inverseLengthValue21 * intermediateValue10;
    float quotientValue4 = 1.0f / ((abs(productValue67) + abs(productValue66)) + abs(productValue68));
    float productValue69 = quotientValue4 * productValue66;
    float productValue70 = quotientValue4 * productValue67;
    bool conditionValue12 = productValue68 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue17 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue17, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue17 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue17, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue17 * productValue17) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue17, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue18 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue19 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue20 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue7 = ceil(clamp(max(max(productValue18, productValue20), max(productValue19, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) & 255u);
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    fragmentColor0.x = ((uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue18 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue19 / clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue20 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue15 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue16))) : productValue15;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue15)) * ((productValue16 < 0.0f) ? (-1.0f) : 1.0f)) : productValue16;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue32 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue32)) * ((productValue33 < 0.0f) ? (-1.0f) : 1.0f)) : productValue33;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue15 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue16))) : productValue15;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue15)) * ((productValue16 < 0.0f) ? (-1.0f) : 1.0f)) : productValue16;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue49) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue49) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue50) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue50) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue32 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue32)) * ((productValue33 < 0.0f) ? (-1.0f) : 1.0f)) : productValue33;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue61) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue61) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue7 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue12 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue12 ? ((1.0f - abs(productValue69)) * ((productValue70 < 0.0f) ? (-1.0f) : 1.0f)) : productValue70;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) + (productValue5 * productValue5);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78) + (productValue6 * productValue6);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue79) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue79) + (productValue7 * productValue7);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue32 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue32)) * ((productValue33 < 0.0f) ? (-1.0f) : 1.0f)) : productValue33;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
