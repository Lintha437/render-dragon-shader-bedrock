// ParticleForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/ParticleForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float3 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor1 : COLOR1,
  float3 varyingNormal0 : NORMAL0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float2 varyingTexCoord1 : TEXCOORD1,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000},
                              { -1, 0, 0, 1},
                              { 2, 0, 0, 1},
                              { 3, 0, 1, 0},
                              { -1, 0, 1, 0},
                              { 0, 1, 0, 0},
                              { 6, 1, 0, 0},
                              { 7, 0, 1, 0},
                              { -1, 1, 0, 0},
                              { 1, 0, 1, 1},
                              { 10, 1, 0, 1},
                              { 11, 0, 1, 1},
                              { -1, 0, 1, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 0, 1},
                              { -1, 1, 1, 0},
                              { -1, 1, 1, 0},
                              { 4, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 21, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0},
                              { -1, 0, 0, 0} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyz = -workingVector0.xyz * varyingColor0.xyz + varyingColor1.xyz;
  workingVector0.xyz = varyingColor1.www * workingVector0.xyz + workingVector1.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector2.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector2.xyz = log2(workingVector2.xyz);
  workingVector2.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector2.xyz;
  workingVector2.xyz = exp2(workingVector2.xyz);
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
  workingVector4.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector4.xyz;
  workingVector4.xyz = log2(workingVector4.xyz);
  workingVector4.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector4.xyz;
  workingVector4.xyz = exp2(workingVector4.xyz);
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector3.xyz : workingVector4.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector2.xyz : workingVector0.xyz;
  workingVector0.w = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector2.xy = (int2)workingVector0.ww & int2(1,4);
  workingVector2.xy = RD_COMPARISON_MASK((int2)workingVector2.xy == int2(1,4));
  if (workingVector2.x != 0) {
    workingVector3.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
    workingVector0.w = (int)workingVector0.w & 2;
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 2);
    workingVector0.w = workingVector0.w ? workingVector3.w : RD_UNIFORM_MERS_UNIFORMS.w;
  } else {
    workingVector3.xyz = RD_UNIFORM_MERS_UNIFORMS.xyz;
    workingVector0.w = RD_UNIFORM_MERS_UNIFORMS.w;
  }
  if (workingVector2.y != 0) {
    workingVector2.xyz = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyz;
    workingVector2.xyz = workingVector2.xyz * float3(2,2,2) + float3(-1,-1,-1);
    workingVector4.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyz * workingVector2.yyy;
    workingVector2.xyw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyz * workingVector2.xxx + workingVector4.xyz;
    workingVector2.xyz = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyz * workingVector2.zzz + workingVector2.xyw;
  } else {
    workingVector2.xyz = varyingNormal0.xyz;
  }
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector4.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector4.yyyy;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector4.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector4.zzzz + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector4.wwww + workingVector5.xyzw;
  workingVector5.xyz = workingVector5.xyz / workingVector5.www;
  workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector6.xyz = workingVector2.xyz * workingVector2.www;
  workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
  workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector7.xyz;
  workingVector7.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector7.xyz;
  workingVector2.xy = RD_COMPARISON_MASK(float2(0,0) < RD_UNIFORM_QUANTIZATION_PARAMETERS.yw);
  workingVector2.x = (int)workingVector2.y | (int)workingVector2.x;
  workingVector8.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector9.xyz = ddx_coarse(workingVector4.zxy);
  workingVector3.w = dot(workingVector9.xyz, workingVector9.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector9.xyz = workingVector9.xyz * workingVector3.www;
  workingVector10.xyz = -workingVector4.yzx;
  workingVector10.xyz = ddy_coarse(workingVector10.xyz);
  workingVector3.w = dot(workingVector10.xyz, workingVector10.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector10.xyz = workingVector10.xyz * workingVector3.www;
  workingVector11.xyz = workingVector10.xyz * workingVector9.xyz;
  workingVector9.xyz = workingVector9.zxy * workingVector10.yzx + -workingVector11.xyz;
  workingVector3.w = dot(workingVector9.xyz, workingVector9.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector9.xyz = workingVector9.xyz * workingVector3.www;
  workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector9.yyy;
  workingVector9.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector9.xxx + workingVector10.xyz;
  workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector9.zzz + workingVector9.xyw;
  workingVector3.w = dot(workingVector9.xyz, workingVector9.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector9.xyz = workingVector9.xyz * workingVector3.www;
  workingVector9.xyz = workingVector9.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector9.xyz = round(workingVector9.xyz);
  workingVector9.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector9.xyz;
  workingVector3.w = dot(workingVector9.xyz, workingVector9.xyz);
  workingVector3.w = rsqrt(workingVector3.w);
  workingVector9.xyz = workingVector9.xyz * workingVector3.www;
  workingVector10.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector10.xyz = floor(workingVector10.xyz);
  workingVector10.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector10.xyz + workingVector8.xyz;
  workingVector10.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector10.xyz;
  workingVector3.w = dot(workingVector10.xyz, workingVector9.xyz);
  workingVector9.xyz = -workingVector3.www * workingVector9.xyz + workingVector10.xyz;
  workingVector9.xyz = workingVector9.xyz + workingVector8.xyz;
  workingVector9.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector9.xyz;
  workingVector9.xyz = workingVector2.xxx ? workingVector9.xyz : varyingTexCoord3.xyz;
  workingVector2.x = varyingTexCoord2.x + varyingTexCoord2.y;
  workingVector2.x = varyingTexCoord2.z + workingVector2.x;
  workingVector2.x = RD_COMPARISON_MASK(workingVector2.x < 9.99999975e-005);
  workingVector3.w = RD_COMPARISON_MASK(9.99999975e-005 < varyingTexCoord1.x);
  workingVector2.x = workingVector2.x ? workingVector3.w : 0;
  workingVector10.x = varyingTexCoord1.x * varyingTexCoord1.x;
  workingVector3.w = workingVector10.x * 0.600000024 + 0.400000006;
  workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
  workingVector10.y = workingVector10.x * workingVector3.w;
  workingVector3.w = workingVector10.x * workingVector10.x;
  workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
  workingVector10.z = workingVector10.x * workingVector3.w;
  workingVector10.xyz = min(float3(1,1,1), workingVector10.xyz);
  workingVector10.xyz = workingVector2.xxx ? workingVector10.xyz : varyingTexCoord2.xyz;
  workingVector2.x = 1 + -workingVector3.x;
  workingVector11.xyz = workingVector3.xxx * workingVector0.xyz;
  workingVector11.xyz = workingVector2.xxx * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector11.xyz;
  workingVector12.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector3.w = workingVector12.y ? workingVector12.x : 0;
  if (workingVector3.w != 0) {
    workingVector12.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector12.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector12.xy;
    workingVector12.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector3.w = materialTexture6.Sample(textureSampler6, workingVector12.xyz).x;
    workingVector3.w = workingVector3.w + workingVector3.w;
    workingVector4.w = saturate(workingVector6.y);
    workingVector3.w = workingVector4.w * workingVector3.w;
    workingVector3.w = log2(workingVector3.w);
    workingVector3.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector3.w;
    workingVector3.w = exp2(workingVector3.w);
    workingVector4.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector3.w = workingVector4.w * workingVector3.w;
  } else {
    workingVector3.w = 1;
  }
  workingVector4.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector4.w = sqrt(workingVector4.w);
  workingVector5.w = RD_COMPARISON_MASK(workingVector5.z != 1.000000);
  if (workingVector5.w != 0) {
    workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector6.w = RD_COMPARISON_MASK(abs(varyingTexCoord1.y) < 9.99999975e-005);
    workingVector5.w = workingVector5.w ? workingVector6.w : 0;
    if (workingVector5.w == 0) {
      workingVector5.w = 9.99999975e-005 + workingVector4.w;
      workingVector12.xyz = workingVector4.xyz / workingVector5.www;
      workingVector0.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector0.w;
      workingVector5.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 1);
      if (workingVector5.w != 0) {
        workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
        workingVector13.xyz = workingVector5.www ? workingVector9.xyz : varyingTexCoord3.xyz;
        workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector14.xyz;
        workingVector5.w = dot(workingVector14.xyz, workingVector14.xyz);
        workingVector5.w = rsqrt(workingVector5.w);
        workingVector14.xyz = workingVector14.xyz * workingVector5.www;
        workingVector5.w = dot(workingVector7.xyz, workingVector14.xyz);
        workingVector5.w = max(0, workingVector5.w);
        workingVector14.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector6.xyz;
        workingVector6.w = 1 + -workingVector5.w;
        workingVector6.w = max(0, workingVector6.w);
        workingVector13.xyz = workingVector14.xyz * workingVector6.www + workingVector13.xyz;
        workingVector14.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector6.w = dot(workingVector14.xyzw, float4(1,1,1,1));
        workingVector6.w = (int)workingVector6.w;
        workingVector7.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
        workingVector14.xyz = float3(1,1,0);
        workingVector8.w = 0;
        while (true) {
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector6.w);
          if (workingVector9.w != 0) break;
          workingVector9.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector8.w+0].xyzw);
          workingVector9.w = (int)workingVector9.w;
          workingVector9.w = (int)workingVector9.w + (int)workingVector14.z;
          workingVector9.w = min(8, (int)workingVector9.w);
          workingVector15.xy = workingVector14.xy;
          workingVector10.w = workingVector14.z;
          while (true) {
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector9.w);
            if (workingVector11.w != 0) break;
            workingVector11.w = (uint)workingVector10.w << 2;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+93].xyz * workingVector13.yyy;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+92].xyz * workingVector13.xxx + workingVector16.xyz;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+94].xyz * workingVector13.zzz + workingVector16.xyz;
            workingVector16.xyz = fragmentVectorConstants1[workingVector11.w+95].xyz + workingVector16.xyz;
            workingVector17.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector16.xyz));
            workingVector12.w = workingVector17.y ? workingVector17.x : 0;
            workingVector12.w = workingVector17.z ? workingVector12.w : 0;
            if (workingVector12.w != 0) {
              workingVector12.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector10.w+0].xyzw);
              workingVector12.w = max(workingVector12.w, workingVector5.w);
              workingVector12.w = min(1, workingVector12.w);
              workingVector13.w = -workingVector12.w * workingVector12.w + 1;
              workingVector13.w = sqrt(workingVector13.w);
              workingVector12.w = workingVector13.w / workingVector12.w;
              workingVector12.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector12.w + fragmentVectorConstants1[workingVector10.w+49].y;
              workingVector17.xy = workingVector16.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector11.w = dot(fragmentVectorConstants1[workingVector11.w+19].xyzw, fragmentVectorConstants1[workingVector11.w+19].xyzw);
              workingVector11.w = sqrt(workingVector11.w);
              workingVector11.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector11.w;
              workingVector13.w = fragmentVectorConstants1[workingVector10.w+49].w + 0.5;
              workingVector13.w = (int)workingVector13.w;
              workingVector13.w = max(1, (int)workingVector13.w);
              workingVector13.w = min(9, (int)workingVector13.w);
              workingVector13.w = workingVector7.w ? 1 : workingVector13.w;
              workingVector14.w = (uint)workingVector13.w >> 1;
              workingVector17.z = 1 + -workingVector17.y;
              workingVector18.z = (int)workingVector10.w;
              workingVector12.w = workingVector16.z + -workingVector12.w;
              workingVector15.zw = float2(0,0);
              workingVector16.x = 0;
              while (true) {
                workingVector16.y = RD_COMPARISON_MASK((int)workingVector16.x >= (int)workingVector13.w);
                if (workingVector16.y != 0) break;
                workingVector16.y = (int)-workingVector14.w + (int)workingVector16.x;
                workingVector16.y = (int)workingVector16.y;
                workingVector19.y = 0.5 + workingVector16.y;
                workingVector16.yw = workingVector15.wz;
                workingVector17.y = 0;
                while (true) {
                  workingVector17.w = RD_COMPARISON_MASK((int)workingVector17.y >= (int)workingVector13.w);
                  if (workingVector17.w != 0) break;
                  workingVector17.w = (int)-workingVector14.w + (int)workingVector17.y;
                  workingVector17.w = (int)workingVector17.w;
                  workingVector19.x = 0.5 + workingVector17.w;
                  workingVector19.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector19.xy;
                  workingVector19.xz = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector19.xz;
                  workingVector18.xy = workingVector17.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector19.xz;
                  workingVector20.xyzw = materialTexture8.Gather(textureSampler8, workingVector18.xyz).xyzw;
                  workingVector18.xy = workingVector18.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector18.xy = frac(workingVector18.xy);
                  workingVector21.xyzw = -workingVector20.xyzw + workingVector16.zzzz;
                  workingVector21.xyzw = saturate(workingVector21.xyzw * workingVector11.wwww);
                  workingVector22.xyzw = workingVector21.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector21.xyzw = workingVector21.xyzw * workingVector21.xyzw;
                  workingVector21.xyzw = -workingVector22.xyzw * workingVector21.xyzw + float4(1,1,1,1);
                  workingVector19.xz = workingVector21.zy + -workingVector21.wx;
                  workingVector19.xz = workingVector18.xx * workingVector19.xz + workingVector21.wx;
                  workingVector17.w = workingVector19.z + -workingVector19.x;
                  workingVector17.w = workingVector18.y * workingVector17.w + workingVector19.x;
                  workingVector16.w = workingVector17.w + workingVector16.w;
                  workingVector17.w = RD_COMPARISON_MASK(workingVector20.w >= workingVector12.w);
                  workingVector17.w = workingVector17.w ? 1.000000 : 0;
                  workingVector17.w = workingVector17.w + workingVector16.y;
                  workingVector20.xyzw = RD_COMPARISON_MASK(workingVector20.xyzw >= workingVector12.wwww);
                  workingVector21.xyzw = workingVector20.xyzw ? float4(1,1,1,1) : 0;
                  workingVector19.xz = workingVector20.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector19.xz = workingVector21.zy + workingVector19.xz;
                  workingVector18.xw = workingVector18.xx * workingVector19.xz + workingVector21.wx;
                  workingVector18.w = workingVector18.w + -workingVector18.x;
                  workingVector18.x = workingVector18.y * workingVector18.w + workingVector18.x;
                  workingVector18.x = workingVector18.x + workingVector16.y;
                  workingVector16.y = workingVector7.w ? workingVector17.w : workingVector18.x;
                  workingVector17.y = (int)workingVector17.y + 1;
                }
                workingVector15.zw = workingVector16.wy;
                workingVector16.x = (int)workingVector16.x + 1;
              }
              workingVector11.w = (int)workingVector13.w * (int)workingVector13.w;
              workingVector11.w = (int)workingVector11.w;
              workingVector16.xz = workingVector15.zw / workingVector11.ww;
              workingVector15.xy = min(workingVector16.xz, workingVector15.xy);
              workingVector10.w = workingVector9.w;
            } else {
              workingVector10.w = (int)workingVector10.w + 1;
            }
          }
          workingVector14.xy = workingVector15.xy;
          workingVector14.z = workingVector10.w;
          workingVector8.w = (int)workingVector8.w + 1;
        }
        workingVector6.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
        if (workingVector6.w != 0) {
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector13.yyy;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector13.xxx + workingVector15.xyz;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector13.zzz + workingVector15.xyz;
          workingVector15.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector15.xyz;
          workingVector16.xy = workingVector15.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector16.z = 1 + -workingVector16.y;
          workingVector14.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector16.xz;
          workingVector15.xy = RD_COMPARISON_MASK(workingVector14.zw >= float2(0,0));
          workingVector16.xy = RD_COMPARISON_MASK(workingVector14.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector6.w = workingVector15.x ? workingVector16.x : 0;
          workingVector6.w = workingVector15.y ? workingVector6.w : 0;
          workingVector6.w = workingVector16.y ? workingVector6.w : 0;
          if (workingVector6.w != 0) {
            workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
            workingVector6.w = min(1, workingVector6.w);
            workingVector8.w = -workingVector6.w * workingVector6.w + 1;
            workingVector8.w = sqrt(workingVector8.w);
            workingVector6.w = workingVector8.w / workingVector6.w;
            workingVector6.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector6.w + fragmentVectorConstants1[workingVector10.w+49].y;
            workingVector6.w = workingVector15.z + -workingVector6.w;
            workingVector6.w = min(1, workingVector6.w);
            workingVector15.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
            workingVector8.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector16.z = 1 + workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector9.w = 0;
            workingVector10.w = 0;
            while (true) {
              workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector15.x);
              if (workingVector11.w != 0) break;
              workingVector11.w = (int)workingVector8.w + (int)workingVector10.w;
              workingVector11.w = (int)workingVector11.w;
              workingVector17.y = 0.5 + workingVector11.w;
              workingVector11.w = workingVector9.w;
              workingVector12.w = 0;
              while (true) {
                workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector15.x);
                if (workingVector13.w != 0) break;
                workingVector13.w = (int)workingVector8.w + (int)workingVector12.w;
                workingVector13.w = (int)workingVector13.w;
                workingVector17.x = 0.5 + workingVector13.w;
                workingVector15.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector17.xy;
                workingVector16.xy = workingVector15.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector14.zw;
                if (workingVector7.w != 0) {
                  workingVector13.w = materialTexture8.SampleLevel(textureSampler8, workingVector16.xyz, 0).x;
                  workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector6.w);
                  workingVector13.w = workingVector13.w ? 1.000000 : 0;
                  workingVector11.w = workingVector13.w + workingVector11.w;
                } else {
                  workingVector18.xyzw = materialTexture8.Gather(textureSampler8, workingVector16.xyz).xyzw;
                  workingVector15.zw = workingVector16.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector15.zw = frac(workingVector15.zw);
                  workingVector18.xyzw = RD_COMPARISON_MASK(workingVector18.xyzw >= workingVector6.wwww);
                  workingVector19.xyzw = workingVector18.xyzw ? float4(1,1,1,1) : 0;
                  workingVector16.xy = workingVector18.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector16.xy = workingVector19.zy + workingVector16.xy;
                  workingVector16.xy = workingVector15.zz * workingVector16.xy + workingVector19.wx;
                  workingVector13.w = workingVector16.y + -workingVector16.x;
                  workingVector13.w = workingVector15.w * workingVector13.w + workingVector16.x;
                  workingVector11.w = workingVector13.w + workingVector11.w;
                }
                workingVector12.w = (int)workingVector12.w + 1;
              }
              workingVector9.w = workingVector11.w;
              workingVector10.w = (int)workingVector10.w + 1;
            }
            workingVector6.w = workingVector9.w / workingVector15.y;
          } else {
            workingVector6.w = 1;
          }
        } else {
          workingVector6.w = 1;
        }
        workingVector8.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector8.w = RD_COMPARISON_MASK(0 < (int)workingVector8.w);
        workingVector9.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector9.w = RD_COMPARISON_MASK(0 < (int)workingVector9.w);
        workingVector8.w = workingVector8.w ? workingVector9.w : 0;
        if (workingVector8.w != 0) {
          workingVector15.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector13.yyyy;
          workingVector15.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector13.xxxx + workingVector15.xyzw;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector13.zzzz + workingVector15.xyzw;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector13.xyzw;
          workingVector13.xyzw = workingVector13.xyzw / workingVector13.wwww;
          workingVector5.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
          workingVector5.w = min(1, workingVector5.w);
          workingVector8.w = -workingVector5.w * workingVector5.w + 1;
          workingVector8.w = sqrt(workingVector8.w);
          workingVector5.w = workingVector8.w / workingVector5.w;
          workingVector5.w = fragmentVectorConstants1[workingVector10.w+49].z * workingVector5.w + fragmentVectorConstants1[workingVector10.w+49].y;
          workingVector5.w = workingVector5.w / workingVector13.w;
          workingVector5.w = workingVector13.z + -workingVector5.w;
          workingVector13.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector13.z = 1 + -workingVector13.y;
          workingVector8.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector8.w = (int)workingVector8.w;
          workingVector8.w = max(1, (int)workingVector8.w);
          workingVector8.w = min(9, (int)workingVector8.w);
          workingVector8.w = workingVector7.w ? 1 : workingVector8.w;
          workingVector9.w = (uint)workingVector8.w >> 1;
          workingVector15.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector10.w = 0;
          workingVector11.w = 0;
          while (true) {
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector8.w);
            if (workingVector12.w != 0) break;
            workingVector12.w = (int)-workingVector9.w + (int)workingVector11.w;
            workingVector12.w = (int)workingVector12.w;
            workingVector16.y = 0.5 + workingVector12.w;
            workingVector12.w = workingVector10.w;
            workingVector13.y = 0;
            while (true) {
              workingVector13.w = RD_COMPARISON_MASK((int)workingVector13.y >= (int)workingVector8.w);
              if (workingVector13.w != 0) break;
              workingVector13.w = (int)-workingVector9.w + (int)workingVector13.y;
              workingVector13.w = (int)workingVector13.w;
              workingVector16.x = 0.5 + workingVector13.w;
              workingVector14.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector16.xy;
              workingVector14.zw = fragmentVectorConstants1[workingVector10.w+49].xx * workingVector14.zw;
              workingVector15.xy = workingVector13.xz * fragmentVectorConstants1[workingVector10.w+49].xx + workingVector14.zw;
              if (workingVector7.w != 0) {
                workingVector13.w = materialTexture8.SampleLevel(textureSampler8, workingVector15.xyz, 0).x;
                workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector5.w);
                workingVector13.w = workingVector13.w ? 1.000000 : 0;
                workingVector12.w = workingVector13.w + workingVector12.w;
              } else {
                workingVector17.xyzw = materialTexture8.Gather(textureSampler8, workingVector15.xyz).xyzw;
                workingVector14.zw = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector14.zw = frac(workingVector14.zw);
                workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector5.wwww);
                workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                workingVector15.xy = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector15.xy = workingVector18.zy + workingVector15.xy;
                workingVector15.xy = workingVector14.zz * workingVector15.xy + workingVector18.wx;
                workingVector13.w = workingVector15.y + -workingVector15.x;
                workingVector13.w = workingVector14.w * workingVector13.w + workingVector15.x;
                workingVector12.w = workingVector13.w + workingVector12.w;
              }
              workingVector13.y = (int)workingVector13.y + 1;
            }
            workingVector10.w = workingVector12.w;
            workingVector11.w = (int)workingVector11.w + 1;
          }
          workingVector5.w = (int)workingVector8.w * (int)workingVector8.w;
          workingVector5.w = (int)workingVector5.w;
          workingVector5.w = workingVector10.w / workingVector5.w;
          workingVector7.w = RD_COMPARISON_MASK(workingVector5.w < 1);
          workingVector8.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector5.w = max(workingVector8.w, workingVector5.w);
          workingVector5.w = min(1, workingVector5.w);
          workingVector5.w = workingVector7.w ? workingVector5.w : 1;
        } else {
          workingVector5.w = 1;
        }
        workingVector5.w = min(workingVector6.w, workingVector5.w);
        workingVector5.w = min(workingVector14.y, workingVector5.w);
        workingVector6.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector6.w = min(8, workingVector6.w);
        workingVector6.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
        workingVector6.w = max(0, workingVector6.w);
        workingVector7.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector6.w;
        workingVector6.w = -workingVector6.w + -workingVector4.z;
        workingVector7.w = 1 / workingVector7.w;
        workingVector6.w = saturate(workingVector7.w * workingVector6.w);
        workingVector7.w = workingVector6.w * -2 + 3;
        workingVector6.w = workingVector6.w * workingVector6.w;
        workingVector6.w = workingVector7.w * workingVector6.w;
        workingVector7.w = 1 + -workingVector5.w;
        workingVector5.w = workingVector6.w * workingVector7.w + workingVector5.w;
      } else {
        workingVector5.w = 1;
        workingVector14.x = 1;
      }
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector13.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector13.xyz;
      workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector13.xyz;
      workingVector6.w = dot(workingVector13.xyz, workingVector13.xyz);
      workingVector6.w = rsqrt(workingVector6.w);
      workingVector14.yzw = workingVector13.xyz * workingVector6.www;
      workingVector15.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector15.xyz = workingVector15.xyz * workingVector3.www;
      workingVector15.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector15.xyz;
      workingVector3.w = dot(workingVector7.xyz, workingVector14.yzw);
      workingVector7.w = max(0, workingVector3.w);
      workingVector8.w = dot(workingVector7.xyz, -workingVector12.xyz);
      workingVector8.w = max(0, workingVector8.w);
      workingVector3.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector3.w;
      workingVector9.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
      workingVector9.w = workingVector9.w * workingVector9.w;
      workingVector3.w = workingVector3.w / workingVector9.w;
      workingVector3.w = max(0, workingVector3.w);
      workingVector3.w = workingVector3.w + -workingVector7.w;
      workingVector3.w = workingVector0.w * workingVector3.w + workingVector7.w;
      workingVector10.w = dot(-workingVector7.xyz, workingVector14.yzw);
      workingVector10.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector10.w;
      workingVector9.w = workingVector10.w / workingVector9.w;
      workingVector9.w = max(0, workingVector9.w);
      workingVector0.w = workingVector9.w * workingVector0.w;
      workingVector13.xyz = workingVector13.xyz * workingVector6.www + -workingVector12.xyz;
      workingVector6.w = dot(workingVector13.xyz, workingVector13.xyz);
      workingVector6.w = rsqrt(workingVector6.w);
      workingVector13.xyz = workingVector13.xyz * workingVector6.www;
      workingVector6.w = max(0.0500000007, workingVector3.z);
      workingVector6.w = workingVector6.w * workingVector6.w;
      workingVector9.w = workingVector6.w * workingVector6.w;
      workingVector10.w = dot(workingVector7.xyz, workingVector13.xyz);
      workingVector10.w = max(0, workingVector10.w);
      workingVector11.w = workingVector6.w * workingVector6.w + -1;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector10.w = workingVector10.w * workingVector11.w + 1;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector10.w = 3.14159274 * workingVector10.w;
      workingVector9.w = workingVector9.w / workingVector10.w;
      workingVector10.w = 0.5 * workingVector6.w;
      workingVector6.w = -workingVector6.w * 0.5 + 1;
      workingVector11.w = workingVector8.w * workingVector6.w + workingVector10.w;
      workingVector11.w = 9.99999975e-005 + workingVector11.w;
      workingVector11.w = workingVector8.w / workingVector11.w;
      workingVector6.w = workingVector7.w * workingVector6.w + workingVector10.w;
      workingVector6.w = 9.99999975e-005 + workingVector6.w;
      workingVector6.w = workingVector7.w / workingVector6.w;
      workingVector6.w = workingVector11.w * workingVector6.w;
      workingVector10.w = dot(-workingVector12.xyz, workingVector13.xyz);
      workingVector10.w = max(0, workingVector10.w);
      workingVector12.xyz = float3(1,1,1) + -workingVector11.xyz;
      workingVector10.w = 1 + -workingVector10.w;
      workingVector10.w = max(0, workingVector10.w);
      workingVector11.w = workingVector10.w * workingVector10.w;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector10.w = workingVector11.w * workingVector10.w;
      workingVector12.xyz = workingVector12.xyz * workingVector10.www + workingVector11.xyz;
      workingVector13.xyz = workingVector2.xxx * workingVector0.xyz;
      workingVector14.yzw = float3(1,1,1) + -workingVector12.xyz;
      workingVector14.yzw = workingVector14.yzw * workingVector3.www;
      workingVector13.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector13.xyz;
      workingVector14.yzw = workingVector14.yzw * workingVector13.xyz;
      workingVector13.xyz = workingVector13.xyz * workingVector0.www;
      workingVector12.xyz = workingVector12.xyz * workingVector9.www;
      workingVector12.xyz = workingVector12.xyz * workingVector6.www;
      workingVector0.w = workingVector8.w * workingVector7.w;
      workingVector0.w = workingVector0.w * 4 + 9.99999975e-005;
      workingVector12.xyz = workingVector12.xyz / workingVector0.www;
      workingVector12.xyz = workingVector12.xyz * workingVector7.www;
      workingVector13.xyz = workingVector13.xyz * workingVector14.xxx;
      workingVector13.xyz = workingVector14.yzw * workingVector5.www + workingVector13.xyz;
      workingVector13.xyz = workingVector13.xyz * workingVector15.xyz;
      workingVector13.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector13.xyz;
      workingVector12.xyz = workingVector12.xyz * workingVector5.www;
      workingVector12.xyz = workingVector12.xyz * workingVector15.xyz;
      workingVector12.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector12.xyz;
    } else {
      workingVector13.xyz = float3(0,0,0);
      workingVector12.xyz = float3(0,0,0);
    }
    workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    if (workingVector0.w != 0) {
      workingVector8.xyz = float3(-0.5,-0.5,-0.5) + workingVector8.xyz;
      workingVector8.xyz = workingVector6.xyz * float3(0.200000003,0.200000003,0.200000003) + workingVector8.xyz;
      workingVector14.xyz = floor(workingVector8.xyz);
      workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xyz;
      workingVector14.xyz = floor(workingVector14.xyz);
      workingVector14.xyz = (int3)workingVector14.xyz;
      bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector0.w = (((uint)workingVector14.y << 16) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
      workingVector3.w = (int)workingVector14.z & 0x0000ffff;
      workingVector14.xyz = (int3)workingVector14.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector15.xyz = (uint3)workingVector14.xyz >> int3(24,24,24);
      workingVector14.xyz = (int3)workingVector14.xyz ^ (int3)workingVector15.xyz;
      workingVector14.xyz = (int3)workingVector14.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector5.w = (int)workingVector14.x ^ 0x88b16480;
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
      workingVector5.w = (int)workingVector14.y ^ (int)workingVector5.w;
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
      workingVector5.w = (int)workingVector14.z ^ (int)workingVector5.w;
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
      workingVector5.w = (int)workingVector5.w ^ 0;
      workingVector6.w = (uint)workingVector5.w >> 13;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
      workingVector6.w = (uint)workingVector5.w >> 15;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector6.w = (uint)workingVector5.w >> 16;
      workingVector5.w = (int)workingVector5.w ^ (int)workingVector6.w;
      workingVector5.w = (int)workingVector5.w & 0x0000ffff;
      workingVector6.w = workingVector5.w ? 0 : 1;
      workingVector5.w = (int)workingVector5.w | (int)workingVector6.w;
      workingVector6.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
      workingVector6.w = (int)workingVector6.w + -1;
      workingVector7.w = (int)workingVector5.w & (int)workingVector6.w;
      workingVector14.x = workingVector7.w;
      workingVector14.yzw = float3(0,0,0);
      while (true) {
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector14.y >= 8);
        if (workingVector8.w != 0) break;
        workingVector15.x = sampledResource10[workingVector14.x].val[0/4];
        workingVector15.y = sampledResource10[workingVector14.x].val[0/4+1];
        workingVector15.z = sampledResource10[workingVector14.x].val[0/4+2];
        workingVector15.w = sampledResource10[workingVector14.x].val[0/4+3];
        workingVector8.w = (int)workingVector15.z & 0x0000ffff;
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
        workingVector8.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector8.w);
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector0.w == (int)workingVector15.x);
        workingVector8.w = workingVector8.w ? workingVector10.w : 0;
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector3.w == (int)workingVector15.y);
        workingVector8.w = workingVector8.w ? workingVector10.w : 0;
        workingVector10.w = workingVector8.w ? workingVector15.w : workingVector14.z;
        workingVector15.x = workingVector14.w ? workingVector14.z : workingVector10.w;
        workingVector15.y = (int)workingVector8.w | (int)workingVector14.w;
        workingVector8.w = (int)workingVector14.x + 1;
        workingVector14.x = (int)workingVector6.w & (int)workingVector8.w;
        workingVector8.w = (int)workingVector9.w | (int)workingVector15.y;
        if (workingVector8.w != 0) {
          workingVector14.zw = workingVector15.xy;
          break;
        }
        workingVector14.y = (int)workingVector14.y + 1;
        workingVector14.zw = workingVector15.xy;
      }
      if (workingVector14.w != 0) {
        workingVector14.xyw = float3(0.0625,0.0625,0.0625) * workingVector8.xyz;
        workingVector14.xyw = floor(workingVector14.xyw);
        workingVector8.xyz = -workingVector14.xyw * float3(16,16,16) + workingVector8.xyz;
        workingVector0.w = (uint)workingVector14.z >> 2;
        workingVector15.xyz = RD_COMPARISON_MASK(abs(workingVector6.xyz) >= float3(1,1,1));
        workingVector3.w = (int)workingVector15.y | (int)workingVector15.x;
        workingVector3.w = (int)workingVector15.z | (int)workingVector3.w;
        if (workingVector3.w != 0) {
          workingVector3.w = dot(workingVector8.xyz, abs(workingVector6.xyz));
          workingVector5.w = dot(workingVector8.yzx, abs(workingVector6.xyz));
          workingVector6.w = dot(workingVector8.zxy, abs(workingVector6.xyz));
          workingVector7.w = workingVector6.x + workingVector6.y;
          workingVector2.z = workingVector2.z * workingVector2.w + workingVector7.w;
          workingVector2.z = RD_COMPARISON_MASK(0 < workingVector2.z);
          workingVector2.w = ceil(workingVector3.w);
          workingVector3.w = floor(workingVector3.w);
          workingVector2.z = workingVector2.z ? workingVector2.w : workingVector3.w;
          workingVector2.w = floor(workingVector5.w);
          workingVector3.w = floor(workingVector6.w);
          workingVector15.xyz = abs(workingVector6.zxy) * workingVector2.www;
          workingVector15.xyz = abs(workingVector6.xyz) * workingVector2.zzz + workingVector15.xyz;
          workingVector15.xyz = abs(workingVector6.yzx) * workingVector3.www + workingVector15.xyz;
          workingVector16.xyz = workingVector15.xyz + abs(workingVector6.zxy);
          workingVector17.xyz = workingVector15.xyz + abs(workingVector6.yzx);
          workingVector18.xyz = workingVector16.xyz + abs(workingVector6.yzx);
          workingVector2.z = workingVector5.w + -workingVector2.w;
          workingVector2.w = workingVector6.w + -workingVector3.w;
          workingVector3.w = 1 + -workingVector2.z;
          workingVector5.w = 1 + -workingVector2.w;
          workingVector6.w = workingVector5.w * workingVector3.w;
          workingVector5.w = workingVector5.w * workingVector2.z;
          workingVector3.w = workingVector3.w * workingVector2.w;
          workingVector2.z = workingVector2.z * workingVector2.w;
          workingVector19.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(0,0,0));
          workingVector2.w = workingVector19.y ? workingVector19.x : 0;
          workingVector2.w = workingVector19.z ? workingVector2.w : 0;
          workingVector19.xyz = RD_COMPARISON_MASK(workingVector18.xyz < float3(16,16,16));
          workingVector7.w = workingVector19.y ? workingVector19.x : 0;
          workingVector7.w = workingVector19.z ? workingVector7.w : 0;
          workingVector2.w = (int)workingVector2.w & (int)workingVector7.w;
          if (workingVector2.w != 0) {
            workingVector19.xyz = (uint3)workingVector15.xyz;
            workingVector20.xyz = (uint3)workingVector16.xyz;
            workingVector21.xyz = (uint3)workingVector17.xyz;
            workingVector22.xyz = (uint3)workingVector18.xyz;
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector2.w = (int)workingVector19.x + (int)workingVector19.y;
            workingVector2.w = (int)workingVector19.z + (int)workingVector2.w;
            workingVector2.w = (int)workingVector0.w + (int)workingVector2.w;
            workingVector19.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector19.yzw = workingVector23.xyz * workingVector23.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector2.w = (int)workingVector20.x + (int)workingVector20.y;
            workingVector2.w = (int)workingVector20.z + (int)workingVector2.w;
            workingVector2.w = (int)workingVector0.w + (int)workingVector2.w;
            workingVector20.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector20.yzw = workingVector23.xyz * workingVector23.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
            workingVector21.xz = (uint2)workingVector21.zx << int2(4,8);
            workingVector2.w = (int)workingVector21.x + (int)workingVector21.y;
            workingVector2.w = (int)workingVector21.z + (int)workingVector2.w;
            workingVector2.w = (int)workingVector0.w + (int)workingVector2.w;
            workingVector21.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector21.yzw = workingVector23.xyz * workingVector23.www;
            workingVector21.yzw = float3(6,6,6) * workingVector21.yzw;
            workingVector21.xyz = workingVector21.xxx ? workingVector21.yzw : float3(0,0,0);
            workingVector22.xz = (uint2)workingVector22.zx << int2(4,8);
            workingVector2.w = (int)workingVector22.x + (int)workingVector22.y;
            workingVector2.w = (int)workingVector22.z + (int)workingVector2.w;
            workingVector2.w = (int)workingVector0.w + (int)workingVector2.w;
            workingVector22.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector22.yzw = workingVector23.xyz * workingVector23.www;
            workingVector22.yzw = float3(6,6,6) * workingVector22.yzw;
            workingVector22.xyz = workingVector22.xxx ? workingVector22.yzw : float3(0,0,0);
          } else {
            workingVector23.xyz = workingVector14.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector25.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector25.x = (((uint)workingVector25.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector25.y = (((uint)workingVector25.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector25.z = (((uint)workingVector25.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.w = (((uint)workingVector24.x << 0) & bitMask.w) | ((uint)workingVector25.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.w = (int)workingVector2.w + (int)workingVector24.x;
            workingVector2.w = (int)workingVector25.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector24.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector25.z + (int)workingVector2.w;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.w+4].x < 0);
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector8.w = (int)workingVector15.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector15.xy = (int2)workingVector0.ww + int2(4096,4097);
            workingVector9.w = sampledResource12[workingVector15.x].val[0/4];
            workingVector10.w = 1 << (int)icb[workingVector2.w+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.w = (int)workingVector15.y + (int)icb[workingVector2.w+4].x;
            workingVector2.w = sampledResource12[workingVector2.w].val[0/4];
            workingVector2.w = (uint)workingVector2.w >> 2;
            workingVector15.xzw = float3(0.0625,0.0625,0.0625) * workingVector23.xyz;
            workingVector15.xzw = floor(workingVector15.xzw);
            workingVector15.xzw = -workingVector15.xzw * float3(16,16,16) + workingVector23.xyz;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector11.w = (int)workingVector15.w + (int)workingVector11.w;
            workingVector2.w = (int)workingVector2.w + (int)workingVector11.w;
            workingVector2.w = workingVector7.w ? workingVector8.w : workingVector2.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector23.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector23.yzw = (uint3)workingVector23.xxx >> int3(8,16,24);
            workingVector24.xyzw = (int4)workingVector23.xyzw & int4(255,255,255,255);
            workingVector24.xyzw = (uint4)workingVector24.xyzw;
            workingVector24.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector24.xyzw;
            workingVector15.xzw = workingVector24.xyz * workingVector24.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector23.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector7.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector14.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.w = (((uint)workingVector23.x << 0) & bitMask.w) | ((uint)workingVector24.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.w = (int)workingVector2.w + (int)workingVector23.x;
            workingVector2.w = (int)workingVector24.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector23.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector24.z + (int)workingVector2.w;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.w+4].x < 0);
            workingVector16.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector16.y << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector8.w = (int)workingVector16.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector10.w = 1 << (int)icb[workingVector2.w+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.w = (int)workingVector15.y + (int)icb[workingVector2.w+4].x;
            workingVector2.w = sampledResource12[workingVector2.w].val[0/4];
            workingVector2.w = (uint)workingVector2.w >> 2;
            workingVector16.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
            workingVector16.xyz = floor(workingVector16.xyz);
            workingVector15.xzw = -workingVector16.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector11.w = (int)workingVector15.w + (int)workingVector11.w;
            workingVector2.w = (int)workingVector2.w + (int)workingVector11.w;
            workingVector2.w = workingVector7.w ? workingVector8.w : workingVector2.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector16.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector15.xzw = workingVector23.xyz * workingVector23.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector16.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector20.xyz = workingVector7.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector14.xyw * float3(16,16,16) + workingVector17.xyz;
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector17.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.w = (((uint)workingVector16.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.w = (int)workingVector2.w + (int)workingVector16.x;
            workingVector2.w = (int)workingVector23.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector16.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector23.z + (int)workingVector2.w;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.w+4].x < 0);
            workingVector16.xyz = (uint3)workingVector17.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector16.y << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector8.w = (int)workingVector16.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector10.w = 1 << (int)icb[workingVector2.w+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.w = (int)workingVector15.y + (int)icb[workingVector2.w+4].x;
            workingVector2.w = sampledResource12[workingVector2.w].val[0/4];
            workingVector2.w = (uint)workingVector2.w >> 2;
            workingVector16.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
            workingVector16.xyz = floor(workingVector16.xyz);
            workingVector15.xzw = -workingVector16.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector11.w = (int)workingVector15.w + (int)workingVector11.w;
            workingVector2.w = (int)workingVector2.w + (int)workingVector11.w;
            workingVector2.w = workingVector7.w ? workingVector8.w : workingVector2.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector16.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector17.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector17.xyzw = (uint4)workingVector17.xyzw;
            workingVector17.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector17.xyzw;
            workingVector15.xzw = workingVector17.xyz * workingVector17.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector16.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector21.xyz = workingVector7.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector14.xyw * float3(16,16,16) + workingVector18.xyz;
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector18.xyz < float3(0,0,0));
            workingVector17.xyz = RD_COMPARISON_MASK(workingVector18.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector17.x = (((uint)workingVector17.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector17.y = (((uint)workingVector17.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector17.z = (((uint)workingVector17.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.w = (((uint)workingVector16.x << 0) & bitMask.w) | ((uint)workingVector17.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.w = (int)workingVector2.w + (int)workingVector16.x;
            workingVector2.w = (int)workingVector17.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector16.y + (int)workingVector2.w;
            workingVector2.w = (int)workingVector17.z + (int)workingVector2.w;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.w+4].x < 0);
            workingVector16.xyz = (uint3)workingVector18.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector16.y << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector8.w = (int)workingVector16.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector10.w = 1 << (int)icb[workingVector2.w+4].x;
            workingVector9.w = workingVector9.w ? workingVector10.w : 0;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
            workingVector2.w = (int)workingVector15.y + (int)icb[workingVector2.w+4].x;
            workingVector2.w = sampledResource12[workingVector2.w].val[0/4];
            workingVector2.w = (uint)workingVector2.w >> 2;
            workingVector16.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
            workingVector16.xyz = floor(workingVector16.xyz);
            workingVector15.xyz = -workingVector16.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.z + (int)workingVector10.w;
            workingVector2.w = (int)workingVector2.w + (int)workingVector10.w;
            workingVector2.w = workingVector7.w ? workingVector8.w : workingVector2.w;
            workingVector7.w = workingVector7.w ? 0 : workingVector9.w;
            workingVector15.x = sampledResource12[workingVector2.w].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector16.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
            workingVector16.xyzw = (uint4)workingVector16.xyzw;
            workingVector16.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector16.xyzw;
            workingVector15.yzw = workingVector16.xyz * workingVector16.www;
            workingVector15.yzw = float3(6,6,6) * workingVector15.yzw;
            workingVector15.xyz = workingVector15.xxx ? workingVector15.yzw : float3(0,0,0);
            workingVector22.xyz = workingVector7.www ? float3(0,0,0) : workingVector15.xyz;
          }
          workingVector15.xyz = workingVector20.xyz * workingVector5.www;
          workingVector15.xyz = workingVector19.xyz * workingVector6.www + workingVector15.xyz;
          workingVector15.xyz = workingVector21.xyz * workingVector3.www + workingVector15.xyz;
          workingVector15.xyz = workingVector22.xyz * workingVector2.zzz + workingVector15.xyz;
        } else {
          workingVector16.xyz = floor(workingVector8.xyz);
          workingVector8.xyz = -workingVector16.xyz + workingVector8.xyz;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector8.xyx >= workingVector8.yzz);
          bitMask.z = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector2.z = (((uint)workingVector17.y << 1) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector2.w = (((uint)workingVector17.z << 2) & bitMask.w) | ((uint)0 & ~bitMask.w);
          bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector17.x << 0) & bitMask.z) | ((uint)workingVector2.z & ~bitMask.z);
          workingVector2.z = (int)workingVector2.w + (int)workingVector2.z;
          workingVector2.w = min(workingVector8.x, workingVector8.y);
          workingVector3.w = max(workingVector8.x, workingVector8.y);
          workingVector5.w = min(workingVector2.w, workingVector8.z);
          workingVector6.w = max(workingVector3.w, workingVector8.z);
          workingVector3.w = min(workingVector3.w, workingVector8.z);
          workingVector2.w = max(workingVector3.w, workingVector2.w);
          workingVector3.w = 1 + -workingVector6.w;
          workingVector6.w = workingVector6.w + -workingVector2.w;
          workingVector2.w = workingVector2.w + -workingVector5.w;
          workingVector8.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(0,0,0));
          workingVector7.w = workingVector8.y ? workingVector8.x : 0;
          workingVector7.w = workingVector8.z ? workingVector7.w : 0;
          workingVector8.xyz = float3(1,1,1) + workingVector16.xyz;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector8.xyz < float3(16,16,16));
          workingVector8.w = workingVector17.y ? workingVector17.x : 0;
          workingVector8.w = workingVector17.z ? workingVector8.w : 0;
          workingVector7.w = (int)workingVector7.w & (int)workingVector8.w;
          if (workingVector7.w != 0) {
            workingVector17.xyz = (uint3)workingVector16.xyz;
            workingVector18.xy = RD_COMPARISON_MASK((uint2)workingVector2.zz < int2(2,6));
            workingVector18.xz = workingVector18.xy ? float2(0,0) : 0;
            workingVector18.yw = icb[workingVector2.z+4].yz;
            workingVector19.xyz = (int3)workingVector17.xyz + (int3)workingVector18.ywx;
            workingVector18.xy = icb[workingVector2.z+12].yz;
            workingVector18.xyz = (int3)workingVector17.xyz + (int3)workingVector18.xyz;
            workingVector20.xyz = (int3)workingVector17.xyz + int3(1,1,1);
            workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
            workingVector7.w = (int)workingVector17.x + (int)workingVector17.y;
            workingVector7.w = (int)workingVector17.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector17.x = sampledResource12[workingVector7.w].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector17.yzw = workingVector21.xyz * workingVector21.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector7.w = (int)workingVector19.x + (int)workingVector19.y;
            workingVector7.w = (int)workingVector19.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector19.x = sampledResource12[workingVector7.w].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector19.yzw = workingVector21.xyz * workingVector21.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector7.w = (int)workingVector18.x + (int)workingVector18.y;
            workingVector7.w = (int)workingVector18.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector18.x = sampledResource12[workingVector7.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector18.yzw = workingVector21.xyz * workingVector21.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector7.w = (int)workingVector20.x + (int)workingVector20.y;
            workingVector7.w = (int)workingVector20.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector20.x = sampledResource12[workingVector7.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector20.yzw = workingVector21.xyz * workingVector21.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
          } else {
            workingVector21.xy = RD_COMPARISON_MASK((uint2)workingVector2.zz < int2(2,6));
            workingVector21.xy = workingVector21.xy ? float2(0,0) : 0;
            workingVector22.xy = (uint2)icb[workingVector2.z+4].yz;
            workingVector22.z = (uint)workingVector21.x;
            workingVector21.xzw = workingVector22.xyz + workingVector16.xyz;
            workingVector22.xy = (uint2)icb[workingVector2.z+12].yz;
            workingVector22.z = (uint)workingVector21.y;
            workingVector22.xyz = workingVector22.xyz + workingVector16.xyz;
            workingVector23.xyz = workingVector14.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
            workingVector25.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector25.x = (((uint)workingVector25.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector25.y = (((uint)workingVector25.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector25.z = (((uint)workingVector25.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector24.x << 0) & bitMask.z) | ((uint)workingVector25.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector24.x;
            workingVector2.z = (int)workingVector25.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector24.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector25.z + (int)workingVector2.z;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector16.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector16.y << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector8.w = (int)workingVector16.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector16.xy = (int2)workingVector0.ww + int2(4096,4097);
            workingVector9.w = sampledResource12[workingVector16.x].val[0/4];
            workingVector10.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.z = (int)workingVector16.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector16.xzw = float3(0.0625,0.0625,0.0625) * workingVector23.xyz;
            workingVector16.xzw = floor(workingVector16.xzw);
            workingVector16.xzw = -workingVector16.xzw * float3(16,16,16) + workingVector23.xyz;
            workingVector16.xzw = (uint3)workingVector16.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.w = (((uint)workingVector16.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector16.z << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector11.w = (int)workingVector16.w + (int)workingVector11.w;
            workingVector2.z = (int)workingVector2.z + (int)workingVector11.w;
            workingVector2.z = workingVector7.w ? workingVector8.w : workingVector2.z;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector23.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector23.yzw = (uint3)workingVector23.xxx >> int3(8,16,24);
            workingVector24.xyzw = (int4)workingVector23.xyzw & int4(255,255,255,255);
            workingVector24.xyzw = (uint4)workingVector24.xyzw;
            workingVector24.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector24.xyzw;
            workingVector16.xzw = workingVector24.xyz * workingVector24.www;
            workingVector16.xzw = float3(6,6,6) * workingVector16.xzw;
            workingVector16.xzw = workingVector23.xxx ? workingVector16.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector7.www ? float3(0,0,0) : workingVector16.xzw;
            workingVector16.xzw = workingVector14.xyw * float3(16,16,16) + workingVector21.xzw;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector21.xzw < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector21.xzw >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector23.x << 0) & bitMask.z) | ((uint)workingVector24.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector23.x;
            workingVector2.z = (int)workingVector24.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector23.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector24.z + (int)workingVector2.z;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector21.xyz = (uint3)workingVector21.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector21.y << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            workingVector8.w = (int)workingVector21.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector10.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.z = (int)workingVector16.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector21.xyz = float3(0.0625,0.0625,0.0625) * workingVector16.xzw;
            workingVector21.xyz = floor(workingVector21.xyz);
            workingVector16.xzw = -workingVector21.xyz * float3(16,16,16) + workingVector16.xzw;
            workingVector16.xzw = (uint3)workingVector16.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.w = (((uint)workingVector16.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector16.z << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector11.w = (int)workingVector16.w + (int)workingVector11.w;
            workingVector2.z = (int)workingVector2.z + (int)workingVector11.w;
            workingVector2.z = workingVector7.w ? workingVector8.w : workingVector2.z;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector21.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector16.xzw = workingVector23.xyz * workingVector23.www;
            workingVector16.xzw = float3(6,6,6) * workingVector16.xzw;
            workingVector16.xzw = workingVector21.xxx ? workingVector16.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector7.www ? float3(0,0,0) : workingVector16.xzw;
            workingVector16.xzw = workingVector14.xyw * float3(16,16,16) + workingVector22.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector22.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector22.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector21.x << 0) & bitMask.z) | ((uint)workingVector23.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector21.x;
            workingVector2.z = (int)workingVector23.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector21.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector23.z + (int)workingVector2.z;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector21.xyz = (uint3)workingVector22.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector21.y << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            workingVector8.w = (int)workingVector21.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector0.w + (int)workingVector8.w;
            workingVector10.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector10.w = workingVector9.w ? workingVector10.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector2.z = (int)workingVector16.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector21.xyz = float3(0.0625,0.0625,0.0625) * workingVector16.xzw;
            workingVector21.xyz = floor(workingVector21.xyz);
            workingVector16.xzw = -workingVector21.xyz * float3(16,16,16) + workingVector16.xzw;
            workingVector16.xzw = (uint3)workingVector16.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector16.w = (((uint)workingVector16.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector16.z << 0) & bitMask.w) | ((uint)workingVector16.x & ~bitMask.w);
            workingVector11.w = (int)workingVector16.w + (int)workingVector11.w;
            workingVector2.z = (int)workingVector2.z + (int)workingVector11.w;
            workingVector2.z = workingVector7.w ? workingVector8.w : workingVector2.z;
            workingVector7.w = workingVector7.w ? 0 : workingVector10.w;
            workingVector21.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector16.xzw = workingVector22.xyz * workingVector22.www;
            workingVector16.xzw = float3(6,6,6) * workingVector16.xzw;
            workingVector16.xzw = workingVector21.xxx ? workingVector16.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector7.www ? float3(0,0,0) : workingVector16.xzw;
            workingVector14.xyz = workingVector14.xyw * float3(16,16,16) + workingVector8.xyz;
            workingVector16.xzw = RD_COMPARISON_MASK(workingVector8.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector8.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector16.x << 0) & bitMask.z) | ((uint)workingVector21.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.z << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.w << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            workingVector2.z = (int)workingVector2.z + (int)workingVector16.x;
            workingVector2.z = (int)workingVector21.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector16.z + (int)workingVector2.z;
            workingVector2.z = (int)workingVector21.z + (int)workingVector2.z;
            workingVector7.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector8.xyz = (uint3)workingVector8.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.z = (((uint)workingVector8.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.x = (((uint)workingVector8.y << 0) & bitMask.x) | ((uint)workingVector8.x & ~bitMask.x);
            workingVector8.x = (int)workingVector8.z + (int)workingVector8.x;
            workingVector0.w = (int)workingVector0.w + (int)workingVector8.x;
            workingVector8.x = 1 << (int)icb[workingVector2.z+4].x;
            workingVector8.x = workingVector9.w ? workingVector8.x : 0;
            workingVector8.x = RD_COMPARISON_MASK((int)workingVector8.x == 0);
            workingVector2.z = (int)workingVector16.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector8.yzw = float3(0.0625,0.0625,0.0625) * workingVector14.xyz;
            workingVector8.yzw = floor(workingVector8.yzw);
            workingVector8.yzw = -workingVector8.yzw * float3(16,16,16) + workingVector14.xyz;
            workingVector8.yzw = (uint3)workingVector8.yzw;
            bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector8.w = (((uint)workingVector8.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.y = (((uint)workingVector8.z << 0) & bitMask.y) | ((uint)workingVector8.y & ~bitMask.y);
            workingVector8.y = (int)workingVector8.w + (int)workingVector8.y;
            workingVector2.z = (int)workingVector2.z + (int)workingVector8.y;
            workingVector0.w = workingVector7.w ? workingVector0.w : workingVector2.z;
            workingVector2.z = workingVector7.w ? 0 : workingVector8.x;
            workingVector8.x = sampledResource12[workingVector0.w].val[0/4];
            workingVector8.yzw = (uint3)workingVector8.xxx >> int3(8,16,24);
            workingVector14.xyzw = workingVector8.xyzw ? float4(0,0,0,0) : 0;
            workingVector14.xyzw = (uint4)workingVector14.xyzw;
            workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
            workingVector8.yzw = workingVector14.xyz * workingVector14.www;
            workingVector8.yzw = float3(6,6,6) * workingVector8.yzw;
            workingVector8.xyz = workingVector8.xxx ? workingVector8.yzw : float3(0,0,0);
            workingVector20.xyz = workingVector2.zzz ? float3(0,0,0) : workingVector8.xyz;
          }
          workingVector8.xyz = workingVector19.xyz * workingVector6.www;
          workingVector8.xyz = workingVector17.xyz * workingVector3.www + workingVector8.xyz;
          workingVector8.xyz = workingVector18.xyz * workingVector2.www + workingVector8.xyz;
          workingVector15.xyz = workingVector20.xyz * workingVector5.www + workingVector8.xyz;
        }
      } else {
        workingVector15.xyz = float3(0,0,0);
      }
    } else {
      workingVector15.xyz = workingVector10.xyz;
    }
    workingVector2.xzw = workingVector2.xxx * workingVector0.xyz;
    workingVector0.w = varyingTexCoord1.y * varyingTexCoord1.y;
    workingVector3.w = workingVector0.w * workingVector0.w;
    workingVector3.w = varyingTexCoord1.y * workingVector3.w;
    workingVector0.w = workingVector0.w * varyingTexCoord1.y + -workingVector3.w;
    workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector3.w;
    workingVector8.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector8.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
    workingVector8.xyz = workingVector15.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector8.xyz;
    workingVector14.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector8.xyz = max(workingVector14.xyz, workingVector8.xyz);
    workingVector2.xzw = workingVector8.xyz * workingVector2.xzw;
    workingVector2.xzw = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector2.xzw;
    workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector8.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector8.xyz + workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector0.xyz;
    workingVector0.xyz = workingVector0.xyz * workingVector3.yyy;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector0.xyz;
  } else {
    workingVector13.xyz = float3(0,0,0);
    workingVector12.xyz = float3(0,0,0);
    workingVector2.xzw = float3(0,0,0);
    workingVector0.xyz = float3(0,0,0);
  }
  workingVector2.xzw = workingVector2.xzw + workingVector13.xyz;
  workingVector2.xzw = workingVector2.xzw + workingVector12.xyz;
  workingVector0.xyz = workingVector2.xzw + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector2.xzw = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector3.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector3.y != 0) {
    workingVector5.w = workingVector4.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector5.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector5.w;
    workingVector5.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector5.w;
    workingVector5.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector5.w);
    workingVector6.w = RD_COMPARISON_MASK(0 < workingVector5.w);
    if (workingVector6.w != 0) {
      workingVector6.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector6.w != 0) {
        workingVector6.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector6.w = workingVector0.w ? workingVector6.w : 0;
        workingVector8.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector8.xyz = max(workingVector8.xyz, workingVector2.xzw);
        workingVector8.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector8.xyz;
        workingVector8.xyz = workingVector6.www ? workingVector8.xyz : 0;
        workingVector8.xyz = max(float3(1,1,1), workingVector8.xyz);
        workingVector8.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector8.xyz;
      } else {
        workingVector12.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
        workingVector6.w = dot(workingVector12.xyz, workingVector12.xyz);
        workingVector6.w = rsqrt(workingVector6.w);
        workingVector12.xzw = workingVector12.xyz * workingVector6.www;
        workingVector13.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector14.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector15.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector7.w = workingVector13.y + -workingVector13.x;
        workingVector6.w = workingVector12.y * workingVector6.w + -workingVector13.x;
        workingVector7.w = 1 / workingVector7.w;
        workingVector7.w = saturate(workingVector7.w * workingVector6.w);
        workingVector8.w = workingVector7.w * -2 + 3;
        workingVector7.w = workingVector7.w * workingVector7.w;
        workingVector7.w = -workingVector8.w * workingVector7.w + 1;
        workingVector8.w = workingVector7.w * workingVector7.w;
        workingVector7.w = workingVector8.w * workingVector7.w;
        workingVector8.w = dot(workingVector12.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector9.w = dot(workingVector12.xzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector10.w = workingVector8.w * workingVector8.w + 1;
        workingVector10.w = RD_UNIFORM_SUN_COLOR.w * workingVector10.w;
        workingVector11.w = workingVector9.w * workingVector9.w + 1;
        workingVector11.w = RD_UNIFORM_MOON_COLOR.w * workingVector11.w;
        workingVector11.w = 0.75 * workingVector11.w;
        workingVector12.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector13.x;
        workingVector12.x = 1 / workingVector12.x;
        workingVector6.w = saturate(workingVector12.x * workingVector6.w);
        workingVector12.x = workingVector6.w * -2 + 3;
        workingVector6.w = workingVector6.w * workingVector6.w;
        workingVector6.w = -workingVector12.x * workingVector6.w + 1;
        workingVector12.x = workingVector6.w * workingVector6.w;
        workingVector6.w = workingVector12.x * workingVector6.w;
        workingVector12.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = workingVector6.www * workingVector12.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector12.xyz;
        workingVector12.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector12.xyz;
        workingVector6.w = workingVector10.w * 0.75 + workingVector11.w;
        workingVector8.w = max(0, workingVector8.w);
        workingVector8.w = log2(workingVector8.w);
        workingVector8.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector8.w;
        workingVector8.w = exp2(workingVector8.w);
        workingVector8.w = min(1, workingVector8.w);
        workingVector9.w = max(0, workingVector9.w);
        workingVector9.w = log2(workingVector9.w);
        workingVector9.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector9.w;
        workingVector9.w = exp2(workingVector9.w);
        workingVector9.w = min(1, workingVector9.w);
        workingVector10.w = -workingVector8.w * 1.79999995 + 1.80999994;
        workingVector11.w = sqrt(workingVector10.w);
        workingVector10.w = workingVector11.w * workingVector10.w;
        workingVector10.w = 0.0361000001 / workingVector10.w;
        workingVector11.w = -workingVector9.w * 1.79999995 + 1.80999994;
        workingVector12.w = sqrt(workingVector11.w);
        workingVector11.w = workingVector12.w * workingVector11.w;
        workingVector11.w = 0.0361000001 / workingVector11.w;
        workingVector13.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector14.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector8.www;
        workingVector14.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector15.xyz;
        workingVector14.xyz = workingVector14.xyz * workingVector9.www;
        workingVector14.xyz = workingVector14.xyz * workingVector11.www;
        workingVector15.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector7.www;
        workingVector15.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector15.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector10.www + workingVector14.xyz;
        workingVector13.xyz = workingVector15.xyz * workingVector13.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector6.www + workingVector13.xyz;
        workingVector6.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector7.w = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, varyingTexCoord1.y);
        workingVector13.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector12.xyz;
        workingVector13.xyz = workingVector7.www * workingVector13.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector8.xyz = workingVector6.www ? workingVector13.xyz : workingVector12.xyz;
      }
    } else {
      workingVector8.xyz = float3(0,0,0);
    }
  } else {
    workingVector8.xyz = float3(0,0,0);
    workingVector5.w = 0;
  }
  workingVector8.xyz = workingVector8.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector5.www * workingVector8.xyz + workingVector0.xyz;
  if (workingVector3.w != 0) {
    workingVector8.xy = float2(1,1) + workingVector5.xy;
    workingVector8.xy = float2(0.5,0.5) * workingVector8.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector5.yy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector5.xx + workingVector12.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector5.zz + workingVector12.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector12.xy;
    workingVector5.w = -workingVector12.x / workingVector12.y;
    workingVector5.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector5.w;
    workingVector6.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector5.w = workingVector5.w / workingVector6.w;
    workingVector5.w = workingVector5.w * 53.5981483 + 1;
    workingVector5.w = log2(workingVector5.w);
    workingVector5.w = 0.173286796 * workingVector5.w;
    workingVector6.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector7.w = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector5.w = workingVector5.w * workingVector7.w + -0.5;
    workingVector7.w = (int)workingVector5.w;
    workingVector6.w = (int)workingVector6.w + -2;
    workingVector7.w = max(0, (int)workingVector7.w);
    workingVector6.w = min((int)workingVector7.w, (int)workingVector6.w);
    workingVector8.z = (int)workingVector6.w;
    workingVector5.w = saturate(-workingVector8.z + workingVector5.w);
    workingVector12.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector8.xyz, 0).xyzw;
    workingVector6.w = (int)workingVector6.w + 1;
    workingVector8.w = (int)workingVector6.w;
    workingVector8.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector8.xyw, 0).xyzw;
    workingVector8.xyzw = workingVector8.xyzw + -workingVector12.xyzw;
    workingVector8.xyzw = workingVector5.wwww * workingVector8.xyzw + workingVector12.xyzw;
  } else {
    workingVector8.xyzw = float4(0,0,0,1);
  }
  workingVector0.xyz = workingVector8.www * workingVector0.xyz + workingVector8.xyz;
  workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector5.w != 0) {
    workingVector5.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector5.w = max(1, workingVector5.w);
    workingVector6.w = varyingTexCoord1.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector5.w = saturate(workingVector6.w / workingVector5.w);
    workingVector6.w = workingVector5.w * workingVector5.w;
    workingVector5.w = workingVector6.w * workingVector5.w;
    workingVector5.w = RD_UNIFORM_IBL_PARAMETERS.x * workingVector5.w;
    workingVector6.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector7.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector9.yyy;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector9.xxx + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector9.zzz + workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector8.xyz;
    workingVector9.xyz = workingVector2.yyy ? workingVector9.xyz : varyingTexCoord3.xyz;
    workingVector4.xyz = workingVector2.yyy ? workingVector8.xyz : workingVector4.xyz;
    workingVector8.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector9.xyz;
    workingVector2.y = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector2.y = rsqrt(workingVector2.y);
    workingVector8.xyz = workingVector8.xyz * workingVector2.yyy;
    workingVector2.y = dot(workingVector4.xyz, workingVector4.xyz);
    workingVector2.y = rsqrt(workingVector2.y);
    workingVector4.xyz = workingVector4.xyz * workingVector2.yyy;
    workingVector2.y = dot(workingVector8.xyz, workingVector6.xyz);
    workingVector2.y = workingVector2.y + workingVector2.y;
    workingVector8.xyz = workingVector6.xyz * -workingVector2.yyy + workingVector8.xyz;
    workingVector2.y = RD_COMPARISON_MASK((int)workingVector7.w == 1);
    workingVector6.y = 1 + -workingVector3.z;
    workingVector3.z = workingVector6.y * workingVector6.y;
    workingVector6.z = -workingVector6.y * workingVector6.y + 1;
    workingVector7.w = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector6.z = workingVector7.w * workingVector6.z;
    workingVector3.z = workingVector3.z * workingVector3.z;
    workingVector3.z = -workingVector3.z * workingVector3.z + 1;
    workingVector3.z = workingVector3.z * workingVector7.w;
    workingVector2.y = workingVector2.y ? workingVector6.z : workingVector3.z;
    workingVector3.z = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector3.z = (int)workingVector3.z + 2;
    workingVector6.z = (int)workingVector3.z & 0x80000000;
    workingVector3.z = max((int)-workingVector3.z, (int)workingVector3.z);
    workingVector3.z = (uint)workingVector3.z % 3;
    workingVector7.w = -(int)workingVector3.z;
    workingVector3.z = workingVector6.z ? workingVector7.w : workingVector3.z;
    workingVector8.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
    workingVector9.xyz = materialTexture9.SampleLevel(textureSampler9, workingVector8.xyzw, workingVector2.y).xyz;
    workingVector8.w = (int)workingVector3.z;
    workingVector8.xyz = materialTexture9.SampleLevel(textureSampler9, workingVector8.xyzw, workingVector2.y).xyz;
    workingVector9.xyz = workingVector9.xyz + -workingVector8.xyz;
    workingVector8.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector9.xyz + workingVector8.xyz;
    workingVector9.xyz = float3(301.724121,301.724121,301.724121) * workingVector8.xyz;
    workingVector8.xyz = workingVector6.www ? workingVector9.xyz : workingVector8.xyz;
    workingVector8.xyz = workingVector8.xyz * workingVector5.www;
    workingVector8.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector8.xyz;
    workingVector9.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector10.xyz;
    workingVector10.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector9.xyz;
    workingVector2.y = saturate(dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003)));
    workingVector9.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector9.xyz + -workingVector2.xzw;
    workingVector2.xyz = workingVector2.yyy * workingVector9.xyz + workingVector2.xzw;
    workingVector2.xyz = workingVector2.xyz * workingVector3.xxx;
    workingVector2.w = dot(workingVector8.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector3.x = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector2.w = RD_COMPARISON_MASK(workingVector2.w < workingVector3.x);
    workingVector2.xyz = workingVector2.www ? workingVector2.xyz : 0;
    workingVector2.xyz = workingVector2.www ? workingVector2.xyz : workingVector8.xyz;
    workingVector2.xyz = workingVector0.www ? workingVector2.xyz : workingVector8.xyz;
    workingVector6.x = saturate(dot(workingVector7.xyz, -workingVector4.xyz));
    workingVector3.xz = materialTexture0.Sample(textureSampler0, workingVector6.xy).xy;
    workingVector4.xyz = workingVector11.xyz * workingVector3.xxx + workingVector3.zzz;
    workingVector2.xyz = workingVector4.xyz * workingVector2.xyz;
    workingVector0.w = workingVector4.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector0.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.w;
    workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
    workingVector2.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.w);
    workingVector2.w = 1 + -workingVector2.w;
    workingVector4.xyz = workingVector2.xyz * workingVector2.www;
    workingVector2.w = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector0.w = saturate(workingVector0.w / workingVector2.w);
    workingVector0.w = 1 + -workingVector0.w;
    workingVector2.xyz = workingVector2.xyz * workingVector0.www;
    workingVector2.xyz = workingVector3.yyy ? workingVector4.xyz : workingVector2.xyz;
    if (workingVector3.w != 0) {
      workingVector3.xy = float2(1,1) + workingVector5.xy;
      workingVector3.xy = float2(0.5,0.5) * workingVector3.xy;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector5.yy;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector5.xx + workingVector4.xy;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector5.zz + workingVector4.xy;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector4.xy;
      workingVector0.w = -workingVector4.x / workingVector4.y;
      workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
      workingVector2.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector0.w = workingVector0.w / workingVector2.w;
      workingVector0.w = workingVector0.w * 53.5981483 + 1;
      workingVector0.w = log2(workingVector0.w);
      workingVector0.w = 0.173286796 * workingVector0.w;
      workingVector2.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector4.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector0.w = workingVector0.w * workingVector4.x + -0.5;
      workingVector4.x = (int)workingVector0.w;
      workingVector2.w = (int)workingVector2.w + -2;
      workingVector4.x = max(0, (int)workingVector4.x);
      workingVector2.w = min((int)workingVector4.x, (int)workingVector2.w);
      workingVector3.z = (int)workingVector2.w;
      workingVector0.w = saturate(-workingVector3.z + workingVector0.w);
      workingVector3.z = materialTexture7.SampleLevel(textureSampler7, workingVector3.xyz, 0).w;
      workingVector2.w = (int)workingVector2.w + 1;
      workingVector3.w = (int)workingVector2.w;
      workingVector2.w = materialTexture7.SampleLevel(textureSampler7, workingVector3.xyw, 0).w;
      workingVector2.w = workingVector2.w + -workingVector3.z;
      workingVector0.w = workingVector0.w * workingVector2.w + workingVector3.z;
      workingVector2.xyz = workingVector0.www * workingVector2.xyz;
    }
  } else {
    workingVector2.xyz = float3(0,0,0);
  }
  workingVector1.xyz = workingVector2.xyz + workingVector0.xyz;
  workingVector0.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.x != 0) {
    workingVector0.x = materialTexture5.Sample(textureSampler5, float2(0.5,0.5)).x;
    workingVector0.x = 0.180000007 / workingVector0.x;
    workingVector0.x = 9.99999975e-005 + workingVector0.x;
    workingVector1.xyz = workingVector1.xyz * workingVector0.xxx;
  }
  fragmentColor0.xyzw = workingVector1.xyzw;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = particleTextureTexture.Sample(particleTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    float productValue3 = ((varyingColor1.x - productValue) * varyingColor1.w) + productValue;
    float productValue4 = ((varyingColor1.y - productValue1) * varyingColor1.w) + productValue1;
    float productValue5 = ((varyingColor1.z - productValue2) * varyingColor1.w) + productValue2;
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
        exponentialValue = exp2(log2(max(productValue3, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue4, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue5, 0.0f)) * 2.2000000476837158203125f);
    }
    else
    {
        exponentialValue = (productValue3 <= 0.040449999272823333740234375f) ? (productValue3 * 0.077399380505084991455078125f) : exp2(log2((productValue3 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue4 <= 0.040449999272823333740234375f) ? (productValue4 * 0.077399380505084991455078125f) : exp2(log2((productValue4 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue5 <= 0.040449999272823333740234375f) ? (productValue5 * 0.077399380505084991455078125f) : exp2(log2((productValue5 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
    }
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue & 1u) == 0u)
    {
        intermediateValue4 = RD_UNIFORM_MERS_UNIFORMS.x;
        intermediateValue5 = RD_UNIFORM_MERS_UNIFORMS.y;
        intermediateValue6 = RD_UNIFORM_MERS_UNIFORMS.z;
        intermediateValue7 = RD_UNIFORM_MERS_UNIFORMS.w;
    }
    else
    {
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue1.x;
        intermediateValue5 = sampledTextureValue1.y;
        intermediateValue6 = sampledTextureValue1.z;
        intermediateValue7 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_MERS_UNIFORMS.w;
    }
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue & 4u) == 0u)
    {
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
    }
    else
    {
        float4 sampledTextureValue2 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        float productValue6 = (sampledTextureValue2.x * 2.0f) + (-1.0f);
        float productValue7 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
        float productValue8 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
        intermediateValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, productValue8, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, productValue7, productValue6 * RD_UNIFORM_MODEL_MATRICES_ROW_0.x));
        intermediateValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, productValue8, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, productValue7, productValue6 * RD_UNIFORM_MODEL_MATRICES_ROW_0.y));
        intermediateValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, productValue8, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, productValue7, productValue6 * RD_UNIFORM_MODEL_MATRICES_ROW_0.z));
    }
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue1 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue2 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue5 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue4;
    float multiplyAddValue6 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue4;
    float multiplyAddValue7 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue4;
    float inverseLengthValue = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue9 = inverseLengthValue * intermediateValue8;
    float productValue10 = inverseLengthValue * intermediateValue9;
    float productValue11 = inverseLengthValue * intermediateValue10;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue10, productValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue10, productValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue11, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue10, productValue9 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float productValue28;
    float productValue29;
    float productValue30;
    if ((RD_UNIFORM_QUANTIZATION_PARAMETERS.y > 0.0f) || (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f))
    {
        float sumValue = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
        float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_WORLD_ORIGIN.y;
        float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
        float scalarValue1 = ddx_coarse(multiplyAddValue);
        float scalarValue2 = ddx_coarse(multiplyAddValue1);
        float scalarValue3 = ddx_coarse(multiplyAddValue2);
        float inverseLengthValue1 = rsqrt(dot(float3(scalarValue1, scalarValue2, scalarValue3), float3(scalarValue1, scalarValue2, scalarValue3)));
        float productValue12 = inverseLengthValue1 * scalarValue1;
        float productValue13 = inverseLengthValue1 * scalarValue2;
        float productValue14 = inverseLengthValue1 * scalarValue3;
        float sumValue3 = ddy_coarse((-0.0f) - multiplyAddValue);
        float sumValue4 = ddy_coarse((-0.0f) - multiplyAddValue1);
        float sumValue5 = ddy_coarse((-0.0f) - multiplyAddValue2);
        float inverseLengthValue2 = rsqrt(dot(float3(sumValue3, sumValue4, sumValue5), float3(sumValue3, sumValue4, sumValue5)));
        float productValue15 = inverseLengthValue2 * sumValue3;
        float productValue16 = inverseLengthValue2 * sumValue4;
        float productValue17 = inverseLengthValue2 * sumValue5;
        float productValue18 = (productValue17 * productValue13) - (productValue16 * productValue14);
        float productValue19 = (productValue15 * productValue14) - (productValue17 * productValue12);
        float productValue20 = (productValue16 * productValue12) - (productValue15 * productValue13);
        float inverseLengthValue3 = rsqrt(dot(float3(productValue18, productValue19, productValue20), float3(productValue18, productValue19, productValue20)));
        float productValue21 = productValue18 * inverseLengthValue3;
        float productValue22 = productValue19 * inverseLengthValue3;
        float productValue23 = productValue20 * inverseLengthValue3;
        float multiplyAddValue11 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue23, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue22, productValue21 * RD_UNIFORM_INV_VIEW_ROW_0.x));
        float multiplyAddValue12 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue23, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue22, productValue21 * RD_UNIFORM_INV_VIEW_ROW_0.y));
        float multiplyAddValue13 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue23, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue22, productValue21 * RD_UNIFORM_INV_VIEW_ROW_0.z));
        float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        float quotientValue = round((inverseLengthValue4 * multiplyAddValue11) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float quotientValue1 = round((inverseLengthValue4 * multiplyAddValue12) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float quotientValue2 = round((inverseLengthValue4 * multiplyAddValue13) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float inverseLengthValue5 = rsqrt(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(quotientValue, quotientValue1, quotientValue2)));
        float productValue24 = inverseLengthValue5 * quotientValue;
        float productValue25 = inverseLengthValue5 * quotientValue1;
        float productValue26 = inverseLengthValue5 * quotientValue2;
        float productValue27 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
        float quotientValue3 = productValue27 - (sumValue - (floor(sumValue / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float quotientValue4 = productValue27 - (sumValue1 - (floor(sumValue1 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float quotientValue5 = productValue27 - (sumValue2 - (floor(sumValue2 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float dotProductValue = dot(float3(quotientValue3, quotientValue4, quotientValue5), float3(productValue24, productValue25, productValue26));
        productValue28 = (varyingTexCoord3.x + quotientValue3) - (dotProductValue * productValue24);
        productValue29 = (varyingTexCoord3.y - (dotProductValue * productValue25)) + quotientValue4;
        productValue30 = (varyingTexCoord3.z - (dotProductValue * productValue26)) + quotientValue5;
    }
    else
    {
        productValue28 = varyingTexCoord3.x;
        productValue29 = varyingTexCoord3.y;
        productValue30 = varyingTexCoord3.z;
    }
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord2.y + varyingTexCoord2.x) + varyingTexCoord2.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue31 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue = clamp(productValue31, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue31 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue31, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue31 * productValue31) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue31, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = varyingTexCoord2.x;
        clampedValue1 = varyingTexCoord2.y;
        clampedValue2 = varyingTexCoord2.z;
    }
    float sumValue6 = 1.0f - intermediateValue4;
    float productValue32 = sumValue6 * 0.039999999105930328369140625f;
    float productValue33 = productValue32 + (intermediateValue4 * exponentialValue);
    float productValue34 = productValue32 + (intermediateValue4 * exponentialValue1);
    float productValue35 = productValue32 + (intermediateValue4 * exponentialValue2);
    float sampledTextureValue3;
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
        sampledTextureValue3 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue9, productValue10, productValue11)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
    }
    else
    {
        sampledTextureValue3 = 1.0f;
    }
    float clampedValue3 = clamp(((varyingTexCoord1.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float nonlinearValue = sqrt(((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue * multiplyAddValue)) + (multiplyAddValue2 * multiplyAddValue2));
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
    float productValue41;
    float productValue42;
    float intermediateValue15;
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue21;
    float intermediateValue23;
    float intermediateValue25;
    if (multiplyAddValue7 != 1.0f)
    {
        float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
        float quotientValue6 = multiplyAddValue / sumValue7;
        float quotientValue7 = multiplyAddValue1 / sumValue7;
        float quotientValue8 = multiplyAddValue2 / sumValue7;
        float sumValue8 = (-0.0f) - quotientValue6;
        float sumValue9 = (-0.0f) - quotientValue7;
        float sumValue10 = (-0.0f) - quotientValue8;
        float productValue36 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * intermediateValue7;
        bool conditionValue = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
        float intermediateValue16;
        float intermediateValue18;
        float intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(varyingTexCoord1.y) < 9.9999997473787516355514526367188e-05f))
        {
            intermediateValue16 = 0.0f;
            intermediateValue18 = 0.0f;
            intermediateValue20 = 0.0f;
            intermediateValue22 = 0.0f;
            intermediateValue24 = 0.0f;
            intermediateValue26 = 0.0f;
        }
        else
        {
            float productValue66;
            float intermediateValue30;
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), float3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
                float dotProductValue1 = max(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(inverseLengthValue6 * multiplyAddValue14, inverseLengthValue6 * multiplyAddValue15, inverseLengthValue6 * multiplyAddValue16)), 0.0f);
                float clampedValue4 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue = (clampedValue4 * productValue9) + (conditionValue ? productValue28 : varyingTexCoord3.x);
                float comparisonValue1 = (clampedValue4 * productValue10) + (conditionValue ? productValue29 : varyingTexCoord3.y);
                float comparisonValue2 = (clampedValue4 * productValue11) + (conditionValue ? productValue30 : varyingTexCoord3.z);
                uint clampedValue5 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
                float intermediateValue31;
                float intermediateValue42;
                if (int(clampedValue5) > int(0u))
                {
                    float intermediateValue41;
                    float intermediateValue43;
                    uint intermediateValue54;
                    float scalarValue4 = 1.0f;
                    float scalarValue5 = 1.0f;
                    uint scalarValue6 = 0u;
                    uint scalarValue7 = 0u;
                    uint quotientValue11;
                    bool intermediateValue56;
                    for (;;)
                    {
                        uint sumValue11 = scalarValue7 + 364u;
                        quotientValue11 = uint(min(int(uint(int(fragmentConstants[sumValue11 / 4u][sumValue11 % 4u])) + scalarValue6), int(8u)));
                        intermediateValue56 = int(scalarValue6) < int(quotientValue11);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue56)
                        {
                            float intermediateValue66;
                            float intermediateValue67;
                            uint intermediateValue68;
                            float scalarValue8 = scalarValue4;
                            float scalarValue9 = scalarValue5;
                            uint scalarValue10 = scalarValue6;
                            uint bitwiseValue10;
                            float multiplyAddValue31;
                            float multiplyAddValue32;
                            float multiplyAddValue33;
                            bool comparisonValue18;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue10 << 2u;
                                uint sumValue12 = bitwiseValue10 + 92u;
                                uint sumValue13 = bitwiseValue10 + 93u;
                                uint sumValue14 = bitwiseValue10 + 94u;
                                uint sumValue15 = bitwiseValue10 + 95u;
                                multiplyAddValue31 = mad(fragmentConstants[sumValue14].x, comparisonValue2, mad(fragmentConstants[sumValue13].x, comparisonValue1, fragmentConstants[sumValue12].x * comparisonValue)) + fragmentConstants[sumValue15].x;
                                multiplyAddValue32 = mad(fragmentConstants[sumValue14].y, comparisonValue2, mad(fragmentConstants[sumValue13].y, comparisonValue1, fragmentConstants[sumValue12].y * comparisonValue)) + fragmentConstants[sumValue15].y;
                                multiplyAddValue33 = mad(fragmentConstants[sumValue14].z, comparisonValue2, mad(fragmentConstants[sumValue13].z, comparisonValue1, fragmentConstants[sumValue12].z * comparisonValue)) + fragmentConstants[sumValue15].z;
                                comparisonValue18 = ((abs(multiplyAddValue31) <= 1.0f) && (abs(multiplyAddValue32) <= 1.0f)) && (abs(multiplyAddValue33) <= 1.0f);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue18)
                                {
                                    uint sumValue16 = scalarValue10 + 312u;
                                    uint sumValue17 = scalarValue10 + 49u;
                                    float quotientValue9 = min(max(dotProductValue1, fragmentConstants[sumValue16 / 4u][sumValue16 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue9 * quotientValue9)) / quotientValue9) * fragmentConstants[sumValue17].z;
                                    float productValue43 = (multiplyAddValue31 * 0.5f) + 0.5f;
                                    float productValue44 = 0.5f - (multiplyAddValue32 * 0.5f);
                                    uint sumValue18 = bitwiseValue10 + 19u;
                                    float nonlinearValue2 = sqrt((((fragmentConstants[sumValue18].x * fragmentConstants[sumValue18].x) + (fragmentConstants[sumValue18].y * fragmentConstants[sumValue18].y)) + (fragmentConstants[sumValue18].z * fragmentConstants[sumValue18].z)) + (fragmentConstants[sumValue18].w * fragmentConstants[sumValue18].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                    uint comparisonValue3 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue17].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue10 = uint(int(comparisonValue3) / int(2u));
                                    float intermediateValue120;
                                    float intermediateValue121;
                                    if (int(comparisonValue3) > int(0u))
                                    {
                                        float sumValue85;
                                        float productValue161;
                                        float intermediateValue151;
                                        float intermediateValue152;
                                        uint intermediateValue153;
                                        float scalarValue11 = 0.0f;
                                        float scalarValue12 = 0.0f;
                                        uint scalarValue13 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue151 = scalarValue11;
                                            intermediateValue152 = scalarValue12;
                                            intermediateValue153 = 0u;
                                            float intermediateValue198;
                                            float intermediateValue155;
                                            float intermediateValue156;
                                            float intermediateValue157;
                                            float intermediateValue158;
                                            float productValue169;
                                            float productValue170;
                                            bool comparisonValue43;
                                            float sumValue95;
                                            for (;;)
                                            {
                                                float productValue45 = (productValue43 + ((float(int(intermediateValue153 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
                                                float productValue49 = (productValue44 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue13 - quotientValue10)) + 0.5f))) * fragmentConstants[sumValue17].x;
                                                float4 vectorValue = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue45, productValue49, float(int(scalarValue10))));
                                                intermediateValue155 = vectorValue.x;
                                                intermediateValue156 = vectorValue.y;
                                                intermediateValue157 = vectorValue.z;
                                                intermediateValue158 = vectorValue.w;
                                                productValue169 = frac((productValue45 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue170 = frac((productValue49 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue6 = clamp((multiplyAddValue33 - intermediateValue155) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue7 = clamp((multiplyAddValue33 - intermediateValue156) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue8 = clamp((multiplyAddValue33 - intermediateValue157) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue9 = clamp((multiplyAddValue33 - intermediateValue158) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue50 = 1.0f - ((clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f)));
                                                float productValue51 = 1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)));
                                                float productValue52 = (((1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)))) - productValue51) * productValue169) + productValue51;
                                                productValue161 = (productValue52 + intermediateValue152) + ((((((1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)))) - productValue50) * productValue169) + productValue50) - productValue52) * productValue170);
                                                comparisonValue43 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue95 = (multiplyAddValue33 - fragmentConstants[sumValue17].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue43)
                                                {
                                                    branchMergedValue4 = float(intermediateValue158 >= sumValue95);
                                                }
                                                else
                                                {
                                                    float comparisonValue4 = (intermediateValue155 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue5 = (intermediateValue158 < sumValue95) ? 0.0f : 1.0f;
                                                    float comparisonValue6 = ((((intermediateValue157 < sumValue95) ? 0.0f : 1.0f) - comparisonValue5) * productValue169) + comparisonValue5;
                                                    branchMergedValue4 = (((((((intermediateValue156 < sumValue95) ? 0.0f : 1.0f) - comparisonValue4) * productValue169) + comparisonValue4) - comparisonValue6) * productValue170) + comparisonValue6;
                                                }
                                                intermediateValue198 = branchMergedValue4;
                                                sumValue85 = intermediateValue198 + intermediateValue151;
                                                uint sumValue19 = intermediateValue153 + 1u;
                                                if (sumValue19 == comparisonValue3)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue151 = sumValue85;
                                                    intermediateValue152 = productValue161;
                                                    intermediateValue153 = sumValue19;
                                                    continue;
                                                }
                                            }
                                            uint sumValue20 = scalarValue13 + 1u;
                                            if (sumValue20 == comparisonValue3)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue11 = sumValue85;
                                                scalarValue12 = productValue161;
                                                scalarValue13 = sumValue20;
                                                continue;
                                            }
                                        }
                                        intermediateValue120 = sumValue85;
                                        intermediateValue121 = productValue161;
                                    }
                                    else
                                    {
                                        intermediateValue120 = 0.0f;
                                        intermediateValue121 = 0.0f;
                                    }
                                    float productValue53 = float(int(comparisonValue3 * comparisonValue3));
                                    branchMergedValue1 = min(scalarValue9, intermediateValue120 / productValue53);
                                    branchMergedValue7 = quotientValue11;
                                    branchMergedValue8 = min(scalarValue8, intermediateValue121 / productValue53);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue9;
                                    branchMergedValue7 = scalarValue10 + 1u;
                                    branchMergedValue8 = scalarValue8;
                                }
                                intermediateValue67 = branchMergedValue1;
                                intermediateValue68 = branchMergedValue7;
                                intermediateValue66 = branchMergedValue8;
                                if (int(intermediateValue68) < int(quotientValue11))
                                {
                                    scalarValue8 = intermediateValue66;
                                    scalarValue9 = intermediateValue67;
                                    scalarValue10 = intermediateValue68;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue68;
                            branchMergedValue5 = intermediateValue67;
                            branchMergedValue6 = intermediateValue66;
                        }
                        else
                        {
                            branchMergedValue = scalarValue6;
                            branchMergedValue5 = scalarValue5;
                            branchMergedValue6 = scalarValue4;
                        }
                        intermediateValue54 = branchMergedValue;
                        intermediateValue43 = branchMergedValue5;
                        intermediateValue41 = branchMergedValue6;
                        uint sumValue21 = scalarValue7 + 1u;
                        if (sumValue21 == clampedValue5)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue4 = intermediateValue41;
                            scalarValue5 = intermediateValue43;
                            scalarValue6 = intermediateValue54;
                            scalarValue7 = sumValue21;
                            continue;
                        }
                    }
                    intermediateValue31 = intermediateValue41;
                    intermediateValue42 = intermediateValue43;
                }
                else
                {
                    intermediateValue31 = 1.0f;
                    intermediateValue42 = 1.0f;
                }
                float intermediateValue58;
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
                    float scalarValue14 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue17 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue))) - ((sqrt(1.0f - (scalarValue14 * scalarValue14)) / scalarValue14) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue18 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue19 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    uint comparisonValue7 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue7 >> 1u;
                    float branchMergedValue11;
                    if ((multiplyAddValue19 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue18 >= 0.0f) && (multiplyAddValue18 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue19 >= 0.0f)))
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
                        float sumValue63;
                        float intermediateValue103;
                        uint intermediateValue104;
                        float scalarValue15 = 0.0f;
                        uint scalarValue16 = 0u;
                        for (;;)
                        {
                            intermediateValue103 = scalarValue15;
                            intermediateValue104 = 0u;
                            float intermediateValue143;
                            float productValue157;
                            float productValue158;
                            bool comparisonValue29;
                            for (;;)
                            {
                                float productValue54 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
                                productValue157 = (productValue54 * (float(int(intermediateValue104 - bitwiseValue)) + 0.5f)) + multiplyAddValue18;
                                productValue158 = (productValue54 * (float(int(scalarValue16 - bitwiseValue)) + 0.5f)) + multiplyAddValue19;
                                comparisonValue29 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue2;
                                if (comparisonValue29)
                                {
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue157, productValue158, dotProductValue2), 0.0f).x >= multiplyAddValue17);
                                }
                                else
                                {
                                    float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue157, productValue158, dotProductValue2));
                                    float productValue55 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue157) + 0.5f);
                                    float comparisonValue8 = (vectorValue1.x < multiplyAddValue17) ? 0.0f : 1.0f;
                                    float comparisonValue9 = (vectorValue1.w < multiplyAddValue17) ? 0.0f : 1.0f;
                                    float comparisonValue10 = ((((vectorValue1.z < multiplyAddValue17) ? 0.0f : 1.0f) - comparisonValue9) * productValue55) + comparisonValue9;
                                    branchMergedValue2 = (((((((vectorValue1.y < multiplyAddValue17) ? 0.0f : 1.0f) - comparisonValue8) * productValue55) + comparisonValue8) - comparisonValue10) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue158) + 0.5f)) + comparisonValue10;
                                }
                                intermediateValue143 = branchMergedValue2;
                                sumValue63 = intermediateValue143 + intermediateValue103;
                                uint sumValue22 = intermediateValue104 + 1u;
                                if (int(sumValue22) < int(comparisonValue7))
                                {
                                    intermediateValue103 = sumValue63;
                                    intermediateValue104 = sumValue22;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue23 = scalarValue16 + 1u;
                            if (int(sumValue23) < int(comparisonValue7))
                            {
                                scalarValue15 = sumValue63;
                                scalarValue16 = sumValue23;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue11 = sumValue63 / float(int(comparisonValue7 * comparisonValue7));
                    }
                    else
                    {
                        branchMergedValue11 = 1.0f;
                    }
                    intermediateValue58 = branchMergedValue11;
                }
                else
                {
                    intermediateValue58 = 1.0f;
                }
                float intermediateValue70;
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
                    float multiplyAddValue20 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue17 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue21 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue20) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue17 * scalarValue17)) / scalarValue17) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue22 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue20) * 0.5f) + 0.5f;
                    float multiplyAddValue23 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue20) * 0.5f);
                    uint comparisonValue11 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue12 = uint(int(comparisonValue11) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
                    float intermediateValue98;
                    if (int(comparisonValue11) > int(0u))
                    {
                        float sumValue65;
                        float intermediateValue123;
                        uint intermediateValue124;
                        float scalarValue18 = 0.0f;
                        uint scalarValue19 = 0u;
                        for (;;)
                        {
                            intermediateValue123 = scalarValue18;
                            intermediateValue124 = 0u;
                            float intermediateValue159;
                            float4 intermediateValue125;
                            float productValue164;
                            float productValue165;
                            bool comparisonValue33;
                            for (;;)
                            {
                                intermediateValue125 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue164 = (multiplyAddValue22 + ((float(int(intermediateValue124 - quotientValue12)) + 0.5f) * intermediateValue125.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue165 = (multiplyAddValue23 + (intermediateValue125.x * (float(int(scalarValue19 - quotientValue12)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue33 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue33)
                                {
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue164, productValue165, dotProductValue3), 0.0f).x >= multiplyAddValue21);
                                }
                                else
                                {
                                    float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue164, productValue165, dotProductValue3));
                                    float productValue56 = frac((productValue164 * intermediateValue125.z) + 0.5f);
                                    float comparisonValue12 = (vectorValue2.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue13 = (vectorValue2.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                    float comparisonValue14 = ((((vectorValue2.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue13) * productValue56) + comparisonValue13;
                                    branchMergedValue3 = (((((((vectorValue2.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue12) * productValue56) + comparisonValue12) - comparisonValue14) * frac((productValue165 * intermediateValue125.z) + 0.5f)) + comparisonValue14;
                                }
                                intermediateValue159 = branchMergedValue3;
                                sumValue65 = intermediateValue159 + intermediateValue123;
                                uint sumValue24 = intermediateValue124 + 1u;
                                if (sumValue24 == comparisonValue11)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue123 = sumValue65;
                                    intermediateValue124 = sumValue24;
                                    continue;
                                }
                            }
                            uint sumValue25 = scalarValue19 + 1u;
                            if (sumValue25 == comparisonValue11)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue18 = sumValue65;
                                scalarValue19 = sumValue25;
                                continue;
                            }
                        }
                        intermediateValue98 = sumValue65;
                    }
                    else
                    {
                        intermediateValue98 = 0.0f;
                    }
                    float quotientValue13 = intermediateValue98 / float(int(comparisonValue11 * comparisonValue11));
                    float branchMergedValue13;
                    if (quotientValue13 < 1.0f)
                    {
                        branchMergedValue13 = min(1.0f, max(quotientValue13, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
                    }
                    else
                    {
                        branchMergedValue13 = 1.0f;
                    }
                    intermediateValue70 = branchMergedValue13;
                }
                else
                {
                    intermediateValue70 = 1.0f;
                }
                float scalarValue20 = min(intermediateValue42, min(intermediateValue58, intermediateValue70));
                float productValue57 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue10 = clamp((((-0.0f) - multiplyAddValue2) - productValue57) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue57), 0.0f, 1.0f);
                productValue66 = (((clampedValue10 * clampedValue10) * (1.0f - scalarValue20)) * (3.0f - (clampedValue10 * 2.0f))) + scalarValue20;
                intermediateValue30 = intermediateValue31;
            }
            else
            {
                productValue66 = 1.0f;
                intermediateValue30 = 1.0f;
            }
            float multiplyAddValue24 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), float3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26)));
            float productValue58 = inverseLengthValue7 * multiplyAddValue24;
            float productValue59 = inverseLengthValue7 * multiplyAddValue25;
            float productValue60 = inverseLengthValue7 * multiplyAddValue26;
            float productValue61 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue3);
            float productValue62 = productValue61 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue63 = productValue61 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue64 = productValue61 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(productValue58, productValue59, productValue60));
            float scalarValue21 = max(dotProductValue4, 0.0f);
            float dotProductValue5 = max(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
            float sumValue26 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue65 = sumValue26 * sumValue26;
            float sumValue27 = productValue58 - quotientValue6;
            float sumValue28 = productValue59 - quotientValue7;
            float sumValue29 = productValue60 - quotientValue8;
            float inverseLengthValue8 = rsqrt(dot(float3(sumValue27, sumValue28, sumValue29), float3(sumValue27, sumValue28, sumValue29)));
            float productValue67 = inverseLengthValue8 * sumValue27;
            float productValue68 = inverseLengthValue8 * sumValue28;
            float productValue69 = inverseLengthValue8 * sumValue29;
            float scalarValue22 = max(intermediateValue6, 0.0500000007450580596923828125f);
            float productValue70 = scalarValue22 * scalarValue22;
            float productValue71 = productValue70 * productValue70;
            float dotProductValue6 = max(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(productValue67, productValue68, productValue69)), 0.0f);
            float productValue72 = ((dotProductValue6 * dotProductValue6) * (productValue71 + (-1.0f))) + 1.0f;
            float productValue73 = productValue70 * 0.5f;
            float sumValue30 = 1.0f - productValue73;
            float sumValue31 = productValue73 + 9.9999997473787516355514526367188e-05f;
            float clampedValue11 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue67, productValue68, productValue69)), 0.0f), 0.0f, 1.0f);
            float productValue74 = clampedValue11 * clampedValue11;
            float productValue75 = (productValue74 * productValue74) * clampedValue11;
            float productValue76 = (productValue75 * (1.0f - productValue33)) + productValue33;
            float productValue77 = (productValue75 * (1.0f - productValue34)) + productValue34;
            float productValue78 = (productValue75 * (1.0f - productValue35)) + productValue35;
            float quotientValue14 = ((dotProductValue5 / ((sumValue30 * dotProductValue5) + sumValue31)) * (productValue71 / ((productValue72 * productValue72) * 3.1415927410125732421875f))) * (scalarValue21 / ((sumValue30 * scalarValue21) + sumValue31));
            float productValue79 = ((scalarValue21 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
            float quotientValue15 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue65, 0.0f) - scalarValue21) * productValue36) + scalarValue21) * productValue66;
            float dotProductValue7 = (intermediateValue30 * productValue36) * max((dot(float3((-0.0f) - multiplyAddValue8, (-0.0f) - multiplyAddValue9, (-0.0f) - multiplyAddValue10), float3(productValue58, productValue59, productValue60)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue65, 0.0f);
            float productValue80 = sumValue6 * 0.3183098733425140380859375f;
            float productValue81 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue21 * productValue66);
            intermediateValue16 = (productValue81 * productValue62) * ((productValue76 * quotientValue14) / productValue79);
            intermediateValue18 = (productValue81 * productValue63) * ((productValue77 * quotientValue14) / productValue79);
            intermediateValue20 = (productValue81 * productValue64) * ((productValue78 * quotientValue14) / productValue79);
            intermediateValue22 = (((productValue80 * exponentialValue) * productValue62) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue76) * quotientValue15) + dotProductValue7);
            intermediateValue24 = (((productValue80 * exponentialValue1) * productValue63) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue77) * quotientValue15) + dotProductValue7);
            intermediateValue26 = (((productValue80 * exponentialValue2) * productValue64) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue78) * quotientValue15) + dotProductValue7);
        }
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
        {
            float productValue82 = ((varyingTexCoord3.x + (-0.5f)) + (productValue9 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue83 = ((varyingTexCoord3.y + (-0.5f)) + (productValue10 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue84 = ((varyingTexCoord3.z + (-0.5f)) + (productValue11 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue85 = floor(productValue82 * 0.0625f) * 16.0f;
            float productValue86 = floor(productValue83 * 0.0625f) * 16.0f;
            float productValue87 = floor(productValue84 * 0.0625f) * 16.0f;
            uint productValue88 = uint(int(floor(float(int(uint(int(floor(productValue82))))) * 0.0625f)));
            uint productValue89 = uint(int(floor(float(int(uint(int(floor(productValue83))))) * 0.0625f)));
            uint productValue90 = uint(int(floor(float(int(uint(int(floor(productValue84))))) * 0.0625f)));
            float sumValue32 = productValue82 - productValue85;
            float sumValue33 = productValue83 - productValue86;
            float sumValue34 = productValue84 - productValue87;
            uint bitwiseValue1 = (productValue89 << 16u) | (productValue88 & 65535u);
            uint bitwiseValue2 = productValue90 & 65535u;
            uint productValue91 = productValue88 * 1540483477u;
            uint productValue92 = productValue89 * 1540483477u;
            uint productValue93 = productValue90 * 1540483477u;
            uint bitwiseValue3 = ((((((((productValue91 >> 24u) ^ productValue91) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue92 >> 24u) ^ productValue92) * 1540483477u)) * 1540483477u) ^ (((productValue93 >> 24u) ^ productValue93) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue16 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
            uint sumValue35 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
            bool intermediateValue50;
            uint scalarValue23 = comparisonValue16;
            uint scalarValue24 = 0u;
            uint scalarValue25 = 0u;
            uint loadedBufferValue;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue23 & sumValue35;
                uint loadedBufferValue1 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
                bool loadedBufferValue2 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue1 == comparisonValue16));
                loadedBufferValue = loadedBufferValue2 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue24;
                if ((loadedBufferValue1 == 0u) || loadedBufferValue2)
                {
                    intermediateValue50 = loadedBufferValue2;
                    break;
                }
                else
                {
                    uint sumValue36 = scalarValue25 + 1u;
                    if (int(sumValue36) < int(8u))
                    {
                        scalarValue23 = bitwiseValue7 + 1u;
                        scalarValue24 = loadedBufferValue;
                        scalarValue25 = sumValue36;
                        continue;
                    }
                    else
                    {
                        intermediateValue50 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue9 = loadedBufferValue >> 2u;
            float branchMergedValue9;
            float branchMergedValue16;
            float branchMergedValue17;
            if (intermediateValue50)
            {
                float scalarValue26 = abs(productValue9);
                float scalarValue27 = abs(productValue10);
                float scalarValue28 = abs(productValue11);
                float branchMergedValue45;
                float branchMergedValue47;
                float branchMergedValue48;
                if (((scalarValue26 >= 1.0f) || (scalarValue27 >= 1.0f)) || (scalarValue28 >= 1.0f))
                {
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue162;
                    float intermediateValue163;
                    float intermediateValue165;
                    float intermediateValue167;
                    float intermediateValue169;
                    float intermediateValue171;
                    float intermediateValue173;
                    float intermediateValue175;
                    float intermediateValue176;
                    float intermediateValue177;
                    float productValue131;
                    float productValue132;
                    float productValue133;
                    float sumValue37;
                    float sumValue38;
                    float sumValue39;
                    float sumValue40;
                    float sumValue41;
                    float sumValue42;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float productValue134;
                    float productValue135;
                    float productValue136;
                    float productValue137;
                    bool comparisonValue15;
                    for (;;)
                    {
                        float dotProductValue8 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue26, scalarValue27, scalarValue28));
                        float dotProductValue9 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue28, scalarValue26, scalarValue27));
                        float dotProductValue10 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue27, scalarValue28, scalarValue26));
                        float comparisonValue22 = ((inverseLengthValue * ((intermediateValue9 + intermediateValue8) + intermediateValue10)) > 0.0f) ? ceil(dotProductValue8) : floor(dotProductValue8);
                        float scalarValue29 = floor(dotProductValue9);
                        float scalarValue30 = floor(dotProductValue10);
                        productValue131 = ((comparisonValue22 * scalarValue26) + (scalarValue29 * scalarValue28)) + (scalarValue30 * scalarValue27);
                        productValue132 = ((comparisonValue22 * scalarValue27) + (scalarValue29 * scalarValue26)) + (scalarValue30 * scalarValue28);
                        productValue133 = ((comparisonValue22 * scalarValue28) + (scalarValue29 * scalarValue27)) + (scalarValue30 * scalarValue26);
                        sumValue37 = productValue131 + scalarValue28;
                        sumValue38 = productValue132 + scalarValue26;
                        sumValue39 = productValue133 + scalarValue27;
                        sumValue40 = productValue131 + scalarValue27;
                        sumValue41 = productValue132 + scalarValue28;
                        sumValue42 = productValue133 + scalarValue26;
                        sumValue43 = sumValue37 + scalarValue27;
                        sumValue44 = sumValue41 + scalarValue26;
                        sumValue45 = sumValue39 + scalarValue26;
                        float sumValue46 = dotProductValue9 - scalarValue29;
                        float sumValue47 = dotProductValue10 - scalarValue30;
                        float sumValue48 = 1.0f - sumValue46;
                        float sumValue49 = 1.0f - sumValue47;
                        productValue134 = sumValue49 * sumValue48;
                        productValue135 = sumValue49 * sumValue46;
                        productValue136 = sumValue48 * sumValue47;
                        productValue137 = sumValue47 * sumValue46;
                        comparisonValue15 = ((productValue133 >= 0.0f) && ((productValue131 >= 0.0f) && (productValue132 >= 0.0f))) && ((sumValue45 < 16.0f) && ((sumValue43 < 16.0f) && (sumValue44 < 16.0f)));
                        if (comparisonValue15)
                        {
                            uint4 loadedBufferValue3 = rdLoad_voxelBuffer(((uint(productValue132) + bitwiseValue9) + (uint(productValue133) << 4u)) + (uint(productValue131) << 8u));
                            uint scalarValue31 = loadedBufferValue3.x;
                            float bitwiseValue13;
                            float intermediateValue114;
                            float intermediateValue115;
                            if (scalarValue31 == 0u)
                            {
                                bitwiseValue13 = 0.0f;
                                intermediateValue114 = 0.0f;
                                intermediateValue115 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue11 = float(scalarValue31 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue31 & 255u);
                                intermediateValue114 = bitwiseValue11 * float((scalarValue31 >> 8u) & 255u);
                                intermediateValue115 = bitwiseValue11 * float((scalarValue31 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue4 = rdLoad_voxelBuffer(((uint(sumValue38) + bitwiseValue9) + (uint(sumValue39) << 4u)) + (uint(sumValue37) << 8u));
                            uint scalarValue32 = loadedBufferValue4.x;
                            float bitwiseValue17;
                            float intermediateValue126;
                            float intermediateValue127;
                            if (scalarValue32 == 0u)
                            {
                                bitwiseValue17 = 0.0f;
                                intermediateValue126 = 0.0f;
                                intermediateValue127 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue12 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue32 & 255u);
                                intermediateValue126 = bitwiseValue12 * float((scalarValue32 >> 8u) & 255u);
                                intermediateValue127 = bitwiseValue12 * float((scalarValue32 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue5 = rdLoad_voxelBuffer(((uint(sumValue41) + bitwiseValue9) + (uint(sumValue42) << 4u)) + (uint(sumValue40) << 8u));
                            uint scalarValue33 = loadedBufferValue5.x;
                            float bitwiseValue21;
                            float intermediateValue145;
                            float intermediateValue146;
                            if (scalarValue33 == 0u)
                            {
                                bitwiseValue21 = 0.0f;
                                intermediateValue145 = 0.0f;
                                intermediateValue146 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue14 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue33 & 255u);
                                intermediateValue145 = bitwiseValue14 * float((scalarValue33 >> 8u) & 255u);
                                intermediateValue146 = bitwiseValue14 * float((scalarValue33 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue6 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                            uint scalarValue34 = loadedBufferValue6.x;
                            float branchMergedValue14;
                            float branchMergedValue23;
                            float branchMergedValue24;
                            float branchMergedValue25;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            if (scalarValue34 == 0u)
                            {
                                branchMergedValue14 = bitwiseValue21;
                                branchMergedValue23 = intermediateValue127;
                                branchMergedValue24 = intermediateValue126;
                                branchMergedValue25 = bitwiseValue17;
                                branchMergedValue26 = intermediateValue115;
                                branchMergedValue27 = intermediateValue114;
                                branchMergedValue28 = bitwiseValue13;
                                branchMergedValue29 = intermediateValue146;
                                branchMergedValue30 = 0.0f;
                                branchMergedValue31 = 0.0f;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = intermediateValue145;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue14 = bitwiseValue21;
                                branchMergedValue23 = intermediateValue127;
                                branchMergedValue24 = intermediateValue126;
                                branchMergedValue25 = bitwiseValue17;
                                branchMergedValue26 = intermediateValue115;
                                branchMergedValue27 = intermediateValue114;
                                branchMergedValue28 = bitwiseValue13;
                                branchMergedValue29 = intermediateValue146;
                                branchMergedValue30 = bitwiseValue16 * float(scalarValue34 & 255u);
                                branchMergedValue31 = bitwiseValue16 * float((scalarValue34 >> 8u) & 255u);
                                branchMergedValue41 = bitwiseValue16 * float((scalarValue34 >> 16u) & 255u);
                                branchMergedValue42 = intermediateValue145;
                            }
                            intermediateValue160 = branchMergedValue28;
                            intermediateValue161 = branchMergedValue27;
                            intermediateValue162 = branchMergedValue26;
                            intermediateValue163 = branchMergedValue25;
                            intermediateValue165 = branchMergedValue24;
                            intermediateValue167 = branchMergedValue23;
                            intermediateValue169 = branchMergedValue14;
                            intermediateValue171 = branchMergedValue42;
                            intermediateValue173 = branchMergedValue29;
                            intermediateValue175 = branchMergedValue30;
                            intermediateValue176 = branchMergedValue31;
                            intermediateValue177 = branchMergedValue41;
                            break;
                        }
                        else
                        {
                            float intermediateValue129;
                            float intermediateValue130;
                            float intermediateValue131;
                            float sumValue66;
                            float sumValue67;
                            float sumValue68;
                            uint comparisonValue23;
                            bool comparisonValue24;
                            for (;;)
                            {
                                sumValue66 = productValue131 + productValue85;
                                sumValue67 = productValue132 + productValue86;
                                sumValue68 = productValue133 + productValue87;
                                uint comparisonValue25 = ((((uint(productValue131 >= 16.0f) << 1u) | uint(productValue131 < 0.0f)) | (uint(productValue132 < 0.0f) << 2u)) | (uint(productValue132 >= 16.0f) << 3u)) | (uint(productValue133 < 0.0f) << 4u);
                                comparisonValue23 = intermediateValue[comparisonValue25 | (uint(productValue133 >= 16.0f) << 5u)];
                                comparisonValue24 = ((((comparisonValue25 | (uint(productValue133 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue25 & 31u))) == 0u;
                                uint loadedBufferValue8;
                                if (comparisonValue24)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                    {
                                        intermediateValue129 = 0.0f;
                                        intermediateValue130 = 0.0f;
                                        intermediateValue131 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue8 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue23).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue8 = ((((uint(productValue133) << 4u) & 240u) | (uint(productValue132) & 15u)) | ((uint(productValue131) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue7 = rdLoad_voxelBuffer(loadedBufferValue8);
                                uint scalarValue35 = loadedBufferValue7.x;
                                if (scalarValue35 == 0u)
                                {
                                    intermediateValue129 = 0.0f;
                                    intermediateValue130 = 0.0f;
                                    intermediateValue131 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue129 = bitwiseValue18 * float(scalarValue35 & 255u);
                                intermediateValue130 = bitwiseValue18 * float((scalarValue35 >> 8u) & 255u);
                                intermediateValue131 = bitwiseValue18 * float((scalarValue35 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue164;
                            float intermediateValue166;
                            float intermediateValue168;
                            float sumValue87;
                            float sumValue88;
                            float sumValue89;
                            uint comparisonValue35;
                            bool comparisonValue36;
                            for (;;)
                            {
                                sumValue87 = sumValue37 + productValue85;
                                sumValue88 = sumValue38 + productValue86;
                                sumValue89 = sumValue39 + productValue87;
                                uint comparisonValue28 = ((((uint(sumValue37 >= 16.0f) << 1u) | uint(sumValue37 < 0.0f)) | (uint(sumValue38 < 0.0f) << 2u)) | (uint(sumValue38 >= 16.0f) << 3u)) | (uint(sumValue39 < 0.0f) << 4u);
                                comparisonValue35 = intermediateValue[comparisonValue28 | (uint(sumValue39 >= 16.0f) << 5u)];
                                comparisonValue36 = ((((comparisonValue28 | (uint(sumValue39 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue28 & 31u))) == 0u;
                                uint loadedBufferValue15;
                                if (comparisonValue36)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue35 & 31u))) == 0u)
                                    {
                                        intermediateValue164 = 0.0f;
                                        intermediateValue166 = 0.0f;
                                        intermediateValue168 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue15 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue35).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue15 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue15);
                                uint scalarValue36 = loadedBufferValue9.x;
                                if (scalarValue36 == 0u)
                                {
                                    intermediateValue164 = 0.0f;
                                    intermediateValue166 = 0.0f;
                                    intermediateValue168 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue164 = bitwiseValue20 * float(scalarValue36 & 255u);
                                intermediateValue166 = bitwiseValue20 * float((scalarValue36 >> 8u) & 255u);
                                intermediateValue168 = bitwiseValue20 * float((scalarValue36 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue170;
                            float intermediateValue172;
                            float intermediateValue174;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue45;
                            bool comparisonValue46;
                            for (;;)
                            {
                                sumValue96 = sumValue40 + productValue85;
                                sumValue97 = sumValue41 + productValue86;
                                sumValue98 = sumValue42 + productValue87;
                                uint comparisonValue30 = ((((uint(sumValue40 >= 16.0f) << 1u) | uint(sumValue40 < 0.0f)) | (uint(sumValue41 < 0.0f) << 2u)) | (uint(sumValue41 >= 16.0f) << 3u)) | (uint(sumValue42 < 0.0f) << 4u);
                                comparisonValue45 = intermediateValue[comparisonValue30 | (uint(sumValue42 >= 16.0f) << 5u)];
                                comparisonValue46 = ((((comparisonValue30 | (uint(sumValue42 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue30 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue46)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                    {
                                        intermediateValue170 = 0.0f;
                                        intermediateValue172 = 0.0f;
                                        intermediateValue174 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue45).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue10 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue37 = loadedBufferValue10.x;
                                if (scalarValue37 == 0u)
                                {
                                    intermediateValue170 = 0.0f;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue174 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue170 = bitwiseValue22 * float(scalarValue37 & 255u);
                                intermediateValue172 = bitwiseValue22 * float((scalarValue37 >> 8u) & 255u);
                                intermediateValue174 = bitwiseValue22 * float((scalarValue37 >> 16u) & 255u);
                                break;
                            }
                            float sumValue50 = sumValue43 + productValue85;
                            float sumValue51 = sumValue44 + productValue86;
                            float sumValue52 = sumValue45 + productValue87;
                            uint comparisonValue31 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                            uint comparisonValue32 = comparisonValue31 | (uint(sumValue45 >= 16.0f) << 5u);
                            uint loadedBufferValue23;
                            if ((((comparisonValue32 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue31 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue32] & 31u))) == 0u)
                                {
                                    intermediateValue160 = intermediateValue129;
                                    intermediateValue161 = intermediateValue130;
                                    intermediateValue162 = intermediateValue131;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = intermediateValue170;
                                    intermediateValue171 = intermediateValue172;
                                    intermediateValue173 = intermediateValue174;
                                    intermediateValue175 = 0.0f;
                                    intermediateValue176 = 0.0f;
                                    intermediateValue177 = 0.0f;
                                    break;
                                }
                                loadedBufferValue23 = ((((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue52 - (floor(sumValue52 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue32]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue23 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue23);
                            uint scalarValue38 = loadedBufferValue12.x;
                            if (scalarValue38 == 0u)
                            {
                                intermediateValue160 = intermediateValue129;
                                intermediateValue161 = intermediateValue130;
                                intermediateValue162 = intermediateValue131;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = intermediateValue172;
                                intermediateValue173 = intermediateValue174;
                                intermediateValue175 = 0.0f;
                                intermediateValue176 = 0.0f;
                                intermediateValue177 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue160 = intermediateValue129;
                            intermediateValue161 = intermediateValue130;
                            intermediateValue162 = intermediateValue131;
                            intermediateValue163 = intermediateValue164;
                            intermediateValue165 = intermediateValue166;
                            intermediateValue167 = intermediateValue168;
                            intermediateValue169 = intermediateValue170;
                            intermediateValue171 = intermediateValue172;
                            intermediateValue173 = intermediateValue174;
                            intermediateValue175 = bitwiseValue23 * float(scalarValue38 & 255u);
                            intermediateValue176 = bitwiseValue23 * float((scalarValue38 >> 8u) & 255u);
                            intermediateValue177 = bitwiseValue23 * float((scalarValue38 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue45 = (((intermediateValue167 * productValue135) + (intermediateValue162 * productValue134)) + (intermediateValue173 * productValue136)) + (intermediateValue177 * productValue137);
                    branchMergedValue47 = (((intermediateValue165 * productValue135) + (intermediateValue161 * productValue134)) + (intermediateValue171 * productValue136)) + (intermediateValue176 * productValue137);
                    branchMergedValue48 = (((intermediateValue163 * productValue135) + (intermediateValue160 * productValue134)) + (intermediateValue169 * productValue136)) + (intermediateValue175 * productValue137);
                }
                else
                {
                    float intermediateValue179;
                    float intermediateValue180;
                    float intermediateValue181;
                    float intermediateValue182;
                    float intermediateValue184;
                    float intermediateValue186;
                    float intermediateValue188;
                    float intermediateValue190;
                    float intermediateValue192;
                    float intermediateValue194;
                    float intermediateValue195;
                    float intermediateValue196;
                    float intermediateValue82;
                    float intermediateValue83;
                    float intermediateValue84;
                    uint intermediateValue85;
                    uint intermediateValue86;
                    uint intermediateValue87;
                    float intermediateValue90;
                    float sumValue53;
                    float sumValue54;
                    float sumValue55;
                    float sumValue56;
                    float sumValue57;
                    float sumValue58;
                    bool comparisonValue17;
                    uint productValue138;
                    uint productValue139;
                    uint productValue140;
                    uint productValue141;
                    uint productValue142;
                    uint productValue143;
                    for (;;)
                    {
                        intermediateValue82 = floor(sumValue32);
                        intermediateValue83 = floor(sumValue33);
                        intermediateValue84 = floor(sumValue34);
                        float sumValue59 = sumValue32 - intermediateValue82;
                        float sumValue60 = sumValue33 - intermediateValue83;
                        float sumValue61 = sumValue34 - intermediateValue84;
                        uint comparisonValue34 = ((uint(sumValue60 >= sumValue61) << 1u) | uint(sumValue59 >= sumValue60)) | (uint(sumValue59 >= sumValue61) << 2u);
                        intermediateValue85 = uint(intermediateValue82);
                        intermediateValue86 = uint(intermediateValue83);
                        intermediateValue87 = uint(intermediateValue84);
                        float scalarValue39 = min(sumValue59, sumValue60);
                        float scalarValue40 = max(sumValue59, sumValue60);
                        intermediateValue90 = min(scalarValue39, sumValue61);
                        float scalarValue41 = max(scalarValue40, sumValue61);
                        float scalarValue42 = max(min(scalarValue40, sumValue61), scalarValue39);
                        sumValue53 = 1.0f - scalarValue41;
                        sumValue54 = scalarValue41 - scalarValue42;
                        sumValue55 = scalarValue42 - intermediateValue90;
                        sumValue56 = intermediateValue82 + 1.0f;
                        sumValue57 = intermediateValue83 + 1.0f;
                        sumValue58 = intermediateValue84 + 1.0f;
                        comparisonValue17 = (((intermediateValue82 >= 0.0f) && (intermediateValue83 >= 0.0f)) && (intermediateValue84 >= 0.0f)) && (((sumValue56 < 16.0f) && (sumValue57 < 16.0f)) && (sumValue58 < 16.0f));
                        productValue138 = 0u + (comparisonValue34 * 3u);
                        productValue139 = 1u + (comparisonValue34 * 3u);
                        productValue140 = 2u + (comparisonValue34 * 3u);
                        productValue141 = 0u + (comparisonValue34 * 3u);
                        productValue142 = 1u + (comparisonValue34 * 3u);
                        productValue143 = 2u + (comparisonValue34 * 3u);
                        if (comparisonValue17)
                        {
                            uint bitwiseValue25 = intermediateValue87 << 4u;
                            uint sumValue62 = intermediateValue86 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue62 + (intermediateValue85 << 8u);
                            uint4 loadedBufferValue13 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue43 = loadedBufferValue13.x;
                            float bitwiseValue15;
                            float intermediateValue117;
                            float intermediateValue118;
                            if (scalarValue43 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue117 = 0.0f;
                                intermediateValue118 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue43 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue43 & 255u);
                                intermediateValue117 = bitwiseValue27 * float((scalarValue43 >> 8u) & 255u);
                                intermediateValue118 = bitwiseValue27 * float((scalarValue43 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue14 = rdLoad_voxelBuffer(((intermediateValue1[productValue139] + sumValue62) + ((intermediateValue1[productValue138] + intermediateValue85) << 8u)) + ((intermediateValue1[productValue140] + intermediateValue87) << 4u));
                            uint scalarValue44 = loadedBufferValue14.x;
                            float bitwiseValue19;
                            float intermediateValue133;
                            float intermediateValue134;
                            if (scalarValue44 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue133 = 0.0f;
                                intermediateValue134 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue44 & 255u);
                                intermediateValue133 = bitwiseValue28 * float((scalarValue44 >> 8u) & 255u);
                                intermediateValue134 = bitwiseValue28 * float((scalarValue44 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(((intermediateValue2[productValue142] + sumValue62) + ((intermediateValue2[productValue141] + intermediateValue85) << 8u)) + ((intermediateValue2[productValue143] + intermediateValue87) << 4u));
                            uint scalarValue45 = loadedBufferValue16.x;
                            float bitwiseValue24;
                            float intermediateValue148;
                            float intermediateValue149;
                            if (scalarValue45 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue148 = 0.0f;
                                intermediateValue149 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue45 & 255u);
                                intermediateValue148 = bitwiseValue29 * float((scalarValue45 >> 8u) & 255u);
                                intermediateValue149 = bitwiseValue29 * float((scalarValue45 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue18 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue46 = loadedBufferValue18.x;
                            float branchMergedValue15;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue43;
                            float branchMergedValue44;
                            if (scalarValue46 == 0u)
                            {
                                branchMergedValue15 = 0.0f;
                                branchMergedValue32 = 0.0f;
                                branchMergedValue33 = 0.0f;
                                branchMergedValue34 = bitwiseValue15;
                                branchMergedValue35 = intermediateValue117;
                                branchMergedValue36 = intermediateValue118;
                                branchMergedValue37 = bitwiseValue19;
                                branchMergedValue38 = intermediateValue133;
                                branchMergedValue39 = intermediateValue134;
                                branchMergedValue40 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue148;
                                branchMergedValue44 = intermediateValue149;
                            }
                            else
                            {
                                float bitwiseValue30 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue15 = bitwiseValue30 * float(scalarValue46 & 255u);
                                branchMergedValue32 = bitwiseValue30 * float((scalarValue46 >> 8u) & 255u);
                                branchMergedValue33 = bitwiseValue30 * float((scalarValue46 >> 16u) & 255u);
                                branchMergedValue34 = bitwiseValue15;
                                branchMergedValue35 = intermediateValue117;
                                branchMergedValue36 = intermediateValue118;
                                branchMergedValue37 = bitwiseValue19;
                                branchMergedValue38 = intermediateValue133;
                                branchMergedValue39 = intermediateValue134;
                                branchMergedValue40 = bitwiseValue24;
                                branchMergedValue43 = intermediateValue148;
                                branchMergedValue44 = intermediateValue149;
                            }
                            intermediateValue179 = branchMergedValue34;
                            intermediateValue180 = branchMergedValue35;
                            intermediateValue181 = branchMergedValue36;
                            intermediateValue182 = branchMergedValue37;
                            intermediateValue184 = branchMergedValue38;
                            intermediateValue186 = branchMergedValue39;
                            intermediateValue188 = branchMergedValue40;
                            intermediateValue190 = branchMergedValue43;
                            intermediateValue192 = branchMergedValue44;
                            intermediateValue194 = branchMergedValue15;
                            intermediateValue195 = branchMergedValue32;
                            intermediateValue196 = branchMergedValue33;
                            break;
                        }
                        else
                        {
                            float intermediateValue136;
                            float intermediateValue137;
                            float intermediateValue138;
                            float sumValue70;
                            float sumValue71;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            float sumValue75;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            uint comparisonValue26;
                            bool comparisonValue27;
                            for (;;)
                            {
                                sumValue70 = float(intermediateValue1[productValue138]) + intermediateValue82;
                                sumValue71 = float(intermediateValue1[productValue139]) + intermediateValue83;
                                sumValue72 = float(intermediateValue1[productValue140]) + intermediateValue84;
                                sumValue73 = float(intermediateValue2[productValue141]) + intermediateValue82;
                                sumValue74 = float(intermediateValue2[productValue142]) + intermediateValue83;
                                sumValue75 = float(intermediateValue2[productValue143]) + intermediateValue84;
                                sumValue76 = intermediateValue82 + productValue85;
                                sumValue77 = intermediateValue83 + productValue86;
                                sumValue78 = intermediateValue84 + productValue87;
                                uint comparisonValue37 = ((((uint(intermediateValue82 >= 16.0f) << 1u) | uint(intermediateValue82 < 0.0f)) | (uint(intermediateValue83 < 0.0f) << 2u)) | (uint(intermediateValue83 >= 16.0f) << 3u)) | (uint(intermediateValue84 < 0.0f) << 4u);
                                comparisonValue26 = intermediateValue[comparisonValue37 | (uint(intermediateValue84 >= 16.0f) << 5u)];
                                comparisonValue27 = ((((comparisonValue37 | (uint(intermediateValue84 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue37 & 31u))) == 0u;
                                uint loadedBufferValue11;
                                if (comparisonValue27)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue26 & 31u))) == 0u)
                                    {
                                        intermediateValue136 = 0.0f;
                                        intermediateValue137 = 0.0f;
                                        intermediateValue138 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue11 = ((((uint(sumValue76 - (floor(sumValue76 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue26).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue11 = ((((intermediateValue85 << 8u) & 3840u) | (intermediateValue86 & 15u)) | ((intermediateValue87 << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue20 = rdLoad_voxelBuffer(loadedBufferValue11);
                                uint scalarValue47 = loadedBufferValue20.x;
                                if (scalarValue47 == 0u)
                                {
                                    intermediateValue136 = 0.0f;
                                    intermediateValue137 = 0.0f;
                                    intermediateValue138 = 0.0f;
                                    break;
                                }
                                float bitwiseValue31 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue136 = bitwiseValue31 * float(scalarValue47 & 255u);
                                intermediateValue137 = bitwiseValue31 * float((scalarValue47 >> 8u) & 255u);
                                intermediateValue138 = bitwiseValue31 * float((scalarValue47 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue183;
                            float intermediateValue185;
                            float intermediateValue187;
                            float sumValue90;
                            float sumValue91;
                            float sumValue92;
                            uint comparisonValue38;
                            bool comparisonValue39;
                            for (;;)
                            {
                                sumValue90 = sumValue70 + productValue85;
                                sumValue91 = sumValue71 + productValue86;
                                sumValue92 = sumValue72 + productValue87;
                                uint comparisonValue40 = ((((uint(sumValue70 >= 16.0f) << 1u) | uint(sumValue70 < 0.0f)) | (uint(sumValue71 < 0.0f) << 2u)) | (uint(sumValue71 >= 16.0f) << 3u)) | (uint(sumValue72 < 0.0f) << 4u);
                                comparisonValue38 = intermediateValue[comparisonValue40 | (uint(sumValue72 >= 16.0f) << 5u)];
                                comparisonValue39 = ((((comparisonValue40 | (uint(sumValue72 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue40 & 31u))) == 0u;
                                uint loadedBufferValue17;
                                if (comparisonValue39)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue38 & 31u))) == 0u)
                                    {
                                        intermediateValue183 = 0.0f;
                                        intermediateValue185 = 0.0f;
                                        intermediateValue187 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue17 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue91 - (floor(sumValue91 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue38).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue17 = ((((uint(sumValue70) << 8u) & 3840u) | (uint(sumValue71) & 15u)) | ((uint(sumValue72) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue22 = rdLoad_voxelBuffer(loadedBufferValue17);
                                uint scalarValue48 = loadedBufferValue22.x;
                                if (scalarValue48 == 0u)
                                {
                                    intermediateValue183 = 0.0f;
                                    intermediateValue185 = 0.0f;
                                    intermediateValue187 = 0.0f;
                                    break;
                                }
                                float bitwiseValue32 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue183 = bitwiseValue32 * float(scalarValue48 & 255u);
                                intermediateValue185 = bitwiseValue32 * float((scalarValue48 >> 8u) & 255u);
                                intermediateValue187 = bitwiseValue32 * float((scalarValue48 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue189;
                            float intermediateValue191;
                            float intermediateValue193;
                            float sumValue99;
                            float sumValue100;
                            float sumValue101;
                            uint comparisonValue48;
                            bool comparisonValue49;
                            for (;;)
                            {
                                sumValue99 = sumValue73 + productValue85;
                                sumValue100 = sumValue74 + productValue86;
                                sumValue101 = sumValue75 + productValue87;
                                uint comparisonValue41 = ((((uint(sumValue73 >= 16.0f) << 1u) | uint(sumValue73 < 0.0f)) | (uint(sumValue74 < 0.0f) << 2u)) | (uint(sumValue74 >= 16.0f) << 3u)) | (uint(sumValue75 < 0.0f) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue41 | (uint(sumValue75 >= 16.0f) << 5u)];
                                comparisonValue49 = ((((comparisonValue41 | (uint(sumValue75 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue41 & 31u))) == 0u;
                                uint loadedBufferValue21;
                                if (comparisonValue49)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue189 = 0.0f;
                                        intermediateValue191 = 0.0f;
                                        intermediateValue193 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue21 = ((((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue100 - (floor(sumValue100 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue101 - (floor(sumValue101 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue48).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue21 = ((((uint(sumValue73) << 8u) & 3840u) | (uint(sumValue74) & 15u)) | ((uint(sumValue75) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue24 = rdLoad_voxelBuffer(loadedBufferValue21);
                                uint scalarValue49 = loadedBufferValue24.x;
                                if (scalarValue49 == 0u)
                                {
                                    intermediateValue189 = 0.0f;
                                    intermediateValue191 = 0.0f;
                                    intermediateValue193 = 0.0f;
                                    break;
                                }
                                float bitwiseValue33 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue189 = bitwiseValue33 * float(scalarValue49 & 255u);
                                intermediateValue191 = bitwiseValue33 * float((scalarValue49 >> 8u) & 255u);
                                intermediateValue193 = bitwiseValue33 * float((scalarValue49 >> 16u) & 255u);
                                break;
                            }
                            float sumValue64 = sumValue56 + productValue85;
                            float sumValue69 = sumValue57 + productValue86;
                            float sumValue79 = sumValue58 + productValue87;
                            uint comparisonValue42 = ((((uint(sumValue56 >= 16.0f) << 1u) | uint(sumValue56 < 0.0f)) | (uint(sumValue57 < 0.0f) << 2u)) | (uint(sumValue57 >= 16.0f) << 3u)) | (uint(sumValue58 < 0.0f) << 4u);
                            uint comparisonValue44 = comparisonValue42 | (uint(sumValue58 >= 16.0f) << 5u);
                            uint loadedBufferValue25;
                            if ((((comparisonValue44 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue42 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue44] & 31u))) == 0u)
                                {
                                    intermediateValue179 = intermediateValue136;
                                    intermediateValue180 = intermediateValue137;
                                    intermediateValue181 = intermediateValue138;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = intermediateValue191;
                                    intermediateValue192 = intermediateValue193;
                                    intermediateValue194 = 0.0f;
                                    intermediateValue195 = 0.0f;
                                    intermediateValue196 = 0.0f;
                                    break;
                                }
                                loadedBufferValue25 = ((((uint(sumValue64 - (floor(sumValue64 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue79 - (floor(sumValue79 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue44]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue25 = ((((uint(sumValue56) << 8u) & 3840u) | (uint(sumValue57) & 15u)) | ((uint(sumValue58) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue26 = rdLoad_voxelBuffer(loadedBufferValue25);
                            uint scalarValue50 = loadedBufferValue26.x;
                            if (scalarValue50 == 0u)
                            {
                                intermediateValue179 = intermediateValue136;
                                intermediateValue180 = intermediateValue137;
                                intermediateValue181 = intermediateValue138;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = intermediateValue191;
                                intermediateValue192 = intermediateValue193;
                                intermediateValue194 = 0.0f;
                                intermediateValue195 = 0.0f;
                                intermediateValue196 = 0.0f;
                                break;
                            }
                            float bitwiseValue34 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue179 = intermediateValue136;
                            intermediateValue180 = intermediateValue137;
                            intermediateValue181 = intermediateValue138;
                            intermediateValue182 = intermediateValue183;
                            intermediateValue184 = intermediateValue185;
                            intermediateValue186 = intermediateValue187;
                            intermediateValue188 = intermediateValue189;
                            intermediateValue190 = intermediateValue191;
                            intermediateValue192 = intermediateValue193;
                            intermediateValue194 = bitwiseValue34 * float(scalarValue50 & 255u);
                            intermediateValue195 = bitwiseValue34 * float((scalarValue50 >> 8u) & 255u);
                            intermediateValue196 = bitwiseValue34 * float((scalarValue50 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue45 = (((intermediateValue186 * sumValue54) + (intermediateValue181 * sumValue53)) + (intermediateValue192 * sumValue55)) + (intermediateValue196 * intermediateValue90);
                    branchMergedValue47 = (((intermediateValue184 * sumValue54) + (intermediateValue180 * sumValue53)) + (intermediateValue190 * sumValue55)) + (intermediateValue195 * intermediateValue90);
                    branchMergedValue48 = (((intermediateValue182 * sumValue54) + (intermediateValue179 * sumValue53)) + (intermediateValue188 * sumValue55)) + (intermediateValue194 * intermediateValue90);
                }
                branchMergedValue9 = branchMergedValue45;
                branchMergedValue16 = branchMergedValue47;
                branchMergedValue17 = branchMergedValue48;
            }
            else
            {
                branchMergedValue9 = 0.0f;
                branchMergedValue16 = 0.0f;
                branchMergedValue17 = 0.0f;
            }
            intermediateValue27 = branchMergedValue17;
            intermediateValue28 = branchMergedValue16;
            intermediateValue29 = branchMergedValue9;
        }
        else
        {
            intermediateValue27 = clampedValue;
            intermediateValue28 = clampedValue1;
            intermediateValue29 = clampedValue2;
        }
        float productValue94 = varyingTexCoord1.y * varyingTexCoord1.y;
        float productValue99 = productValue94 * productValue94;
        float productValue100 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue94 - productValue99)) + productValue99) * varyingTexCoord1.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
        float productValue101 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue6;
        float dotProductValue11 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float productValue102 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * intermediateValue5) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue37 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue102;
        productValue38 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue102;
        productValue39 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue102;
        productValue40 = (max((productValue100 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue27), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue101;
        productValue41 = (max((productValue100 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue28), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue101;
        productValue42 = (max((productValue100 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue29), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue101;
        intermediateValue15 = intermediateValue16;
        intermediateValue17 = intermediateValue18;
        intermediateValue19 = intermediateValue20;
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
    }
    else
    {
        productValue37 = 0.0f;
        productValue38 = 0.0f;
        productValue39 = 0.0f;
        productValue40 = 0.0f;
        productValue41 = 0.0f;
        productValue42 = 0.0f;
        intermediateValue15 = 0.0f;
        intermediateValue17 = 0.0f;
        intermediateValue19 = 0.0f;
        intermediateValue21 = 0.0f;
        intermediateValue23 = 0.0f;
        intermediateValue25 = 0.0f;
    }
    float sumValue80 = ((productValue40 + productValue37) + intermediateValue15) + intermediateValue21;
    float sumValue81 = ((productValue41 + productValue38) + intermediateValue17) + intermediateValue23;
    float sumValue82 = ((productValue42 + productValue39) + intermediateValue19) + intermediateValue25;
    float sumValue83 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue84 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue86 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue9 = rsqrt(dot(float3(sumValue83, sumValue84, sumValue86), float3(sumValue83, sumValue84, sumValue86)));
    float productValue103 = inverseLengthValue9 * sumValue83;
    float productValue104 = inverseLengthValue9 * sumValue84;
    float productValue105 = inverseLengthValue9 * sumValue86;
    bool comparisonValue47 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    bool comparisonValue50 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
    float productValue46;
    float productValue47;
    float productValue48;
    if ((comparisonValue47 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue50)
    {
        productValue46 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue47 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue48 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
    }
    else
    {
        productValue46 = 0.0f;
        productValue47 = 0.0f;
        productValue48 = 0.0f;
    }
    bool comparisonValue51 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    bool comparisonValue52 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
    float intermediateValue34;
    float intermediateValue35;
    float intermediateValue36;
    float intermediateValue37;
    if (comparisonValue52)
    {
        float clampedValue12 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue10;
        float branchMergedValue18;
        float branchMergedValue19;
        float branchMergedValue20;
        if (clampedValue12 > 0.0f)
        {
            float branchMergedValue46;
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            if (comparisonValue47)
            {
                branchMergedValue46 = max(productValue48, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue49 = max(productValue47, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue50 = RD_UNIFORM_FOG_COLOR.x * max(productValue46, 1.0f);
                branchMergedValue51 = clampedValue12;
            }
            else
            {
                float clampedValue13 = clamp(((productValue104 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue106 = 1.0f - ((clampedValue13 * clampedValue13) * (3.0f - (clampedValue13 * 2.0f)));
                float productValue107 = (productValue106 * productValue106) * productValue106;
                float dotProductValue12 = dot(float3(productValue103, productValue104, productValue105), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue13 = dot(float3(productValue103, productValue104, productValue105), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue93 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue14 = clamp((productValue104 - sumValue93) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue93), 0.0f, 1.0f);
                float productValue108 = 1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)));
                float productValue109 = (productValue108 * productValue108) * productValue108;
                float productValue110 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue13 * dotProductValue13) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue15 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue16 = clamp(exp2(log2(max(dotProductValue13, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue111 = 1.809999942779541015625f - (clampedValue15 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue111) * productValue111);
                float productValue112 = 1.809999942779541015625f - (clampedValue16 * 1.7999999523162841796875f);
                float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue112) * productValue112);
                float productValue113 = clampedValue15 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue114 = clampedValue16 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue115 = (((productValue107 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue114 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue113 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue109 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue110)) * 0.079577468335628509521484375f;
                float productValue116 = (((productValue107 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue114 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue113 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue109 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue110)) * 0.079577468335628509521484375f;
                float productValue117 = (((productValue107 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue114 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue113 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue109 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue110)) * 0.079577468335628509521484375f;
                float branchMergedValue52;
                float branchMergedValue53;
                float branchMergedValue54;
                float branchMergedValue55;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue51 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, varyingTexCoord1.y);
                    branchMergedValue52 = ((productValue117 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue51) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue53 = ((productValue116 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue51) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue54 = ((productValue115 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue51) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue55 = clampedValue12;
                }
                else
                {
                    branchMergedValue52 = productValue117;
                    branchMergedValue53 = productValue116;
                    branchMergedValue54 = productValue115;
                    branchMergedValue55 = clampedValue12;
                }
                branchMergedValue46 = branchMergedValue52;
                branchMergedValue49 = branchMergedValue53;
                branchMergedValue50 = branchMergedValue54;
                branchMergedValue51 = branchMergedValue55;
            }
            branchMergedValue10 = branchMergedValue46;
            branchMergedValue18 = branchMergedValue49;
            branchMergedValue19 = branchMergedValue50;
            branchMergedValue20 = branchMergedValue51;
        }
        else
        {
            branchMergedValue10 = 0.0f;
            branchMergedValue18 = 0.0f;
            branchMergedValue19 = 0.0f;
            branchMergedValue20 = clampedValue12;
        }
        intermediateValue34 = branchMergedValue20;
        intermediateValue35 = branchMergedValue19;
        intermediateValue36 = branchMergedValue18;
        intermediateValue37 = branchMergedValue10;
    }
    else
    {
        intermediateValue34 = 0.0f;
        intermediateValue35 = 0.0f;
        intermediateValue36 = 0.0f;
        intermediateValue37 = 0.0f;
    }
    float productValue95;
    float productValue96;
    float productValue97;
    float productValue98;
    if (comparisonValue51)
    {
        float productValue118 = (multiplyAddValue5 + 1.0f) * 0.5f;
        float productValue119 = (multiplyAddValue6 + 1.0f) * 0.5f;
        uint scalarValue52 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue27 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue52))) + (-0.5f);
        uint sumValue94 = uint(min(int(uint(max(int(uint(int(multiplyAddValue27))), int(0u)))), int(scalarValue52 + 4294967294u)));
        float scalarValue53 = float(int(sumValue94));
        float sumValue102 = min(max(multiplyAddValue27 - scalarValue53, 0.0f), 1.0f);
        float4 sampledTextureValue4 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue118, productValue119, scalarValue53), 0.0f);
        float scalarValue54 = sampledTextureValue4.x;
        float scalarValue55 = sampledTextureValue4.y;
        float scalarValue56 = sampledTextureValue4.z;
        float scalarValue57 = sampledTextureValue4.w;
        float4 sampledTextureValue5 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue118, productValue119, float(int(sumValue94 + 1u))), 0.0f);
        productValue95 = ((sampledTextureValue5.x - scalarValue54) * sumValue102) + scalarValue54;
        productValue96 = ((sampledTextureValue5.y - scalarValue55) * sumValue102) + scalarValue55;
        productValue97 = ((sampledTextureValue5.z - scalarValue56) * sumValue102) + scalarValue56;
        productValue98 = ((sampledTextureValue5.w - scalarValue57) * sumValue102) + scalarValue57;
    }
    else
    {
        productValue95 = 0.0f;
        productValue96 = 0.0f;
        productValue97 = 0.0f;
        productValue98 = 1.0f;
    }
    float intermediateValue60;
    float intermediateValue61;
    float intermediateValue62;
    if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
    {
        bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
        float intermediateValue73;
        float intermediateValue74;
        float intermediateValue75;
        float multiplyAddValue28;
        float multiplyAddValue29;
        float multiplyAddValue30;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
            intermediateValue73 = productValue28;
            intermediateValue74 = productValue29;
            intermediateValue75 = productValue30;
            multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue30, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue29, productValue28 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue30, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue29, productValue28 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue30, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue29, productValue28 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        }
        else
        {
            intermediateValue73 = varyingTexCoord3.x;
            intermediateValue74 = varyingTexCoord3.y;
            intermediateValue75 = varyingTexCoord3.z;
            multiplyAddValue28 = multiplyAddValue;
            multiplyAddValue29 = multiplyAddValue1;
            multiplyAddValue30 = multiplyAddValue2;
        }
        float sumValue103 = intermediateValue73 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue104 = intermediateValue74 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue105 = intermediateValue75 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue10 = rsqrt(dot(float3(sumValue103, sumValue104, sumValue105), float3(sumValue103, sumValue104, sumValue105)));
        float productValue120 = inverseLengthValue10 * sumValue103;
        float productValue121 = inverseLengthValue10 * sumValue104;
        float productValue122 = inverseLengthValue10 * sumValue105;
        float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
        float dotProductValue14 = dot(float3(productValue120, productValue121, productValue122), float3(productValue9, productValue10, productValue11)) * 2.0f;
        float productValue123 = productValue120 - (dotProductValue14 * productValue9);
        float productValue124 = productValue121 - (dotProductValue14 * productValue10);
        float productValue125 = productValue122 - (dotProductValue14 * productValue11);
        float sumValue106 = 1.0f - intermediateValue6;
        float productValue126 = sumValue106 * sumValue106;
        float productValue127 = productValue126 * productValue126;
        precise float comparisonValue53 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue126 : (productValue127 * productValue127));
        precise float productValue144 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue53;
        uint scalarValue58 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
        float4 sampledTextureValue6 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue123, productValue124, productValue125, float(int(scalarValue58))), productValue144);
        float4 sampledTextureValue7 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue123, productValue124, productValue125, float(int(uint(int(scalarValue58 + 2u) - int(3u) * (int(scalarValue58 + 2u) / int(3u)))))), productValue144);
        float scalarValue59 = sampledTextureValue7.x;
        float scalarValue60 = sampledTextureValue7.y;
        float scalarValue61 = sampledTextureValue7.z;
        float productValue145 = ((sampledTextureValue6.x - scalarValue59) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue59;
        float productValue146 = ((sampledTextureValue6.y - scalarValue60) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue60;
        float productValue147 = ((sampledTextureValue6.z - scalarValue61) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue61;
        float productValue148 = (((clampedValue3 * clampedValue3) * clampedValue3) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
        float comparisonValue54 = (conditionValue1 ? (productValue145 * 301.72412109375f) : productValue145) * productValue148;
        float comparisonValue55 = (conditionValue1 ? (productValue146 * 301.72412109375f) : productValue146) * productValue148;
        float comparisonValue56 = (conditionValue1 ? (productValue147 * 301.72412109375f) : productValue147) * productValue148;
        float comparisonValue19;
        float comparisonValue20;
        float comparisonValue21;
        if (comparisonValue50)
        {
            float productValue149 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue150 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue151 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue152 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue153 = productValue152 * clampedValue;
            float productValue154 = productValue152 * clampedValue1;
            float productValue155 = productValue152 * clampedValue2;
            float clampedValue17 = clamp(dot(float3(productValue153, productValue154, productValue155), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue156 = ((clampedValue17 * (productValue153 - productValue149)) + productValue149) * intermediateValue4;
            float productValue159 = ((clampedValue17 * (productValue154 - productValue150)) + productValue150) * intermediateValue4;
            float productValue160 = ((clampedValue17 * (productValue155 - productValue151)) + productValue151) * intermediateValue4;
            float intermediateValue107;
            float intermediateValue108;
            float intermediateValue109;
            bool intermediateValue110;
            if (!(dot(float3(comparisonValue54, comparisonValue55, comparisonValue56), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue156, productValue159, productValue160), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
            {
                intermediateValue107 = productValue156;
                intermediateValue108 = productValue159;
                intermediateValue109 = productValue160;
                intermediateValue110 = true;
            }
            else
            {
                intermediateValue107 = 0.0f;
                intermediateValue108 = 0.0f;
                intermediateValue109 = 0.0f;
                intermediateValue110 = false;
            }
            comparisonValue19 = intermediateValue110 ? intermediateValue107 : comparisonValue54;
            comparisonValue20 = intermediateValue110 ? intermediateValue108 : comparisonValue55;
            comparisonValue21 = intermediateValue110 ? intermediateValue109 : comparisonValue56;
        }
        else
        {
            comparisonValue19 = comparisonValue54;
            comparisonValue20 = comparisonValue55;
            comparisonValue21 = comparisonValue56;
        }
        float4 sampledTextureValue8 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3((-0.0f) - (multiplyAddValue28 * inverseLengthValue11), (-0.0f) - (multiplyAddValue29 * inverseLengthValue11), (-0.0f) - (multiplyAddValue30 * inverseLengthValue11))), 0.0f, 1.0f), sumValue106));
        float scalarValue62 = sampledTextureValue8.x;
        float scalarValue63 = sampledTextureValue8.y;
        float quotientValue16 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
        float clampedValue18 = 1.0f - clamp(comparisonValue52 ? (quotientValue16 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue16 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
        float productValue162 = (((scalarValue62 * productValue33) + scalarValue63) * comparisonValue19) * clampedValue18;
        float productValue163 = (((scalarValue62 * productValue34) + scalarValue63) * comparisonValue20) * clampedValue18;
        float productValue166 = (((scalarValue62 * productValue35) + scalarValue63) * comparisonValue21) * clampedValue18;
        float branchMergedValue12;
        float branchMergedValue21;
        float branchMergedValue22;
        if (comparisonValue51)
        {
            float productValue167 = (multiplyAddValue5 + 1.0f) * 0.5f;
            float productValue168 = (multiplyAddValue6 + 1.0f) * 0.5f;
            uint scalarValue64 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue34 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue7, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue6, multiplyAddValue5 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue64))) + (-0.5f);
            uint sumValue107 = uint(min(int(uint(max(int(uint(int(multiplyAddValue34))), int(0u)))), int(scalarValue64 + 4294967294u)));
            float scalarValue65 = float(int(sumValue107));
            float4 sampledTextureValue9 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue167, productValue168, scalarValue65), 0.0f);
            float scalarValue66 = sampledTextureValue9.w;
            float sampledTextureValue10 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue167, productValue168, float(int(sumValue107 + 1u))), 0.0f).w - scalarValue66) * min(max(multiplyAddValue34 - scalarValue65, 0.0f), 1.0f)) + scalarValue66;
            branchMergedValue12 = sampledTextureValue10 * productValue166;
            branchMergedValue21 = sampledTextureValue10 * productValue163;
            branchMergedValue22 = sampledTextureValue10 * productValue162;
        }
        else
        {
            branchMergedValue12 = productValue166;
            branchMergedValue21 = productValue163;
            branchMergedValue22 = productValue162;
        }
        intermediateValue60 = branchMergedValue22;
        intermediateValue61 = branchMergedValue21;
        intermediateValue62 = branchMergedValue12;
    }
    else
    {
        intermediateValue60 = 0.0f;
        intermediateValue61 = 0.0f;
        intermediateValue62 = 0.0f;
    }
    float productValue171 = ((productValue98 * (((intermediateValue35 - sumValue80) * intermediateValue34) + sumValue80)) + productValue95) + intermediateValue60;
    float productValue172 = ((productValue98 * (((intermediateValue36 - sumValue81) * intermediateValue34) + sumValue81)) + productValue96) + intermediateValue61;
    float productValue173 = ((productValue98 * (((intermediateValue37 - sumValue82) * intermediateValue34) + sumValue82)) + productValue97) + intermediateValue62;
    float productValue128;
    float productValue129;
    float productValue130;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue11 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
        productValue128 = sampledTextureValue11 * productValue171;
        productValue129 = sampledTextureValue11 * productValue172;
        productValue130 = sampledTextureValue11 * productValue173;
    }
    else
    {
        productValue128 = productValue171;
        productValue129 = productValue172;
        productValue130 = productValue173;
    }
    fragmentColor0.x = productValue128;
    fragmentColor0.y = productValue129;
    fragmentColor0.z = productValue130;
    fragmentColor0.w = sampledTextureValue.w * varyingColor0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor1 = stage_input.varyingColor1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
