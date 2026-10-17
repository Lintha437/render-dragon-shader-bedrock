// ActorMultiTexturePrepass / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 8
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
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector2.x = 1 + -workingVector1.w;
  workingVector0.w = workingVector2.x * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + workingVector2.xyz;
  workingVector0.xyz = workingVector2.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector2.x = 1 + -workingVector1.w;
  workingVector0.w = workingVector2.x * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
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
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
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
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
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
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector0.w = 1 + -workingVector1.w;
  workingVector0.z = workingVector0.z * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy + -workingVector1.xy;
  workingVector0.xy = workingVector0.zz * workingVector0.xy + workingVector1.xy;
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
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_ACTOR_FP_EPSILON.x < workingVector1.w);
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector0.w = 1 + -workingVector1.w;
  workingVector0.z = workingVector0.z * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy + -workingVector1.xy;
  workingVector0.xy = workingVector0.zz * workingVector0.xy + workingVector1.xy;
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
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue69 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue70 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue69) + productValue;
    float productValue71 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue69) + productValue1;
    float productValue72 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue69) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue114 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue115 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue116 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue29 = ceil(productValue1);
    float productValue117 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue114) * scalarValue29) + productValue114;
    float productValue118 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue115) * scalarValue29) + productValue115;
    float productValue119 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue116) * scalarValue29) + productValue116;
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_MASKED_MULTITEXTURE == RD_ON
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
#endif
    float scalarValue = sampledTextureValue1.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue12 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue13 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
    float productValue14 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue32 = productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9);
    float productValue33 = productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10);
    float productValue34 = productValue31 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue11);
    float productValue35 = (productValue32 + scalarValue9) - (productValue32 * scalarValue);
    float productValue36 = (productValue33 + scalarValue10) - (productValue33 * scalarValue);
    float productValue37 = (productValue34 + scalarValue11) - (productValue34 * scalarValue);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue32 = productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9);
    float productValue33 = productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10);
    float productValue34 = productValue31 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue11);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue73 = ((sampledTextureValue1.x - productValue70) * scalarValue) + productValue70;
    float productValue74 = ((sampledTextureValue1.y - productValue71) * scalarValue) + productValue71;
    float productValue75 = ((sampledTextureValue1.z - productValue72) * scalarValue) + productValue72;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue83 = (productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9)) + scalarValue9;
    float productValue84 = (productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10)) + scalarValue10;
    float productValue85 = (productValue31 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue11)) + scalarValue11;
    float productValue86 = (productValue31 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue87 = (((productValue83 * RD_UNIFORM_CHANGE_COLOR.x) - productValue83) * productValue86) + productValue83;
    float productValue88 = (((productValue84 * RD_UNIFORM_CHANGE_COLOR.y) - productValue84) * productValue86) + productValue84;
    float productValue89 = (((productValue85 * RD_UNIFORM_CHANGE_COLOR.z) - productValue85) * productValue86) + productValue85;
    float productValue90 = ((scalarValue9 - productValue87) * scalarValue) + productValue87;
    float productValue91 = ((scalarValue10 - productValue88) * scalarValue) + productValue88;
    float productValue92 = ((scalarValue11 - productValue89) * scalarValue) + productValue89;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue83 = (productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9)) + scalarValue9;
    float productValue84 = (productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10)) + scalarValue10;
    float productValue85 = (productValue31 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue11)) + scalarValue11;
    float productValue86 = (productValue31 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue)) + scalarValue;
    float productValue87 = (((productValue83 * RD_UNIFORM_CHANGE_COLOR.x) - productValue83) * productValue86) + productValue83;
    float productValue88 = (((productValue84 * RD_UNIFORM_CHANGE_COLOR.y) - productValue84) * productValue86) + productValue84;
    float productValue89 = (((productValue85 * RD_UNIFORM_CHANGE_COLOR.z) - productValue85) * productValue86) + productValue85;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue120 = ((sampledTextureValue1.x - productValue117) * scalarValue) + productValue117;
    float productValue121 = ((sampledTextureValue1.y - productValue118) * scalarValue) + productValue118;
    float productValue122 = ((sampledTextureValue1.z - productValue119) * scalarValue) + productValue119;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue83 = (productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9)) + scalarValue9;
    float productValue84 = (productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10)) + scalarValue10;
    float productValue135 = productValue83 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue136 = productValue83 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue137 = productValue83 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue32 = ceil(productValue84);
    float productValue138 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue135) * scalarValue32) + productValue135;
    float productValue139 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue136) * scalarValue32) + productValue136;
    float productValue140 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue137) * scalarValue32) + productValue137;
    float productValue141 = ((scalarValue9 - productValue138) * scalarValue) + productValue138;
    float productValue142 = ((scalarValue10 - productValue139) * scalarValue) + productValue139;
    float productValue143 = ((scalarValue11 - productValue140) * scalarValue) + productValue140;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue31 = float((((scalarValue9 + scalarValue10) + scalarValue11) * (1.0f - scalarValue)) > 0.0f);
    float productValue83 = (productValue31 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue9)) + scalarValue9;
    float productValue84 = (productValue31 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue10)) + scalarValue10;
    float productValue135 = productValue83 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue136 = productValue83 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue137 = productValue83 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue32 = ceil(productValue84);
    float productValue138 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue135) * scalarValue32) + productValue135;
    float productValue139 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue136) * scalarValue32) + productValue136;
    float productValue140 = (((productValue84 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue137) * scalarValue32) + productValue137;
#endif
    float4 sampledTextureValue2 = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON
    float scalarValue14 = sampledTextureValue2.x;
    float scalarValue15 = sampledTextureValue2.y;
    float scalarValue16 = sampledTextureValue2.z;
#endif
    float scalarValue1 = sampledTextureValue2.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue15 = (((sampledTextureValue2.x - productValue12) * scalarValue1) + productValue12) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue16 = (((sampledTextureValue2.y - productValue13) * scalarValue1) + productValue13) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue17 = (((sampledTextureValue2.z - productValue14) * scalarValue1) + productValue14) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue38 = (((sampledTextureValue2.x - productValue35) * scalarValue1) + productValue35) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue39 = (((sampledTextureValue2.y - productValue36) * scalarValue1) + productValue36) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue40 = (((sampledTextureValue2.z - productValue37) * scalarValue1) + productValue37) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue3;
    float productValue4;
    float productValue5;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue3 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue14) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue15) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue16) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue3 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
        productValue4 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
        productValue5 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    }
    float productValue50 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue3;
    float productValue51 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue4;
    float productValue52 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue4 = (((RD_UNIFORM_CHANGE_COLOR.x * scalarValue14) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue5 = (((RD_UNIFORM_CHANGE_COLOR.y * scalarValue15) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue6 = (((RD_UNIFORM_CHANGE_COLOR.z * scalarValue16) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue4 = (productValue32 + scalarValue9) - (productValue32 * scalarValue);
        productValue5 = (productValue33 + scalarValue10) - (productValue33 * scalarValue);
        productValue6 = (productValue34 + scalarValue11) - (productValue34 * scalarValue);
    }
    float productValue57 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue4;
    float productValue58 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue5;
    float productValue59 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue6;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue76 = (((sampledTextureValue2.x - productValue73) * scalarValue1) + productValue73) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue77 = (((sampledTextureValue2.y - productValue74) * scalarValue1) + productValue74) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue78 = (((sampledTextureValue2.z - productValue75) * scalarValue1) + productValue75) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue93 = (((sampledTextureValue2.x - productValue90) * scalarValue1) + productValue90) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue94 = (((sampledTextureValue2.y - productValue91) * scalarValue1) + productValue91) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue95 = (((sampledTextureValue2.z - productValue92) * scalarValue1) + productValue92) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue7;
    float productValue8;
    float productValue9;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue7 = (((scalarValue14 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue8 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue9 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue7 = ((sampledTextureValue1.x - productValue70) * scalarValue) + productValue70;
        productValue8 = ((sampledTextureValue1.y - productValue71) * scalarValue) + productValue71;
        productValue9 = ((sampledTextureValue1.z - productValue72) * scalarValue) + productValue72;
    }
    float productValue100 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue7;
    float productValue101 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue8;
    float productValue102 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue9;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue14 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue9 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue10 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue8 = ((scalarValue9 - productValue87) * scalarValue) + productValue87;
        productValue9 = ((scalarValue10 - productValue88) * scalarValue) + productValue88;
        productValue10 = ((scalarValue11 - productValue89) * scalarValue) + productValue89;
    }
    float productValue107 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue108 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue109 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue123 = (((sampledTextureValue2.x - productValue120) * scalarValue1) + productValue120) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue124 = (((sampledTextureValue2.y - productValue121) * scalarValue1) + productValue121) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue125 = (((sampledTextureValue2.z - productValue122) * scalarValue1) + productValue122) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue144 = (((sampledTextureValue2.x - productValue141) * scalarValue1) + productValue141) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue145 = (((sampledTextureValue2.y - productValue142) * scalarValue1) + productValue142) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue146 = (((sampledTextureValue2.z - productValue143) * scalarValue1) + productValue143) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue8 = (((scalarValue14 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue9 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue10 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue117) * scalarValue) + productValue117;
        productValue9 = ((sampledTextureValue1.y - productValue118) * scalarValue) + productValue118;
        productValue10 = ((sampledTextureValue1.z - productValue119) * scalarValue) + productValue119;
    }
    float productValue107 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue8;
    float productValue108 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue9;
    float productValue109 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > RD_UNIFORM_ACTOR_FP_EPSILON.x)
    {
        productValue9 = (((scalarValue14 * RD_UNIFORM_CHANGE_COLOR.x) - scalarValue14) * scalarValue1) + scalarValue14;
        productValue10 = (((scalarValue15 * RD_UNIFORM_CHANGE_COLOR.y) - scalarValue15) * scalarValue1) + scalarValue15;
        productValue11 = (((scalarValue16 * RD_UNIFORM_CHANGE_COLOR.z) - scalarValue16) * scalarValue1) + scalarValue16;
    }
    else
    {
        productValue9 = ((scalarValue9 - productValue138) * scalarValue) + productValue138;
        productValue10 = ((scalarValue10 - productValue139) * scalarValue) + productValue139;
        productValue11 = ((scalarValue11 - productValue140) * scalarValue) + productValue140;
    }
    float productValue160 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * productValue9;
    float productValue161 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * productValue10;
    float productValue162 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * productValue11;
#endif
    uint scalarValue2 = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#endif
    if ((scalarValue2 & 1u) == 0u)
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue4 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue10 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue5 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue8 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue10 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue11 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue4 = sampledTextureValue3.x;
        intermediateValue5 = sampledTextureValue3.y;
        intermediateValue6 = sampledTextureValue3.z;
        intermediateValue7 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue10 = sampledTextureValue3.x;
        intermediateValue11 = sampledTextureValue3.y;
        intermediateValue12 = sampledTextureValue3.z;
        intermediateValue13 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue11 = sampledTextureValue3.x;
        intermediateValue12 = sampledTextureValue3.y;
        intermediateValue13 = sampledTextureValue3.z;
        intermediateValue14 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
#endif
    if ((scalarValue2 & 28u) == 0u)
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
#endif
        if ((scalarValue2 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue2 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue2 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount549;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount549);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount561;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount561);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount566;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount566);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount578;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount578);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount570;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount570);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount588;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount588);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount581;
                    uint2 vectorValue13 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount581);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount599;
                    uint2 vectorValue15 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount599);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount574;
                    uint2 vectorValue17 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount574);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount586;
                    uint2 vectorValue19 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount586);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount585;
                    uint2 vectorValue21 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount585);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount597;
                    uint2 vectorValue23 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount597);
#endif
                    float4 sampledTextureValue4 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue18 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue19 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue18 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue18 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue1 = (((productValue19 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue19 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue;
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float inverseLengthValue = rsqrt(dot(float3(comparisonValue2, comparisonValue3, 0.25f), float3(comparisonValue2, comparisonValue3, 0.25f)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue3 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue41 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue42 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue6 = (((productValue41 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue41 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue7 = (((productValue42 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue42 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue8 = ((abs(comparisonValue6) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue6;
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, 0.25f), float3(comparisonValue8, comparisonValue9, 0.25f)));
                    branchMergedValue3 = comparisonValue8 * inverseLengthValue7;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue7;
                    branchMergedValue5 = inverseLengthValue7 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue53 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue54 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue10 = (((productValue53 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue53 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue11 = (((productValue54 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue54 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue12 = ((abs(comparisonValue10) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue10;
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float inverseLengthValue12 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, 0.25f), float3(comparisonValue12, comparisonValue13, 0.25f)));
                    branchMergedValue3 = comparisonValue12 * inverseLengthValue12;
                    branchMergedValue4 = comparisonValue13 * inverseLengthValue12;
                    branchMergedValue5 = inverseLengthValue12 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue60 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue61 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue14 = (((productValue60 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue60 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue15 = (((productValue61 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue61 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float inverseLengthValue14 = rsqrt(dot(float3(comparisonValue16, comparisonValue17, 0.25f), float3(comparisonValue16, comparisonValue17, 0.25f)));
                    branchMergedValue3 = comparisonValue16 * inverseLengthValue14;
                    branchMergedValue4 = comparisonValue17 * inverseLengthValue14;
                    branchMergedValue5 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue79 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue80 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue18 = (((productValue79 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue79 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue19 = (((productValue80 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue80 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue20 = ((abs(comparisonValue18) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue18;
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float inverseLengthValue19 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, 0.25f), float3(comparisonValue20, comparisonValue21, 0.25f)));
                    branchMergedValue3 = comparisonValue20 * inverseLengthValue19;
                    branchMergedValue4 = comparisonValue21 * inverseLengthValue19;
                    branchMergedValue5 = inverseLengthValue19 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue96 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue97 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue22 = (((productValue96 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue96 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue23 = (((productValue97 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue97 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue24 = ((abs(comparisonValue22) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue22;
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float inverseLengthValue21 = rsqrt(dot(float3(comparisonValue24, comparisonValue25, 0.25f), float3(comparisonValue24, comparisonValue25, 0.25f)));
                    branchMergedValue3 = comparisonValue24 * inverseLengthValue21;
                    branchMergedValue4 = comparisonValue25 * inverseLengthValue21;
                    branchMergedValue5 = inverseLengthValue21 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue103 = frac(float(int(uint(int(float(int(vectorValue13.x)))))) * varyingTexCoord0.x);
                    float productValue104 = frac(float(int(uint(int(float(int(vectorValue13.y)))))) * varyingTexCoord0.y);
                    float comparisonValue26 = (((productValue103 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue103 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue27 = (((productValue104 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue104 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue28 = ((abs(comparisonValue26) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue26;
                    float comparisonValue29 = ((abs(comparisonValue27) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue27;
                    float inverseLengthValue23 = rsqrt(dot(float3(comparisonValue28, comparisonValue29, 0.25f), float3(comparisonValue28, comparisonValue29, 0.25f)));
                    branchMergedValue3 = comparisonValue28 * inverseLengthValue23;
                    branchMergedValue4 = comparisonValue29 * inverseLengthValue23;
                    branchMergedValue5 = inverseLengthValue23 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue110 = frac(float(int(uint(int(float(int(vectorValue15.x)))))) * varyingTexCoord0.x);
                    float productValue111 = frac(float(int(uint(int(float(int(vectorValue15.y)))))) * varyingTexCoord0.y);
                    float comparisonValue30 = (((productValue110 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue110 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue31 = (((productValue111 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue111 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue32 = ((abs(comparisonValue30) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue30;
                    float comparisonValue33 = ((abs(comparisonValue31) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue31;
                    float inverseLengthValue25 = rsqrt(dot(float3(comparisonValue32, comparisonValue33, 0.25f), float3(comparisonValue32, comparisonValue33, 0.25f)));
                    branchMergedValue3 = comparisonValue32 * inverseLengthValue25;
                    branchMergedValue4 = comparisonValue33 * inverseLengthValue25;
                    branchMergedValue5 = inverseLengthValue25 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue126 = frac(float(int(uint(int(float(int(vectorValue17.x)))))) * varyingTexCoord0.x);
                    float productValue127 = frac(float(int(uint(int(float(int(vectorValue17.y)))))) * varyingTexCoord0.y);
                    float comparisonValue34 = (((productValue126 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue126 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue35 = (((productValue127 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue127 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue36 = ((abs(comparisonValue34) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue34;
                    float comparisonValue37 = ((abs(comparisonValue35) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue35;
                    float inverseLengthValue27 = rsqrt(dot(float3(comparisonValue36, comparisonValue37, 0.25f), float3(comparisonValue36, comparisonValue37, 0.25f)));
                    branchMergedValue3 = comparisonValue36 * inverseLengthValue27;
                    branchMergedValue4 = comparisonValue37 * inverseLengthValue27;
                    branchMergedValue5 = inverseLengthValue27 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue147 = frac(float(int(uint(int(float(int(vectorValue19.x)))))) * varyingTexCoord0.x);
                    float productValue148 = frac(float(int(uint(int(float(int(vectorValue19.y)))))) * varyingTexCoord0.y);
                    float comparisonValue38 = (((productValue147 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue147 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue39 = (((productValue148 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue148 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue40 = ((abs(comparisonValue38) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue38;
                    float comparisonValue41 = ((abs(comparisonValue39) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue39;
                    float inverseLengthValue32 = rsqrt(dot(float3(comparisonValue40, comparisonValue41, 0.25f), float3(comparisonValue40, comparisonValue41, 0.25f)));
                    branchMergedValue3 = comparisonValue40 * inverseLengthValue32;
                    branchMergedValue4 = comparisonValue41 * inverseLengthValue32;
                    branchMergedValue5 = inverseLengthValue32 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue156 = frac(float(int(uint(int(float(int(vectorValue21.x)))))) * varyingTexCoord0.x);
                    float productValue157 = frac(float(int(uint(int(float(int(vectorValue21.y)))))) * varyingTexCoord0.y);
                    float comparisonValue42 = (((productValue156 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue156 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue43 = (((productValue157 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue157 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue44 = ((abs(comparisonValue42) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue42;
                    float comparisonValue45 = ((abs(comparisonValue43) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue43;
                    float inverseLengthValue37 = rsqrt(dot(float3(comparisonValue44, comparisonValue45, 0.25f), float3(comparisonValue44, comparisonValue45, 0.25f)));
                    branchMergedValue3 = comparisonValue44 * inverseLengthValue37;
                    branchMergedValue4 = comparisonValue45 * inverseLengthValue37;
                    branchMergedValue5 = inverseLengthValue37 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue163 = frac(float(int(uint(int(float(int(vectorValue23.x)))))) * varyingTexCoord0.x);
                    float productValue164 = frac(float(int(uint(int(float(int(vectorValue23.y)))))) * varyingTexCoord0.y);
                    float comparisonValue46 = (((productValue163 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue163 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue47 = (((productValue164 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue164 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue48 = ((abs(comparisonValue46) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue46;
                    float comparisonValue49 = ((abs(comparisonValue47) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue47;
                    float inverseLengthValue39 = rsqrt(dot(float3(comparisonValue48, comparisonValue49, 0.25f), float3(comparisonValue48, comparisonValue49, 0.25f)));
                    branchMergedValue3 = comparisonValue48 * inverseLengthValue39;
                    branchMergedValue4 = comparisonValue49 * inverseLengthValue39;
                    branchMergedValue5 = inverseLengthValue39 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount490;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount490);
                float productValue20 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue21 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue3 = frac(productValue20);
                float scalarValue4 = frac(productValue21);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount502;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount502);
                float productValue43 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue44 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue43);
                float scalarValue13 = frac(productValue44);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount507;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount507);
                float productValue55 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue56 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue17 = frac(productValue55);
                float scalarValue18 = frac(productValue56);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount519;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount519);
                float productValue62 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue63 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue19 = frac(productValue62);
                float scalarValue20 = frac(productValue63);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount511;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount511);
                float productValue81 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue82 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue21 = frac(productValue81);
                float scalarValue22 = frac(productValue82);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount529;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount529);
                float productValue98 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue99 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue23 = frac(productValue98);
                float scalarValue24 = frac(productValue99);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount522;
                uint2 vectorValue14 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount522);
                float productValue105 = float(int(uint(int(float(int(vectorValue14.x)))))) * varyingTexCoord0.x;
                float productValue106 = float(int(uint(int(float(int(vectorValue14.y)))))) * varyingTexCoord0.y;
                float scalarValue25 = frac(productValue105);
                float scalarValue26 = frac(productValue106);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount540;
                uint2 vectorValue16 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount540);
                float productValue112 = float(int(uint(int(float(int(vectorValue16.x)))))) * varyingTexCoord0.x;
                float productValue113 = float(int(uint(int(float(int(vectorValue16.y)))))) * varyingTexCoord0.y;
                float scalarValue27 = frac(productValue112);
                float scalarValue28 = frac(productValue113);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount515;
                uint2 vectorValue18 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount515);
                float productValue128 = float(int(uint(int(float(int(vectorValue18.x)))))) * varyingTexCoord0.x;
                float productValue129 = float(int(uint(int(float(int(vectorValue18.y)))))) * varyingTexCoord0.y;
                float scalarValue30 = frac(productValue128);
                float scalarValue31 = frac(productValue129);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount527;
                uint2 vectorValue20 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount527);
                float productValue149 = float(int(uint(int(float(int(vectorValue20.x)))))) * varyingTexCoord0.x;
                float productValue150 = float(int(uint(int(float(int(vectorValue20.y)))))) * varyingTexCoord0.y;
                float scalarValue33 = frac(productValue149);
                float scalarValue34 = frac(productValue150);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount526;
                uint2 vectorValue22 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount526);
                float productValue158 = float(int(uint(int(float(int(vectorValue22.x)))))) * varyingTexCoord0.x;
                float productValue159 = float(int(uint(int(float(int(vectorValue22.y)))))) * varyingTexCoord0.y;
                float scalarValue35 = frac(productValue158);
                float scalarValue36 = frac(productValue159);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount538;
                uint2 vectorValue24 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount538);
                float productValue165 = float(int(uint(int(float(int(vectorValue24.x)))))) * varyingTexCoord0.x;
                float productValue166 = float(int(uint(int(float(int(vectorValue24.y)))))) * varyingTexCoord0.y;
                float scalarValue37 = frac(productValue165);
                float scalarValue38 = frac(productValue166);
#endif
                float comparisonValue4;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue3 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue12 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue25 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue27 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue30 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue33 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue35 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue37 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue3 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue25 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue27 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue30 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue33 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue35 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue37 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
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
                    comparisonValue5 = ((scalarValue4 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue26 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue28 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue31 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue34 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue36 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue38 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue4, comparisonValue5));
                float scalarValue5 = vectorValue2.x;
                float scalarValue6 = vectorValue2.y;
                float scalarValue7 = vectorValue2.z;
                float scalarValue8 = vectorValue2.w;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue = frac(productValue20 + 0.5f);
                float sumValue1 = frac(productValue21 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue6 = frac(productValue43 + 0.5f);
                float sumValue7 = frac(productValue44 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue9 = frac(productValue55 + 0.5f);
                float sumValue10 = frac(productValue56 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue12 = frac(productValue62 + 0.5f);
                float sumValue13 = frac(productValue63 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue15 = frac(productValue81 + 0.5f);
                float sumValue16 = frac(productValue82 + 0.5f);
                bool conditionValue11 = sumValue16 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue18 = frac(productValue98 + 0.5f);
                float sumValue19 = frac(productValue99 + 0.5f);
                bool conditionValue13 = sumValue19 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue21 = frac(productValue105 + 0.5f);
                float sumValue22 = frac(productValue106 + 0.5f);
                bool conditionValue15 = sumValue22 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue24 = frac(productValue112 + 0.5f);
                float sumValue25 = frac(productValue113 + 0.5f);
                bool conditionValue17 = sumValue25 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue27 = frac(productValue128 + 0.5f);
                float sumValue28 = frac(productValue129 + 0.5f);
                bool conditionValue19 = sumValue28 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue30 = frac(productValue149 + 0.5f);
                float sumValue31 = frac(productValue150 + 0.5f);
                bool conditionValue22 = sumValue31 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue33 = frac(productValue158 + 0.5f);
                float sumValue34 = frac(productValue159 + 0.5f);
                bool conditionValue25 = sumValue34 > 0.5f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue36 = frac(productValue165 + 0.5f);
                float sumValue37 = frac(productValue166 + 0.5f);
                bool conditionValue27 = sumValue37 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue ? scalarValue6 : scalarValue7;
                float clampedValue3 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue2 = clampedValue3 - clampedValue4;
                bool conditionValue1 = sumValue > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue1 ? scalarValue6 : scalarValue5;
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue1 = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * clampedValue5;
                branchMergedValue2 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue3 ? scalarValue6 : scalarValue7;
                float clampedValue7 = intermediateValue[uint(int(clamp((sumValue6 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue6 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue8 = clampedValue7 - clampedValue8;
                bool conditionValue4 = sumValue6 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue4 ? scalarValue6 : scalarValue5;
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue7 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue7 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue8 = rsqrt(dot(float3(sumValue8, clampedValue9, 0.25f), float3(sumValue8, clampedValue9, 0.25f)));
                branchMergedValue = inverseLengthValue8 * sumValue8;
                branchMergedValue1 = inverseLengthValue8 * clampedValue9;
                branchMergedValue2 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue6 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue6 ? scalarValue6 : scalarValue7;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue11 = clampedValue10 - clampedValue11;
                bool conditionValue7 = sumValue9 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue7 ? scalarValue6 : scalarValue5;
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue13 = rsqrt(dot(float3(sumValue11, clampedValue12, 0.25f), float3(sumValue11, clampedValue12, 0.25f)));
                branchMergedValue = inverseLengthValue13 * sumValue11;
                branchMergedValue1 = inverseLengthValue13 * clampedValue12;
                branchMergedValue2 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue8 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue8 ? scalarValue6 : scalarValue7;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue13 - clampedValue14;
                bool conditionValue9 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue9 ? scalarValue6 : scalarValue5;
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue15 = rsqrt(dot(float3(sumValue14, clampedValue15, 0.25f), float3(sumValue14, clampedValue15, 0.25f)));
                branchMergedValue = inverseLengthValue15 * sumValue14;
                branchMergedValue1 = inverseLengthValue15 * clampedValue15;
                branchMergedValue2 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue11 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue11 ? scalarValue6 : scalarValue7;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue17 = clampedValue16 - clampedValue17;
                bool conditionValue12 = sumValue15 > 0.5f;
                intermediateValue[0u] = conditionValue12 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue12 ? scalarValue6 : scalarValue5;
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue20 = rsqrt(dot(float3(sumValue17, clampedValue18, 0.25f), float3(sumValue17, clampedValue18, 0.25f)));
                branchMergedValue = inverseLengthValue20 * sumValue17;
                branchMergedValue1 = inverseLengthValue20 * clampedValue18;
                branchMergedValue2 = inverseLengthValue20 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue13 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue13 ? scalarValue6 : scalarValue7;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue20 = clampedValue19 - clampedValue20;
                bool conditionValue14 = sumValue18 > 0.5f;
                intermediateValue[0u] = conditionValue14 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue14 ? scalarValue6 : scalarValue5;
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue22 = rsqrt(dot(float3(sumValue20, clampedValue21, 0.25f), float3(sumValue20, clampedValue21, 0.25f)));
                branchMergedValue = inverseLengthValue22 * sumValue20;
                branchMergedValue1 = inverseLengthValue22 * clampedValue21;
                branchMergedValue2 = inverseLengthValue22 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue15 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue15 ? scalarValue6 : scalarValue7;
                float clampedValue22 = intermediateValue[uint(int(clamp((sumValue21 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue23 = intermediateValue[uint(int(clamp((sumValue21 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue23 = clampedValue22 - clampedValue23;
                bool conditionValue16 = sumValue21 > 0.5f;
                intermediateValue[0u] = conditionValue16 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue16 ? scalarValue6 : scalarValue5;
                float clampedValue24 = intermediateValue[uint(int(clamp((sumValue22 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue22 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue24 = rsqrt(dot(float3(sumValue23, clampedValue24, 0.25f), float3(sumValue23, clampedValue24, 0.25f)));
                branchMergedValue = inverseLengthValue24 * sumValue23;
                branchMergedValue1 = inverseLengthValue24 * clampedValue24;
                branchMergedValue2 = inverseLengthValue24 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue17 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue17 ? scalarValue6 : scalarValue7;
                float clampedValue25 = intermediateValue[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue26 = intermediateValue[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue26 = clampedValue25 - clampedValue26;
                bool conditionValue18 = sumValue24 > 0.5f;
                intermediateValue[0u] = conditionValue18 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue18 ? scalarValue6 : scalarValue5;
                float clampedValue27 = intermediateValue[uint(int(clamp((sumValue25 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue25 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue26 = rsqrt(dot(float3(sumValue26, clampedValue27, 0.25f), float3(sumValue26, clampedValue27, 0.25f)));
                branchMergedValue = inverseLengthValue26 * sumValue26;
                branchMergedValue1 = inverseLengthValue26 * clampedValue27;
                branchMergedValue2 = inverseLengthValue26 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue19 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue19 ? scalarValue6 : scalarValue7;
                float clampedValue28 = intermediateValue[uint(int(clamp((sumValue27 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue29 = intermediateValue[uint(int(clamp((sumValue27 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue29 = clampedValue28 - clampedValue29;
                bool conditionValue20 = sumValue27 > 0.5f;
                intermediateValue[0u] = conditionValue20 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue20 ? scalarValue6 : scalarValue5;
                float clampedValue30 = intermediateValue[uint(int(clamp((sumValue28 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue28 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue28 = rsqrt(dot(float3(sumValue29, clampedValue30, 0.25f), float3(sumValue29, clampedValue30, 0.25f)));
                branchMergedValue = inverseLengthValue28 * sumValue29;
                branchMergedValue1 = inverseLengthValue28 * clampedValue30;
                branchMergedValue2 = inverseLengthValue28 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue22 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue22 ? scalarValue6 : scalarValue7;
                float clampedValue31 = intermediateValue[uint(int(clamp((sumValue30 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue32 = intermediateValue[uint(int(clamp((sumValue30 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue32 = clampedValue31 - clampedValue32;
                bool conditionValue23 = sumValue30 > 0.5f;
                intermediateValue[0u] = conditionValue23 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue23 ? scalarValue6 : scalarValue5;
                float clampedValue33 = intermediateValue[uint(int(clamp((sumValue31 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue31 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue33 = rsqrt(dot(float3(sumValue32, clampedValue33, 0.25f), float3(sumValue32, clampedValue33, 0.25f)));
                branchMergedValue = inverseLengthValue33 * sumValue32;
                branchMergedValue1 = inverseLengthValue33 * clampedValue33;
                branchMergedValue2 = inverseLengthValue33 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue25 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue25 ? scalarValue6 : scalarValue7;
                float clampedValue34 = intermediateValue[uint(int(clamp((sumValue33 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue35 = intermediateValue[uint(int(clamp((sumValue33 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue35 = clampedValue34 - clampedValue35;
                bool conditionValue26 = sumValue33 > 0.5f;
                intermediateValue[0u] = conditionValue26 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue26 ? scalarValue6 : scalarValue5;
                float clampedValue36 = intermediateValue[uint(int(clamp((sumValue34 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue34 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue38 = rsqrt(dot(float3(sumValue35, clampedValue36, 0.25f), float3(sumValue35, clampedValue36, 0.25f)));
                branchMergedValue = inverseLengthValue38 * sumValue35;
                branchMergedValue1 = inverseLengthValue38 * clampedValue36;
                branchMergedValue2 = inverseLengthValue38 * 0.25f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue27 ? scalarValue5 : scalarValue8;
                intermediateValue[1u] = conditionValue27 ? scalarValue6 : scalarValue7;
                float clampedValue37 = intermediateValue[uint(int(clamp((sumValue36 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue38 = intermediateValue[uint(int(clamp((sumValue36 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue38 = clampedValue37 - clampedValue38;
                bool conditionValue28 = sumValue36 > 0.5f;
                intermediateValue[0u] = conditionValue28 ? scalarValue7 : scalarValue8;
                intermediateValue[1u] = conditionValue28 ? scalarValue6 : scalarValue5;
                float clampedValue39 = intermediateValue[uint(int(clamp((sumValue37 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue37 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue40 = rsqrt(dot(float3(sumValue38, clampedValue39, 0.25f), float3(sumValue38, clampedValue39, 0.25f)));
                branchMergedValue = inverseLengthValue40 * sumValue38;
                branchMergedValue1 = inverseLengthValue40 * clampedValue39;
                branchMergedValue2 = inverseLengthValue40 * 0.25f;
#endif
            }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue5 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue15 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue18 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue21 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue22 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue16 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue19 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue22 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue2 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue4 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue17, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue16, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue17, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue16, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue17, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue16, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue9 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue10 = inverseLengthValue5 * multiplyAddValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue9 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue5 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue20, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue19, inverseLengthValue9 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue20, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue19, inverseLengthValue9 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue20, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue19, inverseLengthValue9 * varyingTangent0.z));
        float inverseLengthValue10 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue11 = inverseLengthValue10 * multiplyAddValue5;
        intermediateValue12 = inverseLengthValue10 * multiplyAddValue6;
        intermediateValue13 = inverseLengthValue10 * multiplyAddValue7;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue16 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue8 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue14 = inverseLengthValue17 * multiplyAddValue8;
        intermediateValue15 = inverseLengthValue17 * multiplyAddValue9;
        intermediateValue16 = inverseLengthValue17 * multiplyAddValue10;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue29 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue11 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue29 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue29 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue29 * varyingTangent0.z));
        float inverseLengthValue30 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue9 = inverseLengthValue30 * multiplyAddValue11;
        intermediateValue10 = inverseLengthValue30 * multiplyAddValue12;
        intermediateValue11 = inverseLengthValue30 * multiplyAddValue13;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue34 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue14 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue21, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue20, inverseLengthValue34 * varyingTangent0.x));
        float multiplyAddValue15 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue21, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue20, inverseLengthValue34 * varyingTangent0.y));
        float multiplyAddValue16 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue21, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue20, inverseLengthValue34 * varyingTangent0.z));
        float inverseLengthValue35 = rsqrt(dot(float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
        intermediateValue12 = inverseLengthValue35 * multiplyAddValue14;
        intermediateValue13 = inverseLengthValue35 * multiplyAddValue15;
        intermediateValue14 = inverseLengthValue35 * multiplyAddValue16;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue41 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue17 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue23, inverseLengthValue41 * varyingTangent0.x));
        float multiplyAddValue18 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue23, inverseLengthValue41 * varyingTangent0.y));
        float multiplyAddValue19 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue23, inverseLengthValue41 * varyingTangent0.z));
        float inverseLengthValue42 = rsqrt(dot(float3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19), float3(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19)));
        intermediateValue15 = inverseLengthValue42 * multiplyAddValue17;
        intermediateValue16 = inverseLengthValue42 * multiplyAddValue18;
        intermediateValue17 = inverseLengthValue42 * multiplyAddValue19;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue22 = inverseLengthValue6 * intermediateValue8;
    float productValue23 = inverseLengthValue6 * intermediateValue9;
    float productValue24 = inverseLengthValue6 * intermediateValue10;
    float quotientValue = 1.0f / ((abs(productValue23) + abs(productValue22)) + abs(productValue24));
    float productValue25 = quotientValue * productValue22;
    float productValue26 = quotientValue * productValue23;
    bool conditionValue2 = productValue24 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue11, intermediateValue12, intermediateValue13), float3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue45 = inverseLengthValue11 * intermediateValue11;
    float productValue46 = inverseLengthValue11 * intermediateValue12;
    float productValue47 = inverseLengthValue11 * intermediateValue13;
    float quotientValue1 = 1.0f / ((abs(productValue46) + abs(productValue45)) + abs(productValue47));
    float productValue48 = quotientValue1 * productValue45;
    float productValue49 = quotientValue1 * productValue46;
    bool conditionValue5 = productValue47 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue18 = rsqrt(dot(float3(intermediateValue14, intermediateValue15, intermediateValue16), float3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue64 = inverseLengthValue18 * intermediateValue14;
    float productValue65 = inverseLengthValue18 * intermediateValue15;
    float productValue66 = inverseLengthValue18 * intermediateValue16;
    float quotientValue2 = 1.0f / ((abs(productValue65) + abs(productValue64)) + abs(productValue66));
    float productValue67 = quotientValue2 * productValue64;
    float productValue68 = quotientValue2 * productValue65;
    bool conditionValue10 = productValue66 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue31 = rsqrt(dot(float3(intermediateValue9, intermediateValue10, intermediateValue11), float3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue130 = inverseLengthValue31 * intermediateValue9;
    float productValue131 = inverseLengthValue31 * intermediateValue10;
    float productValue132 = inverseLengthValue31 * intermediateValue11;
    float quotientValue3 = 1.0f / ((abs(productValue131) + abs(productValue130)) + abs(productValue132));
    float productValue133 = quotientValue3 * productValue130;
    float productValue134 = quotientValue3 * productValue131;
    bool conditionValue21 = productValue132 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue36 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue151 = inverseLengthValue36 * intermediateValue12;
    float productValue152 = inverseLengthValue36 * intermediateValue13;
    float productValue153 = inverseLengthValue36 * intermediateValue14;
    float quotientValue4 = 1.0f / ((abs(productValue152) + abs(productValue151)) + abs(productValue153));
    float productValue154 = quotientValue4 * productValue151;
    float productValue155 = quotientValue4 * productValue152;
    bool conditionValue24 = productValue153 < 0.0f;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue43 = rsqrt(dot(float3(intermediateValue15, intermediateValue16, intermediateValue17), float3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue167 = inverseLengthValue43 * intermediateValue15;
    float productValue168 = inverseLengthValue43 * intermediateValue16;
    float productValue169 = inverseLengthValue43 * intermediateValue17;
    float quotientValue5 = 1.0f / ((abs(productValue168) + abs(productValue167)) + abs(productValue169));
    float productValue170 = quotientValue5 * productValue167;
    float productValue171 = quotientValue5 * productValue168;
    bool conditionValue29 = productValue169 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue27 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue27, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue27 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue27, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue27 * productValue27) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue27, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue28 = clampedValue * 0.16666667163372039794921875f;
    float productValue29 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue30 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue6 = ceil(clamp(max(max(productValue28, productValue30), max(productValue29, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue11, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue28 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue29 / clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue30 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue7 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue25 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue26))) : productValue25;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue25)) * ((productValue26 < 0.0f) ? (-1.0f) : 1.0f)) : productValue26;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue48 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue48)) * ((productValue49 < 0.0f) ? (-1.0f) : 1.0f)) : productValue49;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue50) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue50;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue48 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue48)) * ((productValue49 < 0.0f) ? (-1.0f) : 1.0f)) : productValue49;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue57) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue57;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue13 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue67 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue68))) : productValue67;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue67)) * ((productValue68 < 0.0f) ? (-1.0f) : 1.0f)) : productValue68;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue7 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue25 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue26))) : productValue25;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue25)) * ((productValue26 < 0.0f) ? (-1.0f) : 1.0f)) : productValue26;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue93) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue93;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue94) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue94;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue95) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue95;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue48 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue48)) * ((productValue49 < 0.0f) ? (-1.0f) : 1.0f)) : productValue49;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue100) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue100;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue101) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue101;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue102) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue102;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue48 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue48)) * ((productValue49 < 0.0f) ? (-1.0f) : 1.0f)) : productValue49;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue107) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue107;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue108) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue108;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue13 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue67 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue68))) : productValue67;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue67)) * ((productValue68 < 0.0f) ? (-1.0f) : 1.0f)) : productValue68;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue123) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue123;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue124) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue124;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue125) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue125;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue21 ? (((productValue133 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue134))) : productValue133;
    fragmentColor2.y = conditionValue21 ? ((1.0f - abs(productValue133)) * ((productValue134 < 0.0f) ? (-1.0f) : 1.0f)) : productValue134;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue144) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue144;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue145) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue145;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue146) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue146;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue24 ? (((productValue154 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue155))) : productValue154;
    fragmentColor2.y = conditionValue24 ? ((1.0f - abs(productValue154)) * ((productValue155 < 0.0f) ? (-1.0f) : 1.0f)) : productValue155;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue107) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue107;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue108) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue108;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue11 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue24 ? (((productValue154 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue155))) : productValue154;
    fragmentColor2.y = conditionValue24 ? ((1.0f - abs(productValue154)) * ((productValue155 < 0.0f) ? (-1.0f) : 1.0f)) : productValue155;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue160) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue160;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue161) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue161;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue162) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue162;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue29 ? (((productValue170 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue171))) : productValue170;
    fragmentColor2.y = conditionValue29 ? ((1.0f - abs(productValue170)) * ((productValue171 < 0.0f) ? (-1.0f) : 1.0f)) : productValue171;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
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
