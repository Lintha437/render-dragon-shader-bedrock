// MeshFallbackForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif


#include "../../include/materials/MeshFallbackForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  float2 varyingTexCoord0 : TEXCOORD0,
  float3 varyingNormal0 : NORMAL0,
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
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25,workingVector26,workingVector27,workingVector28,workingVector29,workingVector30,workingVector31;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_USE_TEXTURES == RD_ON
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector2.xyz = max(float3(0,0,0), workingVector1.xyz);
  workingVector2.xyz = log2(workingVector2.xyz);
  workingVector2.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector2.xyz;
  workingVector2.xyz = exp2(workingVector2.xyz);
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * varyingColor0.xyz + float3(0.0549999997,0.0549999997,0.0549999997);
  workingVector0.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector0.xyz;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector1.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector1.xyz);
  workingVector0.xyz = workingVector1.xyz ? workingVector3.xyz : workingVector0.xyz;
  workingVector0.xyz = workingVector1.www ? workingVector2.xyz : workingVector0.xyz;
  fragmentColor0.w = varyingColor0.w * workingVector0.w;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  workingVector0.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * varyingColor0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.xyz = max(float3(0,0,0), workingVector0.xyz);
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
  workingVector2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector3.xyz = RD_UNIFORM_CURRENT_COLOR.xyz * varyingColor0.xyz + float3(0.0549999997,0.0549999997,0.0549999997);
  workingVector3.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector3.xyz;
  workingVector3.xyz = log2(workingVector3.xyz);
  workingVector3.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector3.xyz;
  workingVector3.xyz = exp2(workingVector3.xyz);
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w;
#endif
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_LIGHTING_ENABLED_AND_ADAPTIVE_EMISSIVE.x);
  if (workingVector0.w != 0) {
    workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
    workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector1.xyzw;
    workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector1.xyzw;
    workingVector1.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector1.xyzw;
    workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
    workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
    workingVector2.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
    workingVector1.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector1.wwww + workingVector2.xyzw;
    workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector1.yyyy;
    workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector1.xxxx + workingVector2.xyzw;
    workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector1.zzzz + workingVector2.xyzw;
    workingVector2.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector1.wwww + workingVector2.xyzw;
    workingVector2.xyz = workingVector2.xyz / workingVector2.www;
    workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector3.xyz = varyingNormal0.xyz * workingVector0.www;
    workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector3.yyy;
    workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector3.xxx + workingVector4.xyz;
    workingVector4.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector3.zzz + workingVector4.xyz;
    workingVector5.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
    workingVector6.xyz = ddx_coarse(workingVector1.zxy);
    workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xyz = -workingVector1.yzx;
    workingVector7.xyz = ddy_coarse(workingVector7.xyz);
    workingVector1.w = dot(workingVector7.xyz, workingVector7.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector7.xyz = -workingVector1.xyz;
    workingVector8.xyz = ddy_coarse(workingVector7.yzx);
    workingVector1.w = dot(workingVector8.xyz, workingVector8.xyz);
#endif
    workingVector1.w = rsqrt(workingVector1.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xyz = workingVector7.xyz * workingVector1.www;
    workingVector8.xyz = workingVector7.xyz * workingVector6.xyz;
    workingVector6.xyz = workingVector6.zxy * workingVector7.yzx + -workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = workingVector8.xyz * workingVector1.www;
    workingVector9.xyz = workingVector8.xyz * workingVector6.xyz;
    workingVector6.xyz = workingVector6.zxy * workingVector8.yzx + -workingVector9.xyz;
#endif
    workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector6.yyy;
    workingVector6.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector6.xxx + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector6.yyy;
    workingVector6.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector6.xxx + workingVector8.xyz;
#endif
    workingVector6.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector6.zzz + workingVector6.xyw;
    workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector6.xyz = workingVector6.xyz * workingVector1.www;
    workingVector6.xyz = workingVector6.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
    workingVector6.xyz = round(workingVector6.xyz);
    workingVector6.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector6.xyz;
    workingVector1.w = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector6.xyz = workingVector6.xyz * workingVector1.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xyz = workingVector5.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
    workingVector7.xyz = floor(workingVector7.xyz);
    workingVector7.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector7.xyz + workingVector5.xyz;
    workingVector7.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector7.xyz;
    workingVector1.w = dot(workingVector7.xyz, workingVector6.xyz);
    workingVector6.xyz = -workingVector1.www * workingVector6.xyz + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = workingVector5.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
    workingVector8.xyz = floor(workingVector8.xyz);
    workingVector8.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector8.xyz + workingVector5.xyz;
    workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector8.xyz;
    workingVector1.w = dot(workingVector8.xyz, workingVector6.xyz);
    workingVector6.xyz = -workingVector1.www * workingVector6.xyz + workingVector8.xyz;
#endif
    workingVector6.xyz = workingVector6.xyz + workingVector5.xyz;
    workingVector6.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector6.xyz;
    workingVector1.w = 1 + -RD_UNIFORM_MERS_UNIFORMS.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector7.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector0.xyz;
    workingVector7.xyz = workingVector1.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector8.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector0.xyz;
    workingVector8.xyz = workingVector1.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector8.xyz;
#endif
    workingVector2.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
    workingVector2.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector2.w;
    workingVector2.w = RD_COMPARISON_MASK(workingVector2.w < 9.99999975e-005);
    workingVector3.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
    workingVector2.w = workingVector2.w ? workingVector3.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector8.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
    workingVector3.w = workingVector8.x * 0.600000024 + 0.400000006;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
    workingVector3.w = workingVector9.x * 0.600000024 + 0.400000006;
#endif
    workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector8.y = workingVector8.x * workingVector3.w;
    workingVector3.w = workingVector8.x * workingVector8.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.y = workingVector9.x * workingVector3.w;
    workingVector3.w = workingVector9.x * workingVector9.x;
#endif
    workingVector3.w = workingVector3.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector8.z = workingVector8.x * workingVector3.w;
    workingVector8.xyz = min(float3(1,1,1), workingVector8.xyz);
    workingVector8.xyz = workingVector2.www ? workingVector8.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
    workingVector9.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
    workingVector2.w = workingVector9.y ? workingVector9.x : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.z = workingVector9.x * workingVector3.w;
    workingVector9.xyz = min(float3(1,1,1), workingVector9.xyz);
    workingVector9.xyz = workingVector2.www ? workingVector9.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
    workingVector10.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
    workingVector2.w = workingVector10.y ? workingVector10.x : 0;
#endif
    if (workingVector2.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
      workingVector9.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector9.xy;
      workingVector9.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
      workingVector2.w = materialTexture4.Sample(textureSampler4, workingVector9.xyz).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector10.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
      workingVector10.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector10.xy;
      workingVector10.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
      workingVector2.w = materialTexture4.Sample(textureSampler4, workingVector10.xyz).x;
#endif
      workingVector2.w = workingVector2.w + workingVector2.w;
      workingVector3.w = saturate(workingVector3.y);
      workingVector2.w = workingVector3.w * workingVector2.w;
      workingVector2.w = log2(workingVector2.w);
      workingVector2.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector2.w;
      workingVector2.w = exp2(workingVector2.w);
      workingVector3.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
      workingVector2.w = workingVector3.w * workingVector2.w;
    } else {
      workingVector2.w = 1;
    }
    workingVector3.w = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector3.w = sqrt(workingVector3.w);
    workingVector4.w = RD_COMPARISON_MASK(workingVector2.z != 1.000000);
    if (workingVector4.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
      workingVector5.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
      workingVector4.w = workingVector4.w ? workingVector5.w : 0;
      if (workingVector4.w == 0) {
        workingVector4.w = 9.99999975e-005 + workingVector3.w;
        workingVector9.xyz = workingVector1.xyz / workingVector4.www;
        workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * RD_UNIFORM_MERS_UNIFORMS.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector4.w = 9.99999975e-005 + workingVector3.w;
      workingVector10.xyz = workingVector1.xyz / workingVector4.www;
      workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * RD_UNIFORM_MERS_UNIFORMS.w;
      workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
      workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
      workingVector11.xyz = workingVector5.www ? workingVector6.xyz : varyingTexCoord3.xyz;
      workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
      workingVector6.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
      workingVector5.w = workingVector5.w ? workingVector6.w : 0;
      if (workingVector5.w == 0) {
#endif
        workingVector5.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
        workingVector5.w = RD_COMPARISON_MASK((int)workingVector5.w == 1);
        if (workingVector5.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector5.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
          workingVector5.w = RD_COMPARISON_MASK(0 < (int)workingVector5.w);
          workingVector10.xyz = workingVector5.www ? workingVector6.xyz : varyingTexCoord3.xyz;
          workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
          workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector11.xyz;
          workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector11.xyz;
          workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector11.xyz;
          workingVector5.w = dot(workingVector11.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
          workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector12.xyz;
          workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector12.xyz;
          workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector12.xyz;
          workingVector5.w = dot(workingVector12.xyz, workingVector12.xyz);
#endif
          workingVector5.w = rsqrt(workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = workingVector11.xyz * workingVector5.www;
          workingVector5.w = dot(workingVector4.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = workingVector12.xyz * workingVector5.www;
          workingVector5.w = dot(workingVector4.xyz, workingVector12.xyz);
#endif
          workingVector5.w = max(0, workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector3.xyz;
#endif
          workingVector6.w = 1 + -workingVector5.w;
          workingVector6.w = max(0, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector10.xyz = workingVector11.xyz * workingVector6.www + workingVector10.xyz;
          workingVector11.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
          workingVector6.w = dot(workingVector11.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = workingVector12.xyz * workingVector6.www + workingVector11.xyz;
          workingVector13.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
          workingVector6.w = dot(workingVector13.xyzw, float4(1,1,1,1));
#endif
          workingVector6.w = (int)workingVector6.w;
          workingVector7.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.xyz = float3(1,1,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.xyz = float3(1,1,0);
#endif
          workingVector8.w = 0;
          while (true) {
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w >= (int)workingVector6.w);
            if (workingVector9.w != 0) break;
            workingVector9.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector8.w+0].xyzw);
            workingVector9.w = (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector9.w = (int)workingVector9.w + (int)workingVector11.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.w = (int)workingVector9.w + (int)workingVector13.z;
#endif
            workingVector9.w = min(8, (int)workingVector9.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xy = workingVector11.xy;
            workingVector10.w = workingVector11.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xy = workingVector13.xy;
            workingVector10.w = workingVector13.z;
#endif
            while (true) {
              workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector9.w);
              if (workingVector11.w != 0) break;
              workingVector11.w = (uint)workingVector10.w << 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = fragmentVectorConstants1[workingVector11.w+94].xyz * workingVector10.yyy;
              workingVector13.xyz = fragmentVectorConstants1[workingVector11.w+93].xyz * workingVector10.xxx + workingVector13.xyz;
              workingVector13.xyz = fragmentVectorConstants1[workingVector11.w+95].xyz * workingVector10.zzz + workingVector13.xyz;
              workingVector13.xyz = fragmentVectorConstants1[workingVector11.w+96].xyz + workingVector13.xyz;
              workingVector14.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector13.xyz));
              workingVector12.z = workingVector14.y ? workingVector14.x : 0;
              workingVector12.z = workingVector14.z ? workingVector12.z : 0;
              if (workingVector12.z != 0) {
                workingVector12.z = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector10.w+0].xyzw);
                workingVector12.z = max(workingVector12.z, workingVector5.w);
                workingVector12.z = min(1, workingVector12.z);
                workingVector12.w = -workingVector12.z * workingVector12.z + 1;
                workingVector12.w = sqrt(workingVector12.w);
                workingVector12.z = workingVector12.w / workingVector12.z;
                workingVector12.z = fragmentVectorConstants1[workingVector10.w+48].z * workingVector12.z + fragmentVectorConstants1[workingVector10.w+48].y;
                workingVector14.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector15.xyz = fragmentVectorConstants1[workingVector11.w+96].xyz * workingVector12.yyy;
              workingVector15.xyz = fragmentVectorConstants1[workingVector11.w+95].xyz * workingVector12.xxx + workingVector15.xyz;
              workingVector15.xyz = fragmentVectorConstants1[workingVector11.w+97].xyz * workingVector12.zzz + workingVector15.xyz;
              workingVector15.xyz = fragmentVectorConstants1[workingVector11.w+98].xyz + workingVector15.xyz;
              workingVector16.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector15.xyz));
              workingVector12.w = workingVector16.y ? workingVector16.x : 0;
              workingVector12.w = workingVector16.z ? workingVector12.w : 0;
              if (workingVector12.w != 0) {
                workingVector12.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector10.w+0].xyzw);
                workingVector12.w = max(workingVector12.w, workingVector5.w);
                workingVector12.w = min(1, workingVector12.w);
                workingVector13.w = -workingVector12.w * workingVector12.w + 1;
                workingVector13.w = sqrt(workingVector13.w);
                workingVector12.w = workingVector13.w / workingVector12.w;
                workingVector12.w = fragmentVectorConstants1[workingVector10.w+48].z * workingVector12.w + fragmentVectorConstants1[workingVector10.w+48].y;
                workingVector16.xy = workingVector15.xy * float2(0.5,0.5) + float2(0.5,0.5);
#endif
                workingVector11.w = dot(fragmentVectorConstants1[workingVector11.w+18].xyzw, fragmentVectorConstants1[workingVector11.w+18].xyzw);
                workingVector11.w = sqrt(workingVector11.w);
                workingVector11.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector12.w = fragmentVectorConstants1[workingVector10.w+48].w + 0.5;
                workingVector12.w = (int)workingVector12.w;
                workingVector12.w = max(1, (int)workingVector12.w);
                workingVector12.w = min(9, (int)workingVector12.w);
                workingVector12.w = workingVector7.w ? 1 : workingVector12.w;
                workingVector13.x = (uint)workingVector12.w >> 1;
                workingVector14.z = 1 + -workingVector14.y;
                workingVector15.z = (int)workingVector10.w;
                workingVector12.z = workingVector13.z + -workingVector12.z;
                workingVector13.yw = float2(0,0);
                workingVector14.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.w = fragmentVectorConstants1[workingVector10.w+48].w + 0.5;
                workingVector13.w = (int)workingVector13.w;
                workingVector13.w = max(1, (int)workingVector13.w);
                workingVector13.w = min(9, (int)workingVector13.w);
                workingVector13.w = workingVector7.w ? 1 : workingVector13.w;
                workingVector14.z = (uint)workingVector13.w >> 1;
                workingVector16.z = 1 + -workingVector16.y;
                workingVector17.z = (int)workingVector10.w;
                workingVector12.w = workingVector15.z + -workingVector12.w;
                workingVector15.xy = float2(0,0);
                workingVector14.w = 0;
#endif
                while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector14.w = RD_COMPARISON_MASK((int)workingVector14.y >= (int)workingVector12.w);
                  if (workingVector14.w != 0) break;
                  workingVector14.w = (int)-workingVector13.x + (int)workingVector14.y;
                  workingVector14.w = (int)workingVector14.w;
                  workingVector16.y = 0.5 + workingVector14.w;
                  workingVector16.zw = workingVector13.wy;
                  workingVector14.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector15.w = RD_COMPARISON_MASK((int)workingVector14.w >= (int)workingVector13.w);
                  if (workingVector15.w != 0) break;
                  workingVector15.w = (int)-workingVector14.z + (int)workingVector14.w;
                  workingVector15.w = (int)workingVector15.w;
                  workingVector18.y = 0.5 + workingVector15.w;
                  workingVector16.yw = workingVector15.yx;
                  workingVector15.w = 0;
#endif
                  while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    workingVector15.w = RD_COMPARISON_MASK((int)workingVector14.w >= (int)workingVector12.w);
                    if (workingVector15.w != 0) break;
                    workingVector15.w = (int)-workingVector13.x + (int)workingVector14.w;
                    workingVector15.w = (int)workingVector15.w;
                    workingVector16.x = 0.5 + workingVector15.w;
                    workingVector17.xy = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector16.xy;
                    workingVector17.xy = fragmentVectorConstants1[workingVector10.w+48].xx * workingVector17.xy;
                    workingVector15.xy = workingVector14.xz * fragmentVectorConstants1[workingVector10.w+48].xx + workingVector17.xy;
                    workingVector17.xyzw = materialTexture6.Gather(textureSampler6, workingVector15.xyz).xyzw;
                    workingVector15.xy = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                    workingVector15.xy = frac(workingVector15.xy);
                    workingVector18.xyzw = -workingVector17.xyzw + workingVector13.zzzz;
                    workingVector18.xyzw = saturate(workingVector18.xyzw * workingVector11.wwww);
                    workingVector19.xyzw = workingVector18.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                    workingVector18.xyzw = workingVector18.xyzw * workingVector18.xyzw;
                    workingVector18.xyzw = -workingVector19.xyzw * workingVector18.xyzw + float4(1,1,1,1);
                    workingVector18.yz = workingVector18.zy + -workingVector18.wx;
                    workingVector18.xy = workingVector15.xx * workingVector18.yz + workingVector18.wx;
                    workingVector15.w = workingVector18.y + -workingVector18.x;
                    workingVector15.w = workingVector15.y * workingVector15.w + workingVector18.x;
                    workingVector16.w = workingVector16.w + workingVector15.w;
                    workingVector15.w = RD_COMPARISON_MASK(workingVector17.w >= workingVector12.z);
                    workingVector15.w = workingVector15.w ? 1.000000 : 0;
                    workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector12.zzzz);
                    workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                    workingVector17.xy = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                    workingVector17.xy = workingVector18.zy + workingVector17.xy;
                    workingVector17.xy = workingVector15.xx * workingVector17.xy + workingVector18.wx;
                    workingVector15.x = workingVector17.y + -workingVector17.x;
                    workingVector15.x = workingVector15.y * workingVector15.x + workingVector17.x;
                    workingVector15.xw = workingVector16.zz + workingVector15.xw;
                    workingVector16.z = workingVector7.w ? workingVector15.w : workingVector15.x;
                    workingVector14.w = (int)workingVector14.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    workingVector17.w = RD_COMPARISON_MASK((int)workingVector15.w >= (int)workingVector13.w);
                    if (workingVector17.w != 0) break;
                    workingVector17.w = (int)-workingVector14.z + (int)workingVector15.w;
                    workingVector17.w = (int)workingVector17.w;
                    workingVector18.x = 0.5 + workingVector17.w;
                    workingVector18.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector18.xy;
                    workingVector18.xz = fragmentVectorConstants1[workingVector10.w+48].xx * workingVector18.xz;
                    workingVector17.xy = workingVector16.xz * fragmentVectorConstants1[workingVector10.w+48].xx + workingVector18.xz;
                    workingVector19.xyzw = materialTexture6.Gather(textureSampler6, workingVector17.xyz).xyzw;
                    workingVector17.xy = workingVector17.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                    workingVector17.xy = frac(workingVector17.xy);
                    workingVector20.xyzw = -workingVector19.xyzw + workingVector15.zzzz;
                    workingVector20.xyzw = saturate(workingVector20.xyzw * workingVector11.wwww);
                    workingVector21.xyzw = workingVector20.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                    workingVector20.xyzw = workingVector20.xyzw * workingVector20.xyzw;
                    workingVector20.xyzw = -workingVector21.xyzw * workingVector20.xyzw + float4(1,1,1,1);
                    workingVector18.xz = workingVector20.zy + -workingVector20.wx;
                    workingVector18.xz = workingVector17.xx * workingVector18.xz + workingVector20.wx;
                    workingVector17.w = workingVector18.z + -workingVector18.x;
                    workingVector17.w = workingVector17.y * workingVector17.w + workingVector18.x;
                    workingVector16.w = workingVector17.w + workingVector16.w;
                    workingVector17.w = RD_COMPARISON_MASK(workingVector19.w >= workingVector12.w);
                    workingVector17.w = workingVector17.w ? 1.000000 : 0;
                    workingVector19.xyzw = RD_COMPARISON_MASK(workingVector19.xyzw >= workingVector12.wwww);
                    workingVector20.xyzw = workingVector19.xyzw ? float4(1,1,1,1) : 0;
                    workingVector18.xz = workingVector19.wx ? float2(-1,-1) : float2(-0,-0);
                    workingVector18.xz = workingVector20.zy + workingVector18.xz;
                    workingVector18.xz = workingVector17.xx * workingVector18.xz + workingVector20.wx;
                    workingVector17.x = workingVector18.z + -workingVector18.x;
                    workingVector17.x = workingVector17.y * workingVector17.x + workingVector18.x;
                    workingVector17.xw = workingVector17.xw + workingVector16.yy;
                    workingVector16.y = workingVector7.w ? workingVector17.w : workingVector17.x;
                    workingVector15.w = (int)workingVector15.w + 1;
#endif
                  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector13.yw = workingVector16.wz;
                  workingVector14.y = (int)workingVector14.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector15.xy = workingVector16.wy;
                  workingVector14.w = (int)workingVector14.w + 1;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector11.w = (int)workingVector12.w * (int)workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector11.w = (int)workingVector13.w * (int)workingVector13.w;
#endif
                workingVector11.w = (int)workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector12.zw = workingVector13.yw / workingVector11.ww;
                workingVector12.xy = min(workingVector12.xy, workingVector12.zw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector14.zw = workingVector15.xy / workingVector11.ww;
                workingVector14.xy = min(workingVector14.xy, workingVector14.zw);
#endif
                workingVector10.w = workingVector9.w;
              } else {
                workingVector10.w = (int)workingVector10.w + 1;
              }
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xy = workingVector12.xy;
            workingVector11.z = workingVector10.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xy = workingVector14.xy;
            workingVector13.z = workingVector10.w;
#endif
            workingVector8.w = (int)workingVector8.w + 1;
          }
          workingVector6.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
          workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
          if (workingVector6.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector10.yyy;
            workingVector12.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector10.xxx + workingVector12.xyz;
            workingVector12.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector10.zzz + workingVector12.xyz;
            workingVector12.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector12.xyz;
            workingVector13.xy = workingVector12.xy * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector13.z = 1 + -workingVector13.y;
            workingVector11.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector13.xz;
            workingVector12.xy = RD_COMPARISON_MASK(workingVector11.zw >= float2(0,0));
            workingVector13.xy = RD_COMPARISON_MASK(workingVector11.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
            workingVector6.w = workingVector12.x ? workingVector13.x : 0;
            workingVector6.w = workingVector12.y ? workingVector6.w : 0;
            workingVector6.w = workingVector13.y ? workingVector6.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector12.yyy;
            workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector12.xxx + workingVector14.xyz;
            workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector12.zzz + workingVector14.xyz;
            workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector14.xyz;
            workingVector15.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector15.z = 1 + -workingVector15.y;
            workingVector13.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector15.xz;
            workingVector14.xy = RD_COMPARISON_MASK(workingVector13.zw >= float2(0,0));
            workingVector15.xy = RD_COMPARISON_MASK(workingVector13.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
            workingVector6.w = workingVector14.x ? workingVector15.x : 0;
            workingVector6.w = workingVector14.y ? workingVector6.w : 0;
            workingVector6.w = workingVector15.y ? workingVector6.w : 0;
#endif
            if (workingVector6.w != 0) {
              workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
              workingVector6.w = min(1, workingVector6.w);
              workingVector8.w = -workingVector6.w * workingVector6.w + 1;
              workingVector8.w = sqrt(workingVector8.w);
              workingVector6.w = workingVector8.w / workingVector6.w;
              workingVector6.w = fragmentVectorConstants1[workingVector10.w+48].z * workingVector6.w + fragmentVectorConstants1[workingVector10.w+48].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector6.w = workingVector12.z + -workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector6.w = workingVector14.z + -workingVector6.w;
#endif
              workingVector6.w = min(1, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.xy = workingVector7.ww ? float2(1,1) : float2(2,4);
#endif
              workingVector8.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.z = 1 + workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector15.z = 1 + workingVector8.w;
#endif
              workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
              workingVector9.w = 0;
              workingVector10.w = 0;
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector12.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector12.x);
                if (workingVector12.z != 0) break;
                workingVector12.z = (int)workingVector8.w + (int)workingVector10.w;
                workingVector12.z = (int)workingVector12.z;
                workingVector14.y = 0.5 + workingVector12.z;
                workingVector12.z = workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector14.x);
                if (workingVector11.w != 0) break;
                workingVector11.w = (int)workingVector8.w + (int)workingVector10.w;
                workingVector11.w = (int)workingVector11.w;
                workingVector16.y = 0.5 + workingVector11.w;
                workingVector11.w = workingVector9.w;
#endif
                workingVector12.w = 0;
                while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector12.x);
                  if (workingVector13.w != 0) break;
                  workingVector13.w = (int)workingVector8.w + (int)workingVector12.w;
                  workingVector13.w = (int)workingVector13.w;
                  workingVector14.x = 0.5 + workingVector13.w;
                  workingVector14.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector14.xy;
                  workingVector13.xy = workingVector14.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector11.zw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector14.z = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector14.x);
                  if (workingVector14.z != 0) break;
                  workingVector14.z = (int)workingVector8.w + (int)workingVector12.w;
                  workingVector14.z = (int)workingVector14.z;
                  workingVector16.x = 0.5 + workingVector14.z;
                  workingVector14.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector16.xy;
                  workingVector15.xy = workingVector14.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector13.zw;
#endif
                  if (workingVector7.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    workingVector13.w = materialTexture6.SampleLevel(textureSampler6, workingVector13.xyz, 0).x;
                    workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector6.w);
                    workingVector13.w = workingVector13.w ? 1.000000 : 0;
                    workingVector12.z = workingVector13.w + workingVector12.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    workingVector14.z = materialTexture6.SampleLevel(textureSampler6, workingVector15.xyz, 0).x;
                    workingVector14.z = RD_COMPARISON_MASK(workingVector14.z >= workingVector6.w);
                    workingVector14.z = workingVector14.z ? 1.000000 : 0;
                    workingVector11.w = workingVector14.z + workingVector11.w;
#endif
                  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    workingVector15.xyzw = materialTexture6.Gather(textureSampler6, workingVector13.xyz).xyzw;
                    workingVector13.xy = workingVector13.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                    workingVector13.xy = frac(workingVector13.xy);
                    workingVector15.xyzw = RD_COMPARISON_MASK(workingVector15.xyzw >= workingVector6.wwww);
                    workingVector16.xyzw = workingVector15.xyzw ? float4(1,1,1,1) : 0;
                    workingVector14.xz = workingVector15.wx ? float2(-1,-1) : float2(-0,-0);
                    workingVector14.xz = workingVector16.zy + workingVector14.xz;
                    workingVector13.xw = workingVector13.xx * workingVector14.xz + workingVector16.wx;
                    workingVector13.w = workingVector13.w + -workingVector13.x;
                    workingVector13.x = workingVector13.y * workingVector13.w + workingVector13.x;
                    workingVector12.z = workingVector13.x + workingVector12.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    workingVector17.xyzw = materialTexture6.Gather(textureSampler6, workingVector15.xyz).xyzw;
                    workingVector14.zw = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                    workingVector14.zw = frac(workingVector14.zw);
                    workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector6.wwww);
                    workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                    workingVector15.xy = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                    workingVector15.xy = workingVector18.zy + workingVector15.xy;
                    workingVector15.xy = workingVector14.zz * workingVector15.xy + workingVector18.wx;
                    workingVector14.z = workingVector15.y + -workingVector15.x;
                    workingVector14.z = workingVector14.w * workingVector14.z + workingVector15.x;
                    workingVector11.w = workingVector14.z + workingVector11.w;
#endif
                  }
                  workingVector12.w = (int)workingVector12.w + 1;
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector9.w = workingVector12.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector9.w = workingVector11.w;
#endif
                workingVector10.w = (int)workingVector10.w + 1;
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector6.w = workingVector9.w / workingVector12.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector6.w = workingVector9.w / workingVector14.y;
#endif
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
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector10.yyyy;
            workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector10.xxxx + workingVector12.xyzw;
            workingVector10.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector10.zzzz + workingVector12.xyzw;
            workingVector10.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector10.xyzw;
            workingVector10.xyzw = workingVector10.xyzw / workingVector10.wwww;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector12.yyyy;
            workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector12.xxxx + workingVector14.xyzw;
            workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector12.zzzz + workingVector14.xyzw;
            workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector12.xyzw;
            workingVector12.xyzw = workingVector12.xyzw / workingVector12.wwww;
#endif
            workingVector5.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector5.w);
            workingVector5.w = min(1, workingVector5.w);
            workingVector8.w = -workingVector5.w * workingVector5.w + 1;
            workingVector8.w = sqrt(workingVector8.w);
            workingVector5.w = workingVector8.w / workingVector5.w;
            workingVector5.w = fragmentVectorConstants1[workingVector10.w+48].z * workingVector5.w + fragmentVectorConstants1[workingVector10.w+48].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector5.w = workingVector5.w / workingVector10.w;
            workingVector5.w = workingVector10.z + -workingVector5.w;
            workingVector10.xy = workingVector10.xy * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector10.z = 1 + -workingVector10.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector5.w = workingVector5.w / workingVector12.w;
            workingVector5.w = workingVector12.z + -workingVector5.w;
            workingVector12.xy = workingVector12.xy * float2(0.5,0.5) + float2(0.5,0.5);
            workingVector12.z = 1 + -workingVector12.y;
#endif
            workingVector8.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
            workingVector8.w = (int)workingVector8.w;
            workingVector8.w = max(1, (int)workingVector8.w);
            workingVector8.w = min(9, (int)workingVector8.w);
            workingVector8.w = workingVector7.w ? 1 : workingVector8.w;
            workingVector9.w = (uint)workingVector8.w >> 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector10.yw = float2(0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector10.w = 0;
            workingVector11.w = 0;
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.z = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector8.w);
              if (workingVector11.z != 0) break;
              workingVector11.z = (int)-workingVector9.w + (int)workingVector10.w;
              workingVector11.z = (int)workingVector11.z;
              workingVector13.y = 0.5 + workingVector11.z;
              workingVector11.z = workingVector10.y;
              workingVector11.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.y = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector8.w);
              if (workingVector12.y != 0) break;
              workingVector12.y = (int)-workingVector9.w + (int)workingVector11.w;
              workingVector12.y = (int)workingVector12.y;
              workingVector15.y = 0.5 + workingVector12.y;
              workingVector12.y = workingVector10.w;
              workingVector12.w = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector8.w);
                if (workingVector12.w != 0) break;
                workingVector12.w = (int)-workingVector9.w + (int)workingVector11.w;
                workingVector12.w = (int)workingVector12.w;
                workingVector13.x = 0.5 + workingVector12.w;
                workingVector13.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector13.xy;
                workingVector13.xz = fragmentVectorConstants1[workingVector10.w+48].xx * workingVector13.xz;
                workingVector12.xy = workingVector10.xz * fragmentVectorConstants1[workingVector10.w+48].xx + workingVector13.xz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.z = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector8.w);
                if (workingVector13.z != 0) break;
                workingVector13.z = (int)-workingVector9.w + (int)workingVector12.w;
                workingVector13.z = (int)workingVector13.z;
                workingVector15.x = 0.5 + workingVector13.z;
                workingVector13.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector15.xy;
                workingVector13.zw = fragmentVectorConstants1[workingVector10.w+48].xx * workingVector13.zw;
                workingVector14.xy = workingVector12.xz * fragmentVectorConstants1[workingVector10.w+48].xx + workingVector13.zw;
#endif
                if (workingVector7.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector12.w = materialTexture6.SampleLevel(textureSampler6, workingVector12.xyz, 0).x;
                  workingVector12.w = RD_COMPARISON_MASK(workingVector12.w >= workingVector5.w);
                  workingVector12.w = workingVector12.w ? 1.000000 : 0;
                  workingVector11.z = workingVector12.w + workingVector11.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector13.z = materialTexture6.SampleLevel(textureSampler6, workingVector14.xyz, 0).x;
                  workingVector13.z = RD_COMPARISON_MASK(workingVector13.z >= workingVector5.w);
                  workingVector13.z = workingVector13.z ? 1.000000 : 0;
                  workingVector12.y = workingVector13.z + workingVector12.y;
#endif
                } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector14.xyzw = materialTexture6.Gather(textureSampler6, workingVector12.xyz).xyzw;
                  workingVector12.xy = workingVector12.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector12.xy = frac(workingVector12.xy);
                  workingVector14.xyzw = RD_COMPARISON_MASK(workingVector14.xyzw >= workingVector5.wwww);
                  workingVector15.xyzw = workingVector14.xyzw ? float4(1,1,1,1) : 0;
                  workingVector13.xz = workingVector14.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector13.xz = workingVector15.zy + workingVector13.xz;
                  workingVector12.xw = workingVector12.xx * workingVector13.xz + workingVector15.wx;
                  workingVector12.w = workingVector12.w + -workingVector12.x;
                  workingVector12.x = workingVector12.y * workingVector12.w + workingVector12.x;
                  workingVector11.z = workingVector12.x + workingVector11.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector16.xyzw = materialTexture6.Gather(textureSampler6, workingVector14.xyz).xyzw;
                  workingVector13.zw = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector13.zw = frac(workingVector13.zw);
                  workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector5.wwww);
                  workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                  workingVector14.xy = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector14.xy = workingVector17.zy + workingVector14.xy;
                  workingVector14.xy = workingVector13.zz * workingVector14.xy + workingVector17.wx;
                  workingVector13.z = workingVector14.y + -workingVector14.x;
                  workingVector13.z = workingVector13.w * workingVector13.z + workingVector14.x;
                  workingVector12.y = workingVector13.z + workingVector12.y;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector11.w = (int)workingVector11.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector12.w = (int)workingVector12.w + 1;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector10.y = workingVector11.z;
              workingVector10.w = (int)workingVector10.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.w = workingVector12.y;
              workingVector11.w = (int)workingVector11.w + 1;
#endif
            }
            workingVector5.w = (int)workingVector8.w * (int)workingVector8.w;
            workingVector5.w = (int)workingVector5.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector5.w = workingVector10.y / workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector5.w = workingVector10.w / workingVector5.w;
#endif
            workingVector7.w = RD_COMPARISON_MASK(workingVector5.w < 1);
            workingVector8.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
            workingVector5.w = max(workingVector8.w, workingVector5.w);
            workingVector5.w = min(1, workingVector5.w);
            workingVector5.w = workingVector7.w ? workingVector5.w : 1;
          } else {
            workingVector5.w = 1;
          }
          workingVector5.w = min(workingVector6.w, workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector5.w = min(workingVector11.y, workingVector5.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector5.w = min(workingVector13.y, workingVector5.w);
#endif
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
        } else {
          workingVector5.w = 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.x = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.x = 1;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector10.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector10.xyz;
        workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector10.xyz;
        workingVector6.w = dot(workingVector10.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector12.xyz;
        workingVector6.w = dot(workingVector12.xyz, workingVector12.xyz);
#endif
        workingVector6.w = rsqrt(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.yzw = workingVector10.xyz * workingVector6.www;
        workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
        workingVector12.xyz = workingVector12.xyz * workingVector2.www;
        workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector12.xyz;
        workingVector2.w = dot(workingVector4.xyz, workingVector11.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.yzw = workingVector12.xyz * workingVector6.www;
        workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
        workingVector14.xyz = workingVector14.xyz * workingVector2.www;
        workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector14.xyz;
        workingVector2.w = dot(workingVector4.xyz, workingVector13.yzw);
#endif
        workingVector7.w = max(0, workingVector2.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector8.w = dot(workingVector4.xyz, -workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector8.w = dot(workingVector4.xyz, -workingVector10.xyz);
#endif
        workingVector8.w = max(0, workingVector8.w);
        workingVector2.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector2.w;
        workingVector9.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
        workingVector9.w = workingVector9.w * workingVector9.w;
        workingVector2.w = workingVector2.w / workingVector9.w;
        workingVector2.w = max(0, workingVector2.w);
        workingVector2.w = workingVector2.w + -workingVector7.w;
        workingVector2.w = workingVector4.w * workingVector2.w + workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.w = dot(-workingVector4.xyz, workingVector11.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector10.w = dot(-workingVector4.xyz, workingVector13.yzw);
#endif
        workingVector10.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector10.w;
        workingVector9.w = workingVector10.w / workingVector9.w;
        workingVector9.w = max(0, workingVector9.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector4.w = workingVector9.w * workingVector4.w;
        workingVector10.xyz = workingVector10.xyz * workingVector6.www + -workingVector9.xyz;
        workingVector6.w = dot(workingVector10.xyz, workingVector10.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.w = workingVector9.w * workingVector4.w;
        workingVector12.xyz = workingVector12.xyz * workingVector6.www + -workingVector10.xyz;
        workingVector6.w = dot(workingVector12.xyz, workingVector12.xyz);
#endif
        workingVector6.w = rsqrt(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = workingVector10.xyz * workingVector6.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.xyz = workingVector12.xyz * workingVector6.www;
#endif
        workingVector6.w = max(0.0500000007, RD_UNIFORM_MERS_UNIFORMS.z);
        workingVector6.w = workingVector6.w * workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector9.w = workingVector6.w * workingVector6.w;
        workingVector10.w = dot(workingVector4.xyz, workingVector10.xyz);
        workingVector10.w = max(0, workingVector10.w);
        workingVector11.y = workingVector6.w * workingVector6.w + -1;
        workingVector10.w = workingVector10.w * workingVector10.w;
        workingVector10.w = workingVector10.w * workingVector11.y + 1;
        workingVector10.w = workingVector10.w * workingVector10.w;
        workingVector10.w = 3.14159274 * workingVector10.w;
        workingVector9.w = workingVector9.w / workingVector10.w;
        workingVector10.w = 0.5 * workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector10.w = workingVector6.w * workingVector6.w;
        workingVector11.w = dot(workingVector4.xyz, workingVector12.xyz);
        workingVector11.w = max(0, workingVector11.w);
        workingVector12.w = workingVector6.w * workingVector6.w + -1;
        workingVector11.w = workingVector11.w * workingVector11.w;
        workingVector11.w = workingVector11.w * workingVector12.w + 1;
        workingVector11.w = workingVector11.w * workingVector11.w;
        workingVector11.w = 3.14159274 * workingVector11.w;
        workingVector10.w = workingVector10.w / workingVector11.w;
        workingVector11.w = 0.5 * workingVector6.w;
#endif
        workingVector6.w = -workingVector6.w * 0.5 + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.y = workingVector8.w * workingVector6.w + workingVector10.w;
        workingVector11.y = 9.99999975e-005 + workingVector11.y;
        workingVector11.y = workingVector8.w / workingVector11.y;
        workingVector6.w = workingVector7.w * workingVector6.w + workingVector10.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.w = workingVector8.w * workingVector6.w + workingVector11.w;
        workingVector12.w = 9.99999975e-005 + workingVector12.w;
        workingVector12.w = workingVector8.w / workingVector12.w;
        workingVector6.w = workingVector7.w * workingVector6.w + workingVector11.w;
#endif
        workingVector6.w = 9.99999975e-005 + workingVector6.w;
        workingVector6.w = workingVector7.w / workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector6.w = workingVector11.y * workingVector6.w;
        workingVector9.x = dot(-workingVector9.xyz, workingVector10.xyz);
        workingVector9.x = max(0, workingVector9.x);
        workingVector10.xyz = float3(1,1,1) + -workingVector7.xyz;
        workingVector9.x = 1 + -workingVector9.x;
        workingVector9.x = max(0, workingVector9.x);
        workingVector9.y = workingVector9.x * workingVector9.x;
        workingVector9.y = workingVector9.y * workingVector9.y;
        workingVector9.x = workingVector9.y * workingVector9.x;
        workingVector9.xyz = workingVector10.xyz * workingVector9.xxx + workingVector7.xyz;
        workingVector10.xyz = workingVector1.www * workingVector0.xyz;
        workingVector11.yzw = float3(1,1,1) + -workingVector9.xyz;
        workingVector11.yzw = workingVector11.yzw * workingVector2.www;
        workingVector10.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector10.xyz;
        workingVector11.yzw = workingVector11.yzw * workingVector10.xyz;
        workingVector10.xyz = workingVector10.xyz * workingVector4.www;
        workingVector9.xyz = workingVector9.xyz * workingVector9.www;
        workingVector9.xyz = workingVector9.xyz * workingVector6.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector6.w = workingVector12.w * workingVector6.w;
        workingVector11.w = dot(-workingVector10.xyz, workingVector12.xyz);
        workingVector11.w = max(0, workingVector11.w);
        workingVector12.xyz = float3(1,1,1) + -workingVector8.xyz;
        workingVector11.w = 1 + -workingVector11.w;
        workingVector11.w = max(0, workingVector11.w);
        workingVector12.w = workingVector11.w * workingVector11.w;
        workingVector12.w = workingVector12.w * workingVector12.w;
        workingVector11.w = workingVector12.w * workingVector11.w;
        workingVector12.xyz = workingVector12.xyz * workingVector11.www + workingVector8.xyz;
        workingVector13.yzw = workingVector1.www * workingVector0.xyz;
        workingVector15.xyz = float3(1,1,1) + -workingVector12.xyz;
        workingVector15.xyz = workingVector15.xyz * workingVector2.www;
        workingVector13.yzw = float3(0.318309873,0.318309873,0.318309873) * workingVector13.yzw;
        workingVector15.xyz = workingVector15.xyz * workingVector13.yzw;
        workingVector13.yzw = workingVector13.yzw * workingVector9.www;
        workingVector12.xyz = workingVector12.xyz * workingVector10.www;
        workingVector12.xyz = workingVector12.xyz * workingVector6.www;
#endif
        workingVector2.w = workingVector8.w * workingVector7.w;
        workingVector2.w = workingVector2.w * 4 + 9.99999975e-005;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector9.xyz = workingVector9.xyz / workingVector2.www;
        workingVector9.xyz = workingVector9.xyz * workingVector7.www;
        workingVector10.xyz = workingVector10.xyz * workingVector11.xxx;
        workingVector10.xyz = workingVector11.yzw * workingVector5.www + workingVector10.xyz;
        workingVector10.xyz = workingVector10.xyz * workingVector12.xyz;
        workingVector10.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector10.xyz;
        workingVector9.xyz = workingVector9.xyz * workingVector5.www;
        workingVector9.xyz = workingVector9.xyz * workingVector12.xyz;
        workingVector9.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.xyz = workingVector12.xyz / workingVector2.www;
        workingVector12.xyz = workingVector12.xyz * workingVector7.www;
        workingVector13.xyz = workingVector13.yzw * workingVector13.xxx;
        workingVector13.xyz = workingVector15.xyz * workingVector5.www + workingVector13.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector14.xyz;
        workingVector13.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector13.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector5.www;
        workingVector12.xyz = workingVector12.xyz * workingVector14.xyz;
        workingVector12.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector12.xyz;
#endif
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector10.xyz = float3(0,0,0);
        workingVector9.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector13.xyz = float3(0,0,0);
        workingVector12.xyz = float3(0,0,0);
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector2.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
      if (workingVector2.w != 0) {
        workingVector5.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector1.z;
        workingVector6.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector5.w;
        workingVector7.w = workingVector5.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector1.x;
        workingVector6.w = workingVector6.w + workingVector6.w;
        workingVector6.w = saturate(workingVector7.w / workingVector6.w);
        workingVector7.w = -workingVector1.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector1.y;
        workingVector5.w = workingVector5.w + workingVector5.w;
        workingVector5.w = saturate(workingVector7.w / workingVector5.w);
        workingVector14.xy = RD_COMPARISON_MASK(-workingVector1.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
        workingVector7.w = log2(-workingVector1.z);
        workingVector7.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector7.w;
        workingVector7.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector7.w);
        workingVector15.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
        workingVector7.w = workingVector15.x * workingVector7.w;
        workingVector7.w = floor(workingVector7.w);
        workingVector7.w = 2 + workingVector7.w;
        workingVector7.w = min(workingVector7.w, workingVector15.y);
        workingVector7.w = workingVector14.y ? 1 : workingVector7.w;
        workingVector7.w = workingVector14.x ? 0 : workingVector7.w;
        workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector6.w;
        workingVector6.w = floor(workingVector6.w);
        workingVector6.w = min(workingVector6.w, workingVector15.z);
        workingVector5.w = RD_UNIFORM_CLUSTER_DIMENSIONS.y * workingVector5.w;
        workingVector5.w = floor(workingVector5.w);
        workingVector5.w = min(workingVector5.w, workingVector15.w);
        workingVector8.w = RD_COMPARISON_MASK(workingVector6.w < 0);
        workingVector9.w = RD_COMPARISON_MASK(workingVector5.w < 0);
        workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
        workingVector9.w = RD_COMPARISON_MASK(workingVector7.w < 0);
        workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
        workingVector9.w = RD_COMPARISON_MASK(workingVector6.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
        workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
        workingVector9.w = RD_COMPARISON_MASK(workingVector5.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
        workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
        workingVector9.w = RD_COMPARISON_MASK(workingVector7.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
        workingVector8.w = (int)workingVector8.w | (int)workingVector9.w;
        if (workingVector8.w == 0) {
          workingVector5.w = workingVector5.w * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector6.w;
          workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector7.w;
          workingVector5.w = workingVector6.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector5.w;
          workingVector5.w = (int)workingVector5.w;
          workingVector6.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
          workingVector7.w = (int)workingVector5.w * (int)workingVector6.w;
          workingVector5.w = mad((int)workingVector5.w, (int)workingVector6.w, (int)workingVector6.w);
          workingVector6.w = dot(workingVector4.xyz, -workingVector10.xyz);
          workingVector6.w = max(0, workingVector6.w);
          workingVector8.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
          workingVector8.w = workingVector8.w * workingVector8.w;
          workingVector9.w = max(0.0500000007, RD_UNIFORM_MERS_UNIFORMS.z);
          workingVector9.w = workingVector9.w * workingVector9.w;
          workingVector10.w = workingVector9.w * workingVector9.w;
          workingVector11.w = workingVector9.w * workingVector9.w + -1;
          workingVector12.w = 0.5 * workingVector9.w;
          workingVector9.w = -workingVector9.w * 0.5 + 1;
          workingVector13.w = workingVector6.w * workingVector9.w + workingVector12.w;
          workingVector13.w = 9.99999975e-005 + workingVector13.w;
          workingVector13.w = workingVector6.w / workingVector13.w;
          workingVector14.xyz = float3(1,1,1) + -workingVector8.xyz;
          workingVector15.xyz = workingVector1.www * workingVector0.xyz;
          workingVector15.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector15.xyz;
          workingVector14.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
          workingVector15.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
          workingVector16.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
          workingVector16.y = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
          workingVector16.zw = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
          workingVector17.x = RD_COMPARISON_MASK(0 < workingVector4.w);
          workingVector16.y = 1 / workingVector16.y;
          workingVector17.yzw = float3(0,0,0);
          workingVector18.xyz = float3(0,0,0);
          workingVector18.w = workingVector7.w;
          while (true) {
            workingVector19.x = RD_COMPARISON_MASK((int)workingVector18.w >= (int)workingVector5.w);
            if (workingVector19.x != 0) break;
            workingVector19.x = sampledResource10[workingVector18.w].val[0/4];
            workingVector19.x = (int)workingVector19.x;
            workingVector19.y = RD_COMPARISON_MASK((int)workingVector19.x < 0);
            if (workingVector19.y != 0) {
              break;
            }
            workingVector19.y = sampledResource11[workingVector19.x].val[0/4];
            workingVector19.z = sampledResource11[workingVector19.x].val[0/4+1];
            workingVector19.w = sampledResource11[workingVector19.x].val[0/4+2];
            workingVector20.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector19.zzz;
            workingVector20.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector19.yyy + workingVector20.xyz;
            workingVector20.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector19.www + workingVector20.xyz;
            workingVector20.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector20.xyz;
            workingVector20.xyz = workingVector20.xyz + workingVector7.xyz;
            workingVector20.w = dot(workingVector20.xyz, workingVector20.xyz);
            workingVector20.w = rsqrt(workingVector20.w);
            workingVector21.xyz = workingVector20.xyz * workingVector20.www;
            workingVector21.w = dot(workingVector4.xyz, workingVector21.xyz);
            workingVector22.x = max(0, workingVector21.w);
            workingVector21.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector21.w;
            workingVector21.w = workingVector21.w / workingVector8.w;
            workingVector21.w = max(0, workingVector21.w);
            workingVector21.w = workingVector21.w + -workingVector22.x;
            workingVector21.w = workingVector4.w * workingVector21.w + workingVector22.x;
            workingVector21.x = dot(-workingVector4.xyz, workingVector21.xyz);
            workingVector21.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector21.x;
            workingVector21.x = workingVector21.x / workingVector8.w;
            workingVector21.x = max(0, workingVector21.x);
            workingVector21.x = workingVector21.x * workingVector4.w;
            workingVector20.xyz = workingVector20.xyz * workingVector20.www + -workingVector10.xyz;
            workingVector20.w = dot(workingVector20.xyz, workingVector20.xyz);
            workingVector20.w = rsqrt(workingVector20.w);
            workingVector20.xyz = workingVector20.xyz * workingVector20.www;
            workingVector20.w = dot(workingVector4.xyz, workingVector20.xyz);
            workingVector20.w = max(0, workingVector20.w);
            workingVector20.w = workingVector20.w * workingVector20.w;
            workingVector20.w = workingVector20.w * workingVector11.w + 1;
            workingVector20.w = workingVector20.w * workingVector20.w;
            workingVector20.w = 3.14159274 * workingVector20.w;
            workingVector20.w = workingVector10.w / workingVector20.w;
            workingVector21.y = workingVector22.x * workingVector9.w + workingVector12.w;
            workingVector21.y = 9.99999975e-005 + workingVector21.y;
            workingVector21.y = workingVector22.x / workingVector21.y;
            workingVector21.y = workingVector21.y * workingVector13.w;
            workingVector20.x = dot(-workingVector10.xyz, workingVector20.xyz);
            workingVector20.x = max(0, workingVector20.x);
            workingVector20.x = 1 + -workingVector20.x;
            workingVector20.x = max(0, workingVector20.x);
            workingVector20.y = workingVector20.x * workingVector20.x;
            workingVector20.y = workingVector20.y * workingVector20.y;
            workingVector20.x = workingVector20.y * workingVector20.x;
            workingVector20.xyz = workingVector14.xyz * workingVector20.xxx + workingVector8.xyz;
            workingVector22.yzw = float3(1,1,1) + -workingVector20.xyz;
            workingVector22.yzw = workingVector22.yzw * workingVector21.www;
            workingVector22.yzw = workingVector22.yzw * workingVector15.xyz;
            workingVector21.xzw = workingVector21.xxx * workingVector15.xyz;
            workingVector20.xyz = workingVector20.xyz * workingVector20.www;
            workingVector20.xyz = workingVector20.xyz * workingVector21.yyy;
            workingVector20.w = workingVector22.x * workingVector6.w;
            workingVector20.w = workingVector20.w * 4 + 9.99999975e-005;
            workingVector20.xyz = workingVector20.xyz / workingVector20.www;
            workingVector20.xyz = workingVector22.xxx * workingVector20.xyz;
            workingVector20.w = RD_COMPARISON_MASK((int)workingVector19.x >= 0);
            if (workingVector20.w != 0) {
              workingVector23.x = sampledResource11[workingVector19.x].val[0/4];
              workingVector23.y = sampledResource11[workingVector19.x].val[0/4+1];
              workingVector23.z = sampledResource11[workingVector19.x].val[0/4+2];
              workingVector23.w = sampledResource11[workingVector19.x].val[0/4+3];
              workingVector23.xyz = -varyingTexCoord3.xyz + workingVector23.xyz;
              workingVector20.w = abs(workingVector23.x) + abs(workingVector23.y);
              workingVector20.w = workingVector20.w + abs(workingVector23.z);
              workingVector20.w = workingVector20.w * workingVector20.w;
              workingVector21.y = dot(workingVector23.xyz, workingVector23.xyz);
              workingVector20.w = workingVector14.w ? workingVector20.w : workingVector21.y;
              workingVector21.y = workingVector23.w * workingVector23.w;
              workingVector21.y = RD_COMPARISON_MASK(workingVector20.w < workingVector21.y);
              if (workingVector21.y != 0) {
                if (workingVector15.w != 0) {
                  workingVector24.x = sampledResource11[workingVector19.x].val[32/4];
                  workingVector24.y = sampledResource11[workingVector19.x].val[32/4+1];
                  workingVector24.z = sampledResource11[workingVector19.x].val[32/4+2];
                  workingVector24.w = sampledResource11[workingVector19.x].val[32/4+3];
                  workingVector25.x = sampledResource11[workingVector19.x].val[48/4];
                  workingVector25.y = sampledResource11[workingVector19.x].val[48/4+1];
                  workingVector25.z = sampledResource11[workingVector19.x].val[48/4+2];
                  workingVector25.w = sampledResource11[workingVector19.x].val[48/4+3];
                  workingVector26.x = sampledResource11[workingVector19.x].val[64/4];
                  workingVector26.y = sampledResource11[workingVector19.x].val[64/4+1];
                  workingVector26.z = sampledResource11[workingVector19.x].val[64/4+2];
                  workingVector26.w = sampledResource11[workingVector19.x].val[64/4+3];
                  workingVector27.x = sampledResource11[workingVector19.x].val[80/4];
                  workingVector27.y = sampledResource11[workingVector19.x].val[80/4+1];
                  workingVector27.z = sampledResource11[workingVector19.x].val[80/4+2];
                  workingVector27.w = sampledResource11[workingVector19.x].val[80/4+3];
                  workingVector28.x = sampledResource11[workingVector19.x].val[96/4];
                  workingVector28.y = sampledResource11[workingVector19.x].val[96/4+1];
                  workingVector28.z = sampledResource11[workingVector19.x].val[96/4+2];
                  workingVector28.w = sampledResource11[workingVector19.x].val[96/4+3];
                  workingVector29.x = sampledResource11[workingVector19.x].val[112/4];
                  workingVector29.y = sampledResource11[workingVector19.x].val[112/4+1];
                  workingVector29.z = sampledResource11[workingVector19.x].val[112/4+2];
                  workingVector29.w = sampledResource11[workingVector19.x].val[112/4+3];
                  workingVector30.xyz = -workingVector19.yzw + workingVector11.xyz;
                  workingVector19.yzw = RD_COMPARISON_MASK(abs(workingVector30.xxy) >= abs(workingVector30.yzz));
                  workingVector19.y = workingVector19.z ? workingVector19.y : 0;
                  workingVector23.xyz = RD_COMPARISON_MASK(workingVector30.xyz >= float3(0,0,0));
                  workingVector23.xyz = workingVector23.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                  workingVector19.z = workingVector19.w ? workingVector23.y : workingVector23.z;
                  workingVector19.y = workingVector19.y ? workingVector23.x : workingVector19.z;
                  workingVector31.xyzw = RD_COMPARISON_MASK((int4)workingVector19.yyyy == int4(1,2,3,4));
                  workingVector19.y = RD_COMPARISON_MASK((int)workingVector19.y == 5);
                  workingVector24.xyzw = workingVector19.yyyy ? workingVector29.xyzw : workingVector24.xyzw;
                  workingVector24.xyzw = workingVector31.wwww ? workingVector28.xyzw : workingVector24.xyzw;
                  workingVector24.xyzw = workingVector31.zzzz ? workingVector27.xyzw : workingVector24.xyzw;
                  workingVector24.xyzw = workingVector31.yyyy ? workingVector26.xyzw : workingVector24.xyzw;
                  workingVector24.xyzw = workingVector31.xxxx ? workingVector25.xyzw : workingVector24.xyzw;
                  workingVector19.zw = RD_COMPARISON_MASK(workingVector24.zw == float2(0,0));
                  workingVector19.z = workingVector19.w ? workingVector19.z : 0;
                  if (workingVector19.z == 0) {
                    workingVector30.w = -workingVector30.x;
                    workingVector19.yz = workingVector19.yy ? workingVector30.xz : workingVector30.zw;
                    workingVector23.xz = workingVector31.ww ? -workingVector30.xz : workingVector19.yz;
                    workingVector19.yzw = float3(-1,1,1) * workingVector30.xzy;
                    workingVector23.y = workingVector19.w;
                    workingVector19.yzw = workingVector31.zzz ? workingVector19.yzw : workingVector23.xyz;
                    workingVector19.yzw = workingVector31.yyy ? -workingVector30.xzy : workingVector19.yzw;
                    workingVector23.xyz = float3(-1,1,1) * workingVector30.zyx;
                    workingVector19.yzw = workingVector31.xxx ? workingVector23.xyz : workingVector19.yzw;
                    workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector19.zzzz;
                    workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector19.yyyy + workingVector25.xyzw;
                    workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector19.wwww + workingVector25.xyzw;
                    workingVector25.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector25.xyzw;
                    workingVector21.y = dot(-workingVector30.xyz, -workingVector30.xyz);
                    workingVector21.y = rsqrt(workingVector21.y);
                    workingVector23.xyz = -workingVector30.xyz * workingVector21.yyy;
                    workingVector21.y = dot(workingVector23.xyz, workingVector3.xyz);
                    workingVector21.y = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector21.y);
                    workingVector21.y = min(1, workingVector21.y);
                    workingVector22.x = -workingVector21.y * workingVector21.y + 1;
                    workingVector22.x = sqrt(workingVector22.x);
                    workingVector21.y = workingVector22.x / workingVector21.y;
                    workingVector21.y = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector21.y + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                    workingVector23.xyz = workingVector24.zzw + -workingVector24.xxy;
                    workingVector26.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector23.xyz;
                    workingVector22.x = max(1, workingVector26.x);
                    workingVector22.x = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector22.x;
                    workingVector25.z = -workingVector21.y * workingVector22.x + workingVector25.z;
                    workingVector25.xyz = workingVector25.xyz / workingVector25.www;
                    workingVector27.xy = workingVector25.xy * float2(0.5,0.5) + float2(0.5,0.5);
                    workingVector26.xw = workingVector24.xy + workingVector16.zw;
                    workingVector24.zw = workingVector24.zw + -workingVector16.zw;
                    workingVector27.z = 1 + -workingVector27.y;
                    workingVector27.xy = workingVector27.xz * workingVector26.yz;
                    workingVector27.xy = floor(workingVector27.xy);
                    workingVector27.xy = float2(0.5,0.5) + workingVector27.xy;
                    workingVector26.yz = workingVector27.xy / workingVector26.yz;
                    workingVector23.xy = workingVector26.yz * workingVector23.yz + workingVector24.xy;
                    workingVector23.xy = max(workingVector23.xy, workingVector26.xw);
                    workingVector23.xy = min(workingVector23.xy, workingVector24.zw);
                    workingVector21.y = materialTexture2.SampleLevel(textureSampler2, workingVector23.xy, 0).x;
                    workingVector22.x = RD_COMPARISON_MASK(workingVector21.y >= workingVector25.z);
                    workingVector22.x = workingVector22.x ? 1.000000 : 0;
                    workingVector24.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.xyzw * workingVector25.yyyy;
                    workingVector24.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.xyzw * workingVector25.xxxx + workingVector24.xyzw;
                    workingVector24.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.xyzw * workingVector21.yyyy + workingVector24.xyzw;
                    workingVector24.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.xyzw + workingVector24.xyzw;
                    workingVector23.xyz = workingVector24.xyz / workingVector24.www;
                    workingVector19.y = dot(workingVector19.yzw, workingVector19.yzw);
                    workingVector19.z = dot(workingVector23.xyz, workingVector23.xyz);
                    workingVector19.yz = sqrt(workingVector19.yz);
                    workingVector19.y = workingVector19.y + -workingVector19.z;
                    workingVector19.y = saturate(RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector19.y);
                    workingVector19.z = workingVector19.y * -2 + 3;
                    workingVector19.y = workingVector19.y * workingVector19.y;
                    workingVector19.y = -workingVector19.z * workingVector19.y + 1;
                    workingVector19.y = workingVector17.x ? workingVector19.y : 1;
                  } else {
                    workingVector19.y = 1;
                    workingVector22.x = 0;
                  }
                } else {
                  workingVector22.x = 1;
                  workingVector19.y = 1;
                }
                workingVector19.z = max(0.100000001, workingVector20.w);
                workingVector19.z = 1 / workingVector19.z;
                workingVector19.w = workingVector23.w * workingVector23.w + 9.99999975e-005;
                workingVector19.w = workingVector20.w / workingVector19.w;
                workingVector19.w = -workingVector19.w * workingVector19.w + 1;
                workingVector19.w = max(0, workingVector19.w);
                workingVector19.w = workingVector19.w * workingVector19.w;
                workingVector20.w = workingVector19.z * workingVector19.w;
                workingVector19.z = -workingVector19.z * workingVector19.w + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
                workingVector19.z = 1 + workingVector19.z;
                workingVector19.z = saturate(workingVector19.z * workingVector16.y);
                workingVector19.w = workingVector19.z * -2 + 3;
                workingVector19.z = workingVector19.z * workingVector19.z;
                workingVector19.z = workingVector19.w * workingVector19.z;
                workingVector19.z = saturate(workingVector19.z * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
                workingVector19.z = workingVector20.w * workingVector19.z;
                workingVector19.z = workingVector16.x ? workingVector19.z : workingVector20.w;
                workingVector23.x = sampledResource11[workingVector19.x].val[16/4];
                workingVector23.y = sampledResource11[workingVector19.x].val[16/4+1];
                workingVector23.z = sampledResource11[workingVector19.x].val[16/4+2];
                workingVector23.w = sampledResource11[workingVector19.x].val[16/4+3];
                workingVector23.xyz = workingVector23.xyz * workingVector23.www;
                workingVector19.xzw = workingVector23.xyz * workingVector19.zzz;
              } else {
                workingVector22.x = 1;
                workingVector19.xyzw = float4(0,1,0,0);
              }
            } else {
              workingVector22.x = 1;
              workingVector19.xyzw = float4(0,1,0,0);
            }
            workingVector21.xyz = workingVector21.xzw * workingVector19.yyy;
            workingVector21.xyz = workingVector22.yzw * workingVector22.xxx + workingVector21.xyz;
            workingVector21.xyz = workingVector21.xyz * workingVector19.xzw;
            workingVector17.yzw = workingVector21.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector17.yzw;
            workingVector20.xyz = workingVector22.xxx * workingVector20.xyz;
            workingVector19.xyz = workingVector20.xyz * workingVector19.xzw;
            workingVector18.xyz = workingVector19.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector18.xyz;
            workingVector18.w = (int)workingVector18.w + 1;
          }
        } else {
          workingVector17.yzw = float3(0,0,0);
          workingVector18.xyz = float3(0,0,0);
        }
        workingVector4.w = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
        workingVector13.xyz = workingVector4.www * workingVector17.yzw + workingVector13.xyz;
        workingVector12.xyz = workingVector4.www * workingVector18.xyz + workingVector12.xyz;
      }
      workingVector4.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
      workingVector2.w = workingVector2.w ? workingVector4.w : 0;
#endif
      if (workingVector2.w != 0) {
        workingVector5.xyz = float3(-0.5,-0.5,-0.5) + workingVector5.xyz;
        workingVector5.xyz = workingVector3.xyz * float3(0.200000003,0.200000003,0.200000003) + workingVector5.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = floor(workingVector5.xyz);
        workingVector11.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xyz;
        workingVector11.xyz = floor(workingVector11.xyz);
        workingVector11.xyz = (int3)workingVector11.xyz;
        bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector2.w = (((uint)workingVector11.y << 16) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
        workingVector4.w = (int)workingVector11.z & 0x0000ffff;
        workingVector11.xyz = (int3)workingVector11.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
        workingVector12.xyz = (uint3)workingVector11.xyz >> int3(24,24,24);
        workingVector11.xyz = (int3)workingVector11.xyz ^ (int3)workingVector12.xyz;
        workingVector11.xyz = (int3)workingVector11.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
        workingVector5.w = (int)workingVector11.x ^ 0x88b16480;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector7.xyz = floor(workingVector5.xyz);
        workingVector7.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
        workingVector7.xyz = floor(workingVector7.xyz);
        workingVector7.xyz = (int3)workingVector7.xyz;
        bitMask.w = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector2.w = (((uint)workingVector7.y << 16) & bitMask.w) | ((uint)workingVector7.x & ~bitMask.w);
        bitMask.w = ((~(-1 << 16)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector7.z << 0) & bitMask.w) | ((uint)0x00020000 & ~bitMask.w);
        workingVector7.xyz = (int3)workingVector7.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
        workingVector10.xyz = (uint3)workingVector7.xyz >> int3(24,24,24);
        workingVector7.xyz = (int3)workingVector7.xyz ^ (int3)workingVector10.xyz;
        workingVector7.xyz = (int3)workingVector7.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
        workingVector5.w = (int)workingVector7.x ^ 0x88b16480;
#endif
        workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = (int)workingVector11.y ^ (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = (int)workingVector7.y ^ (int)workingVector5.w;
#endif
        workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = (int)workingVector11.z ^ (int)workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = (int)workingVector7.z ^ (int)workingVector5.w;
#endif
        workingVector5.w = (int)workingVector5.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector5.w = (int)workingVector5.w ^ 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector5.w = (int)workingVector5.w ^ 0x90210f61;
#endif
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
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector7.w = (int)workingVector5.w & (int)workingVector6.w;
        workingVector11.x = workingVector7.w;
        workingVector11.yzw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector7.x = (int)workingVector5.w & (int)workingVector6.w;
        workingVector10.x = workingVector7.x;
        workingVector10.y = 0;
        workingVector7.yz = float2(0,0);
#endif
        while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector11.y >= 8);
          if (workingVector8.w != 0) break;
          workingVector12.x = sampledResource8[workingVector11.x].val[0/4];
          workingVector12.y = sampledResource8[workingVector11.x].val[0/4+1];
          workingVector12.z = sampledResource8[workingVector11.x].val[0/4+2];
          workingVector12.w = sampledResource8[workingVector11.x].val[0/4+3];
          workingVector8.w = (int)workingVector12.z & 0x0000ffff;
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector8.w);
          workingVector10.w = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector12.x);
          workingVector8.w = workingVector8.w ? workingVector10.w : 0;
          workingVector10.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector12.y);
          workingVector8.w = workingVector8.w ? workingVector10.w : 0;
          workingVector10.w = workingVector8.w ? workingVector12.w : workingVector11.z;
          workingVector12.x = workingVector11.w ? workingVector11.z : workingVector10.w;
          workingVector12.y = (int)workingVector8.w | (int)workingVector11.w;
          workingVector8.w = (int)workingVector11.x + 1;
          workingVector11.x = (int)workingVector6.w & (int)workingVector8.w;
          workingVector8.w = (int)workingVector9.w | (int)workingVector12.y;
          if (workingVector8.w != 0) {
            workingVector11.zw = workingVector12.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector7.w = RD_COMPARISON_MASK((int)workingVector10.y >= 8);
          if (workingVector7.w != 0) break;
          workingVector11.x = sampledResource8[workingVector10.x].val[0/4];
          workingVector11.y = sampledResource8[workingVector10.x].val[0/4+1];
          workingVector11.z = sampledResource8[workingVector10.x].val[0/4+2];
          workingVector11.w = sampledResource8[workingVector10.x].val[0/4+3];
          workingVector7.w = (int)workingVector11.z & 0x0000ffff;
          workingVector8.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
          workingVector7.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector7.w);
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector2.w == (int)workingVector11.x);
          workingVector7.w = workingVector7.w ? workingVector9.w : 0;
          workingVector9.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector11.y);
          workingVector7.w = workingVector7.w ? workingVector9.w : 0;
          workingVector9.w = workingVector7.w ? workingVector11.w : workingVector7.y;
          workingVector11.x = workingVector7.z ? workingVector7.y : workingVector9.w;
          workingVector11.y = (int)workingVector7.w | (int)workingVector7.z;
          workingVector7.w = (int)workingVector10.x + 1;
          workingVector10.x = (int)workingVector6.w & (int)workingVector7.w;
          workingVector7.w = (int)workingVector8.w | (int)workingVector11.y;
          if (workingVector7.w != 0) {
            workingVector7.yz = workingVector11.xy;
#endif
            break;
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector11.y = (int)workingVector11.y + 1;
          workingVector11.zw = workingVector12.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector10.y = (int)workingVector10.y + 1;
          workingVector7.yz = workingVector11.xy;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        if (workingVector11.w != 0) {
          workingVector11.xyw = float3(0.0625,0.0625,0.0625) * workingVector5.xyz;
          workingVector11.xyw = floor(workingVector11.xyw);
          workingVector5.xyz = -workingVector11.xyw * float3(16,16,16) + workingVector5.xyz;
          workingVector2.w = (uint)workingVector11.z >> 2;
          workingVector12.xyz = RD_COMPARISON_MASK(abs(workingVector3.xyz) >= float3(1,1,1));
          workingVector4.w = (int)workingVector12.y | (int)workingVector12.x;
          workingVector4.w = (int)workingVector12.z | (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        if (workingVector7.z != 0) {
          workingVector7.xzw = float3(0.0625,0.0625,0.0625) * workingVector5.xyz;
          workingVector7.xzw = floor(workingVector7.xzw);
          workingVector5.xyz = -workingVector7.xzw * float3(16,16,16) + workingVector5.xyz;
          workingVector2.w = (uint)workingVector7.y >> 2;
          workingVector10.xyz = RD_COMPARISON_MASK(abs(workingVector3.xyz) >= float3(1,1,1));
          workingVector4.w = (int)workingVector10.y | (int)workingVector10.x;
          workingVector4.w = (int)workingVector10.z | (int)workingVector4.w;
#endif
          if (workingVector4.w != 0) {
            workingVector4.w = dot(workingVector5.xyz, abs(workingVector3.xyz));
            workingVector5.w = dot(workingVector5.yzx, abs(workingVector3.xyz));
            workingVector6.w = dot(workingVector5.zxy, abs(workingVector3.xyz));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = workingVector3.x + workingVector3.y;
            workingVector0.w = varyingNormal0.z * workingVector0.w + workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.y = workingVector3.x + workingVector3.y;
            workingVector0.w = varyingNormal0.z * workingVector0.w + workingVector7.y;
#endif
            workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = ceil(workingVector4.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.y = ceil(workingVector4.w);
#endif
            workingVector4.w = floor(workingVector4.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = workingVector0.w ? workingVector7.w : workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = workingVector0.w ? workingVector7.y : workingVector4.w;
#endif
            workingVector4.w = floor(workingVector5.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = floor(workingVector6.w);
            workingVector12.xyz = workingVector4.www * abs(workingVector3.zxy);
            workingVector12.xyz = abs(workingVector3.xyz) * workingVector0.www + workingVector12.xyz;
            workingVector12.xyz = abs(workingVector3.yzx) * workingVector7.www + workingVector12.xyz;
            workingVector13.xyz = workingVector12.xyz + abs(workingVector3.zxy);
            workingVector14.xyz = workingVector12.xyz + abs(workingVector3.yzx);
            workingVector15.xyz = workingVector13.xyz + abs(workingVector3.yzx);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.y = floor(workingVector6.w);
            workingVector10.xyz = workingVector4.www * abs(workingVector3.zxy);
            workingVector10.xyz = abs(workingVector3.xyz) * workingVector0.www + workingVector10.xyz;
            workingVector10.xyz = abs(workingVector3.yzx) * workingVector7.yyy + workingVector10.xyz;
            workingVector11.xyz = workingVector10.xyz + abs(workingVector3.zxy);
            workingVector14.xyz = workingVector10.xyz + abs(workingVector3.yzx);
            workingVector15.xyz = workingVector11.xyz + abs(workingVector3.yzx);
#endif
            workingVector0.w = workingVector5.w + -workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = -workingVector7.w + workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = -workingVector7.y + workingVector6.w;
#endif
            workingVector5.w = 1 + -workingVector0.w;
            workingVector6.w = 1 + -workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = workingVector6.w * workingVector5.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.y = workingVector6.w * workingVector5.w;
#endif
            workingVector6.w = workingVector6.w * workingVector0.w;
            workingVector5.w = workingVector5.w * workingVector4.w;
            workingVector0.w = workingVector4.w * workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(0,0,0));
#endif
            workingVector4.w = workingVector16.y ? workingVector16.x : 0;
            workingVector4.w = workingVector16.z ? workingVector4.w : 0;
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(16,16,16));
            workingVector8.w = workingVector16.y ? workingVector16.x : 0;
            workingVector8.w = workingVector16.z ? workingVector8.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector4.w = (int)workingVector4.w & (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector4.w = workingVector8.w ? workingVector4.w : 0;
#endif
            if (workingVector4.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector16.xyz = (uint3)workingVector12.xyz;
              workingVector17.xyz = (uint3)workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector16.xyz = (uint3)workingVector10.xyz;
              workingVector17.xyz = (uint3)workingVector11.xyz;
#endif
              workingVector18.xyz = (uint3)workingVector14.xyz;
              workingVector19.xyz = (uint3)workingVector15.xyz;
              workingVector16.xz = (uint2)workingVector16.zx << int2(4,8);
              workingVector4.w = (int)workingVector16.x + (int)workingVector16.y;
              workingVector4.w = (int)workingVector16.z + (int)workingVector4.w;
              workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
              workingVector16.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector16.yzw = workingVector20.xyz * workingVector20.www;
              workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
              workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
              workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
              workingVector4.w = (int)workingVector17.x + (int)workingVector17.y;
              workingVector4.w = (int)workingVector17.z + (int)workingVector4.w;
              workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
              workingVector17.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector17.yzw = workingVector20.xyz * workingVector20.www;
              workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
              workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
              workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
              workingVector4.w = (int)workingVector18.x + (int)workingVector18.y;
              workingVector4.w = (int)workingVector18.z + (int)workingVector4.w;
              workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
              workingVector18.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector18.yzw = workingVector20.xyz * workingVector20.www;
              workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
              workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
              workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
              workingVector4.w = (int)workingVector19.x + (int)workingVector19.y;
              workingVector4.w = (int)workingVector19.z + (int)workingVector4.w;
              workingVector4.w = (int)workingVector2.w + (int)workingVector4.w;
              workingVector19.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector19.yzw = workingVector20.xyz * workingVector20.www;
              workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
              workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector20.xyz = workingVector11.xyw * float3(16,16,16) + workingVector12.xyz;
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector20.xyz = workingVector7.xzw * float3(16,16,16) + workingVector10.xyz;
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector10.xyz < float3(0,0,0));
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector10.xyz >= float3(16,16,16));
#endif
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector4.w = (int)workingVector4.w + (int)workingVector21.x;
              workingVector4.w = (int)workingVector22.y + (int)workingVector4.w;
              workingVector4.w = (int)workingVector21.y + (int)workingVector4.w;
              workingVector4.w = (int)workingVector22.z + (int)workingVector4.w;
              workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.xyz = (uint3)workingVector12.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
              workingVector9.w = (int)workingVector12.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.xyz = (uint3)workingVector10.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.x = (((uint)workingVector10.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.z = (((uint)workingVector10.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector10.y << 0) & bitMask.w) | ((uint)workingVector10.x & ~bitMask.w);
              workingVector9.w = (int)workingVector10.z + (int)workingVector9.w;
#endif
              workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.xy = (int2)workingVector2.ww + int2(4096,4097);
              workingVector10.w = sampledResource9[workingVector12.x].val[0/4];
              workingVector11.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector11.z = (int)workingVector10.w & (int)workingVector11.z;
              workingVector11.z = RD_COMPARISON_MASK((int)workingVector11.z == 0);
              workingVector4.w = (int)workingVector12.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.xy = (int2)workingVector2.ww + int2(4096,4097);
              workingVector10.x = sampledResource9[workingVector10.x].val[0/4];
              workingVector10.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector10.z = (int)workingVector10.z & (int)workingVector10.x;
              workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
              workingVector4.w = (int)workingVector10.y + (int)icb[workingVector4.w+4].x;
#endif
              workingVector4.w = sampledResource9[workingVector4.w].val[0/4];
              workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.xzw = float3(0.0625,0.0625,0.0625) * workingVector20.xyz;
              workingVector12.xzw = floor(workingVector12.xzw);
              workingVector12.xzw = -workingVector12.xzw * float3(16,16,16) + workingVector20.xyz;
              workingVector12.xzw = (uint3)workingVector12.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
              workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
              workingVector4.w = (int)workingVector4.w + (int)workingVector12.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector21.xyz = float3(0.0625,0.0625,0.0625) * workingVector20.xyz;
              workingVector21.xyz = floor(workingVector21.xyz);
              workingVector20.xyz = -workingVector21.xyz * float3(16,16,16) + workingVector20.xyz;
              workingVector20.xyz = (uint3)workingVector20.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
              workingVector10.w = (int)workingVector20.z + (int)workingVector10.w;
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.w;
#endif
              workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = workingVector8.w ? 0 : workingVector11.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = workingVector8.w ? 0 : workingVector10.z;
#endif
              workingVector20.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
              workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
              workingVector21.xyzw = (uint4)workingVector21.xyzw;
              workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.xzw = workingVector21.xyz * workingVector21.www;
              workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
              workingVector12.xzw = workingVector20.xxx ? workingVector12.xzw : float3(0,0,0);
              workingVector16.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
              workingVector12.xzw = workingVector11.xyw * float3(16,16,16) + workingVector13.xyz;
              workingVector20.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector20.yzw = workingVector21.xyz * workingVector21.www;
              workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
              workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
              workingVector16.xyz = workingVector8.www ? float3(0,0,0) : workingVector20.xyz;
              workingVector20.xyz = workingVector7.xzw * float3(16,16,16) + workingVector11.xyz;
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector11.xyz < float3(0,0,0));
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(16,16,16));
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
              bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector10.z = (((uint)workingVector21.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector10.w = (((uint)workingVector21.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.z;
              workingVector4.w = (int)workingVector22.y + (int)workingVector4.w;
              workingVector4.w = (int)workingVector10.w + (int)workingVector4.w;
              workingVector4.w = (int)workingVector22.z + (int)workingVector4.w;
              workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
              workingVector11.xyz = (uint3)workingVector11.xyz;
              bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.z = (((uint)workingVector11.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector10.z & ~bitMask.w);
              workingVector9.w = (int)workingVector10.w + (int)workingVector9.w;
              workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
              workingVector10.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector10.z = (int)workingVector10.z & (int)workingVector10.x;
              workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
              workingVector4.w = (int)workingVector10.y + (int)icb[workingVector4.w+4].x;
              workingVector4.w = sampledResource9[workingVector4.w].val[0/4];
              workingVector4.w = (uint)workingVector4.w >> 2;
              workingVector11.xyz = float3(0.0625,0.0625,0.0625) * workingVector20.xyz;
              workingVector11.xyz = floor(workingVector11.xyz);
              workingVector11.xyz = -workingVector11.xyz * float3(16,16,16) + workingVector20.xyz;
              workingVector11.xyz = (uint3)workingVector11.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector10.w = (int)workingVector11.z + (int)workingVector10.w;
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.w;
              workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
              workingVector8.w = workingVector8.w ? 0 : workingVector10.z;
              workingVector11.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector11.yzw = workingVector20.xyz * workingVector20.www;
              workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
              workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
              workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector11.xyz;
              workingVector11.xyz = workingVector7.xzw * float3(16,16,16) + workingVector14.xyz;
              workingVector20.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#endif
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector4.w = (int)workingVector4.w + (int)workingVector20.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector10.z = (((uint)workingVector20.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector10.w = (((uint)workingVector20.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.z;
#endif
              workingVector4.w = (int)workingVector21.y + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector4.w = (int)workingVector20.y + (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector4.w = (int)workingVector10.w + (int)workingVector4.w;
#endif
              workingVector4.w = (int)workingVector21.z + (int)workingVector4.w;
              workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = (uint3)workingVector13.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.xyz = (uint3)workingVector14.xyz;
              bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.z = (((uint)workingVector14.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector10.z & ~bitMask.w);
              workingVector9.w = (int)workingVector10.w + (int)workingVector9.w;
#endif
              workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector11.z = (int)workingVector10.w & (int)workingVector11.z;
              workingVector11.z = RD_COMPARISON_MASK((int)workingVector11.z == 0);
              workingVector4.w = (int)workingVector12.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector10.z = (int)workingVector10.z & (int)workingVector10.x;
              workingVector10.z = RD_COMPARISON_MASK((int)workingVector10.z == 0);
              workingVector4.w = (int)workingVector10.y + (int)icb[workingVector4.w+4].x;
#endif
              workingVector4.w = sampledResource9[workingVector4.w].val[0/4];
              workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
              workingVector13.xyz = floor(workingVector13.xyz);
              workingVector12.xzw = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
              workingVector12.xzw = (uint3)workingVector12.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
              workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
              workingVector4.w = (int)workingVector4.w + (int)workingVector12.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xyz;
              workingVector14.xyz = floor(workingVector14.xyz);
              workingVector11.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector11.xyz;
              workingVector11.xyz = (uint3)workingVector11.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector10.w = (int)workingVector11.z + (int)workingVector10.w;
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.w;
#endif
              workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = workingVector8.w ? 0 : workingVector11.z;
              workingVector13.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
              workingVector12.xzw = workingVector20.xyz * workingVector20.www;
              workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
              workingVector12.xzw = workingVector13.xxx ? workingVector12.xzw : float3(0,0,0);
              workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
              workingVector12.xzw = workingVector11.xyw * float3(16,16,16) + workingVector14.xyz;
              workingVector13.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
              workingVector20.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = workingVector8.w ? 0 : workingVector10.z;
              workingVector11.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
              workingVector14.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
              workingVector14.xyzw = (uint4)workingVector14.xyzw;
              workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
              workingVector11.yzw = workingVector14.xyz * workingVector14.www;
              workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
              workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
              workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector11.xyz;
              workingVector11.xyz = workingVector7.xzw * float3(16,16,16) + workingVector15.xyz;
              workingVector14.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
              workingVector20.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
#endif
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector4.w = (int)workingVector4.w + (int)workingVector13.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
              bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector10.z = (((uint)workingVector14.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector10.w = (((uint)workingVector14.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.z;
#endif
              workingVector4.w = (int)workingVector20.y + (int)workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector4.w = (int)workingVector13.y + (int)workingVector4.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector4.w = (int)workingVector10.w + (int)workingVector4.w;
#endif
              workingVector4.w = (int)workingVector20.z + (int)workingVector4.w;
              workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = (uint3)workingVector14.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.z + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.xyz = (uint3)workingVector15.xyz;
              bitMask.z = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.z = (((uint)workingVector14.z << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector10.z & ~bitMask.w);
              workingVector9.w = (int)workingVector10.w + (int)workingVector9.w;
#endif
              workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector11.z = (int)workingVector10.w & (int)workingVector11.z;
              workingVector11.z = RD_COMPARISON_MASK((int)workingVector11.z == 0);
              workingVector4.w = (int)workingVector12.y + (int)icb[workingVector4.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector10.x = (int)workingVector10.z & (int)workingVector10.x;
              workingVector10.x = RD_COMPARISON_MASK((int)workingVector10.x == 0);
              workingVector4.w = (int)workingVector10.y + (int)icb[workingVector4.w+4].x;
#endif
              workingVector4.w = sampledResource9[workingVector4.w].val[0/4];
              workingVector4.w = (uint)workingVector4.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
              workingVector13.xyz = floor(workingVector13.xyz);
              workingVector12.xzw = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
              workingVector12.xzw = (uint3)workingVector12.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
              workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
              workingVector4.w = (int)workingVector4.w + (int)workingVector12.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector10.yzw = float3(0.0625,0.0625,0.0625) * workingVector11.xyz;
              workingVector10.yzw = floor(workingVector10.yzw);
              workingVector10.yzw = -workingVector10.yzw * float3(16,16,16) + workingVector11.xyz;
              workingVector10.yzw = (uint3)workingVector10.yzw;
              bitMask.y = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector10.y = (((uint)workingVector10.w << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector10.w = (((uint)workingVector10.y << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.y = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.y = (((uint)workingVector10.z << 0) & bitMask.y) | ((uint)workingVector10.y & ~bitMask.y);
              workingVector10.y = (int)workingVector10.w + (int)workingVector10.y;
              workingVector4.w = (int)workingVector4.w + (int)workingVector10.y;
#endif
              workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = workingVector8.w ? 0 : workingVector11.z;
              workingVector13.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
              workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
              workingVector14.xyzw = (uint4)workingVector14.xyzw;
              workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
              workingVector12.xzw = workingVector14.xyz * workingVector14.www;
              workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
              workingVector12.xzw = workingVector13.xxx ? workingVector12.xzw : float3(0,0,0);
              workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
              workingVector12.xzw = workingVector11.xyw * float3(16,16,16) + workingVector15.xyz;
              workingVector13.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
              workingVector14.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector4.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector4.w = (int)workingVector4.w + (int)workingVector13.x;
              workingVector4.w = (int)workingVector14.y + (int)workingVector4.w;
              workingVector4.w = (int)workingVector13.y + (int)workingVector4.w;
              workingVector4.w = (int)workingVector14.z + (int)workingVector4.w;
              workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector4.w+4].x < 0);
              workingVector13.xyz = (uint3)workingVector15.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.z + (int)workingVector9.w;
              workingVector9.w = (int)workingVector2.w + (int)workingVector9.w;
              workingVector11.z = 1 << (int)icb[workingVector4.w+4].x;
              workingVector10.w = (int)workingVector10.w & (int)workingVector11.z;
              workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
              workingVector4.w = (int)workingVector12.y + (int)icb[workingVector4.w+4].x;
              workingVector4.w = sampledResource9[workingVector4.w].val[0/4];
              workingVector4.w = (uint)workingVector4.w >> 2;
              workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
              workingVector13.xyz = floor(workingVector13.xyz);
              workingVector12.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
              workingVector12.xyz = (uint3)workingVector12.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.z = (((uint)workingVector12.y << 0) & bitMask.z) | ((uint)workingVector12.x & ~bitMask.z);
              workingVector11.z = (int)workingVector12.z + (int)workingVector11.z;
              workingVector4.w = (int)workingVector4.w + (int)workingVector11.z;
              workingVector4.w = workingVector8.w ? workingVector9.w : workingVector4.w;
              workingVector8.w = workingVector8.w ? 0 : workingVector10.w;
              workingVector12.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
              workingVector13.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
              workingVector13.xyzw = (uint4)workingVector13.xyzw;
              workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
              workingVector12.yzw = workingVector13.xyz * workingVector13.www;
              workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
              workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
              workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = workingVector8.w ? 0 : workingVector10.x;
              workingVector10.x = sampledResource9[workingVector4.w].val[0/4];
              workingVector10.yzw = (uint3)workingVector10.xxx >> int3(8,16,24);
              workingVector11.xyzw = workingVector10.xyzw ? float4(0,0,0,0) : 0;
              workingVector11.xyzw = (uint4)workingVector11.xyzw;
              workingVector11.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector11.xyzw;
              workingVector10.yzw = workingVector11.xyz * workingVector11.www;
              workingVector10.yzw = float3(6,6,6) * workingVector10.yzw;
              workingVector10.xyz = workingVector10.xxx ? workingVector10.yzw : float3(0,0,0);
              workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector10.xyz;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = workingVector17.xyz * workingVector6.www;
            workingVector12.xyz = workingVector16.xyz * workingVector7.www + workingVector12.xyz;
            workingVector12.xyz = workingVector18.xyz * workingVector5.www + workingVector12.xyz;
            workingVector12.xyz = workingVector19.xyz * workingVector0.www + workingVector12.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xyz = workingVector17.xyz * workingVector6.www;
            workingVector10.xyz = workingVector16.xyz * workingVector7.yyy + workingVector10.xyz;
            workingVector10.xyz = workingVector18.xyz * workingVector5.www + workingVector10.xyz;
            workingVector10.xyz = workingVector19.xyz * workingVector0.www + workingVector10.xyz;
#endif
          } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.xyz = floor(workingVector5.xyz);
            workingVector5.xyz = -workingVector13.xyz + workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.xyz = floor(workingVector5.xyz);
            workingVector5.xyz = -workingVector11.xyz + workingVector5.xyz;
#endif
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector5.xyx >= workingVector5.yzz);
            bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector14.y & ~bitMask.w);
            workingVector0.w = (int)workingVector14.z + (int)workingVector0.w;
            workingVector4.w = min(workingVector5.x, workingVector5.y);
            workingVector5.x = max(workingVector5.x, workingVector5.y);
            workingVector5.y = min(workingVector4.w, workingVector5.z);
            workingVector5.w = max(workingVector5.x, workingVector5.z);
            workingVector5.x = min(workingVector5.x, workingVector5.z);
            workingVector4.w = max(workingVector5.x, workingVector4.w);
            workingVector5.x = 1 + -workingVector5.w;
            workingVector5.z = workingVector5.w + -workingVector4.w;
            workingVector4.w = workingVector4.w + -workingVector5.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(0,0,0));
#endif
            workingVector5.w = workingVector14.y ? workingVector14.x : 0;
            workingVector5.w = workingVector14.z ? workingVector5.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = float3(1,1,1) + workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector14.xyz = float3(1,1,1) + workingVector11.xyz;
#endif
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(16,16,16));
            workingVector6.w = workingVector15.y ? workingVector15.x : 0;
            workingVector6.w = workingVector15.z ? workingVector6.w : 0;
            workingVector5.w = (int)workingVector5.w & (int)workingVector6.w;
            if (workingVector5.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector15.xyz = (uint3)workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector15.xyz = (uint3)workingVector11.xyz;
#endif
              workingVector16.xy = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
              workingVector16.xz = workingVector16.xy ? float2(0,0) : 0;
              workingVector16.yw = icb[workingVector0.w+4].yz;
              workingVector17.xyz = (int3)workingVector15.xyz + (int3)workingVector16.ywx;
              workingVector16.xy = icb[workingVector0.w+12].yz;
              workingVector16.xyz = (int3)workingVector15.xyz + (int3)workingVector16.xyz;
              workingVector18.xyz = (int3)workingVector15.xyz + int3(1,1,1);
              workingVector15.xz = (uint2)workingVector15.zx << int2(4,8);
              workingVector5.w = (int)workingVector15.x + (int)workingVector15.y;
              workingVector5.w = (int)workingVector15.z + (int)workingVector5.w;
              workingVector5.w = (int)workingVector2.w + (int)workingVector5.w;
              workingVector15.x = sampledResource9[workingVector5.w].val[0/4];
              workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
              workingVector19.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
              workingVector19.xyzw = (uint4)workingVector19.xyzw;
              workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
              workingVector15.yzw = workingVector19.xyz * workingVector19.www;
              workingVector15.yzw = float3(6,6,6) * workingVector15.yzw;
              workingVector15.xyz = workingVector15.xxx ? workingVector15.yzw : float3(0,0,0);
              workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
              workingVector5.w = (int)workingVector17.x + (int)workingVector17.y;
              workingVector5.w = (int)workingVector17.z + (int)workingVector5.w;
              workingVector5.w = (int)workingVector2.w + (int)workingVector5.w;
              workingVector17.x = sampledResource9[workingVector5.w].val[0/4];
              workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
              workingVector19.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
              workingVector19.xyzw = (uint4)workingVector19.xyzw;
              workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
              workingVector17.yzw = workingVector19.xyz * workingVector19.www;
              workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
              workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
              workingVector16.xz = (uint2)workingVector16.zx << int2(4,8);
              workingVector5.w = (int)workingVector16.x + (int)workingVector16.y;
              workingVector5.w = (int)workingVector16.z + (int)workingVector5.w;
              workingVector5.w = (int)workingVector2.w + (int)workingVector5.w;
              workingVector16.x = sampledResource9[workingVector5.w].val[0/4];
              workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
              workingVector19.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
              workingVector19.xyzw = (uint4)workingVector19.xyzw;
              workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
              workingVector16.yzw = workingVector19.xyz * workingVector19.www;
              workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
              workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
              workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
              workingVector5.w = (int)workingVector18.x + (int)workingVector18.y;
              workingVector5.w = (int)workingVector18.z + (int)workingVector5.w;
              workingVector5.w = (int)workingVector2.w + (int)workingVector5.w;
              workingVector18.x = sampledResource9[workingVector5.w].val[0/4];
              workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
              workingVector19.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
              workingVector19.xyzw = (uint4)workingVector19.xyzw;
              workingVector19.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector19.xyzw;
              workingVector18.yzw = workingVector19.xyz * workingVector19.www;
              workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
              workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            } else {
              workingVector19.xy = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
              workingVector19.xy = workingVector19.xy ? float2(0,0) : 0;
              workingVector20.xy = (uint2)icb[workingVector0.w+4].yz;
              workingVector20.z = (uint)workingVector19.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector19.xzw = workingVector20.xyz + workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector19.xzw = workingVector20.xyz + workingVector11.xyz;
#endif
              workingVector20.xy = (uint2)icb[workingVector0.w+12].yz;
              workingVector20.z = (uint)workingVector19.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector20.xyz = workingVector20.xyz + workingVector13.xyz;
              workingVector21.xyz = workingVector11.xyw * float3(16,16,16) + workingVector13.xyz;
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
              workingVector23.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector20.xyz = workingVector20.xyz + workingVector11.xyz;
              workingVector21.xyz = workingVector7.xzw * float3(16,16,16) + workingVector11.xyz;
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector11.xyz < float3(0,0,0));
              workingVector23.xyz = RD_COMPARISON_MASK(workingVector11.xyz >= float3(16,16,16));
#endif
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector22.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector0.w = (int)workingVector0.w + (int)workingVector22.x;
              workingVector0.w = (int)workingVector23.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector23.z + (int)workingVector0.w;
              workingVector5.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = (uint3)workingVector13.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector6.w = (int)workingVector13.z + (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xyz = (uint3)workingVector11.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector6.w = (int)workingVector11.z + (int)workingVector6.w;
#endif
              workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xy = (int2)workingVector2.ww + int2(4096,4097);
              workingVector7.w = sampledResource9[workingVector13.x].val[0/4];
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xy = (int2)workingVector2.ww + int2(4096,4097);
              workingVector7.y = sampledResource9[workingVector11.x].val[0/4];
#endif
              workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = (int)workingVector7.y & (int)workingVector8.w;
#endif
              workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector0.w = (int)workingVector11.y + (int)icb[workingVector0.w+4].x;
#endif
              workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
              workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = float3(0.0625,0.0625,0.0625) * workingVector21.xyz;
              workingVector13.xzw = floor(workingVector13.xzw);
              workingVector13.xzw = -workingVector13.xzw * float3(16,16,16) + workingVector21.xyz;
              workingVector13.xzw = (uint3)workingVector13.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = float3(0.0625,0.0625,0.0625) * workingVector21.xyz;
              workingVector11.xzw = floor(workingVector11.xzw);
              workingVector11.xzw = -workingVector11.xzw * float3(16,16,16) + workingVector21.xyz;
              workingVector11.xzw = (uint3)workingVector11.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector11.z << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector9.w = (int)workingVector11.w + (int)workingVector9.w;
#endif
              workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
              workingVector0.w = workingVector5.w ? workingVector6.w : workingVector0.w;
              workingVector5.w = workingVector5.w ? 0 : workingVector8.w;
              workingVector21.x = sampledResource9[workingVector0.w].val[0/4];
              workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
              workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
              workingVector22.xyzw = (uint4)workingVector22.xyzw;
              workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = workingVector22.xyz * workingVector22.www;
              workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
              workingVector13.xzw = workingVector21.xxx ? workingVector13.xzw : float3(0,0,0);
              workingVector15.xyz = workingVector5.www ? float3(0,0,0) : workingVector13.xzw;
              workingVector13.xzw = workingVector11.xyw * float3(16,16,16) + workingVector19.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = workingVector22.xyz * workingVector22.www;
              workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
              workingVector11.xzw = workingVector21.xxx ? workingVector11.xzw : float3(0,0,0);
              workingVector15.xyz = workingVector5.www ? float3(0,0,0) : workingVector11.xzw;
              workingVector11.xzw = workingVector7.xzw * float3(16,16,16) + workingVector19.xzw;
#endif
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector19.xzw < float3(0,0,0));
              workingVector22.xyz = RD_COMPARISON_MASK(workingVector19.xzw >= float3(16,16,16));
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector0.w = (int)workingVector0.w + (int)workingVector21.x;
              workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector21.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector22.z + (int)workingVector0.w;
              workingVector5.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
              workingVector19.xyz = (uint3)workingVector19.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector19.z = (((uint)workingVector19.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector19.y << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
              workingVector6.w = (int)workingVector19.z + (int)workingVector6.w;
              workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
              workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = (int)workingVector7.y & (int)workingVector8.w;
#endif
              workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector0.w = (int)workingVector11.y + (int)icb[workingVector0.w+4].x;
#endif
              workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
              workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector19.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector19.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
#endif
              workingVector19.xyz = floor(workingVector19.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = -workingVector19.xyz * float3(16,16,16) + workingVector13.xzw;
              workingVector13.xzw = (uint3)workingVector13.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = -workingVector19.xyz * float3(16,16,16) + workingVector11.xzw;
              workingVector11.xzw = (uint3)workingVector11.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector11.z << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector9.w = (int)workingVector11.w + (int)workingVector9.w;
#endif
              workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
              workingVector0.w = workingVector5.w ? workingVector6.w : workingVector0.w;
              workingVector5.w = workingVector5.w ? 0 : workingVector8.w;
              workingVector19.x = sampledResource9[workingVector0.w].val[0/4];
              workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
              workingVector21.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
              workingVector21.xyzw = (uint4)workingVector21.xyzw;
              workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = workingVector21.xyz * workingVector21.www;
              workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
              workingVector13.xzw = workingVector19.xxx ? workingVector13.xzw : float3(0,0,0);
              workingVector17.xyz = workingVector5.www ? float3(0,0,0) : workingVector13.xzw;
              workingVector13.xzw = workingVector11.xyw * float3(16,16,16) + workingVector20.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = workingVector21.xyz * workingVector21.www;
              workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
              workingVector11.xzw = workingVector19.xxx ? workingVector11.xzw : float3(0,0,0);
              workingVector17.xyz = workingVector5.www ? float3(0,0,0) : workingVector11.xzw;
              workingVector11.xzw = workingVector7.xzw * float3(16,16,16) + workingVector20.xyz;
#endif
              workingVector19.xyz = RD_COMPARISON_MASK(workingVector20.xyz < float3(0,0,0));
              workingVector21.xyz = RD_COMPARISON_MASK(workingVector20.xyz >= float3(16,16,16));
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector19.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector19.y = (((uint)workingVector19.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
              workingVector0.w = (int)workingVector0.w + (int)workingVector19.x;
              workingVector0.w = (int)workingVector21.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector19.y + (int)workingVector0.w;
              workingVector0.w = (int)workingVector21.z + (int)workingVector0.w;
              workingVector5.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
              workingVector19.xyz = (uint3)workingVector20.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector19.z = (((uint)workingVector19.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector19.y << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
              workingVector6.w = (int)workingVector19.z + (int)workingVector6.w;
              workingVector6.w = (int)workingVector2.w + (int)workingVector6.w;
              workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector8.w = (int)workingVector7.y & (int)workingVector8.w;
#endif
              workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector0.w = (int)workingVector11.y + (int)icb[workingVector0.w+4].x;
#endif
              workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
              workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector19.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector19.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xzw;
#endif
              workingVector19.xyz = floor(workingVector19.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = -workingVector19.xyz * float3(16,16,16) + workingVector13.xzw;
              workingVector13.xzw = (uint3)workingVector13.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector9.w = (int)workingVector13.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = -workingVector19.xyz * float3(16,16,16) + workingVector11.xzw;
              workingVector11.xzw = (uint3)workingVector11.xzw;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector11.z << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector9.w = (int)workingVector11.w + (int)workingVector9.w;
#endif
              workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
              workingVector0.w = workingVector5.w ? workingVector6.w : workingVector0.w;
              workingVector5.w = workingVector5.w ? 0 : workingVector8.w;
              workingVector19.x = sampledResource9[workingVector0.w].val[0/4];
              workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
              workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
              workingVector20.xyzw = (uint4)workingVector20.xyzw;
              workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = workingVector20.xyz * workingVector20.www;
              workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
              workingVector13.xzw = workingVector19.xxx ? workingVector13.xzw : float3(0,0,0);
              workingVector16.xyz = workingVector5.www ? float3(0,0,0) : workingVector13.xzw;
              workingVector11.xyz = workingVector11.xyw * float3(16,16,16) + workingVector14.xyz;
              workingVector13.xzw = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = workingVector20.xyz * workingVector20.www;
              workingVector11.xzw = float3(6,6,6) * workingVector11.xzw;
              workingVector11.xzw = workingVector19.xxx ? workingVector11.xzw : float3(0,0,0);
              workingVector16.xyz = workingVector5.www ? float3(0,0,0) : workingVector11.xzw;
              workingVector7.xzw = workingVector7.xzw * float3(16,16,16) + workingVector14.xyz;
              workingVector11.xzw = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
#endif
              workingVector19.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
              bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector19.x = (((uint)workingVector19.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector19.y = (((uint)workingVector19.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
              bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector19.z = (((uint)workingVector19.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.w << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
              workingVector0.w = (int)workingVector0.w + (int)workingVector13.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector11.x << 0) & bitMask.w) | ((uint)workingVector19.x & ~bitMask.w);
              bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.w << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
              workingVector0.w = (int)workingVector0.w + (int)workingVector11.x;
#endif
              workingVector0.w = (int)workingVector19.y + (int)workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector0.w = (int)workingVector13.z + (int)workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector0.w = (int)workingVector11.z + (int)workingVector0.w;
#endif
              workingVector0.w = (int)workingVector19.z + (int)workingVector0.w;
              workingVector5.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xzw = (uint3)workingVector14.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
              workingVector6.w = (int)workingVector13.w + (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xzw = (uint3)workingVector14.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.w = (((uint)workingVector11.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector11.z << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector6.w = (int)workingVector11.w + (int)workingVector6.w;
#endif
              workingVector2.w = (int)workingVector2.w + (int)workingVector6.w;
              workingVector6.w = 1 << (int)icb[workingVector0.w+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector6.w = (int)workingVector6.w & (int)workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector6.w = (int)workingVector6.w & (int)workingVector7.y;
#endif
              workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector0.w = (int)workingVector11.y + (int)icb[workingVector0.w+4].x;
#endif
              workingVector0.w = sampledResource9[workingVector0.w].val[0/4];
              workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector11.xyz;
              workingVector13.xyz = floor(workingVector13.xyz);
              workingVector11.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector11.xyz;
              workingVector11.xyz = (uint3)workingVector11.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector11.x = (((uint)workingVector11.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector11.z = (((uint)workingVector11.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector11.y << 0) & bitMask.w) | ((uint)workingVector11.x & ~bitMask.w);
              workingVector7.w = (int)workingVector11.z + (int)workingVector7.w;
              workingVector0.w = (int)workingVector0.w + (int)workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector11.xyz = float3(0.0625,0.0625,0.0625) * workingVector7.xzw;
              workingVector11.xyz = floor(workingVector11.xyz);
              workingVector7.xyz = -workingVector11.xyz * float3(16,16,16) + workingVector7.xzw;
              workingVector7.xyz = (uint3)workingVector7.xyz;
              bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector7.x = (((uint)workingVector7.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
              bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector7.z = (((uint)workingVector7.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
              bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.x = (((uint)workingVector7.y << 0) & bitMask.x) | ((uint)workingVector7.x & ~bitMask.x);
              workingVector7.x = (int)workingVector7.z + (int)workingVector7.x;
              workingVector0.w = (int)workingVector0.w + (int)workingVector7.x;
#endif
              workingVector0.w = workingVector5.w ? workingVector2.w : workingVector0.w;
              workingVector2.w = workingVector5.w ? 0 : workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector11.x = sampledResource9[workingVector0.w].val[0/4];
              workingVector11.yzw = (uint3)workingVector11.xxx >> int3(8,16,24);
              workingVector13.xyzw = (int4)workingVector11.xyzw & int4(255,255,255,255);
              workingVector13.xyzw = (uint4)workingVector13.xyzw;
              workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
              workingVector11.yzw = workingVector13.xyz * workingVector13.www;
              workingVector11.yzw = float3(6,6,6) * workingVector11.yzw;
              workingVector11.xyz = workingVector11.xxx ? workingVector11.yzw : float3(0,0,0);
              workingVector18.xyz = workingVector2.www ? float3(0,0,0) : workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector7.x = sampledResource9[workingVector0.w].val[0/4];
              workingVector7.yzw = (uint3)workingVector7.xxx >> int3(8,16,24);
              workingVector11.xyzw = (int4)workingVector7.xyzw & int4(255,255,255,255);
              workingVector11.xyzw = (uint4)workingVector11.xyzw;
              workingVector11.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector11.xyzw;
              workingVector7.yzw = workingVector11.xyz * workingVector11.www;
              workingVector7.yzw = float3(6,6,6) * workingVector7.yzw;
              workingVector7.xyz = workingVector7.xxx ? workingVector7.yzw : float3(0,0,0);
              workingVector18.xyz = workingVector2.www ? float3(0,0,0) : workingVector7.xyz;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.xyz = workingVector17.xyz * workingVector5.zzz;
            workingVector5.xzw = workingVector15.xyz * workingVector5.xxx + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.xyz = workingVector17.xyz * workingVector5.zzz;
            workingVector5.xzw = workingVector15.xyz * workingVector5.xxx + workingVector7.xyz;
#endif
            workingVector5.xzw = workingVector16.xyz * workingVector4.www + workingVector5.xzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.xyz = workingVector18.xyz * workingVector5.yyy + workingVector5.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.xyz = workingVector18.xyz * workingVector5.yyy + workingVector5.xzw;
#endif
          }
        } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector12.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector10.xyz = float3(0,0,0);
#endif
        }
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = workingVector8.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector10.xyz = workingVector9.xyz;
#endif
      }
      workingVector5.xyz = workingVector1.www * workingVector0.xyz;
      workingVector0.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
      workingVector1.w = workingVector0.w * workingVector0.w;
      workingVector1.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector1.w;
      workingVector0.w = workingVector0.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector1.w;
      workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector1.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
      workingVector11.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector11.xyz;
      workingVector11.xyz = workingVector12.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector11.xyz;
      workingVector12.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
      workingVector11.xyz = max(workingVector12.xyz, workingVector11.xyz);
      workingVector5.xyz = workingVector11.xyz * workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
      workingVector7.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector7.xyz;
      workingVector7.xyz = workingVector10.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector7.xyz;
      workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
      workingVector7.xyz = max(workingVector10.xyz, workingVector7.xyz);
      workingVector5.xyz = workingVector7.xyz * workingVector5.xyz;
#endif
      workingVector5.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector5.xyz;
      workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = workingVector0.www + -workingVector0.xyz;
      workingVector11.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector11.xyz + workingVector0.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_MERS_UNIFORMS.yyy * workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.xyz = workingVector0.www + -workingVector0.xyz;
      workingVector7.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector7.xyz + workingVector0.xyz;
      workingVector7.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector7.xyz;
      workingVector7.xyz = RD_UNIFORM_MERS_UNIFORMS.yyy * workingVector7.xyz;
      workingVector7.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector7.xyz;
#endif
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.xyz = float3(0,0,0);
      workingVector9.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector13.xyz = float3(0,0,0);
      workingVector12.xyz = float3(0,0,0);
#endif
      workingVector5.xyz = float3(0,0,0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.xyz = float3(0,0,0);
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector5.xyz = workingVector5.xyz + workingVector10.xyz;
    workingVector5.xyz = workingVector5.xyz + workingVector9.xyz;
    workingVector5.xyz = workingVector5.xyz + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector5.xyz = workingVector5.xyz + workingVector13.xyz;
    workingVector5.xyz = workingVector5.xyz + workingVector12.xyz;
    workingVector5.xyz = workingVector5.xyz + workingVector7.xyz;
#endif
    workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
    workingVector9.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
    workingVector7.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
#endif
    workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
    workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
    if (workingVector1.w != 0) {
      workingVector4.w = workingVector3.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
      workingVector4.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector4.w;
      workingVector4.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector4.w;
      workingVector4.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector4.w);
      workingVector5.w = RD_COMPARISON_MASK(0 < workingVector4.w);
      if (workingVector5.w != 0) {
        workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
        if (workingVector5.w != 0) {
          workingVector5.w = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
          workingVector5.w = workingVector0.w ? workingVector5.w : 0;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
          workingVector10.xyz = max(workingVector10.xyz, workingVector9.xyz);
          workingVector10.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector10.xyz;
          workingVector10.xyz = workingVector5.www ? workingVector10.xyz : 0;
          workingVector10.xyz = max(float3(1,1,1), workingVector10.xyz);
          workingVector10.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector10.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector9.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
          workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
          workingVector9.xyz = max(workingVector10.xyz, workingVector9.xyz);
          workingVector9.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector9.xyz;
          workingVector9.xyz = workingVector5.www ? workingVector9.xyz : 0;
          workingVector9.xyz = max(float3(1,1,1), workingVector9.xyz);
          workingVector9.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector9.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector7.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
          workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
          workingVector7.xyz = max(workingVector10.xyz, workingVector7.xyz);
          workingVector7.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector7.xyz;
          workingVector7.xyz = workingVector5.www ? workingVector7.xyz : 0;
          workingVector7.xyz = max(float3(1,1,1), workingVector7.xyz);
          workingVector7.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector7.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector10.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
          workingVector10.xyz = max(workingVector10.xyz, workingVector7.xyz);
          workingVector10.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector10.xyz;
          workingVector10.xyz = workingVector5.www ? workingVector10.xyz : 0;
          workingVector10.xyz = max(float3(1,1,1), workingVector10.xyz);
          workingVector10.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector10.xyz;
#endif
        } else {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector11.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
          workingVector5.w = dot(workingVector11.xyz, workingVector11.xyz);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
          workingVector5.w = dot(workingVector10.xyz, workingVector10.xyz);
#endif
          workingVector5.w = rsqrt(workingVector5.w);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector11.xzw = workingVector11.xyz * workingVector5.www;
          workingVector12.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
          workingVector13.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
          workingVector14.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
          workingVector6.w = workingVector12.y + -workingVector12.x;
          workingVector5.w = workingVector11.y * workingVector5.w + -workingVector12.x;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.xzw = workingVector10.xyz * workingVector5.www;
          workingVector11.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
          workingVector12.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
          workingVector13.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
          workingVector6.w = workingVector11.y + -workingVector11.x;
          workingVector5.w = workingVector10.y * workingVector5.w + -workingVector11.x;
#endif
          workingVector6.w = 1 / workingVector6.w;
          workingVector6.w = saturate(workingVector6.w * workingVector5.w);
          workingVector7.w = workingVector6.w * -2 + 3;
          workingVector6.w = workingVector6.w * workingVector6.w;
          workingVector6.w = -workingVector7.w * workingVector6.w + 1;
          workingVector7.w = workingVector6.w * workingVector6.w;
          workingVector6.w = workingVector7.w * workingVector6.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector7.w = dot(workingVector11.xzw, RD_UNIFORM_SUN_DIR.xyz);
          workingVector8.w = dot(workingVector11.xzw, RD_UNIFORM_MOON_DIR.xyz);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector7.w = dot(workingVector10.xzw, RD_UNIFORM_SUN_DIR.xyz);
          workingVector8.w = dot(workingVector10.xzw, RD_UNIFORM_MOON_DIR.xyz);
#endif
          workingVector9.w = workingVector7.w * workingVector7.w + 1;
          workingVector9.w = RD_UNIFORM_SUN_COLOR.w * workingVector9.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector10.w = workingVector8.w * workingVector8.w + 1;
          workingVector10.w = RD_UNIFORM_MOON_COLOR.w * workingVector10.w;
          workingVector10.w = 0.75 * workingVector10.w;
          workingVector11.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector12.x;
          workingVector11.x = 1 / workingVector11.x;
          workingVector5.w = saturate(workingVector11.x * workingVector5.w);
          workingVector11.x = workingVector5.w * -2 + 3;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.x = workingVector8.w * workingVector8.w + 1;
          workingVector10.x = RD_UNIFORM_MOON_COLOR.w * workingVector10.x;
          workingVector10.y = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector11.x;
          workingVector10.y = 1 / workingVector10.y;
          workingVector5.w = saturate(workingVector10.y * workingVector5.w);
          workingVector10.y = workingVector5.w * -2 + 3;
#endif
          workingVector5.w = workingVector5.w * workingVector5.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector5.w = -workingVector11.x * workingVector5.w + 1;
          workingVector11.x = workingVector5.w * workingVector5.w;
          workingVector5.w = workingVector11.x * workingVector5.w;
          workingVector11.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
          workingVector11.xyz = workingVector5.www * workingVector11.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
          workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector11.xyz;
          workingVector11.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector11.xyz;
          workingVector5.w = workingVector9.w * 0.75 + workingVector10.w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector5.w = -workingVector10.y * workingVector5.w + 1;
          workingVector10.y = workingVector5.w * workingVector5.w;
          workingVector5.w = workingVector10.y * workingVector5.w;
          workingVector10.yzw = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
          workingVector10.yzw = workingVector5.www * workingVector10.yzw + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
          workingVector10.yzw = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector10.yzw;
          workingVector10.xyzw = float4(0.75,0.0795774683,0.0795774683,0.0795774683) * workingVector10.xyzw;
          workingVector5.w = workingVector9.w * 0.75 + workingVector10.x;
#endif
          workingVector7.w = max(0, workingVector7.w);
          workingVector7.w = log2(workingVector7.w);
          workingVector7.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector7.w;
          workingVector7.w = exp2(workingVector7.w);
          workingVector7.w = min(1, workingVector7.w);
          workingVector8.w = max(0, workingVector8.w);
          workingVector8.w = log2(workingVector8.w);
          workingVector8.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector8.w;
          workingVector8.w = exp2(workingVector8.w);
          workingVector8.w = min(1, workingVector8.w);
          workingVector9.w = -workingVector7.w * 1.79999995 + 1.80999994;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector10.w = sqrt(workingVector9.w);
          workingVector9.w = workingVector10.w * workingVector9.w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.x = sqrt(workingVector9.w);
          workingVector9.w = workingVector10.x * workingVector9.w;
#endif
          workingVector9.w = 0.0361000001 / workingVector9.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector10.w = -workingVector8.w * 1.79999995 + 1.80999994;
          workingVector11.w = sqrt(workingVector10.w);
          workingVector10.w = workingVector11.w * workingVector10.w;
          workingVector10.w = 0.0361000001 / workingVector10.w;
          workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector13.xyz;
          workingVector12.xyz = workingVector12.xyz * workingVector7.www;
          workingVector13.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector14.xyz;
          workingVector13.xyz = workingVector13.xyz * workingVector8.www;
          workingVector13.xyz = workingVector13.xyz * workingVector10.www;
          workingVector14.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector6.www;
          workingVector14.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector14.xyz;
          workingVector12.xyz = workingVector12.xyz * workingVector9.www + workingVector13.xyz;
          workingVector12.xyz = workingVector14.xyz * workingVector12.xyz;
          workingVector11.xyz = workingVector11.xyz * workingVector5.www + workingVector12.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector10.x = -workingVector8.w * 1.79999995 + 1.80999994;
          workingVector11.x = sqrt(workingVector10.x);
          workingVector10.x = workingVector11.x * workingVector10.x;
          workingVector10.x = 0.0361000001 / workingVector10.x;
          workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector12.xyz;
          workingVector11.xyz = workingVector11.xyz * workingVector7.www;
          workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector13.xyz;
          workingVector12.xyz = workingVector12.xyz * workingVector8.www;
          workingVector12.xyz = workingVector12.xyz * workingVector10.xxx;
          workingVector13.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector6.www;
          workingVector13.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector13.xyz;
          workingVector11.xyz = workingVector11.xyz * workingVector9.www + workingVector12.xyz;
          workingVector11.xyz = workingVector13.xyz * workingVector11.xyz;
          workingVector10.xyz = workingVector10.yzw * workingVector5.www + workingVector11.xyz;
#endif
          workingVector5.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
          workingVector6.w = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector12.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector11.xyz;
          workingVector12.xyz = workingVector6.www * workingVector12.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
          workingVector10.xyz = workingVector5.www ? workingVector12.xyz : workingVector11.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
          workingVector11.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector10.xyz;
          workingVector11.xyz = workingVector6.www * workingVector11.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
          workingVector9.xyz = workingVector5.www ? workingVector11.xyz : workingVector10.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
          workingVector11.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector10.xyz;
          workingVector11.xyz = workingVector6.www * workingVector11.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
          workingVector7.xyz = workingVector5.www ? workingVector11.xyz : workingVector10.xyz;
#endif
        }
      } else {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector10.xyz = float3(0,0,0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector9.xyz = float3(0,0,0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector7.xyz = float3(0,0,0);
#endif
      }
    } else {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xyz = float3(0,0,0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.xyz = float3(0,0,0);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.xyz = float3(0,0,0);
#endif
      workingVector4.w = 0;
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
    workingVector10.xyz = workingVector10.xyz + -workingVector5.xyz;
    workingVector5.xyz = workingVector4.www * workingVector10.xyz + workingVector5.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
    workingVector9.xyz = workingVector9.xyz + -workingVector5.xyz;
    workingVector5.xyz = workingVector4.www * workingVector9.xyz + workingVector5.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
    workingVector7.xyz = workingVector7.xyz + -workingVector5.xyz;
    workingVector5.xyz = workingVector4.www * workingVector7.xyz + workingVector5.xyz;
#endif
    if (workingVector2.w != 0) {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xy = float2(1,1) + workingVector2.xy;
      workingVector10.xy = float2(0.5,0.5) * workingVector10.xy;
      workingVector11.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
      workingVector11.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector11.xy;
      workingVector11.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector11.xy;
      workingVector11.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector11.xy;
      workingVector4.w = -workingVector11.x / workingVector11.y;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.xy = float2(1,1) + workingVector2.xy;
      workingVector9.xy = float2(0.5,0.5) * workingVector9.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector10.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector10.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector10.xy;
      workingVector4.w = -workingVector10.x / workingVector10.y;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.xy = float2(1,1) + workingVector2.xy;
      workingVector7.xy = float2(0.5,0.5) * workingVector7.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector10.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector10.xy;
      workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector10.xy;
      workingVector4.w = -workingVector10.x / workingVector10.y;
#endif
      workingVector4.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector4.w;
      workingVector5.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector4.w = workingVector4.w / workingVector5.w;
      workingVector4.w = workingVector4.w * 53.5981483 + 1;
      workingVector4.w = log2(workingVector4.w);
      workingVector4.w = 0.173286796 * workingVector4.w;
      workingVector5.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector6.w = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector4.w = workingVector4.w * workingVector6.w + -0.5;
      workingVector6.w = (int)workingVector4.w;
      workingVector5.w = (int)workingVector5.w + -2;
      workingVector6.w = max(0, (int)workingVector6.w);
      workingVector5.w = min((int)workingVector6.w, (int)workingVector5.w);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.z = (int)workingVector5.w;
      workingVector4.w = saturate(-workingVector10.z + workingVector4.w);
      workingVector11.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector10.xyz, 0).xyzw;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.z = (int)workingVector5.w;
      workingVector4.w = saturate(-workingVector9.z + workingVector4.w);
      workingVector10.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyz, 0).xyzw;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.z = (int)workingVector5.w;
      workingVector4.w = saturate(-workingVector7.z + workingVector4.w);
      workingVector10.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector7.xyz, 0).xyzw;
#endif
      workingVector5.w = (int)workingVector5.w + 1;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.w = (int)workingVector5.w;
      workingVector10.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector10.xyw, 0).xyzw;
      workingVector10.xyzw = workingVector10.xyzw + -workingVector11.xyzw;
      workingVector10.xyzw = workingVector4.wwww * workingVector10.xyzw + workingVector11.xyzw;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.w = (int)workingVector5.w;
      workingVector9.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyw, 0).xyzw;
      workingVector9.xyzw = workingVector9.xyzw + -workingVector10.xyzw;
      workingVector9.xyzw = workingVector4.wwww * workingVector9.xyzw + workingVector10.xyzw;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.w = (int)workingVector5.w;
      workingVector7.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector7.xyw, 0).xyzw;
      workingVector7.xyzw = workingVector7.xyzw + -workingVector10.xyzw;
      workingVector7.xyzw = workingVector4.wwww * workingVector7.xyzw + workingVector10.xyzw;
#endif
    } else {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xyzw = float4(0,0,0,1);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.xyzw = float4(0,0,0,1);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.xyzw = float4(0,0,0,1);
#endif
    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
    workingVector5.xyz = workingVector10.www * workingVector5.xyz + workingVector10.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
    workingVector5.xyz = workingVector9.www * workingVector5.xyz + workingVector9.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
    workingVector5.xyz = workingVector7.www * workingVector5.xyz + workingVector7.xyz;
#endif
    workingVector4.w = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
    if (workingVector4.w != 0) {
      workingVector4.w = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
      workingVector4.w = max(1, workingVector4.w);
      workingVector5.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
      workingVector4.w = saturate(workingVector5.w / workingVector4.w);
      workingVector5.w = workingVector4.w * workingVector4.w;
      workingVector4.w = workingVector5.w * workingVector4.w;
      workingVector4.w = RD_UNIFORM_IBL_PARAMETERS.x * workingVector4.w;
      workingVector5.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
      workingVector6.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector7.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
      workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector10.xyz;
      workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector10.xyz;
      workingVector10.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector10.xyz;
      workingVector11.xyz = workingVector7.www ? workingVector6.xyz : varyingTexCoord3.xyz;
      workingVector10.xyz = workingVector7.www ? workingVector10.xyz : workingVector1.xyz;
      workingVector11.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector11.xyz;
      workingVector7.w = dot(workingVector11.xyz, workingVector11.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector11.xyz = workingVector11.xyz * workingVector7.www;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector7.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector9.xyz;
      workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector9.xyz;
      workingVector10.xyz = workingVector7.www ? workingVector6.xyz : varyingTexCoord3.xyz;
      workingVector9.xyz = workingVector7.www ? workingVector9.xyz : workingVector1.xyz;
      workingVector10.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector10.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
      workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector7.yzw;
      workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector7.yzw;
      workingVector7.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector7.yzw;
      workingVector10.xyz = workingVector7.xxx ? workingVector6.xyz : varyingTexCoord3.xyz;
      workingVector7.xyz = workingVector7.xxx ? workingVector7.yzw : workingVector1.xyz;
      workingVector10.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector10.xyz;
#endif
      workingVector7.w = dot(workingVector10.xyz, workingVector10.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector10.xyz = workingVector10.xyz * workingVector7.www;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector7.w = dot(workingVector11.xyz, workingVector3.xyz);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector7.w = dot(workingVector9.xyz, workingVector9.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector9.xyz = workingVector9.xyz * workingVector7.www;
      workingVector7.w = dot(workingVector10.xyz, workingVector3.xyz);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.w = dot(workingVector7.xyz, workingVector7.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector7.xyz = workingVector7.xyz * workingVector7.www;
      workingVector7.w = dot(workingVector10.xyz, workingVector3.xyz);
#endif
      workingVector7.w = workingVector7.w + workingVector7.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector11.xyz = workingVector3.xyz * -workingVector7.www + workingVector11.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector10.xyz = workingVector3.xyz * -workingVector7.www + workingVector10.xyz;
#endif
      workingVector3.x = RD_COMPARISON_MASK((int)workingVector6.w == 1);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector12.xz = float2(1,1) + -RD_UNIFORM_MERS_UNIFORMS.zz;
      workingVector3.y = workingVector12.x * workingVector12.x;
      workingVector3.z = -workingVector12.x * workingVector12.x + 1;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector11.xz = float2(1,1) + -RD_UNIFORM_MERS_UNIFORMS.zz;
      workingVector3.y = workingVector11.x * workingVector11.x;
      workingVector3.z = -workingVector11.x * workingVector11.x + 1;
#endif
      workingVector6.w = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
      workingVector3.y = workingVector3.y * workingVector3.y;
      workingVector3.y = -workingVector3.y * workingVector3.y + 1;
      workingVector3.yz = workingVector6.ww * workingVector3.yz;
      workingVector3.x = workingVector3.x ? workingVector3.z : workingVector3.y;
      workingVector3.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
      workingVector3.y = (int)workingVector3.y + 2;
      workingVector3.z = (int)workingVector3.y & 0x80000000;
      workingVector3.y = max((int)-workingVector3.y, (int)workingVector3.y);
      workingVector3.y = (uint)workingVector3.y % 3;
      workingVector6.w = -(int)workingVector3.y;
      workingVector3.y = workingVector3.z ? workingVector6.w : workingVector3.y;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector11.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
      workingVector13.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector11.xyzw, workingVector3.x).xyz;
      workingVector11.w = (int)workingVector3.y;
      workingVector3.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector11.xyzw, workingVector3.x).xyz;
      workingVector11.xyz = workingVector13.xyz + -workingVector3.xyz;
      workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector11.xyz + workingVector3.xyz;
      workingVector11.xyz = float3(301.724121,301.724121,301.724121) * workingVector3.xyz;
      workingVector3.xyz = workingVector5.www ? workingVector11.xyz : workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector10.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
      workingVector12.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector10.xyzw, workingVector3.x).xyz;
      workingVector10.w = (int)workingVector3.y;
      workingVector3.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector10.xyzw, workingVector3.x).xyz;
      workingVector10.xyz = workingVector12.xyz + -workingVector3.xyz;
      workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.www * workingVector10.xyz + workingVector3.xyz;
      workingVector10.xyz = float3(301.724121,301.724121,301.724121) * workingVector3.xyz;
      workingVector3.xyz = workingVector5.www ? workingVector10.xyz : workingVector3.xyz;
#endif
      workingVector3.xyz = workingVector3.xyz * workingVector4.www;
      workingVector3.xyz = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector3.xyz;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector11.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
      workingVector13.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
      workingVector12.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
      workingVector13.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector12.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
      workingVector12.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
      workingVector13.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector12.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector11.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
      workingVector13.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz;
#endif
      workingVector4.w = saturate(dot(workingVector13.xyz, float3(0.212599993,0.715200007,0.0722000003)));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector11.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz + -workingVector9.xyz;
      workingVector11.xyz = workingVector4.www * workingVector11.xyz + workingVector9.xyz;
      workingVector11.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector11.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector12.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector12.xyz + -workingVector10.xyz;
      workingVector10.xyz = workingVector4.www * workingVector12.xyz + workingVector10.xyz;
      workingVector10.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector10.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector11.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector11.xyz + -workingVector7.xyz;
      workingVector11.xyz = workingVector4.www * workingVector11.xyz + workingVector7.xyz;
      workingVector11.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector11.xyz;
#endif
      workingVector4.w = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector5.w = dot(workingVector11.xyz, float3(0.212599993,0.715200007,0.0722000003));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector5.w = dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003));
#endif
      workingVector4.w = RD_COMPARISON_MASK(workingVector4.w < workingVector5.w);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector11.xyz = workingVector4.www ? workingVector11.xyz : 0;
      workingVector11.xyz = workingVector4.www ? workingVector11.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector0.www ? workingVector11.xyz : workingVector3.xyz;
      workingVector12.y = saturate(dot(workingVector4.xyz, -workingVector10.xyz));
      workingVector10.xy = materialTexture0.Sample(textureSampler0, workingVector12.yz).xy;
      workingVector10.xyz = workingVector7.xyz * workingVector10.xxx + workingVector10.yyy;
      workingVector3.xyz = workingVector10.xyz * workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xyz = workingVector4.www ? workingVector10.xyz : 0;
      workingVector10.xyz = workingVector4.www ? workingVector10.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector0.www ? workingVector10.xyz : workingVector3.xyz;
      workingVector11.y = saturate(dot(workingVector4.xyz, -workingVector9.xyz));
      workingVector9.xy = materialTexture0.Sample(textureSampler0, workingVector11.yz).xy;
      workingVector9.xyz = workingVector7.xyz * workingVector9.xxx + workingVector9.yyy;
      workingVector3.xyz = workingVector9.xyz * workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector10.xyz = workingVector4.www ? workingVector10.xyz : 0;
      workingVector10.xyz = workingVector4.www ? workingVector10.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector0.www ? workingVector10.xyz : workingVector3.xyz;
      workingVector11.y = saturate(dot(workingVector4.xyz, -workingVector7.xyz));
      workingVector7.xy = materialTexture0.Sample(textureSampler0, workingVector11.yz).xy;
      workingVector7.xyz = workingVector8.xyz * workingVector7.xxx + workingVector7.yyy;
      workingVector3.xyz = workingVector7.xyz * workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector11.xyz = workingVector4.www ? workingVector11.xyz : 0;
      workingVector11.xyz = workingVector4.www ? workingVector11.xyz : workingVector3.xyz;
      workingVector3.xyz = workingVector0.www ? workingVector11.xyz : workingVector3.xyz;
      workingVector12.y = saturate(dot(workingVector4.xyz, -workingVector10.xyz));
      workingVector10.xy = materialTexture0.Sample(textureSampler0, workingVector12.yz).xy;
      workingVector10.xyz = workingVector8.xyz * workingVector10.xxx + workingVector10.yyy;
      workingVector3.xyz = workingVector10.xyz * workingVector3.xyz;
#endif
      workingVector3.w = workingVector3.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
      workingVector3.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector3.w;
      workingVector3.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector3.w;
      workingVector4.w = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector3.w);
      workingVector4.w = 1 + -workingVector4.w;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector10.xyz = workingVector4.www * workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector9.xyz = workingVector4.www * workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector7.xyz = workingVector4.www * workingVector3.xyz;
#endif
      workingVector4.w = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
      workingVector3.w = saturate(workingVector3.w / workingVector4.w);
      workingVector3.w = 1 + -workingVector3.w;
      workingVector3.xyz = workingVector3.xyz * workingVector3.www;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector3.xyz = workingVector1.www ? workingVector10.xyz : workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
      workingVector3.xyz = workingVector1.www ? workingVector9.xyz : workingVector3.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
      workingVector3.xyz = workingVector1.www ? workingVector7.xyz : workingVector3.xyz;
#endif
      if (workingVector2.w != 0) {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector10.xy = float2(1,1) + workingVector2.xy;
        workingVector10.xy = float2(0.5,0.5) * workingVector10.xy;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector9.xy = float2(1,1) + workingVector2.xy;
        workingVector9.xy = float2(0.5,0.5) * workingVector9.xy;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector7.xy = float2(1,1) + workingVector2.xy;
        workingVector7.xy = float2(0.5,0.5) * workingVector7.xy;
#endif
        workingVector2.yw = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector2.yy;
        workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector2.xx + workingVector2.yw;
        workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector2.zz + workingVector2.xy;
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
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector10.z = (int)workingVector2.x;
        workingVector1.w = saturate(-workingVector10.z + workingVector1.w);
        workingVector2.y = materialTexture5.SampleLevel(textureSampler5, workingVector10.xyz, 0).w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector9.z = (int)workingVector2.x;
        workingVector1.w = saturate(-workingVector9.z + workingVector1.w);
        workingVector2.y = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyz, 0).w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector7.z = (int)workingVector2.x;
        workingVector1.w = saturate(-workingVector7.z + workingVector1.w);
        workingVector2.y = materialTexture5.SampleLevel(textureSampler5, workingVector7.xyz, 0).w;
#endif
        workingVector2.x = (int)workingVector2.x + 1;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON) || (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector10.w = (int)workingVector2.x;
        workingVector2.x = materialTexture5.SampleLevel(textureSampler5, workingVector10.xyw, 0).w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector9.w = (int)workingVector2.x;
        workingVector2.x = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyw, 0).w;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector7.w = (int)workingVector2.x;
        workingVector2.x = materialTexture5.SampleLevel(textureSampler5, workingVector7.xyw, 0).w;
#endif
        workingVector2.x = workingVector2.x + -workingVector2.y;
        workingVector1.w = workingVector1.w * workingVector2.x + workingVector2.y;
        workingVector3.xyz = workingVector1.www * workingVector3.xyz;
      }
    } else {
      if (workingVector0.w != 0) {
        workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector6.yyy;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector6.xxx + workingVector2.xyz;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector6.zzz + workingVector2.xyz;
        workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector2.xyz;
        workingVector1.xyz = workingVector0.www ? workingVector2.xyz : workingVector1.xyz;
        workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
        workingVector0.w = rsqrt(workingVector0.w);
        workingVector1.xyz = workingVector1.xyz * workingVector0.www;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector2.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
        workingVector6.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz;
        workingVector0.w = saturate(dot(workingVector6.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector2.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz + -workingVector9.xyz;
        workingVector2.xyz = workingVector0.www * workingVector2.xyz + workingVector9.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector2.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector6.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
        workingVector8.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector6.xyz;
        workingVector0.w = saturate(dot(workingVector8.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector6.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector6.xyz + -workingVector2.xyz;
        workingVector2.xyz = workingVector0.www * workingVector6.xyz + workingVector2.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        workingVector2.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector6.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
        workingVector7.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector6.xyz;
        workingVector0.w = saturate(dot(workingVector7.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector6.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector6.xyz + -workingVector2.xyz;
        workingVector2.xyz = workingVector0.www * workingVector6.xyz + workingVector2.xyz;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        workingVector2.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
        workingVector6.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz;
        workingVector0.w = saturate(dot(workingVector6.xyz, float3(0.212599993,0.715200007,0.0722000003)));
        workingVector2.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz + -workingVector7.xyz;
        workingVector2.xyz = workingVector0.www * workingVector2.xyz + workingVector7.xyz;
#endif
        workingVector2.xyz = RD_UNIFORM_MERS_UNIFORMS.xxx * workingVector2.xyz;
        workingVector0.w = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
        workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
        workingVector2.xyz = workingVector0.www ? workingVector2.xyz : 0;
        workingVector1.x = saturate(dot(workingVector4.xyz, -workingVector1.xyz));
        workingVector1.y = 1 + -RD_UNIFORM_MERS_UNIFORMS.z;
        workingVector1.xy = materialTexture0.Sample(textureSampler0, workingVector1.xy).xy;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector1.xyz = workingVector7.xyz * workingVector1.xxx + workingVector1.yyy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector1.xyz = workingVector8.xyz * workingVector1.xxx + workingVector1.yyy;
#endif
        workingVector3.xyz = workingVector2.xyz * workingVector1.xyz;
      } else {
        workingVector3.xyz = float3(0,0,0);
      }
    }
    workingVector0.xyz = workingVector5.xyz + workingVector3.xyz;
  }
  workingVector0.w = materialTexture3.Sample(textureSampler3, float2(0.5,0.5)).x;
  workingVector0.w = 0.180000007 / workingVector0.w;
  workingVector0.w = 9.99999975e-005 + workingVector0.w;
  workingVector1.x = RD_UNIFORM_LIGHTING_ENABLED_AND_ADAPTIVE_EMISSIVE.y / workingVector0.w;
  workingVector0.xyz = workingVector0.xyz * workingVector1.xxx + workingVector0.xyz;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  workingVector1.yzw = workingVector0.xyz * workingVector0.www;
  fragmentColor0.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector0.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_FEATURE_USE_TEXTURES == RD_ON


#endif
void executeFragmentStage()
{
#if RD_FEATURE_USE_TEXTURES == RD_ON
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < 0.5f)
    {
        isFragmentDiscarded = true;
    }
    float productValue = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
    float productValue1 = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
    float productValue2 = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
    float productValue211 = RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.x;
    float productValue212 = RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.y;
    float productValue213 = RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.z;
#endif
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
#if RD_FEATURE_USE_TEXTURES == RD_ON
        exponentialValue = exp2(log2(max(productValue, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue1, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue2, 0.0f)) * 2.2000000476837158203125f);
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
        exponentialValue = exp2(log2(max(productValue211, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue212, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue213, 0.0f)) * 2.2000000476837158203125f);
#endif
    }
    else
    {
#if RD_FEATURE_USE_TEXTURES == RD_ON
        exponentialValue = (productValue <= 0.040449999272823333740234375f) ? (productValue * 0.077399380505084991455078125f) : exp2(log2((productValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue1 <= 0.040449999272823333740234375f) ? (productValue1 * 0.077399380505084991455078125f) : exp2(log2((productValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue2 <= 0.040449999272823333740234375f) ? (productValue2 * 0.077399380505084991455078125f) : exp2(log2((productValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
        exponentialValue = (productValue211 <= 0.040449999272823333740234375f) ? (productValue211 * 0.077399380505084991455078125f) : exp2(log2((productValue211 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue212 <= 0.040449999272823333740234375f) ? (productValue212 * 0.077399380505084991455078125f) : exp2(log2((productValue212 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue213 <= 0.040449999272823333740234375f) ? (productValue213 * 0.077399380505084991455078125f) : exp2(log2((productValue213 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#endif
    }
    float productValue29;
    float productValue30;
    float productValue31;
    if (RD_UNIFORM_LIGHTING_ENABLED_AND_ADAPTIVE_EMISSIVE.x > 0.0f)
    {
        float multiplyAddValue = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
        float multiplyAddValue1 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
        float multiplyAddValue2 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
        float multiplyAddValue3 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.w;
        float multiplyAddValue4 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
        float multiplyAddValue5 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
        float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float sumValue3 = (-0.0f) - multiplyAddValue6;
#endif
        float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.w, multiplyAddValue3, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue2, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue1, multiplyAddValue * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)));
        float multiplyAddValue8 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
        float multiplyAddValue9 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue8;
        float multiplyAddValue10 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue8;
        float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue7, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue6, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue5, multiplyAddValue4 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue8;
        float inverseLengthValue = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float productValue3 = inverseLengthValue * varyingNormal0.x;
        float productValue4 = inverseLengthValue * varyingNormal0.y;
        float productValue5 = inverseLengthValue * varyingNormal0.z;
        float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
        float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
        float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue5, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue4, productValue3 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
        float sumValue = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
        float sumValue1 = varyingTexCoord3.y - RD_UNIFORM_WORLD_ORIGIN.y;
        float sumValue2 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
        float scalarValue1 = ddx_coarse(multiplyAddValue4);
        float scalarValue2 = ddx_coarse(multiplyAddValue5);
        float scalarValue3 = ddx_coarse(multiplyAddValue6);
        float inverseLengthValue1 = rsqrt(dot(float3(scalarValue1, scalarValue2, scalarValue3), float3(scalarValue1, scalarValue2, scalarValue3)));
        float productValue6 = inverseLengthValue1 * scalarValue1;
        float productValue7 = inverseLengthValue1 * scalarValue2;
        float productValue8 = inverseLengthValue1 * scalarValue3;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float sumValue3 = (-0.0f) - multiplyAddValue6;
#endif
        float sumValue4 = ddy_coarse((-0.0f) - multiplyAddValue4);
        float sumValue5 = ddy_coarse((-0.0f) - multiplyAddValue5);
        float scalarValue4 = ddy_coarse(sumValue3);
        float inverseLengthValue2 = rsqrt(dot(float3(sumValue4, sumValue5, scalarValue4), float3(sumValue4, sumValue5, scalarValue4)));
        float productValue9 = inverseLengthValue2 * sumValue4;
        float productValue10 = inverseLengthValue2 * sumValue5;
        float productValue11 = inverseLengthValue2 * scalarValue4;
        float productValue12 = (productValue11 * productValue7) - (productValue10 * productValue8);
        float productValue13 = (productValue9 * productValue8) - (productValue11 * productValue6);
        float productValue14 = (productValue10 * productValue6) - (productValue9 * productValue7);
        float inverseLengthValue3 = rsqrt(dot(float3(productValue12, productValue13, productValue14), float3(productValue12, productValue13, productValue14)));
        float productValue15 = productValue12 * inverseLengthValue3;
        float productValue16 = productValue13 * inverseLengthValue3;
        float productValue17 = productValue14 * inverseLengthValue3;
        float multiplyAddValue15 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue17, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue16, productValue15 * RD_UNIFORM_INV_VIEW_ROW_0.x));
        float multiplyAddValue16 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue17, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue16, productValue15 * RD_UNIFORM_INV_VIEW_ROW_0.y));
        float multiplyAddValue17 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue17, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue16, productValue15 * RD_UNIFORM_INV_VIEW_ROW_0.z));
        float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17)));
        float quotientValue = round((inverseLengthValue4 * multiplyAddValue15) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float quotientValue1 = round((inverseLengthValue4 * multiplyAddValue16) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float quotientValue2 = round((inverseLengthValue4 * multiplyAddValue17) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
        float inverseLengthValue5 = rsqrt(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(quotientValue, quotientValue1, quotientValue2)));
        float productValue18 = inverseLengthValue5 * quotientValue;
        float productValue19 = inverseLengthValue5 * quotientValue1;
        float productValue20 = inverseLengthValue5 * quotientValue2;
        float productValue21 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
        float quotientValue3 = productValue21 - (sumValue - (floor(sumValue / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float quotientValue4 = productValue21 - (sumValue1 - (floor(sumValue1 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float quotientValue5 = productValue21 - (sumValue2 - (floor(sumValue2 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
        float dotProductValue = dot(float3(quotientValue3, quotientValue4, quotientValue5), float3(productValue18, productValue19, productValue20));
        float productValue22 = (varyingTexCoord3.x + quotientValue3) - (dotProductValue * productValue18);
        float productValue23 = (varyingTexCoord3.y - (dotProductValue * productValue19)) + quotientValue4;
        float productValue24 = (varyingTexCoord3.z - (dotProductValue * productValue20)) + quotientValue5;
        float sumValue6 = 1.0f - RD_UNIFORM_MERS_UNIFORMS.x;
        float productValue25 = sumValue6 * 0.039999999105930328369140625f;
        float productValue26 = productValue25 + (RD_UNIFORM_MERS_UNIFORMS.x * exponentialValue);
        float productValue27 = productValue25 + (RD_UNIFORM_MERS_UNIFORMS.x * exponentialValue1);
        float productValue28 = productValue25 + (RD_UNIFORM_MERS_UNIFORMS.x * exponentialValue2);
        float clampedValue;
        float clampedValue1;
        float clampedValue2;
        if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
        {
            float productValue32 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
            clampedValue = clamp(productValue32, 0.0f, 1.0f);
            clampedValue1 = clamp(((productValue32 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue32, 0.0f, 1.0f);
            clampedValue2 = clamp((((productValue32 * productValue32) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue32, 0.0f, 1.0f);
        }
        else
        {
            clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
            clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
            clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
        }
#if RD_FEATURE_USE_TEXTURES == RD_ON
        float sampledTextureValue2;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
        float sampledTextureValue1;
#endif
        if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
        {
#if RD_FEATURE_USE_TEXTURES == RD_ON
            sampledTextureValue2 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3(RD_UNIFORM_CAUSTICS_PARAMETERS.y * sumValue, RD_UNIFORM_CAUSTICS_PARAMETERS.y * sumValue2, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue3, productValue4, productValue5)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
            sampledTextureValue1 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3(RD_UNIFORM_CAUSTICS_PARAMETERS.y * sumValue, RD_UNIFORM_CAUSTICS_PARAMETERS.y * sumValue2, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue3, productValue4, productValue5)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
#endif
        }
        else
        {
#if RD_FEATURE_USE_TEXTURES == RD_ON
            sampledTextureValue2 = 1.0f;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
            sampledTextureValue1 = 1.0f;
#endif
        }
        float clampedValue3 = clamp(((RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
        float nonlinearValue = sqrt(((multiplyAddValue5 * multiplyAddValue5) + (multiplyAddValue4 * multiplyAddValue4)) + (multiplyAddValue6 * multiplyAddValue6));
        float productValue40;
        float productValue41;
        float productValue42;
        float productValue43;
        float productValue44;
        float productValue45;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue9;
        float intermediateValue11;
        float intermediateValue13;
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue8;
        float intermediateValue10;
        float intermediateValue12;
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
#endif
        if (multiplyAddValue11 != 1.0f)
        {
            float sumValue7 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
            float quotientValue6 = multiplyAddValue4 / sumValue7;
            float quotientValue7 = multiplyAddValue5 / sumValue7;
            float quotientValue8 = multiplyAddValue6 / sumValue7;
            float sumValue8 = (-0.0f) - quotientValue6;
            float sumValue9 = (-0.0f) - quotientValue7;
            float sumValue10 = (-0.0f) - quotientValue8;
            float productValue33 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * RD_UNIFORM_MERS_UNIFORMS.w;
            bool conditionValue = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float intermediateValue10;
            float intermediateValue12;
            float intermediateValue14;
            float intermediateValue16;
            float intermediateValue18;
            float intermediateValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float intermediateValue9;
            float intermediateValue11;
            float intermediateValue13;
            float intermediateValue15;
            float intermediateValue17;
            float intermediateValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float intermediateValue15;
            float intermediateValue16;
            float intermediateValue17;
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float intermediateValue14;
            float intermediateValue15;
            float intermediateValue16;
            float intermediateValue17;
            float intermediateValue18;
            float intermediateValue19;
#endif
            if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.9999997473787516355514526367188e-05f))
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue10 = 0.0f;
                intermediateValue12 = 0.0f;
                intermediateValue14 = 0.0f;
                intermediateValue16 = 0.0f;
                intermediateValue18 = 0.0f;
                intermediateValue20 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue9 = 0.0f;
                intermediateValue11 = 0.0f;
                intermediateValue13 = 0.0f;
                intermediateValue15 = 0.0f;
                intermediateValue17 = 0.0f;
                intermediateValue19 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue15 = 0.0f;
                intermediateValue16 = 0.0f;
                intermediateValue17 = 0.0f;
                intermediateValue18 = 0.0f;
                intermediateValue19 = 0.0f;
                intermediateValue20 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue14 = 0.0f;
                intermediateValue15 = 0.0f;
                intermediateValue16 = 0.0f;
                intermediateValue17 = 0.0f;
                intermediateValue18 = 0.0f;
                intermediateValue19 = 0.0f;
#endif
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                float productValue69;
                float intermediateValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float productValue69;
                float intermediateValue23;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                float productValue60;
                float intermediateValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float productValue60;
                float intermediateValue21;
#endif
                if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
                {
                    float multiplyAddValue18 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                    float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                    float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
                    float dotProductValue1 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(inverseLengthValue6 * multiplyAddValue18, inverseLengthValue6 * multiplyAddValue19, inverseLengthValue6 * multiplyAddValue20)), 0.0f);
                    float clampedValue4 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                    float comparisonValue = (clampedValue4 * productValue3) + (conditionValue ? productValue22 : varyingTexCoord3.x);
                    float comparisonValue1 = (clampedValue4 * productValue4) + (conditionValue ? productValue23 : varyingTexCoord3.y);
                    float comparisonValue2 = (clampedValue4 * productValue5) + (conditionValue ? productValue24 : varyingTexCoord3.z);
                    uint clampedValue5 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue25;
                    float intermediateValue36;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue24;
                    float intermediateValue35;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue23;
                    float intermediateValue35;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue22;
                    float intermediateValue34;
#endif
                    if (int(clampedValue5) > int(0u))
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue35;
                        float intermediateValue37;
                        uint intermediateValue48;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue34;
                        float intermediateValue36;
                        uint intermediateValue47;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue34;
                        float intermediateValue36;
                        uint intermediateValue54;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue33;
                        float intermediateValue35;
                        uint intermediateValue53;
#endif
                        float scalarValue5 = 1.0f;
                        float scalarValue6 = 1.0f;
                        uint scalarValue7 = 0u;
                        uint scalarValue8 = 0u;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        uint quotientValue13;
                        bool intermediateValue50;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        uint quotientValue13;
                        bool intermediateValue49;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        uint quotientValue15;
                        bool intermediateValue56;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        uint quotientValue15;
                        bool intermediateValue55;
#endif
                        for (;;)
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            uint sumValue11 = scalarValue8 + 368u;
                            quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue11 / 4u][sumValue11 % 4u])) + scalarValue7), int(8u)));
                            intermediateValue50 = int(scalarValue7) < int(quotientValue13);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            uint sumValue11 = scalarValue8 + 368u;
                            quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue11 / 4u][sumValue11 % 4u])) + scalarValue7), int(8u)));
                            intermediateValue49 = int(scalarValue7) < int(quotientValue13);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            uint sumValue144 = scalarValue8 + 376u;
                            quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue144 / 4u][sumValue144 % 4u])) + scalarValue7), int(8u)));
                            intermediateValue56 = int(scalarValue7) < int(quotientValue15);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            uint sumValue144 = scalarValue8 + 376u;
                            quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue144 / 4u][sumValue144 % 4u])) + scalarValue7), int(8u)));
                            intermediateValue55 = int(scalarValue7) < int(quotientValue15);
#endif
                            uint branchMergedValue;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float branchMergedValue5;
#endif
                            float branchMergedValue6;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            if (intermediateValue50)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            if (intermediateValue49)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            float branchMergedValue7;
                            if (intermediateValue56)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            float branchMergedValue7;
                            if (intermediateValue55)
#endif
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue57;
                                float intermediateValue58;
                                uint intermediateValue59;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue56;
                                float intermediateValue57;
                                uint intermediateValue58;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue73;
                                float intermediateValue74;
                                uint intermediateValue75;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue72;
                                float intermediateValue73;
                                uint intermediateValue74;
#endif
                                float scalarValue9 = scalarValue5;
                                float scalarValue10 = scalarValue6;
                                uint scalarValue11 = scalarValue7;
                                uint bitwiseValue10;
                                float multiplyAddValue35;
                                float multiplyAddValue36;
                                float multiplyAddValue37;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                bool comparisonValue18;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                bool comparisonValue17;
#endif
                                for (;;)
                                {
                                    bitwiseValue10 = scalarValue11 << 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    uint sumValue12 = bitwiseValue10 + 93u;
                                    uint sumValue13 = bitwiseValue10 + 94u;
#endif
                                    uint sumValue14 = bitwiseValue10 + 95u;
                                    uint sumValue15 = bitwiseValue10 + 96u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    multiplyAddValue35 = mad(fragmentConstants[sumValue14].x, comparisonValue2, mad(fragmentConstants[sumValue13].x, comparisonValue1, fragmentConstants[sumValue12].x * comparisonValue)) + fragmentConstants[sumValue15].x;
                                    multiplyAddValue36 = mad(fragmentConstants[sumValue14].y, comparisonValue2, mad(fragmentConstants[sumValue13].y, comparisonValue1, fragmentConstants[sumValue12].y * comparisonValue)) + fragmentConstants[sumValue15].y;
                                    multiplyAddValue37 = mad(fragmentConstants[sumValue14].z, comparisonValue2, mad(fragmentConstants[sumValue13].z, comparisonValue1, fragmentConstants[sumValue12].z * comparisonValue)) + fragmentConstants[sumValue15].z;
                                    comparisonValue18 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
                                    float branchMergedValue1;
                                    float branchMergedValue7;
                                    uint branchMergedValue8;
                                    if (comparisonValue18)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    uint sumValue145 = bitwiseValue10 + 97u;
                                    uint sumValue146 = bitwiseValue10 + 98u;
                                    multiplyAddValue35 = mad(fragmentConstants[sumValue145].x, comparisonValue2, mad(fragmentConstants[sumValue15].x, comparisonValue1, fragmentConstants[sumValue14].x * comparisonValue)) + fragmentConstants[sumValue146].x;
                                    multiplyAddValue36 = mad(fragmentConstants[sumValue145].y, comparisonValue2, mad(fragmentConstants[sumValue15].y, comparisonValue1, fragmentConstants[sumValue14].y * comparisonValue)) + fragmentConstants[sumValue146].y;
                                    multiplyAddValue37 = mad(fragmentConstants[sumValue145].z, comparisonValue2, mad(fragmentConstants[sumValue15].z, comparisonValue1, fragmentConstants[sumValue14].z * comparisonValue)) + fragmentConstants[sumValue146].z;
                                    comparisonValue17 = ((abs(multiplyAddValue35) <= 1.0f) && (abs(multiplyAddValue36) <= 1.0f)) && (abs(multiplyAddValue37) <= 1.0f);
                                    uint branchMergedValue1;
                                    float branchMergedValue8;
                                    float branchMergedValue9;
                                    if (comparisonValue17)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        uint sumValue16 = scalarValue11 + 312u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        uint sumValue147 = scalarValue11 + 316u;
#endif
                                        uint sumValue17 = scalarValue11 + 48u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        float quotientValue9 = min(max(dotProductValue1, fragmentConstants[sumValue16 / 4u][sumValue16 % 4u]), 1.0f);
                                        float nonlinearValue1 = (sqrt(1.0f - (quotientValue9 * quotientValue9)) / quotientValue9) * fragmentConstants[sumValue17].z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        float quotientValue25 = min(max(dotProductValue1, fragmentConstants[sumValue147 / 4u][sumValue147 % 4u]), 1.0f);
                                        float nonlinearValue5 = (sqrt(1.0f - (quotientValue25 * quotientValue25)) / quotientValue25) * fragmentConstants[sumValue17].z;
#endif
                                        float productValue34 = (multiplyAddValue35 * 0.5f) + 0.5f;
                                        float productValue35 = 0.5f - (multiplyAddValue36 * 0.5f);
                                        uint sumValue18 = bitwiseValue10 + 18u;
                                        float nonlinearValue2 = sqrt((((fragmentConstants[sumValue18].x * fragmentConstants[sumValue18].x) + (fragmentConstants[sumValue18].y * fragmentConstants[sumValue18].y)) + (fragmentConstants[sumValue18].z * fragmentConstants[sumValue18].z)) + (fragmentConstants[sumValue18].w * fragmentConstants[sumValue18].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                        uint comparisonValue3 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue17].w + 0.5f))), int(1u)))), int(9u)));
                                        uint quotientValue10 = uint(int(comparisonValue3) / int(2u));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        float intermediateValue116;
                                        float intermediateValue117;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        float intermediateValue115;
                                        float intermediateValue116;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        float intermediateValue141;
                                        float intermediateValue142;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        float intermediateValue140;
                                        float intermediateValue141;
#endif
                                        if (int(comparisonValue3) > int(0u))
                                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            float sumValue85;
                                            float productValue168;
                                            float intermediateValue147;
                                            float intermediateValue148;
                                            uint intermediateValue149;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            float sumValue85;
                                            float productValue168;
                                            float intermediateValue146;
                                            float intermediateValue147;
                                            uint intermediateValue148;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            float sumValue100;
                                            float productValue201;
                                            float intermediateValue180;
                                            float intermediateValue181;
                                            uint intermediateValue182;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            float sumValue100;
                                            float productValue201;
                                            float intermediateValue179;
                                            float intermediateValue180;
                                            uint intermediateValue181;
#endif
                                            float scalarValue12 = 0.0f;
                                            float scalarValue13 = 0.0f;
                                            uint scalarValue14 = 0u;
                                            for (;;)
                                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                intermediateValue147 = scalarValue12;
                                                intermediateValue148 = scalarValue13;
                                                intermediateValue149 = 0u;
                                                float intermediateValue194;
                                                float intermediateValue151;
                                                float intermediateValue152;
                                                float intermediateValue153;
                                                float intermediateValue154;
                                                float productValue176;
                                                float productValue177;
                                                bool comparisonValue43;
                                                float sumValue95;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                intermediateValue146 = scalarValue12;
                                                intermediateValue147 = scalarValue13;
                                                intermediateValue148 = 0u;
                                                float intermediateValue193;
                                                float intermediateValue150;
                                                float intermediateValue151;
                                                float intermediateValue152;
                                                float intermediateValue153;
                                                float productValue176;
                                                float productValue177;
                                                bool comparisonValue43;
                                                float sumValue95;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                intermediateValue180 = scalarValue12;
                                                intermediateValue181 = scalarValue13;
                                                intermediateValue182 = 0u;
                                                float intermediateValue236;
                                                float intermediateValue184;
                                                float intermediateValue185;
                                                float intermediateValue186;
                                                float intermediateValue187;
                                                float productValue215;
                                                float productValue216;
                                                bool comparisonValue46;
                                                float sumValue110;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                intermediateValue179 = scalarValue12;
                                                intermediateValue180 = scalarValue13;
                                                intermediateValue181 = 0u;
                                                float intermediateValue235;
                                                float intermediateValue183;
                                                float intermediateValue184;
                                                float intermediateValue185;
                                                float intermediateValue186;
                                                float productValue215;
                                                float productValue216;
                                                bool comparisonValue46;
                                                float sumValue110;
#endif
                                                for (;;)
                                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    float productValue39 = (productValue34 + ((float(int(intermediateValue149 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    float productValue214 = (productValue34 + ((float(int(intermediateValue148 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    float productValue295 = (productValue34 + ((float(int(intermediateValue182 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    float productValue234 = (productValue34 + ((float(int(intermediateValue181 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue17].x;
#endif
                                                    float productValue52 = (productValue35 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue14 - quotientValue10)) + 0.5f))) * fragmentConstants[sumValue17].x;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    float4 vectorValue = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue39, productValue52, float(int(scalarValue11))));
                                                    intermediateValue151 = vectorValue.x;
                                                    intermediateValue152 = vectorValue.y;
                                                    intermediateValue153 = vectorValue.z;
                                                    intermediateValue154 = vectorValue.w;
                                                    productValue176 = frac((productValue39 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    productValue177 = frac((productValue52 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    float clampedValue6 = clamp((multiplyAddValue37 - intermediateValue151) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue7 = clamp((multiplyAddValue37 - intermediateValue152) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue8 = clamp((multiplyAddValue37 - intermediateValue153) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue9 = clamp((multiplyAddValue37 - intermediateValue154) * nonlinearValue2, 0.0f, 1.0f);
                                                    float productValue53 = 1.0f - ((clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f)));
                                                    float productValue54 = 1.0f - ((clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f)));
                                                    float productValue58 = (((1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)))) - productValue54) * productValue176) + productValue54;
                                                    productValue168 = (productValue58 + intermediateValue148) + ((((((1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)))) - productValue53) * productValue176) + productValue53) - productValue58) * productValue177);
                                                    comparisonValue43 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                    sumValue95 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue1;
                                                    float branchMergedValue4;
                                                    if (comparisonValue43)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    float4 vectorValue3 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue214, productValue52, float(int(scalarValue11))));
                                                    intermediateValue150 = vectorValue3.x;
                                                    intermediateValue151 = vectorValue3.y;
                                                    intermediateValue152 = vectorValue3.z;
                                                    intermediateValue153 = vectorValue3.w;
                                                    productValue176 = frac((productValue214 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    productValue177 = frac((productValue52 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    float clampedValue20 = clamp((multiplyAddValue37 - intermediateValue150) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue6 = clamp((multiplyAddValue37 - intermediateValue151) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue7 = clamp((multiplyAddValue37 - intermediateValue152) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue8 = clamp((multiplyAddValue37 - intermediateValue153) * nonlinearValue2, 0.0f, 1.0f);
                                                    float productValue217 = 1.0f - ((clampedValue20 * clampedValue20) * (3.0f - (clampedValue20 * 2.0f)));
                                                    float productValue218 = 1.0f - ((clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f)));
                                                    float productValue219 = (((1.0f - ((clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f)))) - productValue218) * productValue176) + productValue218;
                                                    productValue168 = (productValue219 + intermediateValue147) + ((((((1.0f - ((clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f)))) - productValue217) * productValue176) + productValue217) - productValue219) * productValue177);
                                                    comparisonValue43 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                    sumValue95 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue1;
                                                    float branchMergedValue4;
                                                    if (comparisonValue43)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    float4 vectorValue7 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue295, productValue52, float(int(scalarValue11))));
                                                    intermediateValue184 = vectorValue7.x;
                                                    intermediateValue185 = vectorValue7.y;
                                                    intermediateValue186 = vectorValue7.z;
                                                    intermediateValue187 = vectorValue7.w;
                                                    productValue215 = frac((productValue295 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    productValue216 = frac((productValue52 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    float clampedValue22 = clamp((multiplyAddValue37 - intermediateValue184) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue24 = clamp((multiplyAddValue37 - intermediateValue185) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue25 = clamp((multiplyAddValue37 - intermediateValue186) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue30 = clamp((multiplyAddValue37 - intermediateValue187) * nonlinearValue2, 0.0f, 1.0f);
                                                    float productValue296 = 1.0f - ((clampedValue22 * clampedValue22) * (3.0f - (clampedValue22 * 2.0f)));
                                                    float productValue297 = 1.0f - ((clampedValue30 * clampedValue30) * (3.0f - (clampedValue30 * 2.0f)));
                                                    float productValue298 = (((1.0f - ((clampedValue25 * clampedValue25) * (3.0f - (clampedValue25 * 2.0f)))) - productValue297) * productValue215) + productValue297;
                                                    productValue201 = (productValue298 + intermediateValue181) + ((((((1.0f - ((clampedValue24 * clampedValue24) * (3.0f - (clampedValue24 * 2.0f)))) - productValue296) * productValue215) + productValue296) - productValue298) * productValue216);
                                                    comparisonValue46 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                    sumValue110 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue5;
                                                    float branchMergedValue5;
                                                    if (comparisonValue46)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    float4 vectorValue4 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue234, productValue52, float(int(scalarValue11))));
                                                    intermediateValue183 = vectorValue4.x;
                                                    intermediateValue184 = vectorValue4.y;
                                                    intermediateValue185 = vectorValue4.z;
                                                    intermediateValue186 = vectorValue4.w;
                                                    productValue215 = frac((productValue234 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    productValue216 = frac((productValue52 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                    float clampedValue21 = clamp((multiplyAddValue37 - intermediateValue183) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue22 = clamp((multiplyAddValue37 - intermediateValue184) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue24 = clamp((multiplyAddValue37 - intermediateValue185) * nonlinearValue2, 0.0f, 1.0f);
                                                    float clampedValue25 = clamp((multiplyAddValue37 - intermediateValue186) * nonlinearValue2, 0.0f, 1.0f);
                                                    float productValue235 = 1.0f - ((clampedValue21 * clampedValue21) * (3.0f - (clampedValue21 * 2.0f)));
                                                    float productValue236 = 1.0f - ((clampedValue25 * clampedValue25) * (3.0f - (clampedValue25 * 2.0f)));
                                                    float productValue237 = (((1.0f - ((clampedValue24 * clampedValue24) * (3.0f - (clampedValue24 * 2.0f)))) - productValue236) * productValue215) + productValue236;
                                                    productValue201 = (productValue237 + intermediateValue180) + ((((((1.0f - ((clampedValue22 * clampedValue22) * (3.0f - (clampedValue22 * 2.0f)))) - productValue235) * productValue215) + productValue235) - productValue237) * productValue216);
                                                    comparisonValue46 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                    sumValue110 = (multiplyAddValue37 - fragmentConstants[sumValue17].y) - nonlinearValue5;
                                                    float branchMergedValue5;
                                                    if (comparisonValue46)
#endif
                                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        branchMergedValue4 = float(intermediateValue154 >= sumValue95);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        branchMergedValue4 = float(intermediateValue153 >= sumValue95);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        branchMergedValue5 = float(intermediateValue187 >= sumValue110);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        branchMergedValue5 = float(intermediateValue186 >= sumValue110);
#endif
                                                    }
                                                    else
                                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        float comparisonValue4 = (intermediateValue151 < sumValue95) ? 0.0f : 1.0f;
                                                        float comparisonValue5 = (intermediateValue154 < sumValue95) ? 0.0f : 1.0f;
                                                        float comparisonValue6 = ((((intermediateValue153 < sumValue95) ? 0.0f : 1.0f) - comparisonValue5) * productValue176) + comparisonValue5;
                                                        branchMergedValue4 = (((((((intermediateValue152 < sumValue95) ? 0.0f : 1.0f) - comparisonValue4) * productValue176) + comparisonValue4) - comparisonValue6) * productValue177) + comparisonValue6;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        float comparisonValue69 = (intermediateValue150 < sumValue95) ? 0.0f : 1.0f;
                                                        float comparisonValue70 = (intermediateValue153 < sumValue95) ? 0.0f : 1.0f;
                                                        float comparisonValue71 = ((((intermediateValue152 < sumValue95) ? 0.0f : 1.0f) - comparisonValue70) * productValue176) + comparisonValue70;
                                                        branchMergedValue4 = (((((((intermediateValue151 < sumValue95) ? 0.0f : 1.0f) - comparisonValue69) * productValue176) + comparisonValue69) - comparisonValue71) * productValue177) + comparisonValue71;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        float comparisonValue106 = (intermediateValue184 < sumValue110) ? 0.0f : 1.0f;
                                                        float comparisonValue107 = (intermediateValue187 < sumValue110) ? 0.0f : 1.0f;
                                                        float comparisonValue108 = ((((intermediateValue186 < sumValue110) ? 0.0f : 1.0f) - comparisonValue107) * productValue215) + comparisonValue107;
                                                        branchMergedValue5 = (((((((intermediateValue185 < sumValue110) ? 0.0f : 1.0f) - comparisonValue106) * productValue215) + comparisonValue106) - comparisonValue108) * productValue216) + comparisonValue108;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        float comparisonValue78 = (intermediateValue183 < sumValue110) ? 0.0f : 1.0f;
                                                        float comparisonValue79 = (intermediateValue186 < sumValue110) ? 0.0f : 1.0f;
                                                        float comparisonValue80 = ((((intermediateValue185 < sumValue110) ? 0.0f : 1.0f) - comparisonValue79) * productValue215) + comparisonValue79;
                                                        branchMergedValue5 = (((((((intermediateValue184 < sumValue110) ? 0.0f : 1.0f) - comparisonValue78) * productValue215) + comparisonValue78) - comparisonValue80) * productValue216) + comparisonValue80;
#endif
                                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    intermediateValue194 = branchMergedValue4;
                                                    sumValue85 = intermediateValue194 + intermediateValue147;
                                                    uint sumValue19 = intermediateValue149 + 1u;
                                                    if (sumValue19 == comparisonValue3)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    intermediateValue193 = branchMergedValue4;
                                                    sumValue85 = intermediateValue193 + intermediateValue146;
                                                    uint sumValue131 = intermediateValue148 + 1u;
                                                    if (sumValue131 == comparisonValue3)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                    intermediateValue236 = branchMergedValue5;
                                                    sumValue100 = intermediateValue236 + intermediateValue180;
                                                    uint sumValue187 = intermediateValue182 + 1u;
                                                    if (sumValue187 == comparisonValue3)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                    intermediateValue235 = branchMergedValue5;
                                                    sumValue100 = intermediateValue235 + intermediateValue179;
                                                    uint sumValue148 = intermediateValue181 + 1u;
                                                    if (sumValue148 == comparisonValue3)
#endif
                                                    {
                                                        break;
                                                    }
                                                    else
                                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        intermediateValue147 = sumValue85;
                                                        intermediateValue148 = productValue168;
                                                        intermediateValue149 = sumValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        intermediateValue146 = sumValue85;
                                                        intermediateValue147 = productValue168;
                                                        intermediateValue148 = sumValue131;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                                        intermediateValue180 = sumValue100;
                                                        intermediateValue181 = productValue201;
                                                        intermediateValue182 = sumValue187;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                                        intermediateValue179 = sumValue100;
                                                        intermediateValue180 = productValue201;
                                                        intermediateValue181 = sumValue148;
#endif
                                                        continue;
                                                    }
                                                }
                                                uint sumValue20 = scalarValue14 + 1u;
                                                if (sumValue20 == comparisonValue3)
                                                {
                                                    break;
                                                }
                                                else
                                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                    scalarValue12 = sumValue85;
                                                    scalarValue13 = productValue168;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                    scalarValue12 = sumValue100;
                                                    scalarValue13 = productValue201;
#endif
                                                    scalarValue14 = sumValue20;
                                                    continue;
                                                }
                                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue116 = sumValue85;
                                            intermediateValue117 = productValue168;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue115 = sumValue85;
                                            intermediateValue116 = productValue168;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue141 = sumValue100;
                                            intermediateValue142 = productValue201;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue140 = sumValue100;
                                            intermediateValue141 = productValue201;
#endif
                                        }
                                        else
                                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue116 = 0.0f;
                                            intermediateValue117 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue115 = 0.0f;
                                            intermediateValue116 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue141 = 0.0f;
                                            intermediateValue142 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue140 = 0.0f;
                                            intermediateValue141 = 0.0f;
#endif
                                        }
                                        float productValue59 = float(int(comparisonValue3 * comparisonValue3));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        branchMergedValue1 = min(scalarValue10, intermediateValue116 / productValue59);
                                        branchMergedValue7 = min(scalarValue9, intermediateValue117 / productValue59);
                                        branchMergedValue8 = quotientValue13;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        branchMergedValue1 = min(scalarValue10, intermediateValue115 / productValue59);
                                        branchMergedValue7 = min(scalarValue9, intermediateValue116 / productValue59);
                                        branchMergedValue8 = quotientValue13;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        branchMergedValue1 = quotientValue15;
                                        branchMergedValue8 = min(scalarValue10, intermediateValue141 / productValue59);
                                        branchMergedValue9 = min(scalarValue9, intermediateValue142 / productValue59);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        branchMergedValue1 = quotientValue15;
                                        branchMergedValue8 = min(scalarValue10, intermediateValue140 / productValue59);
                                        branchMergedValue9 = min(scalarValue9, intermediateValue141 / productValue59);
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        branchMergedValue1 = scalarValue10;
                                        branchMergedValue7 = scalarValue9;
                                        branchMergedValue8 = scalarValue11 + 1u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        branchMergedValue1 = scalarValue11 + 1u;
                                        branchMergedValue8 = scalarValue10;
                                        branchMergedValue9 = scalarValue9;
#endif
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue58 = branchMergedValue1;
                                    intermediateValue57 = branchMergedValue7;
                                    intermediateValue59 = branchMergedValue8;
                                    if (int(intermediateValue59) < int(quotientValue13))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue57 = branchMergedValue1;
                                    intermediateValue56 = branchMergedValue7;
                                    intermediateValue58 = branchMergedValue8;
                                    if (int(intermediateValue58) < int(quotientValue13))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue75 = branchMergedValue1;
                                    intermediateValue74 = branchMergedValue8;
                                    intermediateValue73 = branchMergedValue9;
                                    if (int(intermediateValue75) < int(quotientValue15))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue74 = branchMergedValue1;
                                    intermediateValue73 = branchMergedValue8;
                                    intermediateValue72 = branchMergedValue9;
                                    if (int(intermediateValue74) < int(quotientValue15))
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        scalarValue9 = intermediateValue57;
                                        scalarValue10 = intermediateValue58;
                                        scalarValue11 = intermediateValue59;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        scalarValue9 = intermediateValue56;
                                        scalarValue10 = intermediateValue57;
                                        scalarValue11 = intermediateValue58;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        scalarValue9 = intermediateValue73;
                                        scalarValue10 = intermediateValue74;
                                        scalarValue11 = intermediateValue75;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        scalarValue9 = intermediateValue72;
                                        scalarValue10 = intermediateValue73;
                                        scalarValue11 = intermediateValue74;
#endif
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                branchMergedValue = intermediateValue59;
                                branchMergedValue5 = intermediateValue58;
                                branchMergedValue6 = intermediateValue57;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                branchMergedValue = intermediateValue58;
                                branchMergedValue5 = intermediateValue57;
                                branchMergedValue6 = intermediateValue56;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                branchMergedValue = intermediateValue75;
                                branchMergedValue6 = intermediateValue74;
                                branchMergedValue7 = intermediateValue73;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                branchMergedValue = intermediateValue74;
                                branchMergedValue6 = intermediateValue73;
                                branchMergedValue7 = intermediateValue72;
#endif
                            }
                            else
                            {
                                branchMergedValue = scalarValue7;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                branchMergedValue5 = scalarValue6;
                                branchMergedValue6 = scalarValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                branchMergedValue6 = scalarValue6;
                                branchMergedValue7 = scalarValue5;
#endif
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue48 = branchMergedValue;
                            intermediateValue37 = branchMergedValue5;
                            intermediateValue35 = branchMergedValue6;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue47 = branchMergedValue;
                            intermediateValue36 = branchMergedValue5;
                            intermediateValue34 = branchMergedValue6;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue54 = branchMergedValue;
                            intermediateValue36 = branchMergedValue6;
                            intermediateValue34 = branchMergedValue7;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue53 = branchMergedValue;
                            intermediateValue35 = branchMergedValue6;
                            intermediateValue33 = branchMergedValue7;
#endif
                            uint sumValue21 = scalarValue8 + 1u;
                            if (sumValue21 == clampedValue5)
                            {
                                break;
                            }
                            else
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                scalarValue5 = intermediateValue35;
                                scalarValue6 = intermediateValue37;
                                scalarValue7 = intermediateValue48;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                scalarValue5 = intermediateValue34;
                                scalarValue6 = intermediateValue36;
                                scalarValue7 = intermediateValue47;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                scalarValue5 = intermediateValue34;
                                scalarValue6 = intermediateValue36;
                                scalarValue7 = intermediateValue54;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                scalarValue5 = intermediateValue33;
                                scalarValue6 = intermediateValue35;
                                scalarValue7 = intermediateValue53;
#endif
                                scalarValue8 = sumValue21;
                                continue;
                            }
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue25 = intermediateValue35;
                        intermediateValue36 = intermediateValue37;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue24 = intermediateValue34;
                        intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue23 = intermediateValue34;
                        intermediateValue35 = intermediateValue36;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue22 = intermediateValue33;
                        intermediateValue34 = intermediateValue35;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue25 = 1.0f;
                        intermediateValue36 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue24 = 1.0f;
                        intermediateValue35 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue23 = 1.0f;
                        intermediateValue35 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue22 = 1.0f;
                        intermediateValue34 = 1.0f;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue52;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue51;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue58;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue57;
#endif
                    if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                    {
                        float scalarValue15 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                        float multiplyAddValue21 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue))) - ((sqrt(1.0f - (scalarValue15 * scalarValue15)) / scalarValue15) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                        float multiplyAddValue22 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                        float multiplyAddValue23 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue1, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                        uint comparisonValue7 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                        uint bitwiseValue = comparisonValue7 >> 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float branchMergedValue11;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float branchMergedValue17;
#endif
                        if ((multiplyAddValue23 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue22 >= 0.0f) && (multiplyAddValue22 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue23 >= 0.0f)))
                        {
                            float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            float sumValue63;
                            float intermediateValue99;
                            uint intermediateValue100;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            float sumValue63;
                            float intermediateValue98;
                            uint intermediateValue99;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            float sumValue43;
                            float intermediateValue128;
                            uint intermediateValue129;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            float sumValue43;
                            float intermediateValue127;
                            uint intermediateValue128;
#endif
                            float scalarValue16 = 0.0f;
                            uint scalarValue17 = 0u;
                            for (;;)
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue99 = scalarValue16;
                                intermediateValue100 = 0u;
                                float intermediateValue139;
                                float productValue164;
                                float productValue165;
                                bool comparisonValue29;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue98 = scalarValue16;
                                intermediateValue99 = 0u;
                                float intermediateValue138;
                                float productValue164;
                                float productValue165;
                                bool comparisonValue29;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue128 = scalarValue16;
                                intermediateValue129 = 0u;
                                float intermediateValue157;
                                float productValue197;
                                float productValue198;
                                bool comparisonValue26;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue127 = scalarValue16;
                                intermediateValue128 = 0u;
                                float intermediateValue156;
                                float productValue197;
                                float productValue198;
                                bool comparisonValue26;
#endif
                                for (;;)
                                {
                                    float productValue61 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    productValue164 = (productValue61 * (float(int(intermediateValue100 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                    productValue165 = (productValue61 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                    comparisonValue29 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    productValue164 = (productValue61 * (float(int(intermediateValue99 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                    productValue165 = (productValue61 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                    comparisonValue29 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    productValue197 = (productValue61 * (float(int(intermediateValue129 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                    productValue198 = (productValue61 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                    comparisonValue26 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    productValue197 = (productValue61 * (float(int(intermediateValue128 - bitwiseValue)) + 0.5f)) + multiplyAddValue22;
                                    productValue198 = (productValue61 * (float(int(scalarValue17 - bitwiseValue)) + 0.5f)) + multiplyAddValue23;
                                    comparisonValue26 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#endif
                                    float branchMergedValue2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if (comparisonValue29)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if (comparisonValue26)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue164, productValue165, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue197, productValue198, dotProductValue2), 0.0f).x >= multiplyAddValue21);
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue164, productValue165, dotProductValue2));
                                        float productValue62 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue164) + 0.5f);
                                        float comparisonValue8 = (vectorValue1.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                        float comparisonValue9 = (vectorValue1.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                        float comparisonValue10 = ((((vectorValue1.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue9) * productValue62) + comparisonValue9;
                                        branchMergedValue2 = (((((((vectorValue1.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue8) * productValue62) + comparisonValue8) - comparisonValue10) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue165) + 0.5f)) + comparisonValue10;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue197, productValue198, dotProductValue2));
                                        float productValue238 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue197) + 0.5f);
                                        float comparisonValue81 = (vectorValue5.x < multiplyAddValue21) ? 0.0f : 1.0f;
                                        float comparisonValue82 = (vectorValue5.w < multiplyAddValue21) ? 0.0f : 1.0f;
                                        float comparisonValue83 = ((((vectorValue5.z < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue82) * productValue238) + comparisonValue82;
                                        branchMergedValue2 = (((((((vectorValue5.y < multiplyAddValue21) ? 0.0f : 1.0f) - comparisonValue81) * productValue238) + comparisonValue81) - comparisonValue83) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue198) + 0.5f)) + comparisonValue83;
#endif
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue139 = branchMergedValue2;
                                    sumValue63 = intermediateValue139 + intermediateValue99;
                                    uint sumValue22 = intermediateValue100 + 1u;
                                    if (int(sumValue22) < int(comparisonValue7))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue138 = branchMergedValue2;
                                    sumValue63 = intermediateValue138 + intermediateValue98;
                                    uint sumValue132 = intermediateValue99 + 1u;
                                    if (int(sumValue132) < int(comparisonValue7))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue157 = branchMergedValue2;
                                    sumValue43 = intermediateValue157 + intermediateValue128;
                                    uint sumValue188 = intermediateValue129 + 1u;
                                    if (int(sumValue188) < int(comparisonValue7))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue156 = branchMergedValue2;
                                    sumValue43 = intermediateValue156 + intermediateValue127;
                                    uint sumValue149 = intermediateValue128 + 1u;
                                    if (int(sumValue149) < int(comparisonValue7))
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue99 = sumValue63;
                                        intermediateValue100 = sumValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue98 = sumValue63;
                                        intermediateValue99 = sumValue132;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue128 = sumValue43;
                                        intermediateValue129 = sumValue188;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue127 = sumValue43;
                                        intermediateValue128 = sumValue149;
#endif
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                uint sumValue23 = scalarValue17 + 1u;
                                if (int(sumValue23) < int(comparisonValue7))
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    scalarValue16 = sumValue63;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    scalarValue16 = sumValue43;
#endif
                                    scalarValue17 = sumValue23;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            branchMergedValue11 = sumValue63 / float(int(comparisonValue7 * comparisonValue7));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue17 = sumValue43 / float(int(comparisonValue7 * comparisonValue7));
#endif
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            branchMergedValue11 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue17 = 1.0f;
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue52 = branchMergedValue11;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue51 = branchMergedValue11;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue58 = branchMergedValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue57 = branchMergedValue17;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue52 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue51 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue58 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue57 = 1.0f;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue61;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue60;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float intermediateValue77;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float intermediateValue76;
#endif
                    if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                    {
                        float multiplyAddValue24 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                        float scalarValue18 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                        float multiplyAddValue25 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue24) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue18 * scalarValue18)) / scalarValue18) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                        float multiplyAddValue26 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue24) * 0.5f) + 0.5f;
                        float multiplyAddValue27 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue2, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue1, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue24) * 0.5f);
                        uint comparisonValue11 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                        uint quotientValue11 = uint(int(comparisonValue11) / int(2u));
                        float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue92;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue91;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue105;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue104;
#endif
                        if (int(comparisonValue11) > int(0u))
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            float sumValue65;
                            float intermediateValue119;
                            uint intermediateValue120;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            float sumValue65;
                            float intermediateValue118;
                            uint intermediateValue119;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            float sumValue45;
                            float intermediateValue144;
                            uint intermediateValue145;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            float sumValue45;
                            float intermediateValue143;
                            uint intermediateValue144;
#endif
                            float scalarValue19 = 0.0f;
                            uint scalarValue20 = 0u;
                            for (;;)
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue119 = scalarValue19;
                                intermediateValue120 = 0u;
                                float intermediateValue155;
                                float4 intermediateValue121;
                                float productValue171;
                                float productValue172;
                                bool comparisonValue33;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue118 = scalarValue19;
                                intermediateValue119 = 0u;
                                float intermediateValue154;
                                float4 intermediateValue120;
                                float productValue171;
                                float productValue172;
                                bool comparisonValue33;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue144 = scalarValue19;
                                intermediateValue145 = 0u;
                                float intermediateValue188;
                                float4 intermediateValue146;
                                float productValue204;
                                float productValue205;
                                bool comparisonValue36;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue143 = scalarValue19;
                                intermediateValue144 = 0u;
                                float intermediateValue187;
                                float4 intermediateValue145;
                                float productValue204;
                                float productValue205;
                                bool comparisonValue36;
#endif
                                for (;;)
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue121 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                    productValue171 = (multiplyAddValue26 + ((float(int(intermediateValue120 - quotientValue11)) + 0.5f) * intermediateValue121.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    productValue172 = (multiplyAddValue27 + (intermediateValue121.x * (float(int(scalarValue20 - quotientValue11)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    comparisonValue33 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                    float branchMergedValue3;
                                    if (comparisonValue33)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue120 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                    productValue171 = (multiplyAddValue26 + ((float(int(intermediateValue119 - quotientValue11)) + 0.5f) * intermediateValue120.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    productValue172 = (multiplyAddValue27 + (intermediateValue120.x * (float(int(scalarValue20 - quotientValue11)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    comparisonValue33 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                    float branchMergedValue3;
                                    if (comparisonValue33)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue146 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                    productValue204 = (multiplyAddValue26 + ((float(int(intermediateValue145 - quotientValue11)) + 0.5f) * intermediateValue146.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    productValue205 = (multiplyAddValue27 + (intermediateValue146.x * (float(int(scalarValue20 - quotientValue11)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    comparisonValue36 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                    float branchMergedValue4;
                                    if (comparisonValue36)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue145 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                    productValue204 = (multiplyAddValue26 + ((float(int(intermediateValue144 - quotientValue11)) + 0.5f) * intermediateValue145.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    productValue205 = (multiplyAddValue27 + (intermediateValue145.x * (float(int(scalarValue20 - quotientValue11)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                    comparisonValue36 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                    float branchMergedValue4;
                                    if (comparisonValue36)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue171, productValue172, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue204, productValue205, dotProductValue3), 0.0f).x >= multiplyAddValue25);
#endif
                                    }
                                    else
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue171, productValue172, dotProductValue3));
                                        float productValue63 = frac((productValue171 * intermediateValue121.z) + 0.5f);
                                        float comparisonValue12 = (vectorValue2.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue13 = (vectorValue2.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue14 = ((((vectorValue2.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue13) * productValue63) + comparisonValue13;
                                        branchMergedValue3 = (((((((vectorValue2.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue12) * productValue63) + comparisonValue12) - comparisonValue14) * frac((productValue172 * intermediateValue121.z) + 0.5f)) + comparisonValue14;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        float4 vectorValue2 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue171, productValue172, dotProductValue3));
                                        float productValue220 = frac((productValue171 * intermediateValue120.z) + 0.5f);
                                        float comparisonValue12 = (vectorValue2.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue13 = (vectorValue2.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue72 = ((((vectorValue2.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue13) * productValue220) + comparisonValue13;
                                        branchMergedValue3 = (((((((vectorValue2.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue12) * productValue220) + comparisonValue12) - comparisonValue72) * frac((productValue172 * intermediateValue120.z) + 0.5f)) + comparisonValue72;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue204, productValue205, dotProductValue3));
                                        float productValue299 = frac((productValue204 * intermediateValue146.z) + 0.5f);
                                        float comparisonValue84 = (vectorValue6.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue85 = (vectorValue6.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue109 = ((((vectorValue6.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue85) * productValue299) + comparisonValue85;
                                        branchMergedValue4 = (((((((vectorValue6.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue84) * productValue299) + comparisonValue84) - comparisonValue109) * frac((productValue205 * intermediateValue146.z) + 0.5f)) + comparisonValue109;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue204, productValue205, dotProductValue3));
                                        float productValue239 = frac((productValue204 * intermediateValue145.z) + 0.5f);
                                        float comparisonValue84 = (vectorValue6.x < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue85 = (vectorValue6.w < multiplyAddValue25) ? 0.0f : 1.0f;
                                        float comparisonValue86 = ((((vectorValue6.z < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue85) * productValue239) + comparisonValue85;
                                        branchMergedValue4 = (((((((vectorValue6.y < multiplyAddValue25) ? 0.0f : 1.0f) - comparisonValue84) * productValue239) + comparisonValue84) - comparisonValue86) * frac((productValue205 * intermediateValue145.z) + 0.5f)) + comparisonValue86;
#endif
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue155 = branchMergedValue3;
                                    sumValue65 = intermediateValue155 + intermediateValue119;
                                    uint sumValue24 = intermediateValue120 + 1u;
                                    if (sumValue24 == comparisonValue11)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue154 = branchMergedValue3;
                                    sumValue65 = intermediateValue154 + intermediateValue118;
                                    uint sumValue133 = intermediateValue119 + 1u;
                                    if (sumValue133 == comparisonValue11)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue188 = branchMergedValue4;
                                    sumValue45 = intermediateValue188 + intermediateValue144;
                                    uint sumValue189 = intermediateValue145 + 1u;
                                    if (sumValue189 == comparisonValue11)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue187 = branchMergedValue4;
                                    sumValue45 = intermediateValue187 + intermediateValue143;
                                    uint sumValue150 = intermediateValue144 + 1u;
                                    if (sumValue150 == comparisonValue11)
#endif
                                    {
                                        break;
                                    }
                                    else
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue119 = sumValue65;
                                        intermediateValue120 = sumValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue118 = sumValue65;
                                        intermediateValue119 = sumValue133;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue144 = sumValue45;
                                        intermediateValue145 = sumValue189;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue143 = sumValue45;
                                        intermediateValue144 = sumValue150;
#endif
                                        continue;
                                    }
                                }
                                uint sumValue25 = scalarValue20 + 1u;
                                if (sumValue25 == comparisonValue11)
                                {
                                    break;
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    scalarValue19 = sumValue65;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    scalarValue19 = sumValue45;
#endif
                                    scalarValue20 = sumValue25;
                                    continue;
                                }
                            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue92 = sumValue65;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue91 = sumValue65;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue105 = sumValue45;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue104 = sumValue45;
#endif
                        }
                        else
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue92 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue91 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue105 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue104 = 0.0f;
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float quotientValue12 = intermediateValue92 / float(int(comparisonValue11 * comparisonValue11));
                        float branchMergedValue12;
                        if (quotientValue12 < 1.0f)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float quotientValue24 = intermediateValue91 / float(int(comparisonValue11 * comparisonValue11));
                        float branchMergedValue12;
                        if (quotientValue24 < 1.0f)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float quotientValue35 = intermediateValue105 / float(int(comparisonValue11 * comparisonValue11));
                        float branchMergedValue18;
                        if (quotientValue35 < 1.0f)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float quotientValue26 = intermediateValue104 / float(int(comparisonValue11 * comparisonValue11));
                        float branchMergedValue18;
                        if (quotientValue26 < 1.0f)
#endif
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            branchMergedValue12 = min(1.0f, max(quotientValue12, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            branchMergedValue12 = min(1.0f, max(quotientValue24, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            branchMergedValue18 = min(1.0f, max(quotientValue35, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            branchMergedValue18 = min(1.0f, max(quotientValue26, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            branchMergedValue12 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue18 = 1.0f;
#endif
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue61 = branchMergedValue12;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue60 = branchMergedValue12;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue77 = branchMergedValue18;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue76 = branchMergedValue18;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue61 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue60 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue77 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue76 = 1.0f;
#endif
                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float scalarValue21 = min(intermediateValue36, min(intermediateValue52, intermediateValue61));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float scalarValue70 = min(intermediateValue35, min(intermediateValue51, intermediateValue60));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    float scalarValue124 = min(intermediateValue35, min(intermediateValue58, intermediateValue77));
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    float scalarValue82 = min(intermediateValue34, min(intermediateValue57, intermediateValue76));
#endif
                    float productValue64 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                    float clampedValue10 = clamp((sumValue3 - productValue64) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue64), 0.0f, 1.0f);
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    productValue69 = (((clampedValue10 * clampedValue10) * (1.0f - scalarValue21)) * (3.0f - (clampedValue10 * 2.0f))) + scalarValue21;
                    intermediateValue24 = intermediateValue25;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    productValue69 = (((clampedValue10 * clampedValue10) * (1.0f - scalarValue70)) * (3.0f - (clampedValue10 * 2.0f))) + scalarValue70;
                    intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    productValue60 = (((clampedValue10 * clampedValue10) * (1.0f - scalarValue124)) * (3.0f - (clampedValue10 * 2.0f))) + scalarValue124;
                    intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    productValue60 = (((clampedValue10 * clampedValue10) * (1.0f - scalarValue82)) * (3.0f - (clampedValue10 * 2.0f))) + scalarValue82;
                    intermediateValue21 = intermediateValue22;
#endif
                }
                else
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    productValue69 = 1.0f;
                    intermediateValue24 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    productValue69 = 1.0f;
                    intermediateValue23 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    productValue60 = 1.0f;
                    intermediateValue22 = 1.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    productValue60 = 1.0f;
                    intermediateValue21 = 1.0f;
#endif
                }
                float multiplyAddValue28 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue29 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), float3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
                float productValue65 = inverseLengthValue7 * multiplyAddValue28;
                float productValue66 = inverseLengthValue7 * multiplyAddValue29;
                float productValue67 = inverseLengthValue7 * multiplyAddValue30;
#if RD_FEATURE_USE_TEXTURES == RD_ON
                float productValue68 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue2);
                float productValue70 = productValue68 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
                float productValue71 = productValue68 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
                float productValue72 = productValue68 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
                float productValue221 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue1);
                float productValue222 = productValue221 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
                float productValue223 = productValue221 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
                float productValue224 = productValue221 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
#endif
                float dotProductValue4 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue65, productValue66, productValue67));
                float scalarValue22 = max(dotProductValue4, 0.0f);
                float dotProductValue5 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
                float sumValue26 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                float productValue73 = sumValue26 * sumValue26;
                float sumValue27 = productValue65 - quotientValue6;
                float sumValue28 = productValue66 - quotientValue7;
                float sumValue29 = productValue67 - quotientValue8;
                float inverseLengthValue8 = rsqrt(dot(float3(sumValue27, sumValue28, sumValue29), float3(sumValue27, sumValue28, sumValue29)));
                float productValue74 = inverseLengthValue8 * sumValue27;
                float productValue75 = inverseLengthValue8 * sumValue28;
                float productValue76 = inverseLengthValue8 * sumValue29;
                float scalarValue23 = max(RD_UNIFORM_MERS_UNIFORMS.z, 0.0500000007450580596923828125f);
                float productValue77 = scalarValue23 * scalarValue23;
                float productValue78 = productValue77 * productValue77;
                float dotProductValue6 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue74, productValue75, productValue76)), 0.0f);
                float productValue79 = ((dotProductValue6 * dotProductValue6) * (productValue78 + (-1.0f))) + 1.0f;
                float productValue80 = productValue77 * 0.5f;
                float sumValue30 = 1.0f - productValue80;
                float sumValue31 = productValue80 + 9.9999997473787516355514526367188e-05f;
                float clampedValue11 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue74, productValue75, productValue76)), 0.0f), 0.0f, 1.0f);
                float productValue81 = clampedValue11 * clampedValue11;
                float productValue82 = (productValue81 * productValue81) * clampedValue11;
                float productValue83 = (productValue82 * (1.0f - productValue26)) + productValue26;
                float productValue84 = (productValue82 * (1.0f - productValue27)) + productValue27;
                float productValue85 = (productValue82 * (1.0f - productValue28)) + productValue28;
                float quotientValue14 = ((dotProductValue5 / ((sumValue30 * dotProductValue5) + sumValue31)) * (productValue78 / ((productValue79 * productValue79) * 3.1415927410125732421875f))) * (scalarValue22 / ((sumValue30 * scalarValue22) + sumValue31));
                float productValue86 = ((scalarValue22 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                float quotientValue16 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f) - scalarValue22) * productValue33) + scalarValue22) * productValue69;
                float dotProductValue7 = (intermediateValue24 * productValue33) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue65, productValue66, productValue67)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float quotientValue16 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f) - scalarValue22) * productValue33) + scalarValue22) * productValue69;
                float dotProductValue17 = (intermediateValue23 * productValue33) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue65, productValue66, productValue67)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                float quotientValue27 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f) - scalarValue22) * productValue33) + scalarValue22) * productValue60;
                float dotProductValue25 = (intermediateValue22 * productValue33) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue65, productValue66, productValue67)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float quotientValue27 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f) - scalarValue22) * productValue33) + scalarValue22) * productValue60;
                float dotProductValue19 = (intermediateValue21 * productValue33) * max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue65, productValue66, productValue67)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue73, 0.0f);
#endif
                float productValue87 = sumValue6 * 0.3183098733425140380859375f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                float productValue88 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue69);
                intermediateValue10 = (productValue88 * productValue70) * ((productValue83 * quotientValue14) / productValue86);
                intermediateValue12 = (productValue88 * productValue71) * ((productValue84 * quotientValue14) / productValue86);
                intermediateValue14 = (productValue88 * productValue72) * ((productValue85 * quotientValue14) / productValue86);
                intermediateValue16 = (((productValue87 * exponentialValue) * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue83) * quotientValue16) + dotProductValue7);
                intermediateValue18 = (((productValue87 * exponentialValue1) * productValue71) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue84) * quotientValue16) + dotProductValue7);
                intermediateValue20 = (((productValue87 * exponentialValue2) * productValue72) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue85) * quotientValue16) + dotProductValue7);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float productValue88 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue69);
                intermediateValue9 = (productValue88 * productValue222) * ((productValue83 * quotientValue14) / productValue86);
                intermediateValue11 = (productValue88 * productValue223) * ((productValue84 * quotientValue14) / productValue86);
                intermediateValue13 = (productValue88 * productValue224) * ((productValue85 * quotientValue14) / productValue86);
                intermediateValue15 = (((productValue87 * exponentialValue) * productValue222) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue83) * quotientValue16) + dotProductValue17);
                intermediateValue17 = (((productValue87 * exponentialValue1) * productValue223) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue84) * quotientValue16) + dotProductValue17);
                intermediateValue19 = (((productValue87 * exponentialValue2) * productValue224) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue85) * quotientValue16) + dotProductValue17);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                float productValue240 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue60);
                intermediateValue15 = (productValue240 * productValue70) * ((productValue83 * quotientValue14) / productValue86);
                intermediateValue16 = (productValue240 * productValue71) * ((productValue84 * quotientValue14) / productValue86);
                intermediateValue17 = (productValue240 * productValue72) * ((productValue85 * quotientValue14) / productValue86);
                intermediateValue18 = (((productValue87 * exponentialValue) * productValue70) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue83) * quotientValue27) + dotProductValue25);
                intermediateValue19 = (((productValue87 * exponentialValue1) * productValue71) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue84) * quotientValue27) + dotProductValue25);
                intermediateValue20 = (((productValue87 * exponentialValue2) * productValue72) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue85) * quotientValue27) + dotProductValue25);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float productValue240 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue22 * productValue60);
                intermediateValue14 = (productValue240 * productValue222) * ((productValue83 * quotientValue14) / productValue86);
                intermediateValue15 = (productValue240 * productValue223) * ((productValue84 * quotientValue14) / productValue86);
                intermediateValue16 = (productValue240 * productValue224) * ((productValue85 * quotientValue14) / productValue86);
                intermediateValue17 = (((productValue87 * exponentialValue) * productValue222) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue83) * quotientValue27) + dotProductValue19);
                intermediateValue18 = (((productValue87 * exponentialValue1) * productValue223) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue84) * quotientValue27) + dotProductValue19);
                intermediateValue19 = (((productValue87 * exponentialValue2) * productValue224) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue85) * quotientValue27) + dotProductValue19);
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float intermediateValue21;
            float intermediateValue22;
            float intermediateValue23;
            if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float intermediateValue20;
            float intermediateValue21;
            float intermediateValue22;
            if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float productValue46;
            float productValue47;
            float productValue48;
            float productValue49;
            float productValue50;
            float productValue51;
            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
            {
                bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
                float comparisonValue87 = conditionValue2 ? productValue22 : varyingTexCoord3.x;
                float comparisonValue88 = conditionValue2 ? productValue23 : varyingTexCoord3.y;
                float comparisonValue89 = conditionValue2 ? productValue24 : varyingTexCoord3.z;
                float productValue241 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
                float productValue242 = productValue241 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
                float intermediateValue30;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
                {
                    intermediateValue30 = 0.0f;
                }
                else
                {
                    float branchMergedValue15;
                    if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                    {
                        branchMergedValue15 = 1.0f;
                    }
                    else
                    {
                        branchMergedValue15 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                    }
                    intermediateValue30 = branchMergedValue15;
                }
                float quotientValue28 = min(floor(min(max((productValue242 + multiplyAddValue4) / (productValue242 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
                float quotientValue29 = min(floor(min(max((productValue241 + multiplyAddValue5) / (productValue241 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
                uint intermediateValue43;
                bool intermediateValue45;
                uint intermediateValue46;
                if ((intermediateValue30 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue29 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue30 < 0.0f) || ((quotientValue28 < 0.0f) || (quotientValue29 < 0.0f))))))
                {
                    intermediateValue43 = intermediateValue44;
                    intermediateValue45 = false;
                    intermediateValue46 = 0u;
                }
                else
                {
                    uint scalarValue83 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                    uint productValue300 = uint(int(((quotientValue29 + (intermediateValue30 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue28)) * scalarValue83;
                    intermediateValue43 = productValue300;
                    intermediateValue45 = true;
                    intermediateValue46 = productValue300 + scalarValue83;
                }
                float intermediateValue60;
                float intermediateValue62;
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float intermediateValue70;
                if (intermediateValue45 && (int(intermediateValue43) < int(intermediateValue46)))
                {
                    float intermediateValue113;
                    float quotientValue19;
                    float dotProductValue15;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    float quotientValue21;
                    float quotientValue22;
                    float quotientValue23;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue162;
                    float intermediateValue164;
                    float intermediateValue61;
                    float intermediateValue63;
                    float intermediateValue65;
                    float intermediateValue67;
                    float intermediateValue69;
                    float intermediateValue71;
                    float scalarValue85 = 0.0f;
                    float scalarValue86 = 0.0f;
                    float scalarValue87 = 0.0f;
                    float scalarValue88 = 0.0f;
                    float scalarValue89 = 0.0f;
                    float scalarValue90 = 0.0f;
                    uint scalarValue125 = intermediateValue43;
                    uint loadedBufferValue3;
                    for (;;)
                    {
                        loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue125).x)));
                        if (int(loadedBufferValue3) < int(0u))
                        {
                            intermediateValue61 = scalarValue85;
                            intermediateValue63 = scalarValue86;
                            intermediateValue65 = scalarValue87;
                            intermediateValue67 = scalarValue88;
                            intermediateValue69 = scalarValue89;
                            intermediateValue71 = scalarValue90;
                            break;
                        }
                        else
                        {
                            uint productValue244 = loadedBufferValue3 * 32u;
                            float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue244).x, rdLoad_zLights(productValue244 + 1u).x, rdLoad_zLights(productValue244 + 2u).x, rdLoad_zLights(productValue244 + 3u).x));
                            float scalarValue91 = loadedBufferValue40.x;
                            float scalarValue92 = loadedBufferValue40.y;
                            float scalarValue93 = loadedBufferValue40.z;
                            float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                            float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                            float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                            float inverseLengthValue14 = rsqrt(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
                            float productValue245 = inverseLengthValue14 * multiplyAddValue42;
                            float productValue246 = inverseLengthValue14 * multiplyAddValue43;
                            float productValue247 = inverseLengthValue14 * multiplyAddValue44;
                            float dotProductValue20 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue245, productValue246, productValue247));
                            intermediateValue113 = max(dotProductValue20, 0.0f);
                            float dotProductValue21 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
                            float sumValue151 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                            float productValue248 = sumValue151 * sumValue151;
                            quotientValue19 = ((max((dotProductValue20 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue248, 0.0f) - intermediateValue113) * productValue33) + intermediateValue113;
                            dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue245, productValue246, productValue247)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue248, 0.0f) * productValue33;
                            float sumValue152 = productValue245 - quotientValue6;
                            float sumValue153 = productValue246 - quotientValue7;
                            float sumValue154 = productValue247 - quotientValue8;
                            float inverseLengthValue15 = rsqrt(dot(float3(sumValue152, sumValue153, sumValue154), float3(sumValue152, sumValue153, sumValue154)));
                            float productValue249 = inverseLengthValue15 * sumValue152;
                            float productValue250 = inverseLengthValue15 * sumValue153;
                            float productValue251 = inverseLengthValue15 * sumValue154;
                            float scalarValue94 = max(RD_UNIFORM_MERS_UNIFORMS.z, 0.0500000007450580596923828125f);
                            float productValue252 = scalarValue94 * scalarValue94;
                            float productValue253 = productValue252 * productValue252;
                            float dotProductValue22 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue249, productValue250, productValue251)), 0.0f);
                            float productValue254 = ((dotProductValue22 * dotProductValue22) * (productValue253 + (-1.0f))) + 1.0f;
                            float productValue255 = productValue252 * 0.5f;
                            float sumValue155 = 1.0f - productValue255;
                            float sumValue156 = productValue255 + 9.9999997473787516355514526367188e-05f;
                            float clampedValue26 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue249, productValue250, productValue251)), 0.0f), 0.0f, 1.0f);
                            float productValue256 = clampedValue26 * clampedValue26;
                            float productValue257 = (productValue256 * productValue256) * clampedValue26;
                            float productValue258 = (productValue257 * (1.0f - productValue26)) + productValue26;
                            float productValue259 = (productValue257 * (1.0f - productValue27)) + productValue27;
                            float productValue260 = (productValue257 * (1.0f - productValue28)) + productValue28;
                            sumValue52 = 1.0f - productValue258;
                            sumValue53 = 1.0f - productValue259;
                            sumValue54 = 1.0f - productValue260;
                            float quotientValue36 = ((dotProductValue21 / ((sumValue155 * dotProductValue21) + sumValue156)) * (productValue253 / ((productValue254 * productValue254) * 3.1415927410125732421875f))) * (intermediateValue113 / ((sumValue155 * intermediateValue113) + sumValue156));
                            float productValue301 = ((intermediateValue113 * 4.0f) * dotProductValue21) + 9.9999997473787516355514526367188e-05f;
                            quotientValue21 = (productValue258 * quotientValue36) / productValue301;
                            quotientValue22 = (productValue259 * quotientValue36) / productValue301;
                            quotientValue23 = (productValue260 * quotientValue36) / productValue301;
                            float sumValue157 = scalarValue91 - varyingTexCoord3.x;
                            float sumValue158 = scalarValue92 - varyingTexCoord3.y;
                            float sumValue159 = scalarValue93 - varyingTexCoord3.z;
                            float productValue206;
                            if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                            {
                                float sumValue160 = (abs(sumValue158) + abs(sumValue157)) + abs(sumValue159);
                                productValue206 = sumValue160 * sumValue160;
                            }
                            else
                            {
                                productValue206 = dot(float3(sumValue157, sumValue158, sumValue159), float3(sumValue157, sumValue158, sumValue159));
                            }
                            float scalarValue95 = loadedBufferValue40.w;
                            float productValue262 = scalarValue95 * scalarValue95;
                            float branchMergedValue3;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            float branchMergedValue12;
                            float branchMergedValue13;
                            if (!(productValue206 >= productValue262))
                            {
                                float intermediateValue163;
                                float intermediateValue165;
                                if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                                {
                                    uint productValue263 = (loadedBufferValue3 * 32u) + 8u;
                                    float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue263).x, rdLoad_zLights(productValue263 + 1u).x, rdLoad_zLights(productValue263 + 2u).x, rdLoad_zLights(productValue263 + 3u).x));
                                    uint productValue264 = (loadedBufferValue3 * 32u) + 12u;
                                    float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue264).x, rdLoad_zLights(productValue264 + 1u).x, rdLoad_zLights(productValue264 + 2u).x, rdLoad_zLights(productValue264 + 3u).x));
                                    uint productValue265 = (loadedBufferValue3 * 32u) + 16u;
                                    float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue265).x, rdLoad_zLights(productValue265 + 1u).x, rdLoad_zLights(productValue265 + 2u).x, rdLoad_zLights(productValue265 + 3u).x));
                                    uint productValue266 = (loadedBufferValue3 * 32u) + 20u;
                                    float4 loadedBufferValue44 = asfloat(uint4(rdLoad_zLights(productValue266).x, rdLoad_zLights(productValue266 + 1u).x, rdLoad_zLights(productValue266 + 2u).x, rdLoad_zLights(productValue266 + 3u).x));
                                    uint productValue267 = (loadedBufferValue3 * 32u) + 24u;
                                    float4 loadedBufferValue45 = asfloat(uint4(rdLoad_zLights(productValue267).x, rdLoad_zLights(productValue267 + 1u).x, rdLoad_zLights(productValue267 + 2u).x, rdLoad_zLights(productValue267 + 3u).x));
                                    uint productValue268 = (loadedBufferValue3 * 32u) + 28u;
                                    float4 loadedBufferValue46 = asfloat(uint4(rdLoad_zLights(productValue268).x, rdLoad_zLights(productValue268 + 1u).x, rdLoad_zLights(productValue268 + 2u).x, rdLoad_zLights(productValue268 + 3u).x));
                                    float sumValue161 = comparisonValue87 - scalarValue91;
                                    float sumValue162 = comparisonValue88 - scalarValue92;
                                    float sumValue163 = comparisonValue89 - scalarValue93;
                                    float scalarValue96 = abs(sumValue161);
                                    float scalarValue97 = abs(sumValue162);
                                    float scalarValue98 = abs(sumValue163);
                                    uint comparisonValue56;
                                    if ((scalarValue96 >= scalarValue97) && (scalarValue96 >= scalarValue98))
                                    {
                                        comparisonValue56 = uint(!(sumValue161 >= 0.0f));
                                    }
                                    else
                                    {
                                        uint branchMergedValue24;
                                        if (!(scalarValue97 >= scalarValue98))
                                        {
                                            branchMergedValue24 = (sumValue163 >= 0.0f) ? 4u : 5u;
                                        }
                                        else
                                        {
                                            branchMergedValue24 = (sumValue162 >= 0.0f) ? 2u : 3u;
                                        }
                                        comparisonValue56 = branchMergedValue24;
                                    }
                                    float sumValue164 = (-0.0f) - sumValue161;
                                    float intermediateValue239;
                                    float intermediateValue240;
                                    float intermediateValue241;
                                    float intermediateValue242;
                                    float sumValue127;
                                    float intermediateValue243;
                                    float intermediateValue244;
                                    if (comparisonValue56 == 1u)
                                    {
                                        intermediateValue239 = loadedBufferValue42.x;
                                        intermediateValue240 = loadedBufferValue42.y;
                                        intermediateValue241 = loadedBufferValue42.z;
                                        intermediateValue242 = loadedBufferValue42.w;
                                        sumValue127 = (-0.0f) - sumValue163;
                                        intermediateValue243 = sumValue162;
                                        intermediateValue244 = sumValue161;
                                    }
                                    else
                                    {
                                        float branchMergedValue25;
                                        float branchMergedValue54;
                                        float branchMergedValue55;
                                        float branchMergedValue56;
                                        float branchMergedValue57;
                                        float branchMergedValue58;
                                        float branchMergedValue59;
                                        if (comparisonValue56 == 2u)
                                        {
                                            branchMergedValue25 = (-0.0f) - sumValue162;
                                            branchMergedValue54 = (-0.0f) - sumValue163;
                                            branchMergedValue55 = sumValue164;
                                            branchMergedValue56 = loadedBufferValue43.w;
                                            branchMergedValue57 = loadedBufferValue43.z;
                                            branchMergedValue58 = loadedBufferValue43.y;
                                            branchMergedValue59 = loadedBufferValue43.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue72;
                                            float branchMergedValue74;
                                            float branchMergedValue75;
                                            float branchMergedValue76;
                                            float branchMergedValue77;
                                            float branchMergedValue78;
                                            float branchMergedValue79;
                                            if (comparisonValue56 == 3u)
                                            {
                                                branchMergedValue72 = sumValue162;
                                                branchMergedValue74 = sumValue163;
                                                branchMergedValue75 = sumValue164;
                                                branchMergedValue76 = loadedBufferValue44.w;
                                                branchMergedValue77 = loadedBufferValue44.z;
                                                branchMergedValue78 = loadedBufferValue44.y;
                                                branchMergedValue79 = loadedBufferValue44.x;
                                            }
                                            else
                                            {
                                                float branchMergedValue84;
                                                float branchMergedValue85;
                                                float branchMergedValue86;
                                                float branchMergedValue87;
                                                float branchMergedValue88;
                                                float branchMergedValue89;
                                                float branchMergedValue90;
                                                if (comparisonValue56 == 4u)
                                                {
                                                    branchMergedValue84 = (-0.0f) - sumValue163;
                                                    branchMergedValue85 = sumValue162;
                                                    branchMergedValue86 = sumValue164;
                                                    branchMergedValue87 = loadedBufferValue45.w;
                                                    branchMergedValue88 = loadedBufferValue45.z;
                                                    branchMergedValue89 = loadedBufferValue45.y;
                                                    branchMergedValue90 = loadedBufferValue45.x;
                                                }
                                                else
                                                {
                                                    bool comparisonValue90 = comparisonValue56 == 5u;
                                                    branchMergedValue84 = comparisonValue90 ? sumValue163 : sumValue164;
                                                    branchMergedValue85 = sumValue162;
                                                    branchMergedValue86 = comparisonValue90 ? sumValue161 : sumValue163;
                                                    branchMergedValue87 = comparisonValue90 ? loadedBufferValue46.w : loadedBufferValue41.w;
                                                    branchMergedValue88 = comparisonValue90 ? loadedBufferValue46.z : loadedBufferValue41.z;
                                                    branchMergedValue89 = comparisonValue90 ? loadedBufferValue46.y : loadedBufferValue41.y;
                                                    branchMergedValue90 = comparisonValue90 ? loadedBufferValue46.x : loadedBufferValue41.x;
                                                }
                                                branchMergedValue72 = branchMergedValue84;
                                                branchMergedValue74 = branchMergedValue85;
                                                branchMergedValue75 = branchMergedValue86;
                                                branchMergedValue76 = branchMergedValue87;
                                                branchMergedValue77 = branchMergedValue88;
                                                branchMergedValue78 = branchMergedValue89;
                                                branchMergedValue79 = branchMergedValue90;
                                            }
                                            branchMergedValue25 = branchMergedValue72;
                                            branchMergedValue54 = branchMergedValue74;
                                            branchMergedValue55 = branchMergedValue75;
                                            branchMergedValue56 = branchMergedValue76;
                                            branchMergedValue57 = branchMergedValue77;
                                            branchMergedValue58 = branchMergedValue78;
                                            branchMergedValue59 = branchMergedValue79;
                                        }
                                        intermediateValue239 = branchMergedValue59;
                                        intermediateValue240 = branchMergedValue58;
                                        intermediateValue241 = branchMergedValue57;
                                        intermediateValue242 = branchMergedValue56;
                                        sumValue127 = branchMergedValue55;
                                        intermediateValue243 = branchMergedValue54;
                                        intermediateValue244 = branchMergedValue25;
                                    }
                                    float branchMergedValue21;
                                    float branchMergedValue35;
                                    if ((intermediateValue241 == 0.0f) && (intermediateValue242 == 0.0f))
                                    {
                                        branchMergedValue21 = 1.0f;
                                        branchMergedValue35 = 0.0f;
                                    }
                                    else
                                    {
                                        float multiplyAddValue53 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                        float inverseLengthValue16 = rsqrt(dot(float3(productValue3, productValue4, productValue5), float3(productValue3, productValue4, productValue5)));
                                        float sumValue165 = (-0.0f) - sumValue162;
                                        float sumValue166 = (-0.0f) - sumValue163;
                                        float inverseLengthValue17 = rsqrt(dot(float3(sumValue164, sumValue165, sumValue166), float3(sumValue164, sumValue165, sumValue166)));
                                        float dotProductValue23 = min(max(dot(float3(inverseLengthValue17 * sumValue164, inverseLengthValue17 * sumValue165, inverseLengthValue17 * sumValue166), float3(inverseLengthValue16 * productValue3, inverseLengthValue16 * productValue4, inverseLengthValue16 * productValue5)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                        float sumValue168 = intermediateValue241 - intermediateValue239;
                                        float productValue302 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue168;
                                        float multiplyAddValue54 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue53;
                                        float multiplyAddValue55 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue53;
                                        float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                        float quotientValue32 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                        float sumValue190 = intermediateValue242 - intermediateValue240;
                                        float productValue303 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue190;
                                        float4 sampledTextureValue17 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue54 * 0.5f) + 0.5f) * productValue302) + 0.5f) / productValue302) * sumValue168) + intermediateValue239, quotientValue31 + intermediateValue239), intermediateValue241 - quotientValue31), min(max((((floor((0.5f - (multiplyAddValue55 * 0.5f)) * productValue303) + 0.5f) / productValue303) * sumValue190) + intermediateValue240, quotientValue32 + intermediateValue240), intermediateValue242 - quotientValue32)), 0.0f);
                                        float scalarValue126 = sampledTextureValue17.x;
                                        float multiplyAddValue56 = float(scalarValue126 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue244, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue243, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue302, 1.0f)) * (((sqrt(1.0f - (dotProductValue23 * dotProductValue23)) / dotProductValue23) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue53));
                                        float branchMergedValue71;
                                        float branchMergedValue73;
                                        if (productValue33 > 0.0f)
                                        {
                                            float multiplyAddValue57 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue126, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                            float multiplyAddValue58 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue126, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue57;
                                            float multiplyAddValue59 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue126, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue57;
                                            float multiplyAddValue60 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue126, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue55, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue54)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue57;
                                            float clampedValue31 = clamp((sqrt(((intermediateValue243 * intermediateValue243) + (sumValue127 * sumValue127)) + (intermediateValue244 * intermediateValue244)) - sqrt(((multiplyAddValue59 * multiplyAddValue59) + (multiplyAddValue58 * multiplyAddValue58)) + (multiplyAddValue60 * multiplyAddValue60))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                            branchMergedValue71 = 1.0f - ((clampedValue31 * clampedValue31) * (3.0f - (clampedValue31 * 2.0f)));
                                            branchMergedValue73 = multiplyAddValue56;
                                        }
                                        else
                                        {
                                            branchMergedValue71 = 1.0f;
                                            branchMergedValue73 = multiplyAddValue56;
                                        }
                                        branchMergedValue21 = branchMergedValue71;
                                        branchMergedValue35 = branchMergedValue73;
                                    }
                                    intermediateValue163 = branchMergedValue35;
                                    intermediateValue165 = branchMergedValue21;
                                }
                                else
                                {
                                    intermediateValue163 = 1.0f;
                                    intermediateValue165 = 1.0f;
                                }
                                uint productValue271 = (loadedBufferValue3 * 32u) + 4u;
                                float4 loadedBufferValue47 = asfloat(uint4(rdLoad_zLights(productValue271).x, rdLoad_zLights(productValue271 + 1u).x, rdLoad_zLights(productValue271 + 2u).x, rdLoad_zLights(productValue271 + 3u).x));
                                float quotientValue33 = productValue206 / (productValue262 + 9.9999997473787516355514526367188e-05f);
                                float clampedValue28 = clamp(1.0f - (quotientValue33 * quotientValue33), 0.0f, 1.0f);
                                float quotientValue34 = (clampedValue28 * clampedValue28) * (1.0f / max(productValue206, 0.100000001490116119384765625f));
                                float clampedValue23;
                                if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                                {
                                    float clampedValue29 = clamp(((1.0f - quotientValue34) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                    clampedValue23 = clamp((((clampedValue29 * clampedValue29) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue29 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue34;
                                }
                                else
                                {
                                    clampedValue23 = quotientValue34;
                                }
                                float productValue272 = clampedValue23 * loadedBufferValue47.w;
                                branchMergedValue3 = intermediateValue165;
                                branchMergedValue10 = intermediateValue163;
                                branchMergedValue11 = productValue272 * loadedBufferValue47.z;
                                branchMergedValue12 = productValue272 * loadedBufferValue47.y;
                                branchMergedValue13 = productValue272 * loadedBufferValue47.x;
                            }
                            else
                            {
                                branchMergedValue3 = 1.0f;
                                branchMergedValue10 = 1.0f;
                                branchMergedValue11 = 0.0f;
                                branchMergedValue12 = 0.0f;
                                branchMergedValue13 = 0.0f;
                            }
                            intermediateValue164 = branchMergedValue3;
                            intermediateValue162 = branchMergedValue10;
                            intermediateValue161 = branchMergedValue11;
                            intermediateValue160 = branchMergedValue12;
                            intermediateValue159 = branchMergedValue13;
                            float productValue304 = intermediateValue162 * quotientValue19;
                            float productValue305 = dotProductValue15 * intermediateValue164;
                            float productValue275 = sumValue6 * 0.3183098733425140380859375f;
                            float productValue306 = ((((productValue275 * exponentialValue) * intermediateValue159) * (productValue305 + (productValue304 * sumValue52))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue88;
                            float productValue307 = ((((productValue275 * exponentialValue1) * intermediateValue160) * (productValue305 + (productValue304 * sumValue53))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue89;
                            float productValue308 = ((((productValue275 * exponentialValue2) * intermediateValue161) * (productValue305 + (productValue304 * sumValue54))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue90;
                            float productValue309 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue162 * intermediateValue113);
                            float productValue310 = ((productValue309 * quotientValue21) * intermediateValue159) + scalarValue85;
                            float productValue311 = ((productValue309 * quotientValue22) * intermediateValue160) + scalarValue86;
                            float productValue312 = ((productValue309 * quotientValue23) * intermediateValue161) + scalarValue87;
                            uint sumValue191 = scalarValue125 + 1u;
                            if (int(sumValue191) < int(intermediateValue46))
                            {
                                scalarValue85 = productValue310;
                                scalarValue86 = productValue311;
                                scalarValue87 = productValue312;
                                scalarValue88 = productValue306;
                                scalarValue89 = productValue307;
                                scalarValue90 = productValue308;
                                scalarValue125 = sumValue191;
                                continue;
                            }
                            else
                            {
                                intermediateValue61 = productValue310;
                                intermediateValue63 = productValue311;
                                intermediateValue65 = productValue312;
                                intermediateValue67 = productValue306;
                                intermediateValue69 = productValue307;
                                intermediateValue71 = productValue308;
                                break;
                            }
                        }
                    }
                    intermediateValue60 = intermediateValue61;
                    intermediateValue62 = intermediateValue63;
                    intermediateValue64 = intermediateValue65;
                    intermediateValue66 = intermediateValue67;
                    intermediateValue68 = intermediateValue69;
                    intermediateValue70 = intermediateValue71;
                }
                else
                {
                    intermediateValue60 = 0.0f;
                    intermediateValue62 = 0.0f;
                    intermediateValue64 = 0.0f;
                    intermediateValue66 = 0.0f;
                    intermediateValue68 = 0.0f;
                    intermediateValue70 = 0.0f;
                }
                float sumValue170 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
                productValue46 = (sumValue170 * intermediateValue60) + intermediateValue15;
                productValue47 = (sumValue170 * intermediateValue62) + intermediateValue16;
                productValue48 = (sumValue170 * intermediateValue64) + intermediateValue17;
                productValue49 = (sumValue170 * intermediateValue66) + intermediateValue18;
                productValue50 = (sumValue170 * intermediateValue68) + intermediateValue19;
                productValue51 = (sumValue170 * intermediateValue70) + intermediateValue20;
            }
            else
            {
                productValue46 = intermediateValue15;
                productValue47 = intermediateValue16;
                productValue48 = intermediateValue17;
                productValue49 = intermediateValue18;
                productValue50 = intermediateValue19;
                productValue51 = intermediateValue20;
            }
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float productValue46;
            float productValue47;
            float productValue48;
            float productValue49;
            float productValue50;
            float productValue51;
            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
            {
                bool conditionValue2 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
                float comparisonValue87 = conditionValue2 ? productValue22 : varyingTexCoord3.x;
                float comparisonValue88 = conditionValue2 ? productValue23 : varyingTexCoord3.y;
                float comparisonValue89 = conditionValue2 ? productValue24 : varyingTexCoord3.z;
                float productValue241 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue3;
                float productValue242 = productValue241 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
                float intermediateValue29;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue3)
                {
                    intermediateValue29 = 0.0f;
                }
                else
                {
                    float branchMergedValue15;
                    if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue3)
                    {
                        branchMergedValue15 = 1.0f;
                    }
                    else
                    {
                        branchMergedValue15 = min(floor(min(max((log2(sumValue3) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                    }
                    intermediateValue29 = branchMergedValue15;
                }
                float quotientValue28 = min(floor(min(max((productValue242 + multiplyAddValue4) / (productValue242 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
                float quotientValue29 = min(floor(min(max((productValue241 + multiplyAddValue5) / (productValue241 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
                uint intermediateValue42;
                bool intermediateValue44;
                uint intermediateValue45;
                if ((intermediateValue29 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue29 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue29 < 0.0f) || ((quotientValue28 < 0.0f) || (quotientValue29 < 0.0f))))))
                {
                    intermediateValue42 = intermediateValue43;
                    intermediateValue44 = false;
                    intermediateValue45 = 0u;
                }
                else
                {
                    uint scalarValue83 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                    uint productValue243 = uint(int(((quotientValue29 + (intermediateValue29 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue28)) * scalarValue83;
                    intermediateValue42 = productValue243;
                    intermediateValue44 = true;
                    intermediateValue45 = productValue243 + scalarValue83;
                }
                float intermediateValue59;
                float intermediateValue61;
                float intermediateValue63;
                float intermediateValue65;
                float intermediateValue67;
                float intermediateValue69;
                if (intermediateValue44 && (int(intermediateValue42) < int(intermediateValue45)))
                {
                    float intermediateValue112;
                    float quotientValue19;
                    float dotProductValue15;
                    float sumValue52;
                    float sumValue53;
                    float sumValue54;
                    float quotientValue21;
                    float quotientValue22;
                    float quotientValue23;
                    float intermediateValue158;
                    float intermediateValue159;
                    float intermediateValue160;
                    float intermediateValue161;
                    float intermediateValue163;
                    float intermediateValue60;
                    float intermediateValue62;
                    float intermediateValue64;
                    float intermediateValue66;
                    float intermediateValue68;
                    float intermediateValue70;
                    uint scalarValue84 = intermediateValue42;
                    float scalarValue85 = 0.0f;
                    float scalarValue86 = 0.0f;
                    float scalarValue87 = 0.0f;
                    float scalarValue88 = 0.0f;
                    float scalarValue89 = 0.0f;
                    float scalarValue90 = 0.0f;
                    uint loadedBufferValue3;
                    for (;;)
                    {
                        loadedBufferValue3 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue84).x)));
                        if (int(loadedBufferValue3) < int(0u))
                        {
                            intermediateValue60 = scalarValue85;
                            intermediateValue62 = scalarValue86;
                            intermediateValue64 = scalarValue87;
                            intermediateValue66 = scalarValue88;
                            intermediateValue68 = scalarValue89;
                            intermediateValue70 = scalarValue90;
                            break;
                        }
                        else
                        {
                            uint productValue244 = loadedBufferValue3 * 32u;
                            float4 loadedBufferValue40 = asfloat(uint4(rdLoad_zLights(productValue244).x, rdLoad_zLights(productValue244 + 1u).x, rdLoad_zLights(productValue244 + 2u).x, rdLoad_zLights(productValue244 + 3u).x));
                            float scalarValue91 = loadedBufferValue40.x;
                            float scalarValue92 = loadedBufferValue40.y;
                            float scalarValue93 = loadedBufferValue40.z;
                            float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue4);
                            float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue5);
                            float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue93, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue92, scalarValue91 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue6);
                            float inverseLengthValue14 = rsqrt(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
                            float productValue245 = inverseLengthValue14 * multiplyAddValue42;
                            float productValue246 = inverseLengthValue14 * multiplyAddValue43;
                            float productValue247 = inverseLengthValue14 * multiplyAddValue44;
                            float dotProductValue20 = dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue245, productValue246, productValue247));
                            intermediateValue112 = max(dotProductValue20, 0.0f);
                            float dotProductValue21 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(sumValue8, sumValue9, sumValue10)), 0.0f);
                            float sumValue151 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                            float productValue248 = sumValue151 * sumValue151;
                            quotientValue19 = ((max((dotProductValue20 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue248, 0.0f) - intermediateValue112) * productValue33) + intermediateValue112;
                            dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue12, (-0.0f) - multiplyAddValue13, (-0.0f) - multiplyAddValue14), float3(productValue245, productValue246, productValue247)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue248, 0.0f) * productValue33;
                            float sumValue152 = productValue245 - quotientValue6;
                            float sumValue153 = productValue246 - quotientValue7;
                            float sumValue154 = productValue247 - quotientValue8;
                            float inverseLengthValue15 = rsqrt(dot(float3(sumValue152, sumValue153, sumValue154), float3(sumValue152, sumValue153, sumValue154)));
                            float productValue249 = inverseLengthValue15 * sumValue152;
                            float productValue250 = inverseLengthValue15 * sumValue153;
                            float productValue251 = inverseLengthValue15 * sumValue154;
                            float scalarValue94 = max(RD_UNIFORM_MERS_UNIFORMS.z, 0.0500000007450580596923828125f);
                            float productValue252 = scalarValue94 * scalarValue94;
                            float productValue253 = productValue252 * productValue252;
                            float dotProductValue22 = max(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(productValue249, productValue250, productValue251)), 0.0f);
                            float productValue254 = ((dotProductValue22 * dotProductValue22) * (productValue253 + (-1.0f))) + 1.0f;
                            float productValue255 = productValue252 * 0.5f;
                            float sumValue155 = 1.0f - productValue255;
                            float sumValue156 = productValue255 + 9.9999997473787516355514526367188e-05f;
                            float clampedValue26 = clamp(1.0f - max(dot(float3(sumValue8, sumValue9, sumValue10), float3(productValue249, productValue250, productValue251)), 0.0f), 0.0f, 1.0f);
                            float productValue256 = clampedValue26 * clampedValue26;
                            float productValue257 = (productValue256 * productValue256) * clampedValue26;
                            float productValue258 = (productValue257 * (1.0f - productValue26)) + productValue26;
                            float productValue259 = (productValue257 * (1.0f - productValue27)) + productValue27;
                            float productValue260 = (productValue257 * (1.0f - productValue28)) + productValue28;
                            sumValue52 = 1.0f - productValue258;
                            sumValue53 = 1.0f - productValue259;
                            sumValue54 = 1.0f - productValue260;
                            float quotientValue30 = ((dotProductValue21 / ((sumValue155 * dotProductValue21) + sumValue156)) * (productValue253 / ((productValue254 * productValue254) * 3.1415927410125732421875f))) * (intermediateValue112 / ((sumValue155 * intermediateValue112) + sumValue156));
                            float productValue261 = ((intermediateValue112 * 4.0f) * dotProductValue21) + 9.9999997473787516355514526367188e-05f;
                            quotientValue21 = (productValue258 * quotientValue30) / productValue261;
                            quotientValue22 = (productValue259 * quotientValue30) / productValue261;
                            quotientValue23 = (productValue260 * quotientValue30) / productValue261;
                            float sumValue157 = scalarValue91 - varyingTexCoord3.x;
                            float sumValue158 = scalarValue92 - varyingTexCoord3.y;
                            float sumValue159 = scalarValue93 - varyingTexCoord3.z;
                            float productValue206;
                            if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                            {
                                float sumValue160 = (abs(sumValue158) + abs(sumValue157)) + abs(sumValue159);
                                productValue206 = sumValue160 * sumValue160;
                            }
                            else
                            {
                                productValue206 = dot(float3(sumValue157, sumValue158, sumValue159), float3(sumValue157, sumValue158, sumValue159));
                            }
                            float scalarValue95 = loadedBufferValue40.w;
                            float productValue262 = scalarValue95 * scalarValue95;
                            float branchMergedValue3;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            float branchMergedValue12;
                            float branchMergedValue13;
                            if (!(productValue206 >= productValue262))
                            {
                                float intermediateValue162;
                                float intermediateValue164;
                                if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                                {
                                    uint productValue263 = (loadedBufferValue3 * 32u) + 8u;
                                    float4 loadedBufferValue41 = asfloat(uint4(rdLoad_zLights(productValue263).x, rdLoad_zLights(productValue263 + 1u).x, rdLoad_zLights(productValue263 + 2u).x, rdLoad_zLights(productValue263 + 3u).x));
                                    uint productValue264 = (loadedBufferValue3 * 32u) + 12u;
                                    float4 loadedBufferValue42 = asfloat(uint4(rdLoad_zLights(productValue264).x, rdLoad_zLights(productValue264 + 1u).x, rdLoad_zLights(productValue264 + 2u).x, rdLoad_zLights(productValue264 + 3u).x));
                                    uint productValue265 = (loadedBufferValue3 * 32u) + 16u;
                                    float4 loadedBufferValue43 = asfloat(uint4(rdLoad_zLights(productValue265).x, rdLoad_zLights(productValue265 + 1u).x, rdLoad_zLights(productValue265 + 2u).x, rdLoad_zLights(productValue265 + 3u).x));
                                    uint productValue266 = (loadedBufferValue3 * 32u) + 20u;
                                    float4 loadedBufferValue44 = asfloat(uint4(rdLoad_zLights(productValue266).x, rdLoad_zLights(productValue266 + 1u).x, rdLoad_zLights(productValue266 + 2u).x, rdLoad_zLights(productValue266 + 3u).x));
                                    uint productValue267 = (loadedBufferValue3 * 32u) + 24u;
                                    float4 loadedBufferValue45 = asfloat(uint4(rdLoad_zLights(productValue267).x, rdLoad_zLights(productValue267 + 1u).x, rdLoad_zLights(productValue267 + 2u).x, rdLoad_zLights(productValue267 + 3u).x));
                                    uint productValue268 = (loadedBufferValue3 * 32u) + 28u;
                                    float4 loadedBufferValue46 = asfloat(uint4(rdLoad_zLights(productValue268).x, rdLoad_zLights(productValue268 + 1u).x, rdLoad_zLights(productValue268 + 2u).x, rdLoad_zLights(productValue268 + 3u).x));
                                    float sumValue161 = comparisonValue87 - scalarValue91;
                                    float sumValue162 = comparisonValue88 - scalarValue92;
                                    float sumValue163 = comparisonValue89 - scalarValue93;
                                    float scalarValue96 = abs(sumValue161);
                                    float scalarValue97 = abs(sumValue162);
                                    float scalarValue98 = abs(sumValue163);
                                    uint comparisonValue56;
                                    if ((scalarValue96 >= scalarValue97) && (scalarValue96 >= scalarValue98))
                                    {
                                        comparisonValue56 = uint(!(sumValue161 >= 0.0f));
                                    }
                                    else
                                    {
                                        uint branchMergedValue24;
                                        if (!(scalarValue97 >= scalarValue98))
                                        {
                                            branchMergedValue24 = (sumValue163 >= 0.0f) ? 4u : 5u;
                                        }
                                        else
                                        {
                                            branchMergedValue24 = (sumValue162 >= 0.0f) ? 2u : 3u;
                                        }
                                        comparisonValue56 = branchMergedValue24;
                                    }
                                    float sumValue164 = (-0.0f) - sumValue161;
                                    float intermediateValue238;
                                    float intermediateValue239;
                                    float intermediateValue240;
                                    float intermediateValue241;
                                    float sumValue127;
                                    float intermediateValue242;
                                    float intermediateValue243;
                                    if (comparisonValue56 == 1u)
                                    {
                                        intermediateValue238 = loadedBufferValue42.x;
                                        intermediateValue239 = loadedBufferValue42.y;
                                        intermediateValue240 = loadedBufferValue42.z;
                                        intermediateValue241 = loadedBufferValue42.w;
                                        sumValue127 = (-0.0f) - sumValue163;
                                        intermediateValue242 = sumValue162;
                                        intermediateValue243 = sumValue161;
                                    }
                                    else
                                    {
                                        float branchMergedValue25;
                                        float branchMergedValue54;
                                        float branchMergedValue55;
                                        float branchMergedValue56;
                                        float branchMergedValue57;
                                        float branchMergedValue58;
                                        float branchMergedValue59;
                                        if (comparisonValue56 == 2u)
                                        {
                                            branchMergedValue25 = (-0.0f) - sumValue162;
                                            branchMergedValue54 = (-0.0f) - sumValue163;
                                            branchMergedValue55 = sumValue164;
                                            branchMergedValue56 = loadedBufferValue43.w;
                                            branchMergedValue57 = loadedBufferValue43.z;
                                            branchMergedValue58 = loadedBufferValue43.y;
                                            branchMergedValue59 = loadedBufferValue43.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue72;
                                            float branchMergedValue74;
                                            float branchMergedValue75;
                                            float branchMergedValue76;
                                            float branchMergedValue77;
                                            float branchMergedValue78;
                                            float branchMergedValue79;
                                            if (comparisonValue56 == 3u)
                                            {
                                                branchMergedValue72 = sumValue162;
                                                branchMergedValue74 = sumValue163;
                                                branchMergedValue75 = sumValue164;
                                                branchMergedValue76 = loadedBufferValue44.w;
                                                branchMergedValue77 = loadedBufferValue44.z;
                                                branchMergedValue78 = loadedBufferValue44.y;
                                                branchMergedValue79 = loadedBufferValue44.x;
                                            }
                                            else
                                            {
                                                float branchMergedValue84;
                                                float branchMergedValue85;
                                                float branchMergedValue86;
                                                float branchMergedValue87;
                                                float branchMergedValue88;
                                                float branchMergedValue89;
                                                float branchMergedValue90;
                                                if (comparisonValue56 == 4u)
                                                {
                                                    branchMergedValue84 = (-0.0f) - sumValue163;
                                                    branchMergedValue85 = sumValue162;
                                                    branchMergedValue86 = sumValue164;
                                                    branchMergedValue87 = loadedBufferValue45.w;
                                                    branchMergedValue88 = loadedBufferValue45.z;
                                                    branchMergedValue89 = loadedBufferValue45.y;
                                                    branchMergedValue90 = loadedBufferValue45.x;
                                                }
                                                else
                                                {
                                                    bool comparisonValue90 = comparisonValue56 == 5u;
                                                    branchMergedValue84 = comparisonValue90 ? sumValue163 : sumValue164;
                                                    branchMergedValue85 = sumValue162;
                                                    branchMergedValue86 = comparisonValue90 ? sumValue161 : sumValue163;
                                                    branchMergedValue87 = comparisonValue90 ? loadedBufferValue46.w : loadedBufferValue41.w;
                                                    branchMergedValue88 = comparisonValue90 ? loadedBufferValue46.z : loadedBufferValue41.z;
                                                    branchMergedValue89 = comparisonValue90 ? loadedBufferValue46.y : loadedBufferValue41.y;
                                                    branchMergedValue90 = comparisonValue90 ? loadedBufferValue46.x : loadedBufferValue41.x;
                                                }
                                                branchMergedValue72 = branchMergedValue84;
                                                branchMergedValue74 = branchMergedValue85;
                                                branchMergedValue75 = branchMergedValue86;
                                                branchMergedValue76 = branchMergedValue87;
                                                branchMergedValue77 = branchMergedValue88;
                                                branchMergedValue78 = branchMergedValue89;
                                                branchMergedValue79 = branchMergedValue90;
                                            }
                                            branchMergedValue25 = branchMergedValue72;
                                            branchMergedValue54 = branchMergedValue74;
                                            branchMergedValue55 = branchMergedValue75;
                                            branchMergedValue56 = branchMergedValue76;
                                            branchMergedValue57 = branchMergedValue77;
                                            branchMergedValue58 = branchMergedValue78;
                                            branchMergedValue59 = branchMergedValue79;
                                        }
                                        intermediateValue238 = branchMergedValue59;
                                        intermediateValue239 = branchMergedValue58;
                                        intermediateValue240 = branchMergedValue57;
                                        intermediateValue241 = branchMergedValue56;
                                        sumValue127 = branchMergedValue55;
                                        intermediateValue242 = branchMergedValue54;
                                        intermediateValue243 = branchMergedValue25;
                                    }
                                    float branchMergedValue21;
                                    float branchMergedValue35;
                                    if ((intermediateValue240 == 0.0f) && (intermediateValue241 == 0.0f))
                                    {
                                        branchMergedValue21 = 1.0f;
                                        branchMergedValue35 = 0.0f;
                                    }
                                    else
                                    {
                                        float multiplyAddValue45 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue243, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue242, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                        float inverseLengthValue16 = rsqrt(dot(float3(productValue3, productValue4, productValue5), float3(productValue3, productValue4, productValue5)));
                                        float sumValue165 = (-0.0f) - sumValue162;
                                        float sumValue166 = (-0.0f) - sumValue163;
                                        float inverseLengthValue17 = rsqrt(dot(float3(sumValue164, sumValue165, sumValue166), float3(sumValue164, sumValue165, sumValue166)));
                                        float dotProductValue23 = min(max(dot(float3(inverseLengthValue17 * sumValue164, inverseLengthValue17 * sumValue165, inverseLengthValue17 * sumValue166), float3(inverseLengthValue16 * productValue3, inverseLengthValue16 * productValue4, inverseLengthValue16 * productValue5)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                        float sumValue167 = intermediateValue240 - intermediateValue238;
                                        float productValue269 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue167;
                                        float multiplyAddValue46 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue243, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue242, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue45;
                                        float multiplyAddValue47 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue243, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue242, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue45;
                                        float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                        float quotientValue32 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                        float sumValue168 = intermediateValue241 - intermediateValue239;
                                        float productValue270 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue168;
                                        float4 sampledTextureValue14 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue46 * 0.5f) + 0.5f) * productValue269) + 0.5f) / productValue269) * sumValue167) + intermediateValue238, quotientValue31 + intermediateValue238), intermediateValue240 - quotientValue31), min(max((((floor((0.5f - (multiplyAddValue47 * 0.5f)) * productValue270) + 0.5f) / productValue270) * sumValue168) + intermediateValue239, quotientValue32 + intermediateValue239), intermediateValue241 - quotientValue32)), 0.0f);
                                        float scalarValue99 = sampledTextureValue14.x;
                                        float multiplyAddValue48 = float(scalarValue99 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue243, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue242, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue127)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue269, 1.0f)) * (((sqrt(1.0f - (dotProductValue23 * dotProductValue23)) / dotProductValue23) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue45));
                                        float branchMergedValue71;
                                        float branchMergedValue73;
                                        if (productValue33 > 0.0f)
                                        {
                                            float multiplyAddValue49 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue99, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                            float multiplyAddValue50 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue99, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue49;
                                            float multiplyAddValue51 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue99, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue49;
                                            float multiplyAddValue52 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue99, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue47, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue46)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue49;
                                            float clampedValue27 = clamp((sqrt(((intermediateValue242 * intermediateValue242) + (sumValue127 * sumValue127)) + (intermediateValue243 * intermediateValue243)) - sqrt(((multiplyAddValue51 * multiplyAddValue51) + (multiplyAddValue50 * multiplyAddValue50)) + (multiplyAddValue52 * multiplyAddValue52))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                            branchMergedValue71 = 1.0f - ((clampedValue27 * clampedValue27) * (3.0f - (clampedValue27 * 2.0f)));
                                            branchMergedValue73 = multiplyAddValue48;
                                        }
                                        else
                                        {
                                            branchMergedValue71 = 1.0f;
                                            branchMergedValue73 = multiplyAddValue48;
                                        }
                                        branchMergedValue21 = branchMergedValue71;
                                        branchMergedValue35 = branchMergedValue73;
                                    }
                                    intermediateValue162 = branchMergedValue35;
                                    intermediateValue164 = branchMergedValue21;
                                }
                                else
                                {
                                    intermediateValue162 = 1.0f;
                                    intermediateValue164 = 1.0f;
                                }
                                uint productValue271 = (loadedBufferValue3 * 32u) + 4u;
                                float4 loadedBufferValue47 = asfloat(uint4(rdLoad_zLights(productValue271).x, rdLoad_zLights(productValue271 + 1u).x, rdLoad_zLights(productValue271 + 2u).x, rdLoad_zLights(productValue271 + 3u).x));
                                float quotientValue33 = productValue206 / (productValue262 + 9.9999997473787516355514526367188e-05f);
                                float clampedValue28 = clamp(1.0f - (quotientValue33 * quotientValue33), 0.0f, 1.0f);
                                float quotientValue34 = (clampedValue28 * clampedValue28) * (1.0f / max(productValue206, 0.100000001490116119384765625f));
                                float clampedValue23;
                                if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                                {
                                    float clampedValue29 = clamp(((1.0f - quotientValue34) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                    clampedValue23 = clamp((((clampedValue29 * clampedValue29) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue29 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue34;
                                }
                                else
                                {
                                    clampedValue23 = quotientValue34;
                                }
                                float productValue272 = clampedValue23 * loadedBufferValue47.w;
                                branchMergedValue3 = intermediateValue164;
                                branchMergedValue10 = intermediateValue162;
                                branchMergedValue11 = productValue272 * loadedBufferValue47.z;
                                branchMergedValue12 = productValue272 * loadedBufferValue47.y;
                                branchMergedValue13 = productValue272 * loadedBufferValue47.x;
                            }
                            else
                            {
                                branchMergedValue3 = 1.0f;
                                branchMergedValue10 = 1.0f;
                                branchMergedValue11 = 0.0f;
                                branchMergedValue12 = 0.0f;
                                branchMergedValue13 = 0.0f;
                            }
                            intermediateValue163 = branchMergedValue3;
                            intermediateValue161 = branchMergedValue10;
                            intermediateValue160 = branchMergedValue11;
                            intermediateValue159 = branchMergedValue12;
                            intermediateValue158 = branchMergedValue13;
                            float productValue273 = intermediateValue161 * quotientValue19;
                            float productValue274 = dotProductValue15 * intermediateValue163;
                            float productValue275 = sumValue6 * 0.3183098733425140380859375f;
                            float productValue276 = ((((productValue275 * exponentialValue) * intermediateValue158) * (productValue274 + (productValue273 * sumValue52))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue88;
                            float productValue277 = ((((productValue275 * exponentialValue1) * intermediateValue159) * (productValue274 + (productValue273 * sumValue53))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue89;
                            float productValue278 = ((((productValue275 * exponentialValue2) * intermediateValue160) * (productValue274 + (productValue273 * sumValue54))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue90;
                            float productValue279 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue161 * intermediateValue112);
                            float productValue280 = ((productValue279 * quotientValue21) * intermediateValue158) + scalarValue85;
                            float productValue281 = ((productValue279 * quotientValue22) * intermediateValue159) + scalarValue86;
                            float productValue282 = ((productValue279 * quotientValue23) * intermediateValue160) + scalarValue87;
                            uint sumValue169 = scalarValue84 + 1u;
                            if (int(sumValue169) < int(intermediateValue45))
                            {
                                scalarValue84 = sumValue169;
                                scalarValue85 = productValue280;
                                scalarValue86 = productValue281;
                                scalarValue87 = productValue282;
                                scalarValue88 = productValue276;
                                scalarValue89 = productValue277;
                                scalarValue90 = productValue278;
                                continue;
                            }
                            else
                            {
                                intermediateValue60 = productValue280;
                                intermediateValue62 = productValue281;
                                intermediateValue64 = productValue282;
                                intermediateValue66 = productValue276;
                                intermediateValue68 = productValue277;
                                intermediateValue70 = productValue278;
                                break;
                            }
                        }
                    }
                    intermediateValue59 = intermediateValue60;
                    intermediateValue61 = intermediateValue62;
                    intermediateValue63 = intermediateValue64;
                    intermediateValue65 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
                    intermediateValue69 = intermediateValue70;
                }
                else
                {
                    intermediateValue59 = 0.0f;
                    intermediateValue61 = 0.0f;
                    intermediateValue63 = 0.0f;
                    intermediateValue65 = 0.0f;
                    intermediateValue67 = 0.0f;
                    intermediateValue69 = 0.0f;
                }
                float sumValue170 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
                productValue46 = (sumValue170 * intermediateValue59) + intermediateValue14;
                productValue47 = (sumValue170 * intermediateValue61) + intermediateValue15;
                productValue48 = (sumValue170 * intermediateValue63) + intermediateValue16;
                productValue49 = (sumValue170 * intermediateValue65) + intermediateValue17;
                productValue50 = (sumValue170 * intermediateValue67) + intermediateValue18;
                productValue51 = (sumValue170 * intermediateValue69) + intermediateValue19;
            }
            else
            {
                productValue46 = intermediateValue14;
                productValue47 = intermediateValue15;
                productValue48 = intermediateValue16;
                productValue49 = intermediateValue17;
                productValue50 = intermediateValue18;
                productValue51 = intermediateValue19;
            }
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#endif
            {
                float productValue89 = ((varyingTexCoord3.x + (-0.5f)) + (productValue3 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
                float productValue90 = ((varyingTexCoord3.y + (-0.5f)) + (productValue4 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
                float productValue91 = ((varyingTexCoord3.z + (-0.5f)) + (productValue5 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
                float productValue92 = floor(productValue89 * 0.0625f) * 16.0f;
                float productValue93 = floor(productValue90 * 0.0625f) * 16.0f;
                float productValue94 = floor(productValue91 * 0.0625f) * 16.0f;
                uint productValue95 = uint(int(floor(float(int(uint(int(floor(productValue89))))) * 0.0625f)));
                uint productValue96 = uint(int(floor(float(int(uint(int(floor(productValue90))))) * 0.0625f)));
                uint productValue97 = uint(int(floor(float(int(uint(int(floor(productValue91))))) * 0.0625f)));
                float sumValue32 = productValue89 - productValue92;
                float sumValue33 = productValue90 - productValue93;
                float sumValue34 = productValue91 - productValue94;
                uint bitwiseValue1 = (productValue96 << 16u) | (productValue95 & 65535u);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                uint bitwiseValue2 = productValue97 & 65535u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                uint bitwiseValue41 = (productValue97 & 65535u) | 131072u;
#endif
                uint productValue102 = productValue95 * 1540483477u;
                uint productValue103 = productValue96 * 1540483477u;
                uint productValue104 = productValue97 * 1540483477u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                uint bitwiseValue3 = ((((((((productValue102 >> 24u) ^ productValue102) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue103 >> 24u) ^ productValue103) * 1540483477u)) * 1540483477u) ^ (((productValue104 >> 24u) ^ productValue104) * 1540483477u)) * 1540483477u;
                uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
                uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
                uint bitwiseValue6 = bitwiseValue5 >> 16u;
                uint bitwiseValue8 = bitwiseValue5 & 65535u;
                uint comparisonValue16 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                uint bitwiseValue42 = (((((((((productValue102 >> 24u) ^ productValue102) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue103 >> 24u) ^ productValue103) * 1540483477u)) * 1540483477u) ^ (((productValue104 >> 24u) ^ productValue104) * 1540483477u)) * 1540483477u) ^ 2418085729u;
                uint bitwiseValue43 = ((bitwiseValue42 >> 13u) ^ bitwiseValue42) * 1540483477u;
                uint bitwiseValue44 = (bitwiseValue43 >> 15u) ^ bitwiseValue43;
                uint bitwiseValue45 = bitwiseValue44 >> 16u;
                uint bitwiseValue46 = bitwiseValue44 & 65535u;
                uint comparisonValue91 = uint(bitwiseValue46 == bitwiseValue45) | (bitwiseValue46 ^ bitwiseValue45);
#endif
                uint sumValue35 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                bool intermediateValue44;
                uint scalarValue24 = comparisonValue16;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                bool intermediateValue43;
                uint scalarValue24 = comparisonValue16;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                bool intermediateValue72;
                uint scalarValue100 = comparisonValue91;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                bool intermediateValue71;
                uint scalarValue100 = comparisonValue91;
#endif
                uint scalarValue25 = 0u;
                uint scalarValue26 = 0u;
                uint loadedBufferValue;
                uint bitwiseValue7;
                for (;;)
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    bitwiseValue7 = scalarValue24 & sumValue35;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    bitwiseValue7 = scalarValue100 & sumValue35;
#endif
                    uint loadedBufferValue1 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    bool loadedBufferValue2 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue1 == comparisonValue16));
                    loadedBufferValue = loadedBufferValue2 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue25;
                    if ((loadedBufferValue1 == 0u) || loadedBufferValue2)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    bool loadedBufferValue48 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue41) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue1 == comparisonValue91));
                    loadedBufferValue = loadedBufferValue48 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue25;
                    if ((loadedBufferValue1 == 0u) || loadedBufferValue48)
#endif
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue44 = loadedBufferValue2;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue43 = loadedBufferValue2;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        intermediateValue72 = loadedBufferValue48;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        intermediateValue71 = loadedBufferValue48;
#endif
                        break;
                    }
                    else
                    {
                        uint sumValue36 = scalarValue26 + 1u;
                        if (int(sumValue36) < int(8u))
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            scalarValue24 = bitwiseValue7 + 1u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            scalarValue100 = bitwiseValue7 + 1u;
#endif
                            scalarValue25 = loadedBufferValue;
                            scalarValue26 = sumValue36;
                            continue;
                        }
                        else
                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue44 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue43 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                            intermediateValue72 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                            intermediateValue71 = false;
#endif
                            break;
                        }
                    }
                }
                uint bitwiseValue9 = loadedBufferValue >> 2u;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                float branchMergedValue9;
                float branchMergedValue17;
                float branchMergedValue18;
                if (intermediateValue44)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float branchMergedValue9;
                float branchMergedValue17;
                float branchMergedValue18;
                if (intermediateValue43)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                float branchMergedValue16;
                float branchMergedValue29;
                float branchMergedValue30;
                if (intermediateValue72)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float branchMergedValue16;
                float branchMergedValue29;
                float branchMergedValue30;
                if (intermediateValue71)
#endif
                {
                    float scalarValue27 = abs(productValue3);
                    float scalarValue28 = abs(productValue4);
                    float scalarValue29 = abs(productValue5);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue48;
                    float branchMergedValue50;
                    float branchMergedValue51;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue65;
                    float branchMergedValue69;
                    float branchMergedValue70;
#endif
                    if (((scalarValue27 >= 1.0f) || (scalarValue28 >= 1.0f)) || (scalarValue29 >= 1.0f))
                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue156;
                        float intermediateValue157;
                        float intermediateValue158;
                        float intermediateValue159;
                        float intermediateValue161;
                        float intermediateValue163;
                        float intermediateValue165;
                        float intermediateValue167;
                        float intermediateValue169;
                        float intermediateValue171;
                        float intermediateValue172;
                        float intermediateValue173;
                        float productValue128;
                        float productValue129;
                        float productValue130;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        float sumValue41;
                        float sumValue42;
                        float sumValue43;
                        float sumValue44;
                        float sumValue45;
                        float productValue131;
                        float productValue132;
                        float productValue133;
                        float productValue134;
                        bool comparisonValue15;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue155;
                        float intermediateValue156;
                        float intermediateValue157;
                        float intermediateValue158;
                        float intermediateValue160;
                        float intermediateValue162;
                        float intermediateValue164;
                        float intermediateValue166;
                        float intermediateValue168;
                        float intermediateValue170;
                        float intermediateValue171;
                        float intermediateValue172;
                        float productValue128;
                        float productValue129;
                        float productValue130;
                        float sumValue37;
                        float sumValue38;
                        float sumValue39;
                        float sumValue40;
                        float sumValue41;
                        float sumValue42;
                        float sumValue43;
                        float sumValue44;
                        float sumValue45;
                        float productValue131;
                        float productValue132;
                        float productValue133;
                        float productValue134;
                        bool comparisonValue15;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        float intermediateValue198;
                        float intermediateValue199;
                        float intermediateValue200;
                        float intermediateValue201;
                        float intermediateValue203;
                        float intermediateValue205;
                        float intermediateValue207;
                        float intermediateValue209;
                        float intermediateValue211;
                        float intermediateValue213;
                        float intermediateValue214;
                        float intermediateValue215;
                        float productValue181;
                        float productValue182;
                        float productValue183;
                        float sumValue58;
                        float sumValue59;
                        float sumValue60;
                        float sumValue61;
                        float sumValue62;
                        float sumValue63;
                        float sumValue64;
                        float sumValue65;
                        float sumValue66;
                        float productValue184;
                        float productValue185;
                        float productValue186;
                        float productValue187;
                        bool comparisonValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        float intermediateValue197;
                        float intermediateValue198;
                        float intermediateValue199;
                        float intermediateValue200;
                        float intermediateValue202;
                        float intermediateValue204;
                        float intermediateValue206;
                        float intermediateValue208;
                        float intermediateValue210;
                        float intermediateValue212;
                        float intermediateValue213;
                        float intermediateValue214;
                        float productValue181;
                        float productValue182;
                        float productValue183;
                        float sumValue58;
                        float sumValue59;
                        float sumValue60;
                        float sumValue61;
                        float sumValue62;
                        float sumValue63;
                        float sumValue64;
                        float sumValue65;
                        float sumValue66;
                        float productValue184;
                        float productValue185;
                        float productValue186;
                        float productValue187;
                        bool comparisonValue22;
#endif
                        for (;;)
                        {
                            float dotProductValue8 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue27, scalarValue28, scalarValue29));
                            float dotProductValue9 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue29, scalarValue27, scalarValue28));
                            float dotProductValue10 = dot(float3(sumValue32, sumValue33, sumValue34), float3(scalarValue28, scalarValue29, scalarValue27));
                            float comparisonValue25 = ((inverseLengthValue * ((varyingNormal0.y + varyingNormal0.x) + varyingNormal0.z)) > 0.0f) ? ceil(dotProductValue8) : floor(dotProductValue8);
                            float scalarValue30 = floor(dotProductValue9);
                            float scalarValue31 = floor(dotProductValue10);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            productValue128 = ((comparisonValue25 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                            productValue129 = ((comparisonValue25 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                            productValue130 = ((comparisonValue25 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                            sumValue37 = productValue128 + scalarValue29;
                            sumValue38 = productValue129 + scalarValue27;
                            sumValue39 = productValue130 + scalarValue28;
                            sumValue40 = productValue128 + scalarValue28;
                            sumValue41 = productValue129 + scalarValue29;
                            sumValue42 = productValue130 + scalarValue27;
                            sumValue43 = sumValue37 + scalarValue28;
                            sumValue44 = sumValue41 + scalarValue27;
                            sumValue45 = sumValue39 + scalarValue27;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            productValue181 = ((comparisonValue25 * scalarValue27) + (scalarValue30 * scalarValue29)) + (scalarValue31 * scalarValue28);
                            productValue182 = ((comparisonValue25 * scalarValue28) + (scalarValue30 * scalarValue27)) + (scalarValue31 * scalarValue29);
                            productValue183 = ((comparisonValue25 * scalarValue29) + (scalarValue30 * scalarValue28)) + (scalarValue31 * scalarValue27);
                            sumValue58 = productValue181 + scalarValue29;
                            sumValue59 = productValue182 + scalarValue27;
                            sumValue60 = productValue183 + scalarValue28;
                            sumValue61 = productValue181 + scalarValue28;
                            sumValue62 = productValue182 + scalarValue29;
                            sumValue63 = productValue183 + scalarValue27;
                            sumValue64 = sumValue58 + scalarValue28;
                            sumValue65 = sumValue62 + scalarValue27;
                            sumValue66 = sumValue60 + scalarValue27;
#endif
                            float sumValue46 = dotProductValue9 - scalarValue30;
                            float sumValue47 = dotProductValue10 - scalarValue31;
                            float sumValue48 = 1.0f - sumValue46;
                            float sumValue49 = 1.0f - sumValue47;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            productValue131 = sumValue49 * sumValue48;
                            productValue132 = sumValue49 * sumValue46;
                            productValue133 = sumValue48 * sumValue47;
                            productValue134 = sumValue47 * sumValue46;
                            comparisonValue15 = ((productValue130 >= 0.0f) && ((productValue128 >= 0.0f) && (productValue129 >= 0.0f))) && ((sumValue45 < 16.0f) && ((sumValue43 < 16.0f) && (sumValue44 < 16.0f)));
                            if (comparisonValue15)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            productValue184 = sumValue49 * sumValue48;
                            productValue185 = sumValue49 * sumValue46;
                            productValue186 = sumValue48 * sumValue47;
                            productValue187 = sumValue47 * sumValue46;
                            comparisonValue22 = ((productValue183 >= 0.0f) && ((productValue181 >= 0.0f) && (productValue182 >= 0.0f))) && ((sumValue66 < 16.0f) && ((sumValue64 < 16.0f) && (sumValue65 < 16.0f)));
                            if (comparisonValue22)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue4 = rdLoad_voxelBuffer(((uint(productValue129) + bitwiseValue9) + (uint(productValue130) << 4u)) + (uint(productValue128) << 8u));
                                uint scalarValue32 = loadedBufferValue4.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue49 = rdLoad_voxelBuffer(((uint(productValue182) + bitwiseValue9) + (uint(productValue183) << 4u)) + (uint(productValue181) << 8u));
                                uint scalarValue101 = loadedBufferValue49.x;
#endif
                                float bitwiseValue13;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue110;
                                float intermediateValue111;
                                if (scalarValue32 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue109;
                                float intermediateValue110;
                                if (scalarValue32 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue148;
                                float intermediateValue149;
                                if (scalarValue101 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue147;
                                float intermediateValue148;
                                if (scalarValue101 == 0u)
#endif
                                {
                                    bitwiseValue13 = 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue110 = 0.0f;
                                    intermediateValue111 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue109 = 0.0f;
                                    intermediateValue110 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue148 = 0.0f;
                                    intermediateValue149 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue147 = 0.0f;
                                    intermediateValue148 = 0.0f;
#endif
                                }
                                else
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue11 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue13 = bitwiseValue11 * float(scalarValue32 & 255u);
                                    intermediateValue110 = bitwiseValue11 * float((scalarValue32 >> 8u) & 255u);
                                    intermediateValue111 = bitwiseValue11 * float((scalarValue32 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue11 = float(scalarValue32 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue13 = bitwiseValue11 * float(scalarValue32 & 255u);
                                    intermediateValue109 = bitwiseValue11 * float((scalarValue32 >> 8u) & 255u);
                                    intermediateValue110 = bitwiseValue11 * float((scalarValue32 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue47 = float(scalarValue101 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue13 = bitwiseValue47 * float(scalarValue101 & 255u);
                                    intermediateValue148 = bitwiseValue47 * float((scalarValue101 >> 8u) & 255u);
                                    intermediateValue149 = bitwiseValue47 * float((scalarValue101 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue47 = float(scalarValue101 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue13 = bitwiseValue47 * float(scalarValue101 & 255u);
                                    intermediateValue147 = bitwiseValue47 * float((scalarValue101 >> 8u) & 255u);
                                    intermediateValue148 = bitwiseValue47 * float((scalarValue101 >> 16u) & 255u);
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue5 = rdLoad_voxelBuffer(((uint(sumValue38) + bitwiseValue9) + (uint(sumValue39) << 4u)) + (uint(sumValue37) << 8u));
                                uint scalarValue33 = loadedBufferValue5.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue50 = rdLoad_voxelBuffer(((uint(sumValue59) + bitwiseValue9) + (uint(sumValue60) << 4u)) + (uint(sumValue58) << 8u));
                                uint scalarValue102 = loadedBufferValue50.x;
#endif
                                float bitwiseValue17;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue122;
                                float intermediateValue123;
                                if (scalarValue33 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue121;
                                float intermediateValue122;
                                if (scalarValue33 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue166;
                                float intermediateValue167;
                                if (scalarValue102 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue165;
                                float intermediateValue166;
                                if (scalarValue102 == 0u)
#endif
                                {
                                    bitwiseValue17 = 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue122 = 0.0f;
                                    intermediateValue123 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue121 = 0.0f;
                                    intermediateValue122 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue166 = 0.0f;
                                    intermediateValue167 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue165 = 0.0f;
                                    intermediateValue166 = 0.0f;
#endif
                                }
                                else
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue12 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue17 = bitwiseValue12 * float(scalarValue33 & 255u);
                                    intermediateValue122 = bitwiseValue12 * float((scalarValue33 >> 8u) & 255u);
                                    intermediateValue123 = bitwiseValue12 * float((scalarValue33 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue12 = float(scalarValue33 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue17 = bitwiseValue12 * float(scalarValue33 & 255u);
                                    intermediateValue121 = bitwiseValue12 * float((scalarValue33 >> 8u) & 255u);
                                    intermediateValue122 = bitwiseValue12 * float((scalarValue33 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue48 = float(scalarValue102 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue17 = bitwiseValue48 * float(scalarValue102 & 255u);
                                    intermediateValue166 = bitwiseValue48 * float((scalarValue102 >> 8u) & 255u);
                                    intermediateValue167 = bitwiseValue48 * float((scalarValue102 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue48 = float(scalarValue102 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue17 = bitwiseValue48 * float(scalarValue102 & 255u);
                                    intermediateValue165 = bitwiseValue48 * float((scalarValue102 >> 8u) & 255u);
                                    intermediateValue166 = bitwiseValue48 * float((scalarValue102 >> 16u) & 255u);
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue6 = rdLoad_voxelBuffer(((uint(sumValue41) + bitwiseValue9) + (uint(sumValue42) << 4u)) + (uint(sumValue40) << 8u));
                                uint scalarValue34 = loadedBufferValue6.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue51 = rdLoad_voxelBuffer(((uint(sumValue62) + bitwiseValue9) + (uint(sumValue63) << 4u)) + (uint(sumValue61) << 8u));
                                uint scalarValue103 = loadedBufferValue51.x;
#endif
                                float bitwiseValue21;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue141;
                                float intermediateValue142;
                                if (scalarValue34 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue140;
                                float intermediateValue141;
                                if (scalarValue34 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue192;
                                float intermediateValue193;
                                if (scalarValue103 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue191;
                                float intermediateValue192;
                                if (scalarValue103 == 0u)
#endif
                                {
                                    bitwiseValue21 = 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue141 = 0.0f;
                                    intermediateValue142 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue140 = 0.0f;
                                    intermediateValue141 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue192 = 0.0f;
                                    intermediateValue193 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue191 = 0.0f;
                                    intermediateValue192 = 0.0f;
#endif
                                }
                                else
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue14 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue21 = bitwiseValue14 * float(scalarValue34 & 255u);
                                    intermediateValue141 = bitwiseValue14 * float((scalarValue34 >> 8u) & 255u);
                                    intermediateValue142 = bitwiseValue14 * float((scalarValue34 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue7 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                                uint scalarValue35 = loadedBufferValue7.x;
                                float branchMergedValue15;
                                float branchMergedValue26;
                                float branchMergedValue27;
                                float branchMergedValue28;
                                float branchMergedValue29;
                                float branchMergedValue30;
                                float branchMergedValue31;
                                float branchMergedValue32;
                                float branchMergedValue33;
                                float branchMergedValue34;
                                float branchMergedValue44;
                                float branchMergedValue45;
                                if (scalarValue35 == 0u)
                                {
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue123;
                                    branchMergedValue27 = intermediateValue122;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue111;
                                    branchMergedValue30 = intermediateValue110;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = 0.0f;
                                    branchMergedValue33 = 0.0f;
                                    branchMergedValue34 = 0.0f;
                                    branchMergedValue44 = intermediateValue142;
                                    branchMergedValue45 = intermediateValue141;
                                }
                                else
                                {
                                    float bitwiseValue16 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue123;
                                    branchMergedValue27 = intermediateValue122;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue111;
                                    branchMergedValue30 = intermediateValue110;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = bitwiseValue16 * float((scalarValue35 >> 16u) & 255u);
                                    branchMergedValue33 = bitwiseValue16 * float((scalarValue35 >> 8u) & 255u);
                                    branchMergedValue34 = bitwiseValue16 * float(scalarValue35 & 255u);
                                    branchMergedValue44 = intermediateValue142;
                                    branchMergedValue45 = intermediateValue141;
                                }
                                intermediateValue156 = branchMergedValue31;
                                intermediateValue157 = branchMergedValue30;
                                intermediateValue158 = branchMergedValue29;
                                intermediateValue159 = branchMergedValue28;
                                intermediateValue161 = branchMergedValue27;
                                intermediateValue163 = branchMergedValue26;
                                intermediateValue165 = branchMergedValue15;
                                intermediateValue167 = branchMergedValue45;
                                intermediateValue169 = branchMergedValue44;
                                intermediateValue171 = branchMergedValue34;
                                intermediateValue172 = branchMergedValue33;
                                intermediateValue173 = branchMergedValue32;
                                break;
                            }
                            else
                            {
                                float intermediateValue125;
                                float intermediateValue126;
                                float intermediateValue127;
                                float sumValue66;
                                float sumValue67;
                                float sumValue68;
                                uint comparisonValue23;
                                bool comparisonValue24;
                                for (;;)
                                {
                                    sumValue66 = productValue128 + productValue92;
                                    sumValue67 = productValue129 + productValue93;
                                    sumValue68 = productValue130 + productValue94;
                                    uint comparisonValue30 = ((((uint(productValue128 >= 16.0f) << 1u) | uint(productValue128 < 0.0f)) | (uint(productValue129 < 0.0f) << 2u)) | (uint(productValue129 >= 16.0f) << 3u)) | (uint(productValue130 < 0.0f) << 4u);
                                    comparisonValue23 = intermediateValue[comparisonValue30 | (uint(productValue130 >= 16.0f) << 5u)];
                                    comparisonValue24 = ((((comparisonValue30 | (uint(productValue130 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue30 & 31u))) == 0u;
                                    uint loadedBufferValue8;
                                    if (comparisonValue24)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                        {
                                            intermediateValue125 = 0.0f;
                                            intermediateValue126 = 0.0f;
                                            intermediateValue127 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue8 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue23).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue8 = ((((uint(productValue130) << 4u) & 240u) | (uint(productValue129) & 15u)) | ((uint(productValue128) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                    uint scalarValue36 = loadedBufferValue9.x;
                                    if (scalarValue36 == 0u)
                                    {
                                        intermediateValue125 = 0.0f;
                                        intermediateValue126 = 0.0f;
                                        intermediateValue127 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue18 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue125 = bitwiseValue18 * float(scalarValue36 & 255u);
                                    intermediateValue126 = bitwiseValue18 * float((scalarValue36 >> 8u) & 255u);
                                    intermediateValue127 = bitwiseValue18 * float((scalarValue36 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue160;
                                float intermediateValue162;
                                float intermediateValue164;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue35;
                                bool comparisonValue36;
                                for (;;)
                                {
                                    sumValue87 = sumValue37 + productValue92;
                                    sumValue88 = sumValue38 + productValue93;
                                    sumValue89 = sumValue39 + productValue94;
                                    uint comparisonValue34 = ((((uint(sumValue37 >= 16.0f) << 1u) | uint(sumValue37 < 0.0f)) | (uint(sumValue38 < 0.0f) << 2u)) | (uint(sumValue38 >= 16.0f) << 3u)) | (uint(sumValue39 < 0.0f) << 4u);
                                    comparisonValue35 = intermediateValue[comparisonValue34 | (uint(sumValue39 >= 16.0f) << 5u)];
                                    comparisonValue36 = ((((comparisonValue34 | (uint(sumValue39 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue34 & 31u))) == 0u;
                                    uint loadedBufferValue15;
                                    if (comparisonValue36)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue35 & 31u))) == 0u)
                                        {
                                            intermediateValue160 = 0.0f;
                                            intermediateValue162 = 0.0f;
                                            intermediateValue164 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue15 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue35).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue15 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                    uint scalarValue37 = loadedBufferValue12.x;
                                    if (scalarValue37 == 0u)
                                    {
                                        intermediateValue160 = 0.0f;
                                        intermediateValue162 = 0.0f;
                                        intermediateValue164 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue20 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue160 = bitwiseValue20 * float(scalarValue37 & 255u);
                                    intermediateValue162 = bitwiseValue20 * float((scalarValue37 >> 8u) & 255u);
                                    intermediateValue164 = bitwiseValue20 * float((scalarValue37 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue166;
                                float intermediateValue168;
                                float intermediateValue170;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                uint comparisonValue45;
                                bool comparisonValue46;
                                for (;;)
                                {
                                    sumValue96 = sumValue40 + productValue92;
                                    sumValue97 = sumValue41 + productValue93;
                                    sumValue98 = sumValue42 + productValue94;
                                    uint comparisonValue37 = ((((uint(sumValue40 >= 16.0f) << 1u) | uint(sumValue40 < 0.0f)) | (uint(sumValue41 < 0.0f) << 2u)) | (uint(sumValue41 >= 16.0f) << 3u)) | (uint(sumValue42 < 0.0f) << 4u);
                                    comparisonValue45 = intermediateValue[comparisonValue37 | (uint(sumValue42 >= 16.0f) << 5u)];
                                    comparisonValue46 = ((((comparisonValue37 | (uint(sumValue42 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue37 & 31u))) == 0u;
                                    uint loadedBufferValue19;
                                    if (comparisonValue46)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                        {
                                            intermediateValue166 = 0.0f;
                                            intermediateValue168 = 0.0f;
                                            intermediateValue170 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue19 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue45).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue19 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                    uint scalarValue38 = loadedBufferValue14.x;
                                    if (scalarValue38 == 0u)
                                    {
                                        intermediateValue166 = 0.0f;
                                        intermediateValue168 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue22 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue166 = bitwiseValue22 * float(scalarValue38 & 255u);
                                    intermediateValue168 = bitwiseValue22 * float((scalarValue38 >> 8u) & 255u);
                                    intermediateValue170 = bitwiseValue22 * float((scalarValue38 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue50 = sumValue43 + productValue92;
                                float sumValue51 = sumValue44 + productValue93;
                                float sumValue69 = sumValue45 + productValue94;
                                uint comparisonValue40 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                                uint comparisonValue47 = comparisonValue40 | (uint(sumValue45 >= 16.0f) << 5u);
                                uint loadedBufferValue23;
                                if ((((comparisonValue47 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue40 & 31u))) == 0u)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue47] & 31u))) == 0u)
                                    {
                                        intermediateValue156 = intermediateValue125;
                                        intermediateValue157 = intermediateValue126;
                                        intermediateValue158 = intermediateValue127;
                                        intermediateValue159 = intermediateValue160;
                                        intermediateValue161 = intermediateValue162;
                                        intermediateValue163 = intermediateValue164;
                                        intermediateValue165 = intermediateValue166;
                                        intermediateValue167 = intermediateValue168;
                                        intermediateValue169 = intermediateValue170;
                                        intermediateValue171 = 0.0f;
                                        intermediateValue172 = 0.0f;
                                        intermediateValue173 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue23 = ((((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue47]).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue23 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                                uint scalarValue39 = loadedBufferValue16.x;
                                if (scalarValue39 == 0u)
                                {
                                    intermediateValue156 = intermediateValue125;
                                    intermediateValue157 = intermediateValue126;
                                    intermediateValue158 = intermediateValue127;
                                    intermediateValue159 = intermediateValue160;
                                    intermediateValue161 = intermediateValue162;
                                    intermediateValue163 = intermediateValue164;
                                    intermediateValue165 = intermediateValue166;
                                    intermediateValue167 = intermediateValue168;
                                    intermediateValue169 = intermediateValue170;
                                    intermediateValue171 = 0.0f;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                    break;
                                }
                                float bitwiseValue23 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue156 = intermediateValue125;
                                intermediateValue157 = intermediateValue126;
                                intermediateValue158 = intermediateValue127;
                                intermediateValue159 = intermediateValue160;
                                intermediateValue161 = intermediateValue162;
                                intermediateValue163 = intermediateValue164;
                                intermediateValue165 = intermediateValue166;
                                intermediateValue167 = intermediateValue168;
                                intermediateValue169 = intermediateValue170;
                                intermediateValue171 = bitwiseValue23 * float(scalarValue39 & 255u);
                                intermediateValue172 = bitwiseValue23 * float((scalarValue39 >> 8u) & 255u);
                                intermediateValue173 = bitwiseValue23 * float((scalarValue39 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue48 = (((intermediateValue159 * productValue132) + (intermediateValue156 * productValue131)) + (intermediateValue165 * productValue133)) + (intermediateValue171 * productValue134);
                        branchMergedValue50 = (((intermediateValue163 * productValue132) + (intermediateValue158 * productValue131)) + (intermediateValue169 * productValue133)) + (intermediateValue173 * productValue134);
                        branchMergedValue51 = (((intermediateValue161 * productValue132) + (intermediateValue157 * productValue131)) + (intermediateValue167 * productValue133)) + (intermediateValue172 * productValue134);
                    }
                    else
                    {
                        float intermediateValue175;
                        float intermediateValue176;
                        float intermediateValue177;
                        float intermediateValue178;
                        float intermediateValue180;
                        float intermediateValue182;
                        float intermediateValue184;
                        float intermediateValue186;
                        float intermediateValue188;
                        float intermediateValue190;
                        float intermediateValue191;
                        float intermediateValue192;
                        float intermediateValue76;
                        float intermediateValue77;
                        float intermediateValue78;
                        uint intermediateValue79;
                        uint intermediateValue80;
                        uint intermediateValue81;
                        float intermediateValue84;
                        float sumValue53;
                        float sumValue54;
                        float sumValue55;
                        float sumValue56;
                        float sumValue57;
                        float sumValue58;
                        bool comparisonValue17;
                        uint productValue135;
                        uint productValue136;
                        uint productValue137;
                        uint productValue138;
                        uint productValue139;
                        uint productValue140;
                        for (;;)
                        {
                            intermediateValue76 = floor(sumValue32);
                            intermediateValue77 = floor(sumValue33);
                            intermediateValue78 = floor(sumValue34);
                            float sumValue80 = sumValue32 - intermediateValue76;
                            float sumValue81 = sumValue33 - intermediateValue77;
                            float sumValue82 = sumValue34 - intermediateValue78;
                            uint comparisonValue50 = ((uint(sumValue81 >= sumValue82) << 1u) | uint(sumValue80 >= sumValue81)) | (uint(sumValue80 >= sumValue82) << 2u);
                            intermediateValue79 = uint(intermediateValue76);
                            intermediateValue80 = uint(intermediateValue77);
                            intermediateValue81 = uint(intermediateValue78);
                            float scalarValue40 = min(sumValue80, sumValue81);
                            float scalarValue41 = max(sumValue80, sumValue81);
                            intermediateValue84 = min(scalarValue40, sumValue82);
                            float scalarValue42 = max(scalarValue41, sumValue82);
                            float scalarValue43 = max(min(scalarValue41, sumValue82), scalarValue40);
                            sumValue53 = 1.0f - scalarValue42;
                            sumValue54 = scalarValue42 - scalarValue43;
                            sumValue55 = scalarValue43 - intermediateValue84;
                            sumValue56 = intermediateValue76 + 1.0f;
                            sumValue57 = intermediateValue77 + 1.0f;
                            sumValue58 = intermediateValue78 + 1.0f;
                            comparisonValue17 = (((intermediateValue76 >= 0.0f) && (intermediateValue77 >= 0.0f)) && (intermediateValue78 >= 0.0f)) && (((sumValue56 < 16.0f) && (sumValue57 < 16.0f)) && (sumValue58 < 16.0f));
                            productValue135 = 0u + (comparisonValue50 * 3u);
                            productValue136 = 1u + (comparisonValue50 * 3u);
                            productValue137 = 2u + (comparisonValue50 * 3u);
                            productValue138 = 0u + (comparisonValue50 * 3u);
                            productValue139 = 1u + (comparisonValue50 * 3u);
                            productValue140 = 2u + (comparisonValue50 * 3u);
                            if (comparisonValue17)
                            {
                                uint bitwiseValue25 = intermediateValue81 << 4u;
                                uint sumValue83 = intermediateValue80 + bitwiseValue9;
                                uint bitwiseValue26 = sumValue83 + (intermediateValue79 << 8u);
                                uint4 loadedBufferValue18 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                                uint scalarValue44 = loadedBufferValue18.x;
                                float bitwiseValue15;
                                float intermediateValue113;
                                float intermediateValue114;
                                if (scalarValue44 == 0u)
                                {
                                    bitwiseValue15 = 0.0f;
                                    intermediateValue113 = 0.0f;
                                    intermediateValue114 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue27 = float(scalarValue44 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue15 = bitwiseValue27 * float(scalarValue44 & 255u);
                                    intermediateValue113 = bitwiseValue27 * float((scalarValue44 >> 8u) & 255u);
                                    intermediateValue114 = bitwiseValue27 * float((scalarValue44 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue20 = rdLoad_voxelBuffer(((intermediateValue1[productValue136] + sumValue83) + ((intermediateValue1[productValue135] + intermediateValue79) << 8u)) + ((intermediateValue1[productValue137] + intermediateValue81) << 4u));
                                uint scalarValue45 = loadedBufferValue20.x;
                                float bitwiseValue19;
                                float intermediateValue129;
                                float intermediateValue130;
                                if (scalarValue45 == 0u)
                                {
                                    bitwiseValue19 = 0.0f;
                                    intermediateValue129 = 0.0f;
                                    intermediateValue130 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue28 = float(scalarValue45 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue19 = bitwiseValue28 * float(scalarValue45 & 255u);
                                    intermediateValue129 = bitwiseValue28 * float((scalarValue45 >> 8u) & 255u);
                                    intermediateValue130 = bitwiseValue28 * float((scalarValue45 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue22 = rdLoad_voxelBuffer(((intermediateValue2[productValue139] + sumValue83) + ((intermediateValue2[productValue138] + intermediateValue79) << 8u)) + ((intermediateValue2[productValue140] + intermediateValue81) << 4u));
                                uint scalarValue46 = loadedBufferValue22.x;
                                float bitwiseValue24;
                                float intermediateValue144;
                                float intermediateValue145;
                                if (scalarValue46 == 0u)
                                {
                                    bitwiseValue24 = 0.0f;
                                    intermediateValue144 = 0.0f;
                                    intermediateValue145 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue29 = float(scalarValue46 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue24 = bitwiseValue29 * float(scalarValue46 & 255u);
                                    intermediateValue144 = bitwiseValue29 * float((scalarValue46 >> 8u) & 255u);
                                    intermediateValue145 = bitwiseValue29 * float((scalarValue46 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue27 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                                uint scalarValue47 = loadedBufferValue27.x;
                                float branchMergedValue16;
                                float branchMergedValue35;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue14 = float(scalarValue34 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue21 = bitwiseValue14 * float(scalarValue34 & 255u);
                                    intermediateValue140 = bitwiseValue14 * float((scalarValue34 >> 8u) & 255u);
                                    intermediateValue141 = bitwiseValue14 * float((scalarValue34 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue7 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                                uint scalarValue35 = loadedBufferValue7.x;
                                float branchMergedValue15;
                                float branchMergedValue26;
                                float branchMergedValue27;
                                float branchMergedValue28;
                                float branchMergedValue29;
                                float branchMergedValue30;
                                float branchMergedValue31;
                                float branchMergedValue32;
                                float branchMergedValue33;
                                float branchMergedValue34;
                                float branchMergedValue44;
                                float branchMergedValue45;
                                if (scalarValue35 == 0u)
                                {
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue122;
                                    branchMergedValue27 = intermediateValue121;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue110;
                                    branchMergedValue30 = intermediateValue109;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = 0.0f;
                                    branchMergedValue33 = 0.0f;
                                    branchMergedValue34 = 0.0f;
                                    branchMergedValue44 = intermediateValue141;
                                    branchMergedValue45 = intermediateValue140;
                                }
                                else
                                {
                                    float bitwiseValue16 = float(scalarValue35 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue15 = bitwiseValue21;
                                    branchMergedValue26 = intermediateValue122;
                                    branchMergedValue27 = intermediateValue121;
                                    branchMergedValue28 = bitwiseValue17;
                                    branchMergedValue29 = intermediateValue110;
                                    branchMergedValue30 = intermediateValue109;
                                    branchMergedValue31 = bitwiseValue13;
                                    branchMergedValue32 = bitwiseValue16 * float((scalarValue35 >> 16u) & 255u);
                                    branchMergedValue33 = bitwiseValue16 * float((scalarValue35 >> 8u) & 255u);
                                    branchMergedValue34 = bitwiseValue16 * float(scalarValue35 & 255u);
                                    branchMergedValue44 = intermediateValue141;
                                    branchMergedValue45 = intermediateValue140;
                                }
                                intermediateValue155 = branchMergedValue31;
                                intermediateValue156 = branchMergedValue30;
                                intermediateValue157 = branchMergedValue29;
                                intermediateValue158 = branchMergedValue28;
                                intermediateValue160 = branchMergedValue27;
                                intermediateValue162 = branchMergedValue26;
                                intermediateValue164 = branchMergedValue15;
                                intermediateValue166 = branchMergedValue45;
                                intermediateValue168 = branchMergedValue44;
                                intermediateValue170 = branchMergedValue34;
                                intermediateValue171 = branchMergedValue33;
                                intermediateValue172 = branchMergedValue32;
                                break;
                            }
                            else
                            {
                                float intermediateValue124;
                                float intermediateValue125;
                                float intermediateValue126;
                                float sumValue66;
                                float sumValue67;
                                float sumValue68;
                                uint comparisonValue23;
                                bool comparisonValue24;
                                for (;;)
                                {
                                    sumValue66 = productValue128 + productValue92;
                                    sumValue67 = productValue129 + productValue93;
                                    sumValue68 = productValue130 + productValue94;
                                    uint comparisonValue30 = ((((uint(productValue128 >= 16.0f) << 1u) | uint(productValue128 < 0.0f)) | (uint(productValue129 < 0.0f) << 2u)) | (uint(productValue129 >= 16.0f) << 3u)) | (uint(productValue130 < 0.0f) << 4u);
                                    comparisonValue23 = intermediateValue[comparisonValue30 | (uint(productValue130 >= 16.0f) << 5u)];
                                    comparisonValue24 = ((((comparisonValue30 | (uint(productValue130 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue30 & 31u))) == 0u;
                                    uint loadedBufferValue8;
                                    if (comparisonValue24)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue23 & 31u))) == 0u)
                                        {
                                            intermediateValue124 = 0.0f;
                                            intermediateValue125 = 0.0f;
                                            intermediateValue126 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue8 = ((((uint(sumValue66 - (floor(sumValue66 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue67 - (floor(sumValue67 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue68 - (floor(sumValue68 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue23).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue8 = ((((uint(productValue130) << 4u) & 240u) | (uint(productValue129) & 15u)) | ((uint(productValue128) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue9 = rdLoad_voxelBuffer(loadedBufferValue8);
                                    uint scalarValue36 = loadedBufferValue9.x;
                                    if (scalarValue36 == 0u)
                                    {
                                        intermediateValue124 = 0.0f;
                                        intermediateValue125 = 0.0f;
                                        intermediateValue126 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue18 = float(scalarValue36 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue124 = bitwiseValue18 * float(scalarValue36 & 255u);
                                    intermediateValue125 = bitwiseValue18 * float((scalarValue36 >> 8u) & 255u);
                                    intermediateValue126 = bitwiseValue18 * float((scalarValue36 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue159;
                                float intermediateValue161;
                                float intermediateValue163;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue35;
                                bool comparisonValue36;
                                for (;;)
                                {
                                    sumValue87 = sumValue37 + productValue92;
                                    sumValue88 = sumValue38 + productValue93;
                                    sumValue89 = sumValue39 + productValue94;
                                    uint comparisonValue34 = ((((uint(sumValue37 >= 16.0f) << 1u) | uint(sumValue37 < 0.0f)) | (uint(sumValue38 < 0.0f) << 2u)) | (uint(sumValue38 >= 16.0f) << 3u)) | (uint(sumValue39 < 0.0f) << 4u);
                                    comparisonValue35 = intermediateValue[comparisonValue34 | (uint(sumValue39 >= 16.0f) << 5u)];
                                    comparisonValue36 = ((((comparisonValue34 | (uint(sumValue39 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue34 & 31u))) == 0u;
                                    uint loadedBufferValue15;
                                    if (comparisonValue36)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue35 & 31u))) == 0u)
                                        {
                                            intermediateValue159 = 0.0f;
                                            intermediateValue161 = 0.0f;
                                            intermediateValue163 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue15 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue35).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue15 = ((((uint(sumValue39) << 4u) & 240u) | (uint(sumValue38) & 15u)) | ((uint(sumValue37) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue12 = rdLoad_voxelBuffer(loadedBufferValue15);
                                    uint scalarValue37 = loadedBufferValue12.x;
                                    if (scalarValue37 == 0u)
                                    {
                                        intermediateValue159 = 0.0f;
                                        intermediateValue161 = 0.0f;
                                        intermediateValue163 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue20 = float(scalarValue37 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue159 = bitwiseValue20 * float(scalarValue37 & 255u);
                                    intermediateValue161 = bitwiseValue20 * float((scalarValue37 >> 8u) & 255u);
                                    intermediateValue163 = bitwiseValue20 * float((scalarValue37 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue165;
                                float intermediateValue167;
                                float intermediateValue169;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                uint comparisonValue45;
                                bool comparisonValue46;
                                for (;;)
                                {
                                    sumValue96 = sumValue40 + productValue92;
                                    sumValue97 = sumValue41 + productValue93;
                                    sumValue98 = sumValue42 + productValue94;
                                    uint comparisonValue37 = ((((uint(sumValue40 >= 16.0f) << 1u) | uint(sumValue40 < 0.0f)) | (uint(sumValue41 < 0.0f) << 2u)) | (uint(sumValue41 >= 16.0f) << 3u)) | (uint(sumValue42 < 0.0f) << 4u);
                                    comparisonValue45 = intermediateValue[comparisonValue37 | (uint(sumValue42 >= 16.0f) << 5u)];
                                    comparisonValue46 = ((((comparisonValue37 | (uint(sumValue42 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue37 & 31u))) == 0u;
                                    uint loadedBufferValue19;
                                    if (comparisonValue46)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue45 & 31u))) == 0u)
                                        {
                                            intermediateValue165 = 0.0f;
                                            intermediateValue167 = 0.0f;
                                            intermediateValue169 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue19 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue45).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue19 = ((((uint(sumValue42) << 4u) & 240u) | (uint(sumValue41) & 15u)) | ((uint(sumValue40) << 8u) & 3840u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue14 = rdLoad_voxelBuffer(loadedBufferValue19);
                                    uint scalarValue38 = loadedBufferValue14.x;
                                    if (scalarValue38 == 0u)
                                    {
                                        intermediateValue165 = 0.0f;
                                        intermediateValue167 = 0.0f;
                                        intermediateValue169 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue22 = float(scalarValue38 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue165 = bitwiseValue22 * float(scalarValue38 & 255u);
                                    intermediateValue167 = bitwiseValue22 * float((scalarValue38 >> 8u) & 255u);
                                    intermediateValue169 = bitwiseValue22 * float((scalarValue38 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue50 = sumValue43 + productValue92;
                                float sumValue51 = sumValue44 + productValue93;
                                float sumValue69 = sumValue45 + productValue94;
                                uint comparisonValue40 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                                uint comparisonValue47 = comparisonValue40 | (uint(sumValue45 >= 16.0f) << 5u);
                                uint loadedBufferValue23;
                                if ((((comparisonValue47 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue40 & 31u))) == 0u)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue47] & 31u))) == 0u)
                                    {
                                        intermediateValue155 = intermediateValue124;
                                        intermediateValue156 = intermediateValue125;
                                        intermediateValue157 = intermediateValue126;
                                        intermediateValue158 = intermediateValue159;
                                        intermediateValue160 = intermediateValue161;
                                        intermediateValue162 = intermediateValue163;
                                        intermediateValue164 = intermediateValue165;
                                        intermediateValue166 = intermediateValue167;
                                        intermediateValue168 = intermediateValue169;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
                                        intermediateValue172 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue23 = ((((uint(sumValue50 - (floor(sumValue50 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue51 - (floor(sumValue51 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue69 - (floor(sumValue69 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue47]).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue23 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue16 = rdLoad_voxelBuffer(loadedBufferValue23);
                                uint scalarValue39 = loadedBufferValue16.x;
                                if (scalarValue39 == 0u)
                                {
                                    intermediateValue155 = intermediateValue124;
                                    intermediateValue156 = intermediateValue125;
                                    intermediateValue157 = intermediateValue126;
                                    intermediateValue158 = intermediateValue159;
                                    intermediateValue160 = intermediateValue161;
                                    intermediateValue162 = intermediateValue163;
                                    intermediateValue164 = intermediateValue165;
                                    intermediateValue166 = intermediateValue167;
                                    intermediateValue168 = intermediateValue169;
                                    intermediateValue170 = 0.0f;
                                    intermediateValue171 = 0.0f;
                                    intermediateValue172 = 0.0f;
                                    break;
                                }
                                float bitwiseValue23 = float(scalarValue39 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue155 = intermediateValue124;
                                intermediateValue156 = intermediateValue125;
                                intermediateValue157 = intermediateValue126;
                                intermediateValue158 = intermediateValue159;
                                intermediateValue160 = intermediateValue161;
                                intermediateValue162 = intermediateValue163;
                                intermediateValue164 = intermediateValue165;
                                intermediateValue166 = intermediateValue167;
                                intermediateValue168 = intermediateValue169;
                                intermediateValue170 = bitwiseValue23 * float(scalarValue39 & 255u);
                                intermediateValue171 = bitwiseValue23 * float((scalarValue39 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue23 * float((scalarValue39 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue48 = (((intermediateValue158 * productValue132) + (intermediateValue155 * productValue131)) + (intermediateValue164 * productValue133)) + (intermediateValue170 * productValue134);
                        branchMergedValue50 = (((intermediateValue162 * productValue132) + (intermediateValue157 * productValue131)) + (intermediateValue168 * productValue133)) + (intermediateValue172 * productValue134);
                        branchMergedValue51 = (((intermediateValue160 * productValue132) + (intermediateValue156 * productValue131)) + (intermediateValue166 * productValue133)) + (intermediateValue171 * productValue134);
                    }
                    else
                    {
                        float intermediateValue174;
                        float intermediateValue175;
                        float intermediateValue176;
                        float intermediateValue177;
                        float intermediateValue179;
                        float intermediateValue181;
                        float intermediateValue183;
                        float intermediateValue185;
                        float intermediateValue187;
                        float intermediateValue189;
                        float intermediateValue190;
                        float intermediateValue191;
                        float intermediateValue75;
                        float intermediateValue76;
                        float intermediateValue77;
                        uint intermediateValue78;
                        uint intermediateValue79;
                        uint intermediateValue80;
                        float intermediateValue83;
                        float sumValue53;
                        float sumValue54;
                        float sumValue55;
                        float sumValue56;
                        float sumValue57;
                        float sumValue58;
                        bool comparisonValue17;
                        uint productValue135;
                        uint productValue136;
                        uint productValue137;
                        uint productValue138;
                        uint productValue139;
                        uint productValue140;
                        for (;;)
                        {
                            intermediateValue75 = floor(sumValue32);
                            intermediateValue76 = floor(sumValue33);
                            intermediateValue77 = floor(sumValue34);
                            float sumValue134 = sumValue32 - intermediateValue75;
                            float sumValue135 = sumValue33 - intermediateValue76;
                            float sumValue136 = sumValue34 - intermediateValue77;
                            uint comparisonValue73 = ((uint(sumValue135 >= sumValue136) << 1u) | uint(sumValue134 >= sumValue135)) | (uint(sumValue134 >= sumValue136) << 2u);
                            intermediateValue78 = uint(intermediateValue75);
                            intermediateValue79 = uint(intermediateValue76);
                            intermediateValue80 = uint(intermediateValue77);
                            float scalarValue71 = min(sumValue134, sumValue135);
                            float scalarValue72 = max(sumValue134, sumValue135);
                            intermediateValue83 = min(scalarValue71, sumValue136);
                            float scalarValue73 = max(scalarValue72, sumValue136);
                            float scalarValue74 = max(min(scalarValue72, sumValue136), scalarValue71);
                            sumValue53 = 1.0f - scalarValue73;
                            sumValue54 = scalarValue73 - scalarValue74;
                            sumValue55 = scalarValue74 - intermediateValue83;
                            sumValue56 = intermediateValue75 + 1.0f;
                            sumValue57 = intermediateValue76 + 1.0f;
                            sumValue58 = intermediateValue77 + 1.0f;
                            comparisonValue17 = (((intermediateValue75 >= 0.0f) && (intermediateValue76 >= 0.0f)) && (intermediateValue77 >= 0.0f)) && (((sumValue56 < 16.0f) && (sumValue57 < 16.0f)) && (sumValue58 < 16.0f));
                            productValue135 = 0u + (comparisonValue73 * 3u);
                            productValue136 = 1u + (comparisonValue73 * 3u);
                            productValue137 = 2u + (comparisonValue73 * 3u);
                            productValue138 = 0u + (comparisonValue73 * 3u);
                            productValue139 = 1u + (comparisonValue73 * 3u);
                            productValue140 = 2u + (comparisonValue73 * 3u);
                            if (comparisonValue17)
                            {
                                uint bitwiseValue35 = intermediateValue80 << 4u;
                                uint sumValue137 = intermediateValue79 + bitwiseValue9;
                                uint bitwiseValue36 = sumValue137 + (intermediateValue78 << 8u);
                                uint4 loadedBufferValue36 = rdLoad_voxelBuffer(bitwiseValue36 + bitwiseValue35);
                                uint scalarValue75 = loadedBufferValue36.x;
                                float bitwiseValue15;
                                float intermediateValue112;
                                float intermediateValue113;
                                if (scalarValue75 == 0u)
                                {
                                    bitwiseValue15 = 0.0f;
                                    intermediateValue112 = 0.0f;
                                    intermediateValue113 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue37 = float(scalarValue75 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue15 = bitwiseValue37 * float(scalarValue75 & 255u);
                                    intermediateValue112 = bitwiseValue37 * float((scalarValue75 >> 8u) & 255u);
                                    intermediateValue113 = bitwiseValue37 * float((scalarValue75 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue37 = rdLoad_voxelBuffer(((intermediateValue1[productValue136] + sumValue137) + ((intermediateValue1[productValue135] + intermediateValue78) << 8u)) + ((intermediateValue1[productValue137] + intermediateValue80) << 4u));
                                uint scalarValue76 = loadedBufferValue37.x;
                                float bitwiseValue19;
                                float intermediateValue128;
                                float intermediateValue129;
                                if (scalarValue76 == 0u)
                                {
                                    bitwiseValue19 = 0.0f;
                                    intermediateValue128 = 0.0f;
                                    intermediateValue129 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue38 = float(scalarValue76 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue19 = bitwiseValue38 * float(scalarValue76 & 255u);
                                    intermediateValue128 = bitwiseValue38 * float((scalarValue76 >> 8u) & 255u);
                                    intermediateValue129 = bitwiseValue38 * float((scalarValue76 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue38 = rdLoad_voxelBuffer(((intermediateValue2[productValue139] + sumValue137) + ((intermediateValue2[productValue138] + intermediateValue78) << 8u)) + ((intermediateValue2[productValue140] + intermediateValue80) << 4u));
                                uint scalarValue77 = loadedBufferValue38.x;
                                float bitwiseValue24;
                                float intermediateValue143;
                                float intermediateValue144;
                                if (scalarValue77 == 0u)
                                {
                                    bitwiseValue24 = 0.0f;
                                    intermediateValue143 = 0.0f;
                                    intermediateValue144 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue39 = float(scalarValue77 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue24 = bitwiseValue39 * float(scalarValue77 & 255u);
                                    intermediateValue143 = bitwiseValue39 * float((scalarValue77 >> 8u) & 255u);
                                    intermediateValue144 = bitwiseValue39 * float((scalarValue77 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue39 = rdLoad_voxelBuffer((bitwiseValue36 + 273u) + bitwiseValue35);
                                uint scalarValue78 = loadedBufferValue39.x;
                                float branchMergedValue16;
                                float branchMergedValue35;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue49 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue21 = bitwiseValue49 * float(scalarValue103 & 255u);
                                    intermediateValue192 = bitwiseValue49 * float((scalarValue103 >> 8u) & 255u);
                                    intermediateValue193 = bitwiseValue49 * float((scalarValue103 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue52 = rdLoad_voxelBuffer(((uint(sumValue65) + bitwiseValue9) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u));
                                uint scalarValue104 = loadedBufferValue52.x;
                                float branchMergedValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue49 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue21 = bitwiseValue49 * float(scalarValue103 & 255u);
                                    intermediateValue191 = bitwiseValue49 * float((scalarValue103 >> 8u) & 255u);
                                    intermediateValue192 = bitwiseValue49 * float((scalarValue103 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue52 = rdLoad_voxelBuffer(((uint(sumValue65) + bitwiseValue9) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u));
                                uint scalarValue104 = loadedBufferValue52.x;
                                float branchMergedValue22;
#endif
                                float branchMergedValue36;
                                float branchMergedValue37;
                                float branchMergedValue38;
                                float branchMergedValue39;
                                float branchMergedValue40;
                                float branchMergedValue41;
                                float branchMergedValue42;
                                float branchMergedValue43;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float branchMergedValue46;
                                float branchMergedValue47;
                                if (scalarValue47 == 0u)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float branchMergedValue46;
                                float branchMergedValue47;
                                if (scalarValue78 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float branchMergedValue44;
                                float branchMergedValue60;
                                float branchMergedValue61;
                                if (scalarValue104 == 0u)
#endif
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    branchMergedValue16 = intermediateValue130;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue144;
                                    branchMergedValue37 = intermediateValue145;
                                    branchMergedValue38 = 0.0f;
                                    branchMergedValue39 = 0.0f;
                                    branchMergedValue40 = 0.0f;
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue113;
                                    branchMergedValue43 = intermediateValue114;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue129;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    branchMergedValue16 = intermediateValue129;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue143;
                                    branchMergedValue37 = intermediateValue144;
                                    branchMergedValue38 = 0.0f;
                                    branchMergedValue39 = 0.0f;
                                    branchMergedValue40 = 0.0f;
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue112;
                                    branchMergedValue43 = intermediateValue113;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue128;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    branchMergedValue22 = 0.0f;
                                    branchMergedValue36 = 0.0f;
                                    branchMergedValue37 = 0.0f;
                                    branchMergedValue38 = intermediateValue193;
                                    branchMergedValue39 = intermediateValue192;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue167;
                                    branchMergedValue42 = intermediateValue166;
                                    branchMergedValue43 = intermediateValue149;
                                    branchMergedValue44 = intermediateValue148;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    branchMergedValue22 = 0.0f;
                                    branchMergedValue36 = 0.0f;
                                    branchMergedValue37 = 0.0f;
                                    branchMergedValue38 = intermediateValue192;
                                    branchMergedValue39 = intermediateValue191;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue166;
                                    branchMergedValue42 = intermediateValue165;
                                    branchMergedValue43 = intermediateValue148;
                                    branchMergedValue44 = intermediateValue147;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
#endif
                                }
                                else
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue30 = float(scalarValue47 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue16 = intermediateValue130;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue144;
                                    branchMergedValue37 = intermediateValue145;
                                    branchMergedValue38 = bitwiseValue30 * float(scalarValue47 & 255u);
                                    branchMergedValue39 = bitwiseValue30 * float((scalarValue47 >> 8u) & 255u);
                                    branchMergedValue40 = bitwiseValue30 * float((scalarValue47 >> 16u) & 255u);
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue113;
                                    branchMergedValue43 = intermediateValue114;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue129;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue40 = float(scalarValue78 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue16 = intermediateValue129;
                                    branchMergedValue35 = bitwiseValue24;
                                    branchMergedValue36 = intermediateValue143;
                                    branchMergedValue37 = intermediateValue144;
                                    branchMergedValue38 = bitwiseValue40 * float(scalarValue78 & 255u);
                                    branchMergedValue39 = bitwiseValue40 * float((scalarValue78 >> 8u) & 255u);
                                    branchMergedValue40 = bitwiseValue40 * float((scalarValue78 >> 16u) & 255u);
                                    branchMergedValue41 = bitwiseValue15;
                                    branchMergedValue42 = intermediateValue112;
                                    branchMergedValue43 = intermediateValue113;
                                    branchMergedValue46 = bitwiseValue19;
                                    branchMergedValue47 = intermediateValue128;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue50 = float(scalarValue104 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue22 = bitwiseValue50 * float((scalarValue104 >> 16u) & 255u);
                                    branchMergedValue36 = bitwiseValue50 * float((scalarValue104 >> 8u) & 255u);
                                    branchMergedValue37 = bitwiseValue50 * float(scalarValue104 & 255u);
                                    branchMergedValue38 = intermediateValue193;
                                    branchMergedValue39 = intermediateValue192;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue167;
                                    branchMergedValue42 = intermediateValue166;
                                    branchMergedValue43 = intermediateValue149;
                                    branchMergedValue44 = intermediateValue148;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue50 = float(scalarValue104 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue22 = bitwiseValue50 * float((scalarValue104 >> 16u) & 255u);
                                    branchMergedValue36 = bitwiseValue50 * float((scalarValue104 >> 8u) & 255u);
                                    branchMergedValue37 = bitwiseValue50 * float(scalarValue104 & 255u);
                                    branchMergedValue38 = intermediateValue192;
                                    branchMergedValue39 = intermediateValue191;
                                    branchMergedValue40 = bitwiseValue21;
                                    branchMergedValue41 = intermediateValue166;
                                    branchMergedValue42 = intermediateValue165;
                                    branchMergedValue43 = intermediateValue148;
                                    branchMergedValue44 = intermediateValue147;
                                    branchMergedValue60 = bitwiseValue13;
                                    branchMergedValue61 = bitwiseValue17;
#endif
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue175 = branchMergedValue41;
                                intermediateValue176 = branchMergedValue42;
                                intermediateValue177 = branchMergedValue43;
                                intermediateValue178 = branchMergedValue46;
                                intermediateValue180 = branchMergedValue47;
                                intermediateValue182 = branchMergedValue16;
                                intermediateValue184 = branchMergedValue35;
                                intermediateValue186 = branchMergedValue36;
                                intermediateValue188 = branchMergedValue37;
                                intermediateValue190 = branchMergedValue38;
                                intermediateValue191 = branchMergedValue39;
                                intermediateValue192 = branchMergedValue40;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue174 = branchMergedValue41;
                                intermediateValue175 = branchMergedValue42;
                                intermediateValue176 = branchMergedValue43;
                                intermediateValue177 = branchMergedValue46;
                                intermediateValue179 = branchMergedValue47;
                                intermediateValue181 = branchMergedValue16;
                                intermediateValue183 = branchMergedValue35;
                                intermediateValue185 = branchMergedValue36;
                                intermediateValue187 = branchMergedValue37;
                                intermediateValue189 = branchMergedValue38;
                                intermediateValue190 = branchMergedValue39;
                                intermediateValue191 = branchMergedValue40;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                intermediateValue198 = branchMergedValue60;
                                intermediateValue199 = branchMergedValue44;
                                intermediateValue200 = branchMergedValue43;
                                intermediateValue201 = branchMergedValue61;
                                intermediateValue203 = branchMergedValue42;
                                intermediateValue205 = branchMergedValue41;
                                intermediateValue207 = branchMergedValue40;
                                intermediateValue209 = branchMergedValue39;
                                intermediateValue211 = branchMergedValue38;
                                intermediateValue213 = branchMergedValue37;
                                intermediateValue214 = branchMergedValue36;
                                intermediateValue215 = branchMergedValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                intermediateValue197 = branchMergedValue60;
                                intermediateValue198 = branchMergedValue44;
                                intermediateValue199 = branchMergedValue43;
                                intermediateValue200 = branchMergedValue61;
                                intermediateValue202 = branchMergedValue42;
                                intermediateValue204 = branchMergedValue41;
                                intermediateValue206 = branchMergedValue40;
                                intermediateValue208 = branchMergedValue39;
                                intermediateValue210 = branchMergedValue38;
                                intermediateValue212 = branchMergedValue37;
                                intermediateValue213 = branchMergedValue36;
                                intermediateValue214 = branchMergedValue22;
#endif
                                break;
                            }
                            else
                            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue132;
                                float intermediateValue133;
                                float intermediateValue134;
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
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue131;
                                float intermediateValue132;
                                float intermediateValue133;
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
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue169;
                                float intermediateValue170;
                                float intermediateValue171;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue28;
                                bool comparisonValue29;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue168;
                                float intermediateValue169;
                                float intermediateValue170;
                                float sumValue87;
                                float sumValue88;
                                float sumValue89;
                                uint comparisonValue28;
                                bool comparisonValue29;
#endif
                                for (;;)
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    sumValue70 = float(intermediateValue1[productValue135]) + intermediateValue76;
                                    sumValue71 = float(intermediateValue1[productValue136]) + intermediateValue77;
                                    sumValue72 = float(intermediateValue1[productValue137]) + intermediateValue78;
                                    sumValue73 = float(intermediateValue2[productValue138]) + intermediateValue76;
                                    sumValue74 = float(intermediateValue2[productValue139]) + intermediateValue77;
                                    sumValue75 = float(intermediateValue2[productValue140]) + intermediateValue78;
                                    sumValue76 = intermediateValue76 + productValue92;
                                    sumValue77 = intermediateValue77 + productValue93;
                                    sumValue78 = intermediateValue78 + productValue94;
                                    uint comparisonValue53 = ((((uint(intermediateValue76 >= 16.0f) << 1u) | uint(intermediateValue76 < 0.0f)) | (uint(intermediateValue77 < 0.0f) << 2u)) | (uint(intermediateValue77 >= 16.0f) << 3u)) | (uint(intermediateValue78 < 0.0f) << 4u);
                                    comparisonValue26 = intermediateValue[comparisonValue53 | (uint(intermediateValue78 >= 16.0f) << 5u)];
                                    comparisonValue27 = ((((comparisonValue53 | (uint(intermediateValue78 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                    uint loadedBufferValue11;
                                    if (comparisonValue27)
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    sumValue70 = float(intermediateValue1[productValue135]) + intermediateValue75;
                                    sumValue71 = float(intermediateValue1[productValue136]) + intermediateValue76;
                                    sumValue72 = float(intermediateValue1[productValue137]) + intermediateValue77;
                                    sumValue73 = float(intermediateValue2[productValue138]) + intermediateValue75;
                                    sumValue74 = float(intermediateValue2[productValue139]) + intermediateValue76;
                                    sumValue75 = float(intermediateValue2[productValue140]) + intermediateValue77;
                                    sumValue76 = intermediateValue75 + productValue92;
                                    sumValue77 = intermediateValue76 + productValue93;
                                    sumValue78 = intermediateValue77 + productValue94;
                                    uint comparisonValue74 = ((((uint(intermediateValue75 >= 16.0f) << 1u) | uint(intermediateValue75 < 0.0f)) | (uint(intermediateValue76 < 0.0f) << 2u)) | (uint(intermediateValue76 >= 16.0f) << 3u)) | (uint(intermediateValue77 < 0.0f) << 4u);
                                    comparisonValue26 = intermediateValue[comparisonValue74 | (uint(intermediateValue77 >= 16.0f) << 5u)];
                                    comparisonValue27 = ((((comparisonValue74 | (uint(intermediateValue77 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue74 & 31u))) == 0u;
                                    uint loadedBufferValue11;
                                    if (comparisonValue27)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    sumValue87 = productValue181 + productValue92;
                                    sumValue88 = productValue182 + productValue93;
                                    sumValue89 = productValue183 + productValue94;
                                    uint comparisonValue92 = ((((uint(productValue181 >= 16.0f) << 1u) | uint(productValue181 < 0.0f)) | (uint(productValue182 < 0.0f) << 2u)) | (uint(productValue182 >= 16.0f) << 3u)) | (uint(productValue183 < 0.0f) << 4u);
                                    comparisonValue28 = intermediateValue[comparisonValue92 | (uint(productValue183 >= 16.0f) << 5u)];
                                    comparisonValue29 = ((((comparisonValue92 | (uint(productValue183 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue92 & 31u))) == 0u;
                                    uint loadedBufferValue10;
                                    if (comparisonValue29)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue26 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue28 & 31u))) == 0u)
#endif
                                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue132 = 0.0f;
                                            intermediateValue133 = 0.0f;
                                            intermediateValue134 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue131 = 0.0f;
                                            intermediateValue132 = 0.0f;
                                            intermediateValue133 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue169 = 0.0f;
                                            intermediateValue170 = 0.0f;
                                            intermediateValue171 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue168 = 0.0f;
                                            intermediateValue169 = 0.0f;
                                            intermediateValue170 = 0.0f;
#endif
                                            break;
                                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        loadedBufferValue11 = ((((uint(sumValue76 - (floor(sumValue76 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue77 - (floor(sumValue77 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue78 - (floor(sumValue78 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue26).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue10 = ((((uint(sumValue87 - (floor(sumValue87 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue88 - (floor(sumValue88 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue89 - (floor(sumValue89 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue28).x >> 2u);
#endif
                                    }
                                    else
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        loadedBufferValue11 = ((((intermediateValue79 << 8u) & 3840u) | (intermediateValue80 & 15u)) | ((intermediateValue81 << 4u) & 240u)) + bitwiseValue9;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        loadedBufferValue11 = ((((intermediateValue78 << 8u) & 3840u) | (intermediateValue79 & 15u)) | ((intermediateValue80 << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue10 = ((((uint(productValue183) << 4u) & 240u) | (uint(productValue182) & 15u)) | ((uint(productValue181) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    uint4 loadedBufferValue29 = rdLoad_voxelBuffer(loadedBufferValue11);
                                    uint scalarValue48 = loadedBufferValue29.x;
                                    if (scalarValue48 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    uint4 loadedBufferValue53 = rdLoad_voxelBuffer(loadedBufferValue10);
                                    uint scalarValue105 = loadedBufferValue53.x;
                                    if (scalarValue105 == 0u)
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue132 = 0.0f;
                                        intermediateValue133 = 0.0f;
                                        intermediateValue134 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue131 = 0.0f;
                                        intermediateValue132 = 0.0f;
                                        intermediateValue133 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue168 = 0.0f;
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
#endif
                                        break;
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue132 = bitwiseValue31 * float(scalarValue48 & 255u);
                                    intermediateValue133 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                    intermediateValue134 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue31 = float(scalarValue48 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue131 = bitwiseValue31 * float(scalarValue48 & 255u);
                                    intermediateValue132 = bitwiseValue31 * float((scalarValue48 >> 8u) & 255u);
                                    intermediateValue133 = bitwiseValue31 * float((scalarValue48 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue51 = float(scalarValue105 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue169 = bitwiseValue51 * float(scalarValue105 & 255u);
                                    intermediateValue170 = bitwiseValue51 * float((scalarValue105 >> 8u) & 255u);
                                    intermediateValue171 = bitwiseValue51 * float((scalarValue105 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue51 = float(scalarValue105 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue168 = bitwiseValue51 * float(scalarValue105 & 255u);
                                    intermediateValue169 = bitwiseValue51 * float((scalarValue105 >> 8u) & 255u);
                                    intermediateValue170 = bitwiseValue51 * float((scalarValue105 >> 16u) & 255u);
#endif
                                    break;
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue179;
                                float intermediateValue181;
                                float intermediateValue183;
                                float sumValue90;
                                float sumValue91;
                                float sumValue92;
                                uint comparisonValue38;
                                bool comparisonValue39;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue178;
                                float intermediateValue180;
                                float intermediateValue182;
                                float sumValue90;
                                float sumValue91;
                                float sumValue92;
                                uint comparisonValue38;
                                bool comparisonValue39;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue202;
                                float intermediateValue204;
                                float intermediateValue206;
                                float sumValue103;
                                float sumValue104;
                                float sumValue105;
                                uint comparisonValue41;
                                bool comparisonValue42;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue201;
                                float intermediateValue203;
                                float intermediateValue205;
                                float sumValue103;
                                float sumValue104;
                                float sumValue105;
                                uint comparisonValue41;
                                bool comparisonValue42;
#endif
                                for (;;)
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    sumValue90 = sumValue70 + productValue92;
                                    sumValue91 = sumValue71 + productValue93;
                                    sumValue92 = sumValue72 + productValue94;
                                    uint comparisonValue57 = ((((uint(sumValue70 >= 16.0f) << 1u) | uint(sumValue70 < 0.0f)) | (uint(sumValue71 < 0.0f) << 2u)) | (uint(sumValue71 >= 16.0f) << 3u)) | (uint(sumValue72 < 0.0f) << 4u);
                                    comparisonValue38 = intermediateValue[comparisonValue57 | (uint(sumValue72 >= 16.0f) << 5u)];
                                    comparisonValue39 = ((((comparisonValue57 | (uint(sumValue72 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue57 & 31u))) == 0u;
                                    uint loadedBufferValue17;
                                    if (comparisonValue39)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    sumValue103 = sumValue58 + productValue92;
                                    sumValue104 = sumValue59 + productValue93;
                                    sumValue105 = sumValue60 + productValue94;
                                    uint comparisonValue93 = ((((uint(sumValue58 >= 16.0f) << 1u) | uint(sumValue58 < 0.0f)) | (uint(sumValue59 < 0.0f) << 2u)) | (uint(sumValue59 >= 16.0f) << 3u)) | (uint(sumValue60 < 0.0f) << 4u);
                                    comparisonValue41 = intermediateValue[comparisonValue93 | (uint(sumValue60 >= 16.0f) << 5u)];
                                    comparisonValue42 = ((((comparisonValue93 | (uint(sumValue60 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue93 & 31u))) == 0u;
                                    uint loadedBufferValue24;
                                    if (comparisonValue42)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue38 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue41 & 31u))) == 0u)
#endif
                                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue179 = 0.0f;
                                            intermediateValue181 = 0.0f;
                                            intermediateValue183 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue178 = 0.0f;
                                            intermediateValue180 = 0.0f;
                                            intermediateValue182 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue202 = 0.0f;
                                            intermediateValue204 = 0.0f;
                                            intermediateValue206 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue201 = 0.0f;
                                            intermediateValue203 = 0.0f;
                                            intermediateValue205 = 0.0f;
#endif
                                            break;
                                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        loadedBufferValue17 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue91 - (floor(sumValue91 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue38).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue24 = ((((uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue41).x >> 2u);
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        loadedBufferValue17 = ((((uint(sumValue70) << 8u) & 3840u) | (uint(sumValue71) & 15u)) | ((uint(sumValue72) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue24 = ((((uint(sumValue60) << 4u) & 240u) | (uint(sumValue59) & 15u)) | ((uint(sumValue58) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    uint4 loadedBufferValue31 = rdLoad_voxelBuffer(loadedBufferValue17);
                                    uint scalarValue49 = loadedBufferValue31.x;
                                    if (scalarValue49 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    uint4 loadedBufferValue54 = rdLoad_voxelBuffer(loadedBufferValue24);
                                    uint scalarValue106 = loadedBufferValue54.x;
                                    if (scalarValue106 == 0u)
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue179 = 0.0f;
                                        intermediateValue181 = 0.0f;
                                        intermediateValue183 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue178 = 0.0f;
                                        intermediateValue180 = 0.0f;
                                        intermediateValue182 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue202 = 0.0f;
                                        intermediateValue204 = 0.0f;
                                        intermediateValue206 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue201 = 0.0f;
                                        intermediateValue203 = 0.0f;
                                        intermediateValue205 = 0.0f;
#endif
                                        break;
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue32 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue179 = bitwiseValue32 * float(scalarValue49 & 255u);
                                    intermediateValue181 = bitwiseValue32 * float((scalarValue49 >> 8u) & 255u);
                                    intermediateValue183 = bitwiseValue32 * float((scalarValue49 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue32 = float(scalarValue49 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue178 = bitwiseValue32 * float(scalarValue49 & 255u);
                                    intermediateValue180 = bitwiseValue32 * float((scalarValue49 >> 8u) & 255u);
                                    intermediateValue182 = bitwiseValue32 * float((scalarValue49 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue52 = float(scalarValue106 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue202 = bitwiseValue52 * float(scalarValue106 & 255u);
                                    intermediateValue204 = bitwiseValue52 * float((scalarValue106 >> 8u) & 255u);
                                    intermediateValue206 = bitwiseValue52 * float((scalarValue106 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue52 = float(scalarValue106 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue201 = bitwiseValue52 * float(scalarValue106 & 255u);
                                    intermediateValue203 = bitwiseValue52 * float((scalarValue106 >> 8u) & 255u);
                                    intermediateValue205 = bitwiseValue52 * float((scalarValue106 >> 16u) & 255u);
#endif
                                    break;
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue185;
                                float intermediateValue187;
                                float intermediateValue189;
                                float sumValue99;
                                float sumValue100;
                                float sumValue101;
                                uint comparisonValue48;
                                bool comparisonValue49;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue184;
                                float intermediateValue186;
                                float intermediateValue188;
                                float sumValue99;
                                float sumValue100;
                                float sumValue101;
                                uint comparisonValue48;
                                bool comparisonValue49;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float intermediateValue208;
                                float intermediateValue210;
                                float intermediateValue212;
                                float sumValue114;
                                float sumValue115;
                                float sumValue116;
                                uint comparisonValue51;
                                bool comparisonValue52;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float intermediateValue207;
                                float intermediateValue209;
                                float intermediateValue211;
                                float sumValue114;
                                float sumValue115;
                                float sumValue116;
                                uint comparisonValue51;
                                bool comparisonValue52;
#endif
                                for (;;)
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    sumValue99 = sumValue73 + productValue92;
                                    sumValue100 = sumValue74 + productValue93;
                                    sumValue101 = sumValue75 + productValue94;
                                    uint comparisonValue58 = ((((uint(sumValue73 >= 16.0f) << 1u) | uint(sumValue73 < 0.0f)) | (uint(sumValue74 < 0.0f) << 2u)) | (uint(sumValue74 >= 16.0f) << 3u)) | (uint(sumValue75 < 0.0f) << 4u);
                                    comparisonValue48 = intermediateValue[comparisonValue58 | (uint(sumValue75 >= 16.0f) << 5u)];
                                    comparisonValue49 = ((((comparisonValue58 | (uint(sumValue75 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue58 & 31u))) == 0u;
                                    uint loadedBufferValue21;
                                    if (comparisonValue49)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    sumValue114 = sumValue61 + productValue92;
                                    sumValue115 = sumValue62 + productValue93;
                                    sumValue116 = sumValue63 + productValue94;
                                    uint comparisonValue94 = ((((uint(sumValue61 >= 16.0f) << 1u) | uint(sumValue61 < 0.0f)) | (uint(sumValue62 < 0.0f) << 2u)) | (uint(sumValue62 >= 16.0f) << 3u)) | (uint(sumValue63 < 0.0f) << 4u);
                                    comparisonValue51 = intermediateValue[comparisonValue94 | (uint(sumValue63 >= 16.0f) << 5u)];
                                    comparisonValue52 = ((((comparisonValue94 | (uint(sumValue63 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue94 & 31u))) == 0u;
                                    uint loadedBufferValue28;
                                    if (comparisonValue52)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue48 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue51 & 31u))) == 0u)
#endif
                                        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue185 = 0.0f;
                                            intermediateValue187 = 0.0f;
                                            intermediateValue189 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue184 = 0.0f;
                                            intermediateValue186 = 0.0f;
                                            intermediateValue188 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                            intermediateValue208 = 0.0f;
                                            intermediateValue210 = 0.0f;
                                            intermediateValue212 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                            intermediateValue207 = 0.0f;
                                            intermediateValue209 = 0.0f;
                                            intermediateValue211 = 0.0f;
#endif
                                            break;
                                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        loadedBufferValue21 = ((((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue100 - (floor(sumValue100 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue101 - (floor(sumValue101 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue48).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue28 = ((((uint(sumValue114 - (floor(sumValue114 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue115 - (floor(sumValue115 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue116 - (floor(sumValue116 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue51).x >> 2u);
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        loadedBufferValue21 = ((((uint(sumValue73) << 8u) & 3840u) | (uint(sumValue74) & 15u)) | ((uint(sumValue75) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        loadedBufferValue28 = ((((uint(sumValue63) << 4u) & 240u) | (uint(sumValue62) & 15u)) | ((uint(sumValue61) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    uint4 loadedBufferValue33 = rdLoad_voxelBuffer(loadedBufferValue21);
                                    uint scalarValue50 = loadedBufferValue33.x;
                                    if (scalarValue50 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    uint4 loadedBufferValue55 = rdLoad_voxelBuffer(loadedBufferValue28);
                                    uint scalarValue107 = loadedBufferValue55.x;
                                    if (scalarValue107 == 0u)
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue185 = 0.0f;
                                        intermediateValue187 = 0.0f;
                                        intermediateValue189 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue184 = 0.0f;
                                        intermediateValue186 = 0.0f;
                                        intermediateValue188 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue208 = 0.0f;
                                        intermediateValue210 = 0.0f;
                                        intermediateValue212 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue207 = 0.0f;
                                        intermediateValue209 = 0.0f;
                                        intermediateValue211 = 0.0f;
#endif
                                        break;
                                    }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue33 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue185 = bitwiseValue33 * float(scalarValue50 & 255u);
                                    intermediateValue187 = bitwiseValue33 * float((scalarValue50 >> 8u) & 255u);
                                    intermediateValue189 = bitwiseValue33 * float((scalarValue50 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue33 = float(scalarValue50 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue184 = bitwiseValue33 * float(scalarValue50 & 255u);
                                    intermediateValue186 = bitwiseValue33 * float((scalarValue50 >> 8u) & 255u);
                                    intermediateValue188 = bitwiseValue33 * float((scalarValue50 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    float bitwiseValue53 = float(scalarValue107 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue208 = bitwiseValue53 * float(scalarValue107 & 255u);
                                    intermediateValue210 = bitwiseValue53 * float((scalarValue107 >> 8u) & 255u);
                                    intermediateValue212 = bitwiseValue53 * float((scalarValue107 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    float bitwiseValue53 = float(scalarValue107 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue207 = bitwiseValue53 * float(scalarValue107 & 255u);
                                    intermediateValue209 = bitwiseValue53 * float((scalarValue107 >> 8u) & 255u);
                                    intermediateValue211 = bitwiseValue53 * float((scalarValue107 >> 16u) & 255u);
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float sumValue84 = sumValue56 + productValue92;
                                float sumValue86 = sumValue57 + productValue93;
                                float sumValue102 = sumValue58 + productValue94;
                                uint comparisonValue59 = ((((uint(sumValue56 >= 16.0f) << 1u) | uint(sumValue56 < 0.0f)) | (uint(sumValue57 < 0.0f) << 2u)) | (uint(sumValue57 >= 16.0f) << 3u)) | (uint(sumValue58 < 0.0f) << 4u);
                                uint comparisonValue60 = comparisonValue59 | (uint(sumValue58 >= 16.0f) << 5u);
                                uint loadedBufferValue25;
                                if ((((comparisonValue60 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue59 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float sumValue171 = sumValue64 + productValue92;
                                float sumValue172 = sumValue65 + productValue93;
                                float sumValue173 = sumValue66 + productValue94;
                                uint comparisonValue95 = ((((uint(sumValue64 >= 16.0f) << 1u) | uint(sumValue64 < 0.0f)) | (uint(sumValue65 < 0.0f) << 2u)) | (uint(sumValue65 >= 16.0f) << 3u)) | (uint(sumValue66 < 0.0f) << 4u);
                                uint comparisonValue96 = comparisonValue95 | (uint(sumValue66 >= 16.0f) << 5u);
                                uint loadedBufferValue32;
                                if ((((comparisonValue96 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue95 & 31u))) == 0u)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue60] & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue96] & 31u))) == 0u)
#endif
                                    {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue175 = intermediateValue132;
                                        intermediateValue176 = intermediateValue133;
                                        intermediateValue177 = intermediateValue134;
                                        intermediateValue178 = intermediateValue179;
                                        intermediateValue180 = intermediateValue181;
                                        intermediateValue182 = intermediateValue183;
                                        intermediateValue184 = intermediateValue185;
                                        intermediateValue186 = intermediateValue187;
                                        intermediateValue188 = intermediateValue189;
                                        intermediateValue190 = 0.0f;
                                        intermediateValue191 = 0.0f;
                                        intermediateValue192 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue174 = intermediateValue131;
                                        intermediateValue175 = intermediateValue132;
                                        intermediateValue176 = intermediateValue133;
                                        intermediateValue177 = intermediateValue178;
                                        intermediateValue179 = intermediateValue180;
                                        intermediateValue181 = intermediateValue182;
                                        intermediateValue183 = intermediateValue184;
                                        intermediateValue185 = intermediateValue186;
                                        intermediateValue187 = intermediateValue188;
                                        intermediateValue189 = 0.0f;
                                        intermediateValue190 = 0.0f;
                                        intermediateValue191 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                        intermediateValue198 = intermediateValue169;
                                        intermediateValue199 = intermediateValue170;
                                        intermediateValue200 = intermediateValue171;
                                        intermediateValue201 = intermediateValue202;
                                        intermediateValue203 = intermediateValue204;
                                        intermediateValue205 = intermediateValue206;
                                        intermediateValue207 = intermediateValue208;
                                        intermediateValue209 = intermediateValue210;
                                        intermediateValue211 = intermediateValue212;
                                        intermediateValue213 = 0.0f;
                                        intermediateValue214 = 0.0f;
                                        intermediateValue215 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                        intermediateValue197 = intermediateValue168;
                                        intermediateValue198 = intermediateValue169;
                                        intermediateValue199 = intermediateValue170;
                                        intermediateValue200 = intermediateValue201;
                                        intermediateValue202 = intermediateValue203;
                                        intermediateValue204 = intermediateValue205;
                                        intermediateValue206 = intermediateValue207;
                                        intermediateValue208 = intermediateValue209;
                                        intermediateValue210 = intermediateValue211;
                                        intermediateValue212 = 0.0f;
                                        intermediateValue213 = 0.0f;
                                        intermediateValue214 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue25 = ((((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue86 - (floor(sumValue86 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue60]).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue32 = ((((uint(sumValue171 - (floor(sumValue171 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue172 - (floor(sumValue172 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue173 - (floor(sumValue173 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue96]).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue25 = ((((uint(sumValue56) << 8u) & 3840u) | (uint(sumValue57) & 15u)) | ((uint(sumValue58) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue32 = ((((uint(sumValue66) << 4u) & 240u) | (uint(sumValue65) & 15u)) | ((uint(sumValue64) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue35 = rdLoad_voxelBuffer(loadedBufferValue25);
                                uint scalarValue51 = loadedBufferValue35.x;
                                if (scalarValue51 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue56 = rdLoad_voxelBuffer(loadedBufferValue32);
                                uint scalarValue108 = loadedBufferValue56.x;
                                if (scalarValue108 == 0u)
#endif
                                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue175 = intermediateValue132;
                                    intermediateValue176 = intermediateValue133;
                                    intermediateValue177 = intermediateValue134;
                                    intermediateValue178 = intermediateValue179;
                                    intermediateValue180 = intermediateValue181;
                                    intermediateValue182 = intermediateValue183;
                                    intermediateValue184 = intermediateValue185;
                                    intermediateValue186 = intermediateValue187;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = 0.0f;
                                    intermediateValue191 = 0.0f;
                                    intermediateValue192 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue174 = intermediateValue131;
                                    intermediateValue175 = intermediateValue132;
                                    intermediateValue176 = intermediateValue133;
                                    intermediateValue177 = intermediateValue178;
                                    intermediateValue179 = intermediateValue180;
                                    intermediateValue181 = intermediateValue182;
                                    intermediateValue183 = intermediateValue184;
                                    intermediateValue185 = intermediateValue186;
                                    intermediateValue187 = intermediateValue188;
                                    intermediateValue189 = 0.0f;
                                    intermediateValue190 = 0.0f;
                                    intermediateValue191 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                    intermediateValue198 = intermediateValue169;
                                    intermediateValue199 = intermediateValue170;
                                    intermediateValue200 = intermediateValue171;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = intermediateValue212;
                                    intermediateValue213 = 0.0f;
                                    intermediateValue214 = 0.0f;
                                    intermediateValue215 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                    intermediateValue197 = intermediateValue168;
                                    intermediateValue198 = intermediateValue169;
                                    intermediateValue199 = intermediateValue170;
                                    intermediateValue200 = intermediateValue201;
                                    intermediateValue202 = intermediateValue203;
                                    intermediateValue204 = intermediateValue205;
                                    intermediateValue206 = intermediateValue207;
                                    intermediateValue208 = intermediateValue209;
                                    intermediateValue210 = intermediateValue211;
                                    intermediateValue212 = 0.0f;
                                    intermediateValue213 = 0.0f;
                                    intermediateValue214 = 0.0f;
#endif
                                    break;
                                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float bitwiseValue34 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue175 = intermediateValue132;
                                intermediateValue176 = intermediateValue133;
                                intermediateValue177 = intermediateValue134;
                                intermediateValue178 = intermediateValue179;
                                intermediateValue180 = intermediateValue181;
                                intermediateValue182 = intermediateValue183;
                                intermediateValue184 = intermediateValue185;
                                intermediateValue186 = intermediateValue187;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = bitwiseValue34 * float(scalarValue51 & 255u);
                                intermediateValue191 = bitwiseValue34 * float((scalarValue51 >> 8u) & 255u);
                                intermediateValue192 = bitwiseValue34 * float((scalarValue51 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float bitwiseValue34 = float(scalarValue51 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue174 = intermediateValue131;
                                intermediateValue175 = intermediateValue132;
                                intermediateValue176 = intermediateValue133;
                                intermediateValue177 = intermediateValue178;
                                intermediateValue179 = intermediateValue180;
                                intermediateValue181 = intermediateValue182;
                                intermediateValue183 = intermediateValue184;
                                intermediateValue185 = intermediateValue186;
                                intermediateValue187 = intermediateValue188;
                                intermediateValue189 = bitwiseValue34 * float(scalarValue51 & 255u);
                                intermediateValue190 = bitwiseValue34 * float((scalarValue51 >> 8u) & 255u);
                                intermediateValue191 = bitwiseValue34 * float((scalarValue51 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                                float bitwiseValue54 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue198 = intermediateValue169;
                                intermediateValue199 = intermediateValue170;
                                intermediateValue200 = intermediateValue171;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = intermediateValue212;
                                intermediateValue213 = bitwiseValue54 * float(scalarValue108 & 255u);
                                intermediateValue214 = bitwiseValue54 * float((scalarValue108 >> 8u) & 255u);
                                intermediateValue215 = bitwiseValue54 * float((scalarValue108 >> 16u) & 255u);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                                float bitwiseValue54 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue197 = intermediateValue168;
                                intermediateValue198 = intermediateValue169;
                                intermediateValue199 = intermediateValue170;
                                intermediateValue200 = intermediateValue201;
                                intermediateValue202 = intermediateValue203;
                                intermediateValue204 = intermediateValue205;
                                intermediateValue206 = intermediateValue207;
                                intermediateValue208 = intermediateValue209;
                                intermediateValue210 = intermediateValue211;
                                intermediateValue212 = bitwiseValue54 * float(scalarValue108 & 255u);
                                intermediateValue213 = bitwiseValue54 * float((scalarValue108 >> 8u) & 255u);
                                intermediateValue214 = bitwiseValue54 * float((scalarValue108 >> 16u) & 255u);
#endif
                                break;
                            }
                        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                        branchMergedValue48 = (((intermediateValue178 * sumValue54) + (intermediateValue175 * sumValue53)) + (intermediateValue184 * sumValue55)) + (intermediateValue190 * intermediateValue84);
                        branchMergedValue50 = (((intermediateValue182 * sumValue54) + (intermediateValue177 * sumValue53)) + (intermediateValue188 * sumValue55)) + (intermediateValue192 * intermediateValue84);
                        branchMergedValue51 = (((intermediateValue180 * sumValue54) + (intermediateValue176 * sumValue53)) + (intermediateValue186 * sumValue55)) + (intermediateValue191 * intermediateValue84);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        branchMergedValue48 = (((intermediateValue177 * sumValue54) + (intermediateValue174 * sumValue53)) + (intermediateValue183 * sumValue55)) + (intermediateValue189 * intermediateValue83);
                        branchMergedValue50 = (((intermediateValue181 * sumValue54) + (intermediateValue176 * sumValue53)) + (intermediateValue187 * sumValue55)) + (intermediateValue191 * intermediateValue83);
                        branchMergedValue51 = (((intermediateValue179 * sumValue54) + (intermediateValue175 * sumValue53)) + (intermediateValue185 * sumValue55)) + (intermediateValue190 * intermediateValue83);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                        branchMergedValue65 = (((intermediateValue205 * productValue185) + (intermediateValue200 * productValue184)) + (intermediateValue211 * productValue186)) + (intermediateValue215 * productValue187);
                        branchMergedValue69 = (((intermediateValue203 * productValue185) + (intermediateValue199 * productValue184)) + (intermediateValue209 * productValue186)) + (intermediateValue214 * productValue187);
                        branchMergedValue70 = (((intermediateValue201 * productValue185) + (intermediateValue198 * productValue184)) + (intermediateValue207 * productValue186)) + (intermediateValue213 * productValue187);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                        branchMergedValue65 = (((intermediateValue204 * productValue185) + (intermediateValue199 * productValue184)) + (intermediateValue210 * productValue186)) + (intermediateValue214 * productValue187);
                        branchMergedValue69 = (((intermediateValue202 * productValue185) + (intermediateValue198 * productValue184)) + (intermediateValue208 * productValue186)) + (intermediateValue213 * productValue187);
                        branchMergedValue70 = (((intermediateValue200 * productValue185) + (intermediateValue197 * productValue184)) + (intermediateValue206 * productValue186)) + (intermediateValue212 * productValue187);
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue9 = branchMergedValue48;
                    branchMergedValue17 = branchMergedValue50;
                    branchMergedValue18 = branchMergedValue51;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    else
                    {
                        float intermediateValue217;
                        float intermediateValue218;
                        float intermediateValue219;
                        float intermediateValue220;
                        float intermediateValue222;
                        float intermediateValue224;
                        float intermediateValue226;
                        float intermediateValue228;
                        float intermediateValue230;
                        float intermediateValue232;
                        float intermediateValue233;
                        float intermediateValue234;
                        float intermediateValue117;
                        float intermediateValue118;
                        float intermediateValue119;
                        uint intermediateValue120;
                        uint intermediateValue121;
                        uint intermediateValue122;
                        float intermediateValue125;
                        float sumValue74;
                        float sumValue75;
                        float sumValue76;
                        float sumValue77;
                        float sumValue78;
                        float sumValue79;
                        bool comparisonValue24;
                        uint productValue188;
                        uint productValue189;
                        uint productValue190;
                        uint productValue191;
                        uint productValue192;
                        uint productValue193;
                        for (;;)
                        {
                            intermediateValue117 = floor(sumValue32);
                            intermediateValue118 = floor(sumValue33);
                            intermediateValue119 = floor(sumValue34);
                            float sumValue192 = sumValue32 - intermediateValue117;
                            float sumValue193 = sumValue33 - intermediateValue118;
                            float sumValue194 = sumValue34 - intermediateValue119;
                            uint comparisonValue110 = ((uint(sumValue193 >= sumValue194) << 1u) | uint(sumValue192 >= sumValue193)) | (uint(sumValue192 >= sumValue194) << 2u);
                            intermediateValue120 = uint(intermediateValue117);
                            intermediateValue121 = uint(intermediateValue118);
                            intermediateValue122 = uint(intermediateValue119);
                            float scalarValue127 = min(sumValue192, sumValue193);
                            float scalarValue128 = max(sumValue192, sumValue193);
                            intermediateValue125 = min(scalarValue127, sumValue194);
                            float scalarValue129 = max(scalarValue128, sumValue194);
                            float scalarValue130 = max(min(scalarValue128, sumValue194), scalarValue127);
                            sumValue74 = 1.0f - scalarValue129;
                            sumValue75 = scalarValue129 - scalarValue130;
                            sumValue76 = scalarValue130 - intermediateValue125;
                            sumValue77 = intermediateValue117 + 1.0f;
                            sumValue78 = intermediateValue118 + 1.0f;
                            sumValue79 = intermediateValue119 + 1.0f;
                            comparisonValue24 = (((intermediateValue117 >= 0.0f) && (intermediateValue118 >= 0.0f)) && (intermediateValue119 >= 0.0f)) && (((sumValue77 < 16.0f) && (sumValue78 < 16.0f)) && (sumValue79 < 16.0f));
                            productValue188 = 0u + (comparisonValue110 * 3u);
                            productValue189 = 1u + (comparisonValue110 * 3u);
                            productValue190 = 2u + (comparisonValue110 * 3u);
                            productValue191 = 0u + (comparisonValue110 * 3u);
                            productValue192 = 1u + (comparisonValue110 * 3u);
                            productValue193 = 2u + (comparisonValue110 * 3u);
                            if (comparisonValue24)
                            {
                                uint bitwiseValue65 = intermediateValue122 << 4u;
                                uint sumValue195 = intermediateValue121 + bitwiseValue9;
                                uint bitwiseValue66 = sumValue195 + (intermediateValue120 << 8u);
                                uint4 loadedBufferValue65 = rdLoad_voxelBuffer(bitwiseValue66 + bitwiseValue65);
                                uint scalarValue131 = loadedBufferValue65.x;
                                float bitwiseValue15;
                                float intermediateValue151;
                                float intermediateValue152;
                                if (scalarValue131 == 0u)
                                {
                                    bitwiseValue15 = 0.0f;
                                    intermediateValue151 = 0.0f;
                                    intermediateValue152 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue67 = float(scalarValue131 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue15 = bitwiseValue67 * float(scalarValue131 & 255u);
                                    intermediateValue151 = bitwiseValue67 * float((scalarValue131 >> 8u) & 255u);
                                    intermediateValue152 = bitwiseValue67 * float((scalarValue131 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue66 = rdLoad_voxelBuffer(((intermediateValue1[productValue189] + sumValue195) + ((intermediateValue1[productValue188] + intermediateValue120) << 8u)) + ((intermediateValue1[productValue190] + intermediateValue122) << 4u));
                                uint scalarValue132 = loadedBufferValue66.x;
                                float bitwiseValue19;
                                float intermediateValue173;
                                float intermediateValue174;
                                if (scalarValue132 == 0u)
                                {
                                    bitwiseValue19 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                    intermediateValue174 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue68 = float(scalarValue132 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue19 = bitwiseValue68 * float(scalarValue132 & 255u);
                                    intermediateValue173 = bitwiseValue68 * float((scalarValue132 >> 8u) & 255u);
                                    intermediateValue174 = bitwiseValue68 * float((scalarValue132 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue67 = rdLoad_voxelBuffer(((intermediateValue2[productValue192] + sumValue195) + ((intermediateValue2[productValue191] + intermediateValue120) << 8u)) + ((intermediateValue2[productValue193] + intermediateValue122) << 4u));
                                uint scalarValue133 = loadedBufferValue67.x;
                                float bitwiseValue24;
                                float intermediateValue195;
                                float intermediateValue196;
                                if (scalarValue133 == 0u)
                                {
                                    bitwiseValue24 = 0.0f;
                                    intermediateValue195 = 0.0f;
                                    intermediateValue196 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue69 = float(scalarValue133 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue24 = bitwiseValue69 * float(scalarValue133 & 255u);
                                    intermediateValue195 = bitwiseValue69 * float((scalarValue133 >> 8u) & 255u);
                                    intermediateValue196 = bitwiseValue69 * float((scalarValue133 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue68 = rdLoad_voxelBuffer((bitwiseValue66 + 273u) + bitwiseValue65);
                                uint scalarValue134 = loadedBufferValue68.x;
                                float branchMergedValue23;
                                float branchMergedValue45;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                float branchMergedValue48;
                                float branchMergedValue49;
                                float branchMergedValue50;
                                float branchMergedValue51;
                                float branchMergedValue52;
                                float branchMergedValue53;
                                float branchMergedValue62;
                                float branchMergedValue63;
                                if (scalarValue134 == 0u)
                                {
                                    branchMergedValue23 = 0.0f;
                                    branchMergedValue45 = 0.0f;
                                    branchMergedValue46 = 0.0f;
                                    branchMergedValue47 = intermediateValue196;
                                    branchMergedValue48 = intermediateValue195;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue174;
                                    branchMergedValue51 = intermediateValue173;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue152;
                                    branchMergedValue62 = intermediateValue151;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                else
                                {
                                    float bitwiseValue70 = float(scalarValue134 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue23 = bitwiseValue70 * float((scalarValue134 >> 16u) & 255u);
                                    branchMergedValue45 = bitwiseValue70 * float((scalarValue134 >> 8u) & 255u);
                                    branchMergedValue46 = bitwiseValue70 * float(scalarValue134 & 255u);
                                    branchMergedValue47 = intermediateValue196;
                                    branchMergedValue48 = intermediateValue195;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue174;
                                    branchMergedValue51 = intermediateValue173;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue152;
                                    branchMergedValue62 = intermediateValue151;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                intermediateValue217 = branchMergedValue63;
                                intermediateValue218 = branchMergedValue62;
                                intermediateValue219 = branchMergedValue53;
                                intermediateValue220 = branchMergedValue52;
                                intermediateValue222 = branchMergedValue51;
                                intermediateValue224 = branchMergedValue50;
                                intermediateValue226 = branchMergedValue49;
                                intermediateValue228 = branchMergedValue48;
                                intermediateValue230 = branchMergedValue47;
                                intermediateValue232 = branchMergedValue46;
                                intermediateValue233 = branchMergedValue45;
                                intermediateValue234 = branchMergedValue23;
                                break;
                            }
                            else
                            {
                                float intermediateValue176;
                                float intermediateValue177;
                                float intermediateValue178;
                                float sumValue91;
                                float sumValue92;
                                float sumValue93;
                                float sumValue94;
                                float sumValue95;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                float sumValue99;
                                uint comparisonValue31;
                                bool comparisonValue32;
                                for (;;)
                                {
                                    sumValue91 = float(intermediateValue1[productValue188]) + intermediateValue117;
                                    sumValue92 = float(intermediateValue1[productValue189]) + intermediateValue118;
                                    sumValue93 = float(intermediateValue1[productValue190]) + intermediateValue119;
                                    sumValue94 = float(intermediateValue2[productValue191]) + intermediateValue117;
                                    sumValue95 = float(intermediateValue2[productValue192]) + intermediateValue118;
                                    sumValue96 = float(intermediateValue2[productValue193]) + intermediateValue119;
                                    sumValue97 = intermediateValue117 + productValue92;
                                    sumValue98 = intermediateValue118 + productValue93;
                                    sumValue99 = intermediateValue119 + productValue94;
                                    uint comparisonValue111 = ((((uint(intermediateValue117 >= 16.0f) << 1u) | uint(intermediateValue117 < 0.0f)) | (uint(intermediateValue118 < 0.0f) << 2u)) | (uint(intermediateValue118 >= 16.0f) << 3u)) | (uint(intermediateValue119 < 0.0f) << 4u);
                                    comparisonValue31 = intermediateValue[comparisonValue111 | (uint(intermediateValue119 >= 16.0f) << 5u)];
                                    comparisonValue32 = ((((comparisonValue111 | (uint(intermediateValue119 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue111 & 31u))) == 0u;
                                    uint loadedBufferValue13;
                                    if (comparisonValue32)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue31 & 31u))) == 0u)
                                        {
                                            intermediateValue176 = 0.0f;
                                            intermediateValue177 = 0.0f;
                                            intermediateValue178 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue13 = ((((uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue31).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue13 = ((((intermediateValue120 << 8u) & 3840u) | (intermediateValue121 & 15u)) | ((intermediateValue122 << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue61 = rdLoad_voxelBuffer(loadedBufferValue13);
                                    uint scalarValue117 = loadedBufferValue61.x;
                                    if (scalarValue117 == 0u)
                                    {
                                        intermediateValue176 = 0.0f;
                                        intermediateValue177 = 0.0f;
                                        intermediateValue178 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue61 = float(scalarValue117 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue176 = bitwiseValue61 * float(scalarValue117 & 255u);
                                    intermediateValue177 = bitwiseValue61 * float((scalarValue117 >> 8u) & 255u);
                                    intermediateValue178 = bitwiseValue61 * float((scalarValue117 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue221;
                                float intermediateValue223;
                                float intermediateValue225;
                                float sumValue106;
                                float sumValue107;
                                float sumValue108;
                                uint comparisonValue44;
                                bool comparisonValue45;
                                for (;;)
                                {
                                    sumValue106 = sumValue91 + productValue92;
                                    sumValue107 = sumValue92 + productValue93;
                                    sumValue108 = sumValue93 + productValue94;
                                    uint comparisonValue99 = ((((uint(sumValue91 >= 16.0f) << 1u) | uint(sumValue91 < 0.0f)) | (uint(sumValue92 < 0.0f) << 2u)) | (uint(sumValue92 >= 16.0f) << 3u)) | (uint(sumValue93 < 0.0f) << 4u);
                                    comparisonValue44 = intermediateValue[comparisonValue99 | (uint(sumValue93 >= 16.0f) << 5u)];
                                    comparisonValue45 = ((((comparisonValue99 | (uint(sumValue93 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue99 & 31u))) == 0u;
                                    uint loadedBufferValue26;
                                    if (comparisonValue45)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue44 & 31u))) == 0u)
                                        {
                                            intermediateValue221 = 0.0f;
                                            intermediateValue223 = 0.0f;
                                            intermediateValue225 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue26 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue44).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue26 = ((((uint(sumValue91) << 8u) & 3840u) | (uint(sumValue92) & 15u)) | ((uint(sumValue93) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue62 = rdLoad_voxelBuffer(loadedBufferValue26);
                                    uint scalarValue118 = loadedBufferValue62.x;
                                    if (scalarValue118 == 0u)
                                    {
                                        intermediateValue221 = 0.0f;
                                        intermediateValue223 = 0.0f;
                                        intermediateValue225 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue62 = float(scalarValue118 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue221 = bitwiseValue62 * float(scalarValue118 & 255u);
                                    intermediateValue223 = bitwiseValue62 * float((scalarValue118 >> 8u) & 255u);
                                    intermediateValue225 = bitwiseValue62 * float((scalarValue118 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue227;
                                float intermediateValue229;
                                float intermediateValue231;
                                float sumValue117;
                                float sumValue118;
                                float sumValue119;
                                uint comparisonValue54;
                                bool comparisonValue55;
                                for (;;)
                                {
                                    sumValue117 = sumValue94 + productValue92;
                                    sumValue118 = sumValue95 + productValue93;
                                    sumValue119 = sumValue96 + productValue94;
                                    uint comparisonValue100 = ((((uint(sumValue94 >= 16.0f) << 1u) | uint(sumValue94 < 0.0f)) | (uint(sumValue95 < 0.0f) << 2u)) | (uint(sumValue95 >= 16.0f) << 3u)) | (uint(sumValue96 < 0.0f) << 4u);
                                    comparisonValue54 = intermediateValue[comparisonValue100 | (uint(sumValue96 >= 16.0f) << 5u)];
                                    comparisonValue55 = ((((comparisonValue100 | (uint(sumValue96 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue100 & 31u))) == 0u;
                                    uint loadedBufferValue30;
                                    if (comparisonValue55)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue54 & 31u))) == 0u)
                                        {
                                            intermediateValue227 = 0.0f;
                                            intermediateValue229 = 0.0f;
                                            intermediateValue231 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue30 = ((((uint(sumValue117 - (floor(sumValue117 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue118 - (floor(sumValue118 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue119 - (floor(sumValue119 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue54).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue30 = ((((uint(sumValue94) << 8u) & 3840u) | (uint(sumValue95) & 15u)) | ((uint(sumValue96) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue63 = rdLoad_voxelBuffer(loadedBufferValue30);
                                    uint scalarValue119 = loadedBufferValue63.x;
                                    if (scalarValue119 == 0u)
                                    {
                                        intermediateValue227 = 0.0f;
                                        intermediateValue229 = 0.0f;
                                        intermediateValue231 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue63 = float(scalarValue119 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue227 = bitwiseValue63 * float(scalarValue119 & 255u);
                                    intermediateValue229 = bitwiseValue63 * float((scalarValue119 >> 8u) & 255u);
                                    intermediateValue231 = bitwiseValue63 * float((scalarValue119 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue178 = sumValue77 + productValue92;
                                float sumValue179 = sumValue78 + productValue93;
                                float sumValue180 = sumValue79 + productValue94;
                                uint comparisonValue101 = ((((uint(sumValue77 >= 16.0f) << 1u) | uint(sumValue77 < 0.0f)) | (uint(sumValue78 < 0.0f) << 2u)) | (uint(sumValue78 >= 16.0f) << 3u)) | (uint(sumValue79 < 0.0f) << 4u);
                                uint comparisonValue102 = comparisonValue101 | (uint(sumValue79 >= 16.0f) << 5u);
                                uint loadedBufferValue34;
                                if ((((comparisonValue102 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue101 & 31u))) == 0u)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue102] & 31u))) == 0u)
                                    {
                                        intermediateValue217 = intermediateValue176;
                                        intermediateValue218 = intermediateValue177;
                                        intermediateValue219 = intermediateValue178;
                                        intermediateValue220 = intermediateValue221;
                                        intermediateValue222 = intermediateValue223;
                                        intermediateValue224 = intermediateValue225;
                                        intermediateValue226 = intermediateValue227;
                                        intermediateValue228 = intermediateValue229;
                                        intermediateValue230 = intermediateValue231;
                                        intermediateValue232 = 0.0f;
                                        intermediateValue233 = 0.0f;
                                        intermediateValue234 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue34 = ((((uint(sumValue178 - (floor(sumValue178 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue179 - (floor(sumValue179 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue180 - (floor(sumValue180 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue102]).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue34 = ((((uint(sumValue77) << 8u) & 3840u) | (uint(sumValue78) & 15u)) | ((uint(sumValue79) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue64 = rdLoad_voxelBuffer(loadedBufferValue34);
                                uint scalarValue120 = loadedBufferValue64.x;
                                if (scalarValue120 == 0u)
                                {
                                    intermediateValue217 = intermediateValue176;
                                    intermediateValue218 = intermediateValue177;
                                    intermediateValue219 = intermediateValue178;
                                    intermediateValue220 = intermediateValue221;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = intermediateValue225;
                                    intermediateValue226 = intermediateValue227;
                                    intermediateValue228 = intermediateValue229;
                                    intermediateValue230 = intermediateValue231;
                                    intermediateValue232 = 0.0f;
                                    intermediateValue233 = 0.0f;
                                    intermediateValue234 = 0.0f;
                                    break;
                                }
                                float bitwiseValue64 = float(scalarValue120 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue217 = intermediateValue176;
                                intermediateValue218 = intermediateValue177;
                                intermediateValue219 = intermediateValue178;
                                intermediateValue220 = intermediateValue221;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = intermediateValue225;
                                intermediateValue226 = intermediateValue227;
                                intermediateValue228 = intermediateValue229;
                                intermediateValue230 = intermediateValue231;
                                intermediateValue232 = bitwiseValue64 * float(scalarValue120 & 255u);
                                intermediateValue233 = bitwiseValue64 * float((scalarValue120 >> 8u) & 255u);
                                intermediateValue234 = bitwiseValue64 * float((scalarValue120 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue65 = (((intermediateValue224 * sumValue75) + (intermediateValue219 * sumValue74)) + (intermediateValue230 * sumValue76)) + (intermediateValue234 * intermediateValue125);
                        branchMergedValue69 = (((intermediateValue222 * sumValue75) + (intermediateValue218 * sumValue74)) + (intermediateValue228 * sumValue76)) + (intermediateValue233 * intermediateValue125);
                        branchMergedValue70 = (((intermediateValue220 * sumValue75) + (intermediateValue217 * sumValue74)) + (intermediateValue226 * sumValue76)) + (intermediateValue232 * intermediateValue125);
                    }
                    branchMergedValue16 = branchMergedValue65;
                    branchMergedValue29 = branchMergedValue69;
                    branchMergedValue30 = branchMergedValue70;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    else
                    {
                        float intermediateValue216;
                        float intermediateValue217;
                        float intermediateValue218;
                        float intermediateValue219;
                        float intermediateValue221;
                        float intermediateValue223;
                        float intermediateValue225;
                        float intermediateValue227;
                        float intermediateValue229;
                        float intermediateValue231;
                        float intermediateValue232;
                        float intermediateValue233;
                        float intermediateValue116;
                        float intermediateValue117;
                        float intermediateValue118;
                        uint intermediateValue119;
                        uint intermediateValue120;
                        uint intermediateValue121;
                        float intermediateValue124;
                        float sumValue74;
                        float sumValue75;
                        float sumValue76;
                        float sumValue77;
                        float sumValue78;
                        float sumValue79;
                        bool comparisonValue24;
                        uint productValue188;
                        uint productValue189;
                        uint productValue190;
                        uint productValue191;
                        uint productValue192;
                        uint productValue193;
                        for (;;)
                        {
                            intermediateValue116 = floor(sumValue32);
                            intermediateValue117 = floor(sumValue33);
                            intermediateValue118 = floor(sumValue34);
                            float sumValue174 = sumValue32 - intermediateValue116;
                            float sumValue175 = sumValue33 - intermediateValue117;
                            float sumValue176 = sumValue34 - intermediateValue118;
                            uint comparisonValue97 = ((uint(sumValue175 >= sumValue176) << 1u) | uint(sumValue174 >= sumValue175)) | (uint(sumValue174 >= sumValue176) << 2u);
                            intermediateValue119 = uint(intermediateValue116);
                            intermediateValue120 = uint(intermediateValue117);
                            intermediateValue121 = uint(intermediateValue118);
                            float scalarValue109 = min(sumValue174, sumValue175);
                            float scalarValue110 = max(sumValue174, sumValue175);
                            intermediateValue124 = min(scalarValue109, sumValue176);
                            float scalarValue111 = max(scalarValue110, sumValue176);
                            float scalarValue112 = max(min(scalarValue110, sumValue176), scalarValue109);
                            sumValue74 = 1.0f - scalarValue111;
                            sumValue75 = scalarValue111 - scalarValue112;
                            sumValue76 = scalarValue112 - intermediateValue124;
                            sumValue77 = intermediateValue116 + 1.0f;
                            sumValue78 = intermediateValue117 + 1.0f;
                            sumValue79 = intermediateValue118 + 1.0f;
                            comparisonValue24 = (((intermediateValue116 >= 0.0f) && (intermediateValue117 >= 0.0f)) && (intermediateValue118 >= 0.0f)) && (((sumValue77 < 16.0f) && (sumValue78 < 16.0f)) && (sumValue79 < 16.0f));
                            productValue188 = 0u + (comparisonValue97 * 3u);
                            productValue189 = 1u + (comparisonValue97 * 3u);
                            productValue190 = 2u + (comparisonValue97 * 3u);
                            productValue191 = 0u + (comparisonValue97 * 3u);
                            productValue192 = 1u + (comparisonValue97 * 3u);
                            productValue193 = 2u + (comparisonValue97 * 3u);
                            if (comparisonValue24)
                            {
                                uint bitwiseValue55 = intermediateValue121 << 4u;
                                uint sumValue177 = intermediateValue120 + bitwiseValue9;
                                uint bitwiseValue56 = sumValue177 + (intermediateValue119 << 8u);
                                uint4 loadedBufferValue57 = rdLoad_voxelBuffer(bitwiseValue56 + bitwiseValue55);
                                uint scalarValue113 = loadedBufferValue57.x;
                                float bitwiseValue15;
                                float intermediateValue150;
                                float intermediateValue151;
                                if (scalarValue113 == 0u)
                                {
                                    bitwiseValue15 = 0.0f;
                                    intermediateValue150 = 0.0f;
                                    intermediateValue151 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue57 = float(scalarValue113 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue15 = bitwiseValue57 * float(scalarValue113 & 255u);
                                    intermediateValue150 = bitwiseValue57 * float((scalarValue113 >> 8u) & 255u);
                                    intermediateValue151 = bitwiseValue57 * float((scalarValue113 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue58 = rdLoad_voxelBuffer(((intermediateValue1[productValue189] + sumValue177) + ((intermediateValue1[productValue188] + intermediateValue119) << 8u)) + ((intermediateValue1[productValue190] + intermediateValue121) << 4u));
                                uint scalarValue114 = loadedBufferValue58.x;
                                float bitwiseValue19;
                                float intermediateValue172;
                                float intermediateValue173;
                                if (scalarValue114 == 0u)
                                {
                                    bitwiseValue19 = 0.0f;
                                    intermediateValue172 = 0.0f;
                                    intermediateValue173 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue58 = float(scalarValue114 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue19 = bitwiseValue58 * float(scalarValue114 & 255u);
                                    intermediateValue172 = bitwiseValue58 * float((scalarValue114 >> 8u) & 255u);
                                    intermediateValue173 = bitwiseValue58 * float((scalarValue114 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue59 = rdLoad_voxelBuffer(((intermediateValue2[productValue192] + sumValue177) + ((intermediateValue2[productValue191] + intermediateValue119) << 8u)) + ((intermediateValue2[productValue193] + intermediateValue121) << 4u));
                                uint scalarValue115 = loadedBufferValue59.x;
                                float bitwiseValue24;
                                float intermediateValue194;
                                float intermediateValue195;
                                if (scalarValue115 == 0u)
                                {
                                    bitwiseValue24 = 0.0f;
                                    intermediateValue194 = 0.0f;
                                    intermediateValue195 = 0.0f;
                                }
                                else
                                {
                                    float bitwiseValue59 = float(scalarValue115 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    bitwiseValue24 = bitwiseValue59 * float(scalarValue115 & 255u);
                                    intermediateValue194 = bitwiseValue59 * float((scalarValue115 >> 8u) & 255u);
                                    intermediateValue195 = bitwiseValue59 * float((scalarValue115 >> 16u) & 255u);
                                }
                                uint4 loadedBufferValue60 = rdLoad_voxelBuffer((bitwiseValue56 + 273u) + bitwiseValue55);
                                uint scalarValue116 = loadedBufferValue60.x;
                                float branchMergedValue23;
                                float branchMergedValue45;
                                float branchMergedValue46;
                                float branchMergedValue47;
                                float branchMergedValue48;
                                float branchMergedValue49;
                                float branchMergedValue50;
                                float branchMergedValue51;
                                float branchMergedValue52;
                                float branchMergedValue53;
                                float branchMergedValue62;
                                float branchMergedValue63;
                                if (scalarValue116 == 0u)
                                {
                                    branchMergedValue23 = 0.0f;
                                    branchMergedValue45 = 0.0f;
                                    branchMergedValue46 = 0.0f;
                                    branchMergedValue47 = intermediateValue195;
                                    branchMergedValue48 = intermediateValue194;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue173;
                                    branchMergedValue51 = intermediateValue172;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue151;
                                    branchMergedValue62 = intermediateValue150;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                else
                                {
                                    float bitwiseValue60 = float(scalarValue116 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    branchMergedValue23 = bitwiseValue60 * float((scalarValue116 >> 16u) & 255u);
                                    branchMergedValue45 = bitwiseValue60 * float((scalarValue116 >> 8u) & 255u);
                                    branchMergedValue46 = bitwiseValue60 * float(scalarValue116 & 255u);
                                    branchMergedValue47 = intermediateValue195;
                                    branchMergedValue48 = intermediateValue194;
                                    branchMergedValue49 = bitwiseValue24;
                                    branchMergedValue50 = intermediateValue173;
                                    branchMergedValue51 = intermediateValue172;
                                    branchMergedValue52 = bitwiseValue19;
                                    branchMergedValue53 = intermediateValue151;
                                    branchMergedValue62 = intermediateValue150;
                                    branchMergedValue63 = bitwiseValue15;
                                }
                                intermediateValue216 = branchMergedValue63;
                                intermediateValue217 = branchMergedValue62;
                                intermediateValue218 = branchMergedValue53;
                                intermediateValue219 = branchMergedValue52;
                                intermediateValue221 = branchMergedValue51;
                                intermediateValue223 = branchMergedValue50;
                                intermediateValue225 = branchMergedValue49;
                                intermediateValue227 = branchMergedValue48;
                                intermediateValue229 = branchMergedValue47;
                                intermediateValue231 = branchMergedValue46;
                                intermediateValue232 = branchMergedValue45;
                                intermediateValue233 = branchMergedValue23;
                                break;
                            }
                            else
                            {
                                float intermediateValue175;
                                float intermediateValue176;
                                float intermediateValue177;
                                float sumValue91;
                                float sumValue92;
                                float sumValue93;
                                float sumValue94;
                                float sumValue95;
                                float sumValue96;
                                float sumValue97;
                                float sumValue98;
                                float sumValue99;
                                uint comparisonValue31;
                                bool comparisonValue32;
                                for (;;)
                                {
                                    sumValue91 = float(intermediateValue1[productValue188]) + intermediateValue116;
                                    sumValue92 = float(intermediateValue1[productValue189]) + intermediateValue117;
                                    sumValue93 = float(intermediateValue1[productValue190]) + intermediateValue118;
                                    sumValue94 = float(intermediateValue2[productValue191]) + intermediateValue116;
                                    sumValue95 = float(intermediateValue2[productValue192]) + intermediateValue117;
                                    sumValue96 = float(intermediateValue2[productValue193]) + intermediateValue118;
                                    sumValue97 = intermediateValue116 + productValue92;
                                    sumValue98 = intermediateValue117 + productValue93;
                                    sumValue99 = intermediateValue118 + productValue94;
                                    uint comparisonValue98 = ((((uint(intermediateValue116 >= 16.0f) << 1u) | uint(intermediateValue116 < 0.0f)) | (uint(intermediateValue117 < 0.0f) << 2u)) | (uint(intermediateValue117 >= 16.0f) << 3u)) | (uint(intermediateValue118 < 0.0f) << 4u);
                                    comparisonValue31 = intermediateValue[comparisonValue98 | (uint(intermediateValue118 >= 16.0f) << 5u)];
                                    comparisonValue32 = ((((comparisonValue98 | (uint(intermediateValue118 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue98 & 31u))) == 0u;
                                    uint loadedBufferValue13;
                                    if (comparisonValue32)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue31 & 31u))) == 0u)
                                        {
                                            intermediateValue175 = 0.0f;
                                            intermediateValue176 = 0.0f;
                                            intermediateValue177 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue13 = ((((uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue99 - (floor(sumValue99 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue31).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue13 = ((((intermediateValue119 << 8u) & 3840u) | (intermediateValue120 & 15u)) | ((intermediateValue121 << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue61 = rdLoad_voxelBuffer(loadedBufferValue13);
                                    uint scalarValue117 = loadedBufferValue61.x;
                                    if (scalarValue117 == 0u)
                                    {
                                        intermediateValue175 = 0.0f;
                                        intermediateValue176 = 0.0f;
                                        intermediateValue177 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue61 = float(scalarValue117 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue175 = bitwiseValue61 * float(scalarValue117 & 255u);
                                    intermediateValue176 = bitwiseValue61 * float((scalarValue117 >> 8u) & 255u);
                                    intermediateValue177 = bitwiseValue61 * float((scalarValue117 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue220;
                                float intermediateValue222;
                                float intermediateValue224;
                                float sumValue106;
                                float sumValue107;
                                float sumValue108;
                                uint comparisonValue44;
                                bool comparisonValue45;
                                for (;;)
                                {
                                    sumValue106 = sumValue91 + productValue92;
                                    sumValue107 = sumValue92 + productValue93;
                                    sumValue108 = sumValue93 + productValue94;
                                    uint comparisonValue99 = ((((uint(sumValue91 >= 16.0f) << 1u) | uint(sumValue91 < 0.0f)) | (uint(sumValue92 < 0.0f) << 2u)) | (uint(sumValue92 >= 16.0f) << 3u)) | (uint(sumValue93 < 0.0f) << 4u);
                                    comparisonValue44 = intermediateValue[comparisonValue99 | (uint(sumValue93 >= 16.0f) << 5u)];
                                    comparisonValue45 = ((((comparisonValue99 | (uint(sumValue93 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue99 & 31u))) == 0u;
                                    uint loadedBufferValue26;
                                    if (comparisonValue45)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue44 & 31u))) == 0u)
                                        {
                                            intermediateValue220 = 0.0f;
                                            intermediateValue222 = 0.0f;
                                            intermediateValue224 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue26 = ((((uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue44).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue26 = ((((uint(sumValue91) << 8u) & 3840u) | (uint(sumValue92) & 15u)) | ((uint(sumValue93) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue62 = rdLoad_voxelBuffer(loadedBufferValue26);
                                    uint scalarValue118 = loadedBufferValue62.x;
                                    if (scalarValue118 == 0u)
                                    {
                                        intermediateValue220 = 0.0f;
                                        intermediateValue222 = 0.0f;
                                        intermediateValue224 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue62 = float(scalarValue118 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue220 = bitwiseValue62 * float(scalarValue118 & 255u);
                                    intermediateValue222 = bitwiseValue62 * float((scalarValue118 >> 8u) & 255u);
                                    intermediateValue224 = bitwiseValue62 * float((scalarValue118 >> 16u) & 255u);
                                    break;
                                }
                                float intermediateValue226;
                                float intermediateValue228;
                                float intermediateValue230;
                                float sumValue117;
                                float sumValue118;
                                float sumValue119;
                                uint comparisonValue54;
                                bool comparisonValue55;
                                for (;;)
                                {
                                    sumValue117 = sumValue94 + productValue92;
                                    sumValue118 = sumValue95 + productValue93;
                                    sumValue119 = sumValue96 + productValue94;
                                    uint comparisonValue100 = ((((uint(sumValue94 >= 16.0f) << 1u) | uint(sumValue94 < 0.0f)) | (uint(sumValue95 < 0.0f) << 2u)) | (uint(sumValue95 >= 16.0f) << 3u)) | (uint(sumValue96 < 0.0f) << 4u);
                                    comparisonValue54 = intermediateValue[comparisonValue100 | (uint(sumValue96 >= 16.0f) << 5u)];
                                    comparisonValue55 = ((((comparisonValue100 | (uint(sumValue96 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue100 & 31u))) == 0u;
                                    uint loadedBufferValue30;
                                    if (comparisonValue55)
                                    {
                                        if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue54 & 31u))) == 0u)
                                        {
                                            intermediateValue226 = 0.0f;
                                            intermediateValue228 = 0.0f;
                                            intermediateValue230 = 0.0f;
                                            break;
                                        }
                                        loadedBufferValue30 = ((((uint(sumValue117 - (floor(sumValue117 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue118 - (floor(sumValue118 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue119 - (floor(sumValue119 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue54).x >> 2u);
                                    }
                                    else
                                    {
                                        loadedBufferValue30 = ((((uint(sumValue94) << 8u) & 3840u) | (uint(sumValue95) & 15u)) | ((uint(sumValue96) << 4u) & 240u)) + bitwiseValue9;
                                    }
                                    uint4 loadedBufferValue63 = rdLoad_voxelBuffer(loadedBufferValue30);
                                    uint scalarValue119 = loadedBufferValue63.x;
                                    if (scalarValue119 == 0u)
                                    {
                                        intermediateValue226 = 0.0f;
                                        intermediateValue228 = 0.0f;
                                        intermediateValue230 = 0.0f;
                                        break;
                                    }
                                    float bitwiseValue63 = float(scalarValue119 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                    intermediateValue226 = bitwiseValue63 * float(scalarValue119 & 255u);
                                    intermediateValue228 = bitwiseValue63 * float((scalarValue119 >> 8u) & 255u);
                                    intermediateValue230 = bitwiseValue63 * float((scalarValue119 >> 16u) & 255u);
                                    break;
                                }
                                float sumValue178 = sumValue77 + productValue92;
                                float sumValue179 = sumValue78 + productValue93;
                                float sumValue180 = sumValue79 + productValue94;
                                uint comparisonValue101 = ((((uint(sumValue77 >= 16.0f) << 1u) | uint(sumValue77 < 0.0f)) | (uint(sumValue78 < 0.0f) << 2u)) | (uint(sumValue78 >= 16.0f) << 3u)) | (uint(sumValue79 < 0.0f) << 4u);
                                uint comparisonValue102 = comparisonValue101 | (uint(sumValue79 >= 16.0f) << 5u);
                                uint loadedBufferValue34;
                                if ((((comparisonValue102 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue101 & 31u))) == 0u)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue102] & 31u))) == 0u)
                                    {
                                        intermediateValue216 = intermediateValue175;
                                        intermediateValue217 = intermediateValue176;
                                        intermediateValue218 = intermediateValue177;
                                        intermediateValue219 = intermediateValue220;
                                        intermediateValue221 = intermediateValue222;
                                        intermediateValue223 = intermediateValue224;
                                        intermediateValue225 = intermediateValue226;
                                        intermediateValue227 = intermediateValue228;
                                        intermediateValue229 = intermediateValue230;
                                        intermediateValue231 = 0.0f;
                                        intermediateValue232 = 0.0f;
                                        intermediateValue233 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue34 = ((((uint(sumValue178 - (floor(sumValue178 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue179 - (floor(sumValue179 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue180 - (floor(sumValue180 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue102]).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue34 = ((((uint(sumValue77) << 8u) & 3840u) | (uint(sumValue78) & 15u)) | ((uint(sumValue79) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue64 = rdLoad_voxelBuffer(loadedBufferValue34);
                                uint scalarValue120 = loadedBufferValue64.x;
                                if (scalarValue120 == 0u)
                                {
                                    intermediateValue216 = intermediateValue175;
                                    intermediateValue217 = intermediateValue176;
                                    intermediateValue218 = intermediateValue177;
                                    intermediateValue219 = intermediateValue220;
                                    intermediateValue221 = intermediateValue222;
                                    intermediateValue223 = intermediateValue224;
                                    intermediateValue225 = intermediateValue226;
                                    intermediateValue227 = intermediateValue228;
                                    intermediateValue229 = intermediateValue230;
                                    intermediateValue231 = 0.0f;
                                    intermediateValue232 = 0.0f;
                                    intermediateValue233 = 0.0f;
                                    break;
                                }
                                float bitwiseValue64 = float(scalarValue120 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue216 = intermediateValue175;
                                intermediateValue217 = intermediateValue176;
                                intermediateValue218 = intermediateValue177;
                                intermediateValue219 = intermediateValue220;
                                intermediateValue221 = intermediateValue222;
                                intermediateValue223 = intermediateValue224;
                                intermediateValue225 = intermediateValue226;
                                intermediateValue227 = intermediateValue228;
                                intermediateValue229 = intermediateValue230;
                                intermediateValue231 = bitwiseValue64 * float(scalarValue120 & 255u);
                                intermediateValue232 = bitwiseValue64 * float((scalarValue120 >> 8u) & 255u);
                                intermediateValue233 = bitwiseValue64 * float((scalarValue120 >> 16u) & 255u);
                                break;
                            }
                        }
                        branchMergedValue65 = (((intermediateValue223 * sumValue75) + (intermediateValue218 * sumValue74)) + (intermediateValue229 * sumValue76)) + (intermediateValue233 * intermediateValue124);
                        branchMergedValue69 = (((intermediateValue221 * sumValue75) + (intermediateValue217 * sumValue74)) + (intermediateValue227 * sumValue76)) + (intermediateValue232 * intermediateValue124);
                        branchMergedValue70 = (((intermediateValue219 * sumValue75) + (intermediateValue216 * sumValue74)) + (intermediateValue225 * sumValue76)) + (intermediateValue231 * intermediateValue124);
                    }
                    branchMergedValue16 = branchMergedValue65;
                    branchMergedValue29 = branchMergedValue69;
                    branchMergedValue30 = branchMergedValue70;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue9 = 0.0f;
                    branchMergedValue17 = 0.0f;
                    branchMergedValue18 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue16 = 0.0f;
                    branchMergedValue29 = 0.0f;
                    branchMergedValue30 = 0.0f;
#endif
                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue21 = branchMergedValue9;
                intermediateValue22 = branchMergedValue18;
                intermediateValue23 = branchMergedValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue20 = branchMergedValue9;
                intermediateValue21 = branchMergedValue18;
                intermediateValue22 = branchMergedValue17;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue31 = branchMergedValue30;
                intermediateValue32 = branchMergedValue29;
                intermediateValue33 = branchMergedValue16;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue30 = branchMergedValue30;
                intermediateValue31 = branchMergedValue29;
                intermediateValue32 = branchMergedValue16;
#endif
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue21 = clampedValue;
                intermediateValue22 = clampedValue1;
                intermediateValue23 = clampedValue2;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue20 = clampedValue;
                intermediateValue21 = clampedValue1;
                intermediateValue22 = clampedValue2;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue31 = clampedValue;
                intermediateValue32 = clampedValue1;
                intermediateValue33 = clampedValue2;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue30 = clampedValue;
                intermediateValue31 = clampedValue1;
                intermediateValue32 = clampedValue2;
#endif
            }
            float productValue105 = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
            float productValue110 = productValue105 * productValue105;
            float productValue111 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue105 - productValue110)) + productValue110) * RD_UNIFORM_TILE_LIGHT_INTENSITY.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
            float productValue112 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue6;
            float dotProductValue11 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float productValue113 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * RD_UNIFORM_MERS_UNIFORMS.y) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
            productValue40 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue113;
            productValue41 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue113;
            productValue42 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue113;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            productValue43 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue21), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue112;
            productValue44 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue112;
            productValue45 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue23), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue112;
            intermediateValue9 = intermediateValue10;
            intermediateValue11 = intermediateValue12;
            intermediateValue13 = intermediateValue14;
            intermediateValue15 = intermediateValue16;
            intermediateValue17 = intermediateValue18;
            intermediateValue19 = intermediateValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            productValue43 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue20), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue112;
            productValue44 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue21), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue112;
            productValue45 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue22), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue112;
            intermediateValue8 = intermediateValue9;
            intermediateValue10 = intermediateValue11;
            intermediateValue12 = intermediateValue13;
            intermediateValue14 = intermediateValue15;
            intermediateValue16 = intermediateValue17;
            intermediateValue18 = intermediateValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            productValue43 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue31), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue112;
            productValue44 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue32), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue112;
            productValue45 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue33), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue112;
            intermediateValue9 = productValue46;
            intermediateValue10 = productValue47;
            intermediateValue11 = productValue48;
            intermediateValue12 = productValue49;
            intermediateValue13 = productValue50;
            intermediateValue14 = productValue51;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            productValue43 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue30), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue112;
            productValue44 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue31), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue112;
            productValue45 = (max((productValue111 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue32), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue112;
            intermediateValue8 = productValue46;
            intermediateValue9 = productValue47;
            intermediateValue10 = productValue48;
            intermediateValue11 = productValue49;
            intermediateValue12 = productValue50;
            intermediateValue13 = productValue51;
#endif
        }
        else
        {
            productValue40 = 0.0f;
            productValue41 = 0.0f;
            productValue42 = 0.0f;
            productValue43 = 0.0f;
            productValue44 = 0.0f;
            productValue45 = 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue9 = 0.0f;
            intermediateValue11 = 0.0f;
            intermediateValue13 = 0.0f;
            intermediateValue15 = 0.0f;
            intermediateValue17 = 0.0f;
            intermediateValue19 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue8 = 0.0f;
            intermediateValue10 = 0.0f;
            intermediateValue12 = 0.0f;
            intermediateValue14 = 0.0f;
            intermediateValue16 = 0.0f;
            intermediateValue18 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue9 = 0.0f;
            intermediateValue10 = 0.0f;
            intermediateValue11 = 0.0f;
            intermediateValue12 = 0.0f;
            intermediateValue13 = 0.0f;
            intermediateValue14 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue8 = 0.0f;
            intermediateValue9 = 0.0f;
            intermediateValue10 = 0.0f;
            intermediateValue11 = 0.0f;
            intermediateValue12 = 0.0f;
            intermediateValue13 = 0.0f;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        float sumValue109 = ((productValue43 + productValue40) + intermediateValue9) + intermediateValue15;
        float sumValue111 = ((productValue44 + productValue41) + intermediateValue11) + intermediateValue17;
        float sumValue112 = ((productValue45 + productValue42) + intermediateValue13) + intermediateValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float sumValue138 = ((productValue43 + productValue40) + intermediateValue8) + intermediateValue14;
        float sumValue139 = ((productValue44 + productValue41) + intermediateValue10) + intermediateValue16;
        float sumValue140 = ((productValue45 + productValue42) + intermediateValue12) + intermediateValue18;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        float sumValue196 = ((productValue43 + productValue40) + intermediateValue9) + intermediateValue12;
        float sumValue197 = ((productValue44 + productValue41) + intermediateValue10) + intermediateValue13;
        float sumValue198 = ((productValue45 + productValue42) + intermediateValue11) + intermediateValue14;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float sumValue181 = ((productValue43 + productValue40) + intermediateValue8) + intermediateValue11;
        float sumValue182 = ((productValue44 + productValue41) + intermediateValue9) + intermediateValue12;
        float sumValue183 = ((productValue45 + productValue42) + intermediateValue10) + intermediateValue13;
#endif
        float sumValue113 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue120 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue121 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue9 = rsqrt(dot(float3(sumValue113, sumValue120, sumValue121), float3(sumValue113, sumValue120, sumValue121)));
        float productValue114 = inverseLengthValue9 * sumValue113;
        float productValue115 = inverseLengthValue9 * sumValue120;
        float productValue116 = inverseLengthValue9 * sumValue121;
        bool comparisonValue61 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
        bool comparisonValue62 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue49;
        float productValue50;
        float productValue51;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue55;
        float productValue56;
        float productValue57;
#endif
        if ((comparisonValue61 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue62)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            productValue49 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
            productValue50 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
            productValue51 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            productValue55 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
            productValue56 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
            productValue57 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            productValue49 = 0.0f;
            productValue50 = 0.0f;
            productValue51 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            productValue55 = 0.0f;
            productValue56 = 0.0f;
            productValue57 = 0.0f;
#endif
        }
        bool comparisonValue63 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
        bool comparisonValue64 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue27;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue26;
        float intermediateValue27;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
#endif
        float intermediateValue28;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue29;
        float intermediateValue30;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue29;
#endif
        if (comparisonValue64)
        {
            float clampedValue12 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue14;
            float branchMergedValue26;
            float branchMergedValue27;
            float branchMergedValue28;
#endif
            if (clampedValue12 > 0.0f)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue49;
                float branchMergedValue52;
                float branchMergedValue53;
                float branchMergedValue54;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue64;
                float branchMergedValue66;
                float branchMergedValue67;
                float branchMergedValue68;
#endif
                if (comparisonValue61)
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue49 = RD_UNIFORM_FOG_COLOR.x * max(productValue49, 1.0f);
                    branchMergedValue52 = clampedValue12;
                    branchMergedValue53 = max(productValue51, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                    branchMergedValue54 = max(productValue50, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue64 = max(productValue57, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                    branchMergedValue66 = max(productValue56, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                    branchMergedValue67 = RD_UNIFORM_FOG_COLOR.x * max(productValue55, 1.0f);
                    branchMergedValue68 = clampedValue12;
#endif
                }
                else
                {
                    float clampedValue13 = clamp(((productValue115 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                    float productValue117 = 1.0f - ((clampedValue13 * clampedValue13) * (3.0f - (clampedValue13 * 2.0f)));
                    float productValue118 = (productValue117 * productValue117) * productValue117;
                    float dotProductValue12 = dot(float3(productValue114, productValue115, productValue116), float3(RD_UNIFORM_SUN_DIR.xyz));
                    float dotProductValue13 = dot(float3(productValue114, productValue115, productValue116), float3(RD_UNIFORM_MOON_DIR.xyz));
                    float sumValue122 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                    float clampedValue14 = clamp((productValue115 - sumValue122) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue122), 0.0f, 1.0f);
                    float productValue119 = 1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)));
                    float productValue120 = (productValue119 * productValue119) * productValue119;
                    float productValue121 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue13 * dotProductValue13) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                    float clampedValue15 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                    float clampedValue16 = clamp(exp2(log2(max(dotProductValue13, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                    float productValue122 = 1.809999942779541015625f - (clampedValue15 * 1.7999999523162841796875f);
                    float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue122) * productValue122);
                    float productValue123 = 1.809999942779541015625f - (clampedValue16 * 1.7999999523162841796875f);
                    float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue123) * productValue123);
                    float productValue124 = clampedValue15 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                    float productValue125 = clampedValue16 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                    float productValue126 = (((productValue118 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue125 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue124 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue120 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue121)) * 0.079577468335628509521484375f;
                    float productValue127 = (((productValue118 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue125 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue124 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue120 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue121)) * 0.079577468335628509521484375f;
                    float productValue141 = (((productValue118 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue125 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue124 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue120 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue121)) * 0.079577468335628509521484375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue55;
                    float branchMergedValue56;
                    float branchMergedValue57;
                    float branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue80;
                    float branchMergedValue81;
                    float branchMergedValue82;
                    float branchMergedValue83;
#endif
                    if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                    {
                        float scalarValue52 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue55 = ((productValue126 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                        branchMergedValue56 = clampedValue12;
                        branchMergedValue57 = ((productValue141 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                        branchMergedValue58 = ((productValue127 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue80 = ((productValue141 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                        branchMergedValue81 = ((productValue127 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                        branchMergedValue82 = ((productValue126 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue52) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                        branchMergedValue83 = clampedValue12;
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue55 = productValue126;
                        branchMergedValue56 = clampedValue12;
                        branchMergedValue57 = productValue141;
                        branchMergedValue58 = productValue127;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue80 = productValue141;
                        branchMergedValue81 = productValue127;
                        branchMergedValue82 = productValue126;
                        branchMergedValue83 = clampedValue12;
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue49 = branchMergedValue55;
                    branchMergedValue52 = branchMergedValue56;
                    branchMergedValue53 = branchMergedValue57;
                    branchMergedValue54 = branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue64 = branchMergedValue80;
                    branchMergedValue66 = branchMergedValue81;
                    branchMergedValue67 = branchMergedValue82;
                    branchMergedValue68 = branchMergedValue83;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue10 = branchMergedValue49;
                branchMergedValue19 = branchMergedValue52;
                branchMergedValue20 = branchMergedValue53;
                branchMergedValue21 = branchMergedValue54;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue14 = branchMergedValue64;
                branchMergedValue26 = branchMergedValue66;
                branchMergedValue27 = branchMergedValue67;
                branchMergedValue28 = branchMergedValue68;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue10 = 0.0f;
                branchMergedValue19 = clampedValue12;
                branchMergedValue20 = 0.0f;
                branchMergedValue21 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue14 = 0.0f;
                branchMergedValue26 = 0.0f;
                branchMergedValue27 = 0.0f;
                branchMergedValue28 = clampedValue12;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue28 = branchMergedValue19;
            intermediateValue29 = branchMergedValue10;
            intermediateValue30 = branchMergedValue21;
            intermediateValue31 = branchMergedValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue27 = branchMergedValue19;
            intermediateValue28 = branchMergedValue10;
            intermediateValue29 = branchMergedValue21;
            intermediateValue30 = branchMergedValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue26 = branchMergedValue28;
            intermediateValue27 = branchMergedValue27;
            intermediateValue28 = branchMergedValue26;
            intermediateValue29 = branchMergedValue14;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue25 = branchMergedValue28;
            intermediateValue26 = branchMergedValue27;
            intermediateValue27 = branchMergedValue26;
            intermediateValue28 = branchMergedValue14;
#endif
        }
        else
        {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue27 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue26 = 0.0f;
            intermediateValue27 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue25 = 0.0f;
            intermediateValue26 = 0.0f;
            intermediateValue27 = 0.0f;
#endif
            intermediateValue28 = 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue29 = 0.0f;
            intermediateValue30 = 0.0f;
            intermediateValue31 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue29 = 0.0f;
            intermediateValue30 = 0.0f;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue29 = 0.0f;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue98;
        float productValue99;
        float productValue100;
        float productValue101;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue106;
        float productValue107;
        float productValue108;
        float productValue109;
#endif
        if (comparisonValue63)
        {
            float productValue142 = (multiplyAddValue9 + 1.0f) * 0.5f;
            float productValue143 = (multiplyAddValue10 + 1.0f) * 0.5f;
            uint scalarValue53 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue31 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue53))) + (-0.5f);
            uint sumValue123 = uint(min(int(uint(max(int(uint(int(multiplyAddValue31))), int(0u)))), int(scalarValue53 + 4294967294u)));
            float scalarValue54 = float(int(sumValue123));
            float sumValue124 = min(max(multiplyAddValue31 - scalarValue54, 0.0f), 1.0f);
            float4 sampledTextureValue3 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue142, productValue143, scalarValue54), 0.0f);
            float scalarValue55 = sampledTextureValue3.x;
            float scalarValue56 = sampledTextureValue3.y;
            float scalarValue57 = sampledTextureValue3.z;
            float scalarValue58 = sampledTextureValue3.w;
            float4 sampledTextureValue4 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue142, productValue143, float(int(sumValue123 + 1u))), 0.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            productValue98 = ((sampledTextureValue4.x - scalarValue55) * sumValue124) + scalarValue55;
            productValue99 = ((sampledTextureValue4.y - scalarValue56) * sumValue124) + scalarValue56;
            productValue100 = ((sampledTextureValue4.z - scalarValue57) * sumValue124) + scalarValue57;
            productValue101 = ((sampledTextureValue4.w - scalarValue58) * sumValue124) + scalarValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            productValue106 = ((sampledTextureValue4.x - scalarValue55) * sumValue124) + scalarValue55;
            productValue107 = ((sampledTextureValue4.y - scalarValue56) * sumValue124) + scalarValue56;
            productValue108 = ((sampledTextureValue4.z - scalarValue57) * sumValue124) + scalarValue57;
            productValue109 = ((sampledTextureValue4.w - scalarValue58) * sumValue124) + scalarValue58;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            productValue98 = 0.0f;
            productValue99 = 0.0f;
            productValue100 = 0.0f;
            productValue101 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            productValue106 = 0.0f;
            productValue107 = 0.0f;
            productValue108 = 0.0f;
            productValue109 = 1.0f;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue71;
        float intermediateValue72;
        float intermediateValue73;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue70;
        float intermediateValue71;
        float intermediateValue72;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        float intermediateValue87;
        float intermediateValue88;
        float intermediateValue89;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        float intermediateValue86;
        float intermediateValue87;
        float intermediateValue88;
#endif
        if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
        {
            bool conditionValue1 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float intermediateValue64;
            float intermediateValue65;
            float intermediateValue66;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float intermediateValue63;
            float intermediateValue64;
            float intermediateValue65;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float intermediateValue80;
            float intermediateValue81;
            float intermediateValue82;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float intermediateValue79;
            float intermediateValue80;
            float intermediateValue81;
#endif
            float multiplyAddValue32;
            float multiplyAddValue33;
            float multiplyAddValue34;
            if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue64 = productValue22;
                intermediateValue65 = productValue23;
                intermediateValue66 = productValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue63 = productValue22;
                intermediateValue64 = productValue23;
                intermediateValue65 = productValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue80 = productValue22;
                intermediateValue81 = productValue23;
                intermediateValue82 = productValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue79 = productValue22;
                intermediateValue80 = productValue23;
                intermediateValue81 = productValue24;
#endif
                multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                multiplyAddValue34 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue64 = varyingTexCoord3.x;
                intermediateValue65 = varyingTexCoord3.y;
                intermediateValue66 = varyingTexCoord3.z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue63 = varyingTexCoord3.x;
                intermediateValue64 = varyingTexCoord3.y;
                intermediateValue65 = varyingTexCoord3.z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                intermediateValue80 = varyingTexCoord3.x;
                intermediateValue81 = varyingTexCoord3.y;
                intermediateValue82 = varyingTexCoord3.z;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                intermediateValue79 = varyingTexCoord3.x;
                intermediateValue80 = varyingTexCoord3.y;
                intermediateValue81 = varyingTexCoord3.z;
#endif
                multiplyAddValue32 = multiplyAddValue4;
                multiplyAddValue33 = multiplyAddValue5;
                multiplyAddValue34 = multiplyAddValue6;
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float sumValue125 = intermediateValue64 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue126 = intermediateValue65 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue128 = intermediateValue66 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue10 = rsqrt(dot(float3(sumValue125, sumValue126, sumValue128), float3(sumValue125, sumValue126, sumValue128)));
            float productValue144 = inverseLengthValue10 * sumValue125;
            float productValue145 = inverseLengthValue10 * sumValue126;
            float productValue146 = inverseLengthValue10 * sumValue128;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float sumValue141 = intermediateValue63 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue142 = intermediateValue64 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue143 = intermediateValue65 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue13 = rsqrt(dot(float3(sumValue141, sumValue142, sumValue143), float3(sumValue141, sumValue142, sumValue143)));
            float productValue225 = inverseLengthValue13 * sumValue141;
            float productValue226 = inverseLengthValue13 * sumValue142;
            float productValue227 = inverseLengthValue13 * sumValue143;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float sumValue199 = intermediateValue80 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue200 = intermediateValue81 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue201 = intermediateValue82 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue19 = rsqrt(dot(float3(sumValue199, sumValue200, sumValue201), float3(sumValue199, sumValue200, sumValue201)));
            float productValue313 = inverseLengthValue19 * sumValue199;
            float productValue314 = inverseLengthValue19 * sumValue200;
            float productValue315 = inverseLengthValue19 * sumValue201;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float sumValue184 = intermediateValue79 - RD_UNIFORM_INV_VIEW_ROW_3.x;
            float sumValue185 = intermediateValue80 - RD_UNIFORM_INV_VIEW_ROW_3.y;
            float sumValue186 = intermediateValue81 - RD_UNIFORM_INV_VIEW_ROW_3.z;
            float inverseLengthValue18 = rsqrt(dot(float3(sumValue184, sumValue185, sumValue186), float3(sumValue184, sumValue185, sumValue186)));
            float productValue283 = inverseLengthValue18 * sumValue184;
            float productValue284 = inverseLengthValue18 * sumValue185;
            float productValue285 = inverseLengthValue18 * sumValue186;
#endif
            float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34), float3(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34)));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float dotProductValue14 = dot(float3(productValue144, productValue145, productValue146), float3(productValue3, productValue4, productValue5)) * 2.0f;
            float productValue147 = productValue144 - (dotProductValue14 * productValue3);
            float productValue148 = productValue145 - (dotProductValue14 * productValue4);
            float productValue149 = productValue146 - (dotProductValue14 * productValue5);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float dotProductValue18 = dot(float3(productValue225, productValue226, productValue227), float3(productValue3, productValue4, productValue5)) * 2.0f;
            float productValue228 = productValue225 - (dotProductValue18 * productValue3);
            float productValue229 = productValue226 - (dotProductValue18 * productValue4);
            float productValue230 = productValue227 - (dotProductValue18 * productValue5);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float dotProductValue26 = dot(float3(productValue313, productValue314, productValue315), float3(productValue3, productValue4, productValue5)) * 2.0f;
            float productValue316 = productValue313 - (dotProductValue26 * productValue3);
            float productValue317 = productValue314 - (dotProductValue26 * productValue4);
            float productValue318 = productValue315 - (dotProductValue26 * productValue5);
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float dotProductValue24 = dot(float3(productValue283, productValue284, productValue285), float3(productValue3, productValue4, productValue5)) * 2.0f;
            float productValue286 = productValue283 - (dotProductValue24 * productValue3);
            float productValue287 = productValue284 - (dotProductValue24 * productValue4);
            float productValue288 = productValue285 - (dotProductValue24 * productValue5);
#endif
            float sumValue129 = 1.0f - RD_UNIFORM_MERS_UNIFORMS.z;
            float productValue150 = sumValue129 * sumValue129;
            float productValue151 = productValue150 * productValue150;
            precise float comparisonValue65 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue150 : (productValue151 * productValue151));
            precise float productValue152 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue65;
            uint scalarValue59 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float4 sampledTextureValue5 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue147, productValue148, productValue149, float(int(scalarValue59))), productValue152);
            float4 sampledTextureValue6 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue147, productValue148, productValue149, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue152);
            float scalarValue60 = sampledTextureValue6.x;
            float scalarValue61 = sampledTextureValue6.y;
            float scalarValue62 = sampledTextureValue6.z;
            float productValue153 = ((sampledTextureValue5.x - scalarValue60) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue60;
            float productValue154 = ((sampledTextureValue5.y - scalarValue61) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue61;
            float productValue155 = ((sampledTextureValue5.z - scalarValue62) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue62;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float4 sampledTextureValue12 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue228, productValue229, productValue230, float(int(scalarValue59))), productValue152);
            float4 sampledTextureValue13 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue228, productValue229, productValue230, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue152);
            float scalarValue79 = sampledTextureValue13.x;
            float scalarValue80 = sampledTextureValue13.y;
            float scalarValue81 = sampledTextureValue13.z;
            float productValue231 = ((sampledTextureValue12.x - scalarValue79) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue79;
            float productValue232 = ((sampledTextureValue12.y - scalarValue80) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue80;
            float productValue233 = ((sampledTextureValue12.z - scalarValue81) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue81;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float4 sampledTextureValue18 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue316, productValue317, productValue318, float(int(scalarValue59))), productValue152);
            float4 sampledTextureValue19 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue316, productValue317, productValue318, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue152);
            float scalarValue135 = sampledTextureValue19.x;
            float scalarValue136 = sampledTextureValue19.y;
            float scalarValue137 = sampledTextureValue19.z;
            float productValue319 = ((sampledTextureValue18.x - scalarValue135) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue135;
            float productValue320 = ((sampledTextureValue18.y - scalarValue136) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue136;
            float productValue321 = ((sampledTextureValue18.z - scalarValue137) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue137;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float4 sampledTextureValue15 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue286, productValue287, productValue288, float(int(scalarValue59))), productValue152);
            float4 sampledTextureValue16 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue286, productValue287, productValue288, float(int(uint(int(scalarValue59 + 2u) - int(3u) * (int(scalarValue59 + 2u) / int(3u)))))), productValue152);
            float scalarValue121 = sampledTextureValue16.x;
            float scalarValue122 = sampledTextureValue16.y;
            float scalarValue123 = sampledTextureValue16.z;
            float productValue289 = ((sampledTextureValue15.x - scalarValue121) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue121;
            float productValue290 = ((sampledTextureValue15.y - scalarValue122) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue122;
            float productValue291 = ((sampledTextureValue15.z - scalarValue123) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue123;
#endif
            float productValue156 = (((clampedValue3 * clampedValue3) * clampedValue3) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            float comparisonValue66 = (conditionValue1 ? (productValue153 * 301.72412109375f) : productValue153) * productValue156;
            float comparisonValue67 = (conditionValue1 ? (productValue154 * 301.72412109375f) : productValue154) * productValue156;
            float comparisonValue68 = (conditionValue1 ? (productValue155 * 301.72412109375f) : productValue155) * productValue156;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float comparisonValue75 = (conditionValue1 ? (productValue231 * 301.72412109375f) : productValue231) * productValue156;
            float comparisonValue76 = (conditionValue1 ? (productValue232 * 301.72412109375f) : productValue232) * productValue156;
            float comparisonValue77 = (conditionValue1 ? (productValue233 * 301.72412109375f) : productValue233) * productValue156;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            float comparisonValue112 = (conditionValue1 ? (productValue319 * 301.72412109375f) : productValue319) * productValue156;
            float comparisonValue113 = (conditionValue1 ? (productValue320 * 301.72412109375f) : productValue320) * productValue156;
            float comparisonValue114 = (conditionValue1 ? (productValue321 * 301.72412109375f) : productValue321) * productValue156;
            float comparisonValue18;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            float comparisonValue103 = (conditionValue1 ? (productValue289 * 301.72412109375f) : productValue289) * productValue156;
            float comparisonValue104 = (conditionValue1 ? (productValue290 * 301.72412109375f) : productValue290) * productValue156;
            float comparisonValue105 = (conditionValue1 ? (productValue291 * 301.72412109375f) : productValue291) * productValue156;
            float comparisonValue18;
#endif
            float comparisonValue19;
            float comparisonValue20;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float comparisonValue21;
#endif
            if (comparisonValue62)
            {
                float productValue157 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue158 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue159 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue160 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue161 = productValue160 * clampedValue;
                float productValue162 = productValue160 * clampedValue1;
                float productValue163 = productValue160 * clampedValue2;
                float clampedValue17 = clamp(dot(float3(productValue161, productValue162, productValue163), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue166 = ((clampedValue17 * (productValue161 - productValue157)) + productValue157) * RD_UNIFORM_MERS_UNIFORMS.x;
                float productValue167 = ((clampedValue17 * (productValue162 - productValue158)) + productValue158) * RD_UNIFORM_MERS_UNIFORMS.x;
                float productValue169 = ((clampedValue17 * (productValue163 - productValue159)) + productValue159) * RD_UNIFORM_MERS_UNIFORMS.x;
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                float intermediateValue103;
                float intermediateValue104;
                float intermediateValue105;
                bool intermediateValue106;
                if (!(dot(float3(comparisonValue66, comparisonValue67, comparisonValue68), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue166, productValue167, productValue169), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float intermediateValue102;
                float intermediateValue103;
                float intermediateValue104;
                bool intermediateValue105;
                if (!(dot(float3(comparisonValue75, comparisonValue76, comparisonValue77), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue166, productValue167, productValue169), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                float intermediateValue132;
                float intermediateValue133;
                float intermediateValue134;
                bool intermediateValue135;
                if (!(dot(float3(comparisonValue112, comparisonValue113, comparisonValue114), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue166, productValue167, productValue169), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                float intermediateValue131;
                float intermediateValue132;
                float intermediateValue133;
                bool intermediateValue134;
                if (!(dot(float3(comparisonValue103, comparisonValue104, comparisonValue105), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue166, productValue167, productValue169), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#endif
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    intermediateValue103 = productValue166;
                    intermediateValue104 = productValue167;
                    intermediateValue105 = productValue169;
                    intermediateValue106 = true;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    intermediateValue102 = productValue166;
                    intermediateValue103 = productValue167;
                    intermediateValue104 = productValue169;
                    intermediateValue105 = true;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    intermediateValue132 = productValue166;
                    intermediateValue133 = productValue167;
                    intermediateValue134 = productValue169;
                    intermediateValue135 = true;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    intermediateValue131 = productValue166;
                    intermediateValue132 = productValue167;
                    intermediateValue133 = productValue169;
                    intermediateValue134 = true;
#endif
                }
                else
                {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                    intermediateValue103 = 0.0f;
                    intermediateValue104 = 0.0f;
                    intermediateValue105 = 0.0f;
                    intermediateValue106 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    intermediateValue102 = 0.0f;
                    intermediateValue103 = 0.0f;
                    intermediateValue104 = 0.0f;
                    intermediateValue105 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                    intermediateValue132 = 0.0f;
                    intermediateValue133 = 0.0f;
                    intermediateValue134 = 0.0f;
                    intermediateValue135 = false;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                    intermediateValue131 = 0.0f;
                    intermediateValue132 = 0.0f;
                    intermediateValue133 = 0.0f;
                    intermediateValue134 = false;
#endif
                }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                comparisonValue19 = intermediateValue106 ? intermediateValue103 : comparisonValue66;
                comparisonValue20 = intermediateValue106 ? intermediateValue104 : comparisonValue67;
                comparisonValue21 = intermediateValue106 ? intermediateValue105 : comparisonValue68;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                comparisonValue19 = intermediateValue105 ? intermediateValue102 : comparisonValue75;
                comparisonValue20 = intermediateValue105 ? intermediateValue103 : comparisonValue76;
                comparisonValue21 = intermediateValue105 ? intermediateValue104 : comparisonValue77;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                comparisonValue18 = intermediateValue135 ? intermediateValue132 : comparisonValue112;
                comparisonValue19 = intermediateValue135 ? intermediateValue133 : comparisonValue113;
                comparisonValue20 = intermediateValue135 ? intermediateValue134 : comparisonValue114;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                comparisonValue18 = intermediateValue134 ? intermediateValue131 : comparisonValue103;
                comparisonValue19 = intermediateValue134 ? intermediateValue132 : comparisonValue104;
                comparisonValue20 = intermediateValue134 ? intermediateValue133 : comparisonValue105;
#endif
            }
            else
            {
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
                comparisonValue19 = comparisonValue66;
                comparisonValue20 = comparisonValue67;
                comparisonValue21 = comparisonValue68;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
                comparisonValue19 = comparisonValue75;
                comparisonValue20 = comparisonValue76;
                comparisonValue21 = comparisonValue77;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
                comparisonValue18 = comparisonValue112;
                comparisonValue19 = comparisonValue113;
                comparisonValue20 = comparisonValue114;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
                comparisonValue18 = comparisonValue103;
                comparisonValue19 = comparisonValue104;
                comparisonValue20 = comparisonValue105;
#endif
            }
            float4 sampledTextureValue7 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3((-0.0f) - (multiplyAddValue32 * inverseLengthValue11), (-0.0f) - (multiplyAddValue33 * inverseLengthValue11), (-0.0f) - (multiplyAddValue34 * inverseLengthValue11))), 0.0f, 1.0f), sumValue129));
            float scalarValue63 = sampledTextureValue7.x;
            float scalarValue64 = sampledTextureValue7.y;
            float quotientValue17 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
            float clampedValue18 = 1.0f - clamp(comparisonValue64 ? (quotientValue17 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue17 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float productValue170 = (((scalarValue63 * productValue26) + scalarValue64) * comparisonValue19) * clampedValue18;
            float productValue173 = (((scalarValue63 * productValue27) + scalarValue64) * comparisonValue20) * clampedValue18;
            float productValue174 = (((scalarValue63 * productValue28) + scalarValue64) * comparisonValue21) * clampedValue18;
            float branchMergedValue14;
            float branchMergedValue24;
            float branchMergedValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float productValue292 = (((scalarValue63 * productValue26) + scalarValue64) * comparisonValue18) * clampedValue18;
            float productValue293 = (((scalarValue63 * productValue27) + scalarValue64) * comparisonValue19) * clampedValue18;
            float productValue294 = (((scalarValue63 * productValue28) + scalarValue64) * comparisonValue20) * clampedValue18;
            float branchMergedValue20;
            float branchMergedValue33;
            float branchMergedValue34;
#endif
            if (comparisonValue63)
            {
                float productValue175 = (multiplyAddValue9 + 1.0f) * 0.5f;
                float productValue178 = (multiplyAddValue10 + 1.0f) * 0.5f;
                uint scalarValue65 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
                float multiplyAddValue41 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue11, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue10, multiplyAddValue9 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue65))) + (-0.5f);
                uint sumValue130 = uint(min(int(uint(max(int(uint(int(multiplyAddValue41))), int(0u)))), int(scalarValue65 + 4294967294u)));
                float scalarValue66 = float(int(sumValue130));
                float4 sampledTextureValue8 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue175, productValue178, scalarValue66), 0.0f);
                float scalarValue67 = sampledTextureValue8.w;
                float sampledTextureValue9 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue175, productValue178, float(int(sumValue130 + 1u))), 0.0f).w - scalarValue67) * min(max(multiplyAddValue41 - scalarValue66, 0.0f), 1.0f)) + scalarValue67;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue14 = sampledTextureValue9 * productValue170;
                branchMergedValue24 = sampledTextureValue9 * productValue174;
                branchMergedValue25 = sampledTextureValue9 * productValue173;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue20 = sampledTextureValue9 * productValue294;
                branchMergedValue33 = sampledTextureValue9 * productValue293;
                branchMergedValue34 = sampledTextureValue9 * productValue292;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue14 = productValue170;
                branchMergedValue24 = productValue174;
                branchMergedValue25 = productValue173;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue20 = productValue294;
                branchMergedValue33 = productValue293;
                branchMergedValue34 = productValue292;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue71 = branchMergedValue14;
            intermediateValue72 = branchMergedValue25;
            intermediateValue73 = branchMergedValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue70 = branchMergedValue14;
            intermediateValue71 = branchMergedValue25;
            intermediateValue72 = branchMergedValue24;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue87 = branchMergedValue34;
            intermediateValue88 = branchMergedValue33;
            intermediateValue89 = branchMergedValue20;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue86 = branchMergedValue34;
            intermediateValue87 = branchMergedValue33;
            intermediateValue88 = branchMergedValue20;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue13;
            float branchMergedValue22;
            float branchMergedValue23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue19;
            float branchMergedValue31;
            float branchMergedValue32;
#endif
            if (comparisonValue62)
            {
                float multiplyAddValue38;
                float multiplyAddValue39;
                float multiplyAddValue40;
                if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
                {
                    multiplyAddValue38 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                    multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                    multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue24, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue23, productValue22 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
                }
                else
                {
                    multiplyAddValue38 = multiplyAddValue4;
                    multiplyAddValue39 = multiplyAddValue5;
                    multiplyAddValue40 = multiplyAddValue6;
                }
                float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40), float3(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40)));
                float productValue179 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue180 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue194 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
                float productValue195 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
                float productValue196 = productValue195 * clampedValue;
                float productValue199 = productValue195 * clampedValue1;
                float productValue200 = productValue195 * clampedValue2;
                float clampedValue19 = clamp(dot(float3(productValue196, productValue199, productValue200), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
                float productValue202 = ((clampedValue19 * (productValue196 - productValue179)) + productValue179) * RD_UNIFORM_MERS_UNIFORMS.x;
                float productValue203 = ((clampedValue19 * (productValue199 - productValue180)) + productValue180) * RD_UNIFORM_MERS_UNIFORMS.x;
                float productValue207 = ((clampedValue19 * (productValue200 - productValue194)) + productValue194) * RD_UNIFORM_MERS_UNIFORMS.x;
                bool dotProductValue16 = dot(float3(productValue202, productValue203, productValue207), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) <= 0.0f;
                float4 sampledTextureValue10 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3((-0.0f) - (multiplyAddValue38 * inverseLengthValue12), (-0.0f) - (multiplyAddValue39 * inverseLengthValue12), (-0.0f) - (multiplyAddValue40 * inverseLengthValue12))), 0.0f, 1.0f), 1.0f - RD_UNIFORM_MERS_UNIFORMS.z));
                float scalarValue68 = sampledTextureValue10.x;
                float scalarValue69 = sampledTextureValue10.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue13 = ((scalarValue68 * productValue26) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue202);
                branchMergedValue22 = ((scalarValue68 * productValue28) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue207);
                branchMergedValue23 = ((scalarValue68 * productValue27) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue203);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue19 = ((scalarValue68 * productValue28) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue207);
                branchMergedValue31 = ((scalarValue68 * productValue27) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue203);
                branchMergedValue32 = ((scalarValue68 * productValue26) + scalarValue69) * (dotProductValue16 ? 0.0f : productValue202);
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue13 = 0.0f;
                branchMergedValue22 = 0.0f;
                branchMergedValue23 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue19 = 0.0f;
                branchMergedValue31 = 0.0f;
                branchMergedValue32 = 0.0f;
#endif
            }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue71 = branchMergedValue13;
            intermediateValue72 = branchMergedValue23;
            intermediateValue73 = branchMergedValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue70 = branchMergedValue13;
            intermediateValue71 = branchMergedValue23;
            intermediateValue72 = branchMergedValue22;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
            intermediateValue87 = branchMergedValue32;
            intermediateValue88 = branchMergedValue31;
            intermediateValue89 = branchMergedValue19;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
            intermediateValue86 = branchMergedValue32;
            intermediateValue87 = branchMergedValue31;
            intermediateValue88 = branchMergedValue19;
#endif
        }
#if (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON)
        productValue29 = ((productValue101 * (((intermediateValue29 - sumValue109) * intermediateValue28) + sumValue109)) + productValue98) + intermediateValue71;
        productValue30 = ((productValue101 * (((intermediateValue30 - sumValue111) * intermediateValue28) + sumValue111)) + productValue99) + intermediateValue72;
        productValue31 = ((productValue101 * (((intermediateValue31 - sumValue112) * intermediateValue28) + sumValue112)) + productValue100) + intermediateValue73;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF)
        productValue29 = ((productValue101 * (((intermediateValue28 - sumValue138) * intermediateValue27) + sumValue138)) + productValue98) + intermediateValue70;
        productValue30 = ((productValue101 * (((intermediateValue29 - sumValue139) * intermediateValue27) + sumValue139)) + productValue99) + intermediateValue71;
        productValue31 = ((productValue101 * (((intermediateValue30 - sumValue140) * intermediateValue27) + sumValue140)) + productValue100) + intermediateValue72;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON)
        productValue29 = ((productValue109 * (((intermediateValue27 - sumValue196) * intermediateValue26) + sumValue196)) + productValue106) + intermediateValue87;
        productValue30 = ((productValue109 * (((intermediateValue28 - sumValue197) * intermediateValue26) + sumValue197)) + productValue107) + intermediateValue88;
        productValue31 = ((productValue109 * (((intermediateValue29 - sumValue198) * intermediateValue26) + sumValue198)) + productValue108) + intermediateValue89;
#elif (RD_FEATURE_POINT_LIGHT_SHADING == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF)
        productValue29 = ((productValue109 * (((intermediateValue26 - sumValue181) * intermediateValue25) + sumValue181)) + productValue106) + intermediateValue86;
        productValue30 = ((productValue109 * (((intermediateValue27 - sumValue182) * intermediateValue25) + sumValue182)) + productValue107) + intermediateValue87;
        productValue31 = ((productValue109 * (((intermediateValue28 - sumValue183) * intermediateValue25) + sumValue183)) + productValue108) + intermediateValue88;
#endif
    }
    else
    {
        productValue29 = exponentialValue;
        productValue30 = exponentialValue1;
        productValue31 = exponentialValue2;
    }
    float4 sampledTextureValue11 = previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx);
    float quotientValue18 = (0.180000007152557373046875f / sampledTextureValue11.x) + 9.9999997473787516355514526367188e-05f;
    float quotientValue20 = RD_UNIFORM_LIGHTING_ENABLED_AND_ADAPTIVE_EMISSIVE.y / quotientValue18;
    float productValue208 = (quotientValue20 * productValue29) + productValue29;
    float productValue209 = (quotientValue20 * productValue30) + productValue30;
    float productValue210 = (quotientValue20 * productValue31) + productValue31;
    float productValue36;
    float productValue37;
    float productValue38;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        productValue36 = productValue208 * quotientValue18;
        productValue37 = productValue209 * quotientValue18;
        productValue38 = productValue210 * quotientValue18;
    }
    else
    {
        productValue36 = productValue208;
        productValue37 = productValue209;
        productValue38 = productValue210;
    }
    fragmentColor0.x = productValue36;
    fragmentColor0.y = productValue37;
    fragmentColor0.z = productValue38;
#if RD_FEATURE_USE_TEXTURES == RD_ON
    fragmentColor0.w = (scalarValue * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
    discardIfRequested();
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
    fragmentColor0.w = RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
