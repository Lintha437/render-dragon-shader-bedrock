// ActorMultiTexturePrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_FEATURE_COLOR_SECOND_TEXTURE
#define RD_FEATURE_COLOR_SECOND_TEXTURE RD_OFF
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
#define RD_BINDING_LAYOUT 18
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorMultiTexturePrepass/FragmentBindings.hlsli"

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
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector1.w);
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector3.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector3.xyz = workingVector3.xyz * workingVector3.www;
  workingVector4.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector3.x = dot(-workingVector3.xyz, workingVector4.xyz);
  workingVector3.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector3.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector3.x;
  workingVector3.y = 1 / workingVector3.y;
  workingVector3.x = saturate(workingVector3.x * workingVector3.y);
  workingVector3.y = workingVector3.x * -2 + 3;
  workingVector3.x = workingVector3.x * workingVector3.x;
  workingVector3.x = workingVector3.y * workingVector3.x;
  workingVector3.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector3.yz = workingVector3.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector3.yz;
  workingVector3.yz = workingVector3.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector3.yz = floor(workingVector3.yz);
  workingVector3.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector3.yz;
  workingVector4.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector3.yzyz;
  workingVector4.xyzw = floor(workingVector4.xyzw);
  workingVector4.yw = workingVector4.yw * workingVector4.yw;
  workingVector4.yw = float2(0.75,0.75) * workingVector4.yw;
  workingVector4.xy = workingVector4.xz * float2(0.5,0.5) + workingVector4.yw;
  workingVector4.xy = frac(workingVector4.xy);
  workingVector3.w = workingVector4.x * 0.25 + workingVector4.y;
  workingVector3.yz = floor(workingVector3.yz);
  workingVector3.z = workingVector3.z * workingVector3.z;
  workingVector3.z = 0.75 * workingVector3.z;
  workingVector3.y = workingVector3.y * 0.5 + workingVector3.z;
  workingVector3.y = frac(workingVector3.y);
  workingVector3.y = workingVector3.w * 0.25 + workingVector3.y;
  workingVector3.y = workingVector3.y * 64 + 0.5;
  workingVector3.y = 0.015625 * workingVector3.y;
  workingVector3.x = RD_COMPARISON_MASK(workingVector3.y >= workingVector3.x);
  workingVector1.w = workingVector1.w ? workingVector3.x : 0;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector3.x = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = workingVector0.w ? workingVector3.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.w;
  if (workingVector0.w != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
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
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = workingVector0.w ? workingVector2.y : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector1.w);
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector3.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector3.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector3.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector3.w = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector3.xyz = workingVector3.xyz * workingVector3.www;
  workingVector4.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector3.x = dot(-workingVector3.xyz, workingVector4.xyz);
  workingVector3.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector3.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector3.x;
  workingVector3.y = 1 / workingVector3.y;
  workingVector3.x = saturate(workingVector3.x * workingVector3.y);
  workingVector3.y = workingVector3.x * -2 + 3;
  workingVector3.x = workingVector3.x * workingVector3.x;
  workingVector3.x = workingVector3.y * workingVector3.x;
  workingVector3.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector3.yz = workingVector3.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector3.yz;
  workingVector3.yz = workingVector3.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector3.yz = floor(workingVector3.yz);
  workingVector3.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector3.yz;
  workingVector4.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector3.yzyz;
  workingVector4.xyzw = floor(workingVector4.xyzw);
  workingVector4.yw = workingVector4.yw * workingVector4.yw;
  workingVector4.yw = float2(0.75,0.75) * workingVector4.yw;
  workingVector4.xy = workingVector4.xz * float2(0.5,0.5) + workingVector4.yw;
  workingVector4.xy = frac(workingVector4.xy);
  workingVector3.w = workingVector4.x * 0.25 + workingVector4.y;
  workingVector3.yz = floor(workingVector3.yz);
  workingVector3.z = workingVector3.z * workingVector3.z;
  workingVector3.z = 0.75 * workingVector3.z;
  workingVector3.y = workingVector3.y * 0.5 + workingVector3.z;
  workingVector3.y = frac(workingVector3.y);
  workingVector3.y = workingVector3.w * 0.25 + workingVector3.y;
  workingVector3.y = workingVector3.y * 64 + 0.5;
  workingVector3.y = 0.015625 * workingVector3.y;
  workingVector3.x = RD_COMPARISON_MASK(workingVector3.y >= workingVector3.x);
  workingVector1.w = workingVector1.w ? workingVector3.x : 0;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector3.x = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = workingVector0.w ? workingVector3.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.w;
  if (workingVector0.w != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
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
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = workingVector0.w ? workingVector2.y : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < 0.5);
  workingVector1.z = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < 0.5);
  workingVector2.z = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.z ? workingVector2.x : 0;
  workingVector2.x = (int)workingVector2.x | (int)workingVector2.y;
  if (workingVector2.x != 0) discard;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.x < 0.5);
  workingVector1.z = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.x = workingVector1.z ? workingVector1.x : 0;
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.y;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < 0.5);
  workingVector2.z = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.z ? workingVector2.x : 0;
  workingVector2.x = (int)workingVector2.x | (int)workingVector2.y;
  if (workingVector2.x != 0) discard;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
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
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.x = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = workingVector0.z ? workingVector2.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
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
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.x = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = workingVector0.z ? workingVector2.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
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
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.x = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = workingVector0.z ? workingVector2.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
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
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.x = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.z = workingVector0.z ? workingVector2.x : 0;
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
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
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue71 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue72 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue71) + productValue;
    float productValue73 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue71) + productValue1;
    float productValue74 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue71) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue116 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue117 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue118 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue30 = ceil(productValue1);
    float productValue119 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue116) * scalarValue30) + productValue116;
    float productValue120 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue117) * scalarValue30) + productValue117;
    float productValue121 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue118) * scalarValue30) + productValue118;
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue10 = sampledTextureValue1.x;
    float scalarValue11 = sampledTextureValue1.y;
    float scalarValue12 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue12 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue13 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
    float productValue14 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue34 = productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10);
    float productValue35 = productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11);
    float productValue36 = productValue33 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue12);
    float productValue37 = (productValue34 + scalarValue10) - (productValue34 * scalarValue);
    float productValue38 = (productValue35 + scalarValue11) - (productValue35 * scalarValue);
    float productValue39 = (productValue36 + scalarValue12) - (productValue36 * scalarValue);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue34 = productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10);
    float productValue35 = productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11);
    float productValue36 = productValue33 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue12);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue75 = ((sampledTextureValue1.x - productValue72) * scalarValue) + productValue72;
    float productValue76 = ((sampledTextureValue1.y - productValue73) * scalarValue) + productValue73;
    float productValue77 = ((sampledTextureValue1.z - productValue74) * scalarValue) + productValue74;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue85 = (productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10)) + scalarValue10;
    float productValue86 = (productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11)) + scalarValue11;
    float productValue87 = (productValue33 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue12)) + scalarValue12;
    float productValue88 = (productValue33 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue89 = (((productValue85 * RD_UNIFORM_CHANGE_COLOR.x) - productValue85) * productValue88) + productValue85;
    float productValue90 = (((productValue86 * RD_UNIFORM_CHANGE_COLOR.y) - productValue86) * productValue88) + productValue86;
    float productValue91 = (((productValue87 * RD_UNIFORM_CHANGE_COLOR.z) - productValue87) * productValue88) + productValue87;
    float productValue92 = ((scalarValue10 - productValue89) * scalarValue) + productValue89;
    float productValue93 = ((scalarValue11 - productValue90) * scalarValue) + productValue90;
    float productValue94 = ((scalarValue12 - productValue91) * scalarValue) + productValue91;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue85 = (productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10)) + scalarValue10;
    float productValue86 = (productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11)) + scalarValue11;
    float productValue87 = (productValue33 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue12)) + scalarValue12;
    float productValue88 = (productValue33 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue89 = (((productValue85 * RD_UNIFORM_CHANGE_COLOR.x) - productValue85) * productValue88) + productValue85;
    float productValue90 = (((productValue86 * RD_UNIFORM_CHANGE_COLOR.y) - productValue86) * productValue88) + productValue86;
    float productValue91 = (((productValue87 * RD_UNIFORM_CHANGE_COLOR.z) - productValue87) * productValue88) + productValue87;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue122 = ((sampledTextureValue1.x - productValue119) * scalarValue) + productValue119;
    float productValue123 = ((sampledTextureValue1.y - productValue120) * scalarValue) + productValue120;
    float productValue124 = ((sampledTextureValue1.z - productValue121) * scalarValue) + productValue121;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue85 = (productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10)) + scalarValue10;
    float productValue86 = (productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11)) + scalarValue11;
    float productValue137 = productValue85 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue138 = productValue85 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue139 = productValue85 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue33 = ceil(productValue86);
    float productValue140 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue137) * scalarValue33) + productValue137;
    float productValue141 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue138) * scalarValue33) + productValue138;
    float productValue142 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue139) * scalarValue33) + productValue139;
    float productValue143 = ((scalarValue10 - productValue140) * scalarValue) + productValue140;
    float productValue144 = ((scalarValue11 - productValue141) * scalarValue) + productValue141;
    float productValue145 = ((scalarValue12 - productValue142) * scalarValue) + productValue142;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue33 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0f - scalarValue)) > 0.0f);
    float productValue85 = (productValue33 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue10)) + scalarValue10;
    float productValue86 = (productValue33 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue11)) + scalarValue11;
    float productValue137 = productValue85 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue138 = productValue85 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue139 = productValue85 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue33 = ceil(productValue86);
    float productValue140 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue137) * scalarValue33) + productValue137;
    float productValue141 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue138) * scalarValue33) + productValue138;
    float productValue142 = (((productValue86 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue139) * scalarValue33) + productValue139;
#endif
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON
    float scalarValue15 = sampledTextureValue2.x;
    float scalarValue16 = sampledTextureValue2.y;
    float scalarValue17 = sampledTextureValue2.z;
#endif
    float scalarValue1 = sampledTextureValue2.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue15 = (((sampledTextureValue2.x - productValue12) * scalarValue1) + productValue12) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue16 = (((sampledTextureValue2.y - productValue13) * scalarValue1) + productValue13) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue17 = (((sampledTextureValue2.z - productValue14) * scalarValue1) + productValue14) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue40 = (((sampledTextureValue2.x - productValue37) * scalarValue1) + productValue37) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue41 = (((sampledTextureValue2.y - productValue38) * scalarValue1) + productValue38) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue42 = (((sampledTextureValue2.z - productValue39) * scalarValue1) + productValue39) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue3;
    float productValue4;
    float productValue5;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue3 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue15) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue16) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue17) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue3 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
        productValue4 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
        productValue5 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    }
    float productValue52 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue3;
    float productValue53 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue4;
    float productValue54 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue15) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue16) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue6 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue17) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue4 = (productValue34 + scalarValue10) - (productValue34 * scalarValue);
        productValue5 = (productValue35 + scalarValue11) - (productValue35 * scalarValue);
        productValue6 = (productValue36 + scalarValue12) - (productValue36 * scalarValue);
    }
    float productValue59 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue4;
    float productValue60 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue5;
    float productValue61 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue6;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue78 = (((sampledTextureValue2.x - productValue75) * scalarValue1) + productValue75) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue79 = (((sampledTextureValue2.y - productValue76) * scalarValue1) + productValue76) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue80 = (((sampledTextureValue2.z - productValue77) * scalarValue1) + productValue77) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue95 = (((sampledTextureValue2.x - productValue92) * scalarValue1) + productValue92) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue96 = (((sampledTextureValue2.y - productValue93) * scalarValue1) + productValue93) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue97 = (((sampledTextureValue2.z - productValue94) * scalarValue1) + productValue94) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue7;
    float productValue8;
    float productValue9;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue7 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue8 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue9 = (((scalarValue17 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue7 = ((sampledTextureValue1.x - productValue72) * scalarValue) + productValue72;
        productValue8 = ((sampledTextureValue1.y - productValue73) * scalarValue) + productValue73;
        productValue9 = ((sampledTextureValue1.z - productValue74) * scalarValue) + productValue74;
    }
    float productValue102 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue7;
    float productValue103 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue8;
    float productValue104 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue9;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue9 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue10 = (((scalarValue17 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue8 = ((scalarValue10 - productValue89) * scalarValue) + productValue89;
        productValue9 = ((scalarValue11 - productValue90) * scalarValue) + productValue90;
        productValue10 = ((scalarValue12 - productValue91) * scalarValue) + productValue91;
    }
    float productValue109 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue110 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue111 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue125 = (((sampledTextureValue2.x - productValue122) * scalarValue1) + productValue122) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue126 = (((sampledTextureValue2.y - productValue123) * scalarValue1) + productValue123) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue127 = (((sampledTextureValue2.z - productValue124) * scalarValue1) + productValue124) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue146 = (((sampledTextureValue2.x - productValue143) * scalarValue1) + productValue143) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue147 = (((sampledTextureValue2.y - productValue144) * scalarValue1) + productValue144) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue148 = (((sampledTextureValue2.z - productValue145) * scalarValue1) + productValue145) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue9 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue10 = (((scalarValue17 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue119) * scalarValue) + productValue119;
        productValue9 = ((sampledTextureValue1.y - productValue120) * scalarValue) + productValue120;
        productValue10 = ((sampledTextureValue1.z - productValue121) * scalarValue) + productValue121;
    }
    float productValue109 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue110 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue111 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue9 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue10 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue16) * scalarValue1) + scalarValue16;
        productValue11 = (((scalarValue17 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue17) * scalarValue1) + scalarValue17;
    }
    else
    {
        productValue9 = ((scalarValue10 - productValue140) * scalarValue) + productValue140;
        productValue10 = ((scalarValue11 - productValue141) * scalarValue) + productValue141;
        productValue11 = ((scalarValue12 - productValue142) * scalarValue) + productValue142;
    }
    float productValue162 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue9;
    float productValue163 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue10;
    float productValue164 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue11;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue18 = floor(quotientValue1 * 0.25f);
        float productValue19 = floor(quotientValue1 * 0.5f);
        float scalarValue2 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue19 * productValue19) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue18 * productValue18) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue2 * scalarValue2) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((max(0.0f, (productValue33 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((max(0.0f, (productValue33 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((max(0.0f, productValue71 * RD_UNIFORM_CHANGE_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((max(0.0f, productValue88 * RD_UNIFORM_CHANGE_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (((max(0.0f, productValue71 * RD_UNIFORM_CHANGE_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (((max(0.0f, productValue88 * RD_UNIFORM_CHANGE_COLOR.w) < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
    uint scalarValue3 = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
#endif
    if ((scalarValue3 & 1u) == 0u)
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue5 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue8 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue11 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue6 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue9 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue12 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue15 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue11 = sampledTextureValue3.x;
        intermediateValue12 = sampledTextureValue3.y;
        intermediateValue13 = sampledTextureValue3.z;
        intermediateValue14 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue6 = sampledTextureValue3.x;
        intermediateValue7 = sampledTextureValue3.y;
        intermediateValue8 = sampledTextureValue3.z;
        intermediateValue9 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue9 = sampledTextureValue3.x;
        intermediateValue10 = sampledTextureValue3.y;
        intermediateValue11 = sampledTextureValue3.z;
        intermediateValue12 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue12 = sampledTextureValue3.x;
        intermediateValue13 = sampledTextureValue3.y;
        intermediateValue14 = sampledTextureValue3.z;
        intermediateValue15 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
#endif
    if ((scalarValue3 & 28u) == 0u)
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue10 = varyingNormal0.x;
        intermediateValue11 = varyingNormal0.y;
        intermediateValue12 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue13 = varyingNormal0.x;
        intermediateValue14 = varyingNormal0.y;
        intermediateValue15 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue16 = varyingNormal0.x;
        intermediateValue17 = varyingNormal0.y;
        intermediateValue18 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue22;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
#endif
        if ((scalarValue3 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue3 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue3 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount679;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount679);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount694;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount694);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount693;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount693);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount708;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount708);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount700;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount700);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount718;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount718);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount707;
                    uint2 vectorValue13 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount707);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount725;
                    uint2 vectorValue15 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount725);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount705;
                    uint2 vectorValue17 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount705);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount720;
                    uint2 vectorValue19 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount720);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount712;
                    uint2 vectorValue21 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount712);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount727;
                    uint2 vectorValue23 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount727);
#endif
                    float4 sampledTextureValue4 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue20 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue21 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue20 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue20 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue2 = (((productValue21 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue21 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, 0.25f), float3(comparisonValue3, comparisonValue4, 0.25f)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue43 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue44 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue7 = (((productValue43 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue43 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue8 = (((productValue44 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue44 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float comparisonValue10 = ((abs(comparisonValue8) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue8;
                    float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue9, comparisonValue10, 0.25f), float3(comparisonValue9, comparisonValue10, 0.25f)));
                    branchMergedValue3 = comparisonValue9 * inverseLengthValue8;
                    branchMergedValue4 = comparisonValue10 * inverseLengthValue8;
                    branchMergedValue5 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue55 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue56 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue11 = (((productValue55 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue55 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue12 = (((productValue56 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue56 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float comparisonValue14 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                    float inverseLengthValue13 = rsqrt(dot(float3(comparisonValue13, comparisonValue14, 0.25f), float3(comparisonValue13, comparisonValue14, 0.25f)));
                    branchMergedValue3 = comparisonValue13 * inverseLengthValue13;
                    branchMergedValue4 = comparisonValue14 * inverseLengthValue13;
                    branchMergedValue5 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue62 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue63 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue15 = (((productValue62 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue62 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue16 = (((productValue63 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue63 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float comparisonValue18 = ((abs(comparisonValue16) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue16;
                    float inverseLengthValue15 = rsqrt(dot(float3(comparisonValue17, comparisonValue18, 0.25f), float3(comparisonValue17, comparisonValue18, 0.25f)));
                    branchMergedValue3 = comparisonValue17 * inverseLengthValue15;
                    branchMergedValue4 = comparisonValue18 * inverseLengthValue15;
                    branchMergedValue5 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue81 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue82 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue19 = (((productValue81 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue81 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue20 = (((productValue82 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue82 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float comparisonValue22 = ((abs(comparisonValue20) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue20;
                    float inverseLengthValue20 = rsqrt(dot(float3(comparisonValue21, comparisonValue22, 0.25f), float3(comparisonValue21, comparisonValue22, 0.25f)));
                    branchMergedValue3 = comparisonValue21 * inverseLengthValue20;
                    branchMergedValue4 = comparisonValue22 * inverseLengthValue20;
                    branchMergedValue5 = inverseLengthValue20 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue98 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue99 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue23 = (((productValue98 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue98 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue24 = (((productValue99 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue99 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float comparisonValue26 = ((abs(comparisonValue24) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue24;
                    float inverseLengthValue22 = rsqrt(dot(float3(comparisonValue25, comparisonValue26, 0.25f), float3(comparisonValue25, comparisonValue26, 0.25f)));
                    branchMergedValue3 = comparisonValue25 * inverseLengthValue22;
                    branchMergedValue4 = comparisonValue26 * inverseLengthValue22;
                    branchMergedValue5 = inverseLengthValue22 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue105 = frac(float(int(uint(int(float(int(vectorValue13.x)))))) * varyingTexCoord0.x);
                    float productValue106 = frac(float(int(uint(int(float(int(vectorValue13.y)))))) * varyingTexCoord0.y);
                    float comparisonValue27 = (((productValue105 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue105 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue28 = (((productValue106 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue106 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue29 = ((abs(comparisonValue27) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue27;
                    float comparisonValue30 = ((abs(comparisonValue28) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue28;
                    float inverseLengthValue24 = rsqrt(dot(float3(comparisonValue29, comparisonValue30, 0.25f), float3(comparisonValue29, comparisonValue30, 0.25f)));
                    branchMergedValue3 = comparisonValue29 * inverseLengthValue24;
                    branchMergedValue4 = comparisonValue30 * inverseLengthValue24;
                    branchMergedValue5 = inverseLengthValue24 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue112 = frac(float(int(uint(int(float(int(vectorValue15.x)))))) * varyingTexCoord0.x);
                    float productValue113 = frac(float(int(uint(int(float(int(vectorValue15.y)))))) * varyingTexCoord0.y);
                    float comparisonValue31 = (((productValue112 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue112 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue32 = (((productValue113 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue113 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue33 = ((abs(comparisonValue31) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue31;
                    float comparisonValue34 = ((abs(comparisonValue32) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue32;
                    float inverseLengthValue26 = rsqrt(dot(float3(comparisonValue33, comparisonValue34, 0.25f), float3(comparisonValue33, comparisonValue34, 0.25f)));
                    branchMergedValue3 = comparisonValue33 * inverseLengthValue26;
                    branchMergedValue4 = comparisonValue34 * inverseLengthValue26;
                    branchMergedValue5 = inverseLengthValue26 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue128 = frac(float(int(uint(int(float(int(vectorValue17.x)))))) * varyingTexCoord0.x);
                    float productValue129 = frac(float(int(uint(int(float(int(vectorValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue35 = (((productValue128 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue128 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue36 = (((productValue129 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue129 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue35;
                    float comparisonValue38 = ((abs(comparisonValue36) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue36;
                    float inverseLengthValue28 = rsqrt(dot(float3(comparisonValue37, comparisonValue38, 0.25f), float3(comparisonValue37, comparisonValue38, 0.25f)));
                    branchMergedValue3 = comparisonValue37 * inverseLengthValue28;
                    branchMergedValue4 = comparisonValue38 * inverseLengthValue28;
                    branchMergedValue5 = inverseLengthValue28 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue149 = frac(float(int(uint(int(float(int(vectorValue19.x)))))) * varyingTexCoord0.x);
                    float productValue150 = frac(float(int(uint(int(float(int(vectorValue19.y)))))) * varyingTexCoord0.y);
                    float comparisonValue39 = (((productValue149 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue149 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue40 = (((productValue150 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue150 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue41 = ((abs(comparisonValue39) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue39;
                    float comparisonValue42 = ((abs(comparisonValue40) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue40;
                    float inverseLengthValue33 = rsqrt(dot(float3(comparisonValue41, comparisonValue42, 0.25f), float3(comparisonValue41, comparisonValue42, 0.25f)));
                    branchMergedValue3 = comparisonValue41 * inverseLengthValue33;
                    branchMergedValue4 = comparisonValue42 * inverseLengthValue33;
                    branchMergedValue5 = inverseLengthValue33 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue158 = frac(float(int(uint(int(float(int(vectorValue21.x)))))) * varyingTexCoord0.x);
                    float productValue159 = frac(float(int(uint(int(float(int(vectorValue21.y)))))) * varyingTexCoord0.y);
                    float comparisonValue43 = (((productValue158 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue158 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue44 = (((productValue159 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue159 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue45 = ((abs(comparisonValue43) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue43;
                    float comparisonValue46 = ((abs(comparisonValue44) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue44;
                    float inverseLengthValue38 = rsqrt(dot(float3(comparisonValue45, comparisonValue46, 0.25f), float3(comparisonValue45, comparisonValue46, 0.25f)));
                    branchMergedValue3 = comparisonValue45 * inverseLengthValue38;
                    branchMergedValue4 = comparisonValue46 * inverseLengthValue38;
                    branchMergedValue5 = inverseLengthValue38 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue165 = frac(float(int(uint(int(float(int(vectorValue23.x)))))) * varyingTexCoord0.x);
                    float productValue166 = frac(float(int(uint(int(float(int(vectorValue23.y)))))) * varyingTexCoord0.y);
                    float comparisonValue47 = (((productValue165 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue165 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue48 = (((productValue166 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue166 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue49 = ((abs(comparisonValue47) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue47;
                    float comparisonValue50 = ((abs(comparisonValue48) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue48;
                    float inverseLengthValue40 = rsqrt(dot(float3(comparisonValue49, comparisonValue50, 0.25f), float3(comparisonValue49, comparisonValue50, 0.25f)));
                    branchMergedValue3 = comparisonValue49 * inverseLengthValue40;
                    branchMergedValue4 = comparisonValue50 * inverseLengthValue40;
                    branchMergedValue5 = inverseLengthValue40 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount620;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount620);
                float productValue22 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue23 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = frac(productValue22);
                float scalarValue5 = frac(productValue23);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount635;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount635);
                float productValue45 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue46 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue13 = frac(productValue45);
                float scalarValue14 = frac(productValue46);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount634;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount634);
                float productValue57 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue58 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue18 = frac(productValue57);
                float scalarValue19 = frac(productValue58);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount649;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount649);
                float productValue64 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue65 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue20 = frac(productValue64);
                float scalarValue21 = frac(productValue65);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount641;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount641);
                float productValue83 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue84 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue22 = frac(productValue83);
                float scalarValue23 = frac(productValue84);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount659;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount659);
                float productValue100 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue101 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue24 = frac(productValue100);
                float scalarValue25 = frac(productValue101);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount648;
                uint2 vectorValue14 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount648);
                float productValue107 = float(int(uint(int(float(int(vectorValue14.x)))))) * varyingTexCoord0.x;
                float productValue108 = float(int(uint(int(float(int(vectorValue14.y)))))) * varyingTexCoord0.y;
                float scalarValue26 = frac(productValue107);
                float scalarValue27 = frac(productValue108);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount666;
                uint2 vectorValue16 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount666);
                float productValue114 = float(int(uint(int(float(int(vectorValue16.x)))))) * varyingTexCoord0.x;
                float productValue115 = float(int(uint(int(float(int(vectorValue16.y)))))) * varyingTexCoord0.y;
                float scalarValue28 = frac(productValue114);
                float scalarValue29 = frac(productValue115);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount646;
                uint2 vectorValue18 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount646);
                float productValue130 = float(int(uint(int(float(int(vectorValue18.x)))))) * varyingTexCoord0.x;
                float productValue131 = float(int(uint(int(float(int(vectorValue18.y)))))) * varyingTexCoord0.y;
                float scalarValue31 = frac(productValue130);
                float scalarValue32 = frac(productValue131);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount661;
                uint2 vectorValue20 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount661);
                float productValue151 = float(int(uint(int(float(int(vectorValue20.x)))))) * varyingTexCoord0.x;
                float productValue152 = float(int(uint(int(float(int(vectorValue20.y)))))) * varyingTexCoord0.y;
                float scalarValue34 = frac(productValue151);
                float scalarValue35 = frac(productValue152);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount653;
                uint2 vectorValue22 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount653);
                float productValue160 = float(int(uint(int(float(int(vectorValue22.x)))))) * varyingTexCoord0.x;
                float productValue161 = float(int(uint(int(float(int(vectorValue22.y)))))) * varyingTexCoord0.y;
                float scalarValue36 = frac(productValue160);
                float scalarValue37 = frac(productValue161);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount668;
                uint2 vectorValue24 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount668);
                float productValue167 = float(int(uint(int(float(int(vectorValue24.x)))))) * varyingTexCoord0.x;
                float productValue168 = float(int(uint(int(float(int(vectorValue24.y)))))) * varyingTexCoord0.y;
                float scalarValue38 = frac(productValue167);
                float scalarValue39 = frac(productValue168);
#endif
                float comparisonValue5;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue4 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue13 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue18 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue20 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue24 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue26 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue28 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue31 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue34 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue36 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue38 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue4 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue26 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue28 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue31 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue34 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue36 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue38 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue5 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue14 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue25 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue27 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue29 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue32 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue35 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue37 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue39 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue5 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue6 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue25 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue27 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue6 = ((scalarValue29 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue32 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue35 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue37 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue6 = ((scalarValue39 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue5, comparisonValue6));
                float scalarValue6 = vectorValue2.x;
                float scalarValue7 = vectorValue2.y;
                float scalarValue8 = vectorValue2.z;
                float scalarValue9 = vectorValue2.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue = frac(productValue22 + 0.5f);
                float sumValue1 = frac(productValue23 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue6 = frac(productValue45 + 0.5f);
                float sumValue7 = frac(productValue46 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue9 = frac(productValue57 + 0.5f);
                float sumValue10 = frac(productValue58 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue12 = frac(productValue64 + 0.5f);
                float sumValue13 = frac(productValue65 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue15 = frac(productValue83 + 0.5f);
                float sumValue16 = frac(productValue84 + 0.5f);
                bool conditionValue11 = sumValue16 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue18 = frac(productValue100 + 0.5f);
                float sumValue19 = frac(productValue101 + 0.5f);
                bool conditionValue13 = sumValue19 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue21 = frac(productValue107 + 0.5f);
                float sumValue22 = frac(productValue108 + 0.5f);
                bool conditionValue15 = sumValue22 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue24 = frac(productValue114 + 0.5f);
                float sumValue25 = frac(productValue115 + 0.5f);
                bool conditionValue17 = sumValue25 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue27 = frac(productValue130 + 0.5f);
                float sumValue28 = frac(productValue131 + 0.5f);
                bool conditionValue19 = sumValue28 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue30 = frac(productValue151 + 0.5f);
                float sumValue31 = frac(productValue152 + 0.5f);
                bool conditionValue22 = sumValue31 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue33 = frac(productValue160 + 0.5f);
                float sumValue34 = frac(productValue161 + 0.5f);
                bool conditionValue25 = sumValue34 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue36 = frac(productValue167 + 0.5f);
                float sumValue37 = frac(productValue168 + 0.5f);
                bool conditionValue27 = sumValue37 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue2 = clampedValue4 - clampedValue5;
                bool conditionValue1 = sumValue > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float clampedValue6 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue2 = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * clampedValue6;
                branchMergedValue2 = inverseLengthValue2 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue3 ? scalarValue7 : scalarValue8;
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue6 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue6 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue8 = clampedValue8 - clampedValue9;
                bool conditionValue4 = sumValue6 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue4 ? scalarValue7 : scalarValue6;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue7 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue7 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue9 = rsqrt(dot(float3(sumValue8, clampedValue10, 0.25f), float3(sumValue8, clampedValue10, 0.25f)));
                branchMergedValue = inverseLengthValue9 * sumValue8;
                branchMergedValue1 = inverseLengthValue9 * clampedValue10;
                branchMergedValue2 = inverseLengthValue9 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue6 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue6 ? scalarValue7 : scalarValue8;
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue11 = clampedValue11 - clampedValue12;
                bool conditionValue7 = sumValue9 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue7 ? scalarValue7 : scalarValue6;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue14 = rsqrt(dot(float3(sumValue11, clampedValue13, 0.25f), float3(sumValue11, clampedValue13, 0.25f)));
                branchMergedValue = inverseLengthValue14 * sumValue11;
                branchMergedValue1 = inverseLengthValue14 * clampedValue13;
                branchMergedValue2 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue8 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue8 ? scalarValue7 : scalarValue8;
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue14 - clampedValue15;
                bool conditionValue9 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue9 ? scalarValue7 : scalarValue6;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue16 = rsqrt(dot(float3(sumValue14, clampedValue16, 0.25f), float3(sumValue14, clampedValue16, 0.25f)));
                branchMergedValue = inverseLengthValue16 * sumValue14;
                branchMergedValue1 = inverseLengthValue16 * clampedValue16;
                branchMergedValue2 = inverseLengthValue16 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue11 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue11 ? scalarValue7 : scalarValue8;
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue17 = clampedValue17 - clampedValue18;
                bool conditionValue12 = sumValue15 > 0.5f;
                intermediateValue[0u] = conditionValue12 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue12 ? scalarValue7 : scalarValue6;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue21 = rsqrt(dot(float3(sumValue17, clampedValue19, 0.25f), float3(sumValue17, clampedValue19, 0.25f)));
                branchMergedValue = inverseLengthValue21 * sumValue17;
                branchMergedValue1 = inverseLengthValue21 * clampedValue19;
                branchMergedValue2 = inverseLengthValue21 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue13 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue13 ? scalarValue7 : scalarValue8;
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue20 = clampedValue20 - clampedValue21;
                bool conditionValue14 = sumValue18 > 0.5f;
                intermediateValue[0u] = conditionValue14 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue14 ? scalarValue7 : scalarValue6;
                float clampedValue22 = intermediateValue[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue23 = rsqrt(dot(float3(sumValue20, clampedValue22, 0.25f), float3(sumValue20, clampedValue22, 0.25f)));
                branchMergedValue = inverseLengthValue23 * sumValue20;
                branchMergedValue1 = inverseLengthValue23 * clampedValue22;
                branchMergedValue2 = inverseLengthValue23 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue15 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue15 ? scalarValue7 : scalarValue8;
                float clampedValue23 = intermediateValue[uint(int(clamp((sumValue21 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue24 = intermediateValue[uint(int(clamp((sumValue21 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue23 = clampedValue23 - clampedValue24;
                bool conditionValue16 = sumValue21 > 0.5f;
                intermediateValue[0u] = conditionValue16 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue16 ? scalarValue7 : scalarValue6;
                float clampedValue25 = intermediateValue[uint(int(clamp((sumValue22 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue22 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue25 = rsqrt(dot(float3(sumValue23, clampedValue25, 0.25f), float3(sumValue23, clampedValue25, 0.25f)));
                branchMergedValue = inverseLengthValue25 * sumValue23;
                branchMergedValue1 = inverseLengthValue25 * clampedValue25;
                branchMergedValue2 = inverseLengthValue25 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue17 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue17 ? scalarValue7 : scalarValue8;
                float clampedValue26 = intermediateValue[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue27 = intermediateValue[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue26 = clampedValue26 - clampedValue27;
                bool conditionValue18 = sumValue24 > 0.5f;
                intermediateValue[0u] = conditionValue18 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue18 ? scalarValue7 : scalarValue6;
                float clampedValue28 = intermediateValue[uint(int(clamp((sumValue25 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue25 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue27 = rsqrt(dot(float3(sumValue26, clampedValue28, 0.25f), float3(sumValue26, clampedValue28, 0.25f)));
                branchMergedValue = inverseLengthValue27 * sumValue26;
                branchMergedValue1 = inverseLengthValue27 * clampedValue28;
                branchMergedValue2 = inverseLengthValue27 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue19 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue19 ? scalarValue7 : scalarValue8;
                float clampedValue29 = intermediateValue[uint(int(clamp((sumValue27 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue30 = intermediateValue[uint(int(clamp((sumValue27 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue29 = clampedValue29 - clampedValue30;
                bool conditionValue20 = sumValue27 > 0.5f;
                intermediateValue[0u] = conditionValue20 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue20 ? scalarValue7 : scalarValue6;
                float clampedValue31 = intermediateValue[uint(int(clamp((sumValue28 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue28 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue29 = rsqrt(dot(float3(sumValue29, clampedValue31, 0.25f), float3(sumValue29, clampedValue31, 0.25f)));
                branchMergedValue = inverseLengthValue29 * sumValue29;
                branchMergedValue1 = inverseLengthValue29 * clampedValue31;
                branchMergedValue2 = inverseLengthValue29 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue22 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue22 ? scalarValue7 : scalarValue8;
                float clampedValue32 = intermediateValue[uint(int(clamp((sumValue30 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue33 = intermediateValue[uint(int(clamp((sumValue30 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue32 = clampedValue32 - clampedValue33;
                bool conditionValue23 = sumValue30 > 0.5f;
                intermediateValue[0u] = conditionValue23 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue23 ? scalarValue7 : scalarValue6;
                float clampedValue34 = intermediateValue[uint(int(clamp((sumValue31 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue31 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue34 = rsqrt(dot(float3(sumValue32, clampedValue34, 0.25f), float3(sumValue32, clampedValue34, 0.25f)));
                branchMergedValue = inverseLengthValue34 * sumValue32;
                branchMergedValue1 = inverseLengthValue34 * clampedValue34;
                branchMergedValue2 = inverseLengthValue34 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue25 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue25 ? scalarValue7 : scalarValue8;
                float clampedValue35 = intermediateValue[uint(int(clamp((sumValue33 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue36 = intermediateValue[uint(int(clamp((sumValue33 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue35 = clampedValue35 - clampedValue36;
                bool conditionValue26 = sumValue33 > 0.5f;
                intermediateValue[0u] = conditionValue26 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue26 ? scalarValue7 : scalarValue6;
                float clampedValue37 = intermediateValue[uint(int(clamp((sumValue34 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue34 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue39 = rsqrt(dot(float3(sumValue35, clampedValue37, 0.25f), float3(sumValue35, clampedValue37, 0.25f)));
                branchMergedValue = inverseLengthValue39 * sumValue35;
                branchMergedValue1 = inverseLengthValue39 * clampedValue37;
                branchMergedValue2 = inverseLengthValue39 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue27 ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue27 ? scalarValue7 : scalarValue8;
                float clampedValue38 = intermediateValue[uint(int(clamp((sumValue36 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue39 = intermediateValue[uint(int(clamp((sumValue36 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue38 = clampedValue38 - clampedValue39;
                bool conditionValue28 = sumValue36 > 0.5f;
                intermediateValue[0u] = conditionValue28 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue28 ? scalarValue7 : scalarValue6;
                float clampedValue40 = intermediateValue[uint(int(clamp((sumValue37 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue37 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue41 = rsqrt(dot(float3(sumValue38, clampedValue40, 0.25f), float3(sumValue38, clampedValue40, 0.25f)));
                branchMergedValue = inverseLengthValue41 * sumValue38;
                branchMergedValue1 = inverseLengthValue41 * clampedValue40;
                branchMergedValue2 = inverseLengthValue41 * 0.25f;
#endif
            }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue20 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue22 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue23 = branchMergedValue;
            intermediateValue24 = branchMergedValue1;
            intermediateValue25 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue5 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue16 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue19 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue22 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue17 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue20 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue22 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue23 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue25 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue3 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue18, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue17, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue18, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue17, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue18, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue17, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue10 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue11 = inverseLengthValue6 * multiplyAddValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue5 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue10 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue10 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue10 * varyingTangent0.z));
        float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue12 = inverseLengthValue11 * multiplyAddValue5;
        intermediateValue13 = inverseLengthValue11 * multiplyAddValue6;
        intermediateValue14 = inverseLengthValue11 * multiplyAddValue7;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue17 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue8 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue23, inverseLengthValue17 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue23, inverseLengthValue17 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue24, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue23, inverseLengthValue17 * varyingTangent0.z));
        float inverseLengthValue18 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue15 = inverseLengthValue18 * multiplyAddValue8;
        intermediateValue16 = inverseLengthValue18 * multiplyAddValue9;
        intermediateValue17 = inverseLengthValue18 * multiplyAddValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue30 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue11 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue30 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue30 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue30 * varyingTangent0.z));
        float inverseLengthValue31 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue10 = inverseLengthValue31 * multiplyAddValue11;
        intermediateValue11 = inverseLengthValue31 * multiplyAddValue12;
        intermediateValue12 = inverseLengthValue31 * multiplyAddValue13;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue35 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue20;
        float multiplyAddValue14 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue21, inverseLengthValue35 * varyingTangent0.x));
        float multiplyAddValue15 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue21, inverseLengthValue35 * varyingTangent0.y));
        float multiplyAddValue16 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue21, inverseLengthValue35 * varyingTangent0.z));
        float inverseLengthValue36 = rsqrt(dot(float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
        intermediateValue13 = inverseLengthValue36 * multiplyAddValue14;
        intermediateValue14 = inverseLengthValue36 * multiplyAddValue15;
        intermediateValue15 = inverseLengthValue36 * multiplyAddValue16;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue42 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue23;
        float multiplyAddValue17 = mad(inverseLengthValue3 * varyingNormal0.x, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue24, inverseLengthValue42 * varyingTangent0.x));
        float multiplyAddValue18 = mad(inverseLengthValue3 * varyingNormal0.y, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue24, inverseLengthValue42 * varyingTangent0.y));
        float multiplyAddValue19 = mad(inverseLengthValue3 * varyingNormal0.z, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue24, inverseLengthValue42 * varyingTangent0.z));
        float inverseLengthValue43 = rsqrt(dot(float3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19), float3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19)));
        intermediateValue16 = inverseLengthValue43 * multiplyAddValue17;
        intermediateValue17 = inverseLengthValue43 * multiplyAddValue18;
        intermediateValue18 = inverseLengthValue43 * multiplyAddValue19;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue7 = rsqrt(dot(float3(intermediateValue9, intermediateValue10, intermediateValue11), float3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue24 = inverseLengthValue7 * intermediateValue9;
    float productValue25 = inverseLengthValue7 * intermediateValue10;
    float productValue26 = inverseLengthValue7 * intermediateValue11;
    float quotientValue2 = 1.0f / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue2 * productValue24;
    float productValue28 = quotientValue2 * productValue25;
    bool conditionValue2 = productValue26 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue12 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue47 = inverseLengthValue12 * intermediateValue12;
    float productValue48 = inverseLengthValue12 * intermediateValue13;
    float productValue49 = inverseLengthValue12 * intermediateValue14;
    float quotientValue3 = 1.0f / ((abs(productValue48) + abs(productValue47)) + abs(productValue49));
    float productValue50 = quotientValue3 * productValue47;
    float productValue51 = quotientValue3 * productValue48;
    bool conditionValue5 = productValue49 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue19 = rsqrt(dot(float3(intermediateValue15, intermediateValue16, intermediateValue17), float3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue66 = inverseLengthValue19 * intermediateValue15;
    float productValue67 = inverseLengthValue19 * intermediateValue16;
    float productValue68 = inverseLengthValue19 * intermediateValue17;
    float quotientValue4 = 1.0f / ((abs(productValue67) + abs(productValue66)) + abs(productValue68));
    float productValue69 = quotientValue4 * productValue66;
    float productValue70 = quotientValue4 * productValue67;
    bool conditionValue10 = productValue68 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue32 = rsqrt(dot(float3(intermediateValue10, intermediateValue11, intermediateValue12), float3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue132 = inverseLengthValue32 * intermediateValue10;
    float productValue133 = inverseLengthValue32 * intermediateValue11;
    float productValue134 = inverseLengthValue32 * intermediateValue12;
    float quotientValue5 = 1.0f / ((abs(productValue133) + abs(productValue132)) + abs(productValue134));
    float productValue135 = quotientValue5 * productValue132;
    float productValue136 = quotientValue5 * productValue133;
    bool conditionValue21 = productValue134 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue37 = rsqrt(dot(float3(intermediateValue13, intermediateValue14, intermediateValue15), float3(intermediateValue13, intermediateValue14, intermediateValue15)));
    float productValue153 = inverseLengthValue37 * intermediateValue13;
    float productValue154 = inverseLengthValue37 * intermediateValue14;
    float productValue155 = inverseLengthValue37 * intermediateValue15;
    float quotientValue6 = 1.0f / ((abs(productValue154) + abs(productValue153)) + abs(productValue155));
    float productValue156 = quotientValue6 * productValue153;
    float productValue157 = quotientValue6 * productValue154;
    bool conditionValue24 = productValue155 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue44 = rsqrt(dot(float3(intermediateValue16, intermediateValue17, intermediateValue18), float3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue169 = inverseLengthValue44 * intermediateValue16;
    float productValue170 = inverseLengthValue44 * intermediateValue17;
    float productValue171 = inverseLengthValue44 * intermediateValue18;
    float quotientValue7 = 1.0f / ((abs(productValue170) + abs(productValue169)) + abs(productValue171));
    float productValue172 = quotientValue7 * productValue169;
    float productValue173 = quotientValue7 * productValue170;
    bool conditionValue29 = productValue171 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue29 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue29, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue29 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue29, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue29 * productValue29) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue29, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue30 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue31 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue32 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue7 = ceil(clamp(max(max(productValue30, productValue32), max(productValue31, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue11, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue10, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue14, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue30 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue31 / clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue32 / clampedValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue27)) * ((productValue28 < 0.0f) ? (-1.0f) : 1.0f)) : productValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue42) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue42;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue50 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue51))) : productValue50;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue50)) * ((productValue51 < 0.0f) ? (-1.0f) : 1.0f)) : productValue51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue54) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue54;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue50 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue51))) : productValue50;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue50)) * ((productValue51 < 0.0f) ? (-1.0f) : 1.0f)) : productValue51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue61) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue61;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue69)) * ((productValue70 < 0.0f) ? (-1.0f) : 1.0f)) : productValue70;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue79) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue79;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue80) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue80;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue27)) * ((productValue28 < 0.0f) ? (-1.0f) : 1.0f)) : productValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue95) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue95;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue96) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue96;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue97) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue97;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue50 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue51))) : productValue50;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue50)) * ((productValue51 < 0.0f) ? (-1.0f) : 1.0f)) : productValue51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue102) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue102;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue103) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue103;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue104) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue104;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue50 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue51))) : productValue50;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue50)) * ((productValue51 < 0.0f) ? (-1.0f) : 1.0f)) : productValue51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue110) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue110;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue111) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue111;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue69)) * ((productValue70 < 0.0f) ? (-1.0f) : 1.0f)) : productValue70;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue125) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue125;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue126) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue126;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue127) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue127;
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue9 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue21 ? (((productValue135 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue136))) : productValue135;
    fragmentColor2.y = conditionValue21 ? ((1.0f - abs(productValue135)) * ((productValue136 < 0.0f) ? (-1.0f) : 1.0f)) : productValue136;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue146) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue146;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue147) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue147;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue148) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue148;
    fragmentColor1.w = (intermediateValue9 > intermediateValue12) ? ((intermediateValue9 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue12 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue24 ? (((productValue156 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue157))) : productValue156;
    fragmentColor2.y = conditionValue24 ? ((1.0f - abs(productValue156)) * ((productValue157 < 0.0f) ? (-1.0f) : 1.0f)) : productValue157;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue110) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue110;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue111) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue111;
    fragmentColor1.w = (intermediateValue9 > intermediateValue12) ? ((intermediateValue9 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue12 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue24 ? (((productValue156 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue157))) : productValue156;
    fragmentColor2.y = conditionValue24 ? ((1.0f - abs(productValue156)) * ((productValue157 < 0.0f) ? (-1.0f) : 1.0f)) : productValue157;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue162) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue162;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue163) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue163;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue164) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue164;
    fragmentColor1.w = (intermediateValue12 > intermediateValue15) ? ((intermediateValue12 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue15 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue29 ? (((productValue172 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue173))) : productValue172;
    fragmentColor2.y = conditionValue29 ? ((1.0f - abs(productValue172)) * ((productValue173 < 0.0f) ? (-1.0f) : 1.0f)) : productValue173;
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
