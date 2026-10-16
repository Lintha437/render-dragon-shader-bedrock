// ActorMultiTexture / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ActorMultiTexture/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector1.w);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector3.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector3.y = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector3.x = workingVector3.y ? workingVector3.x : 0;
  workingVector1.w = (int)workingVector1.w | (int)workingVector3.x;
  if (workingVector1.w != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.z = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.x = (int)workingVector2.y | (int)workingVector2.x;
  if (workingVector2.x != 0) discard;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector1.w);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector3.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector3.y = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector3.x = workingVector3.y ? workingVector3.x : 0;
  workingVector1.w = (int)workingVector1.w | (int)workingVector3.x;
  if (workingVector1.w != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyz = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector2.z = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.x = (int)workingVector2.y | (int)workingVector2.x;
  if (workingVector2.x != 0) discard;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyz = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector1.x = max(0, workingVector1.x);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.x < 0.5);
  workingVector1.w = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.z = workingVector1.w ? workingVector1.z : 0;
  workingVector1.y = (int)workingVector1.z | (int)workingVector1.y;
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = workingVector2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.yzw + workingVector0.xyz;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.yzw = workingVector2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.yzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.yzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.yzw * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.yzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.x < 0.5);
  workingVector2.w = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.z = workingVector2.w ? workingVector2.z : 0;
  workingVector2.y = (int)workingVector2.z | (int)workingVector2.y;
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.yzw = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.yzw;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector1.x = max(0, workingVector1.x);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.x < 0.5);
  workingVector1.w = RD_COMPARISON_MASK(workingVector2.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.z = workingVector1.w ? workingVector1.z : 0;
  workingVector1.y = (int)workingVector1.z | (int)workingVector1.y;
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = workingVector2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.yzw + workingVector0.xyz;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector2.w);
  workingVector1.yzw = workingVector2.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector2.xyz;
  workingVector1.yzw = workingVector2.www * workingVector1.yzw + workingVector2.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.yzw : workingVector0.xyz;
  workingVector1.yzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.yzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.yzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.yzw * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.yzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.x < 0.5);
  workingVector2.w = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.z = workingVector2.w ? workingVector2.z : 0;
  workingVector2.y = (int)workingVector2.z | (int)workingVector2.y;
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.yzw = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.yzw;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector0.z = max(0, workingVector0.z);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector2.x = 1 + -workingVector1.w;
  workingVector0.z = workingVector2.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xyw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector0.xyw + workingVector1.xyw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector0.z = max(0, workingVector0.z);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyw = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector2.x = 1 + -workingVector1.w;
  workingVector0.z = workingVector2.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xyw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector0.xyw + workingVector1.xyw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyw = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.z = max(0, workingVector0.z);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.z = max(0, workingVector0.z);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyw = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyw = workingVector1.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.yzw + workingVector1.xyz;
  workingVector0.xyw = workingVector2.xxx ? workingVector1.xyz : workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyw + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#endif
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
    float productValue3 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue50 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue51 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue50) + productValue;
    float productValue52 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue50) + productValue1;
    float productValue53 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue50) + productValue2;
    float productValue54 = max(0.0f, productValue50 * RD_UNIFORM_CHANGE_COLOR.w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue93 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue94 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue95 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue9 = ceil(productValue1);
    float productValue96 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue93) * scalarValue9) + productValue93;
    float productValue97 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue94) * scalarValue9) + productValue94;
    float productValue98 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue95) * scalarValue9) + productValue95;
    float productValue3 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue13 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue14 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
    float productValue15 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue25 = productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3);
    float productValue26 = productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4);
    float productValue27 = productValue24 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue5);
    float productValue28 = max(0.0f, (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
    float productValue29 = (productValue25 + scalarValue3) - (productValue25 * scalarValue);
    float productValue30 = (productValue26 + scalarValue4) - (productValue26 * scalarValue);
    float productValue31 = (productValue27 + scalarValue5) - (productValue27 * scalarValue);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue25 = productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3);
    float productValue26 = productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4);
    float productValue27 = productValue24 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue5);
    float productValue28 = max(0.0f, (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue55 = ((sampledTextureValue1.x - productValue51) * scalarValue) + productValue51;
    float productValue56 = ((sampledTextureValue1.y - productValue52) * scalarValue) + productValue52;
    float productValue57 = ((sampledTextureValue1.z - productValue53) * scalarValue) + productValue53;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue64 = (productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3)) + scalarValue3;
    float productValue65 = (productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4)) + scalarValue4;
    float productValue66 = (productValue24 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue5)) + scalarValue5;
    float productValue67 = (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue68 = (((productValue64 * RD_UNIFORM_CHANGE_COLOR.x) - productValue64) * productValue67) + productValue64;
    float productValue69 = (((productValue65 * RD_UNIFORM_CHANGE_COLOR.y) - productValue65) * productValue67) + productValue65;
    float productValue70 = (((productValue66 * RD_UNIFORM_CHANGE_COLOR.z) - productValue66) * productValue67) + productValue66;
    float productValue71 = max(0.0f, productValue67 * RD_UNIFORM_CHANGE_COLOR.w);
    float productValue72 = ((scalarValue3 - productValue68) * scalarValue) + productValue68;
    float productValue73 = ((scalarValue4 - productValue69) * scalarValue) + productValue69;
    float productValue74 = ((scalarValue5 - productValue70) * scalarValue) + productValue70;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue64 = (productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3)) + scalarValue3;
    float productValue65 = (productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4)) + scalarValue4;
    float productValue66 = (productValue24 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue5)) + scalarValue5;
    float productValue67 = (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue68 = (((productValue64 * RD_UNIFORM_CHANGE_COLOR.x) - productValue64) * productValue67) + productValue64;
    float productValue69 = (((productValue65 * RD_UNIFORM_CHANGE_COLOR.y) - productValue65) * productValue67) + productValue65;
    float productValue70 = (((productValue66 * RD_UNIFORM_CHANGE_COLOR.z) - productValue66) * productValue67) + productValue66;
    float productValue71 = max(0.0f, productValue67 * RD_UNIFORM_CHANGE_COLOR.w);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue99 = ((sampledTextureValue1.x - productValue96) * scalarValue) + productValue96;
    float productValue100 = ((sampledTextureValue1.y - productValue97) * scalarValue) + productValue97;
    float productValue101 = ((sampledTextureValue1.z - productValue98) * scalarValue) + productValue98;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue64 = (productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3)) + scalarValue3;
    float productValue65 = (productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4)) + scalarValue4;
    float productValue108 = productValue64 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue109 = productValue64 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue110 = productValue64 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue10 = ceil(productValue65);
    float productValue111 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue108) * scalarValue10) + productValue108;
    float productValue112 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue109) * scalarValue10) + productValue109;
    float productValue113 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue110) * scalarValue10) + productValue110;
    float productValue28 = max(0.0f, (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
    float productValue114 = ((scalarValue3 - productValue111) * scalarValue) + productValue111;
    float productValue115 = ((scalarValue4 - productValue112) * scalarValue) + productValue112;
    float productValue116 = ((scalarValue5 - productValue113) * scalarValue) + productValue113;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue24 = float((((scalarValue3 + scalarValue4) + scalarValue5) * (1.0f - scalarValue)) > 0.0f);
    float productValue64 = (productValue24 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue3)) + scalarValue3;
    float productValue65 = (productValue24 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue4)) + scalarValue4;
    float productValue108 = productValue64 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue109 = productValue64 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue110 = productValue64 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue10 = ceil(productValue65);
    float productValue111 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue108) * scalarValue10) + productValue108;
    float productValue112 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue109) * scalarValue10) + productValue109;
    float productValue113 = (((productValue65 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue110) * scalarValue10) + productValue110;
    float productValue28 = max(0.0f, (productValue24 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
#endif
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON
    float scalarValue6 = sampledTextureValue2.x;
    float scalarValue7 = sampledTextureValue2.y;
    float scalarValue8 = sampledTextureValue2.z;
#endif
    float scalarValue1 = sampledTextureValue2.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue16 = (((sampledTextureValue2.x - productValue13) * scalarValue1) + productValue13) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue17 = (((sampledTextureValue2.y - productValue14) * scalarValue1) + productValue14) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue18 = (((sampledTextureValue2.z - productValue15) * scalarValue1) + productValue15) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue19 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor3.x;
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) * varyingColor3.y;
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue32 = (((sampledTextureValue2.x - productValue29) * scalarValue1) + productValue29) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue33 = (((sampledTextureValue2.y - productValue30) * scalarValue1) + productValue30) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue34 = (((sampledTextureValue2.z - productValue31) * scalarValue1) + productValue31) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue35 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue32) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue32) * varyingColor3.x;
    float productValue36 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.y;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue6) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue7) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue6 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue8) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue4 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
        productValue5 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
        productValue6 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    }
    float productValue38 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue4;
    float productValue39 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue5;
    float productValue40 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue6;
    float productValue41 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) * varyingColor3.x;
    float productValue42 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.y;
    float productValue43 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue5;
    float productValue6;
    float productValue7;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue6) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue6 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue7) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue7 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue8) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue5 = (productValue25 + scalarValue3) - (productValue25 * scalarValue);
        productValue6 = (productValue26 + scalarValue4) - (productValue26 * scalarValue);
        productValue7 = (productValue27 + scalarValue5) - (productValue27 * scalarValue);
    }
    float productValue44 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue5;
    float productValue45 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue6;
    float productValue46 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue7;
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue44) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue44) * varyingColor3.x;
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45) * varyingColor3.y;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue58 = (((sampledTextureValue2.x - productValue55) * scalarValue1) + productValue55) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue59 = (((sampledTextureValue2.y - productValue56) * scalarValue1) + productValue56) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue60 = (((sampledTextureValue2.z - productValue57) * scalarValue1) + productValue57) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue61 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58) * varyingColor3.x;
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.y;
    float productValue63 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue75 = (((sampledTextureValue2.x - productValue72) * scalarValue1) + productValue72) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue76 = (((sampledTextureValue2.y - productValue73) * scalarValue1) + productValue73) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue77 = (((sampledTextureValue2.z - productValue74) * scalarValue1) + productValue74) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue78 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue75) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue75) * varyingColor3.x;
    float productValue79 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) * varyingColor3.y;
    float productValue80 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue9 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue10 = (((scalarValue8 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue51) * scalarValue) + productValue51;
        productValue9 = ((sampledTextureValue1.y - productValue52) * scalarValue) + productValue52;
        productValue10 = ((sampledTextureValue1.z - productValue53) * scalarValue) + productValue53;
    }
    float productValue81 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue82 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue83 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
    float productValue84 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue81) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue81) * varyingColor3.x;
    float productValue85 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82) * varyingColor3.y;
    float productValue86 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue83) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue83) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue9 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue10 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue11 = (((scalarValue8 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue9 = ((scalarValue3 - productValue68) * scalarValue) + productValue68;
        productValue10 = ((scalarValue4 - productValue69) * scalarValue) + productValue69;
        productValue11 = ((scalarValue5 - productValue70) * scalarValue) + productValue70;
    }
    float productValue87 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue9;
    float productValue88 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue10;
    float productValue89 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue11;
    float productValue90 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue87) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue87) * varyingColor3.x;
    float productValue91 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue88) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue88) * varyingColor3.y;
    float productValue92 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue89) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue89) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue102 = (((sampledTextureValue2.x - productValue99) * scalarValue1) + productValue99) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue103 = (((sampledTextureValue2.y - productValue100) * scalarValue1) + productValue100) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue104 = (((sampledTextureValue2.z - productValue101) * scalarValue1) + productValue101) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue105 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue102) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue102) * varyingColor3.x;
    float productValue106 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue103) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue103) * varyingColor3.y;
    float productValue107 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue104) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue104) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue117 = (((sampledTextureValue2.x - productValue114) * scalarValue1) + productValue114) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue118 = (((sampledTextureValue2.y - productValue115) * scalarValue1) + productValue115) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue119 = (((sampledTextureValue2.z - productValue116) * scalarValue1) + productValue116) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue120 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue117) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue117) * varyingColor3.x;
    float productValue121 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue118) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue118) * varyingColor3.y;
    float productValue122 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue119) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue119) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue9 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue10 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue11 = (((scalarValue8 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue9 = ((sampledTextureValue1.x - productValue96) * scalarValue) + productValue96;
        productValue10 = ((sampledTextureValue1.y - productValue97) * scalarValue) + productValue97;
        productValue11 = ((sampledTextureValue1.z - productValue98) * scalarValue) + productValue98;
    }
    float productValue87 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue9;
    float productValue88 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue10;
    float productValue89 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue11;
    float productValue90 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue87) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue87) * varyingColor3.x;
    float productValue91 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue88) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue88) * varyingColor3.y;
    float productValue92 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue89) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue89) * varyingColor3.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue10;
    float productValue11;
    float productValue12;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue10 = (((scalarValue6 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue6) * scalarValue1) + scalarValue6;
        productValue11 = (((scalarValue7 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue7) * scalarValue1) + scalarValue7;
        productValue12 = (((scalarValue8 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue8) * scalarValue1) + scalarValue8;
    }
    else
    {
        productValue10 = ((scalarValue3 - productValue111) * scalarValue) + productValue111;
        productValue11 = ((scalarValue4 - productValue112) * scalarValue) + productValue112;
        productValue12 = ((scalarValue5 - productValue113) * scalarValue) + productValue113;
    }
    float productValue123 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue10;
    float productValue124 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue11;
    float productValue125 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue12;
    float productValue126 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue123) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue123) * varyingColor3.x;
    float productValue127 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue124) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue124) * varyingColor3.y;
    float productValue128 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue125) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue125) * varyingColor3.z;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue22 = floor(quotientValue1 * 0.25f);
        float productValue23 = floor(quotientValue1 * 0.5f);
        float scalarValue2 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue23 * productValue23) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue22 * productValue22) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue2 * scalarValue2) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((productValue3 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((productValue28 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((productValue3 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (((productValue28 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((productValue54 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((productValue71 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (((productValue54 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (((productValue71 < 0.5f) && (scalarValue < RD_UNIFORM_ACTOR_FP_EPSILON.x)) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.y = ((varyingColor2.y - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.z = ((varyingColor2.z - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.y = ((varyingColor2.y - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.z = ((varyingColor2.z - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.w = productValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.y = ((varyingColor2.y - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.z = ((varyingColor2.z - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.y = ((varyingColor2.y - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.z = ((varyingColor2.z - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.w = productValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((varyingColor2.x - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.y = ((varyingColor2.y - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.z = ((varyingColor2.z - productValue63) * varyingColor2.w) + productValue63;
    fragmentColor0.w = productValue54;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((varyingColor2.x - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.y = ((varyingColor2.y - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.z = ((varyingColor2.z - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.w = productValue71;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((varyingColor2.x - productValue84) * varyingColor2.w) + productValue84;
    fragmentColor0.y = ((varyingColor2.y - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.z = ((varyingColor2.z - productValue86) * varyingColor2.w) + productValue86;
    fragmentColor0.w = productValue54;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((varyingColor2.x - productValue90) * varyingColor2.w) + productValue90;
    fragmentColor0.y = ((varyingColor2.y - productValue91) * varyingColor2.w) + productValue91;
    fragmentColor0.z = ((varyingColor2.z - productValue92) * varyingColor2.w) + productValue92;
    fragmentColor0.w = productValue71;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((varyingColor2.x - productValue105) * varyingColor2.w) + productValue105;
    fragmentColor0.y = ((varyingColor2.y - productValue106) * varyingColor2.w) + productValue106;
    fragmentColor0.z = ((varyingColor2.z - productValue107) * varyingColor2.w) + productValue107;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((varyingColor2.x - productValue120) * varyingColor2.w) + productValue120;
    fragmentColor0.y = ((varyingColor2.y - productValue121) * varyingColor2.w) + productValue121;
    fragmentColor0.z = ((varyingColor2.z - productValue122) * varyingColor2.w) + productValue122;
    fragmentColor0.w = productValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((varyingColor2.x - productValue90) * varyingColor2.w) + productValue90;
    fragmentColor0.y = ((varyingColor2.y - productValue91) * varyingColor2.w) + productValue91;
    fragmentColor0.z = ((varyingColor2.z - productValue92) * varyingColor2.w) + productValue92;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((varyingColor2.x - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.y = ((varyingColor2.y - productValue127) * varyingColor2.w) + productValue127;
    fragmentColor0.z = ((varyingColor2.z - productValue128) * varyingColor2.w) + productValue128;
    fragmentColor0.w = productValue28;
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
