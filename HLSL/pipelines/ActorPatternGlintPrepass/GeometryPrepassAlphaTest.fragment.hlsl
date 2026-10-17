// ActorPatternGlintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorPatternGlintPrepass/FragmentBindings.hlsli"

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
  workingVector0.w = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector1.x = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.yzw = workingVector0.xyz;
  workingVector2.xy = float2(-1,0);
  while (true) {
    workingVector2.z = RD_COMPARISON_MASK((int)workingVector2.y >= (int)workingVector1.x);
    if (workingVector2.z != 0) break;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+39].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+39].xy;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+41].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+41].xy;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+42].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+42].xy;
#endif
    workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector2.zw).xyzw;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+32].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+32].xyz + -workingVector1.yzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+34].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+34].xyz + -workingVector1.yzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+35].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+35].xyz + -workingVector1.yzw;
#endif
    workingVector1.yzw = workingVector2.zzz * workingVector3.xyz + workingVector1.yzw;
    workingVector2.z = RD_COMPARISON_MASK(0.5 < workingVector2.z);
    workingVector2.z = workingVector2.z ? workingVector2.x : 0;
    workingVector2.x = workingVector2.z ? 0 : workingVector2.x;
    workingVector2.y = (int)workingVector2.y + 1;
  }
  workingVector0.x = (int)workingVector0.w & -2;
  workingVector0.x = workingVector2.x ? workingVector0.w : workingVector0.x;
  workingVector0.yzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.yzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.yzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.yzw * workingVector0.yzw;
  workingVector0.yzw = -workingVector1.yzw * workingVector0.yzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + workingVector2.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  fragmentColor1.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.yzw;
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
      workingVector3.xyz = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyz;
      workingVector3.xyz = workingVector3.xyz * float3(2,2,2) + float3(-1,-1,-1);
      workingVector1.x = -1;
    } else {
      if (workingVector1.w != 0) {
        materialTexture4.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
        workingVector5.xyzw = materialTexture4.Gather(textureSampler4, workingVector0.zw).xyzw;
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
          materialTexture4.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector0.zw = floatingPointResult.xy;
          workingVector4.xyzw = materialTexture4.SampleLevel(textureSampler4, varyingTexCoord0.xy, 0).xyzw;
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
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue7.x;
    float scalarValue9 = sampledTextureValue7.y;
    float scalarValue10 = sampledTextureValue7.z;
    float scalarValue11 = sampledTextureValue7.w;
    float productValue34 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue35 = (productValue34 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue36 = (productValue34 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue37 = (productValue34 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue51 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue7.x;
    float scalarValue9 = sampledTextureValue7.y;
    float scalarValue10 = sampledTextureValue7.z;
    float scalarValue11 = sampledTextureValue7.w;
    float productValue34 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue35 = (productValue34 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue36 = (productValue34 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue37 = (productValue34 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10;
    float productValue60 = (productValue34 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue7.x;
    float scalarValue9 = sampledTextureValue7.y;
    float scalarValue11 = sampledTextureValue7.w;
    float productValue88 = float((((scalarValue8 + scalarValue9) + sampledTextureValue7.z) * (1.0f - scalarValue11)) > 0.0f);
    float productValue89 = (productValue88 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue90 = (productValue88 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue3 = floor(quotientValue1 * 0.25f);
        float productValue4 = floor(quotientValue1 * 0.5f);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue4 * productValue4) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue3 * productValue3) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if ((((productValue34 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue51 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue60 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if (((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((((productValue88 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue52 = (((RD_UNIFORM_CHANGE_COLOR.x * productValue) - productValue) * productValue51) + productValue;
    float productValue53 = (((RD_UNIFORM_CHANGE_COLOR.y * productValue1) - productValue1) * productValue51) + productValue1;
    float productValue54 = (((RD_UNIFORM_CHANGE_COLOR.z * productValue2) - productValue2) * productValue51) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue61 = (((RD_UNIFORM_CHANGE_COLOR.x * productValue35) - productValue35) * productValue60) + productValue35;
    float productValue62 = (((RD_UNIFORM_CHANGE_COLOR.y * productValue36) - productValue36) * productValue60) + productValue36;
    float productValue63 = (((RD_UNIFORM_CHANGE_COLOR.z * productValue37) - productValue37) * productValue60) + productValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue69 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue70 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue71 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue18 = ceil(productValue1);
    float productValue72 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue1) - productValue69) * scalarValue18) + productValue69;
    float productValue73 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue1) - productValue70) * scalarValue18) + productValue70;
    float productValue74 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue1) - productValue71) * scalarValue18) + productValue71;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue91 = RD_UNIFORM_CHANGE_COLOR.x * productValue89;
    float productValue92 = RD_UNIFORM_CHANGE_COLOR.y * productValue89;
    float productValue93 = RD_UNIFORM_CHANGE_COLOR.z * productValue89;
    float scalarValue21 = ceil(productValue90);
    float productValue94 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue90) - productValue91) * scalarValue21) + productValue91;
    float productValue95 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue90) - productValue92) * scalarValue21) + productValue92;
    float productValue96 = (((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue90) - productValue93) * scalarValue21) + productValue93;
#endif
    bool comparisonValue1;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    if (int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))) > int(0u))
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue;
        intermediateValue9 = productValue1;
        intermediateValue10 = productValue2;
        float productValue5;
        float productValue6;
        float productValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue35;
        intermediateValue13 = productValue36;
        intermediateValue14 = productValue37;
        float productValue6;
        float productValue7;
        float productValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue52;
        intermediateValue9 = productValue53;
        intermediateValue10 = productValue54;
        float productValue9;
        float productValue10;
        float productValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue61;
        intermediateValue13 = productValue62;
        intermediateValue14 = productValue63;
        float productValue10;
        float productValue11;
        float productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        uint intermediateValue7;
        uint intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        intermediateValue7 = 0u;
        intermediateValue8 = 1u;
        intermediateValue9 = productValue72;
        intermediateValue10 = productValue73;
        intermediateValue11 = productValue74;
        float productValue10;
        float productValue11;
        float productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        uint intermediateValue10;
        uint intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        intermediateValue10 = 0u;
        intermediateValue11 = 1u;
        intermediateValue12 = productValue94;
        intermediateValue13 = productValue95;
        intermediateValue14 = productValue96;
        float productValue11;
        float productValue12;
        float productValue13;
#endif
        uint comparisonValue3;
        for (;;)
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            uint sumValue = intermediateValue6 + 39u;
            uint sumValue1 = intermediateValue6 + 32u;
            float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue].z * varyingTexCoord0.x) + fragmentConstants[sumValue].x, (fragmentConstants[sumValue].w * varyingTexCoord0.y) + fragmentConstants[sumValue].y));
            float productValue14 = sampledTextureValue1.w * fragmentConstants[sumValue1].w;
            productValue5 = (((sampledTextureValue1.x * fragmentConstants[sumValue1].x) - intermediateValue8) * productValue14) + intermediateValue8;
            productValue6 = (((sampledTextureValue1.y * fragmentConstants[sumValue1].y) - intermediateValue9) * productValue14) + intermediateValue9;
            productValue7 = (((sampledTextureValue1.z * fragmentConstants[sumValue1].z) - intermediateValue10) * productValue14) + intermediateValue10;
            comparisonValue3 = ((intermediateValue7 != 0u) && (productValue14 > 0.5f)) ? 0u : intermediateValue7;
            uint sumValue2 = intermediateValue6 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            uint sumValue9 = intermediateValue10 + 39u;
            uint sumValue10 = intermediateValue10 + 32u;
            float4 sampledTextureValue8 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue9].z * varyingTexCoord0.x) + fragmentConstants[sumValue9].x, (fragmentConstants[sumValue9].w * varyingTexCoord0.y) + fragmentConstants[sumValue9].y));
            float productValue38 = sampledTextureValue8.w * fragmentConstants[sumValue10].w;
            productValue6 = (((sampledTextureValue8.x * fragmentConstants[sumValue10].x) - intermediateValue12) * productValue38) + intermediateValue12;
            productValue7 = (((sampledTextureValue8.y * fragmentConstants[sumValue10].y) - intermediateValue13) * productValue38) + intermediateValue13;
            productValue8 = (((sampledTextureValue8.z * fragmentConstants[sumValue10].z) - intermediateValue14) * productValue38) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue38 > 0.5f)) ? 0u : intermediateValue11;
            uint sumValue11 = intermediateValue10 + 1u;
            if (int(sumValue11) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            uint sumValue15 = intermediateValue6 + 41u;
            uint sumValue16 = intermediateValue6 + 34u;
            float4 sampledTextureValue9 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue15].z * varyingTexCoord0.x) + fragmentConstants[sumValue15].x, (fragmentConstants[sumValue15].w * varyingTexCoord0.y) + fragmentConstants[sumValue15].y));
            float productValue55 = sampledTextureValue9.w * fragmentConstants[sumValue16].w;
            productValue9 = (((sampledTextureValue9.x * fragmentConstants[sumValue16].x) - intermediateValue8) * productValue55) + intermediateValue8;
            productValue10 = (((sampledTextureValue9.y * fragmentConstants[sumValue16].y) - intermediateValue9) * productValue55) + intermediateValue9;
            productValue11 = (((sampledTextureValue9.z * fragmentConstants[sumValue16].z) - intermediateValue10) * productValue55) + intermediateValue10;
            comparisonValue3 = ((intermediateValue7 != 0u) && (productValue55 > 0.5f)) ? 0u : intermediateValue7;
            uint sumValue2 = intermediateValue6 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            uint sumValue20 = intermediateValue10 + 41u;
            uint sumValue21 = intermediateValue10 + 34u;
            float4 sampledTextureValue10 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue20].z * varyingTexCoord0.x) + fragmentConstants[sumValue20].x, (fragmentConstants[sumValue20].w * varyingTexCoord0.y) + fragmentConstants[sumValue20].y));
            float productValue64 = sampledTextureValue10.w * fragmentConstants[sumValue21].w;
            productValue10 = (((sampledTextureValue10.x * fragmentConstants[sumValue21].x) - intermediateValue12) * productValue64) + intermediateValue12;
            productValue11 = (((sampledTextureValue10.y * fragmentConstants[sumValue21].y) - intermediateValue13) * productValue64) + intermediateValue13;
            productValue12 = (((sampledTextureValue10.z * fragmentConstants[sumValue21].z) - intermediateValue14) * productValue64) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue64 > 0.5f)) ? 0u : intermediateValue11;
            uint sumValue11 = intermediateValue10 + 1u;
            if (int(sumValue11) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            uint sumValue25 = intermediateValue7 + 42u;
            uint sumValue26 = intermediateValue7 + 35u;
            float4 sampledTextureValue11 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue25].z * varyingTexCoord0.x) + fragmentConstants[sumValue25].x, (fragmentConstants[sumValue25].w * varyingTexCoord0.y) + fragmentConstants[sumValue25].y));
            float productValue75 = sampledTextureValue11.w * fragmentConstants[sumValue26].w;
            productValue10 = (((sampledTextureValue11.x * fragmentConstants[sumValue26].x) - intermediateValue9) * productValue75) + intermediateValue9;
            productValue11 = (((sampledTextureValue11.y * fragmentConstants[sumValue26].y) - intermediateValue10) * productValue75) + intermediateValue10;
            productValue12 = (((sampledTextureValue11.z * fragmentConstants[sumValue26].z) - intermediateValue11) * productValue75) + intermediateValue11;
            comparisonValue3 = ((intermediateValue8 != 0u) && (productValue75 > 0.5f)) ? 0u : intermediateValue8;
            uint sumValue27 = intermediateValue7 + 1u;
            if (int(sumValue27) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            uint sumValue31 = intermediateValue10 + 42u;
            uint sumValue32 = intermediateValue10 + 35u;
            float4 sampledTextureValue12 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue31].z * varyingTexCoord0.x) + fragmentConstants[sumValue31].x, (fragmentConstants[sumValue31].w * varyingTexCoord0.y) + fragmentConstants[sumValue31].y));
            float productValue97 = sampledTextureValue12.w * fragmentConstants[sumValue32].w;
            productValue11 = (((sampledTextureValue12.x * fragmentConstants[sumValue32].x) - intermediateValue12) * productValue97) + intermediateValue12;
            productValue12 = (((sampledTextureValue12.y * fragmentConstants[sumValue32].y) - intermediateValue13) * productValue97) + intermediateValue13;
            productValue13 = (((sampledTextureValue12.z * fragmentConstants[sumValue32].z) - intermediateValue14) * productValue97) + intermediateValue14;
            comparisonValue3 = ((intermediateValue11 != 0u) && (productValue97 > 0.5f)) ? 0u : intermediateValue11;
            uint sumValue11 = intermediateValue10 + 1u;
            if (int(sumValue11) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#endif
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue6 = sumValue2;
                intermediateValue7 = comparisonValue3;
                intermediateValue8 = productValue5;
                intermediateValue9 = productValue6;
                intermediateValue10 = productValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue10 = sumValue11;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue6;
                intermediateValue13 = productValue7;
                intermediateValue14 = productValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue6 = sumValue2;
                intermediateValue7 = comparisonValue3;
                intermediateValue8 = productValue9;
                intermediateValue9 = productValue10;
                intermediateValue10 = productValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue10 = sumValue11;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue10;
                intermediateValue13 = productValue11;
                intermediateValue14 = productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue7 = sumValue27;
                intermediateValue8 = comparisonValue3;
                intermediateValue9 = productValue10;
                intermediateValue10 = productValue11;
                intermediateValue11 = productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue10 = sumValue11;
                intermediateValue11 = comparisonValue3;
                intermediateValue12 = productValue11;
                intermediateValue13 = productValue12;
                intermediateValue14 = productValue13;
#endif
            }
            else
            {
                break;
            }
        }
        comparisonValue1 = comparisonValue3 != 0u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue3 = productValue5;
        intermediateValue4 = productValue6;
        intermediateValue5 = productValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue7 = productValue6;
        intermediateValue8 = productValue7;
        intermediateValue9 = productValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue3 = productValue9;
        intermediateValue4 = productValue10;
        intermediateValue5 = productValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = productValue10;
        intermediateValue8 = productValue11;
        intermediateValue9 = productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue4 = productValue10;
        intermediateValue5 = productValue11;
        intermediateValue6 = productValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue7 = productValue11;
        intermediateValue8 = productValue12;
        intermediateValue9 = productValue13;
#endif
    }
    else
    {
        comparisonValue1 = true;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue3 = productValue;
        intermediateValue4 = productValue1;
        intermediateValue5 = productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue7 = productValue35;
        intermediateValue8 = productValue36;
        intermediateValue9 = productValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue3 = productValue52;
        intermediateValue4 = productValue53;
        intermediateValue5 = productValue54;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = productValue61;
        intermediateValue8 = productValue62;
        intermediateValue9 = productValue63;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue4 = productValue72;
        intermediateValue5 = productValue73;
        intermediateValue6 = productValue74;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue7 = productValue94;
        intermediateValue8 = productValue95;
        intermediateValue9 = productValue96;
#endif
    }
    uint comparisonValue2 = comparisonValue1 ? scalarValue : (scalarValue & 4294967294u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue15 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue3;
    float productValue16 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue4;
    float productValue17 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue5;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float productValue39 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue7;
    float productValue40 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue8;
    float productValue41 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue76 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue4;
    float productValue77 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue5;
    float productValue78 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue6;
#endif
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue18 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue19 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue20 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue3.z + sampledTextureValue2.z);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((comparisonValue2 & 1u) == 0u)
    {
        intermediateValue11 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue4.x;
        intermediateValue12 = sampledTextureValue4.y;
        intermediateValue13 = sampledTextureValue4.z;
        intermediateValue14 = ((comparisonValue2 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#endif
    float intermediateValue15;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((comparisonValue2 & 1u) == 0u)
    {
        intermediateValue12 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue15 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue12 = sampledTextureValue4.x;
        intermediateValue13 = sampledTextureValue4.y;
        intermediateValue14 = sampledTextureValue4.z;
        intermediateValue15 = ((comparisonValue2 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#endif
    float intermediateValue16;
    float intermediateValue17;
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float intermediateValue18;
    if ((comparisonValue2 & 1u) == 0u)
    {
        intermediateValue15 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue16 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue17 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue18 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue15 = sampledTextureValue4.x;
        intermediateValue16 = sampledTextureValue4.y;
        intermediateValue17 = sampledTextureValue4.z;
        intermediateValue18 = ((comparisonValue2 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue18;
#endif
    if ((comparisonValue2 & 28u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        intermediateValue19 = varyingNormal0.x;
        intermediateValue20 = varyingNormal0.y;
        intermediateValue21 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue16 = varyingNormal0.x;
        intermediateValue17 = varyingNormal0.y;
        intermediateValue18 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
#endif
        if ((comparisonValue2 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue2 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue2 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount762;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount762);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount787;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount787);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount784;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount784);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount809;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount809);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount791;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount791);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount813;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount813);
#endif
                    float4 sampledTextureValue5 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue21 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue22 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue4 = (((productValue21 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue21 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue5 = (((productValue22 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue22 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue6 = ((abs(comparisonValue4) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue4;
                    float comparisonValue7 = ((abs(comparisonValue5) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue5;
                    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, 0.25f), float3(comparisonValue6, comparisonValue7, 0.25f)));
                    branchMergedValue3 = comparisonValue6 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue7 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue42 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue43 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue10 = (((productValue42 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue42 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue11 = (((productValue43 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue43 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue12 = ((abs(comparisonValue10) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue10;
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, 0.25f), float3(comparisonValue12, comparisonValue13, 0.25f)));
                    branchMergedValue3 = comparisonValue12 * inverseLengthValue8;
                    branchMergedValue4 = comparisonValue13 * inverseLengthValue8;
                    branchMergedValue5 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue56 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue57 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue14 = (((productValue56 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue56 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue15 = (((productValue57 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue57 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float inverseLengthValue13 = rsqrt(dot(float3(comparisonValue16, comparisonValue17, 0.25f), float3(comparisonValue16, comparisonValue17, 0.25f)));
                    branchMergedValue3 = comparisonValue16 * inverseLengthValue13;
                    branchMergedValue4 = comparisonValue17 * inverseLengthValue13;
                    branchMergedValue5 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue65 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue66 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue18 = (((productValue65 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue65 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue19 = (((productValue66 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue66 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue20 = ((abs(comparisonValue18) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue18;
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float inverseLengthValue15 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, 0.25f), float3(comparisonValue20, comparisonValue21, 0.25f)));
                    branchMergedValue3 = comparisonValue20 * inverseLengthValue15;
                    branchMergedValue4 = comparisonValue21 * inverseLengthValue15;
                    branchMergedValue5 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue79 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue80 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue22 = (((productValue79 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue79 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue23 = (((productValue80 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue80 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue24 = ((abs(comparisonValue22) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue22;
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float inverseLengthValue17 = rsqrt(dot(float3(comparisonValue24, comparisonValue25, 0.25f), float3(comparisonValue24, comparisonValue25, 0.25f)));
                    branchMergedValue3 = comparisonValue24 * inverseLengthValue17;
                    branchMergedValue4 = comparisonValue25 * inverseLengthValue17;
                    branchMergedValue5 = inverseLengthValue17 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue98 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue99 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue26 = (((productValue98 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue98 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue27 = (((productValue99 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue99 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue28 = ((abs(comparisonValue26) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue26;
                    float comparisonValue29 = ((abs(comparisonValue27) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue27;
                    float inverseLengthValue22 = rsqrt(dot(float3(comparisonValue28, comparisonValue29, 0.25f), float3(comparisonValue28, comparisonValue29, 0.25f)));
                    branchMergedValue3 = comparisonValue28 * inverseLengthValue22;
                    branchMergedValue4 = comparisonValue29 * inverseLengthValue22;
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
                uint unusedTextureMipCount703;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount703);
                float productValue23 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue24 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = frac(productValue23);
                float scalarValue3 = frac(productValue24);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount728;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount728);
                float productValue44 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue45 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue44);
                float scalarValue13 = frac(productValue45);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount725;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount725);
                float productValue58 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue59 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue14 = frac(productValue58);
                float scalarValue15 = frac(productValue59);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount750;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount750);
                float productValue67 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue68 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue16 = frac(productValue67);
                float scalarValue17 = frac(productValue68);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount732;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount732);
                float productValue81 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue82 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue19 = frac(productValue81);
                float scalarValue20 = frac(productValue82);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount754;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount754);
                float productValue100 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue101 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue22 = frac(productValue100);
                float scalarValue23 = frac(productValue101);
#endif
                float comparisonValue8;
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
                    comparisonValue8 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue8 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue8 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue8 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue8 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue8 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.x;
                }
                float comparisonValue9;
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
                    comparisonValue9 = ((scalarValue3 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue9 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue9 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue9 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue9 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue9 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue9 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue8, comparisonValue9));
                float scalarValue4 = vectorValue2.x;
                float scalarValue5 = vectorValue2.y;
                float scalarValue6 = vectorValue2.z;
                float scalarValue7 = vectorValue2.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue3 = frac(productValue23 + 0.5f);
                float sumValue4 = frac(productValue24 + 0.5f);
                bool conditionValue = sumValue4 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue12 = frac(productValue44 + 0.5f);
                float sumValue13 = frac(productValue45 + 0.5f);
                bool conditionValue3 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue17 = frac(productValue58 + 0.5f);
                float sumValue18 = frac(productValue59 + 0.5f);
                bool conditionValue6 = sumValue18 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue22 = frac(productValue67 + 0.5f);
                float sumValue23 = frac(productValue68 + 0.5f);
                bool conditionValue8 = sumValue23 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue28 = frac(productValue81 + 0.5f);
                float sumValue29 = frac(productValue82 + 0.5f);
                bool conditionValue10 = sumValue29 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue33 = frac(productValue100 + 0.5f);
                float sumValue34 = frac(productValue101 + 0.5f);
                bool conditionValue13 = sumValue34 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue5 = clampedValue4 - clampedValue5;
                bool conditionValue1 = sumValue3 > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float clampedValue6 = intermediateValue[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue6, 0.25f), float3(sumValue5, clampedValue6, 0.25f)));
                branchMergedValue = inverseLengthValue2 * sumValue5;
                branchMergedValue1 = inverseLengthValue2 * clampedValue6;
                branchMergedValue2 = inverseLengthValue2 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue3 ? scalarValue5 : scalarValue6;
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue8 - clampedValue9;
                bool conditionValue4 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue4 ? scalarValue5 : scalarValue4;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue9 = rsqrt(dot(float3(sumValue14, clampedValue10, 0.25f), float3(sumValue14, clampedValue10, 0.25f)));
                branchMergedValue = inverseLengthValue9 * sumValue14;
                branchMergedValue1 = inverseLengthValue9 * clampedValue10;
                branchMergedValue2 = inverseLengthValue9 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue6 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue6 ? scalarValue5 : scalarValue6;
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue17 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue17 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue19 = clampedValue11 - clampedValue12;
                bool conditionValue7 = sumValue17 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue7 ? scalarValue5 : scalarValue4;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue14 = rsqrt(dot(float3(sumValue19, clampedValue13, 0.25f), float3(sumValue19, clampedValue13, 0.25f)));
                branchMergedValue = inverseLengthValue14 * sumValue19;
                branchMergedValue1 = inverseLengthValue14 * clampedValue13;
                branchMergedValue2 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue8 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue8 ? scalarValue5 : scalarValue6;
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue22 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue22 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue24 = clampedValue14 - clampedValue15;
                bool conditionValue9 = sumValue22 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue9 ? scalarValue5 : scalarValue4;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue23 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue23 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue16 = rsqrt(dot(float3(sumValue24, clampedValue16, 0.25f), float3(sumValue24, clampedValue16, 0.25f)));
                branchMergedValue = inverseLengthValue16 * sumValue24;
                branchMergedValue1 = inverseLengthValue16 * clampedValue16;
                branchMergedValue2 = inverseLengthValue16 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue10 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue10 ? scalarValue5 : scalarValue6;
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue28 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue28 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue30 = clampedValue17 - clampedValue18;
                bool conditionValue11 = sumValue28 > 0.5f;
                intermediateValue[0u] = conditionValue11 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue11 ? scalarValue5 : scalarValue4;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue29 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue29 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue18 = rsqrt(dot(float3(sumValue30, clampedValue19, 0.25f), float3(sumValue30, clampedValue19, 0.25f)));
                branchMergedValue = inverseLengthValue18 * sumValue30;
                branchMergedValue1 = inverseLengthValue18 * clampedValue19;
                branchMergedValue2 = inverseLengthValue18 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue13 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue13 ? scalarValue5 : scalarValue6;
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue33 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue33 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue35 = clampedValue20 - clampedValue21;
                bool conditionValue14 = sumValue33 > 0.5f;
                intermediateValue[0u] = conditionValue14 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue14 ? scalarValue5 : scalarValue4;
                float clampedValue22 = intermediateValue[uint(int(clamp((sumValue34 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue34 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue23 = rsqrt(dot(float3(sumValue35, clampedValue22, 0.25f), float3(sumValue35, clampedValue22, 0.25f)));
                branchMergedValue = inverseLengthValue23 * sumValue35;
                branchMergedValue1 = inverseLengthValue23 * clampedValue22;
                branchMergedValue2 = inverseLengthValue23 * 0.25f;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
            intermediateValue26 = branchMergedValue;
            intermediateValue27 = branchMergedValue1;
            intermediateValue28 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue23 = branchMergedValue;
            intermediateValue24 = branchMergedValue1;
            intermediateValue25 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue6 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue22 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
            intermediateValue26 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue27 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue28 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue23 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue25 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue3 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue23, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue23, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue23, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue15 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue16 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue17 = inverseLengthValue6 * multiplyAddValue2;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue26;
        float multiplyAddValue5 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue28, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue27, inverseLengthValue10 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue28, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue27, inverseLengthValue10 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue28, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue27, inverseLengthValue10 * varyingTangent0.z));
        float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue19 = inverseLengthValue11 * multiplyAddValue5;
        intermediateValue20 = inverseLengthValue11 * multiplyAddValue6;
        intermediateValue21 = inverseLengthValue11 * multiplyAddValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue19 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue23;
        float multiplyAddValue8 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue24, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue24, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue24, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue16 = inverseLengthValue20 * multiplyAddValue8;
        intermediateValue17 = inverseLengthValue20 * multiplyAddValue9;
        intermediateValue18 = inverseLengthValue20 * multiplyAddValue10;
#endif
    }
    float sumValue6 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue7 = rsqrt(dot(float3(intermediateValue15, intermediateValue16, intermediateValue17), float3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue25 = inverseLengthValue7 * intermediateValue15;
    float productValue26 = inverseLengthValue7 * intermediateValue16;
    float productValue27 = inverseLengthValue7 * intermediateValue17;
    float quotientValue2 = 1.0f / ((abs(productValue26) + abs(productValue25)) + abs(productValue27));
    float productValue28 = quotientValue2 * productValue25;
    float productValue29 = quotientValue2 * productValue26;
    bool conditionValue2 = productValue27 < 0.0f;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float inverseLengthValue12 = rsqrt(dot(float3(intermediateValue19, intermediateValue20, intermediateValue21), float3(intermediateValue19, intermediateValue20, intermediateValue21)));
    float productValue46 = inverseLengthValue12 * intermediateValue19;
    float productValue47 = inverseLengthValue12 * intermediateValue20;
    float productValue48 = inverseLengthValue12 * intermediateValue21;
    float quotientValue3 = 1.0f / ((abs(productValue47) + abs(productValue46)) + abs(productValue48));
    float productValue49 = quotientValue3 * productValue46;
    float productValue50 = quotientValue3 * productValue47;
    bool conditionValue5 = productValue48 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue21 = rsqrt(dot(float3(intermediateValue16, intermediateValue17, intermediateValue18), float3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue83 = inverseLengthValue21 * intermediateValue16;
    float productValue84 = inverseLengthValue21 * intermediateValue17;
    float productValue85 = inverseLengthValue21 * intermediateValue18;
    float quotientValue4 = 1.0f / ((abs(productValue84) + abs(productValue83)) + abs(productValue85));
    float productValue86 = quotientValue4 * productValue83;
    float productValue87 = quotientValue4 * productValue84;
    bool conditionValue12 = productValue85 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue30 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue30, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue30 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue30, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue30 * productValue30) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue30, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue31 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue32 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue33 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue7 = ceil(clamp(max(max(productValue31, productValue33), max(productValue32, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    fragmentColor0.x = ((uint(clamp(intermediateValue17, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue16, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue14, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue31 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue32 / clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue33 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) + (productValue18 * productValue18);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) + (productValue19 * productValue19);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) + (productValue20 * productValue20);
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue28 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue29))) : productValue28;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue28)) * ((productValue29 < 0.0f) ? (-1.0f) : 1.0f)) : productValue29;
#elif RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) + (productValue18 * productValue18);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) + (productValue19 * productValue19);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) + (productValue20 * productValue20);
    fragmentColor1.w = (intermediateValue15 > intermediateValue18) ? ((intermediateValue15 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue18 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue49 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue50))) : productValue49;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue49)) * ((productValue50 < 0.0f) ? (-1.0f) : 1.0f)) : productValue50;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) + (productValue18 * productValue18);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) + (productValue19 * productValue19);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78) + (productValue20 * productValue20);
    fragmentColor1.w = (intermediateValue12 > intermediateValue15) ? ((intermediateValue12 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue15 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue12 ? (((productValue86 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue87))) : productValue86;
    fragmentColor2.y = conditionValue12 ? ((1.0f - abs(productValue86)) * ((productValue87 < 0.0f) ? (-1.0f) : 1.0f)) : productValue87;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
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
