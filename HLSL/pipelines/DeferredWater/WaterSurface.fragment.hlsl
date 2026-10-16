// DeferredWater / WaterSurface / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_GPUBLOCK_LIGHTING
#define RD_FEATURE_GPUBLOCK_LIGHTING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/DeferredWater/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xy;
  workingVector0.z = materialTexture7.Sample(textureSampler7, varyingTexCoord0.xy).x;
  workingVector1.x = RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x;
  workingVector1.y = RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y;
  workingVector0.w = workingVector0.z * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
  workingVector1.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector1.xyz = workingVector1.xyz / workingVector0.www;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector1.yyy;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector1.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector1.zzz + workingVector2.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.xyz = float3(1,1,1) + -abs(workingVector0.xyx);
  workingVector4.z = workingVector3.x + -abs(workingVector0.y);
  workingVector1.w = RD_COMPARISON_MASK(workingVector4.z < 0);
  workingVector3.xw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector3.xw = workingVector3.xw ? float2(1,1) : float2(-1,-1);
  workingVector3.xy = workingVector3.yz * workingVector3.xw;
  workingVector4.xy = workingVector1.ww ? workingVector3.xy : workingVector0.xy;
  workingVector0.x = dot(workingVector4.xyz, workingVector4.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector3.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector2.xyz;
  workingVector1.w = RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x;
  workingVector2.w = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + varyingColor1.y;
  workingVector4.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.w;
  workingVector4.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector2.w;
  workingVector4.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
  workingVector4.xyz = workingVector4.xyz / workingVector0.www;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector4.xxx;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector4.zzz + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector4.yyy + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector5.xyz;
  workingVector5.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector5.xyz;
  workingVector6.xyz = ddx_coarse(workingVector4.yzx);
  workingVector0.w = dot(workingVector6.xyz, workingVector6.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector6.xyz = workingVector6.xyz * workingVector0.www;
  workingVector4.xyz = -workingVector4.xyz;
  workingVector4.xyz = ddy_coarse(workingVector4.xyz);
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector7.xyz = workingVector6.xyz * workingVector4.xyz;
  workingVector4.xyz = workingVector6.zxy * workingVector4.yzx + -workingVector7.xyz;
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector4.yyy;
  workingVector4.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector4.xxx + workingVector6.xyz;
  workingVector4.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector4.zzz + workingVector4.xyw;
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector4.xyz = workingVector4.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector4.xyz = round(workingVector4.xyz);
  workingVector4.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector4.xyz;
  workingVector0.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector4.xyz = workingVector4.xyz * workingVector0.www;
  workingVector6.xyz = workingVector5.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector6.xyz = floor(workingVector6.xyz);
  workingVector6.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector6.xyz + workingVector5.xyz;
  workingVector6.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector6.xyz;
  workingVector0.w = dot(workingVector6.xyz, workingVector4.xyz);
  workingVector4.xyz = -workingVector0.www * workingVector4.xyz + workingVector6.xyz;
  workingVector4.xyz = workingVector5.xyz + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector4.xyz;
  workingVector5.xyz = float3(1,1,1) + -abs(workingVector0.xyx);
  workingVector6.z = workingVector5.x + -abs(workingVector0.y);
  workingVector0.w = RD_COMPARISON_MASK(workingVector6.z < 0);
  workingVector5.xw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector5.xw = workingVector5.xw ? float2(1,1) : float2(-1,-1);
  workingVector5.xy = workingVector5.yz * workingVector5.xw;
  workingVector6.xy = workingVector0.ww ? workingVector5.xy : workingVector0.xy;
  workingVector0.x = dot(workingVector6.xyz, workingVector6.xyz);
#endif
  workingVector0.x = rsqrt(workingVector0.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.xyz = workingVector4.xyz * workingVector0.xxx;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector4.xyz;
  workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector4.xyz;
  workingVector0.x = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector4.xyz = workingVector4.xyz * workingVector0.xxx;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector0.xyw = workingVector6.xyz * workingVector0.xxx;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector0.yyy;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector0.xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector0.www + workingVector5.xyz;
  workingVector1.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector5.xyz = workingVector5.xyz * workingVector1.www;
#endif
  materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.xy = floatingPointResult.xy;
  workingVector0.xy = varyingTexCoord0.xy * workingVector0.xy;
  workingVector5.xy = (int2)workingVector0.xy;
  workingVector5.zw = float2(0,0);
  workingVector5.xyzw = materialTexture3.Load(workingVector5.xyz).xyzw;
  workingVector6.xyz = (int3)workingVector5.wyz & int3(255,255,255);
  workingVector0.x = (uint)workingVector6.x;
  if (8 == 0) workingVector5.y = 0; else if (8+8 < 32) {   workingVector5.y = (uint)workingVector5.y << (32-(8 + 8)); workingVector5.y = (uint)workingVector5.y >> (32-8);  } else workingVector5.y = (uint)workingVector5.y >> 8;
  if (8 == 0) workingVector5.z = 0; else if (8+8 < 32) {   workingVector5.z = (uint)workingVector5.z << (32-(8 + 8)); workingVector5.z = (uint)workingVector5.z >> (32-8);  } else workingVector5.z = (uint)workingVector5.z >> 8;
  workingVector7.xz = (uint2)workingVector5.yz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector6.xy = floatingPointResult.xy;
  workingVector6.xy = varyingTexCoord0.xy * workingVector6.xy;
  workingVector6.xy = (int2)workingVector6.xy;
  workingVector6.zw = float2(0,0);
  workingVector6.xyzw = materialTexture3.Load(workingVector6.xyz).xyzw;
  if (8 == 0) workingVector7.x = 0; else if (8+8 < 32) {   workingVector7.x = (uint)workingVector6.x << (32-(8 + 8)); workingVector7.x = (uint)workingVector7.x >> (32-8);  } else workingVector7.x = (uint)workingVector6.x >> 8;
  if (8 == 0) workingVector7.y = 0; else if (8+8 < 32) {   workingVector7.y = (uint)workingVector6.y << (32-(8 + 8)); workingVector7.y = (uint)workingVector7.y >> (32-8);  } else workingVector7.y = (uint)workingVector6.y >> 8;
  if (8 == 0) workingVector7.z = 0; else if (8+8 < 32) {   workingVector7.z = (uint)workingVector6.z << (32-(8 + 8)); workingVector7.z = (uint)workingVector7.z >> (32-8);  } else workingVector7.z = (uint)workingVector6.z >> 8;
  workingVector1.w = (uint)workingVector7.x;
  workingVector1.w = 0.00392156886 * workingVector1.w;
  workingVector6.xyz = (int3)workingVector6.wyz & int3(255,255,255);
  workingVector2.w = (uint)workingVector6.x;
  workingVector7.xz = (uint2)workingVector7.yz;
#endif
  workingVector7.yw = (uint2)workingVector6.yz;
  workingVector6.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector7.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector5.yzw = workingVector6.xyz * workingVector6.www;
  workingVector5.yzw = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector5.yzw;
  workingVector0.y = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector0.y != 0) {
    workingVector6.xy = varyingTexCoord0.xy;
    workingVector6.z = 1;
    workingVector0.y = materialTexture10.SampleLevel(textureSampler10, workingVector6.xyz, 0).y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector6.xyz = workingVector6.xyz * workingVector6.www;
  workingVector6.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector6.xyz;
  workingVector3.w = RD_COMPARISON_MASK(0.5 < RD_UNIFORM_SKY_SAMPLES_CONFIG.x);
  if (workingVector3.w != 0) {
    workingVector7.xy = varyingTexCoord0.xy;
    workingVector7.z = 1;
    workingVector3.w = materialTexture10.SampleLevel(textureSampler10, workingVector7.xyz, 0).y;
#endif
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector0.y = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.w = 1;
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector1.w = sqrt(workingVector1.w);
  workingVector2.w = 9.99999975e-005 + workingVector1.w;
  workingVector6.xyz = workingVector1.xyz / workingVector2.www;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.x < 0.0254999977);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x == 0) {
    if (8 == 0) workingVector1.x = 0; else if (8+8 < 32) {     workingVector1.x = (uint)workingVector5.x << (32-(8 + 8)); workingVector1.x = (uint)workingVector1.x >> (32-8);    } else workingVector1.x = (uint)workingVector5.x >> 8;
    workingVector1.x = (uint)workingVector1.x;
    workingVector1.x = 0.00392156886 * workingVector1.x;
    workingVector1.y = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
    workingVector1.y = RD_COMPARISON_MASK((int)workingVector1.y == 1);
    if (workingVector1.y != 0) {
      workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector2.xyz;
      workingVector1.y = RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x;
      workingVector2.w = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + varyingColor1.y;
      workingVector8.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector1.y;
      workingVector8.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector2.w;
      workingVector8.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
      workingVector8.xyz = workingVector8.xyz / workingVector0.www;
      workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.xxx;
      workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.zzz + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.yyy + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector9.xyz;
      workingVector9.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector9.xyz;
      workingVector10.xyz = ddx_coarse(workingVector8.yzx);
      workingVector0.w = dot(workingVector10.xyz, workingVector10.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector10.xyz = workingVector10.xyz * workingVector0.www;
      workingVector8.xyz = -workingVector8.xyz;
      workingVector8.xyz = ddy_coarse(workingVector8.xyz);
      workingVector0.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector8.xyz = workingVector8.xyz * workingVector0.www;
      workingVector11.xyz = workingVector10.xyz * workingVector8.xyz;
      workingVector8.xyz = workingVector10.zxy * workingVector8.yzx + -workingVector11.xyz;
      workingVector0.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector8.xyz = workingVector8.xyz * workingVector0.www;
      workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.yyy;
      workingVector8.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.xxx + workingVector10.xyz;
      workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.zzz + workingVector8.xyw;
      workingVector0.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector8.xyz = workingVector8.xyz * workingVector0.www;
      workingVector8.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
      workingVector8.xyz = round(workingVector8.xyz);
      workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector8.xyz;
      workingVector0.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector8.xyz = workingVector8.xyz * workingVector0.www;
      workingVector10.xyz = workingVector9.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
      workingVector10.xyz = floor(workingVector10.xyz);
      workingVector10.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector10.xyz + workingVector9.xyz;
      workingVector10.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector10.xyz;
      workingVector0.w = dot(workingVector10.xyz, workingVector8.xyz);
      workingVector8.xyz = -workingVector0.www * workingVector8.xyz + workingVector10.xyz;
      workingVector8.xyz = workingVector9.xyz + workingVector8.xyz;
      workingVector8.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector8.xyz;
      workingVector0.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
      workingVector0.w = RD_COMPARISON_MASK(0 < (int)workingVector0.w);
      workingVector7.xyz = workingVector0.www ? workingVector8.xyz : workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector4.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector4.w = sqrt(workingVector4.w);
  workingVector5.w = 9.99999975e-005 + workingVector4.w;
  workingVector7.xyz = workingVector1.xyz / workingVector5.www;
  workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
  workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
  workingVector4.xyz = workingVector5.www ? workingVector4.xyz : workingVector3.xyz;
  workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
  workingVector6.w = RD_COMPARISON_MASK(workingVector2.w < 0.0254999977);
  workingVector5.w = workingVector5.w ? workingVector6.w : 0;
  if (workingVector5.w == 0) {
    workingVector5.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
    workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 1);
    if (workingVector5.w != 0) {
#endif
      workingVector8.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector8.xyz;
      workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector8.xyz;
      workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector8.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector0.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector8.xyz = workingVector8.xyz * workingVector0.www;
      workingVector0.w = dot(workingVector4.xyz, workingVector8.xyz);
      workingVector0.w = max(0, workingVector0.w);
      workingVector3.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
      workingVector1.y = 1 + -workingVector0.w;
      workingVector1.y = max(0, workingVector1.y);
      workingVector3.xyz = workingVector3.xyz * workingVector1.yyy + workingVector7.xyz;
      workingVector7.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
      workingVector1.y = dot(workingVector7.xyzw, float4(1,1,1,1));
      workingVector1.y = (int)workingVector1.y;
      workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
      workingVector7.xz = float2(1,0);
      workingVector3.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = dot(workingVector8.xyz, workingVector8.xyz);
      workingVector5.w = rsqrt(workingVector5.w);
      workingVector8.xyz = workingVector8.xyz * workingVector5.www;
      workingVector5.w = dot(workingVector5.xyz, workingVector8.xyz);
      workingVector5.w = max(0, workingVector5.w);
      workingVector8.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector0.xyw;
      workingVector6.w = 1 + -workingVector5.w;
      workingVector6.w = max(0, workingVector6.w);
      workingVector8.xyz = workingVector8.xyz * workingVector6.www + workingVector4.xyz;
      workingVector9.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
      workingVector6.w = dot(workingVector9.xyzw, float4(1,1,1,1));
      workingVector6.w = (int)workingVector6.w;
      workingVector7.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
      workingVector9.xz = float2(1,0);
      workingVector8.w = 0;
#endif
      while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector4.w = RD_COMPARISON_MASK((int)workingVector3.w >= (int)workingVector1.y);
        if (workingVector4.w != 0) break;
        workingVector4.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector3.w+0].xyzw);
        workingVector4.w = (int)workingVector4.w;
        workingVector4.w = (int)workingVector4.w + (int)workingVector7.z;
        workingVector4.w = min(8, (int)workingVector4.w);
        workingVector5.x = workingVector7.x;
        workingVector6.w = workingVector7.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.y = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector6.w);
        if (workingVector9.y != 0) break;
        workingVector9.y = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector8.w+0].xyzw);
        workingVector9.y = (int)workingVector9.y;
        workingVector9.y = (int)workingVector9.y + (int)workingVector9.z;
        workingVector9.y = min(8, (int)workingVector9.y);
        workingVector9.w = workingVector9.x;
        workingVector10.x = workingVector9.z;
#endif
        while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector7.y = RD_COMPARISON_MASK((int)workingVector6.w >= (int)workingVector4.w);
          if (workingVector7.y != 0) break;
          workingVector7.y = (uint)workingVector6.w << 2;
          workingVector8.xyz = fragmentVectorConstants1[workingVector7.y+38].xyz * workingVector3.yyy;
          workingVector8.xyz = fragmentVectorConstants1[workingVector7.y+37].xyz * workingVector3.xxx + workingVector8.xyz;
          workingVector8.xyz = fragmentVectorConstants1[workingVector7.y+39].xyz * workingVector3.zzz + workingVector8.xyz;
          workingVector8.xyz = fragmentVectorConstants1[workingVector7.y+40].xyz + workingVector8.xyz;
          workingVector9.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector8.xyz));
          workingVector7.y = workingVector9.y ? workingVector9.x : 0;
          workingVector7.y = workingVector9.z ? workingVector7.y : 0;
          if (workingVector7.y != 0) {
            workingVector7.y = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector6.w+0].xyzw);
            workingVector7.y = max(workingVector7.y, workingVector0.w);
            workingVector7.y = min(1, workingVector7.y);
            workingVector7.w = -workingVector7.y * workingVector7.y + 1;
            workingVector7.w = sqrt(workingVector7.w);
            workingVector7.y = workingVector7.w / workingVector7.y;
            workingVector7.y = fragmentVectorConstants1[workingVector6.w+12].z * workingVector7.y + fragmentVectorConstants1[workingVector6.w+12].y;
            workingVector9.xy = workingVector8.xy * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector7.w = fragmentVectorConstants1[workingVector6.w+12].w + 0.5;
            workingVector7.w = (int)workingVector7.w;
            workingVector7.w = max(1, (int)workingVector7.w);
            workingVector7.w = min(9, (int)workingVector7.w);
            workingVector7.w = workingVector2.w ? 1 : workingVector7.w;
            workingVector8.x = (uint)workingVector7.w >> 1;
            workingVector9.z = 1 + -workingVector9.y;
            workingVector10.z = (int)workingVector6.w;
            workingVector7.y = workingVector8.z + -workingVector7.y;
            workingVector8.yz = float2(0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector10.y = RD_COMPARISON_MASK((int)workingVector10.x >= (int)workingVector9.y);
          if (workingVector10.y != 0) break;
          workingVector10.y = (uint)workingVector10.x << 2;
          workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+41].xyz * workingVector8.yyy;
          workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+40].xyz * workingVector8.xxx + workingVector11.xyz;
          workingVector11.xyz = fragmentVectorConstants1[workingVector10.y+42].xyz * workingVector8.zzz + workingVector11.xyz;
          workingVector10.yzw = fragmentVectorConstants1[workingVector10.y+43].xyz + workingVector11.xyz;
          workingVector11.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector10.yzw));
          workingVector11.x = workingVector11.y ? workingVector11.x : 0;
          workingVector11.x = workingVector11.z ? workingVector11.x : 0;
          if (workingVector11.x != 0) {
            workingVector11.x = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector10.x+0].xyzw);
            workingVector11.x = max(workingVector11.x, workingVector5.w);
            workingVector11.x = min(1, workingVector11.x);
            workingVector11.y = -workingVector11.x * workingVector11.x + 1;
            workingVector11.y = sqrt(workingVector11.y);
            workingVector11.x = workingVector11.y / workingVector11.x;
            workingVector11.x = fragmentVectorConstants1[workingVector10.x+12].z * workingVector11.x + fragmentVectorConstants1[workingVector10.x+12].y;
            workingVector12.xy = workingVector10.yz * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector10.y = fragmentVectorConstants1[workingVector10.x+12].w + 0.5;
            workingVector10.y = (int)workingVector10.y;
            workingVector10.y = max(1, (int)workingVector10.y);
            workingVector10.y = min(9, (int)workingVector10.y);
            workingVector10.y = workingVector7.w ? 1 : workingVector10.y;
            workingVector10.z = (uint)workingVector10.y >> 1;
            workingVector12.z = 1 + -workingVector12.y;
            workingVector13.z = (int)workingVector10.x;
            workingVector10.w = -workingVector11.x + workingVector10.w;
            workingVector11.xy = float2(0,0);
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.z >= (int)workingVector7.w);
              if (workingVector8.w != 0) break;
              workingVector8.w = (int)-workingVector8.x + (int)workingVector8.z;
              workingVector8.w = (int)workingVector8.w;
              workingVector11.y = 0.5 + workingVector8.w;
              workingVector8.w = workingVector8.y;
              workingVector9.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.z = RD_COMPARISON_MASK((int)workingVector11.y >= (int)workingVector10.y);
              if (workingVector11.z != 0) break;
              workingVector11.z = (int)-workingVector10.z + (int)workingVector11.y;
              workingVector11.z = (int)workingVector11.z;
              workingVector14.y = 0.5 + workingVector11.z;
              workingVector11.z = workingVector11.x;
              workingVector11.w = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.y >= (int)workingVector7.w);
                if (workingVector9.w != 0) break;
                workingVector9.w = (int)-workingVector8.x + (int)workingVector9.y;
                workingVector9.w = (int)workingVector9.w;
                workingVector11.x = 0.5 + workingVector9.w;
                workingVector11.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector11.xy;
                workingVector11.xz = fragmentVectorConstants1[workingVector6.w+12].xx * workingVector11.xz;
                workingVector10.xy = workingVector9.xz * fragmentVectorConstants1[workingVector6.w+12].xx + workingVector11.xz;
                workingVector12.xyzw = materialTexture9.Gather(textureSampler9, workingVector10.xyz).xyzw;
                workingVector10.xy = workingVector10.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector10.xy = frac(workingVector10.xy);
                workingVector9.w = RD_COMPARISON_MASK(workingVector12.w >= workingVector7.y);
                workingVector9.w = workingVector9.w ? 1.000000 : 0;
                workingVector9.w = workingVector9.w + workingVector8.w;
                workingVector12.xyzw = RD_COMPARISON_MASK(workingVector12.xyzw >= workingVector7.yyyy);
                workingVector13.xyzw = workingVector12.xyzw ? float4(1,1,1,1) : 0;
                workingVector11.xz = workingVector12.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector11.xz = workingVector13.zy + workingVector11.xz;
                workingVector10.xw = workingVector10.xx * workingVector11.xz + workingVector13.wx;
                workingVector10.w = workingVector10.w + -workingVector10.x;
                workingVector10.x = workingVector10.y * workingVector10.w + workingVector10.x;
                workingVector10.x = workingVector10.x + workingVector8.w;
                workingVector8.w = workingVector2.w ? workingVector9.w : workingVector10.x;
                workingVector9.y = (int)workingVector9.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector12.y = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector10.y);
                if (workingVector12.y != 0) break;
                workingVector12.y = (int)-workingVector10.z + (int)workingVector11.w;
                workingVector12.y = (int)workingVector12.y;
                workingVector14.x = 0.5 + workingVector12.y;
                workingVector12.yw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector14.xy;
                workingVector12.yw = fragmentVectorConstants1[workingVector10.x+12].xx * workingVector12.yw;
                workingVector13.xy = workingVector12.xz * fragmentVectorConstants1[workingVector10.x+12].xx + workingVector12.yw;
                workingVector15.xyzw = materialTexture9.Gather(textureSampler9, workingVector13.xyz).xyzw;
                workingVector12.yw = workingVector13.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector12.yw = frac(workingVector12.yw);
                workingVector13.x = RD_COMPARISON_MASK(workingVector15.w >= workingVector10.w);
                workingVector13.x = workingVector13.x ? 1.000000 : 0;
                workingVector13.x = workingVector13.x + workingVector11.z;
                workingVector15.xyzw = RD_COMPARISON_MASK(workingVector15.xyzw >= workingVector10.wwww);
                workingVector16.xyzw = workingVector15.xyzw ? float4(1,1,1,1) : 0;
                workingVector13.yw = workingVector15.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector13.yw = workingVector16.zy + workingVector13.yw;
                workingVector13.yw = workingVector12.yy * workingVector13.yw + workingVector16.wx;
                workingVector12.y = workingVector13.w + -workingVector13.y;
                workingVector12.y = workingVector12.w * workingVector12.y + workingVector13.y;
                workingVector12.y = workingVector12.y + workingVector11.z;
                workingVector11.z = workingVector7.w ? workingVector13.x : workingVector12.y;
                workingVector11.w = (int)workingVector11.w + 1;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.y = workingVector8.w;
              workingVector8.z = (int)workingVector8.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.x = workingVector11.z;
              workingVector11.y = (int)workingVector11.y + 1;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.y = (int)workingVector7.w * (int)workingVector7.w;
            workingVector7.y = (int)workingVector7.y;
            workingVector7.y = workingVector8.y / workingVector7.y;
            workingVector5.x = min(workingVector7.y, workingVector5.x);
            workingVector6.w = workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.y = (int)workingVector10.y * (int)workingVector10.y;
            workingVector10.y = (int)workingVector10.y;
            workingVector10.y = workingVector11.x / workingVector10.y;
            workingVector9.w = min(workingVector10.y, workingVector9.w);
            workingVector10.x = workingVector9.y;
#endif
          } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.w = (int)workingVector6.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.x = (int)workingVector10.x + 1;
#endif
          }
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector7.x = workingVector5.x;
        workingVector7.z = workingVector6.w;
        workingVector3.w = (int)workingVector3.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.x = workingVector9.w;
        workingVector9.z = workingVector10.x;
        workingVector8.w = (int)workingVector8.w + 1;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector1.y = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
      workingVector1.y = RD_COMPARISON_MASK(0 < (int)workingVector1.y);
      if (workingVector1.y != 0) {
        workingVector7.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector3.yyy;
        workingVector7.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector3.xxx + workingVector7.yzw;
        workingVector7.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector3.zzz + workingVector7.yzw;
        workingVector7.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector7.yzw;
        workingVector8.xy = workingVector7.yz * float2(0.5,0.5) + float2(0.5,0.5);
        workingVector8.z = 1 + -workingVector8.y;
        workingVector7.yz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector8.xz;
        workingVector8.xy = RD_COMPARISON_MASK(workingVector7.yz >= float2(0,0));
        workingVector8.zw = RD_COMPARISON_MASK(workingVector7.yz < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
        workingVector1.y = workingVector8.z ? workingVector8.x : 0;
        workingVector1.y = workingVector8.y ? workingVector1.y : 0;
        workingVector1.y = workingVector8.w ? workingVector1.y : 0;
        if (workingVector1.y != 0) {
          workingVector1.y = max(RD_UNIFORM_ND_LFLOOR.x, workingVector0.w);
          workingVector1.y = min(1, workingVector1.y);
          workingVector3.w = -workingVector1.y * workingVector1.y + 1;
          workingVector3.w = sqrt(workingVector3.w);
          workingVector1.y = workingVector3.w / workingVector1.y;
          workingVector1.y = fragmentVectorConstants1[workingVector6.w+12].z * workingVector1.y + fragmentVectorConstants1[workingVector6.w+12].y;
          workingVector1.y = workingVector7.w + -workingVector1.y;
          workingVector1.y = min(1, workingVector1.y);
          workingVector8.xy = workingVector2.ww ? float2(1,1) : float2(2,4);
          workingVector3.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector9.z = 1 + workingVector3.w;
          workingVector3.w = RD_COMPARISON_MASK((int)workingVector2.w == 0);
          workingVector4.w = 0;
          workingVector5.x = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
      workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
      if (workingVector6.w != 0) {
        workingVector9.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector8.yyy;
        workingVector9.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector8.xxx + workingVector9.yzw;
        workingVector9.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector8.zzz + workingVector9.yzw;
        workingVector9.yzw = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector9.yzw;
        workingVector10.xy = workingVector9.yz * float2(0.5,0.5) + float2(0.5,0.5);
        workingVector10.z = 1 + -workingVector10.y;
        workingVector9.yz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector10.xz;
        workingVector10.xy = RD_COMPARISON_MASK(workingVector9.yz >= float2(0,0));
        workingVector10.zw = RD_COMPARISON_MASK(workingVector9.yz < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
        workingVector6.w = workingVector10.z ? workingVector10.x : 0;
        workingVector6.w = workingVector10.y ? workingVector6.w : 0;
        workingVector6.w = workingVector10.w ? workingVector6.w : 0;
        if (workingVector6.w != 0) {
          workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
          workingVector6.w = min(1, workingVector6.w);
          workingVector8.w = -workingVector6.w * workingVector6.w + 1;
          workingVector8.w = sqrt(workingVector8.w);
          workingVector6.w = workingVector8.w / workingVector6.w;
          workingVector6.w = fragmentVectorConstants1[workingVector10.x+12].z * workingVector6.w + fragmentVectorConstants1[workingVector10.x+12].y;
          workingVector6.w = workingVector9.w + -workingVector6.w;
          workingVector6.w = min(1, workingVector6.w);
          workingVector10.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
          workingVector8.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector11.z = 1 + workingVector8.w;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
          workingVector9.w = 0;
          workingVector10.z = 0;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector6.w = RD_COMPARISON_MASK((int)workingVector5.x >= (int)workingVector8.x);
            if (workingVector6.w != 0) break;
            workingVector6.w = (int)workingVector3.w + (int)workingVector5.x;
            workingVector6.w = (int)workingVector6.w;
            workingVector10.y = 0.5 + workingVector6.w;
            workingVector6.w = workingVector4.w;
            workingVector7.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.z >= (int)workingVector10.x);
            if (workingVector10.w != 0) break;
            workingVector10.w = (int)workingVector8.w + (int)workingVector10.z;
            workingVector10.w = (int)workingVector10.w;
            workingVector12.y = 0.5 + workingVector10.w;
            workingVector10.w = workingVector9.w;
            workingVector11.w = 0;
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.z = RD_COMPARISON_MASK((int)workingVector7.w >= (int)workingVector8.x);
              if (workingVector8.z != 0) break;
              workingVector8.z = (int)workingVector3.w + (int)workingVector7.w;
              workingVector8.z = (int)workingVector8.z;
              workingVector10.x = 0.5 + workingVector8.z;
              workingVector8.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector10.xy;
              workingVector9.xy = workingVector8.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector7.yz;
              if (workingVector2.w != 0) {
                workingVector8.z = materialTexture9.SampleLevel(textureSampler9, workingVector9.xyz, 0).x;
                workingVector8.z = RD_COMPARISON_MASK(workingVector8.z >= workingVector1.y);
                workingVector8.z = workingVector8.z ? 1.000000 : 0;
                workingVector6.w = workingVector8.z + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.z = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector10.x);
              if (workingVector12.z != 0) break;
              workingVector12.z = (int)workingVector8.w + (int)workingVector11.w;
              workingVector12.z = (int)workingVector12.z;
              workingVector12.x = 0.5 + workingVector12.z;
              workingVector12.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector12.xy;
              workingVector11.xy = workingVector12.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector9.yz;
              if (workingVector7.w != 0) {
                workingVector12.x = materialTexture9.SampleLevel(textureSampler9, workingVector11.xyz, 0).x;
                workingVector12.x = RD_COMPARISON_MASK(workingVector12.x >= workingVector6.w);
                workingVector12.x = workingVector12.x ? 1.000000 : 0;
                workingVector10.w = workingVector12.x + workingVector10.w;
#endif
              } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector11.xyzw = materialTexture9.Gather(textureSampler9, workingVector9.xyz).xyzw;
                workingVector8.zw = workingVector9.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector8.zw = frac(workingVector8.zw);
                workingVector11.xyzw = RD_COMPARISON_MASK(workingVector11.xyzw >= workingVector1.yyyy);
                workingVector12.xyzw = workingVector11.xyzw ? float4(1,1,1,1) : 0;
                workingVector9.xy = workingVector11.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector9.xy = workingVector12.zy + workingVector9.xy;
                workingVector9.xy = workingVector8.zz * workingVector9.xy + workingVector12.wx;
                workingVector8.z = workingVector9.y + -workingVector9.x;
                workingVector8.z = workingVector8.w * workingVector8.z + workingVector9.x;
                workingVector6.w = workingVector8.z + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.xyzw = materialTexture9.Gather(textureSampler9, workingVector11.xyz).xyzw;
                workingVector11.xy = workingVector11.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector11.xy = frac(workingVector11.xy);
                workingVector13.xyzw = RD_COMPARISON_MASK(workingVector13.xyzw >= workingVector6.wwww);
                workingVector14.xyzw = workingVector13.xyzw ? float4(1,1,1,1) : 0;
                workingVector12.xz = workingVector13.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector12.xz = workingVector14.zy + workingVector12.xz;
                workingVector12.xz = workingVector11.xx * workingVector12.xz + workingVector14.wx;
                workingVector11.x = workingVector12.z + -workingVector12.x;
                workingVector11.x = workingVector11.y * workingVector11.x + workingVector12.x;
                workingVector10.w = workingVector11.x + workingVector10.w;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector7.w = (int)workingVector7.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.w = (int)workingVector11.w + 1;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = workingVector6.w;
            workingVector5.x = (int)workingVector5.x + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.w = workingVector10.w;
            workingVector10.z = (int)workingVector10.z + 1;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector1.y = workingVector4.w / workingVector8.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector6.w = workingVector9.w / workingVector10.y;
#endif
        } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector1.y = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector6.w = 1;
#endif
        }
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector1.y = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector6.w = 1;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector3.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
      workingVector3.w = RD_COMPARISON_MASK(0 < (int)workingVector3.w);
      workingVector4.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
      workingVector4.w = RD_COMPARISON_MASK(0 < (int)workingVector4.w);
      workingVector3.w = workingVector3.w ? workingVector4.w : 0;
      if (workingVector3.w != 0) {
        workingVector8.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector3.yyyy;
        workingVector8.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector3.xxxx + workingVector8.xyzw;
        workingVector3.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector3.zzzz + workingVector8.xyzw;
        workingVector3.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector3.xyzw;
        workingVector3.xyzw = workingVector3.xyzw / workingVector3.wwww;
        workingVector0.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector0.w);
        workingVector0.w = min(1, workingVector0.w);
        workingVector4.w = -workingVector0.w * workingVector0.w + 1;
        workingVector4.w = sqrt(workingVector4.w);
        workingVector0.w = workingVector4.w / workingVector0.w;
        workingVector0.w = fragmentVectorConstants1[workingVector6.w+12].z * workingVector0.w + fragmentVectorConstants1[workingVector6.w+12].y;
        workingVector0.w = workingVector0.w / workingVector3.w;
        workingVector0.w = workingVector3.z + -workingVector0.w;
        workingVector3.xy = workingVector3.xy * float2(0.5,0.5) + float2(0.5,0.5);
        workingVector3.z = 1 + -workingVector3.y;
        workingVector3.y = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
        workingVector3.y = (int)workingVector3.y;
        workingVector3.y = max(1, (int)workingVector3.y);
        workingVector3.y = min(9, (int)workingVector3.y);
        workingVector3.y = workingVector2.w ? 1 : workingVector3.y;
        workingVector3.w = (uint)workingVector3.y >> 1;
        workingVector8.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
        workingVector4.w = 0;
        workingVector5.x = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector8.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
      workingVector8.w = RD_COMPARISON_MASK(0 < (int)workingVector8.w);
      workingVector9.y = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
      workingVector9.y = RD_COMPARISON_MASK(0 < (int)workingVector9.y);
      workingVector8.w = workingVector8.w ? workingVector9.y : 0;
      if (workingVector8.w != 0) {
        workingVector10.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector8.yyyy;
        workingVector10.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector8.xxxx + workingVector10.xyzw;
        workingVector8.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector8.zzzz + workingVector10.xyzw;
        workingVector8.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector8.xyzw;
        workingVector8.xyzw = workingVector8.xyzw / workingVector8.wwww;
        workingVector5.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
        workingVector5.w = min(1, workingVector5.w);
        workingVector9.y = -workingVector5.w * workingVector5.w + 1;
        workingVector9.y = sqrt(workingVector9.y);
        workingVector5.w = workingVector9.y / workingVector5.w;
        workingVector5.w = fragmentVectorConstants1[workingVector10.x+12].z * workingVector5.w + fragmentVectorConstants1[workingVector10.x+12].y;
        workingVector5.w = workingVector5.w / workingVector8.w;
        workingVector5.w = workingVector8.z + -workingVector5.w;
        workingVector8.xy = workingVector8.xy * float2(0.5,0.5) + float2(0.5,0.5);
        workingVector8.z = 1 + -workingVector8.y;
        workingVector8.y = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
        workingVector8.y = (int)workingVector8.y;
        workingVector8.y = max(1, (int)workingVector8.y);
        workingVector8.y = min(9, (int)workingVector8.y);
        workingVector8.y = workingVector7.w ? 1 : workingVector8.y;
        workingVector8.w = (uint)workingVector8.y >> 1;
        workingVector10.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
        workingVector9.yz = float2(0,0);
#endif
        while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector6.w = RD_COMPARISON_MASK((int)workingVector5.x >= (int)workingVector3.y);
          if (workingVector6.w != 0) break;
          workingVector6.w = (int)-workingVector3.w + (int)workingVector5.x;
          workingVector6.w = (int)workingVector6.w;
          workingVector9.y = 0.5 + workingVector6.w;
          workingVector6.w = workingVector4.w;
          workingVector7.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.z >= (int)workingVector8.y);
          if (workingVector9.w != 0) break;
          workingVector9.w = (int)-workingVector8.w + (int)workingVector9.z;
          workingVector9.w = (int)workingVector9.w;
          workingVector11.y = 0.5 + workingVector9.w;
          workingVector9.w = workingVector9.y;
          workingVector10.w = 0;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.z = RD_COMPARISON_MASK((int)workingVector7.y >= (int)workingVector3.y);
            if (workingVector7.z != 0) break;
            workingVector7.z = (int)-workingVector3.w + (int)workingVector7.y;
            workingVector7.z = (int)workingVector7.z;
            workingVector9.x = 0.5 + workingVector7.z;
            workingVector7.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector9.xy;
            workingVector7.zw = fragmentVectorConstants1[workingVector6.w+12].xx * workingVector7.zw;
            workingVector8.xy = workingVector3.xz * fragmentVectorConstants1[workingVector6.w+12].xx + workingVector7.zw;
            if (workingVector2.w != 0) {
              workingVector7.z = materialTexture9.SampleLevel(textureSampler9, workingVector8.xyz, 0).x;
              workingVector7.z = RD_COMPARISON_MASK(workingVector7.z >= workingVector0.w);
              workingVector7.z = workingVector7.z ? 1.000000 : 0;
              workingVector6.w = workingVector7.z + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector8.y);
            if (workingVector11.z != 0) break;
            workingVector11.z = (int)-workingVector8.w + (int)workingVector10.w;
            workingVector11.z = (int)workingVector11.z;
            workingVector11.x = 0.5 + workingVector11.z;
            workingVector11.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector11.xy;
            workingVector11.xz = fragmentVectorConstants1[workingVector10.x+12].xx * workingVector11.xz;
            workingVector10.xy = workingVector8.xz * fragmentVectorConstants1[workingVector10.x+12].xx + workingVector11.xz;
            if (workingVector7.w != 0) {
              workingVector11.x = materialTexture9.SampleLevel(textureSampler9, workingVector10.xyz, 0).x;
              workingVector11.x = RD_COMPARISON_MASK(workingVector11.x >= workingVector5.w);
              workingVector11.x = workingVector11.x ? 1.000000 : 0;
              workingVector9.w = workingVector11.x + workingVector9.w;
#endif
            } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector10.xyzw = materialTexture9.Gather(textureSampler9, workingVector8.xyz).xyzw;
              workingVector7.zw = workingVector8.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
              workingVector7.zw = frac(workingVector7.zw);
              workingVector10.xyzw = RD_COMPARISON_MASK(workingVector10.xyzw >= workingVector0.wwww);
              workingVector11.xyzw = workingVector10.xyzw ? float4(1,1,1,1) : 0;
              workingVector8.xy = workingVector10.wx ? float2(-1,-1) : float2(-0,-0);
              workingVector8.xy = workingVector11.zy + workingVector8.xy;
              workingVector8.xy = workingVector7.zz * workingVector8.xy + workingVector11.wx;
              workingVector7.z = workingVector8.y + -workingVector8.x;
              workingVector7.z = workingVector7.w * workingVector7.z + workingVector8.x;
              workingVector6.w = workingVector7.z + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.xyzw = materialTexture9.Gather(textureSampler9, workingVector10.xyz).xyzw;
              workingVector10.xy = workingVector10.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
              workingVector10.xy = frac(workingVector10.xy);
              workingVector12.xyzw = RD_COMPARISON_MASK(workingVector12.xyzw >= workingVector5.wwww);
              workingVector13.xyzw = workingVector12.xyzw ? float4(1,1,1,1) : 0;
              workingVector11.xz = workingVector12.wx ? float2(-1,-1) : float2(-0,-0);
              workingVector11.xz = workingVector13.zy + workingVector11.xz;
              workingVector11.xz = workingVector10.xx * workingVector11.xz + workingVector13.wx;
              workingVector10.x = workingVector11.z + -workingVector11.x;
              workingVector10.x = workingVector10.y * workingVector10.x + workingVector11.x;
              workingVector9.w = workingVector10.x + workingVector9.w;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.y = (int)workingVector7.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = (int)workingVector10.w + 1;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector4.w = workingVector6.w;
          workingVector5.x = (int)workingVector5.x + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.y = workingVector9.w;
          workingVector9.z = (int)workingVector9.z + 1;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector0.w = (int)workingVector3.y * (int)workingVector3.y;
        workingVector0.w = (int)workingVector0.w;
        workingVector0.w = workingVector4.w / workingVector0.w;
        workingVector2.w = RD_COMPARISON_MASK(workingVector0.w < 1);
        workingVector3.x = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
        workingVector0.w = max(workingVector3.x, workingVector0.w);
        workingVector0.w = min(1, workingVector0.w);
        workingVector0.w = workingVector2.w ? workingVector0.w : 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = (int)workingVector8.y * (int)workingVector8.y;
        workingVector5.w = (int)workingVector5.w;
        workingVector5.w = workingVector9.y / workingVector5.w;
        workingVector7.w = RD_COMPARISON_MASK(workingVector5.w < 1);
        workingVector8.x = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
        workingVector5.w = max(workingVector8.x, workingVector5.w);
        workingVector5.w = min(1, workingVector5.w);
        workingVector5.w = workingVector7.w ? workingVector5.w : 1;
#endif
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector0.w = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = 1;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector0.w = min(workingVector1.y, workingVector0.w);
      workingVector0.w = min(workingVector7.x, workingVector0.w);
      workingVector1.y = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
      workingVector1.y = min(8, workingVector1.y);
      workingVector1.y = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector1.y;
      workingVector1.y = max(0, workingVector1.y);
      workingVector2.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector1.y;
      workingVector1.y = -workingVector1.z + -workingVector1.y;
      workingVector1.z = 1 / workingVector2.w;
      workingVector1.y = saturate(workingVector1.y * workingVector1.z);
      workingVector1.z = workingVector1.y * -2 + 3;
      workingVector1.y = workingVector1.y * workingVector1.y;
      workingVector1.y = workingVector1.z * workingVector1.y;
      workingVector1.z = 1 + -workingVector0.w;
      workingVector0.w = workingVector1.y * workingVector1.z + workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = min(workingVector6.w, workingVector5.w);
      workingVector5.w = min(workingVector9.x, workingVector5.w);
      workingVector6.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
      workingVector6.w = min(8, workingVector6.w);
      workingVector6.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
      workingVector6.w = max(0, workingVector6.w);
      workingVector7.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
      workingVector6.w = -workingVector6.w + -workingVector1.z;
      workingVector7.w = 1 / workingVector7.w;
      workingVector6.w = saturate(workingVector7.w * workingVector6.w);
      workingVector7.w = workingVector6.w * -2 + 3;
      workingVector6.w = workingVector6.w * workingVector6.w;
      workingVector6.w = workingVector7.w * workingVector6.w;
      workingVector7.w = 1 + -workingVector5.w;
      workingVector5.w = workingVector6.w * workingVector7.w + workingVector5.w;
#endif
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector0.w = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector5.w = 1;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector3.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
    workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector3.xyz;
    workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector3.xyz;
    workingVector3.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector3.xyz;
    workingVector1.y = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector1.y = rsqrt(workingVector1.y);
    workingVector7.xyz = workingVector3.xyz * workingVector1.yyy;
    workingVector8.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
    workingVector8.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector8.xyz;
    workingVector1.z = dot(workingVector4.xyz, workingVector7.xyz);
    workingVector2.w = dot(workingVector4.xyz, -workingVector6.xyz);
    workingVector2.w = max(0, workingVector2.w);
    workingVector3.xyz = workingVector3.xyz * workingVector1.yyy + -workingVector6.xyz;
    workingVector1.y = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector1.y = rsqrt(workingVector1.y);
    workingVector3.xyz = workingVector3.xyz * workingVector1.yyy;
    workingVector1.xz = max(float2(0.0500000007,0), workingVector1.xz);
    workingVector1.x = workingVector1.x * workingVector1.x;
    workingVector1.y = workingVector1.x * workingVector1.x;
    workingVector3.w = dot(workingVector4.xyz, workingVector3.xyz);
    workingVector3.w = max(0, workingVector3.w);
    workingVector4.w = workingVector1.x * workingVector1.x + -1;
    workingVector3.w = workingVector3.w * workingVector3.w;
    workingVector3.w = workingVector3.w * workingVector4.w + 1;
    workingVector3.w = workingVector3.w * workingVector3.w;
    workingVector3.w = 3.14159274 * workingVector3.w;
    workingVector1.y = workingVector1.y / workingVector3.w;
    workingVector3.w = 0.5 * workingVector1.x;
    workingVector1.x = -workingVector1.x * 0.5 + 1;
    workingVector4.w = workingVector2.w * workingVector1.x + workingVector3.w;
    workingVector4.w = 9.99999975e-005 + workingVector4.w;
    workingVector4.w = workingVector2.w / workingVector4.w;
    workingVector1.x = workingVector1.z * workingVector1.x + workingVector3.w;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector1.x = workingVector1.z / workingVector1.x;
    workingVector1.x = workingVector4.w * workingVector1.x;
    workingVector3.x = dot(-workingVector6.xyz, workingVector3.xyz);
    workingVector3.x = max(0, workingVector3.x);
    workingVector3.x = 1 + -workingVector3.x;
    workingVector3.x = max(0, workingVector3.x);
    workingVector3.y = workingVector3.x * workingVector3.x;
    workingVector3.y = workingVector3.y * workingVector3.y;
    workingVector3.x = workingVector3.y * workingVector3.x;
    workingVector3.x = workingVector3.x * 0.980000019 + 0.0199999996;
    workingVector1.y = workingVector3.x * workingVector1.y;
    workingVector1.x = workingVector1.y * workingVector1.x;
    workingVector1.y = workingVector2.w * workingVector1.z;
    workingVector1.y = workingVector1.y * 4 + 9.99999975e-005;
    workingVector1.x = workingVector1.x / workingVector1.y;
    workingVector1.x = workingVector1.z * workingVector1.x;
    workingVector0.w = workingVector1.x * workingVector0.w;
    workingVector1.xyz = workingVector0.www * workingVector8.xyz;
    workingVector1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector1.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector8.xyz;
    workingVector6.w = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector9.xyz = workingVector8.xyz * workingVector6.www;
    workingVector10.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
    workingVector10.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector10.xyz;
    workingVector7.w = dot(workingVector5.xyz, workingVector9.xyz);
    workingVector7.w = max(0, workingVector7.w);
    workingVector8.w = dot(workingVector5.xyz, -workingVector7.xyz);
    workingVector8.w = max(0, workingVector8.w);
    workingVector8.xyz = workingVector8.xyz * workingVector6.www + -workingVector7.xyz;
    workingVector6.w = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector8.xyz = workingVector8.xyz * workingVector6.www;
    workingVector6.w = max(0.0500000007, workingVector1.w);
    workingVector6.w = workingVector6.w * workingVector6.w;
    workingVector9.x = workingVector6.w * workingVector6.w;
    workingVector9.y = dot(workingVector5.xyz, workingVector8.xyz);
    workingVector9.y = max(0, workingVector9.y);
    workingVector9.z = workingVector6.w * workingVector6.w + -1;
    workingVector9.y = workingVector9.y * workingVector9.y;
    workingVector9.y = workingVector9.y * workingVector9.z + 1;
    workingVector9.y = workingVector9.y * workingVector9.y;
    workingVector9.y = 3.14159274 * workingVector9.y;
    workingVector9.x = workingVector9.x / workingVector9.y;
    workingVector9.y = 0.5 * workingVector6.w;
    workingVector6.w = -workingVector6.w * 0.5 + 1;
    workingVector9.z = workingVector8.w * workingVector6.w + workingVector9.y;
    workingVector9.z = 9.99999975e-005 + workingVector9.z;
    workingVector9.z = workingVector8.w / workingVector9.z;
    workingVector6.w = workingVector7.w * workingVector6.w + workingVector9.y;
    workingVector6.w = 9.99999975e-005 + workingVector6.w;
    workingVector6.w = workingVector7.w / workingVector6.w;
    workingVector6.w = workingVector9.z * workingVector6.w;
    workingVector8.x = dot(-workingVector7.xyz, workingVector8.xyz);
    workingVector8.x = max(0, workingVector8.x);
    workingVector8.x = 1 + -workingVector8.x;
    workingVector8.x = max(0, workingVector8.x);
    workingVector8.y = workingVector8.x * workingVector8.x;
    workingVector8.y = workingVector8.y * workingVector8.y;
    workingVector8.x = workingVector8.y * workingVector8.x;
    workingVector8.x = workingVector8.x * 0.980000019 + 0.0199999996;
    workingVector8.x = workingVector8.x * workingVector9.x;
    workingVector6.w = workingVector8.x * workingVector6.w;
    workingVector8.x = workingVector8.w * workingVector7.w;
    workingVector8.x = workingVector8.x * 4 + 9.99999975e-005;
    workingVector6.w = workingVector6.w / workingVector8.x;
    workingVector6.w = workingVector7.w * workingVector6.w;
    workingVector5.w = workingVector6.w * workingVector5.w;
    workingVector8.xyz = workingVector5.www * workingVector10.xyz;
    workingVector8.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector8.xyz;
#endif
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector1.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector0.w = max(1, workingVector0.w);
  workingVector2.w = 0.00392156886 * workingVector0.x;
  workingVector0.x = workingVector0.x * 0.0627451017 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector0.x = saturate(workingVector0.x / workingVector0.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
  if (workingVector5.w != 0) {
    workingVector5.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector1.z;
    workingVector6.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector5.w;
    workingVector7.w = workingVector5.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector1.x;
    workingVector6.w = workingVector6.w + workingVector6.w;
    workingVector6.w = saturate(workingVector7.w / workingVector6.w);
    workingVector7.w = -workingVector1.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector1.y;
    workingVector5.w = workingVector5.w + workingVector5.w;
    workingVector5.w = saturate(workingVector7.w / workingVector5.w);
    workingVector9.xy = RD_COMPARISON_MASK(-workingVector1.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
    workingVector7.w = log2(-workingVector1.z);
    workingVector7.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector7.w;
    workingVector7.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector7.w);
    workingVector10.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
    workingVector7.w = workingVector10.x * workingVector7.w;
    workingVector7.w = floor(workingVector7.w);
    workingVector7.w = 2 + workingVector7.w;
    workingVector7.w = min(workingVector7.w, workingVector10.y);
    workingVector7.w = workingVector9.y ? 1 : workingVector7.w;
    workingVector7.w = workingVector9.x ? 0 : workingVector7.w;
    workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector6.w;
    workingVector6.w = floor(workingVector6.w);
    workingVector6.w = min(workingVector6.w, workingVector10.z);
    workingVector5.w = RD_UNIFORM_CLUSTER_DIMENSIONS.y * workingVector5.w;
    workingVector5.w = floor(workingVector5.w);
    workingVector5.w = min(workingVector5.w, workingVector10.w);
    workingVector8.w = RD_COMPARISON_MASK(workingVector6.w < 0);
    workingVector9.x = RD_COMPARISON_MASK(workingVector5.w < 0);
    workingVector8.w = (int)workingVector8.w | (int)workingVector9.x;
    workingVector9.x = RD_COMPARISON_MASK(workingVector7.w < 0);
    workingVector8.w = (int)workingVector8.w | (int)workingVector9.x;
    workingVector9.x = RD_COMPARISON_MASK(workingVector6.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
    workingVector8.w = (int)workingVector8.w | (int)workingVector9.x;
    workingVector9.x = RD_COMPARISON_MASK(workingVector5.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
    workingVector8.w = (int)workingVector8.w | (int)workingVector9.x;
    workingVector9.x = RD_COMPARISON_MASK(workingVector7.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
    workingVector8.w = (int)workingVector8.w | (int)workingVector9.x;
    if (workingVector8.w == 0) {
      workingVector5.w = workingVector5.w * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector6.w;
      workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector7.w;
      workingVector5.w = workingVector6.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector5.w;
      workingVector5.w = (int)workingVector5.w;
      workingVector6.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
      workingVector7.w = (int)workingVector5.w * (int)workingVector6.w;
      workingVector5.w = mad((int)workingVector5.w, (int)workingVector6.w, (int)workingVector6.w);
      workingVector6.w = dot(workingVector5.xyz, -workingVector7.xyz);
      workingVector6.w = max(0, workingVector6.w);
      workingVector1.w = max(0.0500000007, workingVector1.w);
      workingVector1.w = workingVector1.w * workingVector1.w;
      workingVector8.w = workingVector1.w * workingVector1.w;
      workingVector9.x = workingVector1.w * workingVector1.w + -1;
      workingVector9.y = 0.5 * workingVector1.w;
      workingVector1.w = -workingVector1.w * 0.5 + 1;
      workingVector9.z = workingVector6.w * workingVector1.w + workingVector9.y;
      workingVector9.z = 9.99999975e-005 + workingVector9.z;
      workingVector9.z = workingVector6.w / workingVector9.z;
      workingVector9.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
      workingVector10.x = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
      workingVector10.y = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
      workingVector10.z = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
      workingVector11.xy = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
      workingVector10.z = 1 / workingVector10.z;
      workingVector12.xyz = float3(0,0,0);
      workingVector10.w = workingVector7.w;
      while (true) {
        workingVector11.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector5.w);
        if (workingVector11.z != 0) break;
        workingVector11.z = sampledResource15[workingVector10.w].val[0/4];
        workingVector11.z = (int)workingVector11.z;
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.z < 0);
        if (workingVector11.w != 0) {
          break;
        }
        workingVector13.x = sampledResource16[workingVector11.z].val[0/4];
        workingVector13.y = sampledResource16[workingVector11.z].val[0/4+1];
        workingVector13.z = sampledResource16[workingVector11.z].val[0/4+2];
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector13.yyy;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector13.xxx + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector13.zzz + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector14.xyz;
        workingVector14.xyz = workingVector14.xyz + -workingVector1.xyz;
        workingVector11.w = dot(workingVector14.xyz, workingVector14.xyz);
        workingVector11.w = rsqrt(workingVector11.w);
        workingVector15.xyz = workingVector14.xyz * workingVector11.www;
        workingVector12.w = dot(workingVector5.xyz, workingVector15.xyz);
        workingVector12.w = max(0, workingVector12.w);
        workingVector14.xyz = workingVector14.xyz * workingVector11.www + -workingVector7.xyz;
        workingVector11.w = dot(workingVector14.xyz, workingVector14.xyz);
        workingVector11.w = rsqrt(workingVector11.w);
        workingVector14.xyz = workingVector14.xyz * workingVector11.www;
        workingVector11.w = dot(workingVector5.xyz, workingVector14.xyz);
        workingVector11.w = max(0, workingVector11.w);
        workingVector11.w = workingVector11.w * workingVector11.w;
        workingVector11.w = workingVector11.w * workingVector9.x + 1;
        workingVector11.w = workingVector11.w * workingVector11.w;
        workingVector11.w = 3.14159274 * workingVector11.w;
        workingVector11.w = workingVector8.w / workingVector11.w;
        workingVector13.w = workingVector12.w * workingVector1.w + workingVector9.y;
        workingVector13.w = 9.99999975e-005 + workingVector13.w;
        workingVector13.w = workingVector12.w / workingVector13.w;
        workingVector13.w = workingVector13.w * workingVector9.z;
        workingVector14.x = dot(-workingVector7.xyz, workingVector14.xyz);
        workingVector14.x = max(0, workingVector14.x);
        workingVector14.x = 1 + -workingVector14.x;
        workingVector14.x = max(0, workingVector14.x);
        workingVector14.y = workingVector14.x * workingVector14.x;
        workingVector14.y = workingVector14.y * workingVector14.y;
        workingVector14.x = workingVector14.y * workingVector14.x;
        workingVector14.x = workingVector14.x * 0.980000019 + 0.0199999996;
        workingVector11.w = workingVector14.x * workingVector11.w;
        workingVector11.w = workingVector11.w * workingVector13.w;
        workingVector13.w = workingVector12.w * workingVector6.w;
        workingVector13.w = workingVector13.w * 4 + 9.99999975e-005;
        workingVector11.w = workingVector11.w / workingVector13.w;
        workingVector11.w = workingVector12.w * workingVector11.w;
        workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.z >= 0);
        if (workingVector12.w != 0) {
          workingVector14.x = sampledResource16[workingVector11.z].val[0/4];
          workingVector14.y = sampledResource16[workingVector11.z].val[0/4+1];
          workingVector14.z = sampledResource16[workingVector11.z].val[0/4+2];
          workingVector14.w = sampledResource16[workingVector11.z].val[0/4+3];
          workingVector14.xyz = workingVector14.xyz + -workingVector3.xyz;
          workingVector12.w = abs(workingVector14.x) + abs(workingVector14.y);
          workingVector12.w = workingVector12.w + abs(workingVector14.z);
          workingVector12.w = workingVector12.w * workingVector12.w;
          workingVector13.w = dot(workingVector14.xyz, workingVector14.xyz);
          workingVector12.w = workingVector9.w ? workingVector12.w : workingVector13.w;
          workingVector13.w = workingVector14.w * workingVector14.w;
          workingVector13.w = RD_COMPARISON_MASK(workingVector12.w < workingVector13.w);
          if (workingVector13.w != 0) {
            if (workingVector10.x != 0) {
              workingVector15.x = sampledResource16[workingVector11.z].val[32/4];
              workingVector15.y = sampledResource16[workingVector11.z].val[32/4+1];
              workingVector15.z = sampledResource16[workingVector11.z].val[32/4+2];
              workingVector15.w = sampledResource16[workingVector11.z].val[32/4+3];
              workingVector16.x = sampledResource16[workingVector11.z].val[48/4];
              workingVector16.y = sampledResource16[workingVector11.z].val[48/4+1];
              workingVector16.z = sampledResource16[workingVector11.z].val[48/4+2];
              workingVector16.w = sampledResource16[workingVector11.z].val[48/4+3];
              workingVector17.x = sampledResource16[workingVector11.z].val[64/4];
              workingVector17.y = sampledResource16[workingVector11.z].val[64/4+1];
              workingVector17.z = sampledResource16[workingVector11.z].val[64/4+2];
              workingVector17.w = sampledResource16[workingVector11.z].val[64/4+3];
              workingVector18.x = sampledResource16[workingVector11.z].val[80/4];
              workingVector18.y = sampledResource16[workingVector11.z].val[80/4+1];
              workingVector18.z = sampledResource16[workingVector11.z].val[80/4+2];
              workingVector18.w = sampledResource16[workingVector11.z].val[80/4+3];
              workingVector19.x = sampledResource16[workingVector11.z].val[96/4];
              workingVector19.y = sampledResource16[workingVector11.z].val[96/4+1];
              workingVector19.z = sampledResource16[workingVector11.z].val[96/4+2];
              workingVector19.w = sampledResource16[workingVector11.z].val[96/4+3];
              workingVector20.x = sampledResource16[workingVector11.z].val[112/4];
              workingVector20.y = sampledResource16[workingVector11.z].val[112/4+1];
              workingVector20.z = sampledResource16[workingVector11.z].val[112/4+2];
              workingVector20.w = sampledResource16[workingVector11.z].val[112/4+3];
              workingVector13.xyz = -workingVector13.xyz + workingVector4.xyz;
              workingVector14.xyz = RD_COMPARISON_MASK(abs(workingVector13.xxy) >= abs(workingVector13.yzz));
              workingVector14.x = workingVector14.y ? workingVector14.x : 0;
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(0,0,0));
              workingVector21.xyz = workingVector21.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
              workingVector14.y = workingVector14.z ? workingVector21.y : workingVector21.z;
              workingVector14.x = workingVector14.x ? workingVector21.x : workingVector14.y;
              workingVector21.xyzw = RD_COMPARISON_MASK((int4)workingVector14.xxxx == int4(1,2,3,4));
              workingVector14.x = RD_COMPARISON_MASK((int)workingVector14.x == 5);
              workingVector15.xyzw = workingVector14.xxxx ? workingVector20.xyzw : workingVector15.xyzw;
              workingVector15.xyzw = workingVector21.wwww ? workingVector19.xyzw : workingVector15.xyzw;
              workingVector15.xyzw = workingVector21.zzzz ? workingVector18.xyzw : workingVector15.xyzw;
              workingVector15.xyzw = workingVector21.yyyy ? workingVector17.xyzw : workingVector15.xyzw;
              workingVector14.yz = workingVector21.xx ? workingVector16.zw : workingVector15.zw;
              workingVector15.zw = RD_COMPARISON_MASK(workingVector14.yz == float2(0,0));
              workingVector15.z = workingVector15.w ? workingVector15.z : 0;
              if (workingVector15.z == 0) {
                workingVector13.w = -workingVector13.x;
                workingVector15.zw = workingVector14.xx ? workingVector13.xz : workingVector13.zw;
                workingVector17.xz = workingVector21.ww ? -workingVector13.xz : workingVector15.zw;
                workingVector18.xyz = float3(-1,1,1) * workingVector13.xzy;
                workingVector17.y = workingVector18.z;
                workingVector17.xyz = workingVector21.zzz ? workingVector18.xyz : workingVector17.xyz;
                workingVector17.xyz = workingVector21.yyy ? -workingVector13.xzy : workingVector17.xyz;
                workingVector15.xy = workingVector21.xx ? workingVector16.xy : workingVector15.xy;
                workingVector16.xyz = float3(-1,1,1) * workingVector13.zyx;
                workingVector16.xyz = workingVector21.xxx ? workingVector16.xyz : workingVector17.xyz;
                workingVector17.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector16.yyyy;
                workingVector17.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector16.xxxx + workingVector17.xyzw;
                workingVector16.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector16.zzzz + workingVector17.xyzw;
                workingVector16.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector16.xyzw;
                workingVector13.w = dot(-workingVector13.xyz, -workingVector13.xyz);
                workingVector13.w = rsqrt(workingVector13.w);
                workingVector13.xyz = -workingVector13.xyz * workingVector13.www;
                workingVector13.x = dot(workingVector13.xyz, workingVector0.xyw);
                workingVector13.x = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector13.x);
                workingVector13.x = min(1, workingVector13.x);
                workingVector13.y = -workingVector13.x * workingVector13.x + 1;
                workingVector13.y = sqrt(workingVector13.y);
                workingVector13.x = workingVector13.y / workingVector13.x;
                workingVector13.x = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector13.x + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                workingVector13.yzw = -workingVector15.xxy + workingVector14.yyz;
                workingVector17.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector13.yzw;
                workingVector13.y = max(1, workingVector17.x);
                workingVector13.y = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector13.y;
                workingVector16.z = -workingVector13.x * workingVector13.y + workingVector16.z;
                workingVector16.xyz = workingVector16.xyz / workingVector16.www;
                workingVector18.xy = workingVector16.xy * float2(0.5,0.5) + float2(0.5,0.5);
                workingVector13.xy = workingVector15.xy + workingVector11.xy;
                workingVector14.xy = workingVector14.yz + -workingVector11.xy;
                workingVector18.z = 1 + -workingVector18.y;
                workingVector15.zw = workingVector18.xz * workingVector17.yz;
                workingVector15.zw = floor(workingVector15.zw);
                workingVector15.zw = float2(0.5,0.5) + workingVector15.zw;
                workingVector15.zw = workingVector15.zw / workingVector17.yz;
                workingVector13.zw = workingVector15.zw * workingVector13.zw + workingVector15.xy;
                workingVector13.xy = max(workingVector13.zw, workingVector13.xy);
                workingVector13.xy = min(workingVector13.xy, workingVector14.xy);
                workingVector13.x = materialTexture5.SampleLevel(textureSampler5, workingVector13.xy, 0).x;
                workingVector13.x = RD_COMPARISON_MASK(workingVector13.x >= workingVector16.z);
                workingVector13.x = workingVector13.x ? 1.000000 : 0;
              } else {
                workingVector13.x = 0;
              }
            } else {
              workingVector13.x = 1;
            }
            workingVector13.y = max(0.100000001, workingVector12.w);
            workingVector13.y = 1 / workingVector13.y;
            workingVector13.z = workingVector14.w * workingVector14.w + 9.99999975e-005;
            workingVector12.w = workingVector12.w / workingVector13.z;
            workingVector12.w = -workingVector12.w * workingVector12.w + 1;
            workingVector12.w = max(0, workingVector12.w);
            workingVector12.w = workingVector12.w * workingVector12.w;
            workingVector13.z = workingVector13.y * workingVector12.w;
            workingVector12.w = -workingVector13.y * workingVector12.w + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
            workingVector12.w = 1 + workingVector12.w;
            workingVector12.w = saturate(workingVector12.w * workingVector10.z);
            workingVector13.y = workingVector12.w * -2 + 3;
            workingVector12.w = workingVector12.w * workingVector12.w;
            workingVector12.w = workingVector13.y * workingVector12.w;
            workingVector12.w = saturate(workingVector12.w * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
            workingVector12.w = workingVector13.z * workingVector12.w;
            workingVector12.w = workingVector10.y ? workingVector12.w : workingVector13.z;
            workingVector14.x = sampledResource16[workingVector11.z].val[16/4];
            workingVector14.y = sampledResource16[workingVector11.z].val[16/4+1];
            workingVector14.z = sampledResource16[workingVector11.z].val[16/4+2];
            workingVector14.w = sampledResource16[workingVector11.z].val[16/4+3];
            workingVector13.yzw = workingVector14.xyz * workingVector14.www;
            workingVector13.yzw = workingVector13.yzw * workingVector12.www;
          } else {
            workingVector13.xyzw = float4(1,0,0,0);
          }
        } else {
          workingVector13.xyzw = float4(1,0,0,0);
        }
        workingVector11.z = workingVector13.x * workingVector11.w;
        workingVector13.xyz = workingVector11.zzz * workingVector13.yzw;
        workingVector12.xyz = workingVector13.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector12.xyz;
        workingVector10.w = (int)workingVector10.w + 1;
      }
    } else {
      workingVector12.xyz = float3(0,0,0);
    }
    workingVector0.x = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
    workingVector8.xyz = workingVector0.xxx * workingVector12.xyz + workingVector8.xyz;
  }
  workingVector0.x = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector0.x = max(1, workingVector0.x);
  workingVector0.y = 0.00392156886 * workingVector2.w;
  workingVector0.w = workingVector2.w * 0.0627451017 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
  workingVector0.x = saturate(workingVector0.w / workingVector0.x);
#endif
  workingVector0.w = workingVector0.x * workingVector0.x;
  workingVector0.x = workingVector0.w * workingVector0.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.w = dot(-workingVector6.xyz, workingVector4.xyz);
  workingVector3.x = max(0, workingVector0.w);
  workingVector3.x = 1 + -workingVector3.x;
  workingVector3.x = max(0, workingVector3.x);
  workingVector3.y = workingVector3.x * workingVector3.x;
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.x = workingVector3.y * workingVector3.x;
  workingVector3.x = workingVector3.x * 0.980000019 + 0.0199999996;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector0.w = dot(-workingVector7.xyz, workingVector5.xyz);
  workingVector1.x = max(0, workingVector0.w);
  workingVector1.x = 1 + -workingVector1.x;
  workingVector1.x = max(0, workingVector1.x);
  workingVector1.y = workingVector1.x * workingVector1.x;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.x = workingVector1.y * workingVector1.x;
  workingVector1.x = workingVector1.x * 0.980000019 + 0.0199999996;
#endif
  workingVector0.x = -workingVector0.x * RD_UNIFORM_IBL_PARAMETERS.x + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.x = workingVector0.x * workingVector3.x;
  workingVector3.x = workingVector2.w * workingVector2.w;
  workingVector3.y = workingVector3.x * workingVector3.x;
  workingVector3.y = workingVector3.y * workingVector2.w;
  workingVector3.x = workingVector3.x * workingVector2.w + -workingVector3.y;
  workingVector3.x = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector3.x + workingVector3.y;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector3.xxx;
  workingVector3.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector3.xyz;
  workingVector3.xyz = workingVector5.yzw * float3(6,6,6) + workingVector3.xyz;
  workingVector4.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector3.xyz = max(workingVector4.xyz, workingVector3.xyz);
  workingVector1.xyz = workingVector0.xxx * workingVector3.xyz + workingVector1.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector0.x = workingVector0.x * workingVector1.x;
  workingVector1.x = workingVector0.y * workingVector0.y;
  workingVector1.y = workingVector1.x * workingVector1.x;
  workingVector1.y = workingVector1.y * workingVector0.y;
  workingVector1.x = workingVector1.x * workingVector0.y + -workingVector1.y;
  workingVector1.x = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector1.x + workingVector1.y;
  workingVector1.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector1.xxx;
  workingVector1.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector1.xyz;
  workingVector1.xyz = workingVector6.xyz * float3(6,6,6) + workingVector1.xyz;
  workingVector3.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.xyz = max(workingVector3.xyz, workingVector1.xyz);
  workingVector1.xyz = workingVector0.xxx * workingVector1.xyz + workingVector8.xyz;
#endif
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_CAMERA_IS_UNDERWATER.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.x = -workingVector0.w * workingVector0.w + 1;
  workingVector3.y = RD_COMPARISON_MASK(0.565323055 >= workingVector3.x);
  workingVector3.z = ~(int)workingVector3.y;
  workingVector3.x = -workingVector3.x * 1.76890016 + 1;
  workingVector3.x = sqrt(workingVector3.x);
  workingVector3.x = workingVector3.y ? workingVector3.x : workingVector0.w;
  workingVector0.w = workingVector0.x ? workingVector3.x : workingVector0.w;
  workingVector0.x = workingVector0.x ? workingVector3.z : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector1.w = -workingVector0.w * workingVector0.w + 1;
  workingVector2.w = RD_COMPARISON_MASK(0.565323055 >= workingVector1.w);
  workingVector4.x = ~(int)workingVector2.w;
  workingVector1.w = -workingVector1.w * 1.76890016 + 1;
  workingVector1.w = sqrt(workingVector1.w);
  workingVector1.w = workingVector2.w ? workingVector1.w : workingVector0.w;
  workingVector0.w = workingVector0.x ? workingVector1.w : workingVector0.w;
  workingVector0.x = workingVector0.x ? workingVector4.x : 0;
#endif
  workingVector0.w = saturate(1 + -workingVector0.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.x = workingVector0.w * workingVector0.w;
  workingVector3.x = workingVector3.x * workingVector3.x;
  workingVector0.w = workingVector3.x * workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector1.w = workingVector0.w * workingVector0.w;
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector0.w = workingVector1.w * workingVector0.w;
#endif
  workingVector0.w = workingVector0.w * 0.980000019 + 0.0199999996;
  workingVector0.w = 1 + -workingVector0.w;
  workingVector0.w = 1 + -workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.w = workingVector0.x ? 1 : workingVector0.w;
  workingVector5.xyz = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.yzx != float3(0,0,0));
  workingVector0.x = workingVector5.y ? workingVector5.x : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector5.w = workingVector0.x ? 1 : workingVector0.w;
  workingVector4.xyz = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.yzx != float3(0,0,0));
  workingVector0.x = workingVector4.y ? workingVector4.x : 0;
#endif
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector0.x = workingVector0.w ? workingVector0.x : 0;
  if (workingVector0.x != 0) {
    workingVector6.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = max(workingVector6.xyz, workingVector4.xyz);
    workingVector4.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector4.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.xyz = max(workingVector6.xyz, workingVector3.xyz);
    workingVector3.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector3.xyz;
#endif
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  if (workingVector5.z != 0) {
    workingVector0.x = workingVector1.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  if (workingVector4.z != 0) {
    workingVector0.x = workingVector4.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
#endif
    workingVector0.x = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.x;
    workingVector0.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.x;
    workingVector0.x = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.x);
    workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.x);
    if (workingVector0.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      if (workingVector5.x != 0) {
        workingVector4.xyz = max(float3(1,1,1), workingVector4.xyz);
        workingVector4.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector4.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      if (workingVector4.x != 0) {
        workingVector3.xyz = max(float3(1,1,1), workingVector3.xyz);
        workingVector3.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector3.xyz;
#endif
      } else {
        workingVector0.w = RD_COMPARISON_MASK(workingVector0.z == 1.000000);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector0.y = workingVector0.w ? workingVector0.y : workingVector2.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector0.y = workingVector0.w ? workingVector3.w : workingVector0.y;
#endif
        workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector0.w = rsqrt(workingVector0.w);
        workingVector2.xzw = workingVector2.xyz * workingVector0.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector4.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
#endif
        workingVector6.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector7.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector1.w = workingVector5.y + -workingVector5.x;
        workingVector0.w = workingVector2.y * workingVector0.w + -workingVector5.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector1.w = workingVector4.y + -workingVector4.x;
        workingVector0.w = workingVector2.y * workingVector0.w + -workingVector4.x;
#endif
        workingVector1.w = 1 / workingVector1.w;
        workingVector1.w = saturate(workingVector1.w * workingVector0.w);
        workingVector2.y = workingVector1.w * -2 + 3;
        workingVector1.w = workingVector1.w * workingVector1.w;
        workingVector1.w = -workingVector2.y * workingVector1.w + 1;
        workingVector2.y = workingVector1.w * workingVector1.w;
        workingVector1.w = workingVector2.y * workingVector1.w;
        workingVector2.y = dot(workingVector2.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector2.x = dot(workingVector2.xzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector2.z = workingVector2.y * workingVector2.y + 1;
        workingVector2.z = RD_UNIFORM_SUN_COLOR.w * workingVector2.z;
        workingVector2.w = workingVector2.x * workingVector2.x + 1;
        workingVector2.w = RD_UNIFORM_MOON_COLOR.w * workingVector2.w;
        workingVector2.w = 0.75 * workingVector2.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector4.w = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector5.x;
        workingVector4.w = 1 / workingVector4.w;
        workingVector0.w = saturate(workingVector4.w * workingVector0.w);
        workingVector4.w = workingVector0.w * -2 + 3;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector3.w = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector4.x;
        workingVector3.w = 1 / workingVector3.w;
        workingVector0.w = saturate(workingVector3.w * workingVector0.w);
        workingVector3.w = workingVector0.w * -2 + 3;
#endif
        workingVector0.w = workingVector0.w * workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector0.w = -workingVector4.w * workingVector0.w + 1;
        workingVector4.w = workingVector0.w * workingVector0.w;
        workingVector0.w = workingVector4.w * workingVector0.w;
        workingVector5.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector5.xyz = workingVector0.www * workingVector5.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector5.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector5.xyz;
        workingVector5.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector0.w = -workingVector3.w * workingVector0.w + 1;
        workingVector3.w = workingVector0.w * workingVector0.w;
        workingVector0.w = workingVector3.w * workingVector0.w;
        workingVector4.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector4.xyz = workingVector0.www * workingVector4.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector4.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector4.xyz;
        workingVector4.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector4.xyz;
#endif
        workingVector0.w = workingVector2.z * 0.75 + workingVector2.w;
        workingVector2.xy = max(float2(0,0), workingVector2.xy);
        workingVector2.y = log2(workingVector2.y);
        workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
        workingVector2.y = exp2(workingVector2.y);
        workingVector2.x = log2(workingVector2.x);
        workingVector2.x = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.x;
        workingVector2.x = exp2(workingVector2.x);
        workingVector2.xy = min(float2(1,1), workingVector2.xy);
        workingVector2.z = -workingVector2.y * 1.79999995 + 1.80999994;
        workingVector2.w = sqrt(workingVector2.z);
        workingVector2.z = workingVector2.z * workingVector2.w;
        workingVector2.w = -workingVector2.x * 1.79999995 + 1.80999994;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector4.w = sqrt(workingVector2.w);
        workingVector2.w = workingVector4.w * workingVector2.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector3.w = sqrt(workingVector2.w);
        workingVector2.w = workingVector3.w * workingVector2.w;
#endif
        workingVector2.zw = float2(0.0361000001,0.0361000001) / workingVector2.zw;
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector6.xyz;
        workingVector6.xyz = workingVector6.xyz * workingVector2.yyy;
        workingVector7.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector7.xyz;
        workingVector7.xyz = workingVector7.xyz * workingVector2.xxx;
        workingVector2.xyw = workingVector7.xyz * workingVector2.www;
        workingVector7.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector1.www;
        workingVector7.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector7.xyz;
        workingVector2.xyz = workingVector6.xyz * workingVector2.zzz + workingVector2.xyw;
        workingVector2.xyz = workingVector7.xyz * workingVector2.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector2.xyz = workingVector5.xyz * workingVector0.www + workingVector2.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector2.xyz = workingVector4.xyz * workingVector0.www + workingVector2.xyz;
#endif
        workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector0.y = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, workingVector0.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector5.xyz = workingVector0.yyy * workingVector5.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector4.xyz = workingVector0.www ? workingVector5.xyz : workingVector2.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector4.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector4.xyz = workingVector0.yyy * workingVector4.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector3.xyz = workingVector0.www ? workingVector4.xyz : workingVector2.xyz;
#endif
      }
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector3.xyz = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector4.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.xyz = float3(0,0,0);
#endif
    workingVector0.x = 0;
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector2.xyz = workingVector4.xyz * workingVector3.www + -workingVector1.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector2.xyz = workingVector3.xyz * workingVector5.www + -workingVector1.xyz;
#endif
  workingVector0.xyw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.x != 0) {
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * varyingColor1.yy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * varyingColor1.xx + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector0.zz + workingVector1.xy;
    workingVector1.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector1.xy;
    workingVector0.z = -workingVector1.x / workingVector1.y;
    workingVector0.z = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.z;
    workingVector1.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector0.z = workingVector0.z / workingVector1.x;
    workingVector0.z = workingVector0.z * 53.5981483 + 1;
    workingVector0.z = log2(workingVector0.z);
    workingVector0.z = 0.173286796 * workingVector0.z;
    workingVector1.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector1.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector0.z = workingVector0.z * workingVector1.y + -0.5;
    workingVector1.y = (int)workingVector0.z;
    workingVector1.x = (int)workingVector1.x + -2;
    workingVector1.y = max(0, (int)workingVector1.y);
    workingVector1.x = min((int)workingVector1.y, (int)workingVector1.x);
    workingVector2.z = (int)workingVector1.x;
    workingVector0.z = saturate(-workingVector2.z + workingVector0.z);
    workingVector2.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector2.xyzw = materialTexture8.SampleLevel(textureSampler8, workingVector2.xyz, 0).xyzw;
    workingVector1.x = (int)workingVector1.x + 1;
    workingVector1.z = (int)workingVector1.x;
    workingVector1.xy = varyingColor1.xy * float2(0.5,0.5) + float2(0.5,0.5);
    workingVector1.xyzw = materialTexture8.SampleLevel(textureSampler8, workingVector1.xyz, 0).xyzw;
    workingVector1.xyzw = workingVector1.xyzw + -workingVector2.xyzw;
    workingVector1.xyzw = workingVector0.zzzz * workingVector1.xyzw + workingVector2.xyzw;
  } else {
    workingVector1.xyzw = float4(0,0,0,1);
  }
  workingVector0.xyz = workingVector1.www * workingVector0.xyw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector3.xyz = workingVector1.xyz * workingVector3.www + workingVector0.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector5.xyz = workingVector1.xyz * workingVector5.www + workingVector0.xyz;
#endif
  workingVector0.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.x != 0) {
    workingVector0.x = materialTexture6.Sample(textureSampler6, float2(0.5,0.5)).x;
    workingVector0.x = 0.180000007 / workingVector0.x;
    workingVector0.x = 9.99999975e-005 + workingVector0.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector3.xyz = workingVector3.xyz * workingVector0.xxx;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector5.xyz = workingVector5.xyz * workingVector0.xxx;
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  fragmentColor0.xyzw = workingVector3.xyzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  fragmentColor0.xyzw = workingVector5.xyzw;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float4 sampledTextureValue1 = sceneDepthTexture.Sample(sceneDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float productValue = (scalarValue2 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (RD_UNIFORM_INV_PROJ_ROW_0.x * varyingColor1.x) / productValue;
    float quotientValue1 = (RD_UNIFORM_INV_PROJ_ROW_1.y * varyingColor1.y) / productValue;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue38 = (-0.0f) - quotientValue2;
#endif
    float multiplyAddValue = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue39 = multiplyAddValue + RD_UNIFORM_INV_VIEW_ROW_3.x;
#endif
    float multiplyAddValue1 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue40 = multiplyAddValue1 + RD_UNIFORM_INV_VIEW_ROW_3.y;
#endif
    float multiplyAddValue2 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue41 = multiplyAddValue2 + RD_UNIFORM_INV_VIEW_ROW_3.z;
#endif
    float quotientValue3 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + varyingColor1.x) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue;
    float quotientValue4 = ((varyingColor1.y - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue;
    float multiplyAddValue3 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue4 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue5 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue3 = ddx_coarse(quotientValue3);
    float scalarValue4 = ddx_coarse(quotientValue4);
    float scalarValue5 = ddx_coarse(quotientValue2);
    float inverseLengthValue = rsqrt(dot(float3(scalarValue3, scalarValue4, scalarValue5), float3(scalarValue3, scalarValue4, scalarValue5)));
    float productValue1 = inverseLengthValue * scalarValue3;
    float productValue2 = inverseLengthValue * scalarValue4;
    float productValue3 = inverseLengthValue * scalarValue5;
    float sumValue = ddy_coarse((-0.0f) - quotientValue3);
    float sumValue1 = ddy_coarse((-0.0f) - quotientValue4);
    float sumValue2 = ddy_coarse((-0.0f) - quotientValue2);
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue4 = inverseLengthValue1 * sumValue;
    float productValue5 = inverseLengthValue1 * sumValue1;
    float productValue6 = inverseLengthValue1 * sumValue2;
    float productValue7 = (productValue6 * productValue2) - (productValue5 * productValue3);
    float productValue8 = (productValue4 * productValue3) - (productValue6 * productValue1);
    float productValue9 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float inverseLengthValue2 = rsqrt(dot(float3(productValue7, productValue8, productValue9), float3(productValue7, productValue8, productValue9)));
    float productValue10 = productValue7 * inverseLengthValue2;
    float productValue11 = productValue8 * inverseLengthValue2;
    float productValue12 = productValue9 * inverseLengthValue2;
    float multiplyAddValue6 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue8 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue12, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue11, productValue10 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float quotientValue5 = round((inverseLengthValue3 * multiplyAddValue6) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue6 = round((inverseLengthValue3 * multiplyAddValue7) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue7 = round((inverseLengthValue3 * multiplyAddValue8) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue4 = rsqrt(dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue13 = inverseLengthValue4 * quotientValue5;
    float productValue14 = inverseLengthValue4 * quotientValue6;
    float productValue15 = inverseLengthValue4 * quotientValue7;
    float productValue16 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue8 = productValue16 - (multiplyAddValue3 - (floor(multiplyAddValue3 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue9 = productValue16 - (multiplyAddValue4 - (floor(multiplyAddValue4 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue10 = productValue16 - (multiplyAddValue5 - (floor(multiplyAddValue5 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(productValue13, productValue14, productValue15));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue113 = ((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue13)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue117 = ((multiplyAddValue4 - (dotProductValue * productValue14)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue121 = ((multiplyAddValue5 - (dotProductValue * productValue15)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z;
#endif
    float sumValue3 = 1.0f - abs(scalarValue);
    float scalarValue6 = abs(scalarValue1);
    float sumValue4 = sumValue3 - scalarValue6;
    bool conditionValue = sumValue4 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue6) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue3 * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue4), float3(comparisonValue, comparisonValue1, sumValue4)));
    float productValue17 = comparisonValue * inverseLengthValue5;
    float productValue18 = comparisonValue1 * inverseLengthValue5;
    float productValue19 = inverseLengthValue5 * sumValue4;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue17, productValue18, productValue19), float3(productValue17, productValue18, productValue19)));
    float productValue20 = inverseLengthValue6 * productValue17;
    float productValue21 = productValue18 * inverseLengthValue6;
    float productValue22 = inverseLengthValue6 * productValue19;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue22, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue21, productValue20 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue22, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue21, productValue20 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue22, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue21, productValue20 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue23 = inverseLengthValue7 * multiplyAddValue9;
    float productValue24 = inverseLengthValue7 * multiplyAddValue10;
    float productValue25 = inverseLengthValue7 * multiplyAddValue11;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    uint unusedTextureMipCount371;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount371);
    uint4 loadedBufferValue = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y))), 0u));
    uint scalarValue7 = loadedBufferValue.y;
    uint scalarValue8 = loadedBufferValue.z;
    float bitwiseValue = float(loadedBufferValue.w & 255u);
    float productValue26 = bitwiseValue * 0.0039215688593685626983642578125f;
    float bitwiseValue1 = float((scalarValue7 >> 8u) & 255u);
    float bitwiseValue2 = float(scalarValue7 & 255u);
    float bitwiseValue3 = float((scalarValue8 >> 8u) & 255u);
    float bitwiseValue4 = float(scalarValue8 & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    uint unusedTextureMipCount382;
    uint2 vectorValue3 = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount382);
    uint4 loadedBufferValue2 = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x)), uint(int(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y))), 0u));
    uint scalarValue29 = loadedBufferValue2.y;
    uint scalarValue30 = loadedBufferValue2.z;
    float bitwiseValue8 = float((loadedBufferValue2.x >> 8u) & 255u) * 0.0039215688593685626983642578125f;
    float bitwiseValue9 = float(loadedBufferValue2.w & 255u);
    float productValue122 = bitwiseValue9 * 0.0039215688593685626983642578125f;
    float bitwiseValue10 = float((scalarValue29 >> 8u) & 255u);
    float bitwiseValue11 = float(scalarValue29 & 255u);
    float bitwiseValue12 = float((scalarValue30 >> 8u) & 255u);
    float bitwiseValue13 = float(scalarValue30 & 255u);
#endif
    float sampledTextureValue2;
    if (RD_UNIFORM_SKY_SAMPLES_CONFIG.x > 0.5f)
    {
        sampledTextureValue2 = skyAmbientSamplesTexture.SampleLevel(skyAmbientSamplesSampler, float3(varyingTexCoord0.x, varyingTexCoord0.y, 1.0f), 0.0f).y;
    }
    else
    {
        sampledTextureValue2 = 1.0f;
    }
    float nonlinearValue = sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2));
    float sumValue5 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
    float quotientValue11 = quotientValue / sumValue5;
    float quotientValue12 = quotientValue1 / sumValue5;
    float quotientValue13 = quotientValue2 / sumValue5;
    float sumValue6 = (-0.0f) - quotientValue11;
    float sumValue7 = (-0.0f) - quotientValue12;
    float sumValue8 = (-0.0f) - quotientValue13;
    bool conditionValue1 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(productValue26) < 9.9999997473787516355514526367188e-05f))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(productValue122) < 9.9999997473787516355514526367188e-05f))
#endif
    {
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue44;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue50;
#endif
        if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
        {
            float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
            float dotProductValue2 = max(dot(float3(productValue23, productValue24, productValue25), float3(inverseLengthValue8 * multiplyAddValue12, inverseLengthValue8 * multiplyAddValue13, inverseLengthValue8 * multiplyAddValue14)), 0.0f);
            float clampedValue = clamp(1.0f - dotProductValue2, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float comparisonValue3 = (clampedValue * productValue20) + (conditionValue1 ? (((quotientValue8 + multiplyAddValue3) - (dotProductValue * productValue13)) + RD_UNIFORM_WORLD_ORIGIN.x) : (multiplyAddValue + RD_UNIFORM_INV_VIEW_ROW_3.x));
            float comparisonValue4 = (clampedValue * productValue21) + (conditionValue1 ? (((multiplyAddValue4 - (dotProductValue * productValue14)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y) : (multiplyAddValue1 + RD_UNIFORM_INV_VIEW_ROW_3.y));
            float comparisonValue6 = (clampedValue * productValue22) + (conditionValue1 ? (((multiplyAddValue5 - (dotProductValue * productValue15)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z) : (multiplyAddValue2 + RD_UNIFORM_INV_VIEW_ROW_3.z));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float comparisonValue30 = (clampedValue * productValue20) + (conditionValue1 ? productValue113 : sumValue39);
            float comparisonValue31 = (clampedValue * productValue21) + (conditionValue1 ? productValue117 : sumValue40);
            float comparisonValue32 = (clampedValue * productValue22) + (conditionValue1 ? productValue121 : sumValue41);
#endif
            uint clampedValue1 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float intermediateValue17;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float intermediateValue19;
#endif
            if (int(clampedValue1) > int(0u))
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float intermediateValue18;
                uint intermediateValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float intermediateValue20;
                uint intermediateValue29;
#endif
                float scalarValue9 = 1.0f;
                uint scalarValue10 = 0u;
                uint scalarValue11 = 0u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                uint quotientValue15;
                bool intermediateValue23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                uint quotientValue17;
                bool intermediateValue31;
#endif
                for (;;)
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    uint sumValue9 = scalarValue11 + 144u;
                    quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue9 / 4u][sumValue9 % 4u])) + scalarValue10), int(8u)));
                    intermediateValue23 = int(scalarValue10) < int(quotientValue15);
                    uint branchMergedValue;
                    float branchMergedValue5;
                    if (intermediateValue23)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    uint sumValue42 = scalarValue11 + 156u;
                    quotientValue17 = uint(min(int(uint(int(fragmentConstants[sumValue42 / 4u][sumValue42 % 4u])) + scalarValue10), int(8u)));
                    intermediateValue31 = int(scalarValue10) < int(quotientValue17);
                    float branchMergedValue;
                    uint branchMergedValue6;
                    if (intermediateValue31)
#endif
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float intermediateValue30;
                        uint intermediateValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float intermediateValue40;
                        uint intermediateValue41;
#endif
                        float scalarValue12 = scalarValue9;
                        uint scalarValue13 = scalarValue10;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float multiplyAddValue25;
#endif
                        float multiplyAddValue26;
                        float multiplyAddValue27;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float multiplyAddValue28;
                        bool comparisonValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        bool comparisonValue12;
#endif
                        for (;;)
                        {
                            uint bitwiseValue5 = scalarValue13 << 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint sumValue10 = bitwiseValue5 + 37u;
                            uint sumValue11 = bitwiseValue5 + 38u;
                            uint sumValue12 = bitwiseValue5 + 39u;
#endif
                            uint sumValue13 = bitwiseValue5 + 40u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            multiplyAddValue26 = mad(fragmentConstants[sumValue12].x, comparisonValue6, mad(fragmentConstants[sumValue11].x, comparisonValue4, fragmentConstants[sumValue10].x * comparisonValue3)) + fragmentConstants[sumValue13].x;
                            multiplyAddValue27 = mad(fragmentConstants[sumValue12].y, comparisonValue6, mad(fragmentConstants[sumValue11].y, comparisonValue4, fragmentConstants[sumValue10].y * comparisonValue3)) + fragmentConstants[sumValue13].y;
                            multiplyAddValue28 = mad(fragmentConstants[sumValue12].z, comparisonValue6, mad(fragmentConstants[sumValue11].z, comparisonValue4, fragmentConstants[sumValue10].z * comparisonValue3)) + fragmentConstants[sumValue13].z;
                            comparisonValue9 = ((abs(multiplyAddValue26) <= 1.0f) && (abs(multiplyAddValue27) <= 1.0f)) && (abs(multiplyAddValue28) <= 1.0f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint sumValue43 = bitwiseValue5 + 41u;
                            uint sumValue44 = bitwiseValue5 + 42u;
                            uint sumValue45 = bitwiseValue5 + 43u;
                            multiplyAddValue25 = mad(fragmentConstants[sumValue44].x, comparisonValue32, mad(fragmentConstants[sumValue43].x, comparisonValue31, fragmentConstants[sumValue13].x * comparisonValue30)) + fragmentConstants[sumValue45].x;
                            multiplyAddValue26 = mad(fragmentConstants[sumValue44].y, comparisonValue32, mad(fragmentConstants[sumValue43].y, comparisonValue31, fragmentConstants[sumValue13].y * comparisonValue30)) + fragmentConstants[sumValue45].y;
                            multiplyAddValue27 = mad(fragmentConstants[sumValue44].z, comparisonValue32, mad(fragmentConstants[sumValue43].z, comparisonValue31, fragmentConstants[sumValue13].z * comparisonValue30)) + fragmentConstants[sumValue45].z;
                            comparisonValue12 = ((abs(multiplyAddValue25) <= 1.0f) && (abs(multiplyAddValue26) <= 1.0f)) && (abs(multiplyAddValue27) <= 1.0f);
#endif
                            uint branchMergedValue1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float branchMergedValue6;
                            if (comparisonValue9)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float branchMergedValue7;
                            if (comparisonValue12)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint sumValue14 = scalarValue13 + 96u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint sumValue47 = scalarValue13 + 104u;
#endif
                                uint sumValue15 = scalarValue13 + 12u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float quotientValue14 = min(max(dotProductValue2, fragmentConstants[sumValue14 / 4u][sumValue14 % 4u]), 1.0f);
                                float nonlinearValue2 = (sqrt(1.0f - (quotientValue14 * quotientValue14)) / quotientValue14) * fragmentConstants[sumValue15].z;
                                float productValue27 = (multiplyAddValue26 * 0.5f) + 0.5f;
                                float productValue28 = 0.5f - (multiplyAddValue27 * 0.5f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float quotientValue22 = min(max(dotProductValue2, fragmentConstants[sumValue47 / 4u][sumValue47 % 4u]), 1.0f);
                                float nonlinearValue5 = (sqrt(1.0f - (quotientValue22 * quotientValue22)) / quotientValue22) * fragmentConstants[sumValue15].z;
                                float productValue123 = (multiplyAddValue25 * 0.5f) + 0.5f;
                                float productValue124 = 0.5f - (multiplyAddValue26 * 0.5f);
#endif
                                uint comparisonValue7 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue15].w + 0.5f))), int(1u)))), int(9u)));
                                uint quotientValue16 = uint(int(comparisonValue7) / int(2u));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float intermediateValue50;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float intermediateValue72;
#endif
                                if (int(comparisonValue7) > int(0u))
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    float sumValue31;
                                    float intermediateValue59;
                                    uint intermediateValue60;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    float sumValue46;
                                    float intermediateValue87;
                                    uint intermediateValue88;
#endif
                                    float scalarValue14 = 0.0f;
                                    uint scalarValue15 = 0u;
                                    for (;;)
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue59 = scalarValue14;
                                        intermediateValue60 = 0u;
                                        float intermediateValue65;
                                        float productValue98;
                                        float4 intermediateValue61;
                                        float intermediateValue62;
                                        float intermediateValue63;
                                        float productValue99;
                                        bool comparisonValue20;
                                        float sumValue35;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue87 = scalarValue14;
                                        intermediateValue88 = 0u;
                                        float intermediateValue96;
                                        float productValue125;
                                        float4 intermediateValue89;
                                        float intermediateValue90;
                                        float intermediateValue91;
                                        float productValue126;
                                        bool comparisonValue23;
                                        float sumValue50;
#endif
                                        for (;;)
                                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                            float productValue29 = (productValue27 + ((float(int(intermediateValue60 - quotientValue16)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue15].x;
                                            productValue98 = (productValue28 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue15 - quotientValue16)) + 0.5f))) * fragmentConstants[sumValue15].x;
                                            intermediateValue61 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue29, productValue98, float(int(scalarValue13))));
                                            intermediateValue62 = intermediateValue61.w;
                                            intermediateValue63 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                            productValue99 = frac((productValue29 * intermediateValue63) + 0.5f);
                                            comparisonValue20 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                            sumValue35 = (multiplyAddValue28 - fragmentConstants[sumValue15].y) - nonlinearValue2;
                                            float branchMergedValue4;
                                            if (comparisonValue20)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                            float productValue127 = (productValue123 + ((float(int(intermediateValue88 - quotientValue16)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue15].x;
                                            productValue125 = (productValue124 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue15 - quotientValue16)) + 0.5f))) * fragmentConstants[sumValue15].x;
                                            intermediateValue89 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue127, productValue125, float(int(scalarValue13))));
                                            intermediateValue90 = intermediateValue89.w;
                                            intermediateValue91 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                            productValue126 = frac((productValue127 * intermediateValue91) + 0.5f);
                                            comparisonValue23 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                            sumValue50 = (multiplyAddValue27 - fragmentConstants[sumValue15].y) - nonlinearValue5;
                                            float branchMergedValue5;
                                            if (comparisonValue23)
#endif
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                branchMergedValue4 = float(intermediateValue62 >= sumValue35);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                branchMergedValue5 = float(intermediateValue90 >= sumValue50);
#endif
                                            }
                                            else
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                float comparisonValue8 = (intermediateValue61.x < sumValue35) ? 0.0f : 1.0f;
                                                float comparisonValue10 = (intermediateValue62 < sumValue35) ? 0.0f : 1.0f;
                                                float comparisonValue13 = ((((intermediateValue61.z < sumValue35) ? 0.0f : 1.0f) - comparisonValue10) * productValue99) + comparisonValue10;
                                                branchMergedValue4 = (frac((productValue98 * intermediateValue63) + 0.5f) * ((((((intermediateValue61.y < sumValue35) ? 0.0f : 1.0f) - comparisonValue8) * productValue99) + comparisonValue8) - comparisonValue13)) + comparisonValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                float comparisonValue33 = (intermediateValue89.x < sumValue50) ? 0.0f : 1.0f;
                                                float comparisonValue34 = (intermediateValue90 < sumValue50) ? 0.0f : 1.0f;
                                                float comparisonValue35 = ((((intermediateValue89.z < sumValue50) ? 0.0f : 1.0f) - comparisonValue34) * productValue126) + comparisonValue34;
                                                branchMergedValue5 = (frac((productValue125 * intermediateValue91) + 0.5f) * ((((((intermediateValue89.y < sumValue50) ? 0.0f : 1.0f) - comparisonValue33) * productValue126) + comparisonValue33) - comparisonValue35)) + comparisonValue35;
#endif
                                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                            intermediateValue65 = branchMergedValue4;
                                            sumValue31 = intermediateValue65 + intermediateValue59;
                                            uint sumValue16 = intermediateValue60 + 1u;
                                            if (sumValue16 == comparisonValue7)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                            intermediateValue96 = branchMergedValue5;
                                            sumValue46 = intermediateValue96 + intermediateValue87;
                                            uint sumValue48 = intermediateValue88 + 1u;
                                            if (sumValue48 == comparisonValue7)
#endif
                                            {
                                                break;
                                            }
                                            else
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                intermediateValue59 = sumValue31;
                                                intermediateValue60 = sumValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                intermediateValue87 = sumValue46;
                                                intermediateValue88 = sumValue48;
#endif
                                                continue;
                                            }
                                        }
                                        uint sumValue17 = scalarValue15 + 1u;
                                        if (sumValue17 == comparisonValue7)
                                        {
                                            break;
                                        }
                                        else
                                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                            scalarValue14 = sumValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                            scalarValue14 = sumValue46;
#endif
                                            scalarValue15 = sumValue17;
                                            continue;
                                        }
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue50 = sumValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue72 = sumValue46;
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue50 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue72 = 0.0f;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue1 = quotientValue15;
                                branchMergedValue6 = min(scalarValue12, intermediateValue50 / float(int(comparisonValue7 * comparisonValue7)));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue1 = quotientValue17;
                                branchMergedValue7 = min(scalarValue12, intermediateValue72 / float(int(comparisonValue7 * comparisonValue7)));
#endif
                            }
                            else
                            {
                                branchMergedValue1 = scalarValue13 + 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue6 = scalarValue12;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue7 = scalarValue12;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue31 = branchMergedValue1;
                            intermediateValue30 = branchMergedValue6;
                            if (int(intermediateValue31) < int(quotientValue15))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue41 = branchMergedValue1;
                            intermediateValue40 = branchMergedValue7;
                            if (int(intermediateValue41) < int(quotientValue17))
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue12 = intermediateValue30;
                                scalarValue13 = intermediateValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue12 = intermediateValue40;
                                scalarValue13 = intermediateValue41;
#endif
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue = intermediateValue31;
                        branchMergedValue5 = intermediateValue30;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue = intermediateValue40;
                        branchMergedValue6 = intermediateValue41;
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue = scalarValue10;
                        branchMergedValue5 = scalarValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue = scalarValue9;
                        branchMergedValue6 = scalarValue10;
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue21 = branchMergedValue;
                    intermediateValue18 = branchMergedValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue20 = branchMergedValue;
                    intermediateValue29 = branchMergedValue6;
#endif
                    uint sumValue18 = scalarValue11 + 1u;
                    if (sumValue18 == clampedValue1)
                    {
                        break;
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        scalarValue9 = intermediateValue18;
                        scalarValue10 = intermediateValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        scalarValue9 = intermediateValue20;
                        scalarValue10 = intermediateValue29;
#endif
                        scalarValue11 = sumValue18;
                        continue;
                    }
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue17 = intermediateValue18;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue19 = intermediateValue20;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue17 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue19 = 1.0f;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float intermediateValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float intermediateValue33;
#endif
            if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
            {
                float scalarValue16 = min(max(dotProductValue2, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float multiplyAddValue15 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue6, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue4, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue3))) - ((sqrt(1.0f - (scalarValue16 * scalarValue16)) / scalarValue16) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                float multiplyAddValue16 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue6, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue4, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue3)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                float multiplyAddValue17 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue6, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue4, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue3)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float multiplyAddValue30 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue32, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue31, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue30))) - ((sqrt(1.0f - (scalarValue16 * scalarValue16)) / scalarValue16) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                float multiplyAddValue31 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue32, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue31, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue30)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                float multiplyAddValue32 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue32, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue31, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue30)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
#endif
                uint comparisonValue15 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                uint bitwiseValue6 = comparisonValue15 >> 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue7;
                if ((multiplyAddValue17 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue16 >= 0.0f) && (multiplyAddValue16 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue17 >= 0.0f)))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue12;
                if ((multiplyAddValue32 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue31 >= 0.0f) && (multiplyAddValue31 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue32 >= 0.0f)))
#endif
                {
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float sumValue23;
                    float intermediateValue46;
                    uint intermediateValue47;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float sumValue27;
                    float intermediateValue68;
                    uint intermediateValue69;
#endif
                    float scalarValue17 = 0.0f;
                    uint scalarValue18 = 0u;
                    for (;;)
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        intermediateValue46 = scalarValue17;
                        intermediateValue47 = 0u;
                        float intermediateValue57;
                        float productValue91;
                        float productValue92;
                        bool comparisonValue11;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue68 = scalarValue17;
                        intermediateValue69 = 0u;
                        float intermediateValue80;
                        float productValue103;
                        float productValue104;
                        bool comparisonValue14;
#endif
                        for (;;)
                        {
                            float productValue30 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            productValue91 = (productValue30 * (float(int(intermediateValue47 - bitwiseValue6)) + 0.5f)) + multiplyAddValue16;
                            productValue92 = (productValue30 * (float(int(scalarValue18 - bitwiseValue6)) + 0.5f)) + multiplyAddValue17;
                            comparisonValue11 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            productValue103 = (productValue30 * (float(int(intermediateValue69 - bitwiseValue6)) + 0.5f)) + multiplyAddValue31;
                            productValue104 = (productValue30 * (float(int(scalarValue18 - bitwiseValue6)) + 0.5f)) + multiplyAddValue32;
                            comparisonValue14 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#endif
                            float branchMergedValue2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            if (comparisonValue11)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            if (comparisonValue14)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue91, productValue92, dotProductValue3), 0.0f).x >= multiplyAddValue15);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue103, productValue104, dotProductValue3), 0.0f).x >= multiplyAddValue30);
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue91, productValue92, dotProductValue3));
                                float productValue31 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue91) + 0.5f);
                                float comparisonValue17 = (vectorValue1.x < multiplyAddValue15) ? 0.0f : 1.0f;
                                float comparisonValue19 = (vectorValue1.w < multiplyAddValue15) ? 0.0f : 1.0f;
                                float comparisonValue21 = ((((vectorValue1.z < multiplyAddValue15) ? 0.0f : 1.0f) - comparisonValue19) * productValue31) + comparisonValue19;
                                branchMergedValue2 = (((((((vectorValue1.y < multiplyAddValue15) ? 0.0f : 1.0f) - comparisonValue17) * productValue31) + comparisonValue17) - comparisonValue21) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue92) + 0.5f)) + comparisonValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float4 vectorValue4 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue103, productValue104, dotProductValue3));
                                float productValue128 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue103) + 0.5f);
                                float comparisonValue36 = (vectorValue4.x < multiplyAddValue30) ? 0.0f : 1.0f;
                                float comparisonValue37 = (vectorValue4.w < multiplyAddValue30) ? 0.0f : 1.0f;
                                float comparisonValue38 = ((((vectorValue4.z < multiplyAddValue30) ? 0.0f : 1.0f) - comparisonValue37) * productValue128) + comparisonValue37;
                                branchMergedValue2 = (((((((vectorValue4.y < multiplyAddValue30) ? 0.0f : 1.0f) - comparisonValue36) * productValue128) + comparisonValue36) - comparisonValue38) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue104) + 0.5f)) + comparisonValue38;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue57 = branchMergedValue2;
                            sumValue23 = intermediateValue57 + intermediateValue46;
                            uint sumValue19 = intermediateValue47 + 1u;
                            if (int(sumValue19) < int(comparisonValue15))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue80 = branchMergedValue2;
                            sumValue27 = intermediateValue80 + intermediateValue68;
                            uint sumValue49 = intermediateValue69 + 1u;
                            if (int(sumValue49) < int(comparisonValue15))
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue46 = sumValue23;
                                intermediateValue47 = sumValue19;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue68 = sumValue27;
                                intermediateValue69 = sumValue49;
#endif
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        uint sumValue20 = scalarValue18 + 1u;
                        if (int(sumValue20) < int(comparisonValue15))
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            scalarValue17 = sumValue23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            scalarValue17 = sumValue27;
#endif
                            scalarValue18 = sumValue20;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue7 = sumValue23 / float(int(comparisonValue15 * comparisonValue15));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue12 = sumValue27 / float(int(comparisonValue15 * comparisonValue15));
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue7 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue12 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue25 = branchMergedValue7;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue33 = branchMergedValue12;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue25 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue33 = 1.0f;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float intermediateValue33;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float intermediateValue43;
#endif
            if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float multiplyAddValue18 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue6, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue4, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue3)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float multiplyAddValue33 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue32, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue31, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue30)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
#endif
                float scalarValue19 = min(max(dotProductValue2, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float multiplyAddValue19 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue6, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue4, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue3)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue18) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue19 * scalarValue19)) / scalarValue19) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                float multiplyAddValue20 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue6, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue4, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue3)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue18) * 0.5f) + 0.5f;
                float multiplyAddValue21 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue6, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue4, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue3)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue18) * 0.5f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float multiplyAddValue34 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue32, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue31, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue30)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue33) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue19 * scalarValue19)) / scalarValue19) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                float multiplyAddValue35 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue32, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue31, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue30)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue33) * 0.5f) + 0.5f;
                float multiplyAddValue36 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue32, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue31, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue30)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue33) * 0.5f);
#endif
                uint comparisonValue22 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                uint quotientValue18 = uint(int(comparisonValue22) / int(2u));
                float dotProductValue4 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float intermediateValue45;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float intermediateValue57;
#endif
                if (int(comparisonValue22) > int(0u))
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float sumValue25;
                    float intermediateValue52;
                    uint intermediateValue53;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float sumValue29;
                    float intermediateValue74;
                    uint intermediateValue75;
#endif
                    float scalarValue20 = 0.0f;
                    uint scalarValue21 = 0u;
                    for (;;)
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        intermediateValue52 = scalarValue20;
                        intermediateValue53 = 0u;
                        float intermediateValue64;
                        float4 intermediateValue54;
                        float productValue94;
                        float productValue95;
                        bool comparisonValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue74 = scalarValue20;
                        intermediateValue75 = 0u;
                        float intermediateValue92;
                        float4 intermediateValue76;
                        float productValue118;
                        float productValue119;
                        bool comparisonValue18;
#endif
                        for (;;)
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue54 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                            productValue94 = (multiplyAddValue20 + ((float(int(intermediateValue53 - quotientValue18)) + 0.5f) * intermediateValue54.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            productValue95 = (multiplyAddValue21 + (intermediateValue54.x * (float(int(scalarValue21 - quotientValue18)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            comparisonValue16 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                            float branchMergedValue3;
                            if (comparisonValue16)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue76 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                            productValue118 = (multiplyAddValue35 + ((float(int(intermediateValue75 - quotientValue18)) + 0.5f) * intermediateValue76.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            productValue119 = (multiplyAddValue36 + (intermediateValue76.x * (float(int(scalarValue21 - quotientValue18)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            comparisonValue18 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                            float branchMergedValue4;
                            if (comparisonValue18)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue94, productValue95, dotProductValue4), 0.0f).x >= multiplyAddValue19);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue118, productValue119, dotProductValue4), 0.0f).x >= multiplyAddValue34);
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue94, productValue95, dotProductValue4));
                                float productValue51 = frac((productValue94 * intermediateValue54.z) + 0.5f);
                                float comparisonValue24 = (vectorValue2.x < multiplyAddValue19) ? 0.0f : 1.0f;
                                float comparisonValue25 = (vectorValue2.w < multiplyAddValue19) ? 0.0f : 1.0f;
                                float comparisonValue26 = ((((vectorValue2.z < multiplyAddValue19) ? 0.0f : 1.0f) - comparisonValue25) * productValue51) + comparisonValue25;
                                branchMergedValue3 = (((((((vectorValue2.y < multiplyAddValue19) ? 0.0f : 1.0f) - comparisonValue24) * productValue51) + comparisonValue24) - comparisonValue26) * frac((productValue95 * intermediateValue54.z) + 0.5f)) + comparisonValue26;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue118, productValue119, dotProductValue4));
                                float productValue129 = frac((productValue118 * intermediateValue76.z) + 0.5f);
                                float comparisonValue39 = (vectorValue5.x < multiplyAddValue34) ? 0.0f : 1.0f;
                                float comparisonValue40 = (vectorValue5.w < multiplyAddValue34) ? 0.0f : 1.0f;
                                float comparisonValue41 = ((((vectorValue5.z < multiplyAddValue34) ? 0.0f : 1.0f) - comparisonValue40) * productValue129) + comparisonValue40;
                                branchMergedValue4 = (((((((vectorValue5.y < multiplyAddValue34) ? 0.0f : 1.0f) - comparisonValue39) * productValue129) + comparisonValue39) - comparisonValue41) * frac((productValue119 * intermediateValue76.z) + 0.5f)) + comparisonValue41;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue64 = branchMergedValue3;
                            sumValue25 = intermediateValue64 + intermediateValue52;
                            uint sumValue21 = intermediateValue53 + 1u;
                            if (sumValue21 == comparisonValue22)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue92 = branchMergedValue4;
                            sumValue29 = intermediateValue92 + intermediateValue74;
                            uint sumValue51 = intermediateValue75 + 1u;
                            if (sumValue51 == comparisonValue22)
#endif
                            {
                                break;
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue52 = sumValue25;
                                intermediateValue53 = sumValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue74 = sumValue29;
                                intermediateValue75 = sumValue51;
#endif
                                continue;
                            }
                        }
                        uint sumValue22 = scalarValue21 + 1u;
                        if (sumValue22 == comparisonValue22)
                        {
                            break;
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            scalarValue20 = sumValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            scalarValue20 = sumValue29;
#endif
                            scalarValue21 = sumValue22;
                            continue;
                        }
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue45 = sumValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue57 = sumValue29;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue45 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue57 = 0.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float quotientValue19 = intermediateValue45 / float(int(comparisonValue22 * comparisonValue22));
                float branchMergedValue9;
                if (quotientValue19 < 1.0f)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float quotientValue23 = intermediateValue57 / float(int(comparisonValue22 * comparisonValue22));
                float branchMergedValue13;
                if (quotientValue23 < 1.0f)
#endif
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue9 = min(1.0f, max(quotientValue19, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue13 = min(1.0f, max(quotientValue23, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue9 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue13 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue33 = branchMergedValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue43 = branchMergedValue13;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue33 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue43 = 1.0f;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float scalarValue22 = min(intermediateValue17, min(intermediateValue25, intermediateValue33));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float scalarValue31 = min(intermediateValue19, min(intermediateValue33, intermediateValue43));
#endif
            float productValue52 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float clampedValue2 = clamp((((-0.0f) - quotientValue2) - productValue52) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue52), 0.0f, 1.0f);
            productValue44 = (((clampedValue2 * clampedValue2) * (1.0f - scalarValue22)) * (3.0f - (clampedValue2 * 2.0f))) + scalarValue22;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float clampedValue12 = clamp((sumValue38 - productValue52) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue52), 0.0f, 1.0f);
            productValue50 = (((clampedValue12 * clampedValue12) * (1.0f - scalarValue31)) * (3.0f - (clampedValue12 * 2.0f))) + scalarValue31;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            productValue44 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            productValue50 = 1.0f;
#endif
        }
        float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
        float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
        float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
        float inverseLengthValue9 = rsqrt(dot(float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24), float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24)));
        float productValue53 = inverseLengthValue9 * multiplyAddValue22;
        float productValue54 = inverseLengthValue9 * multiplyAddValue23;
        float productValue55 = inverseLengthValue9 * multiplyAddValue24;
        float dotProductValue5 = max(dot(float3(productValue23, productValue24, productValue25), float3(productValue53, productValue54, productValue55)), 0.0f);
        float dotProductValue6 = max(dot(float3(productValue23, productValue24, productValue25), float3(sumValue6, sumValue7, sumValue8)), 0.0f);
        float sumValue24 = productValue53 - quotientValue11;
        float sumValue26 = productValue54 - quotientValue12;
        float sumValue28 = productValue55 - quotientValue13;
        float inverseLengthValue10 = rsqrt(dot(float3(sumValue24, sumValue26, sumValue28), float3(sumValue24, sumValue26, sumValue28)));
        float productValue56 = inverseLengthValue10 * sumValue24;
        float productValue57 = inverseLengthValue10 * sumValue26;
        float productValue58 = inverseLengthValue10 * sumValue28;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float bitwiseValue7 = max(float((loadedBufferValue.x >> 8u) & 255u) * 0.0039215688593685626983642578125f, 0.0500000007450580596923828125f);
        float productValue59 = bitwiseValue7 * bitwiseValue7;
        float productValue63 = productValue59 * productValue59;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float scalarValue32 = max(bitwiseValue8, 0.0500000007450580596923828125f);
        float productValue130 = scalarValue32 * scalarValue32;
        float productValue131 = productValue130 * productValue130;
#endif
        float dotProductValue7 = max(dot(float3(productValue23, productValue24, productValue25), float3(productValue56, productValue57, productValue58)), 0.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue64 = ((dotProductValue7 * dotProductValue7) * (productValue63 + (-1.0f))) + 1.0f;
        float productValue65 = productValue59 * 0.5f;
        float sumValue30 = 1.0f - productValue65;
        float sumValue32 = productValue65 + 9.9999997473787516355514526367188e-05f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue132 = ((dotProductValue7 * dotProductValue7) * (productValue131 + (-1.0f))) + 1.0f;
        float productValue133 = productValue130 * 0.5f;
        float sumValue52 = 1.0f - productValue133;
        float sumValue53 = productValue133 + 9.9999997473787516355514526367188e-05f;
#endif
        float clampedValue3 = clamp(1.0f - max(dot(float3(sumValue6, sumValue7, sumValue8), float3(productValue56, productValue57, productValue58)), 0.0f), 0.0f, 1.0f);
        float productValue66 = clampedValue3 * clampedValue3;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float quotientValue21 = ((((dotProductValue6 / ((sumValue30 * dotProductValue6) + sumValue32)) * (productValue63 / ((productValue64 * productValue64) * 3.1415927410125732421875f))) * (dotProductValue5 / ((sumValue30 * dotProductValue5) + sumValue32))) * (((productValue66 * productValue66) * (clampedValue3 * 0.980000019073486328125f)) + 0.0199999995529651641845703125f)) / (((dotProductValue5 * 4.0f) * dotProductValue6) + 9.9999997473787516355514526367188e-05f);
        float productValue67 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * productValue44);
        intermediateValue12 = (((productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * dotProductValue5) * quotientValue21) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
        intermediateValue13 = (((productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * dotProductValue5) * quotientValue21) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
        intermediateValue14 = (((productValue67 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * dotProductValue5) * quotientValue21) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float quotientValue24 = ((((dotProductValue6 / ((sumValue52 * dotProductValue6) + sumValue53)) * (productValue131 / ((productValue132 * productValue132) * 3.1415927410125732421875f))) * (dotProductValue5 / ((sumValue52 * dotProductValue5) + sumValue53))) * (((productValue66 * productValue66) * (clampedValue3 * 0.980000019073486328125f)) + 0.0199999995529651641845703125f)) / (((dotProductValue5 * 4.0f) * dotProductValue6) + 9.9999997473787516355514526367188e-05f);
        float productValue134 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * productValue50);
        intermediateValue12 = (((productValue134 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x) * dotProductValue5) * quotientValue24) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
        intermediateValue13 = (((productValue134 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y) * dotProductValue5) * quotientValue24) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
        intermediateValue14 = (((productValue134 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z) * dotProductValue5) * quotientValue24) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float intermediateValue16;
    float dotProductValue1;
    float intermediateValue15;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue32;
#endif
    float productValue33;
    float productValue34;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue35;
    float productValue36;
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
    {
        bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
        float comparisonValue42 = conditionValue2 ? productValue113 : sumValue39;
        float comparisonValue43 = conditionValue2 ? productValue117 : sumValue40;
        float comparisonValue44 = conditionValue2 ? productValue121 : sumValue41;
        float productValue135 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue38;
        float productValue136 = productValue135 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
        float intermediateValue18;
        if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue38)
        {
            intermediateValue18 = 0.0f;
        }
        else
        {
            float branchMergedValue11;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue38)
            {
                branchMergedValue11 = 1.0f;
            }
            else
            {
                branchMergedValue11 = min(floor(min(max((log2(sumValue38) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
            }
            intermediateValue18 = branchMergedValue11;
        }
        float quotientValue25 = min(floor(min(max((productValue136 + quotientValue) / (productValue136 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
        float quotientValue26 = min(floor(min(max((productValue135 + quotientValue1) / (productValue135 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
        uint intermediateValue21;
        bool intermediateValue23;
        uint intermediateValue24;
        if ((intermediateValue18 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue26 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue25 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue18 < 0.0f) || ((quotientValue25 < 0.0f) || (quotientValue26 < 0.0f))))))
        {
            intermediateValue21 = intermediateValue22;
            intermediateValue23 = false;
            intermediateValue24 = 0u;
        }
        else
        {
            uint scalarValue33 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
            uint productValue137 = uint(int(((quotientValue26 + (intermediateValue18 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue25)) * scalarValue33;
            intermediateValue21 = productValue137;
            intermediateValue23 = true;
            intermediateValue24 = productValue137 + scalarValue33;
        }
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
        if (intermediateValue23 && (int(intermediateValue21) < int(intermediateValue24)))
        {
            float dotProductValue8;
            float quotientValue20;
            float intermediateValue82;
            float intermediateValue83;
            float intermediateValue84;
            float intermediateValue85;
            float intermediateValue35;
            float intermediateValue37;
            float intermediateValue39;
            uint scalarValue34 = intermediateValue21;
            float scalarValue35 = 0.0f;
            float scalarValue36 = 0.0f;
            float scalarValue37 = 0.0f;
            uint loadedBufferValue1;
            for (;;)
            {
                loadedBufferValue1 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue34).x)));
                if (int(loadedBufferValue1) < int(0u))
                {
                    intermediateValue35 = scalarValue35;
                    intermediateValue37 = scalarValue36;
                    intermediateValue39 = scalarValue37;
                    break;
                }
                else
                {
                    uint productValue138 = loadedBufferValue1 * 32u;
                    float4 loadedBufferValue3 = asfloat(uint4(rdLoad_zLights(productValue138).x, rdLoad_zLights(productValue138 + 1u).x, rdLoad_zLights(productValue138 + 2u).x, rdLoad_zLights(productValue138 + 3u).x));
                    float scalarValue38 = loadedBufferValue3.x;
                    float scalarValue39 = loadedBufferValue3.y;
                    float scalarValue40 = loadedBufferValue3.z;
                    float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue39, scalarValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - quotientValue);
                    float multiplyAddValue38 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue39, scalarValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - quotientValue1);
                    float multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue40, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue39, scalarValue38 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - quotientValue2);
                    float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39), float3(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39)));
                    float productValue139 = inverseLengthValue12 * multiplyAddValue37;
                    float productValue140 = inverseLengthValue12 * multiplyAddValue38;
                    float productValue141 = inverseLengthValue12 * multiplyAddValue39;
                    dotProductValue8 = max(dot(float3(productValue23, productValue24, productValue25), float3(productValue139, productValue140, productValue141)), 0.0f);
                    float dotProductValue11 = max(dot(float3(productValue23, productValue24, productValue25), float3(sumValue6, sumValue7, sumValue8)), 0.0f);
                    float sumValue54 = productValue139 - quotientValue11;
                    float sumValue56 = productValue140 - quotientValue12;
                    float sumValue57 = productValue141 - quotientValue13;
                    float inverseLengthValue13 = rsqrt(dot(float3(sumValue54, sumValue56, sumValue57), float3(sumValue54, sumValue56, sumValue57)));
                    float productValue142 = inverseLengthValue13 * sumValue54;
                    float productValue143 = inverseLengthValue13 * sumValue56;
                    float productValue144 = inverseLengthValue13 * sumValue57;
                    float scalarValue41 = max(bitwiseValue8, 0.0500000007450580596923828125f);
                    float productValue145 = scalarValue41 * scalarValue41;
                    float productValue146 = productValue145 * productValue145;
                    float dotProductValue12 = max(dot(float3(productValue23, productValue24, productValue25), float3(productValue142, productValue143, productValue144)), 0.0f);
                    float productValue147 = ((dotProductValue12 * dotProductValue12) * (productValue146 + (-1.0f))) + 1.0f;
                    float productValue148 = productValue145 * 0.5f;
                    float sumValue58 = 1.0f - productValue148;
                    float sumValue59 = productValue148 + 9.9999997473787516355514526367188e-05f;
                    float clampedValue13 = clamp(1.0f - max(dot(float3(sumValue6, sumValue7, sumValue8), float3(productValue142, productValue143, productValue144)), 0.0f), 0.0f, 1.0f);
                    float productValue149 = clampedValue13 * clampedValue13;
                    quotientValue20 = ((((dotProductValue11 / ((sumValue58 * dotProductValue11) + sumValue59)) * (productValue146 / ((productValue147 * productValue147) * 3.1415927410125732421875f))) * (dotProductValue8 / ((sumValue58 * dotProductValue8) + sumValue59))) * (((productValue149 * productValue149) * (clampedValue13 * 0.980000019073486328125f)) + 0.0199999995529651641845703125f)) / (((dotProductValue8 * 4.0f) * dotProductValue11) + 9.9999997473787516355514526367188e-05f);
                    float sumValue60 = scalarValue38 - sumValue39;
                    float sumValue61 = scalarValue39 - sumValue40;
                    float sumValue62 = scalarValue40 - sumValue41;
                    float productValue120;
                    if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                    {
                        float sumValue63 = (abs(sumValue61) + abs(sumValue60)) + abs(sumValue62);
                        productValue120 = sumValue63 * sumValue63;
                    }
                    else
                    {
                        productValue120 = dot(float3(sumValue60, sumValue61, sumValue62), float3(sumValue60, sumValue61, sumValue62));
                    }
                    float scalarValue42 = loadedBufferValue3.w;
                    float productValue150 = scalarValue42 * scalarValue42;
                    float branchMergedValue3;
                    float branchMergedValue8;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    if (!(productValue120 >= productValue150))
                    {
                        float intermediateValue86;
                        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                        {
                            uint productValue151 = (loadedBufferValue1 * 32u) + 8u;
                            float4 loadedBufferValue4 = asfloat(uint4(rdLoad_zLights(productValue151).x, rdLoad_zLights(productValue151 + 1u).x, rdLoad_zLights(productValue151 + 2u).x, rdLoad_zLights(productValue151 + 3u).x));
                            uint productValue152 = (loadedBufferValue1 * 32u) + 12u;
                            float4 loadedBufferValue5 = asfloat(uint4(rdLoad_zLights(productValue152).x, rdLoad_zLights(productValue152 + 1u).x, rdLoad_zLights(productValue152 + 2u).x, rdLoad_zLights(productValue152 + 3u).x));
                            uint productValue153 = (loadedBufferValue1 * 32u) + 16u;
                            float4 loadedBufferValue6 = asfloat(uint4(rdLoad_zLights(productValue153).x, rdLoad_zLights(productValue153 + 1u).x, rdLoad_zLights(productValue153 + 2u).x, rdLoad_zLights(productValue153 + 3u).x));
                            uint productValue154 = (loadedBufferValue1 * 32u) + 20u;
                            float4 loadedBufferValue7 = asfloat(uint4(rdLoad_zLights(productValue154).x, rdLoad_zLights(productValue154 + 1u).x, rdLoad_zLights(productValue154 + 2u).x, rdLoad_zLights(productValue154 + 3u).x));
                            uint productValue155 = (loadedBufferValue1 * 32u) + 24u;
                            float4 loadedBufferValue8 = asfloat(uint4(rdLoad_zLights(productValue155).x, rdLoad_zLights(productValue155 + 1u).x, rdLoad_zLights(productValue155 + 2u).x, rdLoad_zLights(productValue155 + 3u).x));
                            uint productValue156 = (loadedBufferValue1 * 32u) + 28u;
                            float4 loadedBufferValue9 = asfloat(uint4(rdLoad_zLights(productValue156).x, rdLoad_zLights(productValue156 + 1u).x, rdLoad_zLights(productValue156 + 2u).x, rdLoad_zLights(productValue156 + 3u).x));
                            float sumValue64 = comparisonValue42 - scalarValue38;
                            float sumValue65 = comparisonValue43 - scalarValue39;
                            float sumValue66 = comparisonValue44 - scalarValue40;
                            float scalarValue43 = abs(sumValue64);
                            float scalarValue44 = abs(sumValue65);
                            float scalarValue45 = abs(sumValue66);
                            uint comparisonValue27;
                            if ((scalarValue43 >= scalarValue44) && (scalarValue43 >= scalarValue45))
                            {
                                comparisonValue27 = uint(!(sumValue64 >= 0.0f));
                            }
                            else
                            {
                                uint branchMergedValue16;
                                if (!(scalarValue44 >= scalarValue45))
                                {
                                    branchMergedValue16 = (sumValue66 >= 0.0f) ? 4u : 5u;
                                }
                                else
                                {
                                    branchMergedValue16 = (sumValue65 >= 0.0f) ? 2u : 3u;
                                }
                                comparisonValue27 = branchMergedValue16;
                            }
                            float sumValue67 = (-0.0f) - sumValue64;
                            float intermediateValue97;
                            float intermediateValue98;
                            float intermediateValue99;
                            float intermediateValue100;
                            float sumValue55;
                            float intermediateValue101;
                            float intermediateValue102;
                            if (comparisonValue27 == 1u)
                            {
                                intermediateValue97 = loadedBufferValue5.x;
                                intermediateValue98 = loadedBufferValue5.y;
                                intermediateValue99 = loadedBufferValue5.z;
                                intermediateValue100 = loadedBufferValue5.w;
                                sumValue55 = (-0.0f) - sumValue66;
                                intermediateValue101 = sumValue65;
                                intermediateValue102 = sumValue64;
                            }
                            else
                            {
                                float branchMergedValue17;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                float branchMergedValue23;
                                float branchMergedValue24;
                                float branchMergedValue25;
                                float branchMergedValue26;
                                if (comparisonValue27 == 2u)
                                {
                                    branchMergedValue17 = (-0.0f) - sumValue65;
                                    branchMergedValue21 = (-0.0f) - sumValue66;
                                    branchMergedValue22 = sumValue67;
                                    branchMergedValue23 = loadedBufferValue6.w;
                                    branchMergedValue24 = loadedBufferValue6.z;
                                    branchMergedValue25 = loadedBufferValue6.x;
                                    branchMergedValue26 = loadedBufferValue6.y;
                                }
                                else
                                {
                                    float branchMergedValue28;
                                    float branchMergedValue32;
                                    float branchMergedValue33;
                                    float branchMergedValue34;
                                    float branchMergedValue35;
                                    float branchMergedValue36;
                                    float branchMergedValue37;
                                    if (comparisonValue27 == 3u)
                                    {
                                        branchMergedValue28 = sumValue65;
                                        branchMergedValue32 = sumValue66;
                                        branchMergedValue33 = sumValue67;
                                        branchMergedValue34 = loadedBufferValue7.w;
                                        branchMergedValue35 = loadedBufferValue7.z;
                                        branchMergedValue36 = loadedBufferValue7.x;
                                        branchMergedValue37 = loadedBufferValue7.y;
                                    }
                                    else
                                    {
                                        float branchMergedValue39;
                                        float branchMergedValue43;
                                        float branchMergedValue44;
                                        float branchMergedValue45;
                                        float branchMergedValue46;
                                        float branchMergedValue47;
                                        float branchMergedValue48;
                                        if (comparisonValue27 == 4u)
                                        {
                                            branchMergedValue39 = (-0.0f) - sumValue66;
                                            branchMergedValue43 = sumValue65;
                                            branchMergedValue44 = sumValue67;
                                            branchMergedValue45 = loadedBufferValue8.w;
                                            branchMergedValue46 = loadedBufferValue8.z;
                                            branchMergedValue47 = loadedBufferValue8.x;
                                            branchMergedValue48 = loadedBufferValue8.y;
                                        }
                                        else
                                        {
                                            bool comparisonValue45 = comparisonValue27 == 5u;
                                            branchMergedValue39 = comparisonValue45 ? sumValue66 : sumValue67;
                                            branchMergedValue43 = sumValue65;
                                            branchMergedValue44 = comparisonValue45 ? sumValue64 : sumValue66;
                                            branchMergedValue45 = comparisonValue45 ? loadedBufferValue9.w : loadedBufferValue4.w;
                                            branchMergedValue46 = comparisonValue45 ? loadedBufferValue9.z : loadedBufferValue4.z;
                                            branchMergedValue47 = comparisonValue45 ? loadedBufferValue9.x : loadedBufferValue4.x;
                                            branchMergedValue48 = comparisonValue45 ? loadedBufferValue9.y : loadedBufferValue4.y;
                                        }
                                        branchMergedValue28 = branchMergedValue39;
                                        branchMergedValue32 = branchMergedValue43;
                                        branchMergedValue33 = branchMergedValue44;
                                        branchMergedValue34 = branchMergedValue45;
                                        branchMergedValue35 = branchMergedValue46;
                                        branchMergedValue36 = branchMergedValue47;
                                        branchMergedValue37 = branchMergedValue48;
                                    }
                                    branchMergedValue17 = branchMergedValue28;
                                    branchMergedValue21 = branchMergedValue32;
                                    branchMergedValue22 = branchMergedValue33;
                                    branchMergedValue23 = branchMergedValue34;
                                    branchMergedValue24 = branchMergedValue35;
                                    branchMergedValue25 = branchMergedValue36;
                                    branchMergedValue26 = branchMergedValue37;
                                }
                                intermediateValue97 = branchMergedValue25;
                                intermediateValue98 = branchMergedValue26;
                                intermediateValue99 = branchMergedValue24;
                                intermediateValue100 = branchMergedValue23;
                                sumValue55 = branchMergedValue22;
                                intermediateValue101 = branchMergedValue21;
                                intermediateValue102 = branchMergedValue17;
                            }
                            float branchMergedValue15;
                            if ((intermediateValue99 == 0.0f) && (intermediateValue100 == 0.0f))
                            {
                                branchMergedValue15 = 0.0f;
                            }
                            else
                            {
                                float multiplyAddValue40 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue102, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue101, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue55)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                float inverseLengthValue14 = rsqrt(dot(float3(productValue20, productValue21, productValue22), float3(productValue20, productValue21, productValue22)));
                                float sumValue68 = (-0.0f) - sumValue65;
                                float sumValue69 = (-0.0f) - sumValue66;
                                float inverseLengthValue15 = rsqrt(dot(float3(sumValue67, sumValue68, sumValue69), float3(sumValue67, sumValue68, sumValue69)));
                                float dotProductValue13 = min(max(dot(float3(inverseLengthValue15 * sumValue67, inverseLengthValue15 * sumValue68, inverseLengthValue15 * sumValue69), float3(inverseLengthValue14 * productValue20, inverseLengthValue14 * productValue21, inverseLengthValue14 * productValue22)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                float sumValue70 = intermediateValue99 - intermediateValue97;
                                float productValue157 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue70;
                                float quotientValue27 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                float quotientValue28 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                float sumValue71 = intermediateValue100 - intermediateValue98;
                                float productValue158 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue71;
                                float sampledTextureValue6 = float(pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue102, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue101, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue55)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue40) * 0.5f) + 0.5f) * productValue157) + 0.5f) / productValue157) * sumValue70) + intermediateValue97, quotientValue27 + intermediateValue97), intermediateValue99 - quotientValue27), min(max((((floor((0.5f - (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue102, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue101, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue55)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue40) * 0.5f)) * productValue158) + 0.5f) / productValue158) * sumValue71) + intermediateValue98, quotientValue28 + intermediateValue98), intermediateValue100 - quotientValue28)), 0.0f).x >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue102, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue101, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue55)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue157, 1.0f)) * (((sqrt(1.0f - (dotProductValue13 * dotProductValue13)) / dotProductValue13) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue40));
                                branchMergedValue15 = sampledTextureValue6;
                            }
                            intermediateValue86 = branchMergedValue15;
                        }
                        else
                        {
                            intermediateValue86 = 1.0f;
                        }
                        uint productValue159 = (loadedBufferValue1 * 32u) + 4u;
                        float4 loadedBufferValue10 = asfloat(uint4(rdLoad_zLights(productValue159).x, rdLoad_zLights(productValue159 + 1u).x, rdLoad_zLights(productValue159 + 2u).x, rdLoad_zLights(productValue159 + 3u).x));
                        float quotientValue29 = productValue120 / (productValue150 + 9.9999997473787516355514526367188e-05f);
                        float clampedValue14 = clamp(1.0f - (quotientValue29 * quotientValue29), 0.0f, 1.0f);
                        float quotientValue30 = (clampedValue14 * clampedValue14) * (1.0f / max(productValue120, 0.100000001490116119384765625f));
                        float clampedValue15;
                        if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                        {
                            float clampedValue16 = clamp(((1.0f - quotientValue30) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                            clampedValue15 = clamp((((clampedValue16 * clampedValue16) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue16 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue30;
                        }
                        else
                        {
                            clampedValue15 = quotientValue30;
                        }
                        float productValue160 = clampedValue15 * loadedBufferValue10.w;
                        branchMergedValue3 = intermediateValue86;
                        branchMergedValue8 = productValue160 * loadedBufferValue10.z;
                        branchMergedValue9 = productValue160 * loadedBufferValue10.y;
                        branchMergedValue10 = productValue160 * loadedBufferValue10.x;
                    }
                    else
                    {
                        branchMergedValue3 = 1.0f;
                        branchMergedValue8 = 0.0f;
                        branchMergedValue9 = 0.0f;
                        branchMergedValue10 = 0.0f;
                    }
                    intermediateValue85 = branchMergedValue3;
                    intermediateValue84 = branchMergedValue8;
                    intermediateValue83 = branchMergedValue9;
                    intermediateValue82 = branchMergedValue10;
                    float productValue161 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * ((quotientValue20 * dotProductValue8) * intermediateValue85);
                    float productValue162 = (productValue161 * intermediateValue82) + scalarValue35;
                    float productValue163 = (productValue161 * intermediateValue83) + scalarValue36;
                    float productValue164 = (productValue161 * intermediateValue84) + scalarValue37;
                    uint sumValue72 = scalarValue34 + 1u;
                    if (int(sumValue72) < int(intermediateValue24))
                    {
                        scalarValue34 = sumValue72;
                        scalarValue35 = productValue162;
                        scalarValue36 = productValue163;
                        scalarValue37 = productValue164;
                        continue;
                    }
                    else
                    {
                        intermediateValue35 = productValue162;
                        intermediateValue37 = productValue163;
                        intermediateValue39 = productValue164;
                        break;
                    }
                }
            }
            intermediateValue34 = intermediateValue35;
            intermediateValue36 = intermediateValue37;
            intermediateValue38 = intermediateValue39;
        }
        else
        {
            intermediateValue34 = 0.0f;
            intermediateValue36 = 0.0f;
            intermediateValue38 = 0.0f;
        }
        float sumValue73 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
        productValue32 = (sumValue73 * intermediateValue34) + intermediateValue12;
        productValue33 = (sumValue73 * intermediateValue36) + intermediateValue13;
        productValue34 = (sumValue73 * intermediateValue38) + intermediateValue14;
    }
    else
    {
        productValue32 = intermediateValue12;
        productValue33 = intermediateValue13;
        productValue34 = intermediateValue14;
    }
    float intermediateValue26;
    float dotProductValue1;
    float intermediateValue16;
#endif
    float productValue41;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    bool comparisonValue2;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue42;
    float productValue43;
    float productValue44;
    float productValue45;
    float productValue46;
    float productValue47;
    float productValue48;
    float productValue49;
    bool comparisonValue5;
#endif
    for (;;)
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float clampedValue4 = clamp(((bitwiseValue * 0.062745101749897003173828125f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float clampedValue17 = clamp(((bitwiseValue9 * 0.062745101749897003173828125f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
#endif
        dotProductValue1 = dot(float3(sumValue6, sumValue7, sumValue8), float3(productValue23, productValue24, productValue25));
        float clampedValue5 = clamp(1.0f - max(dotProductValue1, 0.0f), 0.0f, 1.0f);
        float productValue68 = clampedValue5 * clampedValue5;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue73 = (((productValue68 * productValue68) * (clampedValue5 * 0.980000019073486328125f)) + 0.0199999995529651641845703125f) * (1.0f - (((clampedValue4 * clampedValue4) * clampedValue4) * RD_UNIFORM_IBL_PARAMETERS.x));
        intermediateValue15 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w;
        float productValue74 = (bitwiseValue4 * 9.2272217443678528070449829101562e-05f) * intermediateValue15;
        float productValue75 = productValue26 * productValue26;
        float productValue76 = productValue75 * productValue75;
        float productValue77 = ((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue75 - productValue76)) + productValue76) * productValue26;
        productValue33 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x;
        productValue34 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y;
        productValue35 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z;
        productValue36 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue37 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue38 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue39 = (productValue73 * max((productValue74 * bitwiseValue1) + (productValue77 * productValue33), productValue36)) + intermediateValue12;
        productValue40 = (productValue73 * max((productValue74 * bitwiseValue2) + (productValue77 * productValue34), productValue37)) + intermediateValue13;
        productValue41 = (max((productValue74 * bitwiseValue3) + (productValue77 * productValue35), productValue38) * productValue73) + intermediateValue14;
        comparisonValue2 = RD_UNIFORM_CAMERA_IS_UNDERWATER.x != 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue165 = (((productValue68 * productValue68) * (clampedValue5 * 0.980000019073486328125f)) + 0.0199999995529651641845703125f) * (1.0f - (((clampedValue17 * clampedValue17) * clampedValue17) * RD_UNIFORM_IBL_PARAMETERS.x));
        intermediateValue16 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w;
        float productValue166 = (bitwiseValue13 * 9.2272217443678528070449829101562e-05f) * intermediateValue16;
        float productValue167 = productValue122 * productValue122;
        float productValue168 = productValue167 * productValue167;
        float productValue169 = ((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue167 - productValue168)) + productValue168) * productValue122;
        productValue41 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x;
        productValue42 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y;
        productValue43 = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z;
        productValue44 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue45 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue46 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
        productValue47 = (productValue165 * max((productValue166 * bitwiseValue10) + (productValue169 * productValue41), productValue44)) + productValue32;
        productValue48 = (productValue165 * max((productValue166 * bitwiseValue11) + (productValue169 * productValue42), productValue45)) + productValue33;
        productValue49 = (max((productValue166 * bitwiseValue12) + (productValue169 * productValue43), productValue46) * productValue165) + productValue34;
        comparisonValue5 = RD_UNIFORM_CAMERA_IS_UNDERWATER.x != 0.0f;
#endif
        float nonlinearValue1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        if (comparisonValue2)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        if (comparisonValue5)
#endif
        {
            float productValue78 = (1.0f - (dotProductValue1 * dotProductValue1)) * 1.7689001560211181640625f;
            if (productValue78 > 1.0f)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue16 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue26 = 0.0f;
#endif
                break;
            }
            nonlinearValue1 = sqrt(1.0f - productValue78);
        }
        else
        {
            nonlinearValue1 = dotProductValue1;
        }
        float clampedValue6 = clamp(1.0f - nonlinearValue1, 0.0f, 1.0f);
        float productValue79 = clampedValue6 * clampedValue6;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue16 = 0.980000019073486328125f - ((productValue79 * productValue79) * (clampedValue6 * 0.980000019073486328125f));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue26 = 0.980000019073486328125f - ((productValue79 * productValue79) * (clampedValue6 * 0.980000019073486328125f));
#endif
        break;
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float sumValue33 = 1.0f - intermediateValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue74 = 1.0f - intermediateValue26;
#endif
    float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
    float productValue80 = inverseLengthValue11 * multiplyAddValue;
    float productValue81 = inverseLengthValue11 * multiplyAddValue1;
    float productValue82 = inverseLengthValue11 * multiplyAddValue2;
    bool comparisonValue28 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue60;
    float productValue61;
    float productValue62;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue69;
    float productValue70;
    float productValue71;
#endif
    if ((comparisonValue28 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f))
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue60 = max(intermediateValue15 + productValue33, productValue36) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue61 = max(intermediateValue15 + productValue34, productValue37) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue62 = max(intermediateValue15 + productValue35, productValue38) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue69 = max(intermediateValue16 + productValue41, productValue44) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue70 = max(intermediateValue16 + productValue42, productValue45) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue71 = max(intermediateValue16 + productValue43, productValue46) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue60 = 0.0f;
        productValue61 = 0.0f;
        productValue62 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue69 = 0.0f;
        productValue70 = 0.0f;
        productValue71 = 0.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue49;
    float intermediateValue50;
    float intermediateValue51;
    float intermediateValue52;
#endif
    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f)
    {
        float clampedValue7 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue8;
        float branchMergedValue10;
        float branchMergedValue11;
        float branchMergedValue12;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue14;
        float branchMergedValue18;
        float branchMergedValue19;
        float branchMergedValue20;
#endif
        if (clampedValue7 > 0.0f)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue13;
            float branchMergedValue14;
            float branchMergedValue15;
            float branchMergedValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue27;
            float branchMergedValue29;
            float branchMergedValue30;
            float branchMergedValue31;
#endif
            if (comparisonValue28)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue13 = max(productValue62, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue14 = max(productValue61, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue15 = RD_UNIFORM_FOG_COLOR.x * max(productValue60, 1.0f);
                branchMergedValue16 = clampedValue7;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue27 = max(productValue71, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue29 = max(productValue70, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue30 = RD_UNIFORM_FOG_COLOR.x * max(productValue69, 1.0f);
                branchMergedValue31 = clampedValue7;
#endif
            }
            else
            {
                float clampedValue8 = clamp(((productValue81 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue83 = 1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)));
                float productValue84 = (productValue83 * productValue83) * productValue83;
                float dotProductValue9 = dot(float3(productValue80, productValue81, productValue82), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue10 = dot(float3(productValue80, productValue81, productValue82), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue34 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue9 = clamp((productValue81 - sumValue34) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue34), 0.0f, 1.0f);
                float productValue88 = 1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)));
                float productValue89 = (productValue88 * productValue88) * productValue88;
                float productValue90 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue10 * dotProductValue10) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue9 * dotProductValue9) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue10 = clamp(exp2(log2(max(dotProductValue9, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue11 = clamp(exp2(log2(max(dotProductValue10, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue97 = 1.809999942779541015625f - (clampedValue10 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue97) * productValue97);
                float productValue100 = 1.809999942779541015625f - (clampedValue11 * 1.7999999523162841796875f);
                float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue100) * productValue100);
                float productValue101 = clampedValue10 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue102 = clampedValue11 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue105 = (((productValue84 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue102 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue101 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue89 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue90)) * 0.079577468335628509521484375f;
                float productValue106 = (((productValue84 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue102 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue101 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue89 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue90)) * 0.079577468335628509521484375f;
                float productValue107 = (((productValue84 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue102 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue101 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue89 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue90)) * 0.079577468335628509521484375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue17;
                float branchMergedValue18;
                float branchMergedValue19;
                float branchMergedValue20;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue38;
                float branchMergedValue40;
                float branchMergedValue41;
                float branchMergedValue42;
#endif
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float comparisonValue29 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, (scalarValue2 == 1.0f) ? sampledTextureValue2 : productValue26);
                    branchMergedValue17 = ((productValue107 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * comparisonValue29) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue18 = ((productValue106 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * comparisonValue29) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue19 = ((productValue105 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * comparisonValue29) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue20 = clampedValue7;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float comparisonValue46 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, (scalarValue2 == 1.0f) ? sampledTextureValue2 : productValue122);
                    branchMergedValue38 = ((productValue107 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * comparisonValue46) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue40 = ((productValue106 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * comparisonValue46) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue41 = ((productValue105 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * comparisonValue46) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue42 = clampedValue7;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue17 = productValue107;
                    branchMergedValue18 = productValue106;
                    branchMergedValue19 = productValue105;
                    branchMergedValue20 = clampedValue7;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue38 = productValue107;
                    branchMergedValue40 = productValue106;
                    branchMergedValue41 = productValue105;
                    branchMergedValue42 = clampedValue7;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue13 = branchMergedValue17;
                branchMergedValue14 = branchMergedValue18;
                branchMergedValue15 = branchMergedValue19;
                branchMergedValue16 = branchMergedValue20;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue27 = branchMergedValue38;
                branchMergedValue29 = branchMergedValue40;
                branchMergedValue30 = branchMergedValue41;
                branchMergedValue31 = branchMergedValue42;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue8 = branchMergedValue13;
            branchMergedValue10 = branchMergedValue14;
            branchMergedValue11 = branchMergedValue15;
            branchMergedValue12 = branchMergedValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue14 = branchMergedValue27;
            branchMergedValue18 = branchMergedValue29;
            branchMergedValue19 = branchMergedValue30;
            branchMergedValue20 = branchMergedValue31;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue8 = 0.0f;
            branchMergedValue10 = 0.0f;
            branchMergedValue11 = 0.0f;
            branchMergedValue12 = clampedValue7;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue14 = 0.0f;
            branchMergedValue18 = 0.0f;
            branchMergedValue19 = 0.0f;
            branchMergedValue20 = clampedValue7;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue26 = branchMergedValue12;
        intermediateValue27 = branchMergedValue11;
        intermediateValue28 = branchMergedValue10;
        intermediateValue29 = branchMergedValue8;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue49 = branchMergedValue20;
        intermediateValue50 = branchMergedValue19;
        intermediateValue51 = branchMergedValue18;
        intermediateValue52 = branchMergedValue14;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue26 = 0.0f;
        intermediateValue27 = 0.0f;
        intermediateValue28 = 0.0f;
        intermediateValue29 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue49 = 0.0f;
        intermediateValue50 = 0.0f;
        intermediateValue51 = 0.0f;
        intermediateValue52 = 0.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue69;
    float productValue70;
    float productValue71;
    float productValue72;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue93;
    float productValue94;
    float productValue95;
    float productValue96;
#endif
    if (RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f)
    {
        float productValue108 = (varyingColor1.x + 1.0f) * 0.5f;
        float productValue109 = (varyingColor1.y + 1.0f) * 0.5f;
        uint scalarValue23 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue29 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, scalarValue2, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.z * varyingColor1.x)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, scalarValue2, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, varyingColor1.y, RD_UNIFORM_INV_PROJ_ROW_0.w * varyingColor1.x)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue23))) + (-0.5f);
        uint sumValue36 = uint(min(int(uint(max(int(uint(int(multiplyAddValue29))), int(0u)))), int(scalarValue23 + 4294967294u)));
        float scalarValue24 = float(int(sumValue36));
        float sumValue37 = min(max(multiplyAddValue29 - scalarValue24, 0.0f), 1.0f);
        float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, scalarValue24), 0.0f);
        float scalarValue25 = sampledTextureValue3.x;
        float scalarValue26 = sampledTextureValue3.y;
        float scalarValue27 = sampledTextureValue3.z;
        float scalarValue28 = sampledTextureValue3.w;
        float4 sampledTextureValue4 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue108, productValue109, float(int(sumValue36 + 1u))), 0.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue69 = ((sampledTextureValue4.x - scalarValue25) * sumValue37) + scalarValue25;
        productValue70 = ((sampledTextureValue4.y - scalarValue26) * sumValue37) + scalarValue26;
        productValue71 = ((sampledTextureValue4.z - scalarValue27) * sumValue37) + scalarValue27;
        productValue72 = ((sampledTextureValue4.w - scalarValue28) * sumValue37) + scalarValue28;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue93 = ((sampledTextureValue4.x - scalarValue25) * sumValue37) + scalarValue25;
        productValue94 = ((sampledTextureValue4.y - scalarValue26) * sumValue37) + scalarValue26;
        productValue95 = ((sampledTextureValue4.z - scalarValue27) * sumValue37) + scalarValue27;
        productValue96 = ((sampledTextureValue4.w - scalarValue28) * sumValue37) + scalarValue28;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue69 = 0.0f;
        productValue70 = 0.0f;
        productValue71 = 0.0f;
        productValue72 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue93 = 0.0f;
        productValue94 = 0.0f;
        productValue95 = 0.0f;
        productValue96 = 1.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue110 = (productValue72 * ((((intermediateValue27 * sumValue33) - productValue39) * intermediateValue26) + productValue39)) + (productValue69 * sumValue33);
    float productValue111 = (productValue72 * ((((intermediateValue28 * sumValue33) - productValue40) * intermediateValue26) + productValue40)) + (productValue70 * sumValue33);
    float productValue112 = (productValue72 * ((((intermediateValue29 * sumValue33) - productValue41) * intermediateValue26) + productValue41)) + (productValue71 * sumValue33);
    float productValue85;
    float productValue86;
    float productValue87;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue170 = (productValue96 * ((((intermediateValue50 * sumValue74) - productValue47) * intermediateValue49) + productValue47)) + (productValue93 * sumValue74);
    float productValue171 = (productValue96 * ((((intermediateValue51 * sumValue74) - productValue48) * intermediateValue49) + productValue48)) + (productValue94 * sumValue74);
    float productValue172 = (productValue96 * ((((intermediateValue52 * sumValue74) - productValue49) * intermediateValue49) + productValue49)) + (productValue95 * sumValue74);
    float productValue114;
    float productValue115;
    float productValue116;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue5 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue85 = sampledTextureValue5 * productValue110;
        productValue86 = sampledTextureValue5 * productValue111;
        productValue87 = sampledTextureValue5 * productValue112;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue114 = sampledTextureValue5 * productValue170;
        productValue115 = sampledTextureValue5 * productValue171;
        productValue116 = sampledTextureValue5 * productValue172;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue85 = productValue110;
        productValue86 = productValue111;
        productValue87 = productValue112;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue114 = productValue170;
        productValue115 = productValue171;
        productValue116 = productValue172;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    fragmentColor0.x = productValue85;
    fragmentColor0.y = productValue86;
    fragmentColor0.z = productValue87;
    fragmentColor0.w = sumValue33;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    fragmentColor0.x = productValue114;
    fragmentColor0.y = productValue115;
    fragmentColor0.z = productValue116;
    fragmentColor0.w = sumValue74;
#endif
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
