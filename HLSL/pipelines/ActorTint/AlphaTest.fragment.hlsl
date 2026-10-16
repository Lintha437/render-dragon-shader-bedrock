// ActorTint / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ActorTint/FragmentBindings.hlsli"

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
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
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
  workingVector2.y = workingVector1.w + workingVector0.w;
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.y < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = (int)workingVector2.y | (int)workingVector2.x;
  if (workingVector2.x != 0) discard;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
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
  workingVector2.y = workingVector0.w + workingVector1.w;
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.y < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.x = (int)workingVector2.y | (int)workingVector2.x;
  if (workingVector2.x != 0) discard;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector1.z = workingVector2.w + workingVector1.x;
  workingVector1.z = RD_COMPARISON_MASK(workingVector1.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.y = (int)workingVector1.z | (int)workingVector1.y;
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = workingVector2.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
  workingVector2.z = workingVector2.x + workingVector1.w;
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector2.y = (int)workingVector2.z | (int)workingVector2.y;
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyz;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector2.x = workingVector1.w + workingVector0.z;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector2.x = workingVector0.z + workingVector1.w;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector2.x = workingVector1.w + workingVector0.z;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector2.x = workingVector0.z + workingVector1.w;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.w = (int)workingVector0.w | (int)workingVector2.x;
  if (workingVector0.w != 0) discard;
  workingVector2.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector3.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector2.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
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
    float productValue23 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue24 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue23) + productValue;
    float productValue25 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue23) + productValue1;
    float productValue26 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue23) + productValue2;
    float productValue27 = max(0.0f, productValue23 * RD_UNIFORM_CHANGE_COLOR.w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue45 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue46 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue47 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue5 = ceil(productValue1);
    float productValue48 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue45) * scalarValue5) + productValue45;
    float productValue49 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue46) * scalarValue5) + productValue46;
    float productValue50 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue47) * scalarValue5) + productValue47;
    float productValue3 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue12 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue13 = (productValue12 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue14 = (productValue12 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue15 = (productValue12 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
    float productValue16 = max(0.0f, (productValue12 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue12 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue13 = (productValue12 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue14 = (productValue12 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue15 = (productValue12 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue4)) + scalarValue4;
    float productValue34 = (productValue12 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue35 = (((productValue13 * RD_UNIFORM_CHANGE_COLOR.x) - productValue13) * productValue34) + productValue13;
    float productValue36 = (((productValue14 * RD_UNIFORM_CHANGE_COLOR.y) - productValue14) * productValue34) + productValue14;
    float productValue37 = (((productValue15 * RD_UNIFORM_CHANGE_COLOR.z) - productValue15) * productValue34) + productValue15;
    float productValue38 = max(0.0f, productValue34 * RD_UNIFORM_CHANGE_COLOR.w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue12 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0f - scalarValue)) > 0.0f);
    float productValue13 = (productValue12 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue2)) + scalarValue2;
    float productValue14 = (productValue12 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue3)) + scalarValue3;
    float productValue57 = productValue13 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue58 = productValue13 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue59 = productValue13 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue6 = ceil(productValue14);
    float productValue60 = (((productValue14 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue57) * scalarValue6) + productValue57;
    float productValue61 = (((productValue14 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue58) * scalarValue6) + productValue58;
    float productValue62 = (((productValue14 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue59) * scalarValue6) + productValue59;
    float productValue16 = max(0.0f, (productValue12 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue);
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue4 = floor(quotientValue1 * 0.25f);
        float productValue5 = floor(quotientValue1 * 0.5f);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue5 * productValue5) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue4 * productValue4) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((scalarValue + productValue3) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if (comparisonValue || ((scalarValue + productValue16) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((scalarValue + productValue27) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if (comparisonValue || ((productValue38 + scalarValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if (comparisonValue || ((productValue16 + scalarValue) < RD_UNIFORM_ACTOR_FP_EPSILON.x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue6 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue);
    float productValue7 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1);
    float productValue8 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2);
    float productValue9 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue6) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue6) * varyingColor3.x;
    float productValue10 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue7) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue7) * varyingColor3.y;
    float productValue11 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue8) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue8) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue17 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue13) * scalarValue) + productValue13);
    float productValue18 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue14) * scalarValue) + productValue14);
    float productValue19 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue15) * scalarValue) + productValue15);
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) * varyingColor3.x;
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.y;
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.y = ((varyingColor2.y - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.z = ((varyingColor2.z - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.w = productValue16;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue28 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * sampledTextureValue1.x) - productValue24) * scalarValue) + productValue24);
    float productValue29 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * sampledTextureValue1.y) - productValue25) * scalarValue) + productValue25);
    float productValue30 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * sampledTextureValue1.z) - productValue26) * scalarValue) + productValue26);
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.x;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.y;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.y = ((varyingColor2.y - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.z = ((varyingColor2.z - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.w = productValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue39 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue35) * scalarValue) + productValue35);
    float productValue40 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue36) * scalarValue) + productValue36);
    float productValue41 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue37) * scalarValue) + productValue37);
    float productValue42 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.x;
    float productValue43 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.y;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.y = ((varyingColor2.y - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.z = ((varyingColor2.z - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.w = productValue38;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue51 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.x * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue48) * scalarValue) + productValue48);
    float productValue52 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.y * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue49) * scalarValue) + productValue49);
    float productValue53 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((sampledTextureValue1.z * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue50) * scalarValue) + productValue50);
    float productValue54 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) * varyingColor3.x;
    float productValue55 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * varyingColor3.y;
    float productValue56 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.y = ((varyingColor2.y - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.z = ((varyingColor2.z - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.w = productValue3;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue63 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * scalarValue2) - productValue60) * scalarValue) + productValue60);
    float productValue64 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * scalarValue3) - productValue61) * scalarValue) + productValue61);
    float productValue65 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * scalarValue4) - productValue62) * scalarValue) + productValue62);
    float productValue66 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue63) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue63) * varyingColor3.x;
    float productValue67 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue64) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue64) * varyingColor3.y;
    float productValue68 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue65) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue65) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue66) * varyingColor2.w) + productValue66;
    fragmentColor0.y = ((varyingColor2.y - productValue67) * varyingColor2.w) + productValue67;
    fragmentColor0.z = ((varyingColor2.z - productValue68) * varyingColor2.w) + productValue68;
    fragmentColor0.w = productValue16;
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
