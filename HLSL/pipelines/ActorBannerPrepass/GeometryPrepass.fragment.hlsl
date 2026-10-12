// ActorBannerPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorBannerPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  int varyingFrontFacing0 : FRONTFACING0,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  linear centroid float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingTexCoord3 : TEXCOORD3,
  uint varyingSv_Isfrontface0 : SV_IsFrontFace0,
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
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord2.zw).xyz;
#if RD_FEATURE_TINTING == RD_ON
  fragmentColor1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector0.x = (int)RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.x;
  workingVector0.yz = (int2)workingVector0.xx & int2(4,1);
  workingVector0.yz = RD_COMPARISON_MASK((int2)workingVector0.yz == int2(4,1));
  if (workingVector0.y != 0) {
    workingVector0.yw = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
    workingVector1.xyz = materialTexture1.Sample(textureSampler1, workingVector0.yw).xyz;
    workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector0.w = (int)RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.x;
  workingVector1.xy = (int2)workingVector0.ww & int2(4,1);
  workingVector1.xy = RD_COMPARISON_MASK((int2)workingVector1.xy == int2(4,1));
  if (workingVector1.x != 0) {
    workingVector1.xz = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
    workingVector1.xzw = materialTexture1.Sample(textureSampler1, workingVector1.xz).xyz;
    workingVector1.xzw = workingVector1.xzw * float3(2,2,2) + float3(-1,-1,-1);
#endif
  } else {
#if RD_FEATURE_TINTING == RD_ON
    workingVector0.y = (int)workingVector0.x & 8;
    workingVector0.y = RD_COMPARISON_MASK((int)workingVector0.y == 8);
    if (workingVector0.y != 0) {
      workingVector0.y = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w + -RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y;
      workingVector0.y = min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w, workingVector0.y);
      workingVector0.y = saturate(2 + -workingVector0.y);
      workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.y);
      if (workingVector0.w != 0) {
        workingVector2.xy = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
#elif RD_FEATURE_TINTING == RD_OFF
    workingVector2.x = (int)workingVector0.w & 8;
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector2.x == 8);
    if (workingVector2.x != 0) {
      workingVector2.x = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w + -RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y;
      workingVector2.x = min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w, workingVector2.x);
      workingVector2.x = saturate(2 + -workingVector2.x);
      workingVector2.y = RD_COMPARISON_MASK(0 < workingVector2.x);
      if (workingVector2.y != 0) {
        workingVector2.yz = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
#endif
        materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_TINTING == RD_ON
        workingVector2.zw = floatingPointResult.xy;
        workingVector3.xyzw = workingVector2.zzww;
        workingVector2.zw = workingVector3.yw * workingVector2.xy;
        workingVector2.zw = frac(workingVector2.zw);
        workingVector4.xy = float2(-0.5,-0.5) + workingVector2.zw;
        workingVector4.xy = RD_COMPARISON_MASK(abs(workingVector4.xy) < float2(0.0625,0.0625));
        workingVector2.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector2.zw);
        workingVector2.zw = workingVector2.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
        workingVector2.zw = workingVector2.xy + workingVector2.zw;
        workingVector2.zw = workingVector4.xy ? workingVector2.zw : workingVector2.xy;
        workingVector4.xyzw = materialTexture1.Gather(textureSampler1, workingVector2.zw).xyzw;
        workingVector2.xyzw = workingVector2.xxyy * workingVector3.xyzw + float4(0.5,0.5,0.5,0.5);
        workingVector2.xyzw = frac(workingVector2.xyzw);
        workingVector3.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector2.wwyy);
        workingVector3.xyzw = workingVector3.xyzw ? workingVector4.xyzy : workingVector4.wzwx;
        workingVector2.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector2.xyzw;
        workingVector2.xyzw = saturate(workingVector2.xyzw + workingVector2.xyzw);
        workingVector2.xyzw = (int4)workingVector2.xyzw;
        workingVector0.w = dot(workingVector3.xy, icb[workingVector2.x+0].xy);
        workingVector1.w = dot(workingVector3.xy, icb[workingVector2.y+0].xy);
        workingVector4.x = -workingVector1.w + workingVector0.w;
        workingVector0.w = dot(workingVector3.zw, icb[workingVector2.z+0].xy);
        workingVector1.w = dot(workingVector3.zw, icb[workingVector2.w+0].xy);
        workingVector4.y = -workingVector1.w + workingVector0.w;
        workingVector4.z = 0.25;
        workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
        workingVector0.w = rsqrt(workingVector0.w);
        workingVector1.xyz = workingVector4.xyz * workingVector0.www;
        workingVector1.xy = workingVector1.xy * workingVector0.yy;
#elif RD_FEATURE_TINTING == RD_OFF
        workingVector3.xy = floatingPointResult.xy;
        workingVector3.xyzw = workingVector3.xxyy;
        workingVector4.xy = workingVector3.yw * workingVector2.yz;
        workingVector4.xy = frac(workingVector4.xy);
        workingVector4.zw = float2(-0.5,-0.5) + workingVector4.xy;
        workingVector4.zw = RD_COMPARISON_MASK(abs(workingVector4.zw) < float2(0.0625,0.0625));
        workingVector4.xy = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector4.xy);
        workingVector4.xy = workingVector4.xy ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
        workingVector4.xy = workingVector4.xy + workingVector2.yz;
        workingVector4.xy = workingVector4.zw ? workingVector4.xy : workingVector2.yz;
        workingVector4.xyzw = materialTexture1.Gather(textureSampler1, workingVector4.xy).xyzw;
        workingVector3.xyzw = workingVector2.yyzz * workingVector3.xyzw + float4(0.5,0.5,0.5,0.5);
        workingVector3.xyzw = frac(workingVector3.xyzw);
        workingVector5.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector3.wwyy);
        workingVector4.xyzw = workingVector5.xyzw ? workingVector4.xyzy : workingVector4.wzwx;
        workingVector3.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector3.xyzw;
        workingVector3.xyzw = saturate(workingVector3.xyzw + workingVector3.xyzw);
        workingVector3.xyzw = (int4)workingVector3.xyzw;
        workingVector2.y = dot(workingVector4.xy, icb[workingVector3.x+0].xy);
        workingVector2.z = dot(workingVector4.xy, icb[workingVector3.y+0].xy);
        workingVector5.x = workingVector2.y + -workingVector2.z;
        workingVector2.y = dot(workingVector4.zw, icb[workingVector3.z+0].xy);
        workingVector2.z = dot(workingVector4.zw, icb[workingVector3.w+0].xy);
        workingVector5.y = workingVector2.y + -workingVector2.z;
        workingVector5.z = 0.25;
        workingVector2.y = dot(workingVector5.xyz, workingVector5.xyz);
        workingVector2.y = rsqrt(workingVector2.y);
        workingVector1.xzw = workingVector5.xyz * workingVector2.yyy;
        workingVector1.xz = workingVector1.xz * workingVector2.xx;
#endif
      } else {
#if RD_FEATURE_TINTING == RD_ON
        workingVector1.xyz = float3(0,0,1);
#elif RD_FEATURE_TINTING == RD_OFF
        workingVector1.xzw = float3(0,0,1);
#endif
      }
    } else {
#if RD_FEATURE_TINTING == RD_ON
      workingVector0.y = (int)workingVector0.x & 16;
      workingVector0.y = RD_COMPARISON_MASK((int)workingVector0.y == 16);
      if (workingVector0.y != 0) {
        workingVector0.yw = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
        workingVector1.w = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w + -RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y;
        workingVector1.w = min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w, workingVector1.w);
        workingVector2.xyzw = materialTexture1.SampleLevel(textureSampler1, workingVector0.yw, 0).xyzw;
        workingVector3.xy = RD_COMPARISON_MASK(workingVector2.yz == workingVector2.xy);
        workingVector3.x = workingVector3.y ? workingVector3.x : 0;
        if (workingVector3.x != 0) {
          workingVector3.x = saturate(2 + -workingVector1.w);
          workingVector3.y = RD_COMPARISON_MASK(0 < workingVector3.x);
          if (workingVector3.y != 0) {
#elif RD_FEATURE_TINTING == RD_OFF
      workingVector2.x = (int)workingVector0.w & 16;
      workingVector2.x = RD_COMPARISON_MASK((int)workingVector2.x == 16);
      if (workingVector2.x != 0) {
        workingVector2.xy = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.zw;
        workingVector2.z = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w + -RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y;
        workingVector2.z = min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w, workingVector2.z);
        workingVector3.xyzw = materialTexture1.SampleLevel(textureSampler1, workingVector2.xy, 0).xyzw;
        workingVector4.xy = RD_COMPARISON_MASK(workingVector3.yz == workingVector3.xy);
        workingVector2.w = workingVector4.y ? workingVector4.x : 0;
        if (workingVector2.w != 0) {
          workingVector2.w = saturate(2 + -workingVector2.z);
          workingVector4.x = RD_COMPARISON_MASK(0 < workingVector2.w);
          if (workingVector4.x != 0) {
#endif
            materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_TINTING == RD_ON
            workingVector3.yz = floatingPointResult.xy;
            workingVector4.xyzw = workingVector3.yyzz;
            workingVector3.yz = workingVector4.yw * workingVector0.yw;
            workingVector3.yz = frac(workingVector3.yz);
            workingVector5.xy = float2(-0.5,-0.5) + workingVector3.yz;
            workingVector5.xy = RD_COMPARISON_MASK(abs(workingVector5.xy) < float2(0.0625,0.0625));
            workingVector3.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector3.yz);
            workingVector3.yz = workingVector3.yz ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
            workingVector3.yz = workingVector3.yz + workingVector0.yw;
            workingVector3.yz = workingVector5.xy ? workingVector3.yz : workingVector0.yw;
            workingVector5.xyzw = materialTexture1.Gather(textureSampler1, workingVector3.yz).xyzw;
            workingVector4.xyzw = workingVector0.yyww * workingVector4.xyzw + float4(0.5,0.5,0.5,0.5);
#elif RD_FEATURE_TINTING == RD_OFF
            workingVector4.xy = floatingPointResult.xy;
            workingVector4.xyzw = workingVector4.xxyy;
            workingVector5.xy = workingVector4.yw * workingVector2.xy;
            workingVector5.xy = frac(workingVector5.xy);
            workingVector5.zw = float2(-0.5,-0.5) + workingVector5.xy;
            workingVector5.zw = RD_COMPARISON_MASK(abs(workingVector5.zw) < float2(0.0625,0.0625));
            workingVector5.xy = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector5.xy);
            workingVector5.xy = workingVector5.xy ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
            workingVector5.xy = workingVector5.xy + workingVector2.xy;
            workingVector5.xy = workingVector5.zw ? workingVector5.xy : workingVector2.xy;
            workingVector5.xyzw = materialTexture1.Gather(textureSampler1, workingVector5.xy).xyzw;
            workingVector4.xyzw = workingVector2.xxyy * workingVector4.xyzw + float4(0.5,0.5,0.5,0.5);
#endif
            workingVector4.xyzw = frac(workingVector4.xyzw);
            workingVector6.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector4.wwyy);
            workingVector5.xyzw = workingVector6.xyzw ? workingVector5.xyzy : workingVector5.wzwx;
            workingVector4.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector4.xyzw;
            workingVector4.xyzw = saturate(workingVector4.xyzw + workingVector4.xyzw);
            workingVector4.xyzw = (int4)workingVector4.xyzw;
#if RD_FEATURE_TINTING == RD_ON
            workingVector3.y = dot(workingVector5.xy, icb[workingVector4.x+0].xy);
            workingVector3.z = dot(workingVector5.xy, icb[workingVector4.y+0].xy);
            workingVector6.x = workingVector3.y + -workingVector3.z;
            workingVector3.y = dot(workingVector5.zw, icb[workingVector4.z+0].xy);
            workingVector3.z = dot(workingVector5.zw, icb[workingVector4.w+0].xy);
            workingVector6.y = workingVector3.y + -workingVector3.z;
#elif RD_FEATURE_TINTING == RD_OFF
            workingVector4.x = dot(workingVector5.xy, icb[workingVector4.x+0].xy);
            workingVector4.y = dot(workingVector5.xy, icb[workingVector4.y+0].xy);
            workingVector6.x = workingVector4.x + -workingVector4.y;
            workingVector4.x = dot(workingVector5.zw, icb[workingVector4.z+0].xy);
            workingVector4.y = dot(workingVector5.zw, icb[workingVector4.w+0].xy);
            workingVector6.y = workingVector4.x + -workingVector4.y;
#endif
            workingVector6.z = 0.25;
#if RD_FEATURE_TINTING == RD_ON
            workingVector3.y = dot(workingVector6.xyz, workingVector6.xyz);
            workingVector3.y = rsqrt(workingVector3.y);
            workingVector1.xyz = workingVector6.xyz * workingVector3.yyy;
            workingVector1.xy = workingVector1.xy * workingVector3.xx;
#elif RD_FEATURE_TINTING == RD_OFF
            workingVector4.x = dot(workingVector6.xyz, workingVector6.xyz);
            workingVector4.x = rsqrt(workingVector4.x);
            workingVector1.xzw = workingVector6.xyz * workingVector4.xxx;
            workingVector1.xz = workingVector1.xz * workingVector2.ww;
#endif
          } else {
#if RD_FEATURE_TINTING == RD_ON
            workingVector1.xyz = float3(0,0,1);
#elif RD_FEATURE_TINTING == RD_OFF
            workingVector1.xzw = float3(0,0,1);
#endif
          }
        } else {
          materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_TINTING == RD_ON
          workingVector3.xy = floatingPointResult.xy;
          workingVector1.w = saturate(2 + -workingVector1.w);
          workingVector3.z = RD_COMPARISON_MASK(0 < workingVector1.w);
          workingVector0.yw = workingVector3.xy * workingVector0.yw;
          workingVector0.yw = frac(workingVector0.yw);
          workingVector3.xy = RD_COMPARISON_MASK(workingVector0.yw >= float2(0.916666687,0.916666687));
#elif RD_FEATURE_TINTING == RD_OFF
          workingVector4.xy = floatingPointResult.xy;
          workingVector2.z = saturate(2 + -workingVector2.z);
          workingVector2.w = RD_COMPARISON_MASK(0 < workingVector2.z);
          workingVector2.xy = workingVector4.xy * workingVector2.xy;
          workingVector2.xy = frac(workingVector2.xy);
          workingVector4.xy = RD_COMPARISON_MASK(workingVector2.xy >= float2(0.916666687,0.916666687));
          workingVector4.xy = workingVector4.xy ? float2(1,1) : 0;
          workingVector3.xyzw = workingVector3.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
          workingVector2.xy = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector2.xy);
          workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
          workingVector2.xy = workingVector2.xy * -workingVector3.yw;
          workingVector2.xy = workingVector4.xy * workingVector3.xz + workingVector2.xy;
          workingVector3.xy = RD_COMPARISON_MASK(abs(workingVector2.xy) >= float2(0.00499999989,0.00499999989));
#endif
          workingVector3.xy = workingVector3.xy ? float2(1,1) : 0;
#if RD_FEATURE_TINTING == RD_ON
          workingVector2.xyzw = workingVector2.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
          workingVector0.yw = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector0.yw);
          workingVector0.yw = workingVector0.yw ? float2(1,1) : 0;
          workingVector0.yw = workingVector0.yw * -workingVector2.yw;
          workingVector0.yw = workingVector3.xy * workingVector2.xz + workingVector0.yw;
          workingVector2.xy = RD_COMPARISON_MASK(abs(workingVector0.yw) >= float2(0.00499999989,0.00499999989));
          workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
          workingVector2.xy = workingVector2.xy * workingVector0.yw;
          workingVector2.z = 0.25;
          workingVector0.y = dot(workingVector2.xyz, workingVector2.xyz);
          workingVector0.y = rsqrt(workingVector0.y);
          workingVector2.xyz = workingVector2.xyz * workingVector0.yyy;
          workingVector2.xy = workingVector2.xy * workingVector1.ww;
          workingVector1.xyz = workingVector3.zzz ? workingVector2.xyz : float3(0,0,1);
#elif RD_FEATURE_TINTING == RD_OFF
          workingVector3.xy = workingVector3.xy * workingVector2.xy;
          workingVector3.z = 0.25;
          workingVector2.x = dot(workingVector3.xyz, workingVector3.xyz);
          workingVector2.x = rsqrt(workingVector2.x);
          workingVector3.xyz = workingVector3.xyz * workingVector2.xxx;
          workingVector3.xy = workingVector3.xy * workingVector2.zz;
          workingVector1.xzw = workingVector2.www ? workingVector3.xyz : float3(0,0,1);
#endif
        }
      } else {
#if RD_FEATURE_TINTING == RD_ON
        workingVector1.xyz = float3(0,0,1);
#elif RD_FEATURE_TINTING == RD_OFF
        workingVector1.xzw = float3(0,0,1);
#endif
      }
    }
  }
#if RD_FEATURE_TINTING == RD_ON
  if (workingVector0.z != 0) {
    workingVector0.yz = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.zw;
    workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.yz).zyxw;
    workingVector0.x = (int)workingVector0.x & 2;
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 2);
    workingVector0.y = workingVector0.x ? workingVector2.w : RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
    workingVector0.x = workingVector2.z;
#elif RD_FEATURE_TINTING == RD_OFF
  if (workingVector1.y != 0) {
    workingVector2.xy = varyingTexCoord2.zw * RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.xy + RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.zw;
    workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector2.xy).zyxw;
    workingVector0.w = (int)workingVector0.w & 2;
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 2);
    workingVector3.y = workingVector0.w ? workingVector2.w : RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
    workingVector3.x = workingVector2.z;
#endif
  } else {
    workingVector2.xy = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.yz;
#if RD_FEATURE_TINTING == RD_ON
    workingVector0.x = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.w;
    workingVector0.y = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
#elif RD_FEATURE_TINTING == RD_OFF
    workingVector3.x = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.w;
    workingVector3.y = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
#endif
  }
#if RD_FEATURE_TINTING == RD_ON
  workingVector3.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
  workingVector0.z = dot(varyingTangent0.xyz, varyingTangent0.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector4.xyz = varyingTangent0.xyz * workingVector0.zzz;
  workingVector0.z = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector5.xyz = varyingBitangent0.xyz * workingVector0.zzz;
  workingVector0.z = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector3.xyz = workingVector3.xyz * workingVector0.zzz;
  workingVector5.xyz = workingVector5.xyz * workingVector1.yyy;
  workingVector1.xyw = workingVector4.xyz * workingVector1.xxx + workingVector5.xyz;
  workingVector1.xyz = workingVector3.xyz * workingVector1.zzz + workingVector1.xyw;
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector4.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
  workingVector0.w = dot(varyingTangent0.xyz, varyingTangent0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector5.xyz = varyingTangent0.xyz * workingVector0.www;
  workingVector0.w = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector6.xyz = varyingBitangent0.xyz * workingVector0.www;
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector6.xyz = workingVector6.xyz * workingVector1.zzz;
  workingVector1.xyz = workingVector5.xyz * workingVector1.xxx + workingVector6.xyz;
  workingVector1.xyz = workingVector4.xyz * workingVector1.www + workingVector1.xyz;
  workingVector4.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.w = RD_COMPARISON_MASK(workingVector3.y < workingVector3.x);
  workingVector1.w = workingVector3.x * 0.498039216 + 0.501960814;
  workingVector2.z = -workingVector3.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.w ? workingVector1.w : workingVector2.z;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector0.w = abs(workingVector1.x) + abs(workingVector1.y);
  workingVector0.w = workingVector0.w + abs(workingVector1.z);
#endif
  workingVector0.w = 1 / workingVector0.w;
#if RD_FEATURE_TINTING == RD_ON
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.xy = workingVector1.xy * workingVector0.ww;
  workingVector0.w = RD_COMPARISON_MASK(workingVector1.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector1.yx);
  workingVector2.zw = RD_COMPARISON_MASK(workingVector1.xy >= float2(0,0));
  workingVector2.zw = workingVector2.zw ? float2(1,1) : 0;
  workingVector2.zw = workingVector2.zw * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.zw * workingVector1.zw;
  fragmentColor2.xy = workingVector0.ww ? workingVector1.zw : workingVector1.xy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector1.xyz;
  workingVector1.xy = workingVector1.xy / workingVector1.zz;
  workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector4.yyy;
  workingVector3.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector4.xxx + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector4.zzz + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector3.xyz;
  workingVector1.zw = workingVector3.xy / workingVector3.zz;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector1.xy + -workingVector1.zw;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 9.99999975e-005);
  workingVector1.x = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
#endif
  workingVector1.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
#if RD_FEATURE_TINTING == RD_ON
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.w = workingVector1.x * 0.600000024 + 0.400000006;
  workingVector1.w = workingVector1.w * 0.600000024 + 0.400000006;
  workingVector1.y = workingVector1.x * workingVector1.w;
  workingVector1.w = workingVector1.x * workingVector1.x;
  workingVector1.w = workingVector1.w * 0.600000024 + 0.400000006;
  workingVector1.z = workingVector1.x * workingVector1.w;
  workingVector1.xyz = min(float3(1,1,1), workingVector1.xyz);
  workingVector1.xyz = workingVector0.www ? workingVector1.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector1.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector1.xyz;
  workingVector1.w = 0.00392156886;
  workingVector2.zw = max(workingVector1.xy, workingVector1.zw);
  workingVector0.w = max(workingVector2.z, workingVector2.w);
#endif
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
#if RD_FEATURE_TINTING == RD_ON
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector3.w = 0.00392156886 * workingVector0.w;
  workingVector3.xyz = workingVector1.xyz / workingVector3.www;
  workingVector3.xyzw = saturate(workingVector3.xyzw);
  workingVector1.xyzw = float4(255,255,255,255) * workingVector3.xyzw;
  workingVector1.xyzw = (uint4)workingVector1.xyzw;
  fragmentColor0.yz = mad((int2)workingVector1.xz, int2(256,256), (int2)workingVector1.yw);
  workingVector0.w = 255 * RD_UNIFORM_BLOCK_LIGHT_COLOR.w;
  workingVector0.w = floor(workingVector0.w);
  workingVector0.w = (uint)workingVector0.w;
  workingVector1.xy = (int2)workingVector0.ww & int2(1,2);
  workingVector0.w = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = (uint)workingVector0.w;
  workingVector1.xy = workingVector1.xy ? float2(256,512) : float2(0,0);
  workingVector0.w = (int)workingVector0.w + (int)workingVector1.x;
  fragmentColor0.w = (int)workingVector1.y + (int)workingVector0.w;
#endif
  workingVector2.xy = saturate(workingVector2.xy);
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.xy = float2(255,255) * workingVector2.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.xy = float2(255,255) * workingVector2.xy;
  workingVector1.xy = (uint2)workingVector1.xy;
  fragmentColor0.x = mad((int)workingVector1.x, 256, (int)workingVector1.y);
  fragmentColor1.xyz = workingVector0.xyz;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord2.z, varyingTexCoord2.w));
    uint scalarValue = uint(int(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue & 4u) == 0u)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if ((scalarValue & 8u) == 0u)
        {
            float branchMergedValue3;
            float branchMergedValue5;
            float branchMergedValue6;
            if ((scalarValue & 16u) == 0u)
            {
                branchMergedValue3 = 0.0f;
                branchMergedValue5 = 0.0f;
                branchMergedValue6 = 1.0f;
            }
            else
            {
                float multiplyAddValue = mad(varyingTexCoord2.z, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.x, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.z);
                float multiplyAddValue1 = mad(varyingTexCoord2.w, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.w);
                float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue, multiplyAddValue1), 0.0f);
                float scalarValue1 = sampledTextureValue1.x;
                float scalarValue2 = sampledTextureValue1.y;
                float scalarValue3 = sampledTextureValue1.z;
                float multiplyAddValue2 = clamp(mad(min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w - RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w), -1.0f, 2.0f), 0.0f, 1.0f);
                bool conditionValue = multiplyAddValue2 > 0.0f;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if ((scalarValue1 == scalarValue2) && (scalarValue2 == scalarValue3))
                {
                    float branchMergedValue12;
                    float branchMergedValue14;
                    float branchMergedValue15;
                    if (conditionValue)
                    {
#if RD_FEATURE_TINTING == RD_ON
                        uint unusedTextureMipCount517;
                        uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount517);
                        float productValue = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue;
                        float productValue1 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue1;
                        float scalarValue4 = frac(productValue);
                        float scalarValue5 = frac(productValue1);
#elif RD_FEATURE_TINTING == RD_OFF
                        uint unusedTextureMipCount508;
                        uint2 vectorValue5 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount508);
                        float productValue18 = float(int(uint(int(float(int(vectorValue5.x)))))) * multiplyAddValue;
                        float productValue19 = float(int(uint(int(float(int(vectorValue5.y)))))) * multiplyAddValue1;
                        float scalarValue16 = frac(productValue18);
                        float scalarValue17 = frac(productValue19);
#endif
                        float comparisonValue10;
#if RD_FEATURE_TINTING == RD_ON
                        if (abs(scalarValue4 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_TINTING == RD_OFF
                        if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#endif
                        {
#if RD_FEATURE_TINTING == RD_ON
                            comparisonValue10 = ((scalarValue4 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#elif RD_FEATURE_TINTING == RD_OFF
                            comparisonValue10 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#endif
                        }
                        else
                        {
                            comparisonValue10 = multiplyAddValue;
                        }
                        float comparisonValue11;
#if RD_FEATURE_TINTING == RD_ON
                        if (abs(scalarValue5 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_TINTING == RD_OFF
                        if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#endif
                        {
#if RD_FEATURE_TINTING == RD_ON
                            comparisonValue11 = ((scalarValue5 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif RD_FEATURE_TINTING == RD_OFF
                            comparisonValue11 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                        }
                        else
                        {
                            comparisonValue11 = multiplyAddValue1;
                        }
                        float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue10, comparisonValue11));
                        float scalarValue6 = vectorValue1.x;
                        float scalarValue7 = vectorValue1.y;
                        float scalarValue8 = vectorValue1.z;
                        float scalarValue9 = vectorValue1.w;
#if RD_FEATURE_TINTING == RD_ON
                        float sumValue = frac(productValue + 0.5f);
                        float sumValue1 = frac(productValue1 + 0.5f);
                        bool conditionValue1 = sumValue1 > 0.5f;
#elif RD_FEATURE_TINTING == RD_OFF
                        float sumValue9 = frac(productValue18 + 0.5f);
                        float sumValue10 = frac(productValue19 + 0.5f);
                        bool conditionValue6 = sumValue10 > 0.5f;
#endif
                        float intermediateValue[2];
#if RD_FEATURE_TINTING == RD_ON
                        intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue9;
                        intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue8;
                        float clampedValue3 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                        float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                        float sumValue2 = clampedValue3 - clampedValue4;
                        bool conditionValue2 = sumValue > 0.5f;
                        intermediateValue[0u] = conditionValue2 ? scalarValue8 : scalarValue9;
                        intermediateValue[1u] = conditionValue2 ? scalarValue7 : scalarValue6;
                        float clampedValue5 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                        float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                        float productValue2 = inverseLengthValue * multiplyAddValue2;
                        branchMergedValue12 = productValue2 * sumValue2;
                        branchMergedValue14 = productValue2 * clampedValue5;
                        branchMergedValue15 = inverseLengthValue * 0.25f;
#elif RD_FEATURE_TINTING == RD_OFF
                        intermediateValue[0u] = conditionValue6 ? scalarValue6 : scalarValue9;
                        intermediateValue[1u] = conditionValue6 ? scalarValue7 : scalarValue8;
                        float clampedValue10 = intermediateValue[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                        float clampedValue11 = intermediateValue[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                        float sumValue11 = clampedValue10 - clampedValue11;
                        bool conditionValue7 = sumValue9 > 0.5f;
                        intermediateValue[0u] = conditionValue7 ? scalarValue8 : scalarValue9;
                        intermediateValue[1u] = conditionValue7 ? scalarValue7 : scalarValue6;
                        float clampedValue12 = intermediateValue[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                        float inverseLengthValue7 = rsqrt(dot(float3(sumValue11, clampedValue12, 0.25f), float3(sumValue11, clampedValue12, 0.25f)));
                        float productValue20 = inverseLengthValue7 * multiplyAddValue2;
                        branchMergedValue12 = productValue20 * sumValue11;
                        branchMergedValue14 = productValue20 * clampedValue12;
                        branchMergedValue15 = inverseLengthValue7 * 0.25f;
#endif
                    }
                    else
                    {
                        branchMergedValue12 = 0.0f;
                        branchMergedValue14 = 0.0f;
                        branchMergedValue15 = 1.0f;
                    }
                    branchMergedValue9 = branchMergedValue12;
                    branchMergedValue10 = branchMergedValue14;
                    branchMergedValue11 = branchMergedValue15;
                }
                else
                {
#if RD_FEATURE_TINTING == RD_ON
                    uint unusedTextureMipCount414;
                    uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount414);
#elif RD_FEATURE_TINTING == RD_OFF
                    uint unusedTextureMipCount405;
                    uint2 vectorValue6 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount405);
#endif
                    float branchMergedValue13;
                    float branchMergedValue16;
                    float branchMergedValue17;
                    if (conditionValue)
                    {
#if RD_FEATURE_TINTING == RD_ON
                        float productValue3 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue);
                        float productValue4 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue1);
                        float comparisonValue1 = (((productValue3 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue2 * 2.0f) + (-1.0f))) - (((productValue3 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                        float comparisonValue2 = (((productValue4 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue3 * 2.0f) + (-1.0f))) - (((productValue4 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue1 * 2.0f) + (-1.0f)));
                        float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                        float comparisonValue5 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                        float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue5, 0.25f), float3(comparisonValue3, comparisonValue5, 0.25f)));
                        float productValue5 = inverseLengthValue1 * multiplyAddValue2;
                        branchMergedValue13 = productValue5 * comparisonValue3;
                        branchMergedValue16 = productValue5 * comparisonValue5;
                        branchMergedValue17 = inverseLengthValue1 * 0.25f;
#elif RD_FEATURE_TINTING == RD_OFF
                        float productValue21 = frac(float(int(uint(int(float(int(vectorValue6.x)))))) * multiplyAddValue);
                        float productValue22 = frac(float(int(uint(int(float(int(vectorValue6.y)))))) * multiplyAddValue1);
                        float comparisonValue12 = (((productValue21 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue2 * 2.0f) + (-1.0f))) - (((productValue21 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                        float comparisonValue13 = (((productValue22 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue3 * 2.0f) + (-1.0f))) - (((productValue22 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue1 * 2.0f) + (-1.0f)));
                        float comparisonValue14 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                        float comparisonValue15 = ((abs(comparisonValue13) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue13;
                        float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue14, comparisonValue15, 0.25f), float3(comparisonValue14, comparisonValue15, 0.25f)));
                        float productValue23 = inverseLengthValue8 * multiplyAddValue2;
                        branchMergedValue13 = productValue23 * comparisonValue14;
                        branchMergedValue16 = productValue23 * comparisonValue15;
                        branchMergedValue17 = inverseLengthValue8 * 0.25f;
#endif
                    }
                    else
                    {
                        branchMergedValue13 = 0.0f;
                        branchMergedValue16 = 0.0f;
                        branchMergedValue17 = 1.0f;
                    }
                    branchMergedValue9 = branchMergedValue13;
                    branchMergedValue10 = branchMergedValue16;
                    branchMergedValue11 = branchMergedValue17;
                }
                branchMergedValue3 = branchMergedValue9;
                branchMergedValue5 = branchMergedValue10;
                branchMergedValue6 = branchMergedValue11;
            }
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
        }
        else
        {
            float multiplyAddValue3 = mad(varyingTexCoord2.z, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.x, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.z);
            float multiplyAddValue4 = mad(varyingTexCoord2.w, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.w);
            float multiplyAddValue5 = clamp(mad(min(RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w - RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.w), -1.0f, 2.0f), 0.0f, 1.0f);
            float branchMergedValue4;
            float branchMergedValue7;
            float branchMergedValue8;
            if (multiplyAddValue5 > 0.0f)
            {
#if RD_FEATURE_TINTING == RD_ON
                uint unusedTextureMipCount256;
                uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount256);
                float productValue6 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue3;
                float productValue7 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue4;
                float scalarValue10 = frac(productValue6);
                float scalarValue11 = frac(productValue7);
#elif RD_FEATURE_TINTING == RD_OFF
                uint unusedTextureMipCount247;
                uint2 vectorValue7 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount247);
                float productValue24 = float(int(uint(int(float(int(vectorValue7.x)))))) * multiplyAddValue3;
                float productValue25 = float(int(uint(int(float(int(vectorValue7.y)))))) * multiplyAddValue4;
                float scalarValue18 = frac(productValue24);
                float scalarValue19 = frac(productValue25);
#endif
                float comparisonValue4;
#if RD_FEATURE_TINTING == RD_ON
                if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_TINTING == RD_OFF
                if (abs(scalarValue18 + (-0.5f)) < 0.0625f)
#endif
                {
#if RD_FEATURE_TINTING == RD_ON
                    comparisonValue4 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#elif RD_FEATURE_TINTING == RD_OFF
                    comparisonValue4 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#endif
                }
                else
                {
                    comparisonValue4 = multiplyAddValue3;
                }
                float comparisonValue9;
#if RD_FEATURE_TINTING == RD_ON
                if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_TINTING == RD_OFF
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#endif
                {
#if RD_FEATURE_TINTING == RD_ON
                    comparisonValue9 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif RD_FEATURE_TINTING == RD_OFF
                    comparisonValue9 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                }
                else
                {
                    comparisonValue9 = multiplyAddValue4;
                }
                float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue4, comparisonValue9));
                float scalarValue12 = vectorValue4.x;
                float scalarValue13 = vectorValue4.y;
                float scalarValue14 = vectorValue4.z;
                float scalarValue15 = vectorValue4.w;
#if RD_FEATURE_TINTING == RD_ON
                float sumValue3 = frac(productValue6 + 0.5f);
                float sumValue4 = frac(productValue7 + 0.5f);
                bool conditionValue3 = sumValue4 > 0.5f;
#elif RD_FEATURE_TINTING == RD_OFF
                float sumValue12 = frac(productValue24 + 0.5f);
                float sumValue13 = frac(productValue25 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#endif
                float intermediateValue1[2];
#if RD_FEATURE_TINTING == RD_ON
                intermediateValue1[0u] = conditionValue3 ? scalarValue12 : scalarValue15;
                intermediateValue1[1u] = conditionValue3 ? scalarValue13 : scalarValue14;
                float clampedValue6 = intermediateValue1[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue7 = intermediateValue1[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue5 = clampedValue6 - clampedValue7;
                bool conditionValue4 = sumValue3 > 0.5f;
                intermediateValue1[0u] = conditionValue4 ? scalarValue14 : scalarValue15;
                intermediateValue1[1u] = conditionValue4 ? scalarValue13 : scalarValue12;
                float clampedValue8 = intermediateValue1[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue8, 0.25f), float3(sumValue5, clampedValue8, 0.25f)));
                float productValue8 = inverseLengthValue2 * multiplyAddValue5;
                branchMergedValue4 = productValue8 * sumValue5;
                branchMergedValue7 = productValue8 * clampedValue8;
                branchMergedValue8 = inverseLengthValue2 * 0.25f;
#elif RD_FEATURE_TINTING == RD_OFF
                intermediateValue1[0u] = conditionValue8 ? scalarValue12 : scalarValue15;
                intermediateValue1[1u] = conditionValue8 ? scalarValue13 : scalarValue14;
                float clampedValue13 = intermediateValue1[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue14 = intermediateValue1[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue13 - clampedValue14;
                bool conditionValue9 = sumValue12 > 0.5f;
                intermediateValue1[0u] = conditionValue9 ? scalarValue14 : scalarValue15;
                intermediateValue1[1u] = conditionValue9 ? scalarValue13 : scalarValue12;
                float clampedValue15 = intermediateValue1[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue9 = rsqrt(dot(float3(sumValue14, clampedValue15, 0.25f), float3(sumValue14, clampedValue15, 0.25f)));
                float productValue26 = inverseLengthValue9 * multiplyAddValue5;
                branchMergedValue4 = productValue26 * sumValue14;
                branchMergedValue7 = productValue26 * clampedValue15;
                branchMergedValue8 = inverseLengthValue9 * 0.25f;
#endif
            }
            else
            {
                branchMergedValue4 = 0.0f;
                branchMergedValue7 = 0.0f;
                branchMergedValue8 = 1.0f;
            }
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue7;
            branchMergedValue2 = branchMergedValue8;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
    }
    else
    {
        float4 sampledTextureValue2 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord2.z, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.x, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.z), mad(varyingTexCoord2.w, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_1.w)));
        intermediateValue3 = (sampledTextureValue2.x * 2.0f) + (-1.0f);
        intermediateValue4 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
        intermediateValue5 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
    }
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue & 1u) == 0u)
    {
        intermediateValue13 = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.z;
        intermediateValue14 = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.w;
        intermediateValue15 = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_2.y;
        intermediateValue16 = RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
    }
    else
    {
        float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord2.z, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.x, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.z), mad(varyingTexCoord2.w, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.y, RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_0.w)));
        intermediateValue13 = sampledTextureValue3.y;
        intermediateValue14 = sampledTextureValue3.x;
        intermediateValue15 = sampledTextureValue3.z;
        intermediateValue16 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_BANNER_BASE_PBR_TEXTURE_DATA_ROW_3.x;
    }
    float comparisonValue6 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue8 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
    float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, comparisonValue8), float3(comparisonValue6, comparisonValue7, comparisonValue8)));
    float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
    float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue3;
    float multiplyAddValue6 = mad(inverseLengthValue3 * comparisonValue6, intermediateValue5, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue4, inverseLengthValue5 * varyingTangent0.x));
    float multiplyAddValue7 = mad(inverseLengthValue3 * comparisonValue7, intermediateValue5, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue4, inverseLengthValue5 * varyingTangent0.y));
    float multiplyAddValue8 = mad(inverseLengthValue3 * comparisonValue8, intermediateValue5, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue4, inverseLengthValue5 * varyingTangent0.z));
    float sumValue6 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float productValue9 = inverseLengthValue6 * multiplyAddValue6;
    float productValue10 = inverseLengthValue6 * multiplyAddValue7;
    float productValue11 = inverseLengthValue6 * multiplyAddValue8;
    float quotientValue = 1.0f / ((abs(productValue10) + abs(productValue9)) + abs(productValue11));
    float productValue12 = quotientValue * productValue9;
    float productValue13 = quotientValue * productValue10;
    bool conditionValue5 = productValue11 < 0.0f;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue14 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue14, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue14 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue14, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue14 * productValue14) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue14, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue15 = clampedValue * 0.16666667163372039794921875f;
    float productValue16 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue17 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue9 = ceil(clamp(max(max(productValue15, productValue17), max(productValue16, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
    fragmentColor0.x = ((uint(clamp(intermediateValue15, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue15 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue16 / clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue17 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if RD_FEATURE_TINTING == RD_ON
    fragmentColor1.x = sampledTextureValue.x * varyingColor0.x;
    fragmentColor1.y = sampledTextureValue.y * varyingColor0.y;
    fragmentColor1.z = sampledTextureValue.z * varyingColor0.z;
#elif RD_FEATURE_TINTING == RD_OFF
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
#endif
    fragmentColor1.w = (intermediateValue14 > intermediateValue16) ? ((intermediateValue14 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue16 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue12 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue13))) : productValue12;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue12)) * ((productValue13 < 0.0f) ? (-1.0f) : 1.0f)) : productValue13;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue10)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue10)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
