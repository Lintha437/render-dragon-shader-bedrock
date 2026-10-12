// Actor / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 31
#endif


#include "../../include/materials/Actor/FragmentBindings.hlsli"

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
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON || RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF
  workingVector0.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.xy;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xyxy;
  workingVector0.xy = floor(workingVector0.xy);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector1.x = 1 + -workingVector0.w;
  workingVector0.z = workingVector1.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyw + -workingVector0.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xzw + workingVector2.xyz;
  workingVector0.xz = varyingColor1.xy / varyingColor1.ww;
  workingVector0.xz = workingVector0.xz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xz;
  workingVector0.xz = workingVector0.xz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.xz = floor(workingVector0.xz);
  workingVector0.xz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.xz;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xzxz;
  workingVector0.xz = floor(workingVector0.xz);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector0.z = workingVector1.x + workingVector0.z;
  workingVector1.x = 1 + -workingVector0.w;
  workingVector0.z = workingVector1.x * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyz + -workingVector0.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.y);
  workingVector0.y = max(0, workingVector0.z);
  workingVector0.xzw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xzw + workingVector2.xyz;
  workingVector0.xz = varyingColor1.xy / varyingColor1.ww;
  workingVector0.xz = workingVector0.xz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xz;
  workingVector0.xz = workingVector0.xz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.xz = floor(workingVector0.xz);
  workingVector0.xz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.xz;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xzxz;
  workingVector0.xz = floor(workingVector0.xz);
#endif
  workingVector1.xyzw = floor(workingVector1.xyzw);
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON || RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF
  workingVector0.zw = workingVector1.yw * workingVector1.yw;
  workingVector0.zw = float2(0.75,0.75) * workingVector0.zw;
  workingVector0.zw = workingVector1.xz * float2(0.5,0.5) + workingVector0.zw;
  workingVector0.zw = frac(workingVector0.zw);
  workingVector0.z = workingVector0.z * 0.25 + workingVector0.w;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = 0.75 * workingVector0.y;
  workingVector0.x = workingVector0.x * 0.5 + workingVector0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.yw = workingVector1.yw * workingVector1.yw;
  workingVector1.yw = float2(0.75,0.75) * workingVector1.yw;
  workingVector1.xy = workingVector1.xz * float2(0.5,0.5) + workingVector1.yw;
  workingVector1.xy = frac(workingVector1.xy);
  workingVector0.w = workingVector1.x * 0.25 + workingVector1.y;
  workingVector0.z = workingVector0.z * workingVector0.z;
  workingVector0.z = 0.75 * workingVector0.z;
  workingVector0.x = workingVector0.x * 0.5 + workingVector0.z;
#endif
  workingVector0.x = frac(workingVector0.x);
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON || RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF
  workingVector0.x = workingVector0.z * 0.25 + workingVector0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.x = workingVector0.w * 0.25 + workingVector0.x;
#endif
  workingVector0.x = workingVector0.x * 64 + 0.5;
  workingVector0.x = 0.015625 * workingVector0.x;
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON || RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.y;
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.y);
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
  workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.z;
  workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.z = saturate(workingVector0.z * workingVector0.w);
  workingVector0.w = workingVector0.z * -2 + 3;
  workingVector0.z = workingVector0.z * workingVector0.z;
  workingVector0.z = workingVector0.w * workingVector0.z;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.z);
  workingVector0.z = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.x = workingVector0.x ? workingVector0.z : 0;
#endif
  workingVector0.x = workingVector0.x ? 0 : 1;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector0.y = max(0, workingVector1.w);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.y * workingVector0.x;
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.y = max(0, workingVector1.w);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.y * workingVector0.x;
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz * workingVector0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector0.y = max(0, workingVector1.w);
  workingVector0.z = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.z * workingVector0.x;
  workingVector0.xzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector1.xyz * workingVector0.xzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.y = max(0, workingVector1.w);
  workingVector0.z = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.z * workingVector0.x;
  workingVector0.xzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector1.xyz * workingVector0.xzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector0.y = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.y * workingVector0.x;
  workingVector0.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.y = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.y * workingVector0.x;
  workingVector0.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector0.y = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.z * workingVector0.x;
  workingVector0.xzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xzw = workingVector1.www * workingVector0.xzw + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector2.xyzw + -workingVector1.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.y = RD_UNIFORM_CHANGE_COLOR.w * workingVector1.w;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
  fragmentColor0.w = workingVector0.z * workingVector0.x;
  workingVector0.xzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xzw = workingVector1.www * workingVector0.xzw + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xzw = -workingVector0.xzw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xzw + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.yyy * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xzw;
  workingVector0.xyz = -workingVector0.xzw * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xyw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
  workingVector0.z = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector2.xyw + -workingVector1.xyw;
  workingVector0.yzw = workingVector0.yyy * workingVector2.xyz + workingVector1.xyw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xyw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
  workingVector0.z = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector1.xyw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector1.x = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector1.x * workingVector0.x;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector2.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
  fragmentColor0.w = workingVector0.y * workingVector0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.yzw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xyw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
  workingVector0.z = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector1.x + workingVector1.y;
  workingVector0.y = workingVector0.y + workingVector1.z;
  workingVector0.z = 1 + -workingVector1.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector2.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector2.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector2.xyz + -workingVector1.xyw;
  workingVector0.yzw = workingVector0.yyy * workingVector2.xyz + workingVector1.xyw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xyw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector1.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xyw;
  workingVector0.z = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.zzz * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.yzw;
  workingVector0.w = max(0, workingVector0.w);
  workingVector1.x = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.w = workingVector1.x * workingVector0.x;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector2.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.x = ceil(workingVector0.z);
  workingVector0.xyz = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor3.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector2.xyz;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue3 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * varyingColor3.x;
    float productValue4 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.y;
    float productValue5 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue8 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue9 = ((productValue8 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue10 = ((productValue8 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue11 = ((productValue8 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue12 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue9) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue9) * varyingColor3.x;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.y;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue15 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * ((productValue15 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * ((productValue15 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * ((productValue15 * (varyingColor3.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue8 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue19 = max(0.0f, (productValue8 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4);
    float productValue9 = ((productValue8 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue10 = ((productValue8 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue11 = ((productValue8 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue9) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue9) * ((productValue19 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * ((productValue19 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * ((productValue19 * (varyingColor3.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue23 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue24 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue25 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue26 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue27 = ((((productValue23 * RD_UNIFORM_CHANGE_COLOR.x) - productValue23) * productValue26) + productValue23) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue28 = ((((productValue24 * RD_UNIFORM_CHANGE_COLOR.y) - productValue24) * productValue26) + productValue24) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue29 = ((((productValue25 * RD_UNIFORM_CHANGE_COLOR.z) - productValue25) * productValue26) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor3.x;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.y;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue8 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue33 = (productValue8 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue34 = (productValue8 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue35 = (productValue8 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue36 = (productValue8 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4;
    float productValue37 = ((((productValue33 * RD_UNIFORM_CHANGE_COLOR.x) - productValue33) * productValue36) + productValue33) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue38 = ((((productValue34 * RD_UNIFORM_CHANGE_COLOR.y) - productValue34) * productValue36) + productValue34) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue39 = ((((productValue35 * RD_UNIFORM_CHANGE_COLOR.z) - productValue35) * productValue36) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue40 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37) * varyingColor3.x;
    float productValue41 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) * varyingColor3.y;
    float productValue42 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue23 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue24 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue25 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue26 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue43 = max(0.0f, productValue26 * RD_UNIFORM_CHANGE_COLOR.w);
    float productValue27 = ((((productValue23 * RD_UNIFORM_CHANGE_COLOR.x) - productValue23) * productValue26) + productValue23) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue28 = ((((productValue24 * RD_UNIFORM_CHANGE_COLOR.y) - productValue24) * productValue26) + productValue24) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue29 = ((((productValue25 * RD_UNIFORM_CHANGE_COLOR.z) - productValue25) * productValue26) + productValue25) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * ((productValue43 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * ((productValue43 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * ((productValue43 * (varyingColor3.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue8 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue33 = (productValue8 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue34 = (productValue8 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue35 = (productValue8 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue36 = (productValue8 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4;
    float productValue56 = max(0.0f, productValue36 * RD_UNIFORM_CHANGE_COLOR.w);
    float productValue37 = ((((productValue33 * RD_UNIFORM_CHANGE_COLOR.x) - productValue33) * productValue36) + productValue33) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue38 = ((((productValue34 * RD_UNIFORM_CHANGE_COLOR.y) - productValue34) * productValue36) + productValue34) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue39 = ((((productValue35 * RD_UNIFORM_CHANGE_COLOR.z) - productValue35) * productValue36) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue57 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37) * ((productValue56 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue58 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) * ((productValue56 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue59 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * ((productValue56 * (varyingColor3.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float productValue23 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue24 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue47 = RD_UNIFORM_CHANGE_COLOR.x * productValue23;
    float productValue48 = RD_UNIFORM_CHANGE_COLOR.y * productValue23;
    float productValue49 = RD_UNIFORM_CHANGE_COLOR.z * productValue23;
    float scalarValue5 = ceil(productValue24);
    float productValue50 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue47) * scalarValue5) + productValue47);
    float productValue51 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue48) * scalarValue5) + productValue48);
    float productValue52 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue49) * scalarValue5) + productValue49);
    float productValue53 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue50) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue50) * varyingColor3.x;
    float productValue54 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) * varyingColor3.y;
    float productValue55 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue60 = float((((scalarValue1 + scalarValue2) + sampledTextureValue1.z) * (1.0f - scalarValue4)) > 0.0f);
    float productValue61 = (productValue60 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue62 = (productValue60 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue63 = productValue61 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue64 = productValue61 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue65 = productValue61 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue6 = ceil(productValue62);
    float productValue66 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue63) * scalarValue6) + productValue63) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue67 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue64) * scalarValue6) + productValue64) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue68 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue65) * scalarValue6) + productValue65) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue69 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue66) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue66) * varyingColor3.x;
    float productValue70 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue67) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue67) * varyingColor3.y;
    float productValue71 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) * varyingColor3.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float productValue23 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue24 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue47 = RD_UNIFORM_CHANGE_COLOR.x * productValue23;
    float productValue48 = RD_UNIFORM_CHANGE_COLOR.y * productValue23;
    float productValue49 = RD_UNIFORM_CHANGE_COLOR.z * productValue23;
    float scalarValue5 = ceil(productValue24);
    float productValue15 = max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w);
    float productValue50 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue47) * scalarValue5) + productValue47);
    float productValue51 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue48) * scalarValue5) + productValue48);
    float productValue52 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((productValue24 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue49) * scalarValue5) + productValue49);
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue50) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue50) * ((productValue15 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue73 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) * ((productValue15 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue74 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * ((productValue15 * (varyingColor3.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue60 = float((((scalarValue1 + scalarValue2) + sampledTextureValue1.z) * (1.0f - scalarValue4)) > 0.0f);
    float productValue61 = (productValue60 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue62 = (productValue60 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue63 = productValue61 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue64 = productValue61 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue65 = productValue61 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue6 = ceil(productValue62);
    float productValue75 = max(0.0f, (productValue60 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4);
    float productValue66 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue63) * scalarValue6) + productValue63) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue67 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue64) * scalarValue6) + productValue64) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue68 = ((((productValue62 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue65) * scalarValue6) + productValue65) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue76 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue66) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue66) * ((productValue75 * (varyingColor3.x + (-1.0f))) + 1.0f);
    float productValue77 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue67) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue67) * ((productValue75 * (varyingColor3.y + (-1.0f))) + 1.0f);
    float productValue78 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) * ((productValue75 * (varyingColor3.z + (-1.0f))) + 1.0f);
#endif
    float comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue6 = floor(quotientValue1 * 0.25f);
        float productValue7 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = (((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue6 * productValue6) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)))) ? 0.0f : 1.0f;
    }
    else
    {
        comparisonValue = 1.0f;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = (comparisonValue * max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.y = ((varyingColor2.y - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.z = ((varyingColor2.z - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.w = (comparisonValue * max(0.0f, (productValue8 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.y = ((varyingColor2.y - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.z = ((varyingColor2.z - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.w = (comparisonValue * productValue15) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.y = ((varyingColor2.y - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.z = ((varyingColor2.z - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.w = (comparisonValue * productValue19) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.y = ((varyingColor2.y - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.z = ((varyingColor2.z - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.w = (comparisonValue * max(0.0f, productValue26 * RD_UNIFORM_CHANGE_COLOR.w)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue40) * varyingColor2.w) + productValue40;
    fragmentColor0.y = ((varyingColor2.y - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.z = ((varyingColor2.z - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.w = (comparisonValue * max(0.0f, productValue36 * RD_UNIFORM_CHANGE_COLOR.w)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.y = ((varyingColor2.y - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.z = ((varyingColor2.z - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.w = (comparisonValue * productValue43) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.y = ((varyingColor2.y - productValue58) * varyingColor2.w) + productValue58;
    fragmentColor0.z = ((varyingColor2.z - productValue59) * varyingColor2.w) + productValue59;
    fragmentColor0.w = (comparisonValue * productValue56) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.y = ((varyingColor2.y - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.z = ((varyingColor2.z - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.w = (comparisonValue * max(0.0f, sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue69) * varyingColor2.w) + productValue69;
    fragmentColor0.y = ((varyingColor2.y - productValue70) * varyingColor2.w) + productValue70;
    fragmentColor0.z = ((varyingColor2.z - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.w = (comparisonValue * max(0.0f, (productValue60 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4)) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.y = ((varyingColor2.y - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.z = ((varyingColor2.z - productValue74) * varyingColor2.w) + productValue74;
    fragmentColor0.w = (comparisonValue * productValue15) * RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE)
    fragmentColor0.x = ((varyingColor2.x - productValue76) * varyingColor2.w) + productValue76;
    fragmentColor0.y = ((varyingColor2.y - productValue77) * varyingColor2.w) + productValue77;
    fragmentColor0.z = ((varyingColor2.z - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.w = (comparisonValue * productValue75) * RD_UNIFORM_HUD_OPACITY.x;
#endif
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
