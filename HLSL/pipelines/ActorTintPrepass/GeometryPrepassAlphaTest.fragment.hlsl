// ActorTintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/ActorTintPrepass/FragmentBindings.hlsli"

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
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
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
  workingVector0.w = workingVector1.w + workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
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
  workingVector0.w = max(0, workingVector0.w);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
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
  workingVector0.w = workingVector0.w + workingVector1.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector1.x = max(0, workingVector1.x);
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.z = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector1.z = rsqrt(workingVector1.z);
  workingVector3.xyz = workingVector3.xyz * workingVector1.zzz;
  workingVector4.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.z = dot(-workingVector3.xyz, workingVector4.xyz);
  workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.z;
  workingVector1.w = 1 / workingVector1.w;
  workingVector1.z = saturate(workingVector1.z * workingVector1.w);
  workingVector1.w = workingVector1.z * -2 + 3;
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = workingVector1.w * workingVector1.z;
  workingVector3.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector3.xy = workingVector3.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector3.xy;
  workingVector3.xy = workingVector3.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector3.xy = floor(workingVector3.xy);
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector3.xy;
  workingVector4.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector3.xyxy;
  workingVector4.xyzw = floor(workingVector4.xyzw);
  workingVector3.zw = workingVector4.yw * workingVector4.yw;
  workingVector3.zw = float2(0.75,0.75) * workingVector3.zw;
  workingVector3.zw = workingVector4.xz * float2(0.5,0.5) + workingVector3.zw;
  workingVector3.zw = frac(workingVector3.zw);
  workingVector1.w = workingVector3.z * 0.25 + workingVector3.w;
  workingVector3.xy = floor(workingVector3.xy);
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.y = 0.75 * workingVector3.y;
  workingVector3.x = workingVector3.x * 0.5 + workingVector3.y;
  workingVector3.x = frac(workingVector3.x);
  workingVector1.w = workingVector1.w * 0.25 + workingVector3.x;
  workingVector1.w = workingVector1.w * 64 + 0.5;
  workingVector1.w = 0.015625 * workingVector1.w;
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.w >= workingVector1.z);
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  workingVector1.x = workingVector2.w + workingVector1.x;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.xyz + workingVector0.xyz;
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
  workingVector2.x = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector2.x = max(0, workingVector2.x);
  workingVector2.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector2.z = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector2.z = rsqrt(workingVector2.z);
  workingVector3.xyz = workingVector3.xyz * workingVector2.zzz;
  workingVector4.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector2.z = dot(-workingVector3.xyz, workingVector4.xyz);
  workingVector2.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector2.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector2.z;
  workingVector2.w = 1 / workingVector2.w;
  workingVector2.z = saturate(workingVector2.z * workingVector2.w);
  workingVector2.w = workingVector2.z * -2 + 3;
  workingVector2.z = workingVector2.z * workingVector2.z;
  workingVector2.z = workingVector2.w * workingVector2.z;
  workingVector3.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector3.xy = workingVector3.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector3.xy;
  workingVector3.xy = workingVector3.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector3.xy = floor(workingVector3.xy);
  workingVector3.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector3.xy;
  workingVector4.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector3.xyxy;
  workingVector4.xyzw = floor(workingVector4.xyzw);
  workingVector3.zw = workingVector4.yw * workingVector4.yw;
  workingVector3.zw = float2(0.75,0.75) * workingVector3.zw;
  workingVector3.zw = workingVector4.xz * float2(0.5,0.5) + workingVector3.zw;
  workingVector3.zw = frac(workingVector3.zw);
  workingVector2.w = workingVector3.z * 0.25 + workingVector3.w;
  workingVector3.xy = floor(workingVector3.xy);
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.y = 0.75 * workingVector3.y;
  workingVector3.x = workingVector3.x * 0.5 + workingVector3.y;
  workingVector3.x = frac(workingVector3.x);
  workingVector2.w = workingVector2.w * 0.25 + workingVector3.x;
  workingVector2.w = workingVector2.w * 64 + 0.5;
  workingVector2.w = 0.015625 * workingVector2.w;
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.w >= workingVector2.z);
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.x = workingVector2.x + workingVector1.w;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = (int)workingVector2.x | (int)workingVector2.y;
  if (workingVector2.x != 0) discard;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.z = max(0, workingVector0.z);
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector2.xyz = workingVector2.xyz * workingVector2.www;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector2.x = dot(-workingVector2.xyz, workingVector3.xyz);
  workingVector2.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector2.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector2.x;
  workingVector2.y = 1 / workingVector2.y;
  workingVector2.x = saturate(workingVector2.x * workingVector2.y);
  workingVector2.y = workingVector2.x * -2 + 3;
  workingVector2.x = workingVector2.x * workingVector2.x;
  workingVector2.x = workingVector2.y * workingVector2.x;
  workingVector2.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector2.yz = workingVector2.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.yz;
  workingVector2.yz = workingVector2.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.yz = floor(workingVector2.yz);
  workingVector2.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.yz;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.yzyz;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector2.w = workingVector3.x * 0.25 + workingVector3.y;
  workingVector2.yz = floor(workingVector2.yz);
  workingVector2.z = workingVector2.z * workingVector2.z;
  workingVector2.z = 0.75 * workingVector2.z;
  workingVector2.y = workingVector2.y * 0.5 + workingVector2.z;
  workingVector2.y = frac(workingVector2.y);
  workingVector2.y = workingVector2.w * 0.25 + workingVector2.y;
  workingVector2.y = workingVector2.y * 64 + 0.5;
  workingVector2.y = 0.015625 * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.y >= workingVector2.x);
  workingVector0.w = workingVector0.w ? workingVector2.x : 0;
  workingVector0.z = workingVector1.w + workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector2.x = 1 + -workingVector1.w;
  workingVector0.w = workingVector2.x * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyw;
  workingVector0.z = max(0, workingVector0.z);
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector2.xyz = workingVector2.xyz * workingVector2.www;
  workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector2.x = dot(-workingVector2.xyz, workingVector3.xyz);
  workingVector2.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector2.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector2.x;
  workingVector2.y = 1 / workingVector2.y;
  workingVector2.x = saturate(workingVector2.x * workingVector2.y);
  workingVector2.y = workingVector2.x * -2 + 3;
  workingVector2.x = workingVector2.x * workingVector2.x;
  workingVector2.x = workingVector2.y * workingVector2.x;
  workingVector2.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector2.yz = workingVector2.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.yz;
  workingVector2.yz = workingVector2.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector2.yz = floor(workingVector2.yz);
  workingVector2.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector2.yz;
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector2.yzyz;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector2.w = workingVector3.x * 0.25 + workingVector3.y;
  workingVector2.yz = floor(workingVector2.yz);
  workingVector2.z = workingVector2.z * workingVector2.z;
  workingVector2.z = 0.75 * workingVector2.z;
  workingVector2.y = workingVector2.y * 0.5 + workingVector2.z;
  workingVector2.y = frac(workingVector2.y);
  workingVector2.y = workingVector2.w * 0.25 + workingVector2.y;
  workingVector2.y = workingVector2.y * 64 + 0.5;
  workingVector2.y = 0.015625 * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.y >= workingVector2.x);
  workingVector0.w = workingVector0.w ? workingVector2.x : 0;
  workingVector0.z = workingVector0.z + workingVector1.w;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector0.w = abs(workingVector1.x) + abs(workingVector1.y);
  workingVector0.w = workingVector0.w + abs(workingVector1.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector1.xy = workingVector1.xy * workingVector0.ww;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector1.yx);
  workingVector2.xy = RD_COMPARISON_MASK(workingVector1.xy >= float2(0,0));
  workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
  workingVector2.xy = workingVector2.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.ww ? workingVector1.zw : workingVector1.xy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector1.xy = workingVector1.xy / workingVector1.zz;
  workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector0.yyy;
  workingVector0.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector0.xxx + workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector0.zzz + workingVector0.xyw;
  workingVector0.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector1.xy + -workingVector0.xy;
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
  fragmentColor0.x = 4.55590157e-041;
  fragmentColor1.w = 0.498039216;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue24 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue25 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue24) + productValue;
    float productValue26 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue24) + productValue1;
    float productValue27 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue24) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue38 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue39 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue40 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue5 = ceil(productValue1);
    float productValue41 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue38) * scalarValue5) + productValue38;
    float productValue42 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue39) * scalarValue5) + productValue39;
    float productValue43 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue40) * scalarValue5) + productValue40;
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue17 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue18 = (productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue19 = (productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue20 = (productValue17 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue17 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue18 = (productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue19 = (productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue20 = (productValue17 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
    float productValue31 = (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue32 = (((productValue18 * RD_UNIFORM_CHANGE_COLOR.x) - productValue18) * productValue31) + productValue18;
    float productValue33 = (((productValue19 * RD_UNIFORM_CHANGE_COLOR.y) - productValue19) * productValue31) + productValue19;
    float productValue34 = (((productValue20 * RD_UNIFORM_CHANGE_COLOR.z) - productValue20) * productValue31) + productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue17 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue18 = (productValue17 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue19 = (productValue17 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue47 = productValue18 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue48 = productValue18 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue49 = productValue18 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue6 = ceil(productValue19);
    float productValue50 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue47) * scalarValue6) + productValue47;
    float productValue51 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue48) * scalarValue6) + productValue48;
    float productValue52 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue49) * scalarValue6) + productValue49;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((scalarValue + max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w)) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((scalarValue + max(0.0f, (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue)) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((scalarValue + max(0.0f, productValue24 * RD_UNIFORM_CHANGE_COLOR.w)) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((max(0.0f, productValue31 * RD_UNIFORM_CHANGE_COLOR.w) + scalarValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if (comparisonValue || ((max(0.0f, (productValue17 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue) + scalarValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue5 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue);
    float productValue6 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1);
    float productValue7 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue21 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue18) * scalarValue) + productValue18);
    float productValue22 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue19) * scalarValue) + productValue19);
    float productValue23 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue20) * scalarValue) + productValue20);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue28 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue25) * scalarValue) + productValue25);
    float productValue29 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue26) * scalarValue) + productValue26);
    float productValue30 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue27) * scalarValue) + productValue27);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue35 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue32) * scalarValue) + productValue32);
    float productValue36 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue33) * scalarValue) + productValue33);
    float productValue37 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue34) * scalarValue) + productValue34);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue44 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.x * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue41) * scalarValue) + productValue41);
    float productValue45 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.y * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue42) * scalarValue) + productValue42);
    float productValue46 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.z * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue43) * scalarValue) + productValue43);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue53 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue50) * scalarValue) + productValue50);
    float productValue54 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue51) * scalarValue) + productValue51);
    float productValue55 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue52) * scalarValue) + productValue52);
#endif
    float sumValue = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue1 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue2 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue1 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0f / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue13 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue13, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue13 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue13, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue13 * productValue13) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue13, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue14 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue15 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue16 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue4 = ceil(clamp(max(max(productValue14, productValue16), max(productValue15, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(clamp(productValue14 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue15 / clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue16 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue6) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue6;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue7) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue36) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue36;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue44) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue44;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue54) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue54;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue55) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue55;
#endif
    fragmentColor1.w = 0.4980392158031463623046875f;
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue11)) * ((productValue12 < 0.0f) ? (-1.0f) : 1.0f)) : productValue12;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue2, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue1, sumValue * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
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
