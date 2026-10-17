// ActorGlint / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ActorGlint/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
  float4 workingVector0,workingVector1,workingVector2;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
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
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
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
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector1.z = 1 + -workingVector1.w;
  workingVector0.z = workingVector1.z * workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xyw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyw + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.zzz * workingVector0.xyw + workingVector1.xyw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector1.z = 1 + -workingVector1.w;
  workingVector0.w = workingVector1.z * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz + -workingVector1.xyw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < RD_UNIFORM_ACTOR_FP_EPSILON.x);
#endif
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
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
  fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, workingVector0.w);
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
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
  workingVector1.x = RD_UNIFORM_CHANGE_COLOR.w * workingVector0.w;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, workingVector1.x);
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
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
  workingVector0.w = workingVector0.w ? workingVector1.y : 0;
  workingVector0.w = (int)workingVector1.x | (int)workingVector0.w;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, workingVector0.z);
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF || RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyw;
  workingVector0.xyz = -workingVector0.xyw * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
#endif
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.xyz = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector1.zw).xyz;
#endif
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  workingVector0.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.x;
    float scalarValue2 = sampledTextureValue3.y;
    float scalarValue3 = sampledTextureValue3.z;
    float scalarValue4 = sampledTextureValue3.w;
    float productValue12 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue13 = (productValue12 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue20 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue21 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue22 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.x;
    float scalarValue2 = sampledTextureValue3.y;
    float scalarValue3 = sampledTextureValue3.z;
    float scalarValue4 = sampledTextureValue3.w;
    float productValue12 = float((((scalarValue1 + scalarValue2) + scalarValue3) * (1.0f - scalarValue4)) > 0.0f);
    float productValue29 = (productValue12 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue30 = (productValue12 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue31 = (productValue12 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3;
    float productValue13 = (productValue12 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue20 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue21 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.x;
    float scalarValue2 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.w;
    float productValue47 = float((((scalarValue1 + scalarValue2) + sampledTextureValue3.z) * (1.0f - scalarValue4)) > 0.0f);
    float productValue48 = (productValue47 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1;
    float productValue49 = (productValue47 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2;
    float productValue50 = (productValue47 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue4)) + scalarValue4;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if ((productValue < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if ((productValue13 < 0.5f) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    if ((productValue13 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((productValue50 < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue3 = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue4 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue5 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue14 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((productValue12 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue1)) + scalarValue1);
    float productValue15 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((productValue12 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue2)) + scalarValue2);
    float productValue16 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((productValue12 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue3)) + scalarValue3);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue23 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue20) - productValue20) * productValue) + productValue20) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue24 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue21) - productValue21) * productValue) + productValue21) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue25 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue22) - productValue22) * productValue) + productValue22) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue32 = ((((RD_UNIFORM_CHANGE_COLOR.x * productValue29) - productValue29) * productValue13) + productValue29) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue33 = ((((RD_UNIFORM_CHANGE_COLOR.y * productValue30) - productValue30) * productValue13) + productValue30) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue34 = ((((RD_UNIFORM_CHANGE_COLOR.z * productValue31) - productValue31) * productValue13) + productValue31) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue38 = RD_UNIFORM_CHANGE_COLOR.x * productValue20;
    float productValue39 = RD_UNIFORM_CHANGE_COLOR.y * productValue20;
    float productValue40 = RD_UNIFORM_CHANGE_COLOR.z * productValue20;
    float scalarValue5 = ceil(productValue21);
    float productValue41 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue21) - productValue38) * scalarValue5) + productValue38);
    float productValue42 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue21) - productValue39) * scalarValue5) + productValue39);
    float productValue43 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue21) - productValue40) * scalarValue5) + productValue40);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue51 = RD_UNIFORM_CHANGE_COLOR.x * productValue48;
    float productValue52 = RD_UNIFORM_CHANGE_COLOR.y * productValue48;
    float productValue53 = RD_UNIFORM_CHANGE_COLOR.z * productValue48;
    float scalarValue6 = ceil(productValue49);
    float productValue54 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x * productValue49) - productValue51) * scalarValue6) + productValue51);
    float productValue55 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y * productValue49) - productValue52) * scalarValue6) + productValue52);
    float productValue56 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * ((((RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z * productValue49) - productValue53) * scalarValue6) + productValue53);
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue6 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue7 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue8 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue9 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor3.x);
    float productValue10 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor3.y);
    float productValue11 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, productValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue17 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor3.x);
    float productValue18 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor3.y);
    float productValue19 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.y = ((varyingColor2.y - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.z = ((varyingColor2.z - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, productValue13);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue26 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor3.x);
    float productValue27 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor3.y);
    float productValue28 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.y = ((varyingColor2.y - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.z = ((varyingColor2.z - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, RD_UNIFORM_CHANGE_COLOR.w * productValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue35 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue32) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue32) * varyingColor3.x);
    float productValue36 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.y);
    float productValue37 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.y = ((varyingColor2.y - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.z = ((varyingColor2.z - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, RD_UNIFORM_CHANGE_COLOR.w * productValue13);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue44 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.x);
    float productValue45 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue42) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue42) * varyingColor3.y);
    float productValue46 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue43) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue43) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.y = ((varyingColor2.y - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.z = ((varyingColor2.z - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, productValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue57 = (productValue6 * productValue6) + ((((RD_UNIFORM_OVERLAY_COLOR.x - productValue54) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue54) * varyingColor3.x);
    float productValue58 = (productValue7 * productValue7) + ((((RD_UNIFORM_OVERLAY_COLOR.y - productValue55) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue55) * varyingColor3.y);
    float productValue59 = (productValue8 * productValue8) + ((((RD_UNIFORM_OVERLAY_COLOR.z - productValue56) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue56) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.y = ((varyingColor2.y - productValue58) * varyingColor2.w) + productValue58;
    fragmentColor0.z = ((varyingColor2.z - productValue59) * varyingColor2.w) + productValue59;
    fragmentColor0.w = max(RD_UNIFORM_USE_ALPHA_REWRITE.x, productValue50);
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
