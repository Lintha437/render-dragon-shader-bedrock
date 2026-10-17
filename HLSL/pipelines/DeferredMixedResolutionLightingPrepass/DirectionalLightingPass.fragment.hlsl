// DeferredMixedResolutionLightingPrepass / DirectionalLightingPass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_10 1
#endif

#include "../../include/materials/DeferredMixedResolutionLightingPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.xy * varyingTexCoord0.xy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = float2(0.5,0.5) + workingVector0.xy;
  workingVector1.xy = RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.zw * workingVector0.xy;
  workingVector0.x = materialTexture6.Sample(textureSampler6, workingVector1.xy).x;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.x != 1.000000);
  if (workingVector0.z != 0) {
    materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
    workingVector0.zw = floatingPointResult.xy;
    workingVector0.zw = workingVector0.zw * workingVector1.xy;
    workingVector2.xy = (int2)workingVector0.zw;
    workingVector2.zw = float2(0,0);
    workingVector0.zw = materialTexture2.Load(workingVector2.xyz).xw;
    workingVector0.w = (int)workingVector0.w & 255;
    workingVector0.w = (uint)workingVector0.w;
    workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.0254999977);
    workingVector0.w = workingVector0.w ? workingVector1.w : 0;
    if (workingVector0.w == 0) {
      workingVector1.z = -workingVector0.y * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w + 1;
      workingVector0.yw = workingVector1.xz * float2(2,2) + float2(-1,-1);
      workingVector1.zw = materialTexture3.Sample(textureSampler3, workingVector1.xy).xy;
      workingVector2.x = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.y;
      workingVector2.y = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.w;
      workingVector0.x = workingVector0.x * RD_UNIFORM_INV_PROJ_ROW_2.w + RD_UNIFORM_INV_PROJ_ROW_3.w;
      workingVector2.z = RD_UNIFORM_INV_PROJ_ROW_3.z;
      workingVector2.xyz = workingVector2.xyz / workingVector0.xxx;
      workingVector3.xyz = float3(1,1,1) + -abs(workingVector1.zwz);
      workingVector4.z = workingVector3.x + -abs(workingVector1.w);
      workingVector2.w = RD_COMPARISON_MASK(workingVector4.z < 0);
      workingVector3.xw = RD_COMPARISON_MASK(workingVector1.zw >= float2(0,0));
      workingVector3.xw = workingVector3.xw ? float2(1,1) : float2(-1,-1);
      workingVector3.xy = workingVector3.yz * workingVector3.xw;
      workingVector4.xy = workingVector2.ww ? workingVector3.xy : workingVector1.zw;
      workingVector1.z = dot(workingVector4.xyz, workingVector4.xyz);
      workingVector1.z = rsqrt(workingVector1.z);
      workingVector3.xyz = workingVector4.xyz * workingVector1.zzz;
      workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
      workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector4.xyz;
      workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector4.xyz;
      workingVector1.z = dot(workingVector4.xyz, workingVector4.xyz);
      workingVector1.z = rsqrt(workingVector1.z);
      workingVector4.xyz = workingVector4.xyz * workingVector1.zzz;
      workingVector5.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
      workingVector6.xyzw = float4(-0.501960814,0.0549999997,0.0549999997,0.0549999997) + workingVector5.wxyz;
      workingVector6.xyzw = float4(2.00787401,0.947867334,0.947867334,0.947867334) * workingVector6.xyzw;
      workingVector6.x = saturate(workingVector6.x);
      workingVector1.z = 0.498039216 + -workingVector5.w;
      workingVector1.z = saturate(2.00787401 * workingVector1.z);
      if (8 == 0) workingVector0.z = 0; else if (8+8 < 32) {       workingVector0.z = (uint)workingVector0.z << (32-(8 + 8)); workingVector0.z = (uint)workingVector0.z >> (32-8);      } else workingVector0.z = (uint)workingVector0.z >> 8;
      workingVector0.z = (uint)workingVector0.z;
      workingVector0.z = 0.00392156886 * workingVector0.z;
      workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
      workingVector7.xyz = max(float3(0,0,0), workingVector5.xyz);
      workingVector7.xyz = log2(workingVector7.xyz);
      workingVector7.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector7.xyz;
      workingVector7.xyz = exp2(workingVector7.xyz);
      workingVector8.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector5.xyz;
      workingVector6.yzw = log2(workingVector6.yzw);
      workingVector6.yzw = float3(2.4000001,2.4000001,2.4000001) * workingVector6.yzw;
      workingVector6.yzw = exp2(workingVector6.yzw);
      workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector5.xyz);
      workingVector5.xyz = workingVector5.xyz ? workingVector8.xyz : workingVector6.yzw;
      workingVector5.xyz = workingVector1.www ? workingVector7.xyz : workingVector5.xyz;
      workingVector1.w = 1 + -workingVector6.x;
      workingVector6.yz = float2(0.0399999991,0.318309873) * workingVector1.ww;
      workingVector5.xyz = workingVector5.xyz * workingVector6.xxx + workingVector6.yyy;
      workingVector1.x = materialTexture0.Sample(textureSampler0, workingVector1.xy).x;
      workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector1.y = sqrt(workingVector1.y);
      workingVector1.y = 9.99999975e-005 + workingVector1.y;
      workingVector6.xyw = workingVector2.xyz / workingVector1.yyy;
      workingVector1.y = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector1.z;
      workingVector1.z = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector1.z = RD_COMPARISON_MASK((int)workingVector1.z == 1);
      if (workingVector1.z != 0) {
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector2.yyy;
        workingVector2.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector2.xxx + workingVector7.xyz;
        workingVector2.xyw = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
        workingVector2.xyw = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector2.xyw;
        workingVector0.y = RD_UNIFORM_SUB_PIXEL_OFFSET.x + workingVector0.y;
        workingVector0.w = -RD_UNIFORM_SUB_PIXEL_OFFSET.y + workingVector0.w;
        workingVector7.z = RD_UNIFORM_INV_PROJ_ROW_0.x * workingVector0.y;
        workingVector7.x = RD_UNIFORM_INV_PROJ_ROW_1.y * workingVector0.w;
        workingVector7.y = RD_UNIFORM_INV_PROJ_ROW_3.z;
        workingVector0.xyw = workingVector7.xyz / workingVector0.xxx;
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector0.xxx;
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector0.www + workingVector7.xyz;
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector0.yyy + workingVector7.xyz;
        workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector7.xyz;
        workingVector7.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector7.xyz;
        workingVector8.xyz = ddx_coarse(workingVector0.ywx);
        workingVector1.z = dot(workingVector8.xyz, workingVector8.xyz);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector8.xyz = workingVector8.xyz * workingVector1.zzz;
        workingVector0.xyw = -workingVector0.xyw;
        workingVector0.xyw = ddy_coarse(workingVector0.xyw);
        workingVector1.z = dot(workingVector0.xyw, workingVector0.xyw);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector0.xyw = workingVector1.zzz * workingVector0.xyw;
        workingVector9.xyz = workingVector8.xyz * workingVector0.xyw;
        workingVector0.xyw = workingVector8.zxy * workingVector0.ywx + -workingVector9.xyz;
        workingVector1.z = dot(workingVector0.xyw, workingVector0.xyw);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector0.xyw = workingVector1.zzz * workingVector0.xyw;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector0.yyy;
        workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector0.xxx + workingVector8.xyz;
        workingVector0.xyw = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector0.www + workingVector8.xyz;
        workingVector1.z = dot(workingVector0.xyw, workingVector0.xyw);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector0.xyw = workingVector1.zzz * workingVector0.xyw;
        workingVector0.xyw = workingVector0.xyw / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
        workingVector0.xyw = round(workingVector0.xyw);
        workingVector0.xyw = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector0.xyw;
        workingVector1.z = dot(workingVector0.xyw, workingVector0.xyw);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector0.xyw = workingVector1.zzz * workingVector0.xyw;
        workingVector8.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
        workingVector8.xyz = floor(workingVector8.xyz);
        workingVector8.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector8.xyz + workingVector7.xyz;
        workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector8.xyz;
        workingVector1.z = dot(workingVector8.xyz, workingVector0.xyw);
        workingVector0.xyw = -workingVector1.zzz * workingVector0.xyw + workingVector8.xyz;
        workingVector0.xyw = workingVector7.xyz + workingVector0.xyw;
        workingVector0.xyw = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector0.xyw;
        workingVector1.z = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector1.z = RD_COMPARISON_MASK(0 < (int)workingVector1.z);
        workingVector0.xyw = workingVector1.zzz ? workingVector0.xyw : workingVector2.xyw;
        workingVector2.xyw = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector2.xyw;
        workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector2.xyw;
        workingVector2.xyw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector2.xyw;
        workingVector1.z = dot(workingVector2.xyw, workingVector2.xyw);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector2.xyw = workingVector2.xyw * workingVector1.zzz;
        workingVector1.z = dot(workingVector4.xyz, workingVector2.xyw);
        workingVector1.z = max(0, workingVector1.z);
        workingVector2.xyw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
        workingVector1.w = 1 + -workingVector1.z;
        workingVector1.w = max(0, workingVector1.w);
        workingVector0.xyw = workingVector2.xyw * workingVector1.www + workingVector0.xyw;
        workingVector3.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector1.w = dot(workingVector3.xyzw, float4(1,1,1,1));
        workingVector1.w = (int)workingVector1.w;
        workingVector2.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
        workingVector3.xyz = float3(1,1,0);
        workingVector2.y = 0;
        while (true) {
          workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.y >= (int)workingVector1.w);
          if (workingVector2.w != 0) break;
          workingVector2.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector2.y+0].xyzw);
          workingVector2.w = (int)workingVector2.w;
          workingVector2.w = (int)workingVector2.w + (int)workingVector3.z;
          workingVector2.w = min(8, (int)workingVector2.w);
          workingVector7.xy = workingVector3.xy;
          workingVector3.w = workingVector3.z;
          while (true) {
            workingVector4.w = RD_COMPARISON_MASK((int)workingVector3.w >= (int)workingVector2.w);
            if (workingVector4.w != 0) break;
            workingVector4.w = (uint)workingVector3.w << 2;
            workingVector8.xyz = fragmentVectorConstants1[workingVector4.w+59].xyz * workingVector0.yyy;
            workingVector8.xyz = fragmentVectorConstants1[workingVector4.w+58].xyz * workingVector0.xxx + workingVector8.xyz;
            workingVector8.xyz = fragmentVectorConstants1[workingVector4.w+60].xyz * workingVector0.www + workingVector8.xyz;
            workingVector8.xyz = fragmentVectorConstants1[workingVector4.w+61].xyz + workingVector8.xyz;
            workingVector9.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector8.xyz));
            workingVector5.w = workingVector9.y ? workingVector9.x : 0;
            workingVector5.w = workingVector9.z ? workingVector5.w : 0;
            if (workingVector5.w != 0) {
              workingVector5.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector3.w+0].xyzw);
              workingVector5.w = max(workingVector5.w, workingVector1.z);
              workingVector5.w = min(1, workingVector5.w);
              workingVector7.z = -workingVector5.w * workingVector5.w + 1;
              workingVector7.z = sqrt(workingVector7.z);
              workingVector5.w = workingVector7.z / workingVector5.w;
              workingVector5.w = fragmentVectorConstants1[workingVector3.w+44].z * workingVector5.w + fragmentVectorConstants1[workingVector3.w+44].y;
              workingVector9.xy = workingVector8.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector4.w = dot(fragmentVectorConstants1[workingVector4.w+14].xyzw, fragmentVectorConstants1[workingVector4.w+14].xyzw);
              workingVector4.w = sqrt(workingVector4.w);
              workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector4.w;
              workingVector7.z = fragmentVectorConstants1[workingVector3.w+44].w + 0.5;
              workingVector7.z = (int)workingVector7.z;
              workingVector7.z = max(1, (int)workingVector7.z);
              workingVector7.z = min(9, (int)workingVector7.z);
              workingVector7.z = workingVector2.x ? 1 : workingVector7.z;
              workingVector7.w = (uint)workingVector7.z >> 1;
              workingVector9.z = 1 + -workingVector9.y;
              workingVector10.z = (int)workingVector3.w;
              workingVector5.w = workingVector8.z + -workingVector5.w;
              workingVector8.xyw = float3(0,0,0);
              while (true) {
                workingVector9.y = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector7.z);
                if (workingVector9.y != 0) break;
                workingVector9.y = (int)-workingVector7.w + (int)workingVector8.w;
                workingVector9.y = (int)workingVector9.y;
                workingVector11.y = 0.5 + workingVector9.y;
                workingVector9.yw = workingVector8.yx;
                workingVector10.w = 0;
                while (true) {
                  workingVector11.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector7.z);
                  if (workingVector11.z != 0) break;
                  workingVector11.z = (int)-workingVector7.w + (int)workingVector10.w;
                  workingVector11.z = (int)workingVector11.z;
                  workingVector11.x = 0.5 + workingVector11.z;
                  workingVector11.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector11.xy;
                  workingVector11.xz = fragmentVectorConstants1[workingVector3.w+44].xx * workingVector11.xz;
                  workingVector10.xy = workingVector9.xz * fragmentVectorConstants1[workingVector3.w+44].xx + workingVector11.xz;
                  workingVector12.xyzw = materialTexture8.Gather(textureSampler8, workingVector10.xyz).xyzw;
                  workingVector10.xy = workingVector10.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector10.xy = frac(workingVector10.xy);
                  workingVector13.xyzw = -workingVector12.xyzw + workingVector8.zzzz;
                  workingVector13.xyzw = saturate(workingVector13.xyzw * workingVector4.wwww);
                  workingVector14.xyzw = workingVector13.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector13.xyzw = workingVector13.xyzw * workingVector13.xyzw;
                  workingVector13.xyzw = -workingVector14.xyzw * workingVector13.xyzw + float4(1,1,1,1);
                  workingVector11.xz = workingVector13.zy + -workingVector13.wx;
                  workingVector11.xz = workingVector10.xx * workingVector11.xz + workingVector13.wx;
                  workingVector11.z = workingVector11.z + -workingVector11.x;
                  workingVector11.x = workingVector10.y * workingVector11.z + workingVector11.x;
                  workingVector9.w = workingVector11.x + workingVector9.w;
                  workingVector11.x = RD_COMPARISON_MASK(workingVector12.w >= workingVector5.w);
                  workingVector11.x = workingVector11.x ? 1.000000 : 0;
                  workingVector11.x = workingVector11.x + workingVector9.y;
                  workingVector12.xyzw = RD_COMPARISON_MASK(workingVector12.xyzw >= workingVector5.wwww);
                  workingVector13.xyzw = workingVector12.xyzw ? float4(1,1,1,1) : 0;
                  workingVector11.zw = workingVector12.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector11.zw = workingVector13.zy + workingVector11.zw;
                  workingVector11.zw = workingVector10.xx * workingVector11.zw + workingVector13.wx;
                  workingVector10.x = workingVector11.w + -workingVector11.z;
                  workingVector10.x = workingVector10.y * workingVector10.x + workingVector11.z;
                  workingVector10.x = workingVector10.x + workingVector9.y;
                  workingVector9.y = workingVector2.x ? workingVector11.x : workingVector10.x;
                  workingVector10.w = (int)workingVector10.w + 1;
                }
                workingVector8.xy = workingVector9.wy;
                workingVector8.w = (int)workingVector8.w + 1;
              }
              workingVector4.w = (int)workingVector7.z * (int)workingVector7.z;
              workingVector4.w = (int)workingVector4.w;
              workingVector7.zw = workingVector8.xy / workingVector4.ww;
              workingVector7.xy = min(workingVector7.xy, workingVector7.zw);
              workingVector3.w = workingVector2.w;
            } else {
              workingVector3.w = (int)workingVector3.w + 1;
            }
          }
          workingVector3.xy = workingVector7.xy;
          workingVector3.z = workingVector3.w;
          workingVector2.y = (int)workingVector2.y + 1;
        }
        workingVector1.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector1.w = RD_COMPARISON_MASK(0 < (int)workingVector1.w);
        if (workingVector1.w != 0) {
          workingVector7.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector0.yyy;
          workingVector7.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector0.xxx + workingVector7.xyz;
          workingVector7.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector0.www + workingVector7.xyz;
          workingVector7.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector7.xyz;
          workingVector8.xy = workingVector7.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector8.z = 1 + -workingVector8.y;
          workingVector2.yw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector8.xz;
          workingVector3.zw = RD_COMPARISON_MASK(workingVector2.yw >= float2(0,0));
          workingVector7.xy = RD_COMPARISON_MASK(workingVector2.yw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector1.w = workingVector3.z ? workingVector7.x : 0;
          workingVector1.w = workingVector3.w ? workingVector1.w : 0;
          workingVector1.w = workingVector7.y ? workingVector1.w : 0;
          if (workingVector1.w != 0) {
            workingVector1.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector1.z);
            workingVector1.w = min(1, workingVector1.w);
            workingVector3.z = -workingVector1.w * workingVector1.w + 1;
            workingVector3.z = sqrt(workingVector3.z);
            workingVector1.w = workingVector3.z / workingVector1.w;
            workingVector1.w = fragmentVectorConstants1[workingVector3.w+44].z * workingVector1.w + fragmentVectorConstants1[workingVector3.w+44].y;
            workingVector1.w = workingVector7.z + -workingVector1.w;
            workingVector1.w = min(1, workingVector1.w);
            workingVector3.zw = workingVector2.xx ? float2(1.40129846e-045,1) : float2(2.80259693e-045,4);
            workingVector4.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector7.z = 1 + workingVector4.w;
            workingVector4.w = RD_COMPARISON_MASK((int)workingVector2.x == 0);
            workingVector5.w = 0;
            workingVector7.w = 0;
            while (true) {
              workingVector8.x = RD_COMPARISON_MASK((int)workingVector7.w >= (int)workingVector3.z);
              if (workingVector8.x != 0) break;
              workingVector8.x = (int)workingVector4.w + (int)workingVector7.w;
              workingVector8.x = (int)workingVector8.x;
              workingVector8.y = 0.5 + workingVector8.x;
              workingVector8.z = workingVector5.w;
              workingVector8.w = 0;
              while (true) {
                workingVector9.x = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector3.z);
                if (workingVector9.x != 0) break;
                workingVector9.x = (int)workingVector4.w + (int)workingVector8.w;
                workingVector9.x = (int)workingVector9.x;
                workingVector8.x = 0.5 + workingVector9.x;
                workingVector9.xy = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector8.xy;
                workingVector7.xy = workingVector9.xy * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector2.yw;
                if (workingVector2.x != 0) {
                  workingVector8.x = materialTexture8.SampleLevel(textureSampler8, workingVector7.xyz, 0).x;
                  workingVector8.x = RD_COMPARISON_MASK(workingVector8.x >= workingVector1.w);
                  workingVector8.x = workingVector8.x ? 1.000000 : 0;
                  workingVector8.z = workingVector8.z + workingVector8.x;
                } else {
                  workingVector9.xyzw = materialTexture8.Gather(textureSampler8, workingVector7.xyz).xyzw;
                  workingVector7.xy = workingVector7.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector7.xy = frac(workingVector7.xy);
                  workingVector9.xyzw = RD_COMPARISON_MASK(workingVector9.xyzw >= workingVector1.wwww);
                  workingVector10.xyzw = workingVector9.xyzw ? float4(1,1,1,1) : 0;
                  workingVector9.xy = workingVector9.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector9.xy = workingVector10.zy + workingVector9.xy;
                  workingVector9.xy = workingVector7.xx * workingVector9.xy + workingVector10.wx;
                  workingVector7.x = workingVector9.y + -workingVector9.x;
                  workingVector7.x = workingVector7.y * workingVector7.x + workingVector9.x;
                  workingVector8.z = workingVector8.z + workingVector7.x;
                }
                workingVector8.w = (int)workingVector8.w + 1;
              }
              workingVector5.w = workingVector8.z;
              workingVector7.w = (int)workingVector7.w + 1;
            }
            workingVector1.w = workingVector5.w / workingVector3.w;
          } else {
            workingVector1.w = 1;
          }
        } else {
          workingVector1.w = 1;
        }
        workingVector2.y = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector2.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector2.yw = RD_COMPARISON_MASK(int2(0,0) < (int2)workingVector2.yw);
        workingVector2.y = workingVector2.w ? workingVector2.y : 0;
        if (workingVector2.y != 0) {
          workingVector7.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector0.yyyy;
          workingVector7.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector0.xxxx + workingVector7.xyzw;
          workingVector7.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector0.wwww + workingVector7.xyzw;
          workingVector7.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector7.xyzw;
          workingVector7.xyzw = workingVector7.xyzw / workingVector7.wwww;
          workingVector0.x = max(RD_UNIFORM_ND_LFLOOR.x, workingVector1.z);
          workingVector0.x = min(1, workingVector0.x);
          workingVector0.y = -workingVector0.x * workingVector0.x + 1;
          workingVector0.y = sqrt(workingVector0.y);
          workingVector0.x = workingVector0.y / workingVector0.x;
          workingVector0.x = fragmentVectorConstants1[workingVector3.w+44].z * workingVector0.x + fragmentVectorConstants1[workingVector3.w+44].y;
          workingVector0.x = workingVector0.x / workingVector7.w;
          workingVector0.x = workingVector7.z + -workingVector0.x;
          workingVector7.xy = workingVector7.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector7.z = 1 + -workingVector7.y;
          workingVector0.y = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector0.y = (int)workingVector0.y;
          workingVector0.y = max(1, (int)workingVector0.y);
          workingVector0.y = min(9, (int)workingVector0.y);
          workingVector0.y = workingVector2.x ? 1 : workingVector0.y;
          workingVector0.w = (uint)workingVector0.y >> 1;
          workingVector8.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector1.z = 0;
          workingVector2.y = 0;
          while (true) {
            workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.y >= (int)workingVector0.y);
            if (workingVector2.w != 0) break;
            workingVector2.w = (int)-workingVector0.w + (int)workingVector2.y;
            workingVector2.w = (int)workingVector2.w;
            workingVector9.y = 0.5 + workingVector2.w;
            workingVector2.w = workingVector1.z;
            workingVector3.z = 0;
            while (true) {
              workingVector3.w = RD_COMPARISON_MASK((int)workingVector3.z >= (int)workingVector0.y);
              if (workingVector3.w != 0) break;
              workingVector3.w = (int)-workingVector0.w + (int)workingVector3.z;
              workingVector3.w = (int)workingVector3.w;
              workingVector9.x = 0.5 + workingVector3.w;
              workingVector7.yw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector9.xy;
              workingVector7.yw = fragmentVectorConstants1[workingVector3.w+44].xx * workingVector7.yw;
              workingVector8.xy = workingVector7.xz * fragmentVectorConstants1[workingVector3.w+44].xx + workingVector7.yw;
              if (workingVector2.x != 0) {
                workingVector3.w = materialTexture8.SampleLevel(textureSampler8, workingVector8.xyz, 0).x;
                workingVector3.w = RD_COMPARISON_MASK(workingVector3.w >= workingVector0.x);
                workingVector3.w = workingVector3.w ? 1.000000 : 0;
                workingVector2.w = workingVector3.w + workingVector2.w;
              } else {
                workingVector10.xyzw = materialTexture8.Gather(textureSampler8, workingVector8.xyz).xyzw;
                workingVector7.yw = workingVector8.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector7.yw = frac(workingVector7.yw);
                workingVector10.xyzw = RD_COMPARISON_MASK(workingVector10.xyzw >= workingVector0.xxxx);
                workingVector11.xyzw = workingVector10.xyzw ? float4(1,1,1,1) : 0;
                workingVector8.xy = workingVector10.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector8.xy = workingVector11.zy + workingVector8.xy;
                workingVector8.xy = workingVector7.yy * workingVector8.xy + workingVector11.wx;
                workingVector3.w = workingVector8.y + -workingVector8.x;
                workingVector3.w = workingVector7.w * workingVector3.w + workingVector8.x;
                workingVector2.w = workingVector3.w + workingVector2.w;
              }
              workingVector3.z = (int)workingVector3.z + 1;
            }
            workingVector1.z = workingVector2.w;
            workingVector2.y = (int)workingVector2.y + 1;
          }
          workingVector0.x = (int)workingVector0.y * (int)workingVector0.y;
          workingVector0.x = (int)workingVector0.x;
          workingVector0.x = workingVector1.z / workingVector0.x;
          workingVector0.y = RD_COMPARISON_MASK(workingVector0.x < 1);
          workingVector0.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector0.x = max(workingVector0.x, workingVector0.w);
          workingVector0.x = min(1, workingVector0.x);
          workingVector0.x = workingVector0.y ? workingVector0.x : 1;
        } else {
          workingVector0.x = 1;
        }
        workingVector0.x = min(workingVector1.w, workingVector0.x);
        workingVector0.x = min(workingVector3.y, workingVector0.x);
        workingVector0.y = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector0.y = min(8, workingVector0.y);
        workingVector0.y = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector0.y;
        workingVector0.y = max(0, workingVector0.y);
        workingVector0.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector0.y;
        workingVector0.y = -workingVector2.z + -workingVector0.y;
        workingVector0.w = 1 / workingVector0.w;
        workingVector0.y = saturate(workingVector0.y * workingVector0.w);
        workingVector0.w = workingVector0.y * -2 + 3;
        workingVector0.y = workingVector0.y * workingVector0.y;
        workingVector0.y = workingVector0.w * workingVector0.y;
        workingVector0.w = 1 + -workingVector0.x;
        workingVector0.x = workingVector0.y * workingVector0.w + workingVector0.x;
      } else {
        workingVector0.x = 1;
        workingVector3.x = 1;
      }
      workingVector2.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector2.xyz;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector2.xyz;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector2.xyz;
      workingVector0.y = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector0.y = rsqrt(workingVector0.y);
      workingVector3.yzw = workingVector2.xyz * workingVector0.yyy;
      workingVector7.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector1.xzw = workingVector7.xyz * workingVector1.xxx;
      workingVector1.xzw = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector1.xzw;
      workingVector0.w = dot(workingVector4.xyz, workingVector3.yzw);
      workingVector2.w = max(0, workingVector0.w);
      workingVector4.w = dot(workingVector4.xyz, -workingVector6.xyw);
      workingVector4.w = max(0, workingVector4.w);
      workingVector0.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector0.w;
      workingVector5.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
      workingVector5.w = workingVector5.w * workingVector5.w;
      workingVector0.w = workingVector0.w / workingVector5.w;
      workingVector0.w = max(0, workingVector0.w);
      workingVector0.w = workingVector0.w + -workingVector2.w;
      workingVector0.w = workingVector1.y * workingVector0.w + workingVector2.w;
      workingVector3.y = dot(-workingVector4.xyz, workingVector3.yzw);
      workingVector3.y = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector3.y;
      workingVector3.y = workingVector3.y / workingVector5.w;
      workingVector3.y = max(0, workingVector3.y);
      workingVector1.y = workingVector3.y * workingVector1.y;
      workingVector2.xyz = workingVector2.xyz * workingVector0.yyy + -workingVector6.xyw;
      workingVector0.y = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector0.y = rsqrt(workingVector0.y);
      workingVector2.xyz = workingVector2.xyz * workingVector0.yyy;
      workingVector0.y = max(0.0500000007, workingVector0.z);
      workingVector0.y = workingVector0.y * workingVector0.y;
      workingVector0.z = workingVector0.y * workingVector0.y;
      workingVector3.y = dot(workingVector4.xyz, workingVector2.xyz);
      workingVector3.y = max(0, workingVector3.y);
      workingVector3.z = workingVector0.y * workingVector0.y + -1;
      workingVector3.y = workingVector3.y * workingVector3.y;
      workingVector3.y = workingVector3.y * workingVector3.z + 1;
      workingVector3.y = workingVector3.y * workingVector3.y;
      workingVector3.y = 3.14159274 * workingVector3.y;
      workingVector0.z = workingVector0.z / workingVector3.y;
      workingVector3.y = 0.5 * workingVector0.y;
      workingVector0.y = -workingVector0.y * 0.5 + 1;
      workingVector3.z = workingVector4.w * workingVector0.y + workingVector3.y;
      workingVector3.z = 9.99999975e-005 + workingVector3.z;
      workingVector3.z = workingVector4.w / workingVector3.z;
      workingVector0.y = workingVector2.w * workingVector0.y + workingVector3.y;
      workingVector0.y = 9.99999975e-005 + workingVector0.y;
      workingVector0.y = workingVector2.w / workingVector0.y;
      workingVector0.y = workingVector3.z * workingVector0.y;
      workingVector2.x = dot(-workingVector6.xyw, workingVector2.xyz);
      workingVector2.x = max(0, workingVector2.x);
      workingVector3.yzw = float3(1,1,1) + -workingVector5.xyz;
      workingVector2.x = 1 + -workingVector2.x;
      workingVector2.x = max(0, workingVector2.x);
      workingVector2.y = workingVector2.x * workingVector2.x;
      workingVector2.y = workingVector2.y * workingVector2.y;
      workingVector2.x = workingVector2.y * workingVector2.x;
      workingVector2.xyz = workingVector3.yzw * workingVector2.xxx + workingVector5.xyz;
      workingVector3.yzw = float3(1,1,1) + -workingVector2.xyz;
      workingVector3.yzw = workingVector3.yzw * workingVector0.www;
      workingVector3.yzw = workingVector3.yzw * workingVector6.zzz;
      workingVector0.w = workingVector1.y * workingVector6.z;
      workingVector2.xyz = workingVector2.xyz * workingVector0.zzz;
      workingVector2.xyz = workingVector2.xyz * workingVector0.yyy;
      workingVector0.y = workingVector4.w * workingVector2.w;
      workingVector0.y = workingVector0.y * 4 + 9.99999975e-005;
      workingVector2.xyz = workingVector2.xyz / workingVector0.yyy;
      workingVector2.xyz = workingVector2.www * workingVector2.xyz;
      workingVector0.y = workingVector0.w * workingVector3.x;
      workingVector0.yzw = workingVector3.yzw * workingVector0.xxx + workingVector0.yyy;
      workingVector0.yzw = workingVector0.yzw * workingVector1.xzw;
      workingVector0.yzw = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector0.yzw;
      workingVector2.xyz = workingVector2.xyz * workingVector0.xxx;
      workingVector1.xyz = workingVector2.xyz * workingVector1.xzw;
      workingVector1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector1.xyz;
    } else {
      workingVector0.yzw = float3(0,0,0);
      workingVector1.xyz = float3(0,0,0);
    }
  } else {
    workingVector0.yzw = float3(0,0,0);
    workingVector1.xyz = float3(0,0,0);
  }
  fragmentColor0.xyz = workingVector0.yzw;
  fragmentColor0.w = 1;
  fragmentColor1.xyz = workingVector1.xyz;
  fragmentColor1.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    float productValue = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.x * varyingTexCoord0.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.z;
    float productValue1 = (floor(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.y * varyingTexCoord0.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_RESOLUTION.w;
    float productValue2 = (productValue * 2.0f) + (-1.0f);
    float productValue3 = ((1.0f - productValue1) * 2.0f) + (-1.0f);
    float4 sampledTextureValue = normalTexture.Sample(normalSampler, float2(productValue, productValue1));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float4 sampledTextureValue1 = sceneDepthTexture.Sample(sceneDepthSampler, float2(productValue, productValue1));
    float scalarValue2 = sampledTextureValue1.x;
    float productValue4 = (scalarValue2 * RD_UNIFORM_INV_PROJ_ROW_2.w) + RD_UNIFORM_INV_PROJ_ROW_3.w;
    float quotientValue = (productValue2 * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue4;
    float quotientValue1 = (productValue3 * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue4;
    float quotientValue2 = RD_UNIFORM_INV_PROJ_ROW_3.z / productValue4;
    float quotientValue3 = ((RD_UNIFORM_SUB_PIXEL_OFFSET.x + productValue2) * RD_UNIFORM_INV_PROJ_ROW_0.x) / productValue4;
    float quotientValue4 = ((productValue3 - RD_UNIFORM_SUB_PIXEL_OFFSET.y) * RD_UNIFORM_INV_PROJ_ROW_1.y) / productValue4;
    float multiplyAddValue = (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x) - RD_UNIFORM_WORLD_ORIGIN.x;
    float multiplyAddValue1 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y) - RD_UNIFORM_WORLD_ORIGIN.y;
    float multiplyAddValue2 = (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue4, quotientValue3 * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z) - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue3 = ddx_coarse(quotientValue3);
    float scalarValue4 = ddx_coarse(quotientValue4);
    float scalarValue5 = ddx_coarse(quotientValue2);
    float inverseLengthValue = rsqrt(dot(float3(scalarValue3, scalarValue4, scalarValue5), float3(scalarValue3, scalarValue4, scalarValue5)));
    float productValue5 = inverseLengthValue * scalarValue3;
    float productValue6 = inverseLengthValue * scalarValue4;
    float productValue7 = inverseLengthValue * scalarValue5;
    float sumValue = ddy_coarse((-0.0f) - quotientValue3);
    float sumValue1 = ddy_coarse((-0.0f) - quotientValue4);
    float sumValue2 = ddy_coarse((-0.0f) - quotientValue2);
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue, sumValue1, sumValue2), float3(sumValue, sumValue1, sumValue2)));
    float productValue8 = inverseLengthValue1 * sumValue;
    float productValue9 = inverseLengthValue1 * sumValue1;
    float productValue10 = inverseLengthValue1 * sumValue2;
    float productValue11 = (productValue10 * productValue6) - (productValue9 * productValue7);
    float productValue12 = (productValue8 * productValue7) - (productValue10 * productValue5);
    float productValue13 = (productValue9 * productValue5) - (productValue8 * productValue6);
    float inverseLengthValue2 = rsqrt(dot(float3(productValue11, productValue12, productValue13), float3(productValue11, productValue12, productValue13)));
    float productValue14 = productValue11 * inverseLengthValue2;
    float productValue15 = productValue12 * inverseLengthValue2;
    float productValue16 = productValue13 * inverseLengthValue2;
    float multiplyAddValue3 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue16, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue15, productValue14 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue4 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue16, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue15, productValue14 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue5 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue16, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue15, productValue14 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue3 = rsqrt(dot(float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
    float quotientValue5 = round((inverseLengthValue3 * multiplyAddValue3) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue6 = round((inverseLengthValue3 * multiplyAddValue4) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue7 = round((inverseLengthValue3 * multiplyAddValue5) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue4 = rsqrt(dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(quotientValue5, quotientValue6, quotientValue7)));
    float productValue17 = inverseLengthValue4 * quotientValue5;
    float productValue18 = inverseLengthValue4 * quotientValue6;
    float productValue19 = inverseLengthValue4 * quotientValue7;
    float productValue20 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue8 = productValue20 - (multiplyAddValue - (floor(multiplyAddValue / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue9 = productValue20 - (multiplyAddValue1 - (floor(multiplyAddValue1 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue10 = productValue20 - (multiplyAddValue2 - (floor(multiplyAddValue2 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue8, quotientValue9, quotientValue10), float3(productValue17, productValue18, productValue19));
    float sumValue3 = 1.0f - abs(scalarValue);
    float scalarValue6 = abs(scalarValue1);
    float sumValue4 = sumValue3 - scalarValue6;
    bool conditionValue = sumValue4 < 0.0f;
    float comparisonValue = conditionValue ? ((1.0f - scalarValue6) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue3 * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue4), float3(comparisonValue, comparisonValue1, sumValue4)));
    float productValue21 = comparisonValue * inverseLengthValue5;
    float productValue22 = comparisonValue1 * inverseLengthValue5;
    float productValue23 = inverseLengthValue5 * sumValue4;
    float inverseLengthValue6 = rsqrt(dot(float3(productValue21, productValue22, productValue23), float3(productValue21, productValue22, productValue23)));
    float productValue24 = inverseLengthValue6 * productValue21;
    float productValue25 = productValue22 * inverseLengthValue6;
    float productValue26 = inverseLengthValue6 * productValue23;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue25, productValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue25, productValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue26, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue25, productValue24 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), float3(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float productValue27 = inverseLengthValue7 * multiplyAddValue6;
    float productValue28 = inverseLengthValue7 * multiplyAddValue7;
    float productValue29 = inverseLengthValue7 * multiplyAddValue8;
    float4 sampledTextureValue2 = colorMetalnessSubsurfaceTexture.Sample(colorMetalnessSubsurfaceSampler, float2(productValue, productValue1));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float scalarValue10 = sampledTextureValue2.w;
    float clampedValue = clamp((scalarValue10 + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
    uint unusedTextureMipCount394;
    uint2 vectorValue = rdTextureSize(emissiveAmbientLinearRoughnessTexture, 0u, unusedTextureMipCount394);
    uint4 loadedBufferValue = emissiveAmbientLinearRoughnessTexture.Load(int3(uint2(uint(int(float(int(uint(int(float(int(vectorValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(vectorValue.y)))))) * productValue1))), 0u));
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(scalarValue7, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(scalarValue8, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(scalarValue9, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (scalarValue7 <= 0.040449999272823333740234375f) ? (scalarValue7 * 0.077399380505084991455078125f) : exp2(log2((scalarValue7 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (scalarValue8 <= 0.040449999272823333740234375f) ? (scalarValue8 * 0.077399380505084991455078125f) : exp2(log2((scalarValue8 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (scalarValue9 <= 0.040449999272823333740234375f) ? (scalarValue9 * 0.077399380505084991455078125f) : exp2(log2((scalarValue9 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    float sumValue5 = 1.0f - clampedValue;
    float productValue30 = sumValue5 * 0.039999999105930328369140625f;
    float productValue31 = (exponentialValue * clampedValue) + productValue30;
    float productValue32 = (exponentialValue1 * clampedValue) + productValue30;
    float productValue33 = (exponentialValue2 * clampedValue) + productValue30;
    float4 sampledTextureValue3 = causticsMultiplierTexture.Sample(causticsMultiplierSampler, float2(productValue, productValue1));
    float nonlinearValue = sqrt(((quotientValue1 * quotientValue1) + (quotientValue * quotientValue)) + (quotientValue2 * quotientValue2)) + 9.9999997473787516355514526367188e-05f;
    float quotientValue11 = quotientValue / nonlinearValue;
    float quotientValue12 = quotientValue1 / nonlinearValue;
    float quotientValue13 = quotientValue2 / nonlinearValue;
    float sumValue6 = (-0.0f) - quotientValue11;
    float sumValue7 = (-0.0f) - quotientValue12;
    float sumValue8 = (-0.0f) - quotientValue13;
    float clampedValue1 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * clamp((0.4980392158031463623046875f - scalarValue10) * 2.007874011993408203125f, 0.0f, 1.0f);
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if (scalarValue2 != 1.0f)
    {
        bool conditionValue1 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
        float branchMergedValue9;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        float branchMergedValue16;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(float(loadedBufferValue.w & 255u) * 0.0039215688593685626983642578125f) < 9.9999997473787516355514526367188e-05f))
        {
            branchMergedValue9 = 0.0f;
            branchMergedValue12 = 0.0f;
            branchMergedValue13 = 0.0f;
            branchMergedValue14 = 0.0f;
            branchMergedValue15 = 0.0f;
            branchMergedValue16 = 0.0f;
        }
        else
        {
            float productValue34;
            float intermediateValue20;
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue8 = rsqrt(dot(float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), float3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
                float dotProductValue1 = max(dot(float3(productValue27, productValue28, productValue29), float3(inverseLengthValue8 * multiplyAddValue9, inverseLengthValue8 * multiplyAddValue10, inverseLengthValue8 * multiplyAddValue11)), 0.0f);
                float clampedValue2 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float multiplyAddValue12 = (clampedValue2 * productValue24) + (conditionValue1 ? (((quotientValue8 + multiplyAddValue) - (dotProductValue * productValue17)) + RD_UNIFORM_WORLD_ORIGIN.x) : (mad(RD_UNIFORM_INV_VIEW_ROW_2.x, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.x)) + RD_UNIFORM_INV_VIEW_ROW_3.x));
                float multiplyAddValue13 = (clampedValue2 * productValue25) + (conditionValue1 ? (((multiplyAddValue1 - (dotProductValue * productValue18)) + quotientValue9) + RD_UNIFORM_WORLD_ORIGIN.y) : (mad(RD_UNIFORM_INV_VIEW_ROW_2.y, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.y)) + RD_UNIFORM_INV_VIEW_ROW_3.y));
                float multiplyAddValue14 = (clampedValue2 * productValue26) + (conditionValue1 ? (((multiplyAddValue2 - (dotProductValue * productValue19)) + quotientValue10) + RD_UNIFORM_WORLD_ORIGIN.z) : (mad(RD_UNIFORM_INV_VIEW_ROW_2.z, quotientValue2, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INV_VIEW_ROW_0.z)) + RD_UNIFORM_INV_VIEW_ROW_3.z));
                uint clampedValue3 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
                float intermediateValue21;
                float intermediateValue24;
                if (int(clampedValue3) > int(0u))
                {
                    float intermediateValue23;
                    float intermediateValue25;
                    uint intermediateValue29;
                    float scalarValue11 = 1.0f;
                    float scalarValue12 = 1.0f;
                    uint scalarValue13 = 0u;
                    uint scalarValue14 = 0u;
                    uint quotientValue16;
                    bool intermediateValue31;
                    for (;;)
                    {
                        uint sumValue9 = scalarValue14 + 228u;
                        quotientValue16 = uint(min(int(uint(int(fragmentConstants[sumValue9 / 4u][sumValue9 % 4u])) + scalarValue13), int(8u)));
                        intermediateValue31 = int(scalarValue13) < int(quotientValue16);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue31)
                        {
                            float intermediateValue34;
                            float intermediateValue35;
                            uint intermediateValue36;
                            float scalarValue15 = scalarValue11;
                            float scalarValue16 = scalarValue12;
                            uint scalarValue17 = scalarValue13;
                            uint bitwiseValue2;
                            float multiplyAddValue25;
                            float multiplyAddValue26;
                            float multiplyAddValue27;
                            bool comparisonValue4;
                            for (;;)
                            {
                                bitwiseValue2 = scalarValue17 << 2u;
                                uint sumValue10 = bitwiseValue2 + 58u;
                                uint sumValue11 = bitwiseValue2 + 59u;
                                uint sumValue12 = bitwiseValue2 + 60u;
                                uint sumValue13 = bitwiseValue2 + 61u;
                                multiplyAddValue25 = mad(fragmentConstants[sumValue12].x, multiplyAddValue14, mad(fragmentConstants[sumValue11].x, multiplyAddValue13, fragmentConstants[sumValue10].x * multiplyAddValue12)) + fragmentConstants[sumValue13].x;
                                multiplyAddValue26 = mad(fragmentConstants[sumValue12].y, multiplyAddValue14, mad(fragmentConstants[sumValue11].y, multiplyAddValue13, fragmentConstants[sumValue10].y * multiplyAddValue12)) + fragmentConstants[sumValue13].y;
                                multiplyAddValue27 = mad(fragmentConstants[sumValue12].z, multiplyAddValue14, mad(fragmentConstants[sumValue11].z, multiplyAddValue13, fragmentConstants[sumValue10].z * multiplyAddValue12)) + fragmentConstants[sumValue13].z;
                                comparisonValue4 = ((abs(multiplyAddValue25) <= 1.0f) && (abs(multiplyAddValue26) <= 1.0f)) && (abs(multiplyAddValue27) <= 1.0f);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue4)
                                {
                                    uint sumValue14 = scalarValue17 + 224u;
                                    uint sumValue15 = scalarValue17 + 44u;
                                    float quotientValue14 = min(max(dotProductValue1, fragmentConstants[sumValue14 / 4u][sumValue14 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue14 * quotientValue14)) / quotientValue14) * fragmentConstants[sumValue15].z;
                                    float productValue35 = (multiplyAddValue25 * 0.5f) + 0.5f;
                                    float productValue36 = 0.5f - (multiplyAddValue26 * 0.5f);
                                    uint sumValue16 = bitwiseValue2 + 14u;
                                    float nonlinearValue2 = sqrt((((fragmentConstants[sumValue16].x * fragmentConstants[sumValue16].x) + (fragmentConstants[sumValue16].y * fragmentConstants[sumValue16].y)) + (fragmentConstants[sumValue16].z * fragmentConstants[sumValue16].z)) + (fragmentConstants[sumValue16].w * fragmentConstants[sumValue16].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                    uint comparisonValue2 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue15].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue15 = uint(int(comparisonValue2) / int(2u));
                                    float intermediateValue50;
                                    float intermediateValue51;
                                    if (int(comparisonValue2) > int(0u))
                                    {
                                        float sumValue29;
                                        float productValue64;
                                        float intermediateValue61;
                                        float intermediateValue62;
                                        uint intermediateValue63;
                                        float scalarValue18 = 0.0f;
                                        float scalarValue19 = 0.0f;
                                        uint scalarValue20 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue61 = scalarValue18;
                                            intermediateValue62 = scalarValue19;
                                            intermediateValue63 = 0u;
                                            float intermediateValue70;
                                            float intermediateValue65;
                                            float intermediateValue66;
                                            float intermediateValue67;
                                            float intermediateValue68;
                                            float productValue72;
                                            float productValue73;
                                            bool comparisonValue14;
                                            float sumValue33;
                                            for (;;)
                                            {
                                                float productValue37 = (productValue35 + ((float(int(intermediateValue63 - quotientValue15)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue15].x;
                                                float productValue38 = (productValue36 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue20 - quotientValue15)) + 0.5f))) * fragmentConstants[sumValue15].x;
                                                float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue37, productValue38, float(int(scalarValue17))));
                                                intermediateValue65 = vectorValue1.x;
                                                intermediateValue66 = vectorValue1.y;
                                                intermediateValue67 = vectorValue1.z;
                                                intermediateValue68 = vectorValue1.w;
                                                productValue72 = frac((productValue37 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue73 = frac((productValue38 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue4 = clamp((multiplyAddValue27 - intermediateValue65) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue5 = clamp((multiplyAddValue27 - intermediateValue66) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue6 = clamp((multiplyAddValue27 - intermediateValue67) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue7 = clamp((multiplyAddValue27 - intermediateValue68) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue39 = 1.0f - ((clampedValue4 * clampedValue4) * (3.0f - (clampedValue4 * 2.0f)));
                                                float productValue40 = 1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)));
                                                float productValue41 = (((1.0f - ((clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f)))) - productValue40) * productValue72) + productValue40;
                                                productValue64 = (productValue41 + intermediateValue62) + ((((((1.0f - ((clampedValue5 * clampedValue5) * (3.0f - (clampedValue5 * 2.0f)))) - productValue39) * productValue72) + productValue39) - productValue41) * productValue73);
                                                comparisonValue14 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue33 = (multiplyAddValue27 - fragmentConstants[sumValue15].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue14)
                                                {
                                                    branchMergedValue4 = float(intermediateValue68 >= sumValue33);
                                                }
                                                else
                                                {
                                                    float comparisonValue3 = (intermediateValue65 < sumValue33) ? 0.0f : 1.0f;
                                                    float comparisonValue5 = (intermediateValue68 < sumValue33) ? 0.0f : 1.0f;
                                                    float comparisonValue7 = ((((intermediateValue67 < sumValue33) ? 0.0f : 1.0f) - comparisonValue5) * productValue72) + comparisonValue5;
                                                    branchMergedValue4 = (((((((intermediateValue66 < sumValue33) ? 0.0f : 1.0f) - comparisonValue3) * productValue72) + comparisonValue3) - comparisonValue7) * productValue73) + comparisonValue7;
                                                }
                                                intermediateValue70 = branchMergedValue4;
                                                sumValue29 = intermediateValue70 + intermediateValue61;
                                                uint sumValue17 = intermediateValue63 + 1u;
                                                if (sumValue17 == comparisonValue2)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue61 = sumValue29;
                                                    intermediateValue62 = productValue64;
                                                    intermediateValue63 = sumValue17;
                                                    continue;
                                                }
                                            }
                                            uint sumValue18 = scalarValue20 + 1u;
                                            if (sumValue18 == comparisonValue2)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue18 = sumValue29;
                                                scalarValue19 = productValue64;
                                                scalarValue20 = sumValue18;
                                                continue;
                                            }
                                        }
                                        intermediateValue50 = sumValue29;
                                        intermediateValue51 = productValue64;
                                    }
                                    else
                                    {
                                        intermediateValue50 = 0.0f;
                                        intermediateValue51 = 0.0f;
                                    }
                                    float productValue42 = float(int(comparisonValue2 * comparisonValue2));
                                    branchMergedValue1 = min(scalarValue15, intermediateValue51 / productValue42);
                                    branchMergedValue7 = quotientValue16;
                                    branchMergedValue8 = min(scalarValue16, intermediateValue50 / productValue42);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue15;
                                    branchMergedValue7 = scalarValue17 + 1u;
                                    branchMergedValue8 = scalarValue16;
                                }
                                intermediateValue34 = branchMergedValue1;
                                intermediateValue36 = branchMergedValue7;
                                intermediateValue35 = branchMergedValue8;
                                if (int(intermediateValue36) < int(quotientValue16))
                                {
                                    scalarValue15 = intermediateValue34;
                                    scalarValue16 = intermediateValue35;
                                    scalarValue17 = intermediateValue36;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue36;
                            branchMergedValue5 = intermediateValue34;
                            branchMergedValue6 = intermediateValue35;
                        }
                        else
                        {
                            branchMergedValue = scalarValue13;
                            branchMergedValue5 = scalarValue11;
                            branchMergedValue6 = scalarValue12;
                        }
                        intermediateValue29 = branchMergedValue;
                        intermediateValue23 = branchMergedValue5;
                        intermediateValue25 = branchMergedValue6;
                        uint sumValue19 = scalarValue14 + 1u;
                        if (sumValue19 == clampedValue3)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue11 = intermediateValue23;
                            scalarValue12 = intermediateValue25;
                            scalarValue13 = intermediateValue29;
                            scalarValue14 = sumValue19;
                            continue;
                        }
                    }
                    intermediateValue21 = intermediateValue23;
                    intermediateValue24 = intermediateValue25;
                }
                else
                {
                    intermediateValue21 = 1.0f;
                    intermediateValue24 = 1.0f;
                }
                float intermediateValue33;
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
                    float scalarValue21 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue15 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, multiplyAddValue13, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * multiplyAddValue12))) - ((sqrt(1.0f - (scalarValue21 * scalarValue21)) / scalarValue21) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue16 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, multiplyAddValue14, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, multiplyAddValue13, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * multiplyAddValue12)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue17 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, multiplyAddValue14, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, multiplyAddValue13, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * multiplyAddValue12)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    uint comparisonValue8 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue8 >> 1u;
                    float branchMergedValue10;
                    if ((multiplyAddValue17 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue16 >= 0.0f) && (multiplyAddValue16 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue17 >= 0.0f)))
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
                        float sumValue21;
                        float intermediateValue46;
                        uint intermediateValue47;
                        float scalarValue22 = 0.0f;
                        uint scalarValue23 = 0u;
                        for (;;)
                        {
                            intermediateValue46 = scalarValue22;
                            intermediateValue47 = 0u;
                            float intermediateValue59;
                            float productValue62;
                            float productValue63;
                            bool comparisonValue6;
                            for (;;)
                            {
                                float productValue43 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
                                productValue62 = (productValue43 * (float(int(intermediateValue47 - bitwiseValue)) + 0.5f)) + multiplyAddValue16;
                                productValue63 = (productValue43 * (float(int(scalarValue23 - bitwiseValue)) + 0.5f)) + multiplyAddValue17;
                                comparisonValue6 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue2;
                                if (comparisonValue6)
                                {
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue62, productValue63, dotProductValue2), 0.0f).x >= multiplyAddValue15);
                                }
                                else
                                {
                                    float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue62, productValue63, dotProductValue2));
                                    float productValue44 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue62) + 0.5f);
                                    float comparisonValue9 = (vectorValue2.x < multiplyAddValue15) ? 0.0f : 1.0f;
                                    float comparisonValue11 = (vectorValue2.w < multiplyAddValue15) ? 0.0f : 1.0f;
                                    float comparisonValue12 = ((((vectorValue2.z < multiplyAddValue15) ? 0.0f : 1.0f) - comparisonValue11) * productValue44) + comparisonValue11;
                                    branchMergedValue2 = (((((((vectorValue2.y < multiplyAddValue15) ? 0.0f : 1.0f) - comparisonValue9) * productValue44) + comparisonValue9) - comparisonValue12) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue63) + 0.5f)) + comparisonValue12;
                                }
                                intermediateValue59 = branchMergedValue2;
                                sumValue21 = intermediateValue59 + intermediateValue46;
                                uint sumValue20 = intermediateValue47 + 1u;
                                if (int(sumValue20) < int(comparisonValue8))
                                {
                                    intermediateValue46 = sumValue21;
                                    intermediateValue47 = sumValue20;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue22 = scalarValue23 + 1u;
                            if (int(sumValue22) < int(comparisonValue8))
                            {
                                scalarValue22 = sumValue21;
                                scalarValue23 = sumValue22;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue10 = sumValue21 / float(int(comparisonValue8 * comparisonValue8));
                    }
                    else
                    {
                        branchMergedValue10 = 1.0f;
                    }
                    intermediateValue33 = branchMergedValue10;
                }
                else
                {
                    intermediateValue33 = 1.0f;
                }
                float intermediateValue38;
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
                    float multiplyAddValue18 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, multiplyAddValue14, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, multiplyAddValue13, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * multiplyAddValue12)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue24 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue19 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, multiplyAddValue13, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * multiplyAddValue12)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue18) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue24 * scalarValue24)) / scalarValue24) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue20 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, multiplyAddValue14, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, multiplyAddValue13, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * multiplyAddValue12)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue18) * 0.5f) + 0.5f;
                    float multiplyAddValue21 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, multiplyAddValue14, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, multiplyAddValue13, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * multiplyAddValue12)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue18) * 0.5f);
                    uint comparisonValue13 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue17 = uint(int(comparisonValue13) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
                    float intermediateValue45;
                    if (int(comparisonValue13) > int(0u))
                    {
                        float sumValue23;
                        float intermediateValue53;
                        uint intermediateValue54;
                        float scalarValue25 = 0.0f;
                        uint scalarValue26 = 0u;
                        for (;;)
                        {
                            intermediateValue53 = scalarValue25;
                            intermediateValue54 = 0u;
                            float intermediateValue69;
                            float4 intermediateValue55;
                            float productValue67;
                            float productValue68;
                            bool comparisonValue10;
                            for (;;)
                            {
                                intermediateValue55 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue67 = (multiplyAddValue20 + ((float(int(intermediateValue54 - quotientValue17)) + 0.5f) * intermediateValue55.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue68 = (multiplyAddValue21 + (intermediateValue55.x * (float(int(scalarValue26 - quotientValue17)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue10 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue10)
                                {
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue67, productValue68, dotProductValue3), 0.0f).x >= multiplyAddValue19);
                                }
                                else
                                {
                                    float4 vectorValue3 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue67, productValue68, dotProductValue3));
                                    float productValue45 = frac((productValue67 * intermediateValue55.z) + 0.5f);
                                    float comparisonValue15 = (vectorValue3.x < multiplyAddValue19) ? 0.0f : 1.0f;
                                    float comparisonValue16 = (vectorValue3.w < multiplyAddValue19) ? 0.0f : 1.0f;
                                    float comparisonValue17 = ((((vectorValue3.z < multiplyAddValue19) ? 0.0f : 1.0f) - comparisonValue16) * productValue45) + comparisonValue16;
                                    branchMergedValue3 = (((((((vectorValue3.y < multiplyAddValue19) ? 0.0f : 1.0f) - comparisonValue15) * productValue45) + comparisonValue15) - comparisonValue17) * frac((productValue68 * intermediateValue55.z) + 0.5f)) + comparisonValue17;
                                }
                                intermediateValue69 = branchMergedValue3;
                                sumValue23 = intermediateValue69 + intermediateValue53;
                                uint sumValue24 = intermediateValue54 + 1u;
                                if (sumValue24 == comparisonValue13)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue53 = sumValue23;
                                    intermediateValue54 = sumValue24;
                                    continue;
                                }
                            }
                            uint sumValue25 = scalarValue26 + 1u;
                            if (sumValue25 == comparisonValue13)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue25 = sumValue23;
                                scalarValue26 = sumValue25;
                                continue;
                            }
                        }
                        intermediateValue45 = sumValue23;
                    }
                    else
                    {
                        intermediateValue45 = 0.0f;
                    }
                    float quotientValue18 = intermediateValue45 / float(int(comparisonValue13 * comparisonValue13));
                    float branchMergedValue11;
                    if (quotientValue18 < 1.0f)
                    {
                        branchMergedValue11 = min(1.0f, max(quotientValue18, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
                    }
                    else
                    {
                        branchMergedValue11 = 1.0f;
                    }
                    intermediateValue38 = branchMergedValue11;
                }
                else
                {
                    intermediateValue38 = 1.0f;
                }
                float scalarValue27 = min(intermediateValue24, min(intermediateValue33, intermediateValue38));
                float productValue46 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue8 = clamp((((-0.0f) - quotientValue2) - productValue46) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue46), 0.0f, 1.0f);
                productValue34 = (((clampedValue8 * clampedValue8) * (1.0f - scalarValue27)) * (3.0f - (clampedValue8 * 2.0f))) + scalarValue27;
                intermediateValue20 = intermediateValue21;
            }
            else
            {
                productValue34 = 1.0f;
                intermediateValue20 = 1.0f;
            }
            float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue9 = rsqrt(dot(float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24), float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24)));
            float productValue47 = inverseLengthValue9 * multiplyAddValue22;
            float productValue48 = inverseLengthValue9 * multiplyAddValue23;
            float productValue49 = inverseLengthValue9 * multiplyAddValue24;
            float productValue50 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue3.x);
            float productValue51 = productValue50 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue52 = productValue50 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue53 = productValue50 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = dot(float3(productValue27, productValue28, productValue29), float3(productValue47, productValue48, productValue49));
            float scalarValue28 = max(dotProductValue4, 0.0f);
            float dotProductValue5 = max(dot(float3(productValue27, productValue28, productValue29), float3(sumValue6, sumValue7, sumValue8)), 0.0f);
            float sumValue26 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue54 = sumValue26 * sumValue26;
            float sumValue27 = productValue47 - quotientValue11;
            float sumValue28 = productValue48 - quotientValue12;
            float sumValue30 = productValue49 - quotientValue13;
            float inverseLengthValue10 = rsqrt(dot(float3(sumValue27, sumValue28, sumValue30), float3(sumValue27, sumValue28, sumValue30)));
            float productValue55 = inverseLengthValue10 * sumValue27;
            float productValue56 = inverseLengthValue10 * sumValue28;
            float productValue57 = inverseLengthValue10 * sumValue30;
            float bitwiseValue1 = max(float((loadedBufferValue.x >> 8u) & 255u) * 0.0039215688593685626983642578125f, 0.0500000007450580596923828125f);
            float productValue58 = bitwiseValue1 * bitwiseValue1;
            float productValue59 = productValue58 * productValue58;
            float dotProductValue6 = max(dot(float3(productValue27, productValue28, productValue29), float3(productValue55, productValue56, productValue57)), 0.0f);
            float productValue60 = ((dotProductValue6 * dotProductValue6) * (productValue59 + (-1.0f))) + 1.0f;
            float productValue61 = productValue58 * 0.5f;
            float sumValue31 = 1.0f - productValue61;
            float sumValue32 = productValue61 + 9.9999997473787516355514526367188e-05f;
            float clampedValue9 = clamp(1.0f - max(dot(float3(sumValue6, sumValue7, sumValue8), float3(productValue55, productValue56, productValue57)), 0.0f), 0.0f, 1.0f);
            float productValue65 = clampedValue9 * clampedValue9;
            float productValue66 = (productValue65 * productValue65) * clampedValue9;
            float productValue69 = (productValue66 * (1.0f - productValue31)) + productValue31;
            float productValue70 = (productValue66 * (1.0f - productValue32)) + productValue32;
            float productValue71 = (productValue66 * (1.0f - productValue33)) + productValue33;
            float quotientValue19 = ((dotProductValue5 / ((sumValue31 * dotProductValue5) + sumValue32)) * (productValue59 / ((productValue60 * productValue60) * 3.1415927410125732421875f))) * (scalarValue28 / ((sumValue31 * scalarValue28) + sumValue32));
            float productValue74 = ((scalarValue28 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
            float quotientValue20 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue54, 0.0f) - scalarValue28) * clampedValue1) + scalarValue28) * productValue34;
            float dotProductValue7 = (intermediateValue20 * clampedValue1) * max((dot(float3((-0.0f) - productValue27, (-0.0f) - productValue28, (-0.0f) - productValue29), float3(productValue47, productValue48, productValue49)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue54, 0.0f);
            float productValue75 = sumValue5 * 0.3183098733425140380859375f;
            float productValue76 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue28 * productValue34);
            branchMergedValue9 = ((productValue75 * productValue51) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue69) * quotientValue20) + dotProductValue7);
            branchMergedValue12 = (productValue76 * productValue53) * ((productValue71 * quotientValue19) / productValue74);
            branchMergedValue13 = (productValue76 * productValue52) * ((productValue70 * quotientValue19) / productValue74);
            branchMergedValue14 = (productValue76 * productValue51) * ((productValue69 * quotientValue19) / productValue74);
            branchMergedValue15 = ((productValue75 * productValue53) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue71) * quotientValue20) + dotProductValue7);
            branchMergedValue16 = ((productValue75 * productValue52) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue70) * quotientValue20) + dotProductValue7);
        }
        intermediateValue14 = branchMergedValue9;
        intermediateValue15 = branchMergedValue16;
        intermediateValue16 = branchMergedValue15;
        intermediateValue17 = branchMergedValue14;
        intermediateValue18 = branchMergedValue13;
        intermediateValue19 = branchMergedValue12;
    }
    else
    {
        intermediateValue14 = 0.0f;
        intermediateValue15 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue17 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue19 = 0.0f;
    }
    fragmentColor0.x = intermediateValue14;
    fragmentColor0.y = intermediateValue15;
    fragmentColor0.z = intermediateValue16;
    fragmentColor0.w = 1.0f;
    fragmentColor1.x = intermediateValue17;
    fragmentColor1.y = intermediateValue18;
    fragmentColor1.z = intermediateValue19;
    fragmentColor1.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    return stage_output;
}
#endif
