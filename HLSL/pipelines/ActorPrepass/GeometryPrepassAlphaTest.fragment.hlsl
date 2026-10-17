// ActorPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 36
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
#define RD_BINDING_LAYOUT 11
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.w = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.w = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.z < workingVector0.w);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.y;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.z = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.z < workingVector0.w);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.y;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = dot(workingVector1.xyzw, float4(1,1,1,1));
  workingVector1.w = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector2.y = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector2.yzw = workingVector3.xyz * workingVector2.yyy;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector2.y = dot(-workingVector2.yzw, workingVector3.xyz);
  workingVector2.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector2.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector2.y;
  workingVector2.z = 1 / workingVector2.z;
  workingVector2.y = saturate(workingVector2.y * workingVector2.z);
  workingVector2.z = workingVector2.y * -2 + 3;
  workingVector2.y = workingVector2.y * workingVector2.y;
  workingVector2.y = workingVector2.z * workingVector2.y;
  workingVector2.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector2.zw = workingVector2.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.zw;
  workingVector2.zw = workingVector2.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.zw = floor(workingVector2.zw);
  workingVector2.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.zw;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.zwzw;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector3.x = workingVector3.x * 0.25 + workingVector3.y;
  workingVector2.zw = floor(workingVector2.zw);
  workingVector2.w = workingVector2.w * workingVector2.w;
  workingVector2.w = 0.75 * workingVector2.w;
  workingVector2.z = workingVector2.z * 0.5 + workingVector2.w;
  workingVector2.z = frac(workingVector2.z);
  workingVector2.z = workingVector3.x * 0.25 + workingVector2.z;
  workingVector2.z = workingVector2.z * 64 + 0.5;
  workingVector2.z = 0.015625 * workingVector2.z;
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.z >= workingVector2.y);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector1.w = (int)workingVector1.w | (int)workingVector2.x;
  if (workingVector1.w != 0) discard;
  workingVector0.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = dot(workingVector1.xyzw, float4(1,1,1,1));
  workingVector1.w = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector2.y = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector2.yzw = workingVector3.xyz * workingVector2.yyy;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector2.y = dot(-workingVector2.yzw, workingVector3.xyz);
  workingVector2.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector2.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector2.y;
  workingVector2.z = 1 / workingVector2.z;
  workingVector2.y = saturate(workingVector2.y * workingVector2.z);
  workingVector2.z = workingVector2.y * -2 + 3;
  workingVector2.y = workingVector2.y * workingVector2.y;
  workingVector2.y = workingVector2.z * workingVector2.y;
  workingVector2.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector2.zw = workingVector2.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.zw;
  workingVector2.zw = workingVector2.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.zw = floor(workingVector2.zw);
  workingVector2.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.zw;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.zwzw;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector3.x = workingVector3.x * 0.25 + workingVector3.y;
  workingVector2.zw = floor(workingVector2.zw);
  workingVector2.w = workingVector2.w * workingVector2.w;
  workingVector2.w = 0.75 * workingVector2.w;
  workingVector2.z = workingVector2.z * 0.5 + workingVector2.w;
  workingVector2.z = frac(workingVector2.z);
  workingVector2.z = workingVector3.x * 0.25 + workingVector2.z;
  workingVector2.z = workingVector2.z * 64 + 0.5;
  workingVector2.z = 0.015625 * workingVector2.z;
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.z >= workingVector2.y);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector1.w = (int)workingVector1.w | (int)workingVector2.x;
  if (workingVector1.w != 0) discard;
  workingVector0.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.w = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.w < workingVector1.x);
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.z;
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
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector1.x = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.w = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.w < workingVector1.x);
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.z;
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
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = workingVector0.z * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.w + workingVector0.z;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
  workingVector0.w = workingVector0.z * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.w + workingVector0.z;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.z = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.yzw = workingVector2.xyz * workingVector0.www;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.w = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.w = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.w;
  workingVector1.y = 1 / workingVector1.y;
  workingVector0.w = saturate(workingVector1.y * workingVector0.w);
  workingVector1.y = workingVector0.w * -2 + 3;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = workingVector1.y * workingVector0.w;
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
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.y >= workingVector0.w);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
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
  workingVector1.x = workingVector0.w * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.w;
  workingVector0.w = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector1.x + workingVector0.w;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.z = dot(workingVector0.xyzw, float4(1,1,1,1));
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.yzw = workingVector2.xyz * workingVector0.www;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.w = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.w = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.w;
  workingVector1.y = 1 / workingVector1.y;
  workingVector0.w = saturate(workingVector1.y * workingVector0.w);
  workingVector1.y = workingVector0.w * -2 + 3;
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = workingVector1.y * workingVector0.w;
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
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.y >= workingVector0.w);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = workingVector0.z * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.w + workingVector0.z;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.y = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.z = RD_COMPARISON_MASK(workingVector1.y < workingVector0.z);
  workingVector0.z = (int)workingVector0.z | (int)workingVector1.x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
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
  workingVector0.w = workingVector0.z * RD_UNIFORM_OVERLAY_COLOR.w + -workingVector0.z;
  workingVector0.z = RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x * workingVector0.w + workingVector0.z;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.y = 1 + -RD_UNIFORM_ACTOR_FP_EPSILON.x;
  workingVector0.z = RD_COMPARISON_MASK(workingVector1.y < workingVector0.z);
  workingVector0.z = (int)workingVector0.z | (int)workingVector1.x;
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
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue10 = sampledTextureValue4.z;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue19 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue20 = (productValue19 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue33 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue34 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue35 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue10 = sampledTextureValue4.z;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue19 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue43 = (productValue19 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue44 = (productValue19 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue45 = (productValue19 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10;
    float productValue20 = (productValue19 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue53 = (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue10 = sampledTextureValue4.z;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue19 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue20 = (productValue19 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
    float productValue54 = (((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float productValue33 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue34 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue35 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue53 = (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue10 = sampledTextureValue4.z;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue19 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue43 = (productValue19 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue44 = (productValue19 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue45 = (productValue19 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10;
    float productValue20 = (productValue19 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
    float productValue54 = (((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue33 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue34 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue92 = float((((scalarValue8 + scalarValue9) + sampledTextureValue4.z) * (1.0f - scalarValue11)) > 0.0f);
    float productValue93 = (productValue92 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue94 = (productValue92 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue95 = (productValue92 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue10 = sampledTextureValue4.z;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue19 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0f - scalarValue11)) > 0.0f);
    float productValue43 = (productValue19 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue44 = (productValue19 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue20 = (productValue19 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float productValue33 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue34 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue53 = (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue4.x;
    float scalarValue9 = sampledTextureValue4.y;
    float scalarValue11 = sampledTextureValue4.w;
    float productValue92 = float((((scalarValue8 + scalarValue9) + sampledTextureValue4.z) * (1.0f - scalarValue11)) > 0.0f);
    float productValue93 = (productValue92 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8;
    float productValue94 = (productValue92 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9;
    float productValue95 = (productValue92 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue11)) + scalarValue11;
    float productValue125 = (((productValue95 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue95) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue95;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue1 = floor(quotientValue1 * 0.25f);
        float productValue2 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue2 * productValue2) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    if ((((((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    if ((((((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20) < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    if ((dot(float4(productValue33, productValue34, productValue35, (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    if ((dot(float4(productValue43, productValue44, productValue45, (((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    if (((productValue53 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || (productValue53 > (1.0f - RD_UNIFORM_ACTOR_FP_EPSILON.x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    if (((productValue54 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || (productValue54 > (1.0f - RD_UNIFORM_ACTOR_FP_EPSILON.x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    if ((((((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    if ((((((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    if ((((((productValue95 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue95) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue95) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    if ((dot(float4(productValue33, productValue34, sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z, (((RD_UNIFORM_OVERLAY_COLOR.w * productValue) - productValue) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    if ((dot(float4(productValue43, productValue44, (productValue19 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10, (((productValue20 * RD_UNIFORM_OVERLAY_COLOR.w) - productValue20) * RD_UNIFORM_TINTED_ALPHA_TEST_ENABLED.x) + productValue20), 1.0f.xxxx) < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
    if (((productValue125 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || (productValue125 > (1.0f - RD_UNIFORM_ACTOR_FP_EPSILON.x))) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue3 = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue4 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue5 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue21 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((productValue19 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue8)) + scalarValue8);
    float productValue22 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((productValue19 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue9)) + scalarValue9);
    float productValue23 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((productValue19 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue10)) + scalarValue10);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue36 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue33;
    float productValue37 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue34;
    float productValue38 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue35;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue46 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue43;
    float productValue47 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue44;
    float productValue48 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue45;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue55 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue33) - productValue33) * productValue) + productValue33) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue56 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue34) - productValue34) * productValue) + productValue34) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue57 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue35) - productValue35) * productValue) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue62 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue43) - productValue43) * productValue20) + productValue43) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue63 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue44) - productValue44) * productValue20) + productValue44) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue64 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue45) - productValue45) * productValue20) + productValue45) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue77 = RD_UNIFORM_CHANGE_COLOR.x * productValue33;
    float productValue78 = RD_UNIFORM_CHANGE_COLOR.y * productValue33;
    float productValue79 = RD_UNIFORM_CHANGE_COLOR.z * productValue33;
    float scalarValue26 = ceil(productValue34);
    float productValue80 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue34) - productValue77) * scalarValue26) + productValue77) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue81 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue34) - productValue78) * scalarValue26) + productValue78) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue82 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue34) - productValue79) * scalarValue26) + productValue79) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue96 = RD_UNIFORM_CHANGE_COLOR.x * productValue93;
    float productValue97 = RD_UNIFORM_CHANGE_COLOR.y * productValue93;
    float productValue98 = RD_UNIFORM_CHANGE_COLOR.z * productValue93;
    float scalarValue29 = ceil(productValue94);
    float productValue99 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue94) - productValue96) * scalarValue29) + productValue96) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue100 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue94) - productValue97) * scalarValue29) + productValue97) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue101 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue94) - productValue98) * scalarValue29) + productValue98) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue106 = RD_UNIFORM_CHANGE_COLOR.x * productValue43;
    float productValue107 = RD_UNIFORM_CHANGE_COLOR.y * productValue43;
    float productValue108 = RD_UNIFORM_CHANGE_COLOR.z * productValue43;
    float scalarValue32 = ceil(productValue44);
    float productValue109 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue44) - productValue106) * scalarValue32) + productValue106) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue110 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue44) - productValue107) * scalarValue32) + productValue107) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue111 = ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue44) - productValue108) * scalarValue32) + productValue108) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#endif
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
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float intermediateValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue4 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue1.x;
        intermediateValue5 = sampledTextureValue1.y;
        intermediateValue6 = sampledTextureValue1.z;
        intermediateValue7 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#endif
    float intermediateValue8;
    float intermediateValue9;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue8 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue1.x;
        intermediateValue9 = sampledTextureValue1.y;
        intermediateValue10 = sampledTextureValue1.z;
        intermediateValue11 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#endif
    if ((scalarValue1 & 28u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount643;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount643);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount672;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount672);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount650;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount650);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount679;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount679);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount666;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount666);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount695;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount695);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount669;
                    uint2 vectorValue13 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount669);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount698;
                    uint2 vectorValue15 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount698);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount673;
                    uint2 vectorValue17 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount673);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    uint unusedTextureMipCount699;
                    uint2 vectorValue19 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount699);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                    uint unusedTextureMipCount708;
                    uint2 vectorValue21 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount708);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount676;
                    uint2 vectorValue23 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount676);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    uint unusedTextureMipCount702;
                    uint2 vectorValue25 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount702);
#endif
                    float4 sampledTextureValue2 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue6 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue7 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue6 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue6 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue2 = (((productValue7 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue7 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, 0.25f), float3(comparisonValue3, comparisonValue4, 0.25f)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue24 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue25 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue7 = (((productValue24 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue24 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue8 = (((productValue25 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue25 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float comparisonValue10 = ((abs(comparisonValue8) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue8;
                    float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue9, comparisonValue10, 0.25f), float3(comparisonValue9, comparisonValue10, 0.25f)));
                    branchMergedValue3 = comparisonValue9 * inverseLengthValue8;
                    branchMergedValue4 = comparisonValue10 * inverseLengthValue8;
                    branchMergedValue5 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue39 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue40 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue11 = (((productValue39 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue39 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue12 = (((productValue40 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue40 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float comparisonValue14 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                    float inverseLengthValue13 = rsqrt(dot(float3(comparisonValue13, comparisonValue14, 0.25f), float3(comparisonValue13, comparisonValue14, 0.25f)));
                    branchMergedValue3 = comparisonValue13 * inverseLengthValue13;
                    branchMergedValue4 = comparisonValue14 * inverseLengthValue13;
                    branchMergedValue5 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue49 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue50 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue15 = (((productValue49 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue49 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue16 = (((productValue50 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue50 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float comparisonValue18 = ((abs(comparisonValue16) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue16;
                    float inverseLengthValue15 = rsqrt(dot(float3(comparisonValue17, comparisonValue18, 0.25f), float3(comparisonValue17, comparisonValue18, 0.25f)));
                    branchMergedValue3 = comparisonValue17 * inverseLengthValue15;
                    branchMergedValue4 = comparisonValue18 * inverseLengthValue15;
                    branchMergedValue5 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue58 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue59 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue19 = (((productValue58 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue58 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue20 = (((productValue59 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue59 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float comparisonValue22 = ((abs(comparisonValue20) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue20;
                    float inverseLengthValue17 = rsqrt(dot(float3(comparisonValue21, comparisonValue22, 0.25f), float3(comparisonValue21, comparisonValue22, 0.25f)));
                    branchMergedValue3 = comparisonValue21 * inverseLengthValue17;
                    branchMergedValue4 = comparisonValue22 * inverseLengthValue17;
                    branchMergedValue5 = inverseLengthValue17 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue65 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue66 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue23 = (((productValue65 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue65 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue24 = (((productValue66 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue66 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float comparisonValue26 = ((abs(comparisonValue24) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue24;
                    float inverseLengthValue19 = rsqrt(dot(float3(comparisonValue25, comparisonValue26, 0.25f), float3(comparisonValue25, comparisonValue26, 0.25f)));
                    branchMergedValue3 = comparisonValue25 * inverseLengthValue19;
                    branchMergedValue4 = comparisonValue26 * inverseLengthValue19;
                    branchMergedValue5 = inverseLengthValue19 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue69 = frac(float(int(uint(int(float(int(vectorValue13.x)))))) * varyingTexCoord0.x);
                    float productValue70 = frac(float(int(uint(int(float(int(vectorValue13.y)))))) * varyingTexCoord0.y);
                    float comparisonValue27 = (((productValue69 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue69 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue28 = (((productValue70 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue70 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue29 = ((abs(comparisonValue27) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue27;
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue28;
                    float inverseLengthValue21 = rsqrt(dot(float3(comparisonValue29, comparisonValue30, 0.25f), float3(comparisonValue29, comparisonValue30, 0.25f)));
                    branchMergedValue3 = comparisonValue29 * inverseLengthValue21;
                    branchMergedValue4 = comparisonValue30 * inverseLengthValue21;
                    branchMergedValue5 = inverseLengthValue21 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue73 = frac(float(int(uint(int(float(int(vectorValue15.x)))))) * varyingTexCoord0.x);
                    float productValue74 = frac(float(int(uint(int(float(int(vectorValue15.y)))))) * varyingTexCoord0.y);
                    float comparisonValue31 = (((productValue73 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue73 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue32 = (((productValue74 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue74 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue33 = ((abs(comparisonValue31) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue31;
                    float comparisonValue34 = ((abs(comparisonValue32) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue32;
                    float inverseLengthValue23 = rsqrt(dot(float3(comparisonValue33, comparisonValue34, 0.25f), float3(comparisonValue33, comparisonValue34, 0.25f)));
                    branchMergedValue3 = comparisonValue33 * inverseLengthValue23;
                    branchMergedValue4 = comparisonValue34 * inverseLengthValue23;
                    branchMergedValue5 = inverseLengthValue23 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue83 = frac(float(int(uint(int(float(int(vectorValue17.x)))))) * varyingTexCoord0.x);
                    float productValue84 = frac(float(int(uint(int(float(int(vectorValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue35 = (((productValue83 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue83 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue36 = (((productValue84 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue84 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue35;
                    float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue36;
                    float inverseLengthValue25 = rsqrt(dot(float3(comparisonValue37, comparisonValue38, 0.25f), float3(comparisonValue37, comparisonValue38, 0.25f)));
                    branchMergedValue3 = comparisonValue37 * inverseLengthValue25;
                    branchMergedValue4 = comparisonValue38 * inverseLengthValue25;
                    branchMergedValue5 = inverseLengthValue25 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    float productValue102 = frac(float(int(uint(int(float(int(vectorValue19.x)))))) * varyingTexCoord0.x);
                    float productValue103 = frac(float(int(uint(int(float(int(vectorValue19.y)))))) * varyingTexCoord0.y);
                    float comparisonValue39 = (((productValue102 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue102 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue40 = (((productValue103 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue103 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue41 = ((abs(comparisonValue39) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue39;
                    float comparisonValue42 = ((abs(comparisonValue40) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue40;
                    float inverseLengthValue30 = rsqrt(dot(float3(comparisonValue41, comparisonValue42, 0.25f), float3(comparisonValue41, comparisonValue42, 0.25f)));
                    branchMergedValue3 = comparisonValue41 * inverseLengthValue30;
                    branchMergedValue4 = comparisonValue42 * inverseLengthValue30;
                    branchMergedValue5 = inverseLengthValue30 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                    float productValue112 = frac(float(int(uint(int(float(int(vectorValue21.x)))))) * varyingTexCoord0.x);
                    float productValue113 = frac(float(int(uint(int(float(int(vectorValue21.y)))))) * varyingTexCoord0.y);
                    float comparisonValue43 = (((productValue112 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue112 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue44 = (((productValue113 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue113 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue45 = ((abs(comparisonValue43) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue43;
                    float comparisonValue46 = ((abs(comparisonValue44) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue44;
                    float inverseLengthValue32 = rsqrt(dot(float3(comparisonValue45, comparisonValue46, 0.25f), float3(comparisonValue45, comparisonValue46, 0.25f)));
                    branchMergedValue3 = comparisonValue45 * inverseLengthValue32;
                    branchMergedValue4 = comparisonValue46 * inverseLengthValue32;
                    branchMergedValue5 = inverseLengthValue32 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue121 = frac(float(int(uint(int(float(int(vectorValue23.x)))))) * varyingTexCoord0.x);
                    float productValue122 = frac(float(int(uint(int(float(int(vectorValue23.y)))))) * varyingTexCoord0.y);
                    float comparisonValue47 = (((productValue121 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue121 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue48 = (((productValue122 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue122 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue49 = ((abs(comparisonValue47) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue47;
                    float comparisonValue50 = ((abs(comparisonValue48) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue48;
                    float inverseLengthValue37 = rsqrt(dot(float3(comparisonValue49, comparisonValue50, 0.25f), float3(comparisonValue49, comparisonValue50, 0.25f)));
                    branchMergedValue3 = comparisonValue49 * inverseLengthValue37;
                    branchMergedValue4 = comparisonValue50 * inverseLengthValue37;
                    branchMergedValue5 = inverseLengthValue37 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    float productValue126 = frac(float(int(uint(int(float(int(vectorValue25.x)))))) * varyingTexCoord0.x);
                    float productValue127 = frac(float(int(uint(int(float(int(vectorValue25.y)))))) * varyingTexCoord0.y);
                    float comparisonValue51 = (((productValue126 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue126 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue52 = (((productValue127 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue127 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue53 = ((abs(comparisonValue51) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue51;
                    float comparisonValue54 = ((abs(comparisonValue52) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue52;
                    float inverseLengthValue39 = rsqrt(dot(float3(comparisonValue53, comparisonValue54, 0.25f), float3(comparisonValue53, comparisonValue54, 0.25f)));
                    branchMergedValue3 = comparisonValue53 * inverseLengthValue39;
                    branchMergedValue4 = comparisonValue54 * inverseLengthValue39;
                    branchMergedValue5 = inverseLengthValue39 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount584;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount584);
                float productValue8 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue9 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = frac(productValue8);
                float scalarValue3 = frac(productValue9);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount613;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount613);
                float productValue26 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue27 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue26);
                float scalarValue13 = frac(productValue27);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount591;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount591);
                float productValue41 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue42 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue14 = frac(productValue41);
                float scalarValue15 = frac(productValue42);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount620;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount620);
                float productValue51 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue52 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue16 = frac(productValue51);
                float scalarValue17 = frac(productValue52);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount607;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount607);
                float productValue60 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue61 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue18 = frac(productValue60);
                float scalarValue19 = frac(productValue61);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount636;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount636);
                float productValue67 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue68 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue20 = frac(productValue67);
                float scalarValue21 = frac(productValue68);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount610;
                uint2 vectorValue14 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount610);
                float productValue71 = float(int(uint(int(float(int(vectorValue14.x)))))) * varyingTexCoord0.x;
                float productValue72 = float(int(uint(int(float(int(vectorValue14.y)))))) * varyingTexCoord0.y;
                float scalarValue22 = frac(productValue71);
                float scalarValue23 = frac(productValue72);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount639;
                uint2 vectorValue16 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount639);
                float productValue75 = float(int(uint(int(float(int(vectorValue16.x)))))) * varyingTexCoord0.x;
                float productValue76 = float(int(uint(int(float(int(vectorValue16.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = frac(productValue75);
                float scalarValue25 = frac(productValue76);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount614;
                uint2 vectorValue18 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount614);
                float productValue85 = float(int(uint(int(float(int(vectorValue18.x)))))) * varyingTexCoord0.x;
                float productValue86 = float(int(uint(int(float(int(vectorValue18.y)))))) * varyingTexCoord0.y;
                float scalarValue27 = frac(productValue85);
                float scalarValue28 = frac(productValue86);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                uint unusedTextureMipCount640;
                uint2 vectorValue20 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount640);
                float productValue104 = float(int(uint(int(float(int(vectorValue20.x)))))) * varyingTexCoord0.x;
                float productValue105 = float(int(uint(int(float(int(vectorValue20.y)))))) * varyingTexCoord0.y;
                float scalarValue30 = frac(productValue104);
                float scalarValue31 = frac(productValue105);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                uint unusedTextureMipCount649;
                uint2 vectorValue22 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount649);
                float productValue114 = float(int(uint(int(float(int(vectorValue22.x)))))) * varyingTexCoord0.x;
                float productValue115 = float(int(uint(int(float(int(vectorValue22.y)))))) * varyingTexCoord0.y;
                float scalarValue33 = frac(productValue114);
                float scalarValue34 = frac(productValue115);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount617;
                uint2 vectorValue24 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount617);
                float productValue123 = float(int(uint(int(float(int(vectorValue24.x)))))) * varyingTexCoord0.x;
                float productValue124 = float(int(uint(int(float(int(vectorValue24.y)))))) * varyingTexCoord0.y;
                float scalarValue35 = frac(productValue123);
                float scalarValue36 = frac(productValue124);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                uint unusedTextureMipCount643;
                uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount643);
                float productValue128 = float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x;
                float productValue129 = float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y;
                float scalarValue37 = frac(productValue128);
                float scalarValue38 = frac(productValue129);
#endif
                float comparisonValue5;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue2 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue12 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue14 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue18 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue20 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue24 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue27 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue30 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                if (abs(scalarValue33 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue35 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue37 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue27 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue5 = ((scalarValue30 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                    comparisonValue5 = ((scalarValue33 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue35 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue5 = ((scalarValue37 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue3 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue13 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue25 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue28 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                if (abs(scalarValue31 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                if (abs(scalarValue34 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue36 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                if (abs(scalarValue38 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue3 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue25 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue28 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                    comparisonValue6 = ((scalarValue31 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                    comparisonValue6 = ((scalarValue34 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue36 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                    comparisonValue6 = ((scalarValue38 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue = frac(productValue8 + 0.5f);
                float sumValue1 = frac(productValue9 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue6 = frac(productValue26 + 0.5f);
                float sumValue7 = frac(productValue27 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue9 = frac(productValue41 + 0.5f);
                float sumValue10 = frac(productValue42 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue12 = frac(productValue51 + 0.5f);
                float sumValue13 = frac(productValue52 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue15 = frac(productValue60 + 0.5f);
                float sumValue16 = frac(productValue61 + 0.5f);
                bool conditionValue10 = sumValue16 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue18 = frac(productValue67 + 0.5f);
                float sumValue19 = frac(productValue68 + 0.5f);
                bool conditionValue12 = sumValue19 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue21 = frac(productValue71 + 0.5f);
                float sumValue22 = frac(productValue72 + 0.5f);
                bool conditionValue14 = sumValue22 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue24 = frac(productValue75 + 0.5f);
                float sumValue25 = frac(productValue76 + 0.5f);
                bool conditionValue16 = sumValue25 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue27 = frac(productValue85 + 0.5f);
                float sumValue28 = frac(productValue86 + 0.5f);
                bool conditionValue18 = sumValue28 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                float sumValue30 = frac(productValue104 + 0.5f);
                float sumValue31 = frac(productValue105 + 0.5f);
                bool conditionValue21 = sumValue31 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                float sumValue33 = frac(productValue114 + 0.5f);
                float sumValue34 = frac(productValue115 + 0.5f);
                bool conditionValue23 = sumValue34 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue36 = frac(productValue123 + 0.5f);
                float sumValue37 = frac(productValue124 + 0.5f);
                bool conditionValue26 = sumValue37 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                float sumValue39 = frac(productValue128 + 0.5f);
                float sumValue40 = frac(productValue129 + 0.5f);
                bool conditionValue28 = sumValue40 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                intermediateValue[0u] = conditionValue12 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue12 ? scalarValue5 : scalarValue6;
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue20 = clampedValue20 - clampedValue21;
                bool conditionValue13 = sumValue18 > 0.5f;
                intermediateValue[0u] = conditionValue13 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue13 ? scalarValue5 : scalarValue4;
                float clampedValue22 = intermediateValue[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue20 = rsqrt(dot(float3(sumValue20, clampedValue22, 0.25f), float3(sumValue20, clampedValue22, 0.25f)));
                branchMergedValue = inverseLengthValue20 * sumValue20;
                branchMergedValue1 = inverseLengthValue20 * clampedValue22;
                branchMergedValue2 = inverseLengthValue20 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                intermediateValue[0u] = conditionValue14 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue14 ? scalarValue5 : scalarValue6;
                float clampedValue23 = intermediateValue[uint(int(clamp((sumValue21 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue24 = intermediateValue[uint(int(clamp((sumValue21 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue23 = clampedValue23 - clampedValue24;
                bool conditionValue15 = sumValue21 > 0.5f;
                intermediateValue[0u] = conditionValue15 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue15 ? scalarValue5 : scalarValue4;
                float clampedValue25 = intermediateValue[uint(int(clamp((sumValue22 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue22 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue22 = rsqrt(dot(float3(sumValue23, clampedValue25, 0.25f), float3(sumValue23, clampedValue25, 0.25f)));
                branchMergedValue = inverseLengthValue22 * sumValue23;
                branchMergedValue1 = inverseLengthValue22 * clampedValue25;
                branchMergedValue2 = inverseLengthValue22 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                intermediateValue[0u] = conditionValue16 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue16 ? scalarValue5 : scalarValue6;
                float clampedValue26 = intermediateValue[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue27 = intermediateValue[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue26 = clampedValue26 - clampedValue27;
                bool conditionValue17 = sumValue24 > 0.5f;
                intermediateValue[0u] = conditionValue17 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue17 ? scalarValue5 : scalarValue4;
                float clampedValue28 = intermediateValue[uint(int(clamp((sumValue25 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue25 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue24 = rsqrt(dot(float3(sumValue26, clampedValue28, 0.25f), float3(sumValue26, clampedValue28, 0.25f)));
                branchMergedValue = inverseLengthValue24 * sumValue26;
                branchMergedValue1 = inverseLengthValue24 * clampedValue28;
                branchMergedValue2 = inverseLengthValue24 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                intermediateValue[0u] = conditionValue18 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue18 ? scalarValue5 : scalarValue6;
                float clampedValue29 = intermediateValue[uint(int(clamp((sumValue27 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue30 = intermediateValue[uint(int(clamp((sumValue27 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue29 = clampedValue29 - clampedValue30;
                bool conditionValue19 = sumValue27 > 0.5f;
                intermediateValue[0u] = conditionValue19 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue19 ? scalarValue5 : scalarValue4;
                float clampedValue31 = intermediateValue[uint(int(clamp((sumValue28 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue28 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue26 = rsqrt(dot(float3(sumValue29, clampedValue31, 0.25f), float3(sumValue29, clampedValue31, 0.25f)));
                branchMergedValue = inverseLengthValue26 * sumValue29;
                branchMergedValue1 = inverseLengthValue26 * clampedValue31;
                branchMergedValue2 = inverseLengthValue26 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
                intermediateValue[0u] = conditionValue21 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue21 ? scalarValue5 : scalarValue6;
                float clampedValue32 = intermediateValue[uint(int(clamp((sumValue30 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue33 = intermediateValue[uint(int(clamp((sumValue30 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue32 = clampedValue32 - clampedValue33;
                bool conditionValue22 = sumValue30 > 0.5f;
                intermediateValue[0u] = conditionValue22 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue22 ? scalarValue5 : scalarValue4;
                float clampedValue34 = intermediateValue[uint(int(clamp((sumValue31 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue31 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue31 = rsqrt(dot(float3(sumValue32, clampedValue34, 0.25f), float3(sumValue32, clampedValue34, 0.25f)));
                branchMergedValue = inverseLengthValue31 * sumValue32;
                branchMergedValue1 = inverseLengthValue31 * clampedValue34;
                branchMergedValue2 = inverseLengthValue31 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
                intermediateValue[0u] = conditionValue23 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue23 ? scalarValue5 : scalarValue6;
                float clampedValue35 = intermediateValue[uint(int(clamp((sumValue33 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue36 = intermediateValue[uint(int(clamp((sumValue33 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue35 = clampedValue35 - clampedValue36;
                bool conditionValue24 = sumValue33 > 0.5f;
                intermediateValue[0u] = conditionValue24 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue24 ? scalarValue5 : scalarValue4;
                float clampedValue37 = intermediateValue[uint(int(clamp((sumValue34 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue34 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue33 = rsqrt(dot(float3(sumValue35, clampedValue37, 0.25f), float3(sumValue35, clampedValue37, 0.25f)));
                branchMergedValue = inverseLengthValue33 * sumValue35;
                branchMergedValue1 = inverseLengthValue33 * clampedValue37;
                branchMergedValue2 = inverseLengthValue33 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                intermediateValue[0u] = conditionValue26 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue26 ? scalarValue5 : scalarValue6;
                float clampedValue38 = intermediateValue[uint(int(clamp((sumValue36 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue39 = intermediateValue[uint(int(clamp((sumValue36 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue38 = clampedValue38 - clampedValue39;
                bool conditionValue27 = sumValue36 > 0.5f;
                intermediateValue[0u] = conditionValue27 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue27 ? scalarValue5 : scalarValue4;
                float clampedValue40 = intermediateValue[uint(int(clamp((sumValue37 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue37 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue38 = rsqrt(dot(float3(sumValue38, clampedValue40, 0.25f), float3(sumValue38, clampedValue40, 0.25f)));
                branchMergedValue = inverseLengthValue38 * sumValue38;
                branchMergedValue1 = inverseLengthValue38 * clampedValue40;
                branchMergedValue2 = inverseLengthValue38 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY)
                intermediateValue[0u] = conditionValue28 ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue28 ? scalarValue5 : scalarValue6;
                float clampedValue41 = intermediateValue[uint(int(clamp((sumValue39 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue42 = intermediateValue[uint(int(clamp((sumValue39 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue41 = clampedValue41 - clampedValue42;
                bool conditionValue29 = sumValue39 > 0.5f;
                intermediateValue[0u] = conditionValue29 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue29 ? scalarValue5 : scalarValue4;
                float clampedValue43 = intermediateValue[uint(int(clamp((sumValue40 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue40 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue40 = rsqrt(dot(float3(sumValue41, clampedValue43, 0.25f), float3(sumValue41, clampedValue43, 0.25f)));
                branchMergedValue = inverseLengthValue40 * sumValue41;
                branchMergedValue1 = inverseLengthValue40 * clampedValue43;
                branchMergedValue2 = inverseLengthValue40 * 0.25f;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue3 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue14 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
            intermediateValue18 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue15 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
            intermediateValue19 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue10 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue10 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue10 * varyingTangent0.z));
        float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue11 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue11 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue11 * multiplyAddValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue27 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue8 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue16, inverseLengthValue27 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue16, inverseLengthValue27 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue17, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue16, inverseLengthValue27 * varyingTangent0.z));
        float inverseLengthValue28 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue8 = inverseLengthValue28 * multiplyAddValue8;
        intermediateValue9 = inverseLengthValue28 * multiplyAddValue9;
        intermediateValue10 = inverseLengthValue28 * multiplyAddValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
        float inverseLengthValue34 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue11 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue34 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue34 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue34 * varyingTangent0.z));
        float inverseLengthValue35 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue12 = inverseLengthValue35 * multiplyAddValue11;
        intermediateValue13 = inverseLengthValue35 * multiplyAddValue12;
        intermediateValue14 = inverseLengthValue35 * multiplyAddValue13;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue7 = rsqrt(dot(float3(intermediateValue7, intermediateValue8, intermediateValue9), float3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue10 = inverseLengthValue7 * intermediateValue7;
    float productValue11 = inverseLengthValue7 * intermediateValue8;
    float productValue12 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0f / ((abs(productValue11) + abs(productValue10)) + abs(productValue12));
    float productValue13 = quotientValue2 * productValue10;
    float productValue14 = quotientValue2 * productValue11;
    bool conditionValue2 = productValue12 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float inverseLengthValue12 = rsqrt(dot(float3(intermediateValue11, intermediateValue12, intermediateValue13), float3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue28 = inverseLengthValue12 * intermediateValue11;
    float productValue29 = inverseLengthValue12 * intermediateValue12;
    float productValue30 = inverseLengthValue12 * intermediateValue13;
    float quotientValue3 = 1.0f / ((abs(productValue29) + abs(productValue28)) + abs(productValue30));
    float productValue31 = quotientValue3 * productValue28;
    float productValue32 = quotientValue3 * productValue29;
    bool conditionValue5 = productValue30 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue29 = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue87 = inverseLengthValue29 * intermediateValue8;
    float productValue88 = inverseLengthValue29 * intermediateValue9;
    float productValue89 = inverseLengthValue29 * intermediateValue10;
    float quotientValue4 = 1.0f / ((abs(productValue88) + abs(productValue87)) + abs(productValue89));
    float productValue90 = quotientValue4 * productValue87;
    float productValue91 = quotientValue4 * productValue88;
    bool conditionValue20 = productValue89 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float inverseLengthValue36 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue116 = inverseLengthValue36 * intermediateValue12;
    float productValue117 = inverseLengthValue36 * intermediateValue13;
    float productValue118 = inverseLengthValue36 * intermediateValue14;
    float quotientValue5 = 1.0f / ((abs(productValue117) + abs(productValue116)) + abs(productValue118));
    float productValue119 = quotientValue5 * productValue116;
    float productValue120 = quotientValue5 * productValue117;
    bool conditionValue25 = productValue118 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue15 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue15, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue15 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue15, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue15 * productValue15) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue15, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue16 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue17 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue18 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue7 = ceil(clamp(max(max(productValue16, productValue18), max(productValue17, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((uint(clamp(intermediateValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue16 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue17 / clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue18 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue13 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue14))) : productValue13;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue13)) * ((productValue14 < 0.0f) ? (-1.0f) : 1.0f)) : productValue14;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue31 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue32))) : productValue31;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue31)) * ((productValue32 < 0.0f) ? (-1.0f) : 1.0f)) : productValue32;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue36) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue36;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue13 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue14))) : productValue13;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue13)) * ((productValue14 < 0.0f) ? (-1.0f) : 1.0f)) : productValue14;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue47) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue47;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue48) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue48;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue31 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue32))) : productValue31;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue31)) * ((productValue32 < 0.0f) ? (-1.0f) : 1.0f)) : productValue32;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue55) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue55;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue56) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue56;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue57) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue57;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue13 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue14))) : productValue13;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue13)) * ((productValue14 < 0.0f) ? (-1.0f) : 1.0f)) : productValue14;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue62) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue62;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue63) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue63;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue64) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue64;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue31 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue32))) : productValue31;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue31)) * ((productValue32 < 0.0f) ? (-1.0f) : 1.0f)) : productValue32;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue80) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue80;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue81) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue81;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue7 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue20 ? (((productValue90 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue91))) : productValue90;
    fragmentColor2.y = conditionValue20 ? ((1.0f - abs(productValue90)) * ((productValue91 < 0.0f) ? (-1.0f) : 1.0f)) : productValue91;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue99) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue99;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue100) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue100;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue101) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue101;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue31 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue32))) : productValue31;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue31)) * ((productValue32 < 0.0f) ? (-1.0f) : 1.0f)) : productValue32;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue110) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue110;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue111) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue111;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue25 ? (((productValue119 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue120))) : productValue119;
    fragmentColor2.y = conditionValue25 ? ((1.0f - abs(productValue119)) * ((productValue120 < 0.0f) ? (-1.0f) : 1.0f)) : productValue120;
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
