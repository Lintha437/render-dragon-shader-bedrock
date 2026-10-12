// MeshFallbackPosUVNormalColor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 72
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/MeshFallbackPosUVNormalColor/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor3 : COLOR3,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
#if RD_FEATURE_USE_TEXTURES == RD_ON
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  float4 varyingTexCoord0 : TEXCOORD0,
#endif
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  float4 workingVector0,workingVector1,workingVector2;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyz = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.w = 1;
  workingVector0.xyzw = workingVector2.xyzw * workingVector0.xyzw;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector2.xyzw * workingVector0.xyzw;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyz = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + float3(1,1,1);
  workingVector0.w = 1;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector2.xyzw * workingVector0.xyzw;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector0.w = 1;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + float3(1,1,1);
  workingVector0.yzw = varyingColor0.xyz * workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector1.w = 1;
  workingVector1.xyzw = workingVector3.xyzw * workingVector1.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector0.yzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + float3(1,1,1);
  workingVector1.w = 1;
  workingVector1.xyzw = varyingColor1.xyzw * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector1.xyzw = workingVector3.xyzw * workingVector1.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.w = 1;
  workingVector1.xyzw = varyingColor1.xyzw * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    workingVector0.z = RD_COMPARISON_MASK(1 < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector0.y = (int)workingVector0.y | (int)workingVector0.z;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + float3(1,1,1);
  workingVector0.yzw = varyingColor0.xyz * workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector1.w = 1;
  workingVector1.xyzw = workingVector3.xyzw * workingVector1.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    workingVector0.z = RD_COMPARISON_MASK(1 < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector0.y = (int)workingVector0.y | (int)workingVector0.z;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector0.yzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    workingVector0.z = RD_COMPARISON_MASK(1 < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector0.y = (int)workingVector0.y | (int)workingVector0.z;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = float3(-1,-1,-1) + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + float3(1,1,1);
  workingVector1.w = 1;
  workingVector1.xyzw = varyingColor1.xyzw * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector1.xyzw = workingVector3.xyzw * workingVector1.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector0.x == 0) {
    workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
    workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
    workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector0.z;
    workingVector0.w = 1 / workingVector0.w;
    workingVector0.z = saturate(workingVector0.z * workingVector0.w);
    workingVector0.w = workingVector0.z * -2 + 3;
    workingVector0.z = workingVector0.z * workingVector0.z;
    workingVector0.z = workingVector0.w * workingVector0.z;
    workingVector1.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
    workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.xy;
    workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
    workingVector2.xyzw = floor(workingVector2.xyzw);
    workingVector1.zw = workingVector2.yw * workingVector2.yw;
    workingVector1.zw = float2(0.75,0.75) * workingVector1.zw;
    workingVector1.zw = workingVector2.xz * float2(0.5,0.5) + workingVector1.zw;
    workingVector1.zw = frac(workingVector1.zw);
    workingVector0.w = workingVector1.z * 0.25 + workingVector1.w;
    workingVector1.xy = floor(workingVector1.xy);
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = 0.75 * workingVector1.y;
    workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
    workingVector1.x = frac(workingVector1.x);
    workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
    workingVector0.w = workingVector0.w * 64 + 0.5;
    workingVector0.w = 0.015625 * workingVector0.w;
    workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
    workingVector0.y = workingVector0.z ? workingVector0.y : 0;
    workingVector0.z = RD_COMPARISON_MASK(1 < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector0.y = (int)workingVector0.y | (int)workingVector0.z;
    if (workingVector0.y != 0) discard;
  }
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + RD_UNIFORM_CHANGE_COLOR.xyz;
  workingVector1.w = 1;
  workingVector1.xyzw = varyingColor1.xyzw * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector0.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector2.xyzw : workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector1.xyz;
  workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.w = 1;
  workingVector0.xyzw = workingVector2.xxxx ? workingVector1.xyzw : workingVector0.xyzw;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(0 >= workingVector0.w);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  if (workingVector1.x == 0) {
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
    workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
    workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
    workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
    workingVector1.z = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.z = rsqrt(workingVector1.z);
    workingVector2.xyz = workingVector2.xyz * workingVector1.zzz;
    workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
    workingVector1.z = dot(-workingVector2.xyz, workingVector3.xyz);
    workingVector1.w = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
    workingVector1.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.z;
    workingVector1.w = 1 / workingVector1.w;
    workingVector1.z = saturate(workingVector1.z * workingVector1.w);
    workingVector1.w = workingVector1.z * -2 + 3;
    workingVector1.z = workingVector1.z * workingVector1.z;
    workingVector1.z = workingVector1.w * workingVector1.z;
    workingVector2.xy = varyingColor3.xy / varyingColor3.ww;
    workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector2.xy;
    workingVector2.xy = workingVector2.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
    workingVector2.xy = floor(workingVector2.xy);
    workingVector2.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector2.xy;
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
    workingVector1.z = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
    workingVector1.y = (int)workingVector1.y | (int)workingVector1.z;
    if (workingVector1.y != 0) discard;
  }
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.yzw;
  workingVector1.yzw = workingVector2.xxx * workingVector2.yzw + workingVector1.yzw;
  workingVector2.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector1.yzw;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector2.xyz + workingVector1.yzw;
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.yzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.yzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#endif
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
#if (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED || RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED


#endif
void executeFragmentStage()
{
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = ((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue;
    float productValue1 = ((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1;
    float productValue2 = ((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2;
    float productValue13 = productValue * varyingColor0.x;
    float productValue14 = productValue1 * varyingColor0.y;
    float productValue15 = productValue2 * varyingColor0.z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue25 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
    float productValue26 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23;
    float productValue27 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float productValue28 = ((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x;
    float productValue29 = ((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y;
    float productValue30 = ((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z;
    float productValue3;
    float productValue4;
    float productValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue) * varyingColor1.x;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1) * varyingColor1.y;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2) * varyingColor1.z;
    float productValue34 = sampledTextureValue.w * varyingColor1.w;
    float productValue35 = productValue31 * varyingColor0.x;
    float productValue36 = productValue32 * varyingColor0.y;
    float productValue37 = productValue33 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    float intermediateValue3;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.x;
    float productValue39 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.y;
    float productValue40 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.z;
    float productValue41 = productValue38 * varyingColor0.x;
    float productValue42 = productValue39 * varyingColor0.y;
    float productValue43 = productValue40 * varyingColor0.z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor1.x;
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor1.y;
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor1.z;
    float productValue34 = sampledTextureValue.w * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue3;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x) * varyingColor1.x;
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y) * varyingColor1.y;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue3 <= 0.0f) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue = ((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue;
    float productValue1 = ((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1;
    float productValue2 = ((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2;
    float productValue13 = productValue * varyingColor0.x;
    float productValue14 = productValue1 * varyingColor0.y;
    float productValue15 = productValue2 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    float intermediateValue1;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue3 <= 0.0f) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue25 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
    float productValue26 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23;
    float productValue27 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue28 = ((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x;
    float productValue29 = ((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y;
    float productValue30 = ((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z;
    float productValue3;
    float productValue4;
    float productValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue3 <= 0.0f) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue) * varyingColor1.x;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1) * varyingColor1.y;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2) * varyingColor1.z;
    float productValue52 = scalarValue3 * varyingColor1.w;
    float productValue35 = productValue31 * varyingColor0.x;
    float productValue36 = productValue32 * varyingColor0.y;
    float productValue37 = productValue33 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.x;
    float productValue39 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.y;
    float productValue40 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.z;
    float productValue41 = productValue38 * varyingColor0.x;
    float productValue42 = productValue39 * varyingColor0.y;
    float productValue43 = productValue40 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue1;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue3 <= 0.0f) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor1.x;
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor1.y;
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor1.z;
    float productValue52 = scalarValue3 * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x) * varyingColor1.x;
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y) * varyingColor1.y;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue3 < RD_UNIFORM_DISCARD_VALUE.x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue = ((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue;
    float productValue1 = ((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1;
    float productValue2 = ((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2;
    float productValue13 = productValue * varyingColor0.x;
    float productValue14 = productValue1 * varyingColor0.y;
    float productValue15 = productValue2 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (RD_UNIFORM_DISCARD_VALUE.x > 1.0f))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    float intermediateValue1;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue3 < RD_UNIFORM_DISCARD_VALUE.x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue25 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22;
    float productValue26 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23;
    float productValue27 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (RD_UNIFORM_DISCARD_VALUE.x > 1.0f))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue28 = ((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x;
    float productValue29 = ((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y;
    float productValue30 = ((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z;
    float productValue3;
    float productValue4;
    float productValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue3 < RD_UNIFORM_DISCARD_VALUE.x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue) * varyingColor1.x;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1) * varyingColor1.y;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2) * varyingColor1.z;
    float productValue52 = scalarValue3 * varyingColor1.w;
    float productValue35 = productValue31 * varyingColor0.x;
    float productValue36 = productValue32 * varyingColor0.y;
    float productValue37 = productValue33 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (RD_UNIFORM_DISCARD_VALUE.x > 1.0f))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.x + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.x;
    float productValue39 = (((RD_UNIFORM_OVERLAY_COLOR.y + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.y;
    float productValue40 = (((RD_UNIFORM_OVERLAY_COLOR.z + (-1.0f)) * RD_UNIFORM_OVERLAY_COLOR.w) + 1.0f) * varyingColor1.z;
    float productValue41 = productValue38 * varyingColor0.x;
    float productValue42 = productValue39 * varyingColor0.y;
    float productValue43 = productValue40 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue1;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue3 < RD_UNIFORM_DISCARD_VALUE.x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue19 = scalarValue * varyingColor0.x;
    float productValue20 = scalarValue * varyingColor0.y;
    float productValue21 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    float productValue22 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue19) * scalarValue4) + productValue19;
    float productValue23 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue20) * scalarValue4) + productValue20;
    float productValue24 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue21) * scalarValue4) + productValue21;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) * varyingColor1.x;
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor1.y;
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor1.z;
    float productValue52 = scalarValue3 * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue4;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    isFragmentDiscarded = false;
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
    {
        bool comparisonValue;
        if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
        {
            float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
            float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
            float productValue50 = floor(quotientValue1 * 0.25f);
            float productValue51 = floor(quotientValue1 * 0.5f);
            float scalarValue5 = floor(quotientValue1);
            comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue51 * productValue51) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue50 * productValue50) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (RD_UNIFORM_DISCARD_VALUE.x > 1.0f))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_CHANGE_COLOR.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.x) * varyingColor1.x;
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_CHANGE_COLOR.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.y) * varyingColor1.y;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_CHANGE_COLOR.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_CHANGE_COLOR.z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
#endif
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue6 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue13 - productValue) * scalarValue3) + productValue);
        productValue7 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue14 - productValue1) * scalarValue3) + productValue1);
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue15 - productValue2) * scalarValue3) + productValue2);
        intermediateValue4 = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue3 = (productValue16 * RD_UNIFORM_CURRENT_COLOR.x) * varyingColor0.w;
        productValue4 = (productValue17 * RD_UNIFORM_CURRENT_COLOR.y) * varyingColor0.w;
        productValue5 = (productValue18 * RD_UNIFORM_CURRENT_COLOR.z) * varyingColor0.w;
        intermediateValue = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        productValue9 = (((((productValue25 * varyingColor0.x) - productValue25) * scalarValue3) + productValue25) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue10 = (((((productValue26 * varyingColor0.y) - productValue26) * scalarValue3) + productValue26) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue11 = (((((productValue27 * varyingColor0.z) - productValue27) * scalarValue3) + productValue27) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue4 = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue3 = ((productValue28 * varyingColor0.w) * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue4 = ((productValue29 * varyingColor0.w) * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue5 = ((productValue30 * varyingColor0.w) * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue7 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue35 - productValue31) * productValue34) + productValue31);
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue36 - productValue32) * productValue34) + productValue32);
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue37 - productValue33) * productValue34) + productValue33);
        intermediateValue3 = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue6 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue41 - productValue38) * varyingColor1.w) + productValue38);
        productValue7 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue42 - productValue39) * varyingColor1.w) + productValue39);
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue43 - productValue40) * varyingColor1.w) + productValue40);
        intermediateValue = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue10 = (((((productValue44 * varyingColor0.x) - productValue44) * productValue34) + productValue44) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue11 = (((((productValue45 * varyingColor0.y) - productValue45) * productValue34) + productValue45) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue12 = (((((productValue46 * varyingColor0.z) - productValue46) * productValue34) + productValue46) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue3 = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue3 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * ((((varyingColor0.x * productValue47) - productValue47) * varyingColor1.w) + productValue47);
        productValue4 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * ((((varyingColor0.y * productValue48) - productValue48) * varyingColor1.w) + productValue48);
        productValue5 = (((((varyingColor0.z * productValue49) - productValue49) * varyingColor1.w) + productValue49) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue13 - productValue) * scalarValue3) + productValue);
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue14 - productValue1) * scalarValue3) + productValue1);
        productValue10 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue15 - productValue2) * scalarValue3) + productValue2);
        intermediateValue5 = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue5 = (productValue16 * RD_UNIFORM_CURRENT_COLOR.x) * varyingColor0.w;
        productValue6 = (productValue17 * RD_UNIFORM_CURRENT_COLOR.y) * varyingColor0.w;
        productValue7 = (productValue18 * RD_UNIFORM_CURRENT_COLOR.z) * varyingColor0.w;
        intermediateValue1 = 1.0f;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue3 = ((varyingColor0.w * varyingColor0.x) * productValue28) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue4 = ((varyingColor0.w * varyingColor0.y) * productValue29) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue5 = ((varyingColor0.w * varyingColor0.z) * productValue30) * RD_UNIFORM_CURRENT_COLOR.z;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue35 - productValue31) * productValue52) + productValue31);
        productValue10 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue36 - productValue32) * productValue52) + productValue32);
        productValue11 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue37 - productValue33) * productValue52) + productValue33);
        intermediateValue5 = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue41 - productValue38) * varyingColor1.w) + productValue38);
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue42 - productValue39) * varyingColor1.w) + productValue39);
        productValue10 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue43 - productValue40) * varyingColor1.w) + productValue40);
        intermediateValue1 = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue10 = (((((productValue44 * varyingColor0.x) - productValue44) * productValue52) + productValue44) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue11 = (((((productValue45 * varyingColor0.y) - productValue45) * productValue52) + productValue45) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue12 = (((((productValue46 * varyingColor0.z) - productValue46) * productValue52) + productValue46) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue4 = 1.0f;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue3 = (((((productValue47 * varyingColor0.x) - productValue47) * varyingColor1.w) + productValue47) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.x;
        productValue4 = (((((productValue48 * varyingColor0.y) - productValue48) * varyingColor1.w) + productValue48) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.y;
        productValue5 = (((((productValue49 * varyingColor0.z) - productValue49) * varyingColor1.w) + productValue49) * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue = 1.0f;
#endif
    }
    else
    {
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue6 = productValue13 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue7 = productValue14 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue8 = productValue15 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue4 = (scalarValue3 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue3 = productValue16 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue4 = productValue17 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue5 = productValue18 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue = RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        productValue9 = productValue25;
        productValue10 = productValue26;
        productValue11 = productValue27;
        intermediateValue4 = scalarValue3;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        productValue3 = productValue28;
        productValue4 = productValue29;
        productValue5 = productValue30;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue7 = productValue35 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue8 = productValue36 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue9 = productValue37 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue3 = (productValue34 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue6 = productValue41 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue7 = productValue42 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue8 = productValue43 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue = (varyingColor0.w * varyingColor1.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
        productValue10 = productValue44;
        productValue11 = productValue45;
        productValue12 = productValue46;
        intermediateValue3 = productValue34;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        productValue3 = productValue47;
        productValue4 = productValue48;
        productValue5 = productValue49;
        intermediateValue = varyingColor1.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue8 = productValue13 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue9 = productValue14 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue10 = productValue15 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue5 = (scalarValue3 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue5 = productValue16 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue6 = productValue17 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue7 = productValue18 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue1 = RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue9 = productValue35 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue10 = productValue36 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue11 = productValue37 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue5 = (productValue52 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue8 = productValue41 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue9 = productValue42 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue10 = productValue43 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue1 = (varyingColor0.w * varyingColor1.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
        productValue10 = productValue44;
        productValue11 = productValue45;
        productValue12 = productValue46;
        intermediateValue4 = productValue52;
#endif
    }
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue3;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF)
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue3;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.y = ((varyingColor2.y - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.z = ((varyingColor2.z - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED)
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue;
    discardIfRequested();
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor3 = stage_input.varyingColor3;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
