// ActorPatternGlint / AlphaTest / fragment forward pipeline.
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
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ActorPatternGlint/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_TINTING == RD_ON
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_FEATURE_TINTING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
#endif
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+24].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+24].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+17].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+17].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyzw;
  workingVector0.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+24].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+24].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+17].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+17].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
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
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+24].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+24].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+17].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+17].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyz;
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, workingVector0.zw).xyz;
  workingVector0.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+24].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+24].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+17].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+17].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector1.xyzw = frac(varyingTexCoord1.xyzw);
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
#endif
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
#if RD_FEATURE_TINTING == RD_ON
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_TINTING == RD_ON
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
#elif RD_FEATURE_TINTING == RD_OFF
    float scalarValue4 = sampledTextureValue.w;
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
        float scalarValue3 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue * productValue) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue3 * scalarValue3) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if RD_FEATURE_TINTING == RD_ON
    if ((sampledTextureValue.w < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif RD_FEATURE_TINTING == RD_OFF
    if ((scalarValue4 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
#if RD_FEATURE_TINTING == RD_ON
    }
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))) > int(0u))
    {
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue7 = 0u;
        intermediateValue8 = scalarValue;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue2;
        float productValue2;
        float productValue3;
        float productValue4;
        for (;;)
        {
            uint sumValue = intermediateValue7 + 24u;
            uint sumValue1 = intermediateValue7 + 17u;
            float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue].z * varyingTexCoord0.x) + fragmentConstants[sumValue].x, (fragmentConstants[sumValue].w * varyingTexCoord0.y) + fragmentConstants[sumValue].y));
            float productValue5 = sampledTextureValue1.w * fragmentConstants[sumValue1].w;
            productValue2 = (((sampledTextureValue1.x * fragmentConstants[sumValue1].x) - intermediateValue8) * productValue5) + intermediateValue8;
            productValue3 = (((sampledTextureValue1.y * fragmentConstants[sumValue1].y) - intermediateValue9) * productValue5) + intermediateValue9;
            productValue4 = (((sampledTextureValue1.z * fragmentConstants[sumValue1].z) - intermediateValue10) * productValue5) + intermediateValue10;
            uint sumValue2 = intermediateValue7 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
            {
                intermediateValue7 = sumValue2;
                intermediateValue8 = productValue2;
                intermediateValue9 = productValue3;
                intermediateValue10 = productValue4;
            }
            else
            {
                break;
            }
        }
        intermediateValue4 = productValue2;
        intermediateValue5 = productValue3;
        intermediateValue6 = productValue4;
    }
    else
    {
        intermediateValue4 = scalarValue;
        intermediateValue5 = scalarValue1;
        intermediateValue6 = scalarValue2;
#endif
    }
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord1.x), frac(varyingTexCoord1.y)));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord1.z), frac(varyingTexCoord1.w)));
    float productValue6 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue7 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue8 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue3.z + sampledTextureValue2.z);
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON)
    float productValue9 = (productValue6 * productValue6) + intermediateValue4;
    float productValue10 = (productValue7 * productValue7) + intermediateValue5;
    float productValue11 = (productValue8 * productValue8) + intermediateValue6;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF)
    float productValue12 = (productValue6 * productValue6) + (intermediateValue4 * varyingColor3.x);
    float productValue13 = (productValue7 * productValue7) + (intermediateValue5 * varyingColor3.y);
    float productValue14 = (productValue8 * productValue8) + (intermediateValue6 * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.y = ((varyingColor2.y - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.z = ((varyingColor2.z - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON)
    float productValue15 = (productValue6 * productValue6) + sampledTextureValue.x;
    float productValue16 = (productValue7 * productValue7) + sampledTextureValue.y;
    float productValue17 = (productValue8 * productValue8) + sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor2.x - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.y = ((varyingColor2.y - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.z = ((varyingColor2.z - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * scalarValue4;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF)
    float productValue18 = (productValue6 * productValue6) + (sampledTextureValue.x * varyingColor3.x);
    float productValue19 = (productValue7 * productValue7) + (sampledTextureValue.y * varyingColor3.y);
    float productValue20 = (productValue8 * productValue8) + (sampledTextureValue.z * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.y = ((varyingColor2.y - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.z = ((varyingColor2.z - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * scalarValue4;
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
