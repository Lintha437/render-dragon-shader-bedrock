// WeatherForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/WeatherForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor1 : COLOR1,
  float3 varyingColor2 : COLOR2,
  float varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  float2 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture5.Sample(textureSampler5, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.yzw = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.yzw = log2(workingVector1.yzw);
  workingVector1.yzw = float3(2.20000005,2.20000005,2.20000005) * workingVector1.yzw;
  workingVector1.yzw = exp2(workingVector1.yzw);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector3.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector3.xyz;
  workingVector3.xyz = log2(workingVector3.xyz);
  workingVector3.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector3.xyz;
  workingVector3.xyz = exp2(workingVector3.xyz);
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF)
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector0.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector1.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector1.xyzw = round(workingVector1.xyzw);
  workingVector1.xyzw = (uint4)workingVector1.xyzw;
  workingVector2.x = (uint)workingVector1.y << 8;
  workingVector1.x = (int)workingVector1.x | (int)workingVector2.x;
  workingVector1.x = (int)workingVector1.x & 1023;
  workingVector1.x = (uint)workingVector1.x;
  workingVector1.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector1.x;
  workingVector2.x = 0.00392156886 * workingVector1.x;
  workingVector2.yz = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector3.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector2.y = workingVector2.y ? workingVector3.x : 0;
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.y = workingVector3.y ? workingVector2.y : 0;
  workingVector2.x = RD_COMPARISON_MASK(varyingTexCoord2.x < workingVector2.x);
  workingVector2.x = workingVector2.x ? workingVector2.y : 0;
  workingVector1.x = -workingVector1.x * 0.00392156886 + varyingTexCoord2.x;
  workingVector1.x = saturate(25 * workingVector1.x);
  workingVector2.y = (int)workingVector1.w & 15;
  workingVector1.yzw = (uint3)workingVector1.zwy >> int3(4,4,2);
  workingVector3.xzw = (uint3)workingVector1.yzw;
  workingVector3.y = (uint)workingVector2.y;
  workingVector3.xyzw = float4(0.0666666701,0.0666666701,0.0666666701,0.0158730168) * workingVector3.xyzw;
  workingVector1.yzw = workingVector3.xyz * workingVector3.www;
  workingVector1.yzw = float3(6,6,6) * workingVector1.yzw;
  workingVector1.xyz = -workingVector1.xxx * workingVector1.yzw + workingVector1.yzw;
  workingVector1.w = 1;
  workingVector1.xyzw = workingVector2.xxxx ? float4(0,0,0,0) : workingVector1.xyzw;
  workingVector2.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector3.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector0.xyz;
  workingVector2.xyz = workingVector3.xyz * workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector2.xyz;
  workingVector2.xyz = workingVector2.xyz * workingVector0.xyz;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector1.www;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector3.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.xyz = max(workingVector3.xyz, workingVector1.xyz);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector2.xyz * float3(0.318309873,0.318309873,0.318309873) + workingVector0.xyz;
  fragmentColor0.w = workingVector1.w * workingVector0.w;
  workingVector1.xyz = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.yzx != float3(0,0,0));
  workingVector0.w = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector0.w = workingVector1.y ? workingVector0.w : 0;
  if (workingVector0.w != 0) {
    workingVector2.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
    workingVector2.xyz = max(workingVector2.xyz, workingVector3.xyz);
    workingVector2.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector2.xyz;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector2.xyz = workingVector4.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector1.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector2.xyz;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector2.xyzw = float4(255,255,255,255) * workingVector2.xyzw;
  workingVector2.xyzw = round(workingVector2.xyzw);
  workingVector2.xyzw = (uint4)workingVector2.xyzw;
  workingVector1.w = (uint)workingVector2.y << 8;
  workingVector1.w = (int)workingVector1.w | (int)workingVector2.x;
  workingVector1.w = (int)workingVector1.w & 1023;
  workingVector1.w = (uint)workingVector1.w;
  workingVector1.w = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector1.w;
  workingVector1.w = -workingVector1.w * 0.00392156886 + varyingTexCoord2.x;
  workingVector1.w = saturate(25 * workingVector1.w);
  workingVector2.x = (int)workingVector2.w & 15;
  workingVector2.yzw = (uint3)workingVector2.zwy >> int3(4,4,2);
  workingVector3.xyzw = (uint4)workingVector2.yxzw;
  workingVector2.xyzw = float4(0.0666666701,0.0666666701,0.0666666701,0.0158730168) * workingVector3.xyzw;
  workingVector2.xyz = workingVector2.xyz * workingVector2.www;
  workingVector2.xyz = float3(6,6,6) * workingVector2.xyz;
  workingVector2.xyz = -workingVector1.www * workingVector2.xyz + workingVector2.xyz;
  workingVector3.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector4.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector1.xyz;
  workingVector3.xyz = workingVector4.xyz * workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector3.xyz;
  workingVector3.xyz = workingVector3.xyz * workingVector1.xyz;
  workingVector4.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www;
  workingVector2.xyz = workingVector2.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector2.xyz = max(workingVector4.xyz, workingVector2.xyz);
  workingVector1.xyz = workingVector2.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector3.xyz * float3(0.318309873,0.318309873,0.318309873) + workingVector1.xyz;
  workingVector2.xyz = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.yzx != float3(0,0,0));
  workingVector1.w = workingVector2.y ? workingVector2.x : 0;
  workingVector2.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector1.w = workingVector2.y ? workingVector1.w : 0;
  if (workingVector1.w != 0) {
    workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
    workingVector3.xyz = max(workingVector3.xyz, workingVector4.xyz);
    workingVector3.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector3.xyz;
#elif RD_FEATURE_FLIP_OCCLUSION == RD_ON
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector0.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord1.xy).xyzw;
  workingVector1.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector1.xyzw = round(workingVector1.xyzw);
  workingVector1.xyzw = (uint4)workingVector1.xyzw;
  workingVector2.x = (uint)workingVector1.y << 8;
  workingVector1.x = (int)workingVector1.x | (int)workingVector2.x;
  workingVector1.x = (int)workingVector1.x & 1023;
  workingVector1.x = (uint)workingVector1.x;
  workingVector1.x = RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x + workingVector1.x;
  workingVector2.x = 0.00392156886 * workingVector1.x;
  workingVector2.yz = RD_COMPARISON_MASK(varyingTexCoord1.xy >= float2(0,0));
  workingVector3.xy = RD_COMPARISON_MASK(float2(1,1) >= varyingTexCoord1.xy);
  workingVector2.y = workingVector2.y ? workingVector3.x : 0;
  workingVector2.y = workingVector2.z ? workingVector2.y : 0;
  workingVector2.y = workingVector3.y ? workingVector2.y : 0;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < varyingTexCoord2.x);
  workingVector2.x = workingVector2.x ? workingVector2.y : 0;
  workingVector1.x = -workingVector1.x * 0.00392156886 + varyingTexCoord2.x;
  workingVector1.x = saturate(25 * workingVector1.x);
  workingVector2.y = (int)workingVector1.w & 15;
  workingVector1.yzw = (uint3)workingVector1.zwy >> int3(4,4,2);
  workingVector3.xzw = (uint3)workingVector1.yzw;
  workingVector3.y = (uint)workingVector2.y;
  workingVector3.xyzw = float4(0.0666666701,0.0666666701,0.0666666701,0.0158730168) * workingVector3.xyzw;
  workingVector1.yzw = workingVector3.xyz * workingVector3.www;
  workingVector1.yzw = float3(6,6,6) * workingVector1.yzw;
  workingVector1.xyz = -workingVector1.xxx * workingVector1.yzw + workingVector1.yzw;
  workingVector1.w = 1;
  workingVector1.xyzw = workingVector2.xxxx ? float4(0,0,0,0) : workingVector1.xyzw;
  workingVector2.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
  workingVector3.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector0.xyz;
  workingVector2.xyz = workingVector3.xyz * workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector2.xyz;
  workingVector2.xyz = workingVector2.xyz * workingVector0.xyz;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector1.www;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector3.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector3.xyz;
  workingVector3.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.xyz = max(workingVector3.xyz, workingVector1.xyz);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = workingVector2.xyz * float3(0.318309873,0.318309873,0.318309873) + workingVector0.xyz;
  fragmentColor0.w = workingVector1.w * workingVector0.w;
  workingVector1.xyz = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.yzx != float3(0,0,0));
  workingVector0.w = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector0.w = workingVector1.y ? workingVector0.w : 0;
  if (workingVector0.w != 0) {
    workingVector2.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
    workingVector2.xyz = max(workingVector2.xyz, workingVector3.xyz);
    workingVector2.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector2.xyz;
#endif
  } else {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    workingVector2.xyz = float3(0,0,0);
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    workingVector3.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.z != 0) {
    workingVector3.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
    workingVector3.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector3.xyzw;
    workingVector3.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector3.xyzw;
    workingVector3.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector3.xyzw;
    workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector3.yyyy;
    workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector3.xxxx + workingVector4.xyzw;
    workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector3.zzzz + workingVector4.xyzw;
    workingVector3.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector3.wwww + workingVector4.xyzw;
    workingVector1.y = dot(workingVector3.xyzw, workingVector3.xyzw);
    workingVector1.y = sqrt(workingVector1.y);
    workingVector1.y = workingVector1.y / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector1.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector1.y;
    workingVector1.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector1.y;
    workingVector1.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector1.y);
    workingVector1.z = RD_COMPARISON_MASK(0 < workingVector1.y);
    if (workingVector1.z != 0) {
      if (workingVector1.x != 0) {
        workingVector1.xzw = max(float3(1,1,1), workingVector2.xyz);
        workingVector1.xzw = RD_UNIFORM_FOG_COLOR.xyz * workingVector1.xzw;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector2.z != 0) {
    workingVector4.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
    workingVector4.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector4.xyzw;
    workingVector4.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector4.xyzw;
    workingVector4.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector4.xyzw;
    workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector4.yyyy;
    workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector4.xxxx + workingVector5.xyzw;
    workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector4.zzzz + workingVector5.xyzw;
    workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector4.wwww + workingVector5.xyzw;
    workingVector2.y = dot(workingVector4.xyzw, workingVector4.xyzw);
    workingVector2.y = sqrt(workingVector2.y);
    workingVector2.y = workingVector2.y / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector2.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector2.y;
    workingVector2.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector2.y;
    workingVector2.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector2.y);
    workingVector2.z = RD_COMPARISON_MASK(0 < workingVector2.y);
    if (workingVector2.z != 0) {
      if (workingVector2.x != 0) {
        workingVector2.xzw = max(float3(1,1,1), workingVector3.xyz);
        workingVector2.xzw = RD_UNIFORM_FOG_COLOR.xyz * workingVector2.xzw;
#endif
      } else {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
        workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector2.w = rsqrt(workingVector2.w);
        workingVector3.xyz = workingVector2.xyz * workingVector2.www;
        workingVector2.xz = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector4.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector5.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector2.z = workingVector2.z + -workingVector2.x;
        workingVector2.y = workingVector2.y * workingVector2.w + -workingVector2.x;
        workingVector2.z = 1 / workingVector2.z;
        workingVector2.z = saturate(workingVector2.y * workingVector2.z);
        workingVector2.w = workingVector2.z * -2 + 3;
        workingVector2.z = workingVector2.z * workingVector2.z;
        workingVector2.z = -workingVector2.w * workingVector2.z + 1;
        workingVector2.w = workingVector2.z * workingVector2.z;
        workingVector2.z = workingVector2.w * workingVector2.z;
        workingVector2.w = dot(workingVector3.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector3.x = dot(workingVector3.xyz, RD_UNIFORM_MOON_DIR.xyz);
        workingVector3.y = workingVector2.w * workingVector2.w + 1;
        workingVector3.y = RD_UNIFORM_SUN_COLOR.w * workingVector3.y;
        workingVector3.z = workingVector3.x * workingVector3.x + 1;
        workingVector3.z = RD_UNIFORM_MOON_COLOR.w * workingVector3.z;
        workingVector3.z = 0.75 * workingVector3.z;
        workingVector2.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector2.x;
        workingVector2.x = 1 / workingVector2.x;
        workingVector2.x = saturate(workingVector2.y * workingVector2.x);
        workingVector2.y = workingVector2.x * -2 + 3;
        workingVector2.x = workingVector2.x * workingVector2.x;
        workingVector2.x = -workingVector2.y * workingVector2.x + 1;
        workingVector2.y = workingVector2.x * workingVector2.x;
        workingVector2.x = workingVector2.y * workingVector2.x;
        workingVector6.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector6.xyz = workingVector2.xxx * workingVector6.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector6.xyz;
        workingVector6.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector6.xyz;
        workingVector2.x = workingVector3.y * 0.75 + workingVector3.z;
        workingVector2.y = max(0, workingVector2.w);
        workingVector2.y = log2(workingVector2.y);
        workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
        workingVector2.y = exp2(workingVector2.y);
        workingVector2.w = max(0, workingVector3.x);
        workingVector2.w = log2(workingVector2.w);
        workingVector2.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.w;
        workingVector2.w = exp2(workingVector2.w);
        workingVector2.yw = min(float2(1,1), workingVector2.yw);
        workingVector3.x = -workingVector2.y * 1.79999995 + 1.80999994;
        workingVector3.y = sqrt(workingVector3.x);
        workingVector3.x = workingVector3.x * workingVector3.y;
        workingVector3.y = -workingVector2.w * 1.79999995 + 1.80999994;
        workingVector3.z = sqrt(workingVector3.y);
        workingVector3.y = workingVector3.y * workingVector3.z;
        workingVector3.xy = float2(0.0361000001,0.0361000001) / workingVector3.xy;
        workingVector4.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector4.xyz;
        workingVector4.xyz = workingVector4.xyz * workingVector2.yyy;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector5.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector2.www;
        workingVector3.yzw = workingVector5.xyz * workingVector3.yyy;
        workingVector2.yzw = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector2.zzz;
        workingVector2.yzw = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector2.yzw;
        workingVector3.xyz = workingVector4.xyz * workingVector3.xxx + workingVector3.yzw;
        workingVector2.yzw = workingVector3.xyz * workingVector2.yzw;
        workingVector2.xyz = workingVector6.xyz * workingVector2.xxx + workingVector2.yzw;
        workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector3.x = max(1, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector3.yzw = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector3.xyz = workingVector3.xxx * workingVector3.yzw + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector1.xzw = workingVector2.www ? workingVector3.xyz : workingVector2.xyz;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        workingVector3.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
        workingVector3.w = dot(workingVector3.xyz, workingVector3.xyz);
        workingVector3.w = rsqrt(workingVector3.w);
        workingVector4.xyz = workingVector3.xyz * workingVector3.www;
        workingVector3.xz = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector5.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector6.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector3.z = workingVector3.z + -workingVector3.x;
        workingVector3.y = workingVector3.y * workingVector3.w + -workingVector3.x;
        workingVector3.z = 1 / workingVector3.z;
        workingVector3.z = saturate(workingVector3.y * workingVector3.z);
        workingVector3.w = workingVector3.z * -2 + 3;
        workingVector3.z = workingVector3.z * workingVector3.z;
        workingVector3.z = -workingVector3.w * workingVector3.z + 1;
        workingVector3.w = workingVector3.z * workingVector3.z;
        workingVector3.z = workingVector3.w * workingVector3.z;
        workingVector3.w = dot(workingVector4.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector4.x = dot(workingVector4.xyz, RD_UNIFORM_MOON_DIR.xyz);
        workingVector4.y = workingVector3.w * workingVector3.w + 1;
        workingVector4.y = RD_UNIFORM_SUN_COLOR.w * workingVector4.y;
        workingVector4.z = workingVector4.x * workingVector4.x + 1;
        workingVector4.z = RD_UNIFORM_MOON_COLOR.w * workingVector4.z;
        workingVector4.z = 0.75 * workingVector4.z;
        workingVector3.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector3.x;
        workingVector3.x = 1 / workingVector3.x;
        workingVector3.x = saturate(workingVector3.y * workingVector3.x);
        workingVector3.y = workingVector3.x * -2 + 3;
        workingVector3.x = workingVector3.x * workingVector3.x;
        workingVector3.x = -workingVector3.y * workingVector3.x + 1;
        workingVector3.y = workingVector3.x * workingVector3.x;
        workingVector3.x = workingVector3.y * workingVector3.x;
        workingVector7.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector7.xyz = workingVector3.xxx * workingVector7.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector7.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector7.xyz;
        workingVector7.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector7.xyz;
        workingVector3.x = workingVector4.y * 0.75 + workingVector4.z;
        workingVector3.y = max(0, workingVector3.w);
        workingVector3.y = log2(workingVector3.y);
        workingVector3.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector3.y;
        workingVector3.y = exp2(workingVector3.y);
        workingVector3.w = max(0, workingVector4.x);
        workingVector3.w = log2(workingVector3.w);
        workingVector3.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector3.w;
        workingVector3.w = exp2(workingVector3.w);
        workingVector3.yw = min(float2(1,1), workingVector3.yw);
        workingVector4.x = -workingVector3.y * 1.79999995 + 1.80999994;
        workingVector4.y = sqrt(workingVector4.x);
        workingVector4.x = workingVector4.x * workingVector4.y;
        workingVector4.y = -workingVector3.w * 1.79999995 + 1.80999994;
        workingVector4.z = sqrt(workingVector4.y);
        workingVector4.y = workingVector4.y * workingVector4.z;
        workingVector4.xy = float2(0.0361000001,0.0361000001) / workingVector4.xy;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector5.xyz;
        workingVector5.xyz = workingVector5.xyz * workingVector3.yyy;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector6.xyz * workingVector3.www;
        workingVector4.yzw = workingVector6.xyz * workingVector4.yyy;
        workingVector3.yzw = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector3.zzz;
        workingVector3.yzw = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector3.yzw;
        workingVector4.xyz = workingVector5.xyz * workingVector4.xxx + workingVector4.yzw;
        workingVector3.yzw = workingVector4.xyz * workingVector3.yzw;
        workingVector3.xyz = workingVector7.xyz * workingVector3.xxx + workingVector3.yzw;
        workingVector3.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector4.x = max(1, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector4.yzw = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector3.xyz;
        workingVector4.xyz = workingVector4.xxx * workingVector4.yzw + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector2.xzw = workingVector3.www ? workingVector4.xyz : workingVector3.xyz;
#endif
      }
    } else {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
      workingVector1.xzw = float3(0,0,0);
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
      workingVector2.xzw = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    workingVector1.xyzw = float4(0,0,0,0);
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    workingVector2.xyzw = float4(0,0,0,0);
#endif
  }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
  workingVector1.xzw = workingVector1.xzw + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.yyy * workingVector1.xzw + workingVector0.xyz;
  if (workingVector0.w != 0) {
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor2.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor2.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * varyingColor2.zz + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector0.w = -workingVector1.x / workingVector1.y;
    workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
    workingVector1.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.w = workingVector0.w / workingVector1.x;
    workingVector0.w = workingVector0.w * 53.5981483 + 1;
    workingVector0.w = log2(workingVector0.w);
    workingVector0.w = 0.173286796 * workingVector0.w;
    workingVector1.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.w = workingVector0.w * workingVector1.y + -0.5;
    workingVector1.y = (int)workingVector0.w;
    workingVector1.x = (int)workingVector1.x + -2;
    workingVector1.y = max(0, (int)workingVector1.y);
    workingVector1.x = min((int)workingVector1.y, (int)workingVector1.x);
    workingVector2.z = (int)workingVector1.x;
    workingVector0.w = saturate(-workingVector2.z + workingVector0.w);
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
  workingVector2.xzw = workingVector2.xzw + -workingVector1.xyz;
  workingVector1.xyz = workingVector2.yyy * workingVector2.xzw + workingVector1.xyz;
  if (workingVector1.w != 0) {
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor2.yy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor2.xx + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * varyingColor2.zz + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
    workingVector1.w = -workingVector2.x / workingVector2.y;
    workingVector1.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.w;
    workingVector2.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector1.w = workingVector1.w / workingVector2.x;
    workingVector1.w = workingVector1.w * 53.5981483 + 1;
    workingVector1.w = log2(workingVector1.w);
    workingVector1.w = 0.173286796 * workingVector1.w;
    workingVector2.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector2.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector1.w = workingVector1.w * workingVector2.y + -0.5;
    workingVector2.y = (int)workingVector1.w;
    workingVector2.x = (int)workingVector2.x + -2;
    workingVector2.y = max(0, (int)workingVector2.y);
    workingVector2.x = min((int)workingVector2.y, (int)workingVector2.x);
    workingVector3.z = (int)workingVector2.x;
    workingVector1.w = saturate(-workingVector3.z + workingVector1.w);
    workingVector3.xy = varyingColor2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector3.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector3.xyz, 0).xyzw;
    workingVector2.x = (int)workingVector2.x + 1;
    workingVector2.z = (int)workingVector2.x;
#endif
    workingVector2.xy = varyingColor2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector2.xyz, 0).xyzw;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    workingVector1.x = (int)workingVector1.x + 1;
    workingVector1.z = (int)workingVector1.x;
    workingVector1.xy = varyingColor2.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector1.xyz, 0).xyzw;
    workingVector1.xyzw = workingVector1.xyzw + -workingVector2.xyzw;
    workingVector1.xyzw = workingVector0.wwww * workingVector1.xyzw + workingVector2.xyzw;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    workingVector2.xyzw = workingVector2.xyzw + -workingVector3.xyzw;
    workingVector2.xyzw = workingVector1.wwww * workingVector2.xyzw + workingVector3.xyzw;
#endif
  } else {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    workingVector1.xyzw = float4(0,0,0,1);
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    workingVector2.xyzw = float4(0,0,0,1);
#endif
  }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture4.Sample(textureSampler4, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    fragmentColor0.xyz = workingVector0.xyz * workingVector0.www;
  } else {
    fragmentColor0.xyz = workingVector0.xyz;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
  workingVector0.xyz = workingVector2.www * workingVector1.xyz + workingVector2.xyz;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.x != 0) {
    workingVector1.x = materialTexture4.Sample(textureSampler4, float2(0.5,0.5)).x;
    workingVector1.x = 0.180000007 / workingVector1.x;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
#endif
  }
#if RD_FEATURE_NO_OCCLUSION == RD_ON
  fragmentColor0.xyzw = workingVector0.xyzw;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = weatherTextureTexture.Sample(weatherTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue2, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue <= 0.040449999272823333740234375f) ? (scalarValue * 0.077399380505084991455078125f) : exp2(log2((scalarValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue1 <= 0.040449999272823333740234375f) ? (scalarValue1 * 0.077399380505084991455078125f) : exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue2 <= 0.040449999272823333740234375f) ? (scalarValue2 * 0.077399380505084991455078125f) : exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float4 sampledTextureValue1 = occlusionTextureTexture.Sample(occlusionTextureSampler, float2(varyingTexCoord1.x, varyingTexCoord1.y));
    uint productValue = uint(round(sampledTextureValue1.y * 255.0f));
    uint productValue1 = uint(round(sampledTextureValue1.w * 255.0f));
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF)
    float bitwiseValue = (float(((productValue << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 < bitwiseValue))
    {
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
    }
    else
    {
        float clampedValue = clamp((varyingTexCoord2 - bitwiseValue) * 25.0f, 0.0f, 1.0f);
        float bitwiseValue1 = float(productValue >> 2u);
        float bitwiseValue2 = (bitwiseValue1 * 0.0063492073677480220794677734375f) * float(uint(round(sampledTextureValue1.z * 255.0f)) >> 4u);
        float productValue2 = bitwiseValue1 * 0.0063492073677480220794677734375f;
        float bitwiseValue3 = productValue2 * float(productValue1 & 15u);
        float bitwiseValue4 = productValue2 * float(productValue1 >> 4u);
        intermediateValue3 = bitwiseValue2 - (bitwiseValue2 * clampedValue);
        intermediateValue4 = bitwiseValue3 - (clampedValue * bitwiseValue3);
        intermediateValue5 = bitwiseValue4 - (clampedValue * bitwiseValue4);
        intermediateValue6 = 1.0f;
    }
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float clampedValue6 = clamp((varyingTexCoord2 - ((float(((productValue << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f)) * 25.0f, 0.0f, 1.0f);
    float bitwiseValue5 = float(productValue >> 2u) * 0.0063492073677480220794677734375f;
    float bitwiseValue6 = bitwiseValue5 * float(uint(round(sampledTextureValue1.z * 255.0f)) >> 4u);
    float bitwiseValue7 = float(productValue1 & 15u) * bitwiseValue5;
    float bitwiseValue8 = float(productValue1 >> 4u) * bitwiseValue5;
#elif RD_FEATURE_FLIP_OCCLUSION == RD_ON
    float bitwiseValue = (float(((productValue << 8u) | uint(round(sampledTextureValue1.x * 255.0f))) & 1023u) + RD_UNIFORM_OCCLUSION_HEIGHT_OFFSET.x) * 0.0039215688593685626983642578125f;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (((varyingTexCoord1.y <= 1.0f) && (((varyingTexCoord1.x >= 0.0f) && (varyingTexCoord1.x <= 1.0f)) && (varyingTexCoord1.y >= 0.0f))) && (varyingTexCoord2 > bitwiseValue))
    {
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
    }
    else
    {
        float clampedValue = clamp((varyingTexCoord2 - bitwiseValue) * 25.0f, 0.0f, 1.0f);
        float bitwiseValue1 = float(productValue >> 2u);
        float bitwiseValue2 = (bitwiseValue1 * 0.0063492073677480220794677734375f) * float(uint(round(sampledTextureValue1.z * 255.0f)) >> 4u);
        float productValue2 = bitwiseValue1 * 0.0063492073677480220794677734375f;
        float bitwiseValue3 = productValue2 * float(productValue1 & 15u);
        float bitwiseValue4 = productValue2 * float(productValue1 >> 4u);
        intermediateValue3 = bitwiseValue2 - (bitwiseValue2 * clampedValue);
        intermediateValue4 = bitwiseValue3 - (clampedValue * bitwiseValue3);
        intermediateValue5 = bitwiseValue4 - (clampedValue * bitwiseValue4);
        intermediateValue6 = 1.0f;
    }
#endif
    float productValue3 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * 0.3183098733425140380859375f);
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float productValue4 = intermediateValue6 * intermediateValue6;
    float productValue5 = productValue4 * productValue4;
    float productValue6 = ((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue4 - productValue5)) + productValue5) * intermediateValue6;
    float productValue7 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x;
    float productValue8 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y;
    float productValue9 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float productValue56 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue57 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
    float productValue58 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
#endif
    float productValue10 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
    float productValue11 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
    float productValue15 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float productValue19 = (max((productValue6 * productValue7) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue3), productValue10) + (((productValue3 * exponentialValue) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue;
    float productValue20 = (max((productValue6 * productValue8) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue4), productValue11) + (((productValue3 * exponentialValue1) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue1;
    float productValue21 = (max((productValue6 * productValue9) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue5), productValue15) + (((productValue3 * exponentialValue2) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue2;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float productValue59 = (max((RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * (bitwiseValue6 - (bitwiseValue6 * clampedValue6))) + productValue56, productValue10) + (((productValue3 * exponentialValue) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue;
    float productValue60 = (max((RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * (bitwiseValue7 - (bitwiseValue7 * clampedValue6))) + productValue57, productValue11) + (((productValue3 * exponentialValue1) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue1;
    float productValue61 = (max((RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * (bitwiseValue8 - (bitwiseValue8 * clampedValue6))) + productValue58, productValue15) + (((productValue3 * exponentialValue2) * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x)) * exponentialValue2;
#endif
    float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
    float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)));
    bool comparisonValue = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float productValue16;
    float productValue17;
    float productValue18;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float productValue12;
    float productValue13;
    float productValue14;
#endif
    if ((RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f) && (comparisonValue && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)))
    {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue16 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue7, productValue10) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue17 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue8, productValue11) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue18 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue9, productValue15) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue12 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue56, productValue10) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue13 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue57, productValue11) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue14 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + productValue58, productValue15) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue16 = 0.0f;
        productValue17 = 0.0f;
        productValue18 = 0.0f;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue12 = 0.0f;
        productValue13 = 0.0f;
        productValue14 = 0.0f;
#endif
    }
    float sumValue = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue22 = inverseLengthValue * sumValue;
    float productValue31 = inverseLengthValue * sumValue1;
    float productValue32 = inverseLengthValue * sumValue2;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
        float clampedValue1 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (sqrt((((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6)) + (multiplyAddValue7 * multiplyAddValue7)) / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (clampedValue1 > 0.0f)
        {
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue4 = clampedValue1;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
                branchMergedValue5 = RD_UNIFORM_FOG_COLOR.x * max(productValue16, 1.0f);
                branchMergedValue6 = max(productValue17, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue7 = max(productValue18, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
                branchMergedValue5 = RD_UNIFORM_FOG_COLOR.x * max(productValue12, 1.0f);
                branchMergedValue6 = max(productValue13, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue7 = max(productValue14, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
#endif
            }
            else
            {
                float clampedValue2 = clamp(((productValue31 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue33 = 1.0f - ((clampedValue2 * clampedValue2) * (3.0f - (clampedValue2 * 2.0f)));
                float productValue34 = (productValue33 * productValue33) * productValue33;
                float dotProductValue = dot(float3(productValue22, productValue31, productValue32), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue1 = dot(float3(productValue22, productValue31, productValue32), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue3 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue3 = clamp((productValue31 - sumValue3) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue3), 0.0f, 1.0f);
                float productValue35 = 1.0f - ((clampedValue3 * clampedValue3) * (3.0f - (clampedValue3 * 2.0f)));
                float productValue36 = (productValue35 * productValue35) * productValue35;
                float productValue37 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue1 * dotProductValue1) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue * dotProductValue) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue4 = clamp(exp2(log2(max(dotProductValue, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue5 = clamp(exp2(log2(max(dotProductValue1, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue38 = 1.809999942779541015625f - (clampedValue4 * 1.7999999523162841796875f);
                float nonlinearValue = 0.036100022494792938232421875f / (sqrt(productValue38) * productValue38);
                float productValue42 = 1.809999942779541015625f - (clampedValue5 * 1.7999999523162841796875f);
                float nonlinearValue1 = 0.036100022494792938232421875f / (sqrt(productValue42) * productValue42);
                float productValue46 = clampedValue4 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue47 = clampedValue5 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue48 = (((productValue34 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue47 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue1) + ((productValue46 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue))) + (((productValue36 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue37)) * 0.079577468335628509521484375f;
                float productValue49 = (((productValue34 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue47 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue1) + ((productValue46 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue))) + (((productValue36 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue37)) * 0.079577468335628509521484375f;
                float productValue50 = (((productValue34 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue47 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue1) + ((productValue46 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue))) + (((productValue36 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue37)) * 0.079577468335628509521484375f;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue3 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, 1.0f);
                    branchMergedValue8 = clampedValue1;
                    branchMergedValue9 = ((productValue48 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue10 = ((productValue49 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue11 = ((productValue50 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue3) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                }
                else
                {
                    branchMergedValue8 = clampedValue1;
                    branchMergedValue9 = productValue48;
                    branchMergedValue10 = productValue49;
                    branchMergedValue11 = productValue50;
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
            branchMergedValue = clampedValue1;
            branchMergedValue1 = 0.0f;
            branchMergedValue2 = 0.0f;
            branchMergedValue3 = 0.0f;
        }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        intermediateValue7 = branchMergedValue;
        intermediateValue8 = branchMergedValue1;
        intermediateValue9 = branchMergedValue2;
        intermediateValue10 = branchMergedValue3;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
        intermediateValue6 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        intermediateValue7 = 0.0f;
        intermediateValue8 = 0.0f;
        intermediateValue9 = 0.0f;
        intermediateValue10 = 0.0f;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
#endif
    }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float productValue27;
    float productValue28;
    float productValue29;
    float productValue30;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float productValue23;
    float productValue24;
    float productValue25;
    float productValue26;
#endif
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue51 = (varyingColor2.x + 1.0f) * 0.5f;
        float productValue52 = (varyingColor2.y + 1.0f) * 0.5f;
        uint scalarValue4 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue8 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, varyingColor2.z, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor2.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor2.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, varyingColor2.z, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor2.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor2.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue4))) + (-0.5f);
        uint sumValue4 = uint(min(int(uint(max(int(uint(int(multiplyAddValue8))), int(0u)))), int(scalarValue4 + 4294967294u)));
        float scalarValue5 = float(int(sumValue4));
        float sumValue5 = min(max(multiplyAddValue8 - scalarValue5, 0.0f), 1.0f);
        float4 sampledTextureValue2 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue51, productValue52, scalarValue5), 0.0f);
        float scalarValue6 = sampledTextureValue2.x;
        float scalarValue7 = sampledTextureValue2.y;
        float scalarValue8 = sampledTextureValue2.z;
        float scalarValue9 = sampledTextureValue2.w;
        float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue51, productValue52, float(int(sumValue4 + 1u))), 0.0f);
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue27 = ((sampledTextureValue3.x - scalarValue6) * sumValue5) + scalarValue6;
        productValue28 = ((sampledTextureValue3.y - scalarValue7) * sumValue5) + scalarValue7;
        productValue29 = ((sampledTextureValue3.z - scalarValue8) * sumValue5) + scalarValue8;
        productValue30 = ((sampledTextureValue3.w - scalarValue9) * sumValue5) + scalarValue9;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue23 = ((sampledTextureValue3.x - scalarValue6) * sumValue5) + scalarValue6;
        productValue24 = ((sampledTextureValue3.y - scalarValue7) * sumValue5) + scalarValue7;
        productValue25 = ((sampledTextureValue3.z - scalarValue8) * sumValue5) + scalarValue8;
        productValue26 = ((sampledTextureValue3.w - scalarValue9) * sumValue5) + scalarValue9;
#endif
    }
    else
    {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue27 = 0.0f;
        productValue28 = 0.0f;
        productValue29 = 0.0f;
        productValue30 = 1.0f;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue23 = 0.0f;
        productValue24 = 0.0f;
        productValue25 = 0.0f;
        productValue26 = 1.0f;
#endif
    }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    float productValue53 = (productValue30 * (((intermediateValue8 - productValue19) * intermediateValue7) + productValue19)) + productValue27;
    float productValue54 = (productValue30 * (((intermediateValue9 - productValue20) * intermediateValue7) + productValue20)) + productValue28;
    float productValue55 = (productValue30 * (((intermediateValue10 - productValue21) * intermediateValue7) + productValue21)) + productValue29;
    float productValue43;
    float productValue44;
    float productValue45;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    float productValue62 = (productValue26 * (((intermediateValue4 - productValue59) * intermediateValue3) + productValue59)) + productValue23;
    float productValue63 = (productValue26 * (((intermediateValue5 - productValue60) * intermediateValue3) + productValue60)) + productValue24;
    float productValue64 = (productValue26 * (((intermediateValue6 - productValue61) * intermediateValue3) + productValue61)) + productValue25;
    float productValue39;
    float productValue40;
    float productValue41;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue4 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue43 = sampledTextureValue4 * productValue53;
        productValue44 = sampledTextureValue4 * productValue54;
        productValue45 = sampledTextureValue4 * productValue55;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue39 = sampledTextureValue4 * productValue62;
        productValue40 = sampledTextureValue4 * productValue63;
        productValue41 = sampledTextureValue4 * productValue64;
#endif
    }
    else
    {
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
        productValue43 = productValue53;
        productValue44 = productValue54;
        productValue45 = productValue55;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
        productValue39 = productValue62;
        productValue40 = productValue63;
        productValue41 = productValue64;
#endif
    }
#if RD_FEATURE_NO_OCCLUSION == RD_OFF
    fragmentColor0.x = productValue43;
    fragmentColor0.y = productValue44;
    fragmentColor0.z = productValue45;
    fragmentColor0.w = intermediateValue6 * sampledTextureValue.w;
#elif RD_FEATURE_NO_OCCLUSION == RD_ON
    fragmentColor0.x = productValue39;
    fragmentColor0.y = productValue40;
    fragmentColor0.z = productValue41;
    fragmentColor0.w = sampledTextureValue.w;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
