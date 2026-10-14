// ColorPostProcessing / ColorPostProcess / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ColorPostProcessing/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
#endif
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_TONEMAP_PARAMS0.z);
  if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture3.Sample(textureSampler3, float2(0.5,0.5)).xyzw;
    workingVector0.w = 0.180000007 / workingVector1.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = materialTexture3.Sample(textureSampler3, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
#endif
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    workingVector0.xyz = workingVector0.xyz / workingVector0.www;
  }
  workingVector0.w = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_EXPOSURE_COMPENSATION.z);
  if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).xyzw;
    workingVector0.w = max(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x, workingVector1.x);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = materialTexture0.Sample(textureSampler0, float2(0.5,0.5)).x;
    workingVector0.w = max(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x, workingVector0.w);
#endif
    workingVector0.w = min(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.y, workingVector0.w);
  } else {
    workingVector0.w = 0.180000007;
  }
  workingVector1.x = (int)RD_UNIFORM_EXPOSURE_COMPENSATION.x;
  workingVector1.y = RD_COMPARISON_MASK(0 < (int)workingVector1.x);
  workingVector1.z = RD_COMPARISON_MASK((int)workingVector1.x < 2);
  workingVector1.y = workingVector1.z ? workingVector1.y : 0;
  if (workingVector1.y != 0) {
    workingVector1.y = 1 + workingVector0.w;
    workingVector1.y = log2(workingVector1.y);
    workingVector1.y = workingVector1.y * 0.30103001 + 2;
    workingVector1.y = 2 / workingVector1.y;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector2.x = 1.02999997 + -workingVector1.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.y = 1.02999997 + -workingVector1.y;
#endif
  } else {
    workingVector1.x = RD_COMPARISON_MASK(1 < (int)workingVector1.x);
    if (workingVector1.x != 0) {
      workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.y == RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x);
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector1.y = log2(workingVector0.w);
      workingVector1.zw = log2(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.xy);
      workingVector1.yz = float2(3,3) + workingVector1.yz;
      workingVector1.y = workingVector1.y + -workingVector1.z;
      workingVector1.z = workingVector1.w + -workingVector1.z;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector1.z = log2(workingVector0.w);
#endif
      workingVector1.z = 3 + workingVector1.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector1.y = workingVector1.y / workingVector1.z;
      workingVector1.x = workingVector1.x ? 0.5 : workingVector1.y;
      workingVector1.y = 0.5;
      workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector2.xy = log2(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.xy);
      workingVector1.w = 3 + workingVector2.x;
      workingVector1.z = workingVector1.z + -workingVector1.w;
      workingVector1.w = workingVector2.y + -workingVector1.w;
      workingVector1.w = 3 + workingVector1.w;
      workingVector1.z = workingVector1.z / workingVector1.w;
      workingVector2.x = workingVector1.x ? 0.5 : workingVector1.z;
      workingVector2.y = 0.5;
      workingVector1.y = materialTexture2.Sample(textureSampler2, workingVector2.xy).x;
#endif
    } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector2.x = RD_UNIFORM_EXPOSURE_COMPENSATION.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector1.y = RD_UNIFORM_EXPOSURE_COMPENSATION.y;
#endif
    }
  }
  workingVector1.x = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.x != 0.000000);
  if (workingVector1.y != 0) {
    workingVector1.y = (int)RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.z;
    workingVector2.yzw = RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.yyy * float3(0.000154118257,0.00084242021,4.22806261e-005) + float3(0.860117733,1,0.317398727);
    workingVector1.z = RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y;
    workingVector2.yzw = workingVector1.zzz * float3(1.28641219e-007,7.08145137e-007,4.20481676e-008) + workingVector2.yzw;
    workingVector1.w = workingVector2.y / workingVector2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.x != 0.000000);
  if (workingVector1.z != 0) {
    workingVector1.z = (int)RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.z;
    workingVector2.xyz = RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.yyy * float3(0.000154118257,0.00084242021,4.22806261e-005) + float3(0.860117733,1,0.317398727);
    workingVector1.w = RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y;
    workingVector2.xyz = workingVector1.www * float3(1.28641219e-007,7.08145137e-007,4.20481676e-008) + workingVector2.xyz;
    workingVector2.x = workingVector2.x / workingVector2.y;
#endif
    workingVector2.y = -RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * 2.8974182e-005 + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.z = workingVector1.z * 1.61456057e-007 + workingVector2.y;
    workingVector1.z = workingVector2.w / workingVector1.z;
    workingVector3.x = 3 * workingVector1.w;
    workingVector3.y = workingVector1.z + workingVector1.z;
    workingVector1.w = workingVector1.w + workingVector1.w;
    workingVector1.z = -workingVector1.z * 8 + workingVector1.w;
    workingVector1.z = 4 + workingVector1.z;
    workingVector1.zw = workingVector3.xy / workingVector1.zz;
    workingVector3.x = workingVector1.z / workingVector1.w;
    workingVector1.z = 1 + -workingVector1.z;
    workingVector1.z = workingVector1.z + -workingVector1.w;
    workingVector3.z = workingVector1.z / workingVector1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.w = workingVector1.w * 1.61456057e-007 + workingVector2.y;
    workingVector1.w = workingVector2.z / workingVector1.w;
    workingVector3.x = 3 * workingVector2.x;
    workingVector3.y = workingVector1.w + workingVector1.w;
    workingVector2.x = workingVector2.x + workingVector2.x;
    workingVector1.w = -workingVector1.w * 8 + workingVector2.x;
    workingVector1.w = 4 + workingVector1.w;
    workingVector2.xy = workingVector3.xy / workingVector1.ww;
    workingVector3.x = workingVector2.x / workingVector2.y;
    workingVector1.w = 1 + -workingVector2.x;
    workingVector1.w = workingVector1.w + -workingVector2.y;
    workingVector3.z = workingVector1.w / workingVector2.y;
#endif
    workingVector3.y = 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector4.x = dot(float3(0.732800007,0.4296,-0.162400007), workingVector3.xyz);
    workingVector4.y = dot(float3(-0.703599989,1.69749999,0.00609999988), workingVector3.xyz);
    workingVector4.z = dot(float3(0.00300000003,0.0136000002,0.983399987), workingVector3.xyz);
    workingVector2.yzw = float3(0.949252963,1.03541911,1.08718348) / workingVector4.xyz;
    workingVector3.xyz = float3(1.05346,0.965792477,0.919807971) * workingVector4.xyz;
    workingVector1.yzw = workingVector1.yyy ? workingVector3.xyz : workingVector2.yzw;
    workingVector2.yz = float2(0.389999986,0.0710000023) * workingVector1.yz;
    workingVector3.xyz = float3(0.389999986,0.0710000023,0.023) * workingVector1.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector2.x = dot(float3(0.732800007,0.4296,-0.162400007), workingVector3.xyz);
    workingVector2.y = dot(float3(-0.703599989,1.69749999,0.00609999988), workingVector3.xyz);
    workingVector2.z = dot(float3(0.00300000003,0.0136000002,0.983399987), workingVector3.xyz);
    workingVector3.xyz = float3(0.949252963,1.03541911,1.08718348) / workingVector2.xyz;
    workingVector2.xyz = float3(1.05346,0.965792477,0.919807971) * workingVector2.xyz;
    workingVector2.xyz = workingVector1.zzz ? workingVector2.xyz : workingVector3.xyz;
    workingVector1.zw = float2(0.389999986,0.0710000023) * workingVector2.xy;
    workingVector3.xyz = float3(0.389999986,0.0710000023,0.023) * workingVector2.xyz;
#endif
    workingVector4.x = dot(float3(2.85899997,-1.62899995,-0.0250000004), workingVector3.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector5.xyz = float3(0.550000012,0.963,0.128000006) * workingVector1.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector5.xyz = float3(0.550000012,0.963,0.128000006) * workingVector2.xyz;
#endif
    workingVector4.y = dot(float3(2.85899997,-1.62899995,-0.0250000004), workingVector5.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector1.yzw = float3(0.00899999961,0.00100000005,0.93599999) * workingVector1.yzw;
    workingVector4.z = dot(float3(2.85899997,-1.62899995,-0.0250000004), workingVector1.yzw);
    workingVector6.x = dot(float2(-0.209999993,1.15799999), workingVector2.yz);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector2.xyz = float3(0.00899999961,0.00100000005,0.93599999) * workingVector2.xyz;
    workingVector4.z = dot(float3(2.85899997,-1.62899995,-0.0250000004), workingVector2.xyz);
    workingVector6.x = dot(float2(-0.209999993,1.15799999), workingVector1.zw);
#endif
    workingVector6.y = dot(float2(-0.209999993,1.15799999), workingVector5.xy);
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector6.z = dot(float2(-0.209999993,1.15799999), workingVector1.yz);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector6.z = dot(float2(-0.209999993,1.15799999), workingVector2.xy);
#endif
    workingVector3.x = dot(float3(-0.0419999994,-0.118000001,1.06900001), workingVector3.xyz);
    workingVector3.y = dot(float3(-0.0419999994,-0.118000001,1.06900001), workingVector5.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector3.z = dot(float3(-0.0419999994,-0.118000001,1.06900001), workingVector1.yzw);
    workingVector4.x = dot(workingVector4.xyz, workingVector0.xyz);
    workingVector4.y = dot(workingVector6.xyz, workingVector0.xyz);
    workingVector4.z = dot(workingVector3.xyz, workingVector0.xyz);
    workingVector0.xyz = workingVector4.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector3.z = dot(float3(-0.0419999994,-0.118000001,1.06900001), workingVector2.xyz);
    workingVector2.x = dot(workingVector4.xyz, workingVector0.xyz);
    workingVector2.y = dot(workingVector6.xyz, workingVector0.xyz);
    workingVector2.z = dot(workingVector3.xyz, workingVector0.xyz);
    workingVector0.xyz = workingVector2.xyz;
#endif
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.w != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.w != 0.000000);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.w != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.w != 0.000000);
#endif
  workingVector2.yzw = RD_UNIFORM_COLOR_GRADING_MISC.yzx * workingVector0.www;
  workingVector2.y = RD_COMPARISON_MASK(workingVector1.x >= workingVector2.y);
#if RD_PLATFORM == RD_PLATFORM_SM50
  workingVector3.x = workingVector1.z ? workingVector2.y : 0;
#endif
  workingVector2.z = RD_COMPARISON_MASK(workingVector2.z >= workingVector1.x);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector3.xy = workingVector1.yw ? workingVector2.yz : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector3.y = workingVector2.z ? workingVector2.x : 0;
#endif
  workingVector3.z = RD_COMPARISON_MASK(workingVector1.x < workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.w = workingVector1.w ? workingVector3.z : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector2.x = workingVector2.x ? workingVector3.z : 0;
#endif
  workingVector3.w = -workingVector0.w * RD_UNIFORM_COLOR_GRADING_MISC.z + workingVector1.x;
  workingVector4.x = -workingVector0.w * RD_UNIFORM_COLOR_GRADING_MISC.z + workingVector0.w;
  workingVector3.w = workingVector3.w / workingVector4.x;
  workingVector4.xyz = -RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.xyz + RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.xyz;
  workingVector4.xyz = workingVector3.www * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.xyz;
  workingVector4.w = RD_COMPARISON_MASK(workingVector0.w < workingVector1.x);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = workingVector1.y ? workingVector4.w : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = workingVector1.z ? workingVector4.w : 0;
#endif
  workingVector1.x = workingVector1.x + -workingVector0.w;
  workingVector5.x = workingVector0.w * RD_UNIFORM_COLOR_GRADING_MISC.y + -workingVector0.w;
  workingVector1.x = workingVector1.x / workingVector5.x;
  workingVector5.xyz = -RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.xyz;
  workingVector5.xyz = workingVector1.xxx * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector5.xyz = workingVector1.yyy ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : workingVector5.xyz;
  workingVector1.yzw = workingVector1.zzz ? workingVector4.xyz : float3(1,1,1);
  workingVector1.yzw = workingVector3.yyy ? RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.xyz : workingVector1.yzw;
  workingVector1.yzw = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.xyz : workingVector1.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector5.xyz = workingVector1.zzz ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.xyz;
  workingVector4.xyz = workingVector2.xxx ? workingVector4.xyz : workingVector5.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : float3(1,1,1);
  workingVector4.xyz = workingVector3.yyy ? RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.xyz : workingVector4.xyz;
  workingVector4.xyz = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.xyz : workingVector4.xyz;
#endif
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz / workingVector2.www;
  workingVector0.xyz = log2(workingVector0.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyz = workingVector1.yzw * workingVector0.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.xyz = workingVector4.xyz * workingVector0.xyz;
#endif
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector0.xyz = workingVector2.www * workingVector0.xyz;
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.w != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.w != 0.000000);
  workingVector2.w = workingVector2.y ? workingVector1.y : 0;
  workingVector3.x = workingVector2.z ? workingVector1.w : 0;
  workingVector1.w = workingVector1.w ? workingVector3.z : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.w != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.w != 0.000000);
  workingVector2.w = workingVector2.y ? workingVector1.z : 0;
  workingVector3.x = workingVector2.z ? workingVector2.x : 0;
  workingVector2.x = workingVector2.x ? workingVector3.z : 0;
#endif
  workingVector4.xyz = -RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.xyz + RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.xyz;
  workingVector4.xyz = workingVector3.www * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = workingVector1.y ? workingVector4.w : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = workingVector1.z ? workingVector4.w : 0;
#endif
  workingVector5.xyz = -RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.xyz;
  workingVector5.xyz = workingVector1.xxx * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector5.xyz = workingVector1.yyy ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : workingVector5.xyz;
  workingVector1.yzw = workingVector1.zzz ? workingVector4.xyz : float3(1,1,1);
  workingVector1.yzw = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.xyz : workingVector1.yzw;
  workingVector1.yzw = workingVector2.www ? RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.xyz : workingVector1.yzw;
  workingVector2.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.xyz = -workingVector2.www + workingVector0.xyz;
  workingVector0.xyz = workingVector1.yzw * workingVector0.xyz + workingVector2.www;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector5.xyz = workingVector1.zzz ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.xyz;
  workingVector4.xyz = workingVector2.xxx ? workingVector4.xyz : workingVector5.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : float3(1,1,1);
  workingVector4.xyz = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.xyz : workingVector4.xyz;
  workingVector4.xyz = workingVector2.www ? RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.xyz : workingVector4.xyz;
  workingVector1.z = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  workingVector0.xyz = -workingVector1.zzz + workingVector0.xyz;
  workingVector0.xyz = workingVector4.xyz * workingVector0.xyz + workingVector1.zzz;
#endif
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.w != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.w != 0.000000);
  workingVector2.w = workingVector2.y ? workingVector1.y : 0;
  workingVector3.x = workingVector2.z ? workingVector1.w : 0;
  workingVector1.w = workingVector1.w ? workingVector3.z : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.w != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.w != 0.000000);
  workingVector2.w = workingVector2.y ? workingVector1.z : 0;
  workingVector3.x = workingVector2.z ? workingVector2.x : 0;
  workingVector2.x = workingVector2.x ? workingVector3.z : 0;
#endif
  workingVector4.xyz = -RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.xyz + RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.xyz;
  workingVector4.xyz = workingVector3.www * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = workingVector1.y ? workingVector4.w : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = workingVector1.z ? workingVector4.w : 0;
#endif
  workingVector5.xyz = -RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.xyz;
  workingVector5.xyz = workingVector1.xxx * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector5.xyz = workingVector1.yyy ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : workingVector5.xyz;
  workingVector1.yzw = workingVector1.zzz ? workingVector4.xyz : float3(1,1,1);
  workingVector1.yzw = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.xyz : workingVector1.yzw;
  workingVector1.yzw = workingVector2.www ? RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.xyz : workingVector1.yzw;
  workingVector0.xyz = workingVector1.yzw * workingVector0.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector5.xyz = workingVector1.zzz ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.xyz;
  workingVector4.xyz = workingVector2.xxx ? workingVector4.xyz : workingVector5.xyz;
  workingVector4.xyz = workingVector1.www ? workingVector4.xyz : float3(1,1,1);
  workingVector4.xyz = workingVector3.xxx ? RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.xyz : workingVector4.xyz;
  workingVector4.xyz = workingVector2.www ? RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.xyz : workingVector4.xyz;
  workingVector0.xyz = workingVector4.xyz * workingVector0.xyz;
#endif
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.w != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.w != 0.000000);
  workingVector2.yz = workingVector2.yz ? workingVector1.yw : 0;
  workingVector1.w = workingVector1.w ? workingVector3.z : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.w != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.w != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.w != 0.000000);
  workingVector2.y = workingVector2.y ? workingVector1.z : 0;
  workingVector2.z = workingVector2.z ? workingVector2.x : 0;
  workingVector2.x = workingVector2.x ? workingVector3.z : 0;
#endif
  workingVector3.xyz = RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.xyz;
  workingVector3.xyz = workingVector3.www * workingVector3.xyz + RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.y = workingVector1.y ? workingVector4.w : 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector1.z = workingVector1.z ? workingVector4.w : 0;
#endif
  workingVector4.xyz = -RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.xyz;
  workingVector4.xyz = workingVector1.xxx * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.xyz;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector4.xyz = workingVector1.yyy ? workingVector4.xyz : RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.xyz;
  workingVector1.xyw = workingVector1.www ? workingVector3.xyz : workingVector4.xyz;
  workingVector1.xyz = workingVector1.zzz ? workingVector1.xyw : 0;
  workingVector1.xyz = workingVector2.zzz ? RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.xyz : workingVector1.xyz;
  workingVector1.xyz = workingVector2.yyy ? RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.xyz : workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector4.xyz = workingVector1.zzz ? workingVector4.xyz : RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.xyz;
  workingVector3.xyz = workingVector2.xxx ? workingVector3.xyz : workingVector4.xyz;
  workingVector1.xzw = workingVector1.www ? workingVector3.xyz : 0;
  workingVector1.xzw = workingVector2.zzz ? RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.xyz : workingVector1.xzw;
  workingVector1.xzw = workingVector2.yyy ? RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.xyz : workingVector1.xzw;
  workingVector0.xyz = workingVector0.www * workingVector1.xzw + workingVector0.xyz;
#endif
  workingVector0.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_TONEMAP_PARAMS0.y >= 0.5);
  if (workingVector1.x != 0) {
    workingVector1.x = max(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.z, RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.w);
    workingVector0.w = 0.180000007 / workingVector0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector0.w = workingVector0.w * workingVector2.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = workingVector0.w * workingVector1.y;
#endif
    workingVector1.yzw = workingVector0.xyz * workingVector0.www;
    workingVector1.x = workingVector0.w * workingVector1.x;
    workingVector2.x = (int)RD_UNIFORM_TONEMAP_PARAMS0.x;
    workingVector1.x = workingVector1.x * workingVector1.x;
    switch (workingVector2.x) {
      case 1 :      workingVector3.xyz = workingVector1.yzw / workingVector1.xxx;
      workingVector3.xyz = float3(1,1,1) + workingVector3.xyz;
      workingVector3.xyz = workingVector3.xyz * workingVector1.yzw;
      workingVector4.xyz = workingVector0.xyz * workingVector0.www + float3(1,1,1);
      workingVector3.xyz = workingVector3.xyz / workingVector4.xyz;
      workingVector2.w = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector4.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector4.zw = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector4.z = RD_COMPARISON_MASK(workingVector2.w >= workingVector4.z);
      workingVector4.z = workingVector3.w ? workingVector4.z : 0;
      workingVector4.w = RD_COMPARISON_MASK(workingVector4.w >= workingVector2.w);
      workingVector4.w = workingVector4.w ? workingVector4.y : 0;
      workingVector5.x = RD_COMPARISON_MASK(workingVector2.w < 0.180000007);
      workingVector4.y = workingVector4.y ? workingVector5.x : 0;
      workingVector5.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector2.w;
      workingVector5.y = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector5.x = workingVector5.x / workingVector5.y;
      workingVector5.yzw = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.xyz = workingVector5.xxx * workingVector5.yzw + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.w = RD_COMPARISON_MASK(0.180000007 < workingVector2.w);
      workingVector3.w = workingVector3.w ? workingVector5.w : 0;
      workingVector2.w = -0.180000007 + workingVector2.w;
      workingVector5.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector2.w = workingVector2.w / workingVector5.w;
      workingVector6.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector6.xyz = workingVector2.www * workingVector6.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector6.xyz = workingVector3.www ? workingVector6.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector4.yyy ? workingVector5.xyz : workingVector6.xyz;
      workingVector5.xyz = workingVector4.xxx ? workingVector5.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector4.xyw = workingVector4.www ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector5.xyz;
      workingVector4.xyz = workingVector4.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector4.xyw;
      workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector4.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector4.xyz;
      workingVector5.xyz = float3(1,1,1) / workingVector4.xyz;
      workingVector6.xyz = max(float3(0,0,0), workingVector3.xyz);
      workingVector6.xyz = log2(workingVector6.xyz);
      workingVector5.xyz = workingVector6.xyz * workingVector5.xyz;
      workingVector5.xyz = exp2(workingVector5.xyz);
      workingVector6.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
      workingVector7.xyz = log2(abs(workingVector3.xyz));
      workingVector7.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector7.xyz;
      workingVector7.xyz = exp2(workingVector7.xyz);
      workingVector7.xyz = workingVector7.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector3.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz ? workingVector6.xyz : workingVector7.xyz;
      workingVector4.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector4.xyz;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.xyz = workingVector2.www ? workingVector5.xyz : workingVector3.xyz;
      break;
      case 2 :      workingVector2.w = dot(workingVector1.yzw, float3(0.212599993,0.715200007,0.0722000003));
      workingVector3.x = workingVector2.w / workingVector1.x;
      workingVector3.x = 1 + workingVector3.x;
      workingVector3.x = workingVector3.x * workingVector2.w;
      workingVector3.y = 1 + workingVector2.w;
      workingVector3.x = workingVector3.x / workingVector3.y;
      workingVector2.w = workingVector3.x / workingVector2.w;
      workingVector3.xyz = workingVector2.www * workingVector1.yzw;
      workingVector2.w = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector4.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector4.zw = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector4.z = RD_COMPARISON_MASK(workingVector2.w >= workingVector4.z);
      workingVector4.z = workingVector3.w ? workingVector4.z : 0;
      workingVector4.w = RD_COMPARISON_MASK(workingVector4.w >= workingVector2.w);
      workingVector4.w = workingVector4.w ? workingVector4.y : 0;
      workingVector5.x = RD_COMPARISON_MASK(workingVector2.w < 0.180000007);
      workingVector4.y = workingVector4.y ? workingVector5.x : 0;
      workingVector5.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector2.w;
      workingVector5.y = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector5.x = workingVector5.x / workingVector5.y;
      workingVector5.yzw = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.xyz = workingVector5.xxx * workingVector5.yzw + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.w = RD_COMPARISON_MASK(0.180000007 < workingVector2.w);
      workingVector3.w = workingVector3.w ? workingVector5.w : 0;
      workingVector2.w = -0.180000007 + workingVector2.w;
      workingVector5.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector2.w = workingVector2.w / workingVector5.w;
      workingVector6.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector6.xyz = workingVector2.www * workingVector6.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector6.xyz = workingVector3.www ? workingVector6.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector4.yyy ? workingVector5.xyz : workingVector6.xyz;
      workingVector5.xyz = workingVector4.xxx ? workingVector5.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector4.xyw = workingVector4.www ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector5.xyz;
      workingVector4.xyz = workingVector4.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector4.xyw;
      workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector4.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector4.xyz;
      workingVector5.xyz = float3(1,1,1) / workingVector4.xyz;
      workingVector6.xyz = max(float3(0,0,0), workingVector3.xyz);
      workingVector6.xyz = log2(workingVector6.xyz);
      workingVector5.xyz = workingVector6.xyz * workingVector5.xyz;
      workingVector5.xyz = exp2(workingVector5.xyz);
      workingVector6.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
      workingVector7.xyz = log2(abs(workingVector3.xyz));
      workingVector7.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector7.xyz;
      workingVector7.xyz = exp2(workingVector7.xyz);
      workingVector7.xyz = workingVector7.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector3.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz ? workingVector6.xyz : workingVector7.xyz;
      workingVector4.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector4.xyz;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.xyz = workingVector2.www ? workingVector5.xyz : workingVector3.xyz;
      break;
      case 3 :      workingVector3.xyz = workingVector1.yzw + workingVector1.yzw;
      workingVector4.xyz = workingVector1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.0500000007,0.0500000007,0.0500000007);
      workingVector4.xyz = workingVector3.xyz * workingVector4.xyz + float3(0.00400000019,0.00400000019,0.00400000019);
      workingVector5.xyz = workingVector1.yzw * float3(0.300000012,0.300000012,0.300000012) + float3(0.5,0.5,0.5);
      workingVector3.xyz = workingVector3.xyz * workingVector5.xyz + float3(0.0600000024,0.0600000024,0.0600000024);
      workingVector3.xyz = workingVector4.xyz / workingVector3.xyz;
      workingVector3.xyz = float3(-0.0666666627,-0.0666666627,-0.0666666627) + workingVector3.xyz;
      workingVector4.xy = workingVector1.xx * float2(0.150000006,0.150000006) + float2(0.0500000007,0.5);
      workingVector4.xy = workingVector1.xx * workingVector4.xy + float2(0.00400000019,0.0600000024);
      workingVector1.x = workingVector4.x / workingVector4.y;
      workingVector1.x = -0.0666666627 + workingVector1.x;
      workingVector1.x = 1 / workingVector1.x;
      workingVector3.xyz = workingVector3.xyz * workingVector1.xxx;
      workingVector1.x = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector4.yz = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector4.y = RD_COMPARISON_MASK(workingVector1.x >= workingVector4.y);
      workingVector4.y = workingVector2.w ? workingVector4.y : 0;
      workingVector4.z = RD_COMPARISON_MASK(workingVector4.z >= workingVector1.x);
      workingVector4.z = workingVector4.z ? workingVector4.x : 0;
      workingVector4.w = RD_COMPARISON_MASK(workingVector1.x < 0.180000007);
      workingVector4.x = workingVector4.x ? workingVector4.w : 0;
      workingVector4.w = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector1.x;
      workingVector5.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector4.w = workingVector4.w / workingVector5.x;
      workingVector5.xyz = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.xyz = workingVector4.www * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector4.w = RD_COMPARISON_MASK(0.180000007 < workingVector1.x);
      workingVector2.w = workingVector2.w ? workingVector4.w : 0;
      workingVector1.x = -0.180000007 + workingVector1.x;
      workingVector4.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector1.x = workingVector1.x / workingVector4.w;
      workingVector6.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector6.xyz = workingVector1.xxx * workingVector6.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector6.xyz = workingVector2.www ? workingVector6.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector4.xxx ? workingVector5.xyz : workingVector6.xyz;
      workingVector5.xyz = workingVector3.www ? workingVector5.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector4.xzw = workingVector4.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector5.xyz;
      workingVector4.xyz = workingVector4.yyy ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector4.xzw;
      workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector4.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector4.xyz;
      workingVector5.xyz = float3(1,1,1) / workingVector4.xyz;
      workingVector6.xyz = max(float3(0,0,0), workingVector3.xyz);
      workingVector6.xyz = log2(workingVector6.xyz);
      workingVector5.xyz = workingVector6.xyz * workingVector5.xyz;
      workingVector5.xyz = exp2(workingVector5.xyz);
      workingVector6.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
      workingVector7.xyz = log2(abs(workingVector3.xyz));
      workingVector7.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector7.xyz;
      workingVector7.xyz = exp2(workingVector7.xyz);
      workingVector7.xyz = workingVector7.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector3.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz ? workingVector6.xyz : workingVector7.xyz;
      workingVector4.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector4.xyz;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.xyz = workingVector1.xxx ? workingVector5.xyz : workingVector3.xyz;
      break;
      case 4 :      workingVector3.x = dot(float3(0.597190022,0.354579985,0.0482299998), workingVector1.yzw);
      workingVector3.y = dot(float3(0.0759999976,0.908339977,0.0156599991), workingVector1.yzw);
      workingVector3.z = dot(float3(0.0284000002,0.133829996,0.837769985), workingVector1.yzw);
      workingVector4.xyz = float3(0.0245785993,0.0245785993,0.0245785993) + workingVector3.xyz;
      workingVector4.xyz = workingVector3.xyz * workingVector4.xyz + float3(-9.05370034e-005,-9.05370034e-005,-9.05370034e-005);
      workingVector5.xyz = workingVector3.xyz * float3(0.983729005,0.983729005,0.983729005) + float3(0.432951003,0.432951003,0.432951003);
      workingVector3.xyz = workingVector3.xyz * workingVector5.xyz + float3(0.238080993,0.238080993,0.238080993);
      workingVector3.xyz = workingVector4.xyz / workingVector3.xyz;
      workingVector4.x = saturate(dot(float3(1.60475004,-0.531080008,-0.0736699998), workingVector3.xyz));
      workingVector4.y = saturate(dot(float3(-0.102080002,1.10812998,-0.00604999997), workingVector3.xyz));
      workingVector4.z = saturate(dot(float3(-0.00326999999,-0.0727600008,1.07602), workingVector3.xyz));
      workingVector1.x = dot(workingVector4.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector3.zw = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector3.z = RD_COMPARISON_MASK(workingVector1.x >= workingVector3.z);
      workingVector3.z = workingVector2.w ? workingVector3.z : 0;
      workingVector3.w = RD_COMPARISON_MASK(workingVector3.w >= workingVector1.x);
      workingVector3.w = workingVector3.w ? workingVector3.y : 0;
      workingVector4.w = RD_COMPARISON_MASK(workingVector1.x < 0.180000007);
      workingVector3.y = workingVector3.y ? workingVector4.w : 0;
      workingVector4.w = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector1.x;
      workingVector5.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector4.w = workingVector4.w / workingVector5.x;
      workingVector5.xyz = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.xyz = workingVector4.www * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector4.w = RD_COMPARISON_MASK(0.180000007 < workingVector1.x);
      workingVector2.w = workingVector2.w ? workingVector4.w : 0;
      workingVector1.x = -0.180000007 + workingVector1.x;
      workingVector4.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector1.x = workingVector1.x / workingVector4.w;
      workingVector6.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector6.xyz = workingVector1.xxx * workingVector6.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector6.xyz = workingVector2.www ? workingVector6.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector3.yyy ? workingVector5.xyz : workingVector6.xyz;
      workingVector5.xyz = workingVector3.xxx ? workingVector5.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector3.xyw = workingVector3.www ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector5.xyz;
      workingVector3.xyz = workingVector3.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector3.xyw;
      workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector3.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector3.xyz;
      workingVector5.xyz = float3(1,1,1) / workingVector3.xyz;
      workingVector6.xyz = log2(workingVector4.xyz);
      workingVector5.xyz = workingVector6.xyz * workingVector5.xyz;
      workingVector5.xyz = exp2(workingVector5.xyz);
      workingVector7.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector4.xyz;
      workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
      workingVector6.xyz = exp2(workingVector6.xyz);
      workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector4.xyz);
      workingVector4.xyz = workingVector4.xyz ? workingVector7.xyz : workingVector6.xyz;
      workingVector3.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector3.xyz;
      workingVector4.xyz = log2(workingVector4.xyz);
      workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.xyz = workingVector1.xxx ? workingVector5.xyz : workingVector3.xyz;
      break;
      case 5 :      workingVector1.x = max(workingVector1.z, workingVector1.w);
      workingVector1.x = max(workingVector1.y, workingVector1.x);
      workingVector3.xyz = workingVector1.yzw / workingVector1.xxx;
      workingVector1.x = log2(workingVector1.x);
      workingVector1.x = RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.x * workingVector1.x;
      workingVector1.x = exp2(workingVector1.x);
      workingVector2.w = RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.y * workingVector1.x + RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.z;
      workingVector1.x = workingVector1.x / workingVector2.w;
      workingVector2.w = 1 / RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.x;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz * workingVector2.www;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.w = log2(workingVector1.x);
      workingVector2.w = RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.w * workingVector2.w;
      workingVector2.w = exp2(workingVector2.w);
      workingVector4.xyz = float3(1,1,1) + -workingVector3.xyz;
      workingVector3.xyz = workingVector2.www * workingVector4.xyz + workingVector3.xyz;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.xxx * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz * workingVector1.xxx;
      workingVector1.x = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector4.yz = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector4.y = RD_COMPARISON_MASK(workingVector1.x >= workingVector4.y);
      workingVector4.y = workingVector2.w ? workingVector4.y : 0;
      workingVector4.z = RD_COMPARISON_MASK(workingVector4.z >= workingVector1.x);
      workingVector4.z = workingVector4.z ? workingVector4.x : 0;
      workingVector4.w = RD_COMPARISON_MASK(workingVector1.x < 0.180000007);
      workingVector4.x = workingVector4.x ? workingVector4.w : 0;
      workingVector4.w = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector1.x;
      workingVector5.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector4.w = workingVector4.w / workingVector5.x;
      workingVector5.xyz = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector5.xyz = workingVector4.www * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector4.w = RD_COMPARISON_MASK(0.180000007 < workingVector1.x);
      workingVector2.w = workingVector2.w ? workingVector4.w : 0;
      workingVector1.x = -0.180000007 + workingVector1.x;
      workingVector4.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector1.x = workingVector1.x / workingVector4.w;
      workingVector6.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector6.xyz = workingVector1.xxx * workingVector6.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector6.xyz = workingVector2.www ? workingVector6.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector4.xxx ? workingVector5.xyz : workingVector6.xyz;
      workingVector5.xyz = workingVector3.www ? workingVector5.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector4.xzw = workingVector4.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector5.xyz;
      workingVector4.xyz = workingVector4.yyy ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector4.xzw;
      workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector4.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector4.xyz;
      workingVector5.xyz = float3(1,1,1) / workingVector4.xyz;
      workingVector6.xyz = max(float3(0,0,0), workingVector3.xyz);
      workingVector6.xyz = log2(workingVector6.xyz);
      workingVector5.xyz = workingVector6.xyz * workingVector5.xyz;
      workingVector5.xyz = exp2(workingVector5.xyz);
      workingVector6.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
      workingVector7.xyz = log2(abs(workingVector3.xyz));
      workingVector7.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector7.xyz;
      workingVector7.xyz = exp2(workingVector7.xyz);
      workingVector7.xyz = workingVector7.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector3.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector3.xyz);
      workingVector3.xyz = workingVector3.xyz ? workingVector6.xyz : workingVector7.xyz;
      workingVector4.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector4.xyz;
      workingVector3.xyz = log2(workingVector3.xyz);
      workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
      workingVector3.xyz = exp2(workingVector3.xyz);
      workingVector2.xyz = workingVector1.xxx ? workingVector5.xyz : workingVector3.xyz;
      break;
      default :
      workingVector3.xyz = workingVector0.xyz * workingVector0.www + float3(1,1,1);
      workingVector1.xyz = workingVector1.yzw / workingVector3.xyz;
      workingVector0.w = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
      workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
      workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
      workingVector3.yz = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
      workingVector3.y = RD_COMPARISON_MASK(workingVector0.w >= workingVector3.y);
      workingVector3.y = workingVector1.w ? workingVector3.y : 0;
      workingVector3.z = RD_COMPARISON_MASK(workingVector3.z >= workingVector0.w);
      workingVector3.z = workingVector3.z ? workingVector3.x : 0;
      workingVector3.w = RD_COMPARISON_MASK(workingVector0.w < 0.180000007);
      workingVector3.x = workingVector3.x ? workingVector3.w : 0;
      workingVector3.w = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector0.w;
      workingVector4.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
      workingVector3.w = workingVector3.w / workingVector4.x;
      workingVector4.xyz = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector4.xyz = workingVector3.www * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
      workingVector3.w = RD_COMPARISON_MASK(0.180000007 < workingVector0.w);
      workingVector1.w = workingVector1.w ? workingVector3.w : 0;
      workingVector0.w = -0.180000007 + workingVector0.w;
      workingVector3.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
      workingVector0.w = workingVector0.w / workingVector3.w;
      workingVector5.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
      workingVector5.xyz = workingVector0.www * workingVector5.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector5.xyz = workingVector1.www ? workingVector5.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
      workingVector4.xyz = workingVector3.xxx ? workingVector4.xyz : workingVector5.xyz;
      workingVector4.xyz = workingVector2.www ? workingVector4.xyz : float3(2.20000005,2.20000005,2.20000005);
      workingVector3.xzw = workingVector3.zzz ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector4.xyz;
      workingVector3.xyz = workingVector3.yyy ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector3.xzw;
      workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
      workingVector3.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector3.xyz;
      workingVector4.xyz = float3(1,1,1) / workingVector3.xyz;
      workingVector5.xyz = max(float3(0,0,0), workingVector1.xyz);
      workingVector5.xyz = log2(workingVector5.xyz);
      workingVector4.xyz = workingVector5.xyz * workingVector4.xyz;
      workingVector4.xyz = exp2(workingVector4.xyz);
      workingVector5.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector1.xyz;
      workingVector6.xyz = log2(abs(workingVector1.xyz));
      workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
      workingVector6.xyz = exp2(workingVector6.xyz);
      workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
      workingVector1.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector1.xyz);
      workingVector1.xyz = workingVector1.xyz ? workingVector5.xyz : workingVector6.xyz;
      workingVector3.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector3.xyz;
      workingVector1.xyz = log2(workingVector1.xyz);
      workingVector1.xyz = workingVector3.xyz * workingVector1.xyz;
      workingVector1.xyz = exp2(workingVector1.xyz);
      workingVector2.xyz = workingVector0.www ? workingVector4.xyz : workingVector1.xyz;
      break;
    }
  } else {
    workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.000000);
    workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w != 0.000000);
    workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.000000);
    workingVector3.xy = float2(0.180000007,0.180000007) * RD_UNIFORM_COLOR_GRADING_MISC.yz;
    workingVector1.w = RD_COMPARISON_MASK(workingVector0.w >= workingVector3.x);
    workingVector1.w = workingVector1.w ? workingVector1.x : 0;
    workingVector2.w = RD_COMPARISON_MASK(workingVector3.y >= workingVector0.w);
    workingVector2.w = workingVector1.z ? workingVector2.w : 0;
    workingVector3.x = RD_COMPARISON_MASK(workingVector0.w < 0.180000007);
    workingVector1.z = workingVector1.z ? workingVector3.x : 0;
    workingVector3.x = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + workingVector0.w;
    workingVector3.y = -RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007 + 0.180000007;
    workingVector3.x = workingVector3.x / workingVector3.y;
    workingVector3.yzw = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + -RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
    workingVector3.xyz = workingVector3.xxx * workingVector3.yzw + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz;
    workingVector3.w = RD_COMPARISON_MASK(0.180000007 < workingVector0.w);
    workingVector1.x = workingVector1.x ? workingVector3.w : 0;
    workingVector0.w = -0.180000007 + workingVector0.w;
    workingVector3.w = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007 + -0.180000007;
    workingVector0.w = workingVector0.w / workingVector3.w;
    workingVector4.xyz = -RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz;
    workingVector4.xyz = workingVector0.www * workingVector4.xyz + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
    workingVector4.xyz = workingVector1.xxx ? workingVector4.xyz : RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.xyz;
    workingVector3.xyz = workingVector1.zzz ? workingVector3.xyz : workingVector4.xyz;
    workingVector1.xyz = workingVector1.yyy ? workingVector3.xyz : float3(2.20000005,2.20000005,2.20000005);
    workingVector1.xyz = workingVector2.www ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.xyz : workingVector1.xyz;
    workingVector1.xyz = workingVector1.www ? RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.xyz : workingVector1.xyz;
    workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_MISC2.x);
    workingVector1.xyz = RD_UNIFORM_COLOR_GRADING_MISC.www * workingVector1.xyz;
    workingVector3.xyz = float3(1,1,1) / workingVector1.xyz;
    workingVector4.xyz = log2(workingVector0.xyz);
    workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
    workingVector3.xyz = exp2(workingVector3.xyz);
    workingVector5.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector0.xyz;
    workingVector4.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector4.xyz;
    workingVector4.xyz = exp2(workingVector4.xyz);
    workingVector4.xyz = workingVector4.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
    workingVector0.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) >= workingVector0.xyz);
    workingVector0.xyz = workingVector0.xyz ? workingVector5.xyz : workingVector4.xyz;
    workingVector1.xyz = float3(2.20000005,2.20000005,2.20000005) / workingVector1.xyz;
    workingVector0.xyz = log2(workingVector0.xyz);
    workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
    workingVector0.xyz = exp2(workingVector0.xyz);
    workingVector2.xyz = workingVector0.www ? workingVector3.xyz : workingVector0.xyz;
  }
  workingVector0.xyz = min(float3(1,1,1), workingVector2.xyz);
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_RASTERIZED_COLOR_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector1.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
    workingVector0.w = 1 + -workingVector1.w;
    workingVector0.xyz = workingVector0.xyz * workingVector0.www + workingVector1.xyz;
  }
  fragmentColor0.xyz = workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = colorTextureTexture.Sample(colorTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float quotientValue;
    float quotientValue1;
    float quotientValue2;
    if (RD_UNIFORM_TONEMAP_PARAMS0.z > 0.0f)
    {
        float sampledTextureValue1 = (0.180000007152557373046875f / preExposureLuminanceTexture.Sample(preExposureLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        quotientValue = scalarValue / sampledTextureValue1;
        quotientValue1 = scalarValue1 / sampledTextureValue1;
        quotientValue2 = scalarValue2 / sampledTextureValue1;
    }
    else
    {
        quotientValue = scalarValue;
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
    }
    float sampledTextureValue2;
    if (RD_UNIFORM_EXPOSURE_COMPENSATION.z > 0.5f)
    {
        sampledTextureValue2 = min(max(averageLuminanceTexture.Sample(averageLuminanceSampler, 0.5f.xx).x, RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x), RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.y);
    }
    else
    {
        sampledTextureValue2 = 0.180000007152557373046875f;
    }
    uint scalarValue3 = uint(int(RD_UNIFORM_EXPOSURE_COMPENSATION.x));
    float intermediateValue4;
    if (scalarValue3 == 1u)
    {
        intermediateValue4 = 1.0299999713897705078125f - (2.0f / ((log2(sampledTextureValue2 + 1.0f) * 0.301029980182647705078125f) + 2.0f));
    }
    else
    {
        float branchMergedValue;
        if (int(scalarValue3) > int(1u))
        {
            float nonlinearValue = log2(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x);
            branchMergedValue = customExposureCompensationTexture.Sample(customExposureCompensationSampler, float2((RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.x == RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.y) ? 0.5f : ((log2(sampledTextureValue2) - nonlinearValue) / (log2(RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.y) - nonlinearValue)), 0.5f)).x;
        }
        else
        {
            branchMergedValue = RD_UNIFORM_EXPOSURE_COMPENSATION.y;
        }
        intermediateValue4 = branchMergedValue;
    }
    float dotProductValue = dot(float3(quotientValue, quotientValue1, quotientValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    float multiplyAddValue9;
    float multiplyAddValue10;
    float multiplyAddValue11;
    if (RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.x != 0.0f)
    {
        float quotientValue3 = ((((RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * 1.2864121856637211749330163002014e-07f) + 0.00015411825734190642833709716796875f) * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y) + 0.860117733478546142578125f) / ((((RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * 7.0814513719597016461193561553955e-07f) + 0.0008424202096648514270782470703125f) * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y) + 1.0f);
        float quotientValue4 = ((((RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * 4.2048167614439080352894961833954e-08f) + 4.2280626075807958841323852539062e-05f) * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y) + 0.317398726940155029296875f) / ((1.0f - (RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * 2.8974181986995972692966461181641e-05f)) + ((RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y * RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.y) * 1.6145605741257895715534687042236e-07f));
        float productValue = ((quotientValue3 * 2.0f) - (quotientValue4 * 8.0f)) + 4.0f;
        float quotientValue5 = (quotientValue3 * 3.0f) / productValue;
        float quotientValue6 = (quotientValue4 * 2.0f) / productValue;
        float quotientValue7 = quotientValue5 / quotientValue6;
        float quotientValue8 = ((1.0f - quotientValue5) - quotientValue6) / quotientValue6;
        float multiplyAddValue = mad(-0.1624000072479248046875f, quotientValue8, (quotientValue7 * 0.732800006866455078125f) + 0.4296000003814697265625f);
        float multiplyAddValue1 = mad(0.006099999882280826568603515625f, quotientValue8, 1.6974999904632568359375f - (quotientValue7 * 0.703599989414215087890625f));
        float multiplyAddValue2 = mad(0.98339998722076416015625f, quotientValue8, (quotientValue7 * 0.0030000000260770320892333984375f) + 0.013600000180304050445556640625f);
        bool comparisonValue = uint(int(RD_UNIFORM_COLOR_GRADING_TEMPERATURE_PARAMS.z)) == 0u;
        float comparisonValue1 = comparisonValue ? (0.94925296306610107421875f / multiplyAddValue) : (multiplyAddValue * 1.05346000194549560546875f);
        float comparisonValue2 = comparisonValue ? (1.03541910648345947265625f / multiplyAddValue1) : (multiplyAddValue1 * 0.965792477130889892578125f);
        float comparisonValue3 = comparisonValue ? (1.087183475494384765625f / multiplyAddValue2) : (multiplyAddValue2 * 0.919807970523834228515625f);
        float multiplyAddValue3 = mad(comparisonValue2, 0.071000002324581146240234375f, 0.0f);
        float multiplyAddValue4 = mad(comparisonValue2, 0.962999999523162841796875f, 0.0f);
        float multiplyAddValue5 = mad(comparisonValue2, 0.001000000047497451305389404296875f, 0.0f);
        float multiplyAddValue6 = mad(comparisonValue3, 0.02300000004470348358154296875f, 0.0f);
        float multiplyAddValue7 = mad(comparisonValue3, 0.12800000607967376708984375f, 0.0f);
        float multiplyAddValue8 = mad(comparisonValue3, 0.93599998950958251953125f, 0.0f);
        multiplyAddValue9 = mad(mad(-0.02500000037252902984619140625f, multiplyAddValue8, mad(-1.6289999485015869140625f, multiplyAddValue5, comparisonValue1 * 0.02573099918663501739501953125f)), quotientValue2, mad(mad(-0.02500000037252902984619140625f, multiplyAddValue7, mad(-1.6289999485015869140625f, multiplyAddValue4, comparisonValue1 * 1.57245004177093505859375f)), quotientValue1, mad(-0.02500000037252902984619140625f, multiplyAddValue6, mad(-1.6289999485015869140625f, multiplyAddValue3, comparisonValue1 * 1.11500990390777587890625f)) * quotientValue));
        multiplyAddValue10 = mad(mad(1.15799999237060546875f, multiplyAddValue5, comparisonValue1 * (-0.001889999839477241039276123046875f)), quotientValue2, mad(mad(1.15799999237060546875f, multiplyAddValue4, comparisonValue1 * (-0.115499995648860931396484375f)), quotientValue1, mad(1.15799999237060546875f, multiplyAddValue3, comparisonValue1 * (-0.081899993121623992919921875f)) * quotientValue));
        multiplyAddValue11 = mad(mad(1.0690000057220458984375f, multiplyAddValue8, mad(-0.1180000007152557373046875f, multiplyAddValue5, comparisonValue1 * (-0.000377999967895448207855224609375f))), quotientValue2, mad(mad(1.0690000057220458984375f, multiplyAddValue7, mad(-0.1180000007152557373046875f, multiplyAddValue4, comparisonValue1 * (-0.0230999998748302459716796875f))), quotientValue1, mad(1.0690000057220458984375f, multiplyAddValue6, mad(-0.1180000007152557373046875f, multiplyAddValue3, comparisonValue1 * (-0.01637999899685382843017578125f))) * quotientValue));
    }
    else
    {
        multiplyAddValue9 = quotientValue;
        multiplyAddValue10 = quotientValue1;
        multiplyAddValue11 = quotientValue2;
    }
    bool comparisonValue4 = RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.w != 0.0f;
    bool comparisonValue5 = RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.w != 0.0f;
    float productValue1 = RD_UNIFORM_COLOR_GRADING_MISC.y * sampledTextureValue2;
    bool comparisonValue6 = dotProductValue >= productValue1;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (comparisonValue5 && comparisonValue6)
    {
        intermediateValue5 = RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.x;
        intermediateValue6 = RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.y;
        intermediateValue7 = RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.z;
    }
    else
    {
        float productValue2 = RD_UNIFORM_COLOR_GRADING_MISC.z * sampledTextureValue2;
        bool comparisonValue7 = comparisonValue4 && (dotProductValue <= productValue2);
        float branchMergedValue1;
        float branchMergedValue12;
        float branchMergedValue13;
        if ((RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.w == 0.0f) || comparisonValue7)
        {
            branchMergedValue1 = comparisonValue7 ? RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.z : 1.0f;
            branchMergedValue12 = comparisonValue7 ? RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.y : 1.0f;
            branchMergedValue13 = comparisonValue7 ? RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.x : 1.0f;
        }
        else
        {
            float branchMergedValue37;
            float branchMergedValue48;
            float branchMergedValue49;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue4)
            {
                float quotientValue9 = (dotProductValue - productValue2) / (sampledTextureValue2 - productValue2);
                branchMergedValue37 = (quotientValue9 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.z;
                branchMergedValue48 = (quotientValue9 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.y;
                branchMergedValue49 = (quotientValue9 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_SHADOWS.x;
            }
            else
            {
                float branchMergedValue70;
                float branchMergedValue81;
                float branchMergedValue82;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue5)
                {
                    float quotientValue10 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue70 = (quotientValue10 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.z;
                    branchMergedValue81 = (quotientValue10 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.y;
                    branchMergedValue82 = (quotientValue10 * (RD_UNIFORM_COLOR_GRADING_CONTRAST_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.x;
                }
                else
                {
                    branchMergedValue70 = RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.z;
                    branchMergedValue81 = RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.y;
                    branchMergedValue82 = RD_UNIFORM_COLOR_GRADING_CONTRAST_MIDTONES.x;
                }
                branchMergedValue37 = branchMergedValue70;
                branchMergedValue48 = branchMergedValue81;
                branchMergedValue49 = branchMergedValue82;
            }
            branchMergedValue1 = branchMergedValue37;
            branchMergedValue12 = branchMergedValue48;
            branchMergedValue13 = branchMergedValue49;
        }
        intermediateValue5 = branchMergedValue13;
        intermediateValue6 = branchMergedValue12;
        intermediateValue7 = branchMergedValue1;
    }
    float productValue3 = RD_UNIFORM_COLOR_GRADING_MISC.x * sampledTextureValue2;
    float exponentialValue = max(exp2(log2(max(multiplyAddValue9, 0.0f) / productValue3) * intermediateValue5) * productValue3, 0.0f);
    float exponentialValue1 = max(exp2(log2(max(multiplyAddValue10, 0.0f) / productValue3) * intermediateValue6) * productValue3, 0.0f);
    float exponentialValue2 = max(exp2(log2(max(multiplyAddValue11, 0.0f) / productValue3) * intermediateValue7) * productValue3, 0.0f);
    bool comparisonValue8 = RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.w != 0.0f;
    bool comparisonValue9 = RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.w != 0.0f;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (comparisonValue6 && comparisonValue9)
    {
        intermediateValue8 = RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.x;
        intermediateValue9 = RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.y;
        intermediateValue10 = RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.z;
    }
    else
    {
        float productValue4 = RD_UNIFORM_COLOR_GRADING_MISC.z * sampledTextureValue2;
        bool comparisonValue10 = (dotProductValue <= productValue4) && comparisonValue8;
        float branchMergedValue2;
        float branchMergedValue14;
        float branchMergedValue15;
        if (comparisonValue10 || (RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.w == 0.0f))
        {
            branchMergedValue2 = comparisonValue10 ? RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.y : 1.0f;
            branchMergedValue14 = comparisonValue10 ? RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.z : 1.0f;
            branchMergedValue15 = comparisonValue10 ? RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.x : 1.0f;
        }
        else
        {
            float branchMergedValue38;
            float branchMergedValue50;
            float branchMergedValue51;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue8)
            {
                float quotientValue11 = (dotProductValue - productValue4) / (sampledTextureValue2 - productValue4);
                branchMergedValue38 = (quotientValue11 * (RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.y;
                branchMergedValue50 = (quotientValue11 * (RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.z;
                branchMergedValue51 = (quotientValue11 * (RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_SATURATION_SHADOWS.x;
            }
            else
            {
                float branchMergedValue71;
                float branchMergedValue83;
                float branchMergedValue84;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue9)
                {
                    float quotientValue12 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue71 = (quotientValue12 * (RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.y;
                    branchMergedValue83 = (quotientValue12 * (RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.z;
                    branchMergedValue84 = (quotientValue12 * (RD_UNIFORM_COLOR_GRADING_SATURATION_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.x;
                }
                else
                {
                    branchMergedValue71 = RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.y;
                    branchMergedValue83 = RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.z;
                    branchMergedValue84 = RD_UNIFORM_COLOR_GRADING_SATURATION_MIDTONES.x;
                }
                branchMergedValue38 = branchMergedValue71;
                branchMergedValue50 = branchMergedValue83;
                branchMergedValue51 = branchMergedValue84;
            }
            branchMergedValue2 = branchMergedValue38;
            branchMergedValue14 = branchMergedValue50;
            branchMergedValue15 = branchMergedValue51;
        }
        intermediateValue8 = branchMergedValue15;
        intermediateValue9 = branchMergedValue2;
        intermediateValue10 = branchMergedValue14;
    }
    float dotProductValue1 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    bool comparisonValue11 = RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.w != 0.0f;
    bool comparisonValue12 = RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.w != 0.0f;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if (comparisonValue6 && comparisonValue12)
    {
        intermediateValue11 = RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.x;
        intermediateValue12 = RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.y;
        intermediateValue13 = RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.z;
    }
    else
    {
        float productValue5 = RD_UNIFORM_COLOR_GRADING_MISC.z * sampledTextureValue2;
        bool comparisonValue13 = (dotProductValue <= productValue5) && comparisonValue11;
        float branchMergedValue3;
        float branchMergedValue16;
        float branchMergedValue17;
        if (comparisonValue13 || (RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.w == 0.0f))
        {
            branchMergedValue3 = comparisonValue13 ? RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.z : 1.0f;
            branchMergedValue16 = comparisonValue13 ? RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.y : 1.0f;
            branchMergedValue17 = comparisonValue13 ? RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.x : 1.0f;
        }
        else
        {
            float branchMergedValue39;
            float branchMergedValue52;
            float branchMergedValue53;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue11)
            {
                float quotientValue13 = (dotProductValue - productValue5) / (sampledTextureValue2 - productValue5);
                branchMergedValue39 = (quotientValue13 * (RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.z;
                branchMergedValue52 = (quotientValue13 * (RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.y;
                branchMergedValue53 = (quotientValue13 * (RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAIN_SHADOWS.x;
            }
            else
            {
                float branchMergedValue72;
                float branchMergedValue85;
                float branchMergedValue86;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue12)
                {
                    float quotientValue14 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue72 = (quotientValue14 * (RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.z;
                    branchMergedValue85 = (quotientValue14 * (RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.y;
                    branchMergedValue86 = (quotientValue14 * (RD_UNIFORM_COLOR_GRADING_GAIN_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.x;
                }
                else
                {
                    branchMergedValue72 = RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.z;
                    branchMergedValue85 = RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.y;
                    branchMergedValue86 = RD_UNIFORM_COLOR_GRADING_GAIN_MIDTONES.x;
                }
                branchMergedValue39 = branchMergedValue72;
                branchMergedValue52 = branchMergedValue85;
                branchMergedValue53 = branchMergedValue86;
            }
            branchMergedValue3 = branchMergedValue39;
            branchMergedValue16 = branchMergedValue52;
            branchMergedValue17 = branchMergedValue53;
        }
        intermediateValue11 = branchMergedValue17;
        intermediateValue12 = branchMergedValue16;
        intermediateValue13 = branchMergedValue3;
    }
    bool comparisonValue14 = RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.w != 0.0f;
    bool comparisonValue15 = RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.w != 0.0f;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if (comparisonValue6 && comparisonValue15)
    {
        intermediateValue14 = RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.x;
        intermediateValue15 = RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.y;
        intermediateValue16 = RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.z;
    }
    else
    {
        float productValue6 = RD_UNIFORM_COLOR_GRADING_MISC.z * sampledTextureValue2;
        bool comparisonValue16 = (dotProductValue <= productValue6) && comparisonValue14;
        float branchMergedValue4;
        float branchMergedValue18;
        float branchMergedValue19;
        if (comparisonValue16 || (RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.w == 0.0f))
        {
            branchMergedValue4 = comparisonValue16 ? RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.z : 0.0f;
            branchMergedValue18 = comparisonValue16 ? RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.y : 0.0f;
            branchMergedValue19 = comparisonValue16 ? RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.x : 0.0f;
        }
        else
        {
            float branchMergedValue40;
            float branchMergedValue54;
            float branchMergedValue55;
            if ((dotProductValue < sampledTextureValue2) && comparisonValue14)
            {
                float quotientValue15 = (dotProductValue - productValue6) / (sampledTextureValue2 - productValue6);
                branchMergedValue40 = (quotientValue15 * (RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.z;
                branchMergedValue54 = (quotientValue15 * (RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.y;
                branchMergedValue55 = (quotientValue15 * (RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_OFFSET_SHADOWS.x;
            }
            else
            {
                float branchMergedValue73;
                float branchMergedValue87;
                float branchMergedValue88;
                if ((dotProductValue > sampledTextureValue2) && comparisonValue15)
                {
                    float quotientValue16 = (dotProductValue - sampledTextureValue2) / (productValue1 - sampledTextureValue2);
                    branchMergedValue73 = (quotientValue16 * (RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.z;
                    branchMergedValue87 = (quotientValue16 * (RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.y;
                    branchMergedValue88 = (quotientValue16 * (RD_UNIFORM_COLOR_GRADING_OFFSET_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.x;
                }
                else
                {
                    branchMergedValue73 = RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.z;
                    branchMergedValue87 = RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.y;
                    branchMergedValue88 = RD_UNIFORM_COLOR_GRADING_OFFSET_MIDTONES.x;
                }
                branchMergedValue40 = branchMergedValue73;
                branchMergedValue54 = branchMergedValue87;
                branchMergedValue55 = branchMergedValue88;
            }
            branchMergedValue4 = branchMergedValue40;
            branchMergedValue18 = branchMergedValue54;
            branchMergedValue19 = branchMergedValue55;
        }
        intermediateValue14 = branchMergedValue19;
        intermediateValue15 = branchMergedValue18;
        intermediateValue16 = branchMergedValue4;
    }
    float productValue7 = max((intermediateValue14 * sampledTextureValue2) + max(intermediateValue11 * max(((exponentialValue - dotProductValue1) * intermediateValue8) + dotProductValue1, 0.0f), 0.0f), 0.0f);
    float productValue8 = max((intermediateValue15 * sampledTextureValue2) + max(intermediateValue12 * max(((exponentialValue1 - dotProductValue1) * intermediateValue9) + dotProductValue1, 0.0f), 0.0f), 0.0f);
    float productValue9 = max((intermediateValue16 * sampledTextureValue2) + max(intermediateValue13 * max(((exponentialValue2 - dotProductValue1) * intermediateValue10) + dotProductValue1, 0.0f), 0.0f), 0.0f);
    float quotientValue17 = (0.180000007152557373046875f / sampledTextureValue2) * intermediateValue4;
    float productValue10 = quotientValue17 * productValue7;
    float productValue11 = quotientValue17 * productValue8;
    float productValue12 = quotientValue17 * productValue9;
    float exponentialValue11;
    float exponentialValue12;
    float exponentialValue13;
    if (!(RD_UNIFORM_TONEMAP_PARAMS0.y >= 0.5f))
    {
        float dotProductValue2 = dot(float3(productValue7, productValue8, productValue9), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        bool comparisonValue17 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
        bool comparisonValue18 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
        float productValue13 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((dotProductValue2 >= productValue13) && comparisonValue18)
        {
            intermediateValue17 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
            intermediateValue18 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
            intermediateValue19 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
        }
        else
        {
            float productValue14 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
            bool comparisonValue19 = (dotProductValue2 <= productValue14) && comparisonValue17;
            float branchMergedValue5;
            float branchMergedValue20;
            float branchMergedValue21;
            if (comparisonValue19 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
            {
                branchMergedValue5 = comparisonValue19 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                branchMergedValue20 = comparisonValue19 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                branchMergedValue21 = comparisonValue19 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
            }
            else
            {
                float branchMergedValue41;
                float branchMergedValue56;
                float branchMergedValue57;
                if ((dotProductValue2 < 0.180000007152557373046875f) && comparisonValue17)
                {
                    float quotientValue18 = (dotProductValue2 - productValue14) / (0.180000007152557373046875f - productValue14);
                    branchMergedValue41 = (quotientValue18 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                    branchMergedValue56 = (quotientValue18 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                    branchMergedValue57 = (quotientValue18 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                }
                else
                {
                    float branchMergedValue74;
                    float branchMergedValue89;
                    float branchMergedValue90;
                    if ((dotProductValue2 > 0.180000007152557373046875f) && comparisonValue18)
                    {
                        float quotientValue19 = (dotProductValue2 + (-0.180000007152557373046875f)) / (productValue13 + (-0.180000007152557373046875f));
                        branchMergedValue74 = (quotientValue19 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                        branchMergedValue89 = (quotientValue19 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                        branchMergedValue90 = (quotientValue19 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                    }
                    else
                    {
                        branchMergedValue74 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                        branchMergedValue89 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                        branchMergedValue90 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                    }
                    branchMergedValue41 = branchMergedValue74;
                    branchMergedValue56 = branchMergedValue89;
                    branchMergedValue57 = branchMergedValue90;
                }
                branchMergedValue5 = branchMergedValue41;
                branchMergedValue20 = branchMergedValue56;
                branchMergedValue21 = branchMergedValue57;
            }
            intermediateValue17 = branchMergedValue21;
            intermediateValue18 = branchMergedValue20;
            intermediateValue19 = branchMergedValue5;
        }
        float productValue15 = intermediateValue17 * RD_UNIFORM_COLOR_GRADING_MISC.w;
        float productValue16 = intermediateValue18 * RD_UNIFORM_COLOR_GRADING_MISC.w;
        float productValue17 = intermediateValue19 * RD_UNIFORM_COLOR_GRADING_MISC.w;
        float nonlinearValue1;
        float nonlinearValue2;
        float nonlinearValue3;
        if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
        {
            nonlinearValue1 = log2(max(productValue7, 0.0f)) * (1.0f / productValue15);
            nonlinearValue2 = log2(max(productValue8, 0.0f)) * (1.0f / productValue16);
            nonlinearValue3 = log2(max(productValue9, 0.0f)) * (1.0f / productValue17);
        }
        else
        {
            nonlinearValue1 = log2((productValue7 <= 0.003130800090730190277099609375f) ? (productValue7 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue7)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue15);
            nonlinearValue2 = log2((productValue8 <= 0.003130800090730190277099609375f) ? (productValue8 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue8)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue16);
            nonlinearValue3 = log2((productValue9 <= 0.003130800090730190277099609375f) ? (productValue9 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue9)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue17);
        }
        exponentialValue11 = exp2(nonlinearValue1);
        exponentialValue12 = exp2(nonlinearValue2);
        exponentialValue13 = exp2(nonlinearValue3);
    }
    else
    {
        float comparisonValue20 = ((RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.z < RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.w) ? RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.w : RD_UNIFORM_LUMINANCE_MIN_MAX_AND_WHITE_POINT_AND_MIN_WHITE_POINT.z) * quotientValue17;
        float productValue18 = comparisonValue20 * comparisonValue20;
        float branchMergedValue34;
        float branchMergedValue35;
        float branchMergedValue36;
        switch (uint(int(RD_UNIFORM_TONEMAP_PARAMS0.x)))
        {
            case 1u:
            {
                float quotientValue20 = (((productValue10 / productValue18) + 1.0f) * productValue10) / (productValue10 + 1.0f);
                float quotientValue21 = (((productValue11 / productValue18) + 1.0f) * productValue11) / (productValue11 + 1.0f);
                float quotientValue22 = (((productValue12 / productValue18) + 1.0f) * productValue12) / (productValue12 + 1.0f);
                float dotProductValue3 = dot(float3(quotientValue20, quotientValue21, quotientValue22), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue21 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue22 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue19 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue24;
                float intermediateValue25;
                float intermediateValue26;
                if ((dotProductValue3 >= productValue19) && comparisonValue22)
                {
                    intermediateValue24 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue25 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue26 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue20 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue23 = (dotProductValue3 <= productValue20) && comparisonValue21;
                    float branchMergedValue7;
                    float branchMergedValue24;
                    float branchMergedValue25;
                    if (comparisonValue23 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue7 = comparisonValue23 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue24 = comparisonValue23 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                        branchMergedValue25 = comparisonValue23 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue43;
                        float branchMergedValue60;
                        float branchMergedValue61;
                        if ((dotProductValue3 < 0.180000007152557373046875f) && comparisonValue21)
                        {
                            float quotientValue23 = (dotProductValue3 - productValue20) / (0.180000007152557373046875f - productValue20);
                            branchMergedValue43 = (quotientValue23 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue60 = (quotientValue23 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                            branchMergedValue61 = (quotientValue23 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                        }
                        else
                        {
                            float branchMergedValue76;
                            float branchMergedValue93;
                            float branchMergedValue94;
                            if ((dotProductValue3 > 0.180000007152557373046875f) && comparisonValue22)
                            {
                                float quotientValue24 = (dotProductValue3 + (-0.180000007152557373046875f)) / (productValue19 + (-0.180000007152557373046875f));
                                branchMergedValue76 = (quotientValue24 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue93 = (quotientValue24 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue94 = (quotientValue24 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            else
                            {
                                branchMergedValue76 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue93 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue94 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            branchMergedValue43 = branchMergedValue76;
                            branchMergedValue60 = branchMergedValue93;
                            branchMergedValue61 = branchMergedValue94;
                        }
                        branchMergedValue7 = branchMergedValue43;
                        branchMergedValue24 = branchMergedValue60;
                        branchMergedValue25 = branchMergedValue61;
                    }
                    intermediateValue24 = branchMergedValue25;
                    intermediateValue25 = branchMergedValue24;
                    intermediateValue26 = branchMergedValue7;
                }
                float productValue21 = intermediateValue24 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue22 = intermediateValue25 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue23 = intermediateValue26 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(quotientValue22, 0.0f)) * (1.0f / productValue23));
                    branchMergedValue35 = exp2(log2(max(quotientValue21, 0.0f)) * (1.0f / productValue22));
                    branchMergedValue36 = exp2(log2(max(quotientValue20, 0.0f)) * (1.0f / productValue21));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue22 <= 0.003130800090730190277099609375f) ? (quotientValue22 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue22)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue23));
                    branchMergedValue35 = exp2(log2((quotientValue21 <= 0.003130800090730190277099609375f) ? (quotientValue21 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue21)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue22));
                    branchMergedValue36 = exp2(log2((quotientValue20 <= 0.003130800090730190277099609375f) ? (quotientValue20 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue20)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue21));
                    break;
                }
                break;
            }
            case 2u:
            {
                float dotProductValue4 = dot(float3(productValue10, productValue11, productValue12), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                float quotientValue25 = (((dotProductValue4 / productValue18) + 1.0f) * dotProductValue4) / ((dotProductValue4 + 1.0f) * dotProductValue4);
                float productValue24 = quotientValue25 * productValue10;
                float productValue25 = quotientValue25 * productValue11;
                float productValue26 = quotientValue25 * productValue12;
                float dotProductValue5 = dot(float3(productValue24, productValue25, productValue26), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue24 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue25 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue27 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue27;
                float intermediateValue28;
                float intermediateValue29;
                if ((dotProductValue5 >= productValue27) && comparisonValue25)
                {
                    intermediateValue27 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue28 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue29 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue28 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue26 = (dotProductValue5 <= productValue28) && comparisonValue24;
                    float branchMergedValue8;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    if (comparisonValue26 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue8 = comparisonValue26 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue26 = comparisonValue26 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                        branchMergedValue27 = comparisonValue26 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue44;
                        float branchMergedValue62;
                        float branchMergedValue63;
                        if ((dotProductValue5 < 0.180000007152557373046875f) && comparisonValue24)
                        {
                            float quotientValue26 = (dotProductValue5 - productValue28) / (0.180000007152557373046875f - productValue28);
                            branchMergedValue44 = (quotientValue26 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue62 = (quotientValue26 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                            branchMergedValue63 = (quotientValue26 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                        }
                        else
                        {
                            float branchMergedValue77;
                            float branchMergedValue95;
                            float branchMergedValue96;
                            if ((dotProductValue5 > 0.180000007152557373046875f) && comparisonValue25)
                            {
                                float quotientValue27 = (dotProductValue5 + (-0.180000007152557373046875f)) / (productValue27 + (-0.180000007152557373046875f));
                                branchMergedValue77 = (quotientValue27 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue95 = (quotientValue27 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue96 = (quotientValue27 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            else
                            {
                                branchMergedValue77 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue95 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue96 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            branchMergedValue44 = branchMergedValue77;
                            branchMergedValue62 = branchMergedValue95;
                            branchMergedValue63 = branchMergedValue96;
                        }
                        branchMergedValue8 = branchMergedValue44;
                        branchMergedValue26 = branchMergedValue62;
                        branchMergedValue27 = branchMergedValue63;
                    }
                    intermediateValue27 = branchMergedValue27;
                    intermediateValue28 = branchMergedValue26;
                    intermediateValue29 = branchMergedValue8;
                }
                float productValue29 = intermediateValue27 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue30 = intermediateValue28 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue31 = intermediateValue29 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(productValue26, 0.0f)) * (1.0f / productValue31));
                    branchMergedValue35 = exp2(log2(max(productValue25, 0.0f)) * (1.0f / productValue30));
                    branchMergedValue36 = exp2(log2(max(productValue24, 0.0f)) * (1.0f / productValue29));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((productValue26 <= 0.003130800090730190277099609375f) ? (productValue26 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue26)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue31));
                    branchMergedValue35 = exp2(log2((productValue25 <= 0.003130800090730190277099609375f) ? (productValue25 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue25)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue30));
                    branchMergedValue36 = exp2(log2((productValue24 <= 0.003130800090730190277099609375f) ? (productValue24 * 12.9200000762939453125f) : ((exp2(log2(abs(productValue24)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue29));
                    break;
                }
                break;
            }
            case 3u:
            {
                float productValue32 = productValue10 * 2.0f;
                float productValue33 = productValue11 * 2.0f;
                float productValue34 = productValue12 * 2.0f;
                float productValue35 = productValue10 * 0.300000011920928955078125f;
                float productValue36 = productValue11 * 0.300000011920928955078125f;
                float productValue37 = productValue12 * 0.300000011920928955078125f;
                float productValue38 = productValue18 * 0.1500000059604644775390625f;
                float quotientValue28 = 1.0f / (((((productValue38 + 0.0500000007450580596923828125f) * productValue18) + 0.0040000001899898052215576171875f) / (((productValue38 + 0.5f) * productValue18) + 0.060000002384185791015625f)) + (-0.066666662693023681640625f));
                float quotientValue29 = quotientValue28 * (((((productValue35 + 0.0500000007450580596923828125f) * productValue32) + 0.0040000001899898052215576171875f) / (((productValue35 + 0.5f) * productValue32) + 0.060000002384185791015625f)) + (-0.066666662693023681640625f));
                float quotientValue30 = quotientValue28 * (((((productValue36 + 0.0500000007450580596923828125f) * productValue33) + 0.0040000001899898052215576171875f) / (((productValue36 + 0.5f) * productValue33) + 0.060000002384185791015625f)) + (-0.066666662693023681640625f));
                float quotientValue31 = quotientValue28 * (((((productValue37 + 0.0500000007450580596923828125f) * productValue34) + 0.0040000001899898052215576171875f) / (((productValue37 + 0.5f) * productValue34) + 0.060000002384185791015625f)) + (-0.066666662693023681640625f));
                float dotProductValue6 = dot(float3(quotientValue29, quotientValue30, quotientValue31), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue27 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue28 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue39 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue30;
                float intermediateValue31;
                float intermediateValue32;
                if ((dotProductValue6 >= productValue39) && comparisonValue28)
                {
                    intermediateValue30 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue31 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue32 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue40 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue29 = (dotProductValue6 <= productValue40) && comparisonValue27;
                    float branchMergedValue9;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    if (comparisonValue29 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue9 = comparisonValue29 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue28 = comparisonValue29 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                        branchMergedValue29 = comparisonValue29 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue45;
                        float branchMergedValue64;
                        float branchMergedValue65;
                        if ((dotProductValue6 < 0.180000007152557373046875f) && comparisonValue27)
                        {
                            float quotientValue32 = (dotProductValue6 - productValue40) / (0.180000007152557373046875f - productValue40);
                            branchMergedValue45 = (quotientValue32 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue64 = (quotientValue32 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                            branchMergedValue65 = (quotientValue32 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                        }
                        else
                        {
                            float branchMergedValue78;
                            float branchMergedValue97;
                            float branchMergedValue98;
                            if ((dotProductValue6 > 0.180000007152557373046875f) && comparisonValue28)
                            {
                                float quotientValue33 = (dotProductValue6 + (-0.180000007152557373046875f)) / (productValue39 + (-0.180000007152557373046875f));
                                branchMergedValue78 = (quotientValue33 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue97 = (quotientValue33 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue98 = (quotientValue33 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            else
                            {
                                branchMergedValue78 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue97 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                                branchMergedValue98 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                            }
                            branchMergedValue45 = branchMergedValue78;
                            branchMergedValue64 = branchMergedValue97;
                            branchMergedValue65 = branchMergedValue98;
                        }
                        branchMergedValue9 = branchMergedValue45;
                        branchMergedValue28 = branchMergedValue64;
                        branchMergedValue29 = branchMergedValue65;
                    }
                    intermediateValue30 = branchMergedValue29;
                    intermediateValue31 = branchMergedValue28;
                    intermediateValue32 = branchMergedValue9;
                }
                float productValue41 = intermediateValue30 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue42 = intermediateValue31 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue43 = intermediateValue32 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(quotientValue31, 0.0f)) * (1.0f / productValue43));
                    branchMergedValue35 = exp2(log2(max(quotientValue30, 0.0f)) * (1.0f / productValue42));
                    branchMergedValue36 = exp2(log2(max(quotientValue29, 0.0f)) * (1.0f / productValue41));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue31 <= 0.003130800090730190277099609375f) ? (quotientValue31 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue31)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue43));
                    branchMergedValue35 = exp2(log2((quotientValue30 <= 0.003130800090730190277099609375f) ? (quotientValue30 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue30)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue42));
                    branchMergedValue36 = exp2(log2((quotientValue29 <= 0.003130800090730190277099609375f) ? (quotientValue29 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue29)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue41));
                    break;
                }
                break;
            }
            case 4u:
            {
                float multiplyAddValue12 = mad(0.048229999840259552001953125f, productValue12, mad(0.354579985141754150390625f, productValue11, productValue10 * 0.59719002246856689453125f));
                float multiplyAddValue13 = mad(0.0156599991023540496826171875f, productValue12, mad(0.908339977264404296875f, productValue11, productValue10 * 0.075999997556209564208984375f));
                float multiplyAddValue14 = mad(0.837769985198974609375f, productValue12, mad(0.13382999598979949951171875f, productValue11, productValue10 * 0.0284000001847743988037109375f));
                float quotientValue34 = (((multiplyAddValue12 + 0.02457859925925731658935546875f) * multiplyAddValue12) + (-9.0537003416102379560470581054688e-05f)) / ((((multiplyAddValue12 * 0.98372900485992431640625f) + 0.4329510033130645751953125f) * multiplyAddValue12) + 0.23808099329471588134765625f);
                float quotientValue35 = (((multiplyAddValue13 + 0.02457859925925731658935546875f) * multiplyAddValue13) + (-9.0537003416102379560470581054688e-05f)) / ((((multiplyAddValue13 * 0.98372900485992431640625f) + 0.4329510033130645751953125f) * multiplyAddValue13) + 0.23808099329471588134765625f);
                float quotientValue36 = (((multiplyAddValue14 + 0.02457859925925731658935546875f) * multiplyAddValue14) + (-9.0537003416102379560470581054688e-05f)) / ((((multiplyAddValue14 * 0.98372900485992431640625f) + 0.4329510033130645751953125f) * multiplyAddValue14) + 0.23808099329471588134765625f);
                float multiplyAddValue15 = clamp(mad(-0.0736699998378753662109375f, quotientValue36, mad(-0.5310800075531005859375f, quotientValue35, quotientValue34 * 1.60475003719329833984375f)), 0.0f, 1.0f);
                float multiplyAddValue16 = clamp(mad(-0.00604999996721744537353515625f, quotientValue36, mad(1.108129978179931640625f, quotientValue35, quotientValue34 * (-0.10208000242710113525390625f))), 0.0f, 1.0f);
                float multiplyAddValue17 = clamp(mad(1.0760200023651123046875f, quotientValue36, mad(-0.07276000082492828369140625f, quotientValue35, quotientValue34 * (-0.00326999998651444911956787109375f))), 0.0f, 1.0f);
                float dotProductValue7 = dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue30 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue31 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue44 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue33;
                float intermediateValue34;
                float intermediateValue35;
                if ((dotProductValue7 >= productValue44) && comparisonValue31)
                {
                    intermediateValue33 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue34 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue35 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue45 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue32 = (dotProductValue7 <= productValue45) && comparisonValue30;
                    float branchMergedValue10;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    if (comparisonValue32 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue10 = comparisonValue32 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue30 = comparisonValue32 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                        branchMergedValue31 = comparisonValue32 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue46;
                        float branchMergedValue66;
                        float branchMergedValue67;
                        if ((dotProductValue7 < 0.180000007152557373046875f) && comparisonValue30)
                        {
                            float quotientValue37 = (dotProductValue7 - productValue45) / (0.180000007152557373046875f - productValue45);
                            branchMergedValue46 = (quotientValue37 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue66 = (quotientValue37 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                            branchMergedValue67 = (quotientValue37 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                        }
                        else
                        {
                            float branchMergedValue79;
                            float branchMergedValue99;
                            float branchMergedValue100;
                            if ((dotProductValue7 > 0.180000007152557373046875f) && comparisonValue31)
                            {
                                float quotientValue38 = (dotProductValue7 + (-0.180000007152557373046875f)) / (productValue44 + (-0.180000007152557373046875f));
                                branchMergedValue79 = (quotientValue38 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue99 = (quotientValue38 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue100 = (quotientValue38 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            else
                            {
                                branchMergedValue79 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue99 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue100 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            branchMergedValue46 = branchMergedValue79;
                            branchMergedValue66 = branchMergedValue99;
                            branchMergedValue67 = branchMergedValue100;
                        }
                        branchMergedValue10 = branchMergedValue46;
                        branchMergedValue30 = branchMergedValue66;
                        branchMergedValue31 = branchMergedValue67;
                    }
                    intermediateValue33 = branchMergedValue30;
                    intermediateValue34 = branchMergedValue31;
                    intermediateValue35 = branchMergedValue10;
                }
                float productValue46 = intermediateValue33 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue47 = intermediateValue34 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue48 = intermediateValue35 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(multiplyAddValue17, 0.0f)) * (1.0f / productValue48));
                    branchMergedValue35 = exp2(log2(max(multiplyAddValue16, 0.0f)) * (1.0f / productValue47));
                    branchMergedValue36 = exp2(log2(max(multiplyAddValue15, 0.0f)) * (1.0f / productValue46));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((multiplyAddValue17 <= 0.003130800090730190277099609375f) ? (multiplyAddValue17 * 12.9200000762939453125f) : ((exp2(log2(abs(multiplyAddValue17)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue48));
                    branchMergedValue35 = exp2(log2((multiplyAddValue16 <= 0.003130800090730190277099609375f) ? (multiplyAddValue16 * 12.9200000762939453125f) : ((exp2(log2(abs(multiplyAddValue16)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue47));
                    branchMergedValue36 = exp2(log2((multiplyAddValue15 <= 0.003130800090730190277099609375f) ? (multiplyAddValue15 * 12.9200000762939453125f) : ((exp2(log2(abs(multiplyAddValue15)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue46));
                    break;
                }
                break;
            }
            case 5u:
            {
                float scalarValue4 = max(productValue10, max(productValue11, productValue12));
                float exponentialValue3 = exp2(log2(scalarValue4) * RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.x);
                float quotientValue39 = exponentialValue3 / ((exponentialValue3 * RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.y) + RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.z);
                float quotientValue40 = 1.0f / RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.x;
                float exponentialValue4 = exp2(log2(productValue10 / scalarValue4) * quotientValue40);
                float exponentialValue5 = exp2(log2(productValue11 / scalarValue4) * quotientValue40);
                float exponentialValue6 = exp2(log2(productValue12 / scalarValue4) * quotientValue40);
                float exponentialValue7 = exp2(log2(quotientValue39) * RD_UNIFORM_GENERIC_TONEMAPPER_CONTRAST_AND_SCALE_AND_OFFSET_AND_CROSSTALK.w);
                float exponentialValue8 = exp2(log2((exponentialValue7 * (1.0f - exponentialValue4)) + exponentialValue4) * RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.x) * quotientValue39;
                float exponentialValue9 = exp2(log2((exponentialValue7 * (1.0f - exponentialValue5)) + exponentialValue5) * RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.x) * quotientValue39;
                float exponentialValue10 = exp2(log2((exponentialValue7 * (1.0f - exponentialValue6)) + exponentialValue6) * RD_UNIFORM_GENERIC_TONEMAPPER_CROSSTALK_PARAMS.x) * quotientValue39;
                float dotProductValue8 = dot(float3(exponentialValue8, exponentialValue9, exponentialValue10), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue33 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue34 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue49 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue36;
                float intermediateValue37;
                float intermediateValue38;
                if ((dotProductValue8 >= productValue49) && comparisonValue34)
                {
                    intermediateValue36 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue37 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue38 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue50 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue35 = (dotProductValue8 <= productValue50) && comparisonValue33;
                    float branchMergedValue11;
                    float branchMergedValue32;
                    float branchMergedValue33;
                    if (comparisonValue35 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue11 = comparisonValue35 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                        branchMergedValue32 = comparisonValue35 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue33 = comparisonValue35 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue47;
                        float branchMergedValue68;
                        float branchMergedValue69;
                        if ((dotProductValue8 < 0.180000007152557373046875f) && comparisonValue33)
                        {
                            float quotientValue41 = (dotProductValue8 - productValue50) / (0.180000007152557373046875f - productValue50);
                            branchMergedValue47 = (quotientValue41 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                            branchMergedValue68 = (quotientValue41 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue69 = (quotientValue41 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                        }
                        else
                        {
                            float branchMergedValue80;
                            float branchMergedValue101;
                            float branchMergedValue102;
                            if ((dotProductValue8 > 0.180000007152557373046875f) && comparisonValue34)
                            {
                                float quotientValue42 = (dotProductValue8 + (-0.180000007152557373046875f)) / (productValue49 + (-0.180000007152557373046875f));
                                branchMergedValue80 = (quotientValue42 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue101 = (quotientValue42 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue102 = (quotientValue42 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            else
                            {
                                branchMergedValue80 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue101 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue102 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            branchMergedValue47 = branchMergedValue80;
                            branchMergedValue68 = branchMergedValue101;
                            branchMergedValue69 = branchMergedValue102;
                        }
                        branchMergedValue11 = branchMergedValue47;
                        branchMergedValue32 = branchMergedValue68;
                        branchMergedValue33 = branchMergedValue69;
                    }
                    intermediateValue36 = branchMergedValue11;
                    intermediateValue37 = branchMergedValue33;
                    intermediateValue38 = branchMergedValue32;
                }
                float productValue51 = intermediateValue36 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue52 = intermediateValue37 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue53 = intermediateValue38 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(exponentialValue10, 0.0f)) * (1.0f / productValue53));
                    branchMergedValue35 = exp2(log2(max(exponentialValue9, 0.0f)) * (1.0f / productValue52));
                    branchMergedValue36 = exp2(log2(max(exponentialValue8, 0.0f)) * (1.0f / productValue51));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((exponentialValue10 <= 0.003130800090730190277099609375f) ? (exponentialValue10 * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue10)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue53));
                    branchMergedValue35 = exp2(log2((exponentialValue9 <= 0.003130800090730190277099609375f) ? (exponentialValue9 * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue9)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue52));
                    branchMergedValue36 = exp2(log2((exponentialValue8 <= 0.003130800090730190277099609375f) ? (exponentialValue8 * 12.9200000762939453125f) : ((exp2(log2(abs(exponentialValue8)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue51));
                    break;
                }
                break;
            }
            default:
            {
                float quotientValue43 = productValue10 / (productValue10 + 1.0f);
                float quotientValue44 = productValue11 / (productValue11 + 1.0f);
                float quotientValue45 = productValue12 / (productValue12 + 1.0f);
                float dotProductValue9 = dot(float3(quotientValue43, quotientValue44, quotientValue45), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                bool comparisonValue36 = RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.w != 0.0f;
                bool comparisonValue37 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.w != 0.0f;
                float productValue54 = RD_UNIFORM_COLOR_GRADING_MISC.y * 0.180000007152557373046875f;
                float intermediateValue21;
                float intermediateValue22;
                float intermediateValue23;
                if ((dotProductValue9 >= productValue54) && comparisonValue37)
                {
                    intermediateValue21 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x;
                    intermediateValue22 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y;
                    intermediateValue23 = RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z;
                }
                else
                {
                    float productValue55 = RD_UNIFORM_COLOR_GRADING_MISC.z * 0.180000007152557373046875f;
                    bool comparisonValue38 = (dotProductValue9 <= productValue55) && comparisonValue36;
                    float branchMergedValue6;
                    float branchMergedValue22;
                    float branchMergedValue23;
                    if (comparisonValue38 || (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.w == 0.0f))
                    {
                        branchMergedValue6 = comparisonValue38 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x : 2.2000000476837158203125f;
                        branchMergedValue22 = comparisonValue38 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z : 2.2000000476837158203125f;
                        branchMergedValue23 = comparisonValue38 ? RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y : 2.2000000476837158203125f;
                    }
                    else
                    {
                        float branchMergedValue42;
                        float branchMergedValue58;
                        float branchMergedValue59;
                        if ((dotProductValue9 < 0.180000007152557373046875f) && comparisonValue36)
                        {
                            float quotientValue46 = (dotProductValue9 - productValue55) / (0.180000007152557373046875f - productValue55);
                            branchMergedValue42 = (quotientValue46 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.x;
                            branchMergedValue58 = (quotientValue46 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.z;
                            branchMergedValue59 = (quotientValue46 * (RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y - RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_SHADOWS.y;
                        }
                        else
                        {
                            float branchMergedValue75;
                            float branchMergedValue91;
                            float branchMergedValue92;
                            if ((dotProductValue9 > 0.180000007152557373046875f) && comparisonValue37)
                            {
                                float quotientValue47 = (dotProductValue9 + (-0.180000007152557373046875f)) / (productValue54 + (-0.180000007152557373046875f));
                                branchMergedValue75 = (quotientValue47 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.x - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue91 = (quotientValue47 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.z - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue92 = (quotientValue47 * (RD_UNIFORM_COLOR_GRADING_GAMMA_HIGHLIGHTS.y - RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y)) + RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            else
                            {
                                branchMergedValue75 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.x;
                                branchMergedValue91 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.z;
                                branchMergedValue92 = RD_UNIFORM_COLOR_GRADING_GAMMA_MIDTONES.y;
                            }
                            branchMergedValue42 = branchMergedValue75;
                            branchMergedValue58 = branchMergedValue91;
                            branchMergedValue59 = branchMergedValue92;
                        }
                        branchMergedValue6 = branchMergedValue42;
                        branchMergedValue22 = branchMergedValue58;
                        branchMergedValue23 = branchMergedValue59;
                    }
                    intermediateValue21 = branchMergedValue6;
                    intermediateValue22 = branchMergedValue23;
                    intermediateValue23 = branchMergedValue22;
                }
                float productValue56 = intermediateValue21 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue57 = intermediateValue22 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                float productValue58 = intermediateValue23 * RD_UNIFORM_COLOR_GRADING_MISC.w;
                if (RD_UNIFORM_COLOR_GRADING_MISC2.x != 0.0f)
                {
                    branchMergedValue34 = exp2(log2(max(quotientValue45, 0.0f)) * (1.0f / productValue58));
                    branchMergedValue35 = exp2(log2(max(quotientValue44, 0.0f)) * (1.0f / productValue57));
                    branchMergedValue36 = exp2(log2(max(quotientValue43, 0.0f)) * (1.0f / productValue56));
                    break;
                }
                else
                {
                    branchMergedValue34 = exp2(log2((quotientValue45 <= 0.003130800090730190277099609375f) ? (quotientValue45 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue45)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue58));
                    branchMergedValue35 = exp2(log2((quotientValue44 <= 0.003130800090730190277099609375f) ? (quotientValue44 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue44)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue57));
                    branchMergedValue36 = exp2(log2((quotientValue43 <= 0.003130800090730190277099609375f) ? (quotientValue43 * 12.9200000762939453125f) : ((exp2(log2(abs(quotientValue43)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f))) * (2.2000000476837158203125f / productValue56));
                    break;
                }
                break;
            }
        }
        exponentialValue11 = branchMergedValue36;
        exponentialValue12 = branchMergedValue35;
        exponentialValue13 = branchMergedValue34;
    }
    float scalarValue5 = min(max(exponentialValue11, 0.0f), 1.0f);
    float scalarValue6 = min(max(exponentialValue12, 0.0f), 1.0f);
    float scalarValue7 = min(max(exponentialValue13, 0.0f), 1.0f);
    float productValue59;
    float productValue60;
    float productValue61;
    if (RD_UNIFORM_RASTERIZED_COLOR_ENABLED.x > 0.0f)
    {
        float4 sampledTextureValue3 = rasterizedColorTexture.Sample(rasterizedColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        float sumValue = 1.0f - sampledTextureValue3.w;
        productValue59 = (sumValue * scalarValue5) + sampledTextureValue3.x;
        productValue60 = (sumValue * scalarValue6) + sampledTextureValue3.y;
        productValue61 = (sumValue * scalarValue7) + sampledTextureValue3.z;
    }
    else
    {
        productValue59 = scalarValue5;
        productValue60 = scalarValue6;
        productValue61 = scalarValue7;
    }
    fragmentColor0.x = productValue59;
    fragmentColor0.y = productValue60;
    fragmentColor0.z = productValue61;
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
