// DeferredMixedResolutionSurfaceRadiance / SurfaceRadianceUpscalePass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_UPSCALING
#define RD_FEATURE_UPSCALING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/DeferredMixedResolutionSurfaceRadiance/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_UPSCALING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
#elif RD_FEATURE_UPSCALING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = materialTexture7.Sample(textureSampler7, varyingTexCoord0.xy).x;
  materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
  workingVector0.yz = floatingPointResult.xy;
  workingVector0.yz = varyingTexCoord0.xy * workingVector0.yz;
  workingVector1.xy = (int2)workingVector0.yz;
  workingVector1.zw = float2(0,0);
  workingVector0.yz = materialTexture2.Load(workingVector1.xyz).xw;
  workingVector0.w = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector0.w != 0) {
    workingVector1.xy = varyingTexCoord0.xy;
    workingVector1.z = 1;
    workingVector0.w = materialTexture11.SampleLevel(textureSampler11, workingVector1.xyz, 0).y;
  } else {
    workingVector0.w = 1;
  }
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.x != 1.000000);
  if (workingVector1.x != 0) {
#if RD_FEATURE_UPSCALING == RD_OFF
    workingVector1.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
#elif RD_FEATURE_UPSCALING == RD_ON
    workingVector1.xy = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xy;
    workingVector2.xyz = float3(1,1,1) + -abs(workingVector1.xyx);
    workingVector3.z = workingVector2.x + -abs(workingVector1.y);
    workingVector1.z = RD_COMPARISON_MASK(workingVector3.z < 0);
    workingVector2.xw = RD_COMPARISON_MASK(workingVector1.xy >= float2(0,0));
    workingVector2.xw = workingVector2.xw ? float2(1,1) : float2(-1,-1);
    workingVector2.xy = workingVector2.yz * workingVector2.xw;
    workingVector3.xy = workingVector1.zz ? workingVector2.xy : workingVector1.xy;
    workingVector1.x = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector1.x = rsqrt(workingVector1.x);
    workingVector1.xyz = workingVector3.xyz * workingVector1.xxx;
    workingVector2.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
#endif
    workingVector0.y = (int)workingVector0.y & 255;
    workingVector0.y = (uint)workingVector0.y;
    workingVector0.y = 0.00392156886 * workingVector0.y;
    workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
#if RD_FEATURE_UPSCALING == RD_OFF
    workingVector2.xyz = max(float3(0,0,0), workingVector1.xyz);
    workingVector2.xyz = log2(workingVector2.xyz);
    workingVector2.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector2.xyz;
    workingVector2.xyz = exp2(workingVector2.xyz);
    workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector1.xyz;
    workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector1.xyz;
    workingVector4.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector4.xyz;
    workingVector4.xyz = log2(workingVector4.xyz);
    workingVector4.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector4.xyz;
    workingVector4.xyz = exp2(workingVector4.xyz);
    workingVector1.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector1.xyz);
    workingVector1.xyz = workingVector1.xyz ? workingVector3.xyz : workingVector4.xyz;
    workingVector1.xyz = workingVector1.www ? workingVector2.xyz : workingVector1.xyz;
    workingVector2.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
    workingVector2.xyz = workingVector2.xyz * workingVector1.xyz;
    workingVector3.xyz = materialTexture8.Sample(textureSampler8, varyingTexCoord0.xy).xyz;
    workingVector1.w = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.xyz = workingVector1.www + -workingVector1.xyz;
    workingVector1.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector4.xyz + workingVector1.xyz;
    workingVector1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector1.xyz;
    workingVector1.xyz = workingVector1.xyz * workingVector0.yyy;
    workingVector1.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector1.xyz;
#elif RD_FEATURE_UPSCALING == RD_ON
    workingVector3.xyz = max(float3(0,0,0), workingVector2.xyz);
    workingVector3.xyz = log2(workingVector3.xyz);
    workingVector3.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector3.xyz;
    workingVector3.xyz = exp2(workingVector3.xyz);
    workingVector4.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
    workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
    workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
    workingVector5.xyz = log2(workingVector5.xyz);
    workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
    workingVector5.xyz = exp2(workingVector5.xyz);
    workingVector2.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector2.xyz);
    workingVector2.xyz = workingVector2.xyz ? workingVector4.xyz : workingVector5.xyz;
    workingVector2.xyz = workingVector1.www ? workingVector3.xyz : workingVector2.xyz;
    workingVector3.xyz = varyingTexCoord0.xyx * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.xyx + float3(-0.5,-0.5,-0.5);
    workingVector3.xyz = floor(workingVector3.xyz);
    workingVector3.xyz = float3(0.5,0.5,0.5) + workingVector3.xyz;
    workingVector4.xyz = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zwz * workingVector3.xyz;
    workingVector5.xyzw = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zwzw * float4(1,0,0,1) + workingVector4.zyzy;
    workingVector6.zw = workingVector3.zy * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw;
    workingVector3.xy = -workingVector3.zy * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.zw + varyingTexCoord0.xy;
    workingVector3.xy = RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.xy * workingVector3.xy;
    workingVector3.xy = frac(workingVector3.xy);
    workingVector3.zw = float2(1,1) + -workingVector3.yx;
    workingVector1.w = workingVector3.w * workingVector3.z;
    workingVector3.zw = workingVector3.xy * workingVector3.zw;
    workingVector2.w = workingVector3.x * workingVector3.y;
    workingVector7.xyzw = materialTexture4.Sample(textureSampler4, workingVector4.zy).xyzw;
    workingVector3.xy = workingVector7.xy * float2(2,2) + float2(-1,-1);
    workingVector8.xyz = float3(1,1,1) + -abs(workingVector3.xyx);
    workingVector9.z = workingVector8.x + -abs(workingVector3.y);
    workingVector7.x = RD_COMPARISON_MASK(workingVector9.z < 0);
    workingVector8.xw = RD_COMPARISON_MASK(workingVector3.xy >= float2(0,0));
    workingVector8.xw = workingVector8.xw ? float2(1,1) : float2(-1,-1);
    workingVector8.xy = workingVector8.yz * workingVector8.xw;
    workingVector9.xy = workingVector7.xx ? workingVector8.xy : workingVector3.xy;
    workingVector3.x = dot(workingVector9.xyz, workingVector9.xyz);
    workingVector3.x = rsqrt(workingVector3.x);
    workingVector8.xyz = workingVector9.xyz * workingVector3.xxx;
    workingVector3.x = workingVector7.z * 65535 + workingVector7.w;
    workingVector3.y = dot(workingVector8.xyz, workingVector1.xyz);
    workingVector3.y = -1 + workingVector3.y;
    workingVector3.y = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector3.y;
    workingVector3.y = exp2(workingVector3.y);
    workingVector3.y = min(1, workingVector3.y);
    workingVector3.y = max(6.19999992e-005, workingVector3.y);
    workingVector7.x = RD_COMPARISON_MASK(6.19999992e-005 >= workingVector3.y);
    workingVector7.y = RD_COMPARISON_MASK(workingVector0.x >= 1);
    workingVector7.z = RD_COMPARISON_MASK(workingVector3.x >= 65535);
    workingVector7.xyz = workingVector7.xyz ? float3(0.000123999998,1,1) : 0;
    workingVector7.z = max(workingVector7.y, workingVector7.z);
    workingVector3.x = -workingVector3.x * 1.52590219e-005 + workingVector0.x;
    workingVector3.x = 6.19999992e-005 + abs(workingVector3.x);
    workingVector3.x = 1 / workingVector3.x;
    workingVector7.x = workingVector7.x + -workingVector3.x;
    workingVector3.x = workingVector7.z * workingVector7.x + workingVector3.x;
    workingVector3.x = workingVector3.y * workingVector3.x;
    workingVector8.xyzw = materialTexture4.Sample(textureSampler4, workingVector5.xy).xyzw;
    workingVector7.xz = workingVector8.xy * float2(2,2) + float2(-1,-1);
    workingVector9.xyz = float3(1,1,1) + -abs(workingVector7.xzx);
    workingVector10.z = workingVector9.x + -abs(workingVector7.z);
    workingVector3.y = RD_COMPARISON_MASK(workingVector10.z < 0);
    workingVector8.xy = RD_COMPARISON_MASK(workingVector7.xz >= float2(0,0));
    workingVector8.xy = workingVector8.xy ? float2(1,1) : float2(-1,-1);
    workingVector8.xy = workingVector9.yz * workingVector8.xy;
    workingVector10.xy = workingVector3.yy ? workingVector8.xy : workingVector7.xz;
    workingVector3.y = dot(workingVector10.xyz, workingVector10.xyz);
    workingVector3.y = rsqrt(workingVector3.y);
    workingVector7.xzw = workingVector10.xyz * workingVector3.yyy;
    workingVector3.y = workingVector8.z * 65535 + workingVector8.w;
    workingVector7.x = dot(workingVector7.xzw, workingVector1.xyz);
    workingVector7.x = -1 + workingVector7.x;
    workingVector7.x = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector7.x;
    workingVector7.x = exp2(workingVector7.x);
    workingVector7.x = min(1, workingVector7.x);
    workingVector7.x = max(6.19999992e-005, workingVector7.x);
    workingVector7.z = RD_COMPARISON_MASK(6.19999992e-005 >= workingVector7.x);
    workingVector7.w = RD_COMPARISON_MASK(workingVector3.y >= 65535);
    workingVector7.zw = workingVector7.zw ? float2(0.000123999998,1) : 0;
    workingVector7.w = max(workingVector7.y, workingVector7.w);
    workingVector3.y = -workingVector3.y * 1.52590219e-005 + workingVector0.x;
    workingVector3.y = 6.19999992e-005 + abs(workingVector3.y);
    workingVector3.y = 1 / workingVector3.y;
    workingVector7.z = workingVector7.z + -workingVector3.y;
    workingVector3.y = workingVector7.w * workingVector7.z + workingVector3.y;
    workingVector3.y = workingVector7.x * workingVector3.y;
    workingVector8.xy = workingVector3.yy * workingVector3.zz;
    workingVector9.xyzw = materialTexture4.Sample(textureSampler4, workingVector5.zw).xyzw;
    workingVector3.yz = workingVector9.xy * float2(2,2) + float2(-1,-1);
    workingVector7.xzw = float3(1,1,1) + -abs(workingVector3.yzy);
    workingVector10.z = workingVector7.x + -abs(workingVector3.z);
    workingVector5.z = RD_COMPARISON_MASK(workingVector10.z < 0);
    workingVector9.xy = RD_COMPARISON_MASK(workingVector3.yz >= float2(0,0));
    workingVector9.xy = workingVector9.xy ? float2(1,1) : float2(-1,-1);
    workingVector7.xz = workingVector9.xy * workingVector7.zw;
    workingVector10.xy = workingVector5.zz ? workingVector7.xz : workingVector3.yz;
    workingVector3.y = dot(workingVector10.xyz, workingVector10.xyz);
    workingVector3.y = rsqrt(workingVector3.y);
    workingVector7.xzw = workingVector10.xyz * workingVector3.yyy;
    workingVector3.y = workingVector9.z * 65535 + workingVector9.w;
    workingVector3.z = dot(workingVector7.xzw, workingVector1.xyz);
    workingVector3.z = -1 + workingVector3.z;
    workingVector3.z = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector3.z;
    workingVector3.z = exp2(workingVector3.z);
    workingVector3.z = min(1, workingVector3.z);
    workingVector3.z = max(6.19999992e-005, workingVector3.z);
    workingVector5.z = RD_COMPARISON_MASK(6.19999992e-005 >= workingVector3.z);
    workingVector7.x = RD_COMPARISON_MASK(workingVector3.y >= 65535);
    workingVector7.x = workingVector7.x ? 1.000000 : 0;
    workingVector7.x = max(workingVector7.y, workingVector7.x);
    workingVector3.y = -workingVector3.y * 1.52590219e-005 + workingVector0.x;
    workingVector3.y = 6.19999992e-005 + abs(workingVector3.y);
    workingVector3.y = 1 / workingVector3.y;
    workingVector5.z = workingVector5.z ? 0.000124 : 0;
    workingVector5.z = workingVector5.z + -workingVector3.y;
    workingVector3.y = workingVector7.x * workingVector5.z + workingVector3.y;
    workingVector3.y = workingVector3.z * workingVector3.y;
    workingVector9.xyzw = materialTexture4.Sample(textureSampler4, workingVector6.zw).xyzw;
    workingVector7.xz = workingVector9.xy * float2(2,2) + float2(-1,-1);
    workingVector10.xyz = float3(1,1,1) + -abs(workingVector7.xzx);
    workingVector11.z = workingVector10.x + -abs(workingVector7.z);
    workingVector3.z = RD_COMPARISON_MASK(workingVector11.z < 0);
    workingVector9.xy = RD_COMPARISON_MASK(workingVector7.xz >= float2(0,0));
    workingVector9.xy = workingVector9.xy ? float2(1,1) : float2(-1,-1);
    workingVector9.xy = workingVector10.yz * workingVector9.xy;
    workingVector11.xy = workingVector3.zz ? workingVector9.xy : workingVector7.xz;
    workingVector3.z = dot(workingVector11.xyz, workingVector11.xyz);
    workingVector3.z = rsqrt(workingVector3.z);
    workingVector7.xzw = workingVector11.xyz * workingVector3.zzz;
    workingVector3.z = workingVector9.z * 65535 + workingVector9.w;
    workingVector1.x = dot(workingVector7.xzw, workingVector1.xyz);
    workingVector1.x = -1 + workingVector1.x;
    workingVector1.x = RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x * workingVector1.x;
    workingVector1.x = exp2(workingVector1.x);
    workingVector1.x = min(1, workingVector1.x);
    workingVector1.x = max(6.19999992e-005, workingVector1.x);
    workingVector1.y = RD_COMPARISON_MASK(6.19999992e-005 >= workingVector1.x);
    workingVector1.z = RD_COMPARISON_MASK(workingVector3.z >= 65535);
    workingVector1.yz = workingVector1.yz ? float2(0.000123999998,1) : 0;
    workingVector1.z = max(workingVector7.y, workingVector1.z);
    workingVector3.z = -workingVector3.z * 1.52590219e-005 + workingVector0.x;
    workingVector3.z = 6.19999992e-005 + abs(workingVector3.z);
    workingVector3.z = 1 / workingVector3.z;
    workingVector1.y = -workingVector3.z + workingVector1.y;
    workingVector1.y = workingVector1.z * workingVector1.y + workingVector3.z;
    workingVector1.x = workingVector1.x * workingVector1.y;
    workingVector8.zw = workingVector1.xx * workingVector2.ww;
    workingVector1.x = workingVector3.x * workingVector1.w + workingVector8.y;
    workingVector1.y = workingVector3.y * workingVector3.w + workingVector8.w;
    workingVector3.xyzw = RD_COMPARISON_MASK(float4(0,0,0,0) < workingVector1.xxyy);
    workingVector7.xyzw = workingVector8.xyzw / workingVector1.xxyy;
    workingVector3.xyzw = workingVector3.xyzw ? float4(1,1,1,1) : 0;
    workingVector3.xyzw = workingVector3.xyzw * workingVector7.xyzw;
    workingVector4.w = workingVector5.w;
    workingVector6.xy = workingVector5.xy;
    workingVector5.xyzw = workingVector6.xyzw + -workingVector4.zyzw;
    workingVector3.xyzw = workingVector3.xyzw * workingVector5.xyzw + workingVector4.xyzw;
    workingVector1.z = workingVector1.x + workingVector1.y;
    workingVector1.z = 6.19999992e-005 + workingVector1.z;
    workingVector1.xy = workingVector1.xy / workingVector1.zz;
    workingVector4.xyz = materialTexture1.Sample(textureSampler1, workingVector3.xy).xyz;
    workingVector5.xyz = materialTexture1.Sample(textureSampler1, workingVector3.zw).xyz;
    workingVector5.xyz = workingVector5.xyz * workingVector1.yyy;
    workingVector4.xyz = workingVector1.xxx * workingVector4.xyz + workingVector5.xyz;
    workingVector4.xyz = workingVector4.xyz * workingVector2.xyz;
    workingVector5.xyz = materialTexture8.Sample(textureSampler8, workingVector3.xy).xyz;
    workingVector3.xyz = materialTexture8.Sample(textureSampler8, workingVector3.zw).xyz;
    workingVector1.yzw = workingVector3.xyz * workingVector1.yyy;
    workingVector1.xyz = workingVector1.xxx * workingVector5.xyz + workingVector1.yzw;
    workingVector1.w = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector3.xyz = workingVector1.www + -workingVector2.xyz;
    workingVector2.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector3.xyz + workingVector2.xyz;
    workingVector2.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector2.xyz;
    workingVector2.xyz = workingVector2.xyz * workingVector0.yyy;
    workingVector2.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector2.xyz;
#endif
  } else {
#if RD_FEATURE_UPSCALING == RD_ON
    workingVector4.xyz = float3(0,0,0);
    workingVector1.xyz = float3(0,0,0);
#endif
    workingVector2.xyz = float3(0,0,0);
#if RD_FEATURE_UPSCALING == RD_OFF
    workingVector3.xyz = float3(0,0,0);
    workingVector1.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_UPSCALING == RD_OFF
  workingVector2.xyz = workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = workingVector2.xyz + workingVector1.xyz;
#elif RD_FEATURE_UPSCALING == RD_ON
  workingVector1.xyz = workingVector4.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector1.xyz + workingVector2.xyz;
#endif
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector0.y != 0) {
    workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
    workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
    workingVector0.y = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
    workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
    workingVector2.xyz = workingVector2.xyz / workingVector0.yyy;
    workingVector0.y = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector0.y = sqrt(workingVector0.y);
    workingVector0.y = workingVector0.y / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector0.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.y;
    workingVector0.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.y;
    workingVector0.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.y);
    workingVector2.w = RD_COMPARISON_MASK(0 < workingVector0.y);
    if (workingVector2.w != 0) {
      workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector2.w != 0) {
        workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
        workingVector2.w = workingVector2.w ? workingVector3.x : 0;
        workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector4.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector3.xyz = max(workingVector4.xyz, workingVector3.xyz);
        workingVector3.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector3.xyz;
        workingVector3.xyz = workingVector2.www ? workingVector3.xyz : 0;
        workingVector3.xyz = max(float3(1,1,1), workingVector3.xyz);
        workingVector3.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector3.xyz;
      } else {
        workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector2.yyy;
        workingVector2.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector2.xxx + workingVector4.xyz;
        workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
        workingVector0.z = (int)workingVector0.z & 255;
        workingVector0.z = (uint)workingVector0.z;
        workingVector0.z = 0.00392156886 * workingVector0.z;
        workingVector2.w = RD_COMPARISON_MASK(workingVector0.x == 1.000000);
        workingVector0.z = workingVector2.w ? workingVector0.w : workingVector0.z;
        workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector0.w = rsqrt(workingVector0.w);
        workingVector2.xzw = workingVector2.xyz * workingVector0.www;
        workingVector4.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector5.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector6.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector3.w = workingVector4.y + -workingVector4.x;
        workingVector0.w = workingVector2.y * workingVector0.w + -workingVector4.x;
        workingVector2.y = 1 / workingVector3.w;
        workingVector2.y = saturate(workingVector2.y * workingVector0.w);
        workingVector3.w = workingVector2.y * -2 + 3;
        workingVector2.y = workingVector2.y * workingVector2.y;
        workingVector2.y = -workingVector3.w * workingVector2.y + 1;
        workingVector3.w = workingVector2.y * workingVector2.y;
        workingVector2.y = workingVector3.w * workingVector2.y;
        workingVector3.w = dot(workingVector2.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector2.x = dot(workingVector2.xzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector2.z = workingVector3.w * workingVector3.w + 1;
        workingVector2.z = RD_UNIFORM_SUN_COLOR.w * workingVector2.z;
        workingVector2.w = workingVector2.x * workingVector2.x + 1;
        workingVector2.w = RD_UNIFORM_MOON_COLOR.w * workingVector2.w;
        workingVector2.w = 0.75 * workingVector2.w;
        workingVector4.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector4.x;
        workingVector4.x = 1 / workingVector4.x;
        workingVector0.w = saturate(workingVector4.x * workingVector0.w);
        workingVector4.x = workingVector0.w * -2 + 3;
        workingVector0.w = workingVector0.w * workingVector0.w;
        workingVector0.w = -workingVector4.x * workingVector0.w + 1;
        workingVector4.x = workingVector0.w * workingVector0.w;
        workingVector0.w = workingVector4.x * workingVector0.w;
        workingVector4.xyz = -RD_UNIFORM_SKY_ZENITH_COLOR.xyz + RD_UNIFORM_SKY_HORIZON_COLOR.xyz;
        workingVector4.xyz = workingVector0.www * workingVector4.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector4.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector4.xyz;
        workingVector4.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector4.xyz;
        workingVector0.w = workingVector2.z * 0.75 + workingVector2.w;
        workingVector2.z = max(0, workingVector3.w);
        workingVector2.z = log2(workingVector2.z);
        workingVector2.z = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.z;
        workingVector2.z = exp2(workingVector2.z);
        workingVector2.x = max(0, workingVector2.x);
        workingVector2.x = log2(workingVector2.x);
        workingVector2.x = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.x;
        workingVector2.x = exp2(workingVector2.x);
        workingVector2.xz = min(float2(1,1), workingVector2.xz);
        workingVector2.w = -workingVector2.z * 1.79999995 + 1.80999994;
        workingVector3.w = sqrt(workingVector2.w);
        workingVector2.w = workingVector3.w * workingVector2.w;
        workingVector2.w = 0.0361000001 / workingVector2.w;
        workingVector3.w = -workingVector2.x * 1.79999995 + 1.80999994;
        workingVector4.w = sqrt(workingVector3.w);
        workingVector3.w = workingVector4.w * workingVector3.w;
        workingVector3.w = 0.0361000001 / workingVector3.w;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector5.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector2.zzz;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector6.xyz * workingVector2.xxx;
        workingVector6.xyz = workingVector6.xyz * workingVector3.www;
        workingVector2.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector2.yyy;
        workingVector2.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector2.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector2.www + workingVector6.xyz;
        workingVector2.xyz = workingVector5.xyz * workingVector2.xyz;
        workingVector2.xyz = workingVector4.xyz * workingVector0.www + workingVector2.xyz;
        workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector0.z = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, workingVector0.z);
        workingVector4.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector4.xyz = workingVector0.zzz * workingVector4.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector3.xyz = workingVector0.www ? workingVector4.xyz : workingVector2.xyz;
      }
    } else {
      workingVector3.xyz = float3(0,0,0);
    }
  } else {
    workingVector3.xyz = float3(0,0,0);
    workingVector0.y = 0;
  }
  workingVector2.xyz = workingVector3.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector0.yyy * workingVector2.xyz + workingVector1.xyz;
  if (workingVector1.w != 0) {
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector0.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector0.x = -workingVector1.x / workingVector1.y;
    workingVector0.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.x;
    workingVector1.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.x = workingVector0.x / workingVector1.x;
    workingVector0.x = workingVector0.x * 53.5981483 + 1;
    workingVector0.x = log2(workingVector0.x);
    workingVector0.x = 0.173286796 * workingVector0.x;
    workingVector1.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.x = workingVector0.x * workingVector1.y + -0.5;
    workingVector1.y = (int)workingVector0.x;
    workingVector1.x = (int)workingVector1.x + -2;
    workingVector1.y = max(0, (int)workingVector1.y);
    workingVector1.x = min((int)workingVector1.y, (int)workingVector1.x);
    workingVector2.z = (int)workingVector1.x;
    workingVector0.x = saturate(-workingVector2.z + workingVector0.x);
    workingVector2.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xyzw = materialTexture9.SampleLevel(textureSampler9, workingVector2.xyz, 0).xyzw;
    workingVector1.x = (int)workingVector1.x + 1;
    workingVector1.z = (int)workingVector1.x;
    workingVector1.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xyzw = materialTexture9.SampleLevel(textureSampler9, workingVector1.xyz, 0).xyzw;
    workingVector1.xyzw = workingVector1.xyzw + -workingVector2.xyzw;
    workingVector1.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
  } else {
    workingVector1.xyzw = float4(0,0,0,1);
  }
  workingVector0.xyz = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture6.Sample(textureSampler6, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  }
  fragmentColor0.xyz = workingVector0.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
#if RD_FEATURE_UPSCALING == RD_ON
    float4 sampledTextureValue9 = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue9.x;
    float scalarValue11 = sampledTextureValue9.y;
#endif
    float4 sampledTextureValue = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float productValue = (scalarValue * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue;
    float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z));
#if RD_FEATURE_UPSCALING == RD_ON
    float sumValue6 = 1.0f - abs(scalarValue10);
    float scalarValue12 = abs(scalarValue11);
    float sumValue7 = sumValue6 - scalarValue12;
    bool conditionValue = sumValue7 < 0.0f;
    float comparisonValue2 = conditionValue ? ((1.0f - scalarValue12) * ((scalarValue10 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue10;
    float comparisonValue3 = conditionValue ? (sumValue6 * ((scalarValue11 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue11;
    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue2, comparisonValue3, sumValue7), float3(comparisonValue2, comparisonValue3, sumValue7)));
    float productValue45 = comparisonValue2 * inverseLengthValue1;
    float productValue46 = comparisonValue3 * inverseLengthValue1;
    float productValue47 = inverseLengthValue1 * sumValue7;
    float inverseLengthValue2 = rsqrt(dot(float3(productValue45, productValue46, productValue47), float3(productValue45, productValue46, productValue47)));
    float productValue51 = inverseLengthValue2 * productValue45;
    float productValue52 = productValue46 * inverseLengthValue2;
    float productValue53 = inverseLengthValue2 * productValue47;
#endif
    float4 sampledTextureValue1 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
#if RD_FEATURE_UPSCALING == RD_OFF
    uint unusedTextureMipCount143;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount143);
    uint4 loadedBufferValue = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y))), 0u));
    float sampledTextureValue2;
#elif RD_FEATURE_UPSCALING == RD_ON
    uint unusedTextureMipCount187;
    uint2 vectorValue1 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount187);
    uint4 loadedBufferValue1 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y))), 0u));
    float sampledTextureValue3;
#endif
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        sampledTextureValue2 = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0f), 0.0f).y;
#elif RD_FEATURE_UPSCALING == RD_ON
        sampledTextureValue3 = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0f), 0.0f).y;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        sampledTextureValue2 = 1.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        sampledTextureValue3 = 1.0f;
#endif
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue3, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue3 <= 0.040449999272823333740234375f) ? (scalarValue3 * 0.077399380505084991455078125f) : exp2(log2((scalarValue3 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    float productValue1;
    float productValue2;
    float productValue3;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float productValue4;
    float productValue5;
    float productValue6;
#elif RD_FEATURE_UPSCALING == RD_ON
    float productValue36;
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
    float productValue41;
    float productValue42;
    float productValue43;
    float productValue44;
#endif
    if (scalarValue != 1.0f)
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        float4 sampledTextureValue4 = diffuseLightingTexture.Sample(diffuseLightingSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        float4 sampledTextureValue5 = specularLightingTexture.Sample(specularLightingSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#elif RD_FEATURE_UPSCALING == RD_ON
        float productValue54 = floor((RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + (-0.5f)) + 0.5f;
        float productValue55 = productValue54 * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float productValue60 = (floor((RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + (-0.5f)) + 0.5f) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.w;
        float sumValue8 = productValue55 + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float sumValue9 = productValue60 + RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.w;
        float productValue61 = frac((varyingTexCoord0.x - productValue55) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.x);
        float productValue62 = frac((varyingTexCoord0.y - productValue60) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.y);
        float sumValue10 = 1.0f - productValue61;
        float sumValue11 = 1.0f - productValue62;
        float4 sampledTextureValue10 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(productValue55, productValue60));
        float productValue63 = (sampledTextureValue10.x * 2.0f) + (-1.0f);
        float productValue64 = (sampledTextureValue10.y * 2.0f) + (-1.0f);
        float sumValue12 = 1.0f - abs(productValue63);
        float scalarValue13 = abs(productValue64);
        float sumValue13 = sumValue12 - scalarValue13;
        bool conditionValue1 = sumValue13 < 0.0f;
        float comparisonValue4 = conditionValue1 ? (((productValue63 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue13)) : productValue63;
        float comparisonValue5 = conditionValue1 ? (((productValue64 < 0.0f) ? (-1.0f) : 1.0f) * sumValue12) : productValue64;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue13), float3(comparisonValue4, comparisonValue5, sumValue13)));
        float productValue65 = comparisonValue4 * inverseLengthValue3;
        float productValue66 = comparisonValue5 * inverseLengthValue3;
        float productValue67 = inverseLengthValue3 * sumValue13;
        float inverseLengthValue4 = rsqrt(dot(float3(productValue65, productValue66, productValue67), float3(productValue65, productValue66, productValue67)));
        float productValue68 = ((sampledTextureValue10.z * 65535.0f) + sampledTextureValue10.w) * 1.525902189314365386962890625e-05f;
        float clampedValue5 = max(clamp(exp2((dot(float3(productValue65 * inverseLengthValue4, productValue66 * inverseLengthValue4, inverseLengthValue4 * productValue67), float3(productValue51, productValue52, productValue53)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f), 6.1999999161344021558761596679688e-05f);
        float comparisonValue6 = (scalarValue < 1.0f) ? 0.0f : 1.0f;
        float quotientValue3 = 1.0f / (abs(scalarValue - productValue68) + 6.1999999161344021558761596679688e-05f);
        float4 sampledTextureValue11 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(sumValue8, productValue60));
        float productValue69 = (sampledTextureValue11.x * 2.0f) + (-1.0f);
        float productValue70 = (sampledTextureValue11.y * 2.0f) + (-1.0f);
        float sumValue14 = 1.0f - abs(productValue69);
        float scalarValue14 = abs(productValue70);
        float sumValue15 = sumValue14 - scalarValue14;
        bool conditionValue2 = sumValue15 < 0.0f;
        float comparisonValue7 = conditionValue2 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue14)) : productValue69;
        float comparisonValue8 = conditionValue2 ? (((productValue70 < 0.0f) ? (-1.0f) : 1.0f) * sumValue14) : productValue70;
        float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue7, comparisonValue8, sumValue15), float3(comparisonValue7, comparisonValue8, sumValue15)));
        float productValue71 = comparisonValue7 * inverseLengthValue5;
        float productValue75 = comparisonValue8 * inverseLengthValue5;
        float productValue76 = inverseLengthValue5 * sumValue15;
        float inverseLengthValue6 = rsqrt(dot(float3(productValue71, productValue75, productValue76), float3(productValue71, productValue75, productValue76)));
        float productValue77 = ((sampledTextureValue11.z * 65535.0f) + sampledTextureValue11.w) * 1.525902189314365386962890625e-05f;
        float clampedValue6 = max(clamp(exp2((dot(float3(productValue71 * inverseLengthValue6, productValue75 * inverseLengthValue6, inverseLengthValue6 * productValue76), float3(productValue51, productValue52, productValue53)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f), 6.1999999161344021558761596679688e-05f);
        float quotientValue4 = 1.0f / (abs(scalarValue - productValue77) + 6.1999999161344021558761596679688e-05f);
        float comparisonValue9 = ((sumValue11 * productValue61) * clampedValue6) * (((((clampedValue6 > 6.1999999161344021558761596679688e-05f) ? 0.0f : 0.00012399999832268804311752319335938f) - quotientValue4) * max(comparisonValue6, (productValue77 < 1.0f) ? 0.0f : 1.0f)) + quotientValue4);
        float4 sampledTextureValue12 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(productValue55, sumValue9));
        float productValue78 = (sampledTextureValue12.x * 2.0f) + (-1.0f);
        float productValue79 = (sampledTextureValue12.y * 2.0f) + (-1.0f);
        float sumValue16 = 1.0f - abs(productValue78);
        float scalarValue15 = abs(productValue79);
        float sumValue17 = sumValue16 - scalarValue15;
        bool conditionValue3 = sumValue17 < 0.0f;
        float comparisonValue10 = conditionValue3 ? (((productValue78 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue15)) : productValue78;
        float comparisonValue11 = conditionValue3 ? (((productValue79 < 0.0f) ? (-1.0f) : 1.0f) * sumValue16) : productValue79;
        float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue10, comparisonValue11, sumValue17), float3(comparisonValue10, comparisonValue11, sumValue17)));
        float productValue80 = comparisonValue10 * inverseLengthValue7;
        float productValue81 = comparisonValue11 * inverseLengthValue7;
        float productValue82 = inverseLengthValue7 * sumValue17;
        float inverseLengthValue8 = rsqrt(dot(float3(productValue80, productValue81, productValue82), float3(productValue80, productValue81, productValue82)));
        float productValue83 = ((sampledTextureValue12.z * 65535.0f) + sampledTextureValue12.w) * 1.525902189314365386962890625e-05f;
        float clampedValue7 = max(clamp(exp2((dot(float3(productValue80 * inverseLengthValue8, productValue81 * inverseLengthValue8, inverseLengthValue8 * productValue82), float3(productValue51, productValue52, productValue53)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f), 6.1999999161344021558761596679688e-05f);
        float quotientValue5 = 1.0f / (abs(scalarValue - productValue83) + 6.1999999161344021558761596679688e-05f);
        float4 sampledTextureValue13 = normalsAndDepthLightingTexture.Sample(normalsAndDepthLightingSampler, float2(sumValue8, sumValue9));
        float productValue84 = (sampledTextureValue13.x * 2.0f) + (-1.0f);
        float productValue85 = (sampledTextureValue13.y * 2.0f) + (-1.0f);
        float sumValue18 = 1.0f - abs(productValue84);
        float scalarValue16 = abs(productValue85);
        float sumValue19 = sumValue18 - scalarValue16;
        bool conditionValue4 = sumValue19 < 0.0f;
        float comparisonValue12 = conditionValue4 ? (((productValue84 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - scalarValue16)) : productValue84;
        float comparisonValue13 = conditionValue4 ? (((productValue85 < 0.0f) ? (-1.0f) : 1.0f) * sumValue18) : productValue85;
        float inverseLengthValue9 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, sumValue19), float3(comparisonValue12, comparisonValue13, sumValue19)));
        float productValue86 = comparisonValue12 * inverseLengthValue9;
        float productValue87 = comparisonValue13 * inverseLengthValue9;
        float productValue88 = inverseLengthValue9 * sumValue19;
        float inverseLengthValue10 = rsqrt(dot(float3(productValue86, productValue87, productValue88), float3(productValue86, productValue87, productValue88)));
        float productValue89 = ((sampledTextureValue13.z * 65535.0f) + sampledTextureValue13.w) * 1.525902189314365386962890625e-05f;
        float clampedValue8 = max(clamp(exp2((dot(float3(productValue86 * inverseLengthValue10, productValue87 * inverseLengthValue10, inverseLengthValue10 * productValue88), float3(productValue51, productValue52, productValue53)) + (-1.0f)) * RD_UNIFORM_LIGHTING_UPSCALE_PARAMS.x), 0.0f, 1.0f), 6.1999999161344021558761596679688e-05f);
        float quotientValue6 = 1.0f / (abs(scalarValue - productValue89) + 6.1999999161344021558761596679688e-05f);
        float comparisonValue14 = ((productValue62 * productValue61) * clampedValue8) * (((((clampedValue8 > 6.1999999161344021558761596679688e-05f) ? 0.0f : 0.00012399999832268804311752319335938f) - quotientValue6) * max(comparisonValue6, (productValue89 < 1.0f) ? 0.0f : 1.0f)) + quotientValue6);
        float comparisonValue15 = comparisonValue9 + (((sumValue11 * sumValue10) * clampedValue5) * (((((clampedValue5 > 6.1999999161344021558761596679688e-05f) ? 0.0f : 0.00012399999832268804311752319335938f) - quotientValue3) * max(comparisonValue6, (productValue68 < 1.0f) ? 0.0f : 1.0f)) + quotientValue3));
        float comparisonValue16 = comparisonValue14 + (((sumValue10 * productValue62) * clampedValue7) * (((((clampedValue7 > 6.1999999161344021558761596679688e-05f) ? 0.0f : 0.00012399999832268804311752319335938f) - quotientValue5) * max(comparisonValue6, (productValue83 < 1.0f) ? 0.0f : 1.0f)) + quotientValue5));
        float quotientValue7 = (((comparisonValue9 / comparisonValue15) * float(comparisonValue15 > 0.0f)) + productValue54) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float quotientValue8 = ((float(comparisonValue16 > 0.0f) * (comparisonValue14 / comparisonValue16)) + productValue54) * RD_UNIFORM_DOWNSAMPLE_RESOLUTION_AND_RECIP_RESOLUTION.z;
        float sumValue20 = (comparisonValue15 + 6.1999999161344021558761596679688e-05f) + comparisonValue16;
        float quotientValue9 = comparisonValue15 / sumValue20;
        float quotientValue10 = comparisonValue16 / sumValue20;
        float4 sampledTextureValue14 = diffuseLightingTexture.Sample(diffuseLightingSampler, float2(quotientValue7, productValue60));
        float4 sampledTextureValue15 = diffuseLightingTexture.Sample(diffuseLightingSampler, float2(quotientValue8, sumValue9));
        float4 sampledTextureValue16 = specularLightingTexture.Sample(specularLightingSampler, float2(quotientValue7, productValue60));
        float4 sampledTextureValue17 = specularLightingTexture.Sample(specularLightingSampler, float2(quotientValue8, sumValue9));
#endif
        float dotProductValue = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
#if RD_FEATURE_UPSCALING == RD_OFF
        float bitwiseValue = ((float(loadedBufferValue.x & 255u) * 0.0039215688593685626983642578125f) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue1 = sampledTextureValue4.x * exponentialValue;
        productValue2 = sampledTextureValue4.y * exponentialValue1;
        productValue3 = sampledTextureValue4.z * exponentialValue2;
        intermediateValue5 = sampledTextureValue5.x;
        intermediateValue6 = sampledTextureValue5.y;
        intermediateValue7 = sampledTextureValue5.z;
        productValue4 = (((dotProductValue - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * bitwiseValue;
        productValue5 = (((dotProductValue - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * bitwiseValue;
        productValue6 = (((dotProductValue - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * bitwiseValue;
#elif RD_FEATURE_UPSCALING == RD_ON
        float bitwiseValue1 = ((float(loadedBufferValue1.x & 255u) * 0.0039215688593685626983642578125f) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue36 = ((sampledTextureValue15.x * quotientValue10) + (sampledTextureValue14.x * quotientValue9)) * exponentialValue;
        productValue37 = ((sampledTextureValue15.y * quotientValue10) + (sampledTextureValue14.y * quotientValue9)) * exponentialValue1;
        productValue38 = ((sampledTextureValue15.z * quotientValue10) + (sampledTextureValue14.z * quotientValue9)) * exponentialValue2;
        productValue39 = (sampledTextureValue17.x * quotientValue10) + (sampledTextureValue16.x * quotientValue9);
        productValue40 = (sampledTextureValue17.y * quotientValue10) + (sampledTextureValue16.y * quotientValue9);
        productValue41 = (sampledTextureValue17.z * quotientValue10) + (sampledTextureValue16.z * quotientValue9);
        productValue42 = (((dotProductValue - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * bitwiseValue1;
        productValue43 = (((dotProductValue - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * bitwiseValue1;
        productValue44 = (((dotProductValue - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * bitwiseValue1;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue1 = 0.0f;
        productValue2 = 0.0f;
        productValue3 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
        intermediateValue7 = 0.0f;
        productValue4 = 0.0f;
        productValue5 = 0.0f;
        productValue6 = 0.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue36 = 0.0f;
        productValue37 = 0.0f;
        productValue38 = 0.0f;
        productValue39 = 0.0f;
        productValue40 = 0.0f;
        productValue41 = 0.0f;
        productValue42 = 0.0f;
        productValue43 = 0.0f;
        productValue44 = 0.0f;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    float sumValue = (intermediateValue5 + productValue1) + productValue4;
    float sumValue1 = (intermediateValue6 + productValue2) + productValue5;
    float sumValue2 = (intermediateValue7 + productValue3) + productValue6;
#elif RD_FEATURE_UPSCALING == RD_ON
    float sumValue21 = (productValue39 + productValue36) + productValue42;
    float sumValue22 = (productValue40 + productValue37) + productValue43;
    float sumValue23 = (productValue41 + productValue38) + productValue44;
#endif
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue7 = inverseLengthValue * multiplyAddValue;
    float productValue8 = inverseLengthValue * multiplyAddValue1;
    float productValue9 = inverseLengthValue * multiplyAddValue2;
    bool comparisonValue = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
#if RD_FEATURE_UPSCALING == RD_OFF
    float productValue10;
    float productValue11;
    float productValue12;
#elif RD_FEATURE_UPSCALING == RD_ON
    float productValue48;
    float productValue49;
    float productValue50;
#endif
    if ((comparisonValue && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f))
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue10 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue11 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue12 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue48 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue49 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue50 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue10 = 0.0f;
        productValue11 = 0.0f;
        productValue12 = 0.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue48 = 0.0f;
        productValue49 = 0.0f;
        productValue50 = 0.0f;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif RD_FEATURE_UPSCALING == RD_ON
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
#endif
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
        float clampedValue = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (clampedValue > 0.0f)
        {
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue4 = clampedValue;
#if RD_FEATURE_UPSCALING == RD_OFF
                branchMergedValue5 = RD_UNIFORM_FOG_COLOR.x * max(productValue10, 1.0f);
                branchMergedValue6 = max(productValue11, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue7 = max(productValue12, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
#elif RD_FEATURE_UPSCALING == RD_ON
                branchMergedValue5 = RD_UNIFORM_FOG_COLOR.x * max(productValue48, 1.0f);
                branchMergedValue6 = max(productValue49, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue7 = max(productValue50, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
#endif
            }
            else
            {
                float clampedValue1 = clamp(((productValue8 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue13 = 1.0f - ((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)));
                float productValue14 = (productValue13 * productValue13) * productValue13;
                float dotProductValue1 = dot(float3(productValue7, productValue8, productValue9), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue2 = dot(float3(productValue7, productValue8, productValue9), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue3 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue2 = clamp((productValue8 - sumValue3) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue3), 0.0f, 1.0f);
                float productValue15 = 1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f)));
                float productValue16 = (productValue15 * productValue15) * productValue15;
                float productValue17 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue2 * dotProductValue2) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue1 * dotProductValue1) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue3 = clamp(exp2(log2(max(dotProductValue1, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue4 = clamp(exp2(log2(max(dotProductValue2, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue22 = 1.809999942779541015625f - (clampedValue3 * 1.7999999523162841796875f);
                float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue22) * productValue22);
                float productValue23 = 1.809999942779541015625f - (clampedValue4 * 1.7999999523162841796875f);
                float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue23) * productValue23);
                float productValue24 = clampedValue3 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue25 = clampedValue4 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue26 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue25 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue17)) * 0.079577468335628509521484375f;
                float productValue27 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue25 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue17)) * 0.079577468335628509521484375f;
                float productValue28 = (((productValue14 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue25 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue24 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue16 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue17)) * 0.079577468335628509521484375f;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
#if RD_FEATURE_UPSCALING == RD_OFF
                    float comparisonValue1 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, (scalarValue == 1.0f) ? sampledTextureValue2 : (float(loadedBufferValue.w & 255u) * 0.0039215688593685626983642578125f));
#elif RD_FEATURE_UPSCALING == RD_ON
                    float comparisonValue17 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, (scalarValue == 1.0f) ? sampledTextureValue3 : (float(loadedBufferValue1.w & 255u) * 0.0039215688593685626983642578125f));
#endif
                    branchMergedValue8 = clampedValue;
#if RD_FEATURE_UPSCALING == RD_OFF
                    branchMergedValue9 = ((productValue26 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * comparisonValue1) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue10 = ((productValue27 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * comparisonValue1) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue11 = ((productValue28 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * comparisonValue1) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
#elif RD_FEATURE_UPSCALING == RD_ON
                    branchMergedValue9 = ((productValue26 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * comparisonValue17) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue10 = ((productValue27 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * comparisonValue17) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue11 = ((productValue28 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * comparisonValue17) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
#endif
                }
                else
                {
                    branchMergedValue8 = clampedValue;
                    branchMergedValue9 = productValue26;
                    branchMergedValue10 = productValue27;
                    branchMergedValue11 = productValue28;
                }
                branchMergedValue4 = branchMergedValue8;
                branchMergedValue5 = branchMergedValue9;
                branchMergedValue6 = branchMergedValue10;
                branchMergedValue7 = branchMergedValue11;
            }
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
        }
        else
        {
            branchMergedValue = clampedValue;
            branchMergedValue1 = 0.0f;
            branchMergedValue2 = 0.0f;
            branchMergedValue3 = 0.0f;
        }
#if RD_FEATURE_UPSCALING == RD_OFF
        intermediateValue8 = branchMergedValue;
        intermediateValue9 = branchMergedValue1;
        intermediateValue10 = branchMergedValue2;
        intermediateValue11 = branchMergedValue3;
#elif RD_FEATURE_UPSCALING == RD_ON
        intermediateValue17 = branchMergedValue;
        intermediateValue18 = branchMergedValue1;
        intermediateValue19 = branchMergedValue2;
        intermediateValue20 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        intermediateValue8 = 0.0f;
        intermediateValue9 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue11 = 0.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        intermediateValue17 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue19 = 0.0f;
        intermediateValue20 = 0.0f;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    float productValue18;
    float productValue19;
    float productValue20;
    float productValue21;
#elif RD_FEATURE_UPSCALING == RD_ON
    float productValue56;
    float productValue57;
    float productValue58;
    float productValue59;
#endif
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue29 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue30 = (varyingColor1.y + 1.0f) * 0.5f;
        uint scalarValue4 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue3 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, scalarValue, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, scalarValue, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue4))) + (-0.5f);
        uint sumValue4 = uint(min(int(uint(max(int(uint(int(multiplyAddValue3))), int(0u)))), int(scalarValue4 + 4294967294u)));
        float scalarValue5 = float(int(sumValue4));
        float sumValue5 = min(max(multiplyAddValue3 - scalarValue5, 0.0f), 1.0f);
        float4 sampledTextureValue6 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue29, productValue30, scalarValue5), 0.0f);
        float scalarValue6 = sampledTextureValue6.x;
        float scalarValue7 = sampledTextureValue6.y;
        float scalarValue8 = sampledTextureValue6.z;
        float scalarValue9 = sampledTextureValue6.w;
        float4 sampledTextureValue7 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue29, productValue30, float(int(sumValue4 + 1u))), 0.0f);
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue18 = ((sampledTextureValue7.x - scalarValue6) * sumValue5) + scalarValue6;
        productValue19 = ((sampledTextureValue7.y - scalarValue7) * sumValue5) + scalarValue7;
        productValue20 = ((sampledTextureValue7.z - scalarValue8) * sumValue5) + scalarValue8;
        productValue21 = ((sampledTextureValue7.w - scalarValue9) * sumValue5) + scalarValue9;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue56 = ((sampledTextureValue7.x - scalarValue6) * sumValue5) + scalarValue6;
        productValue57 = ((sampledTextureValue7.y - scalarValue7) * sumValue5) + scalarValue7;
        productValue58 = ((sampledTextureValue7.z - scalarValue8) * sumValue5) + scalarValue8;
        productValue59 = ((sampledTextureValue7.w - scalarValue9) * sumValue5) + scalarValue9;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue18 = 0.0f;
        productValue19 = 0.0f;
        productValue20 = 0.0f;
        productValue21 = 1.0f;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue56 = 0.0f;
        productValue57 = 0.0f;
        productValue58 = 0.0f;
        productValue59 = 1.0f;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    float productValue31 = (productValue21 * (((intermediateValue9 - sumValue) * intermediateValue8) + sumValue)) + productValue18;
    float productValue32 = (productValue21 * (((intermediateValue10 - sumValue1) * intermediateValue8) + sumValue1)) + productValue19;
    float productValue33 = (productValue21 * (((intermediateValue11 - sumValue2) * intermediateValue8) + sumValue2)) + productValue20;
    float productValue34;
    float productValue35;
    float productValue36;
#elif RD_FEATURE_UPSCALING == RD_ON
    float productValue90 = (productValue59 * (((intermediateValue18 - sumValue21) * intermediateValue17) + sumValue21)) + productValue56;
    float productValue91 = (productValue59 * (((intermediateValue19 - sumValue22) * intermediateValue17) + sumValue22)) + productValue57;
    float productValue92 = (productValue59 * (((intermediateValue20 - sumValue23) * intermediateValue17) + sumValue23)) + productValue58;
    float productValue72;
    float productValue73;
    float productValue74;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue8 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue34 = sampledTextureValue8 * productValue31;
        productValue35 = sampledTextureValue8 * productValue32;
        productValue36 = sampledTextureValue8 * productValue33;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue72 = sampledTextureValue8 * productValue90;
        productValue73 = sampledTextureValue8 * productValue91;
        productValue74 = sampledTextureValue8 * productValue92;
#endif
    }
    else
    {
#if RD_FEATURE_UPSCALING == RD_OFF
        productValue34 = productValue31;
        productValue35 = productValue32;
        productValue36 = productValue33;
#elif RD_FEATURE_UPSCALING == RD_ON
        productValue72 = productValue90;
        productValue73 = productValue91;
        productValue74 = productValue92;
#endif
    }
#if RD_FEATURE_UPSCALING == RD_OFF
    fragmentColor0.x = productValue34;
    fragmentColor0.y = productValue35;
    fragmentColor0.z = productValue36;
#elif RD_FEATURE_UPSCALING == RD_ON
    fragmentColor0.x = productValue72;
    fragmentColor0.y = productValue73;
    fragmentColor0.z = productValue74;
#endif
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
