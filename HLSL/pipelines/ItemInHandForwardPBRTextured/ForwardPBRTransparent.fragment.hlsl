// ItemInHandForwardPBRTextured / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ItemInHandForwardPBRTextured/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  nointerpolation int varyingFrontFacing0 : FRONTFACING0,
  nointerpolation int varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord8 : TEXCOORD8,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  uint varyingSv_Isfrontface0 : SV_IsFrontFace0,
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
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25,workingVector26,workingVector27,workingVector28,workingVector29,workingVector30,workingVector31,workingVector32,workingVector33;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = varyingColor0.xyz * workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector3.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.w = 1;
  workingVector2.w = workingVector1.w;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.yzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyw;
  workingVector1.xy = varyingColor0.xy * workingVector0.yz;
  workingVector2.xy = workingVector0.yz * varyingColor0.xy + -workingVector0.yz;
  workingVector0.yz = workingVector0.ww * workingVector2.xy + workingVector0.yz;
  workingVector2.xy = varyingColor0.ww * workingVector0.yz;
  workingVector2.z = 1;
  workingVector1.z = workingVector0.w;
  workingVector0.xyz = workingVector0.xxx ? workingVector2.xyz : workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector1.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector1.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector1.xy + float2(1,1);
  workingVector0.xy = workingVector1.xy * workingVector0.xy;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyw;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyw;
#endif
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
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
  workingVector3.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector3.xyzw = floor(workingVector3.xyzw);
  workingVector3.yw = workingVector3.yw * workingVector3.yw;
  workingVector3.yw = float2(0.75,0.75) * workingVector3.yw;
  workingVector3.xy = workingVector3.xz * float2(0.5,0.5) + workingVector3.yw;
  workingVector3.xy = frac(workingVector3.xy);
  workingVector2.w = workingVector3.x * 0.25 + workingVector3.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.w * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  fragmentColor0.w = workingVector1.x ? 0 : workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.xyz = max(float3(0,0,0), workingVector0.xyz);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  fragmentColor0.w = workingVector1.x ? 0 : workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector1.xyz = max(float3(0,0,0), workingVector0.xyw);
#endif
  workingVector1.xyz = log2(workingVector1.xyz);
  workingVector1.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector1.xyz;
  workingVector1.xyz = exp2(workingVector1.xyz);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyz;
  workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector0.xyw;
  workingVector4.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector0.xyw;
#endif
  workingVector4.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector4.xyz;
  workingVector4.xyz = log2(workingVector4.xyz);
  workingVector4.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector4.xyz;
  workingVector4.xyz = exp2(workingVector4.xyz);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector0.xyz = workingVector0.xyz ? workingVector3.xyz : workingVector4.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector1.xyz : workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.xyw = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyw);
  workingVector0.xyw = workingVector0.xyw ? workingVector3.xyz : workingVector4.xyz;
  workingVector0.xyz = workingVector0.zzz ? workingVector1.xyz : workingVector0.xyw;
#endif
  workingVector0.w = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.w != 0) {
    workingVector1.x = sampledResource9[varyingTexCoord4.x].val[16/4];
    workingVector1.y = sampledResource9[varyingTexCoord4.x].val[16/4+1];
    workingVector1.z = sampledResource9[varyingTexCoord4.x].val[16/4+2];
    workingVector1.w = sampledResource9[varyingTexCoord4.x].val[16/4+3];
    workingVector3.x = sampledResource9[varyingTexCoord4.x].val[32/4+2];
    workingVector3.y = sampledResource9[varyingTexCoord4.x].val[32/4];
    workingVector3.z = sampledResource9[varyingTexCoord4.x].val[32/4+1];
    workingVector3.w = sampledResource9[varyingTexCoord4.x].val[32/4+3];
    workingVector4.x = sampledResource9[varyingTexCoord4.x].val[48/4];
    workingVector4.y = sampledResource9[varyingTexCoord4.x].val[48/4+1];
    workingVector4.zw = (int2)workingVector3.yy & int2(4,1);
    workingVector4.zw = RD_COMPARISON_MASK((int2)workingVector4.zw == int2(4,1));
    if (workingVector4.z != 0) {
      workingVector5.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
      workingVector5.xyz = materialTexture1.Sample(textureSampler1, workingVector5.xy).xyz;
      workingVector5.xyz = workingVector5.xyz * float3(2,2,2) + float3(-1,-1,-1);
    } else {
      workingVector0.w = sampledResource9[varyingTexCoord4.x].val[60/4];
      workingVector2.w = (int)workingVector3.y & 8;
      workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.w == 8);
      if (workingVector2.w != 0) {
        workingVector2.w = workingVector0.w + -workingVector4.y;
        workingVector2.w = min(workingVector2.w, workingVector0.w);
        workingVector2.w = saturate(2 + -workingVector2.w);
        workingVector4.z = RD_COMPARISON_MASK(0 < workingVector2.w);
        if (workingVector4.z != 0) {
          workingVector6.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
          materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector6.zw = floatingPointResult.xy;
          workingVector7.xyzw = workingVector6.zzww;
          workingVector6.zw = workingVector7.yw * workingVector6.xy;
          workingVector6.zw = frac(workingVector6.zw);
          workingVector8.xy = float2(-0.5,-0.5) + workingVector6.zw;
          workingVector8.xy = RD_COMPARISON_MASK(abs(workingVector8.xy) < float2(0.0625,0.0625));
          workingVector6.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector6.zw);
          workingVector6.zw = workingVector6.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
          workingVector6.zw = workingVector6.xy + workingVector6.zw;
          workingVector6.zw = workingVector8.xy ? workingVector6.zw : workingVector6.xy;
          workingVector8.xyzw = materialTexture1.Gather(textureSampler1, workingVector6.zw).xyzw;
          workingVector6.xyzw = workingVector6.xxyy * workingVector7.xyzw + float4(0.5,0.5,0.5,0.5);
          workingVector6.xyzw = frac(workingVector6.xyzw);
          workingVector7.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector6.wwyy);
          workingVector7.xyzw = workingVector7.xyzw ? workingVector8.xyzy : workingVector8.wzwx;
          workingVector6.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector6.xyzw;
          workingVector6.xyzw = saturate(workingVector6.xyzw + workingVector6.xyzw);
          workingVector6.xyzw = (int4)workingVector6.xyzw;
          workingVector4.z = dot(workingVector7.xy, icb[workingVector6.x+0].xy);
          workingVector5.w = dot(workingVector7.xy, icb[workingVector6.y+0].xy);
          workingVector8.x = -workingVector5.w + workingVector4.z;
          workingVector4.z = dot(workingVector7.zw, icb[workingVector6.z+0].xy);
          workingVector5.w = dot(workingVector7.zw, icb[workingVector6.w+0].xy);
          workingVector8.y = -workingVector5.w + workingVector4.z;
          workingVector8.z = 0.25;
          workingVector4.z = dot(workingVector8.xyz, workingVector8.xyz);
          workingVector4.z = rsqrt(workingVector4.z);
          workingVector5.xyz = workingVector8.xyz * workingVector4.zzz;
          workingVector5.xy = workingVector5.xy * workingVector2.ww;
        } else {
          workingVector5.xyz = float3(0,0,1);
        }
      } else {
        workingVector2.w = (int)workingVector3.y & 16;
        workingVector2.w = RD_COMPARISON_MASK((int)workingVector2.w == 16);
        if (workingVector2.w != 0) {
          workingVector1.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
          workingVector1.z = workingVector0.w + -workingVector4.y;
          workingVector0.w = min(workingVector1.z, workingVector0.w);
          workingVector6.xyzw = materialTexture1.SampleLevel(textureSampler1, workingVector1.xy, 0).xyzw;
          workingVector1.zw = RD_COMPARISON_MASK(workingVector6.yz == workingVector6.xy);
          workingVector1.z = workingVector1.w ? workingVector1.z : 0;
          if (workingVector1.z != 0) {
            workingVector1.z = saturate(2 + -workingVector0.w);
            workingVector1.w = RD_COMPARISON_MASK(0 < workingVector1.z);
            if (workingVector1.w != 0) {
              materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
              workingVector4.yz = floatingPointResult.xy;
              workingVector7.xyzw = workingVector4.yyzz;
              workingVector4.yz = workingVector7.yw * workingVector1.xy;
              workingVector4.yz = frac(workingVector4.yz);
              workingVector8.xy = float2(-0.5,-0.5) + workingVector4.yz;
              workingVector8.xy = RD_COMPARISON_MASK(abs(workingVector8.xy) < float2(0.0625,0.0625));
              workingVector4.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector4.yz);
              workingVector4.yz = workingVector4.yz ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
              workingVector4.yz = workingVector4.yz + workingVector1.xy;
              workingVector4.yz = workingVector8.xy ? workingVector4.yz : workingVector1.xy;
              workingVector8.xyzw = materialTexture1.Gather(textureSampler1, workingVector4.yz).xyzw;
              workingVector7.xyzw = workingVector1.xxyy * workingVector7.xyzw + float4(0.5,0.5,0.5,0.5);
              workingVector7.xyzw = frac(workingVector7.xyzw);
              workingVector9.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector7.wwyy);
              workingVector8.xyzw = workingVector9.xyzw ? workingVector8.xyzy : workingVector8.wzwx;
              workingVector7.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector7.xyzw;
              workingVector7.xyzw = saturate(workingVector7.xyzw + workingVector7.xyzw);
              workingVector7.xyzw = (int4)workingVector7.xyzw;
              workingVector1.w = dot(workingVector8.xy, icb[workingVector7.x+0].xy);
              workingVector2.w = dot(workingVector8.xy, icb[workingVector7.y+0].xy);
              workingVector9.x = -workingVector2.w + workingVector1.w;
              workingVector1.w = dot(workingVector8.zw, icb[workingVector7.z+0].xy);
              workingVector2.w = dot(workingVector8.zw, icb[workingVector7.w+0].xy);
              workingVector9.y = -workingVector2.w + workingVector1.w;
              workingVector9.z = 0.25;
              workingVector1.w = dot(workingVector9.xyz, workingVector9.xyz);
              workingVector1.w = rsqrt(workingVector1.w);
              workingVector5.xyz = workingVector9.xyz * workingVector1.www;
              workingVector5.xy = workingVector5.xy * workingVector1.zz;
            } else {
              workingVector5.xyz = float3(0,0,1);
            }
          } else {
            materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
            workingVector1.zw = floatingPointResult.xy;
            workingVector0.w = saturate(2 + -workingVector0.w);
            workingVector2.w = RD_COMPARISON_MASK(0 < workingVector0.w);
            workingVector1.xy = workingVector1.xy * workingVector1.zw;
            workingVector1.xy = frac(workingVector1.xy);
            workingVector1.zw = RD_COMPARISON_MASK(workingVector1.xy >= float2(0.916666687,0.916666687));
            workingVector6.xyzw = workingVector6.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
            workingVector1.xy = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector1.xy);
            workingVector1.xyzw = workingVector1.xyzw ? float4(1,1,1,1) : 0;
            workingVector1.xy = workingVector1.xy * -workingVector6.yw;
            workingVector1.xy = workingVector1.zw * workingVector6.xz + workingVector1.xy;
            workingVector1.zw = RD_COMPARISON_MASK(abs(workingVector1.xy) >= float2(0.00499999989,0.00499999989));
            workingVector1.zw = workingVector1.zw ? float2(1,1) : 0;
            workingVector1.xy = workingVector1.zw * workingVector1.xy;
            workingVector1.z = 0.25;
            workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
            workingVector1.w = rsqrt(workingVector1.w);
            workingVector1.xyz = workingVector1.xyz * workingVector1.www;
            workingVector1.xy = workingVector1.xy * workingVector0.ww;
            workingVector5.xyz = workingVector2.www ? workingVector1.xyz : float3(0,0,1);
          }
        } else {
          workingVector5.xyz = float3(0,0,1);
        }
      }
    }
    if (workingVector4.w != 0) {
      workingVector1.x = sampledResource9[varyingTexCoord4.x].val[0/4];
      workingVector1.y = sampledResource9[varyingTexCoord4.x].val[0/4+1];
      workingVector1.z = sampledResource9[varyingTexCoord4.x].val[0/4+2];
      workingVector1.w = sampledResource9[varyingTexCoord4.x].val[0/4+3];
      workingVector1.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
      workingVector1.xyzw = materialTexture1.Sample(textureSampler1, workingVector1.xy).xyzw;
      workingVector0.w = (int)workingVector3.y & 2;
      workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 2);
      workingVector4.x = workingVector0.w ? workingVector1.w : workingVector4.x;
      workingVector3.xzw = workingVector1.yzx;
    }
    workingVector1.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
    workingVector0.w = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector4.yzw = varyingTangent0.xyz * workingVector0.www;
    workingVector0.w = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector6.xyz = varyingBitangent0.xyz * workingVector0.www;
    workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector1.xyz = workingVector1.xyz * workingVector0.www;
    workingVector6.xyz = workingVector6.xyz * workingVector5.yyy;
    workingVector4.yzw = workingVector4.yzw * workingVector5.xxx + workingVector6.xyz;
    workingVector1.xyz = workingVector1.xyz * workingVector5.zzz + workingVector4.yzw;
  } else {
    workingVector3.xzw = float3(0,1,0);
    workingVector4.x = 0;
    workingVector1.xyz = varyingNormal0.xyz;
  }
  workingVector5.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector5.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_MODEL_MATRICES_ROW_3.xyzw + workingVector5.xyzw;
  workingVector6.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * workingVector5.yyyy;
  workingVector6.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * workingVector5.xxxx + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * workingVector5.zzzz + workingVector6.xyzw;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw * workingVector5.wwww + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector5.yyyy;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector5.xxxx + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector5.zzzz + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector5.wwww + workingVector6.xyzw;
  workingVector4.yzw = workingVector6.xyz / workingVector6.www;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyw = workingVector1.xyz * workingVector0.www;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector6.xyz;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.www + workingVector6.xyz;
  workingVector7.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector8.xyz = ddx_coarse(workingVector5.zxy);
  workingVector2.w = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector8.xyz = workingVector8.xyz * workingVector2.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.xyz = -workingVector5.yzx;
  workingVector9.xyz = ddy_coarse(workingVector9.xyz);
  workingVector2.w = dot(workingVector9.xyz, workingVector9.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector9.xyz = -workingVector5.xyz;
  workingVector10.xyz = ddy_coarse(workingVector9.yzx);
  workingVector2.w = dot(workingVector10.xyz, workingVector10.xyz);
#endif
  workingVector2.w = rsqrt(workingVector2.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.xyz = workingVector9.xyz * workingVector2.www;
  workingVector10.xyz = workingVector9.xyz * workingVector8.xyz;
  workingVector8.xyz = workingVector8.zxy * workingVector9.yzx + -workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.xyz = workingVector10.xyz * workingVector2.www;
  workingVector11.xyz = workingVector10.xyz * workingVector8.xyz;
  workingVector8.xyz = workingVector8.zxy * workingVector10.yzx + -workingVector11.xyz;
#endif
  workingVector2.w = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector8.xyz = workingVector8.xyz * workingVector2.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.yyy;
  workingVector8.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.xxx + workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.yyy;
  workingVector8.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.xxx + workingVector10.xyz;
#endif
  workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.zzz + workingVector8.xyw;
  workingVector2.w = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector8.xyz = workingVector8.xyz * workingVector2.www;
  workingVector8.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector8.xyz = round(workingVector8.xyz);
  workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector8.xyz;
  workingVector2.w = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector2.w = rsqrt(workingVector2.w);
  workingVector8.xyz = workingVector8.xyz * workingVector2.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector9.xyz = floor(workingVector9.xyz);
  workingVector9.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector9.xyz + workingVector7.xyz;
  workingVector9.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector9.xyz;
  workingVector2.w = dot(workingVector9.xyz, workingVector8.xyz);
  workingVector8.xyz = -workingVector2.www * workingVector8.xyz + workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector10.xyz = floor(workingVector10.xyz);
  workingVector10.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector10.xyz + workingVector7.xyz;
  workingVector10.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector10.xyz;
  workingVector2.w = dot(workingVector10.xyz, workingVector8.xyz);
  workingVector8.xyz = -workingVector2.www * workingVector8.xyz + workingVector10.xyz;
#endif
  workingVector8.xyz = workingVector8.xyz + workingVector7.xyz;
  workingVector8.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector8.xyz;
  workingVector2.w = 1 + -workingVector3.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector9.xyz = workingVector3.www * workingVector0.xyz;
  workingVector9.xyz = workingVector2.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector9.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector10.xyz = workingVector3.www * workingVector0.xyz;
  workingVector10.xyz = workingVector2.www * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector10.xyz;
#endif
  workingVector3.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector3.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector3.y;
  workingVector3.y = RD_COMPARISON_MASK(workingVector3.y < 9.99999975e-005);
  workingVector5.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector3.y = workingVector3.y ? workingVector5.w : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector10.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector5.w = workingVector10.x * 0.600000024 + 0.400000006;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector11.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector5.w = workingVector11.x * 0.600000024 + 0.400000006;
#endif
  workingVector5.w = workingVector5.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector10.y = workingVector10.x * workingVector5.w;
  workingVector5.w = workingVector10.x * workingVector10.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector11.y = workingVector11.x * workingVector5.w;
  workingVector5.w = workingVector11.x * workingVector11.x;
#endif
  workingVector5.w = workingVector5.w * 0.600000024 + 0.400000006;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector10.z = workingVector10.x * workingVector5.w;
  workingVector10.xyz = min(float3(1,1,1), workingVector10.xyz);
  workingVector10.xyz = workingVector3.yyy ? workingVector10.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector11.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector3.y = workingVector11.y ? workingVector11.x : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector11.z = workingVector11.x * workingVector5.w;
  workingVector11.xyz = min(float3(1,1,1), workingVector11.xyz);
  workingVector11.xyz = workingVector3.yyy ? workingVector11.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector12.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector3.y = workingVector12.y ? workingVector12.x : 0;
#endif
  if (workingVector3.y != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector11.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector11.xy;
    workingVector11.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector3.y = materialTexture4.Sample(textureSampler4, workingVector11.xyz).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector12.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector12.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector12.xy;
    workingVector12.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector3.y = materialTexture4.Sample(textureSampler4, workingVector12.xyz).x;
#endif
    workingVector3.y = workingVector3.y + workingVector3.y;
    workingVector5.w = saturate(workingVector1.y);
    workingVector3.y = workingVector5.w * workingVector3.y;
    workingVector3.y = log2(workingVector3.y);
    workingVector3.y = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector3.y;
    workingVector3.y = exp2(workingVector3.y);
    workingVector5.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector3.y = workingVector5.w * workingVector3.y;
  } else {
    workingVector3.y = 1;
  }
  workingVector5.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector5.w = sqrt(workingVector5.w);
  workingVector6.w = RD_COMPARISON_MASK(workingVector4.w != 1.000000);
  if (workingVector6.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector6.w = 9.99999975e-005 + workingVector5.w;
    workingVector12.xyz = workingVector5.xyz / workingVector6.www;
    workingVector4.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector4.x;
    workingVector6.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
    workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
    workingVector13.xyz = workingVector6.www ? workingVector8.xyz : varyingTexCoord3.xyz;
#endif
    workingVector6.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector7.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector6.w = workingVector6.w ? workingVector7.w : 0;
    if (workingVector6.w == 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector6.w = 9.99999975e-005 + workingVector5.w;
      workingVector11.xyz = workingVector5.xyz / workingVector6.www;
      workingVector4.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector4.x;
#endif
      workingVector6.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 1);
      if (workingVector6.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector6.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
        workingVector12.xyz = workingVector6.www ? workingVector8.xyz : varyingTexCoord3.xyz;
        workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector13.xyz;
        workingVector6.w = dot(workingVector13.xyz, workingVector13.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector14.xyz;
        workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector14.xyz;
        workingVector6.w = dot(workingVector14.xyz, workingVector14.xyz);
#endif
        workingVector6.w = rsqrt(workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.xyz = workingVector13.xyz * workingVector6.www;
        workingVector6.w = dot(workingVector6.xyz, workingVector13.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.xyz = workingVector14.xyz * workingVector6.www;
        workingVector6.w = dot(workingVector6.xyz, workingVector14.xyz);
#endif
        workingVector6.w = max(0, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector1.xyw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector1.xyw;
#endif
        workingVector7.w = 1 + -workingVector6.w;
        workingVector7.w = max(0, workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector12.xyz = workingVector13.xyz * workingVector7.www + workingVector12.xyz;
        workingVector13.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector7.w = dot(workingVector13.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector14.xyz = workingVector14.xyz * workingVector7.www + workingVector13.xyz;
        workingVector15.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector7.w = dot(workingVector15.xyzw, float4(1,1,1,1));
#endif
        workingVector7.w = (int)workingVector7.w;
        workingVector8.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.xyz = float3(1,1,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector15.xyz = float3(1,1,0);
#endif
        workingVector9.w = 0;
        while (true) {
          workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w >= (int)workingVector7.w);
          if (workingVector10.w != 0) break;
          workingVector10.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector9.w+0].xyzw);
          workingVector10.w = (int)workingVector10.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector10.w = (int)workingVector10.w + (int)workingVector13.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector10.w = (int)workingVector10.w + (int)workingVector15.z;
#endif
          workingVector10.w = min(8, (int)workingVector10.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xy = workingVector13.xy;
          workingVector11.w = workingVector13.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector16.xy = workingVector15.xy;
          workingVector11.w = workingVector15.z;
#endif
          while (true) {
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector10.w);
            if (workingVector12.w != 0) break;
            workingVector12.w = (uint)workingVector11.w << 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = fragmentVectorConstants1[workingVector12.w+95].xyz * workingVector12.yyy;
            workingVector15.xyz = fragmentVectorConstants1[workingVector12.w+94].xyz * workingVector12.xxx + workingVector15.xyz;
            workingVector15.xyz = fragmentVectorConstants1[workingVector12.w+96].xyz * workingVector12.zzz + workingVector15.xyz;
            workingVector15.xyz = fragmentVectorConstants1[workingVector12.w+97].xyz + workingVector15.xyz;
            workingVector16.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector15.xyz));
            workingVector13.w = workingVector16.y ? workingVector16.x : 0;
            workingVector13.w = workingVector16.z ? workingVector13.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector17.xyz = fragmentVectorConstants1[workingVector12.w+97].xyz * workingVector14.yyy;
            workingVector17.xyz = fragmentVectorConstants1[workingVector12.w+96].xyz * workingVector14.xxx + workingVector17.xyz;
            workingVector17.xyz = fragmentVectorConstants1[workingVector12.w+98].xyz * workingVector14.zzz + workingVector17.xyz;
            workingVector17.xyz = fragmentVectorConstants1[workingVector12.w+99].xyz + workingVector17.xyz;
            workingVector18.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector17.xyz));
            workingVector13.w = workingVector18.y ? workingVector18.x : 0;
            workingVector13.w = workingVector18.z ? workingVector13.w : 0;
#endif
            if (workingVector13.w != 0) {
              workingVector13.w = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector11.w+0].xyzw);
              workingVector13.w = max(workingVector13.w, workingVector6.w);
              workingVector13.w = min(1, workingVector13.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector14.z = -workingVector13.w * workingVector13.w + 1;
              workingVector14.z = sqrt(workingVector14.z);
              workingVector13.w = workingVector14.z / workingVector13.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.w = -workingVector13.w * workingVector13.w + 1;
              workingVector14.w = sqrt(workingVector14.w);
              workingVector13.w = workingVector14.w / workingVector13.w;
#endif
              workingVector13.w = fragmentVectorConstants1[workingVector11.w+49].z * workingVector13.w + fragmentVectorConstants1[workingVector11.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector16.xy = workingVector15.xy * float2(0.5,0.5) + float2(0.5,0.5);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector18.xy = workingVector17.xy * float2(0.5,0.5) + float2(0.5,0.5);
#endif
              workingVector12.w = dot(fragmentVectorConstants1[workingVector12.w+19].xyzw, fragmentVectorConstants1[workingVector12.w+19].xyzw);
              workingVector12.w = sqrt(workingVector12.w);
              workingVector12.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector14.z = fragmentVectorConstants1[workingVector11.w+49].w + 0.5;
              workingVector14.z = (int)workingVector14.z;
              workingVector14.z = max(1, (int)workingVector14.z);
              workingVector14.z = min(9, (int)workingVector14.z);
              workingVector14.z = workingVector8.w ? 1 : workingVector14.z;
              workingVector14.w = (uint)workingVector14.z >> 1;
              workingVector16.z = 1 + -workingVector16.y;
              workingVector17.z = (int)workingVector11.w;
              workingVector13.w = workingVector15.z + -workingVector13.w;
              workingVector15.xyw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.w = fragmentVectorConstants1[workingVector11.w+49].w + 0.5;
              workingVector14.w = (int)workingVector14.w;
              workingVector14.w = max(1, (int)workingVector14.w);
              workingVector14.w = min(9, (int)workingVector14.w);
              workingVector14.w = workingVector8.w ? 1 : workingVector14.w;
              workingVector15.w = (uint)workingVector14.w >> 1;
              workingVector18.z = 1 + -workingVector18.y;
              workingVector19.z = (int)workingVector11.w;
              workingVector13.w = workingVector17.z + -workingVector13.w;
              workingVector16.zw = float2(0,0);
              workingVector17.x = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector16.y = RD_COMPARISON_MASK((int)workingVector15.w >= (int)workingVector14.z);
                if (workingVector16.y != 0) break;
                workingVector16.y = (int)-workingVector14.w + (int)workingVector15.w;
                workingVector16.y = (int)workingVector16.y;
                workingVector18.y = 0.5 + workingVector16.y;
                workingVector16.yw = workingVector15.yx;
                workingVector17.w = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector17.y = RD_COMPARISON_MASK((int)workingVector17.x >= (int)workingVector14.w);
                if (workingVector17.y != 0) break;
                workingVector17.y = (int)-workingVector15.w + (int)workingVector17.x;
                workingVector17.y = (int)workingVector17.y;
                workingVector20.y = 0.5 + workingVector17.y;
                workingVector17.yw = workingVector16.wz;
                workingVector18.y = 0;
#endif
                while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector18.z = RD_COMPARISON_MASK((int)workingVector17.w >= (int)workingVector14.z);
                  if (workingVector18.z != 0) break;
                  workingVector18.z = (int)-workingVector14.w + (int)workingVector17.w;
                  workingVector18.z = (int)workingVector18.z;
                  workingVector18.x = 0.5 + workingVector18.z;
                  workingVector18.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector18.xy;
                  workingVector18.xz = fragmentVectorConstants1[workingVector11.w+49].xx * workingVector18.xz;
                  workingVector17.xy = workingVector16.xz * fragmentVectorConstants1[workingVector11.w+49].xx + workingVector18.xz;
                  workingVector19.xyzw = materialTexture6.Gather(textureSampler6, workingVector17.xyz).xyzw;
                  workingVector17.xy = workingVector17.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector17.xy = frac(workingVector17.xy);
                  workingVector20.xyzw = -workingVector19.xyzw + workingVector15.zzzz;
                  workingVector20.xyzw = saturate(workingVector20.xyzw * workingVector12.wwww);
                  workingVector21.xyzw = workingVector20.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector20.xyzw = workingVector20.xyzw * workingVector20.xyzw;
                  workingVector20.xyzw = -workingVector21.xyzw * workingVector20.xyzw + float4(1,1,1,1);
                  workingVector18.xz = workingVector20.zy + -workingVector20.wx;
                  workingVector18.xz = workingVector17.xx * workingVector18.xz + workingVector20.wx;
                  workingVector18.z = workingVector18.z + -workingVector18.x;
                  workingVector18.x = workingVector17.y * workingVector18.z + workingVector18.x;
                  workingVector16.w = workingVector18.x + workingVector16.w;
                  workingVector18.x = RD_COMPARISON_MASK(workingVector19.w >= workingVector13.w);
                  workingVector18.x = workingVector18.x ? 1.000000 : 0;
                  workingVector18.x = workingVector18.x + workingVector16.y;
                  workingVector19.xyzw = RD_COMPARISON_MASK(workingVector19.xyzw >= workingVector13.wwww);
                  workingVector20.xyzw = workingVector19.xyzw ? float4(1,1,1,1) : 0;
                  workingVector18.zw = workingVector19.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector18.zw = workingVector20.zy + workingVector18.zw;
                  workingVector18.zw = workingVector17.xx * workingVector18.zw + workingVector20.wx;
                  workingVector17.x = workingVector18.w + -workingVector18.z;
                  workingVector17.x = workingVector17.y * workingVector17.x + workingVector18.z;
                  workingVector17.x = workingVector17.x + workingVector16.y;
                  workingVector16.y = workingVector8.w ? workingVector18.x : workingVector17.x;
                  workingVector17.w = (int)workingVector17.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector18.w = RD_COMPARISON_MASK((int)workingVector18.y >= (int)workingVector14.w);
                  if (workingVector18.w != 0) break;
                  workingVector18.w = (int)-workingVector15.w + (int)workingVector18.y;
                  workingVector18.w = (int)workingVector18.w;
                  workingVector20.x = 0.5 + workingVector18.w;
                  workingVector20.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector20.xy;
                  workingVector20.xz = fragmentVectorConstants1[workingVector11.w+49].xx * workingVector20.xz;
                  workingVector19.xy = workingVector18.xz * fragmentVectorConstants1[workingVector11.w+49].xx + workingVector20.xz;
                  workingVector21.xyzw = materialTexture6.Gather(textureSampler6, workingVector19.xyz).xyzw;
                  workingVector19.xy = workingVector19.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector19.xy = frac(workingVector19.xy);
                  workingVector22.xyzw = -workingVector21.xyzw + workingVector17.zzzz;
                  workingVector22.xyzw = saturate(workingVector22.xyzw * workingVector12.wwww);
                  workingVector23.xyzw = workingVector22.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector22.xyzw = workingVector22.xyzw * workingVector22.xyzw;
                  workingVector22.xyzw = -workingVector23.xyzw * workingVector22.xyzw + float4(1,1,1,1);
                  workingVector20.xz = workingVector22.zy + -workingVector22.wx;
                  workingVector20.xz = workingVector19.xx * workingVector20.xz + workingVector22.wx;
                  workingVector18.w = workingVector20.z + -workingVector20.x;
                  workingVector18.w = workingVector19.y * workingVector18.w + workingVector20.x;
                  workingVector17.w = workingVector18.w + workingVector17.w;
                  workingVector18.w = RD_COMPARISON_MASK(workingVector21.w >= workingVector13.w);
                  workingVector18.w = workingVector18.w ? 1.000000 : 0;
                  workingVector18.w = workingVector18.w + workingVector17.y;
                  workingVector21.xyzw = RD_COMPARISON_MASK(workingVector21.xyzw >= workingVector13.wwww);
                  workingVector22.xyzw = workingVector21.xyzw ? float4(1,1,1,1) : 0;
                  workingVector20.xz = workingVector21.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector20.xz = workingVector22.zy + workingVector20.xz;
                  workingVector19.xw = workingVector19.xx * workingVector20.xz + workingVector22.wx;
                  workingVector19.w = workingVector19.w + -workingVector19.x;
                  workingVector19.x = workingVector19.y * workingVector19.w + workingVector19.x;
                  workingVector19.x = workingVector19.x + workingVector17.y;
                  workingVector17.y = workingVector8.w ? workingVector18.w : workingVector19.x;
                  workingVector18.y = (int)workingVector18.y + 1;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector15.xy = workingVector16.wy;
                workingVector15.w = (int)workingVector15.w + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector16.zw = workingVector17.wy;
                workingVector17.x = (int)workingVector17.x + 1;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.w = (int)workingVector14.z * (int)workingVector14.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.w = (int)workingVector14.w * (int)workingVector14.w;
#endif
              workingVector12.w = (int)workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector14.zw = workingVector15.xy / workingVector12.ww;
              workingVector14.xy = min(workingVector14.xy, workingVector14.zw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector17.xz = workingVector16.zw / workingVector12.ww;
              workingVector16.xy = min(workingVector17.xz, workingVector16.xy);
#endif
              workingVector11.w = workingVector10.w;
            } else {
              workingVector11.w = (int)workingVector11.w + 1;
            }
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xy = workingVector14.xy;
          workingVector13.z = workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector15.xy = workingVector16.xy;
          workingVector15.z = workingVector11.w;
#endif
          workingVector9.w = (int)workingVector9.w + 1;
        }
        workingVector7.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector7.w = RD_COMPARISON_MASK(0 < (int)workingVector7.w);
        if (workingVector7.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector12.yyy;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector12.xxx + workingVector14.xyz;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector12.zzz + workingVector14.xyz;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector14.xyz;
          workingVector15.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector15.z = 1 + -workingVector15.y;
          workingVector13.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector15.xz;
          workingVector14.xy = RD_COMPARISON_MASK(workingVector13.zw >= float2(0,0));
          workingVector15.xy = RD_COMPARISON_MASK(workingVector13.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector7.w = workingVector14.x ? workingVector15.x : 0;
          workingVector7.w = workingVector14.y ? workingVector7.w : 0;
          workingVector7.w = workingVector15.y ? workingVector7.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector16.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector14.yyy;
          workingVector16.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector14.xxx + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector14.zzz + workingVector16.xyz;
          workingVector16.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector16.xyz;
          workingVector17.xy = workingVector16.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector17.z = 1 + -workingVector17.y;
          workingVector15.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector17.xz;
          workingVector16.xy = RD_COMPARISON_MASK(workingVector15.zw >= float2(0,0));
          workingVector17.xy = RD_COMPARISON_MASK(workingVector15.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector7.w = workingVector16.x ? workingVector17.x : 0;
          workingVector7.w = workingVector16.y ? workingVector7.w : 0;
          workingVector7.w = workingVector17.y ? workingVector7.w : 0;
#endif
          if (workingVector7.w != 0) {
            workingVector7.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector6.w);
            workingVector7.w = min(1, workingVector7.w);
            workingVector9.w = -workingVector7.w * workingVector7.w + 1;
            workingVector9.w = sqrt(workingVector9.w);
            workingVector7.w = workingVector9.w / workingVector7.w;
            workingVector7.w = fragmentVectorConstants1[workingVector11.w+49].z * workingVector7.w + fragmentVectorConstants1[workingVector11.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = workingVector14.z + -workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.w = workingVector16.z + -workingVector7.w;
#endif
            workingVector7.w = min(1, workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xy = workingVector8.ww ? float2(1,1) : float2(2,4);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector16.xy = workingVector8.ww ? float2(1,1) : float2(2,4);
#endif
            workingVector9.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.z = 1 + workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector17.z = 1 + workingVector9.w;
#endif
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector10.w = 0;
            workingVector11.w = 0;
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector14.x);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector16.x);
#endif
              if (workingVector12.w != 0) break;
              workingVector12.w = (int)workingVector9.w + (int)workingVector11.w;
              workingVector12.w = (int)workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector16.y = 0.5 + workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector18.y = 0.5 + workingVector12.w;
#endif
              workingVector12.w = workingVector10.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector14.z = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector13.w = 0;
#endif
              while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector14.w = RD_COMPARISON_MASK((int)workingVector14.z >= (int)workingVector14.x);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector14.w = RD_COMPARISON_MASK((int)workingVector13.w >= (int)workingVector16.x);
#endif
                if (workingVector14.w != 0) break;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector14.w = (int)workingVector9.w + (int)workingVector14.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector14.w = (int)workingVector9.w + (int)workingVector13.w;
#endif
                workingVector14.w = (int)workingVector14.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector16.x = 0.5 + workingVector14.w;
                workingVector16.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector16.xy;
                workingVector15.xy = workingVector16.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector13.zw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector18.x = 0.5 + workingVector14.w;
                workingVector16.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector18.xy;
                workingVector17.xy = workingVector16.zw * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector15.zw;
#endif
                if (workingVector8.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector14.w = materialTexture6.SampleLevel(textureSampler6, workingVector15.xyz, 0).x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector14.w = materialTexture6.SampleLevel(textureSampler6, workingVector17.xyz, 0).x;
#endif
                  workingVector14.w = RD_COMPARISON_MASK(workingVector14.w >= workingVector7.w);
                  workingVector14.w = workingVector14.w ? 1.000000 : 0;
                  workingVector12.w = workingVector14.w + workingVector12.w;
                } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                  workingVector17.xyzw = materialTexture6.Gather(textureSampler6, workingVector15.xyz).xyzw;
                  workingVector15.xy = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector15.xy = frac(workingVector15.xy);
                  workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector7.wwww);
                  workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                  workingVector16.xz = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector16.xz = workingVector18.zy + workingVector16.xz;
                  workingVector15.xw = workingVector15.xx * workingVector16.xz + workingVector18.wx;
                  workingVector14.w = workingVector15.w + -workingVector15.x;
                  workingVector14.w = workingVector15.y * workingVector14.w + workingVector15.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                  workingVector19.xyzw = materialTexture6.Gather(textureSampler6, workingVector17.xyz).xyzw;
                  workingVector16.zw = workingVector17.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector16.zw = frac(workingVector16.zw);
                  workingVector19.xyzw = RD_COMPARISON_MASK(workingVector19.xyzw >= workingVector7.wwww);
                  workingVector20.xyzw = workingVector19.xyzw ? float4(1,1,1,1) : 0;
                  workingVector17.xy = workingVector19.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector17.xy = workingVector20.zy + workingVector17.xy;
                  workingVector17.xy = workingVector16.zz * workingVector17.xy + workingVector20.wx;
                  workingVector14.w = workingVector17.y + -workingVector17.x;
                  workingVector14.w = workingVector16.w * workingVector14.w + workingVector17.x;
#endif
                  workingVector12.w = workingVector14.w + workingVector12.w;
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector14.z = (int)workingVector14.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector13.w = (int)workingVector13.w + 1;
#endif
              }
              workingVector10.w = workingVector12.w;
              workingVector11.w = (int)workingVector11.w + 1;
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.w = workingVector10.w / workingVector14.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.w = workingVector10.w / workingVector16.y;
#endif
          } else {
            workingVector7.w = 1;
          }
        } else {
          workingVector7.w = 1;
        }
        workingVector9.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector9.w = RD_COMPARISON_MASK(0 < (int)workingVector9.w);
        workingVector10.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector10.w = RD_COMPARISON_MASK(0 < (int)workingVector10.w);
        workingVector9.w = workingVector9.w ? workingVector10.w : 0;
        if (workingVector9.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector12.yyyy;
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector12.xxxx + workingVector14.xyzw;
          workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector12.zzzz + workingVector14.xyzw;
          workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector12.xyzw;
          workingVector12.xyzw = workingVector12.xyzw / workingVector12.wwww;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector16.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector14.yyyy;
          workingVector16.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector14.xxxx + workingVector16.xyzw;
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector14.zzzz + workingVector16.xyzw;
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector14.xyzw;
          workingVector14.xyzw = workingVector14.xyzw / workingVector14.wwww;
#endif
          workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector6.w);
          workingVector6.w = min(1, workingVector6.w);
          workingVector9.w = -workingVector6.w * workingVector6.w + 1;
          workingVector9.w = sqrt(workingVector9.w);
          workingVector6.w = workingVector9.w / workingVector6.w;
          workingVector6.w = fragmentVectorConstants1[workingVector11.w+49].z * workingVector6.w + fragmentVectorConstants1[workingVector11.w+49].y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector6.w = workingVector6.w / workingVector12.w;
          workingVector6.w = workingVector12.z + -workingVector6.w;
          workingVector12.xy = workingVector12.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector12.z = 1 + -workingVector12.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector6.w = workingVector6.w / workingVector14.w;
          workingVector6.w = workingVector14.z + -workingVector6.w;
          workingVector14.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector14.z = 1 + -workingVector14.y;
#endif
          workingVector9.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector9.w = (int)workingVector9.w;
          workingVector9.w = max(1, (int)workingVector9.w);
          workingVector9.w = min(9, (int)workingVector9.w);
          workingVector9.w = workingVector8.w ? 1 : workingVector9.w;
          workingVector10.w = (uint)workingVector9.w >> 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector16.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
#endif
          workingVector11.w = 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector12.y = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.w = 0;
#endif
          while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.y >= (int)workingVector9.w);
            if (workingVector12.w != 0) break;
            workingVector12.w = (int)-workingVector10.w + (int)workingVector12.y;
            workingVector12.w = (int)workingVector12.w;
            workingVector15.y = 0.5 + workingVector12.w;
            workingVector12.w = workingVector11.w;
            workingVector13.z = 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector9.w);
            if (workingVector13.w != 0) break;
            workingVector13.w = (int)-workingVector10.w + (int)workingVector12.w;
            workingVector13.w = (int)workingVector13.w;
            workingVector17.y = 0.5 + workingVector13.w;
            workingVector13.w = workingVector11.w;
            workingVector14.y = 0;
#endif
            while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.w = RD_COMPARISON_MASK((int)workingVector13.z >= (int)workingVector9.w);
              if (workingVector13.w != 0) break;
              workingVector13.w = (int)-workingVector10.w + (int)workingVector13.z;
              workingVector13.w = (int)workingVector13.w;
              workingVector15.x = 0.5 + workingVector13.w;
              workingVector15.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector15.xy;
              workingVector15.xz = fragmentVectorConstants1[workingVector11.w+49].xx * workingVector15.xz;
              workingVector14.xy = workingVector12.xz * fragmentVectorConstants1[workingVector11.w+49].xx + workingVector15.xz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.w = RD_COMPARISON_MASK((int)workingVector14.y >= (int)workingVector9.w);
              if (workingVector14.w != 0) break;
              workingVector14.w = (int)-workingVector10.w + (int)workingVector14.y;
              workingVector14.w = (int)workingVector14.w;
              workingVector17.x = 0.5 + workingVector14.w;
              workingVector15.zw = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector17.xy;
              workingVector15.zw = fragmentVectorConstants1[workingVector11.w+49].xx * workingVector15.zw;
              workingVector16.xy = workingVector14.xz * fragmentVectorConstants1[workingVector11.w+49].xx + workingVector15.zw;
#endif
              if (workingVector8.w != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector13.w = materialTexture6.SampleLevel(textureSampler6, workingVector14.xyz, 0).x;
                workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector6.w);
                workingVector13.w = workingVector13.w ? 1.000000 : 0;
                workingVector12.w = workingVector13.w + workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector14.w = materialTexture6.SampleLevel(textureSampler6, workingVector16.xyz, 0).x;
                workingVector14.w = RD_COMPARISON_MASK(workingVector14.w >= workingVector6.w);
                workingVector14.w = workingVector14.w ? 1.000000 : 0;
                workingVector13.w = workingVector14.w + workingVector13.w;
#endif
              } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                workingVector16.xyzw = materialTexture6.Gather(textureSampler6, workingVector14.xyz).xyzw;
                workingVector14.xy = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector14.xy = frac(workingVector14.xy);
                workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector6.wwww);
                workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                workingVector15.xz = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector15.xz = workingVector17.zy + workingVector15.xz;
                workingVector14.xw = workingVector14.xx * workingVector15.xz + workingVector17.wx;
                workingVector13.w = workingVector14.w + -workingVector14.x;
                workingVector13.w = workingVector14.y * workingVector13.w + workingVector14.x;
                workingVector12.w = workingVector13.w + workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                workingVector18.xyzw = materialTexture6.Gather(textureSampler6, workingVector16.xyz).xyzw;
                workingVector15.zw = workingVector16.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector15.zw = frac(workingVector15.zw);
                workingVector18.xyzw = RD_COMPARISON_MASK(workingVector18.xyzw >= workingVector6.wwww);
                workingVector19.xyzw = workingVector18.xyzw ? float4(1,1,1,1) : 0;
                workingVector16.xy = workingVector18.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector16.xy = workingVector19.zy + workingVector16.xy;
                workingVector16.xy = workingVector15.zz * workingVector16.xy + workingVector19.wx;
                workingVector14.w = workingVector16.y + -workingVector16.x;
                workingVector14.w = workingVector15.w * workingVector14.w + workingVector16.x;
                workingVector13.w = workingVector14.w + workingVector13.w;
#endif
              }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
              workingVector13.z = (int)workingVector13.z + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
              workingVector14.y = (int)workingVector14.y + 1;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = workingVector12.w;
            workingVector12.y = (int)workingVector12.y + 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.w = workingVector13.w;
            workingVector12.w = (int)workingVector12.w + 1;
#endif
          }
          workingVector6.w = (int)workingVector9.w * (int)workingVector9.w;
          workingVector6.w = (int)workingVector6.w;
          workingVector6.w = workingVector11.w / workingVector6.w;
          workingVector8.w = RD_COMPARISON_MASK(workingVector6.w < 1);
          workingVector9.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector6.w = max(workingVector9.w, workingVector6.w);
          workingVector6.w = min(1, workingVector6.w);
          workingVector6.w = workingVector8.w ? workingVector6.w : 1;
        } else {
          workingVector6.w = 1;
        }
        workingVector6.w = min(workingVector7.w, workingVector6.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector6.w = min(workingVector13.y, workingVector6.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector6.w = min(workingVector15.y, workingVector6.w);
#endif
        workingVector7.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector7.w = min(8, workingVector7.w);
        workingVector7.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector7.w;
        workingVector7.w = max(0, workingVector7.w);
        workingVector8.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector7.w;
        workingVector7.w = -workingVector7.w + -workingVector5.z;
        workingVector8.w = 1 / workingVector8.w;
        workingVector7.w = saturate(workingVector8.w * workingVector7.w);
        workingVector8.w = workingVector7.w * -2 + 3;
        workingVector7.w = workingVector7.w * workingVector7.w;
        workingVector7.w = workingVector8.w * workingVector7.w;
        workingVector8.w = 1 + -workingVector6.w;
        workingVector6.w = workingVector7.w * workingVector8.w + workingVector6.w;
      } else {
        workingVector6.w = 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.x = 1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector15.x = 1;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector12.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector12.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector12.xyz;
      workingVector7.w = dot(workingVector12.xyz, workingVector12.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector14.xyz;
      workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector14.xyz;
      workingVector14.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector14.xyz;
      workingVector7.w = dot(workingVector14.xyz, workingVector14.xyz);
#endif
      workingVector7.w = rsqrt(workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector13.yzw = workingVector12.xyz * workingVector7.www;
      workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector14.xyz = workingVector14.xyz * workingVector3.yyy;
      workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector14.xyz;
      workingVector3.y = dot(workingVector6.xyz, workingVector13.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector15.yzw = workingVector14.xyz * workingVector7.www;
      workingVector16.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector16.xyz = workingVector16.xyz * workingVector3.yyy;
      workingVector16.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector16.xyz;
      workingVector3.y = dot(workingVector6.xyz, workingVector15.yzw);
#endif
      workingVector8.w = max(0, workingVector3.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector9.w = dot(workingVector6.xyz, -workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.w = dot(workingVector6.xyz, -workingVector12.xyz);
#endif
      workingVector9.w = max(0, workingVector9.w);
      workingVector3.y = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector3.y;
      workingVector10.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector3.y = workingVector3.y / workingVector10.w;
      workingVector3.y = max(0, workingVector3.y);
      workingVector3.y = workingVector3.y + -workingVector8.w;
      workingVector3.y = workingVector4.x * workingVector3.y + workingVector8.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.w = dot(-workingVector6.xyz, workingVector13.yzw);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.w = dot(-workingVector6.xyz, workingVector15.yzw);
#endif
      workingVector11.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector11.w;
      workingVector10.w = workingVector11.w / workingVector10.w;
      workingVector10.w = max(0, workingVector10.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.x = workingVector10.w * workingVector4.x;
      workingVector12.xyz = workingVector12.xyz * workingVector7.www + -workingVector11.xyz;
      workingVector7.w = dot(workingVector12.xyz, workingVector12.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector10.w = workingVector10.w * workingVector4.x;
      workingVector14.xyz = workingVector14.xyz * workingVector7.www + -workingVector12.xyz;
      workingVector7.w = dot(workingVector14.xyz, workingVector14.xyz);
#endif
      workingVector7.w = rsqrt(workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.xyz = workingVector12.xyz * workingVector7.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector14.xyz = workingVector14.xyz * workingVector7.www;
#endif
      workingVector7.w = max(0.0500000007, workingVector3.z);
      workingVector7.w = workingVector7.w * workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector10.w = workingVector7.w * workingVector7.w;
      workingVector11.w = dot(workingVector6.xyz, workingVector12.xyz);
      workingVector11.w = max(0, workingVector11.w);
      workingVector12.w = workingVector7.w * workingVector7.w + -1;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector11.w = workingVector11.w * workingVector12.w + 1;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector11.w = 3.14159274 * workingVector11.w;
      workingVector10.w = workingVector10.w / workingVector11.w;
      workingVector11.w = 0.5 * workingVector7.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector11.w = workingVector7.w * workingVector7.w;
      workingVector12.w = dot(workingVector6.xyz, workingVector14.xyz);
      workingVector12.w = max(0, workingVector12.w);
      workingVector13.w = workingVector7.w * workingVector7.w + -1;
      workingVector12.w = workingVector12.w * workingVector12.w;
      workingVector12.w = workingVector12.w * workingVector13.w + 1;
      workingVector12.w = workingVector12.w * workingVector12.w;
      workingVector12.w = 3.14159274 * workingVector12.w;
      workingVector11.w = workingVector11.w / workingVector12.w;
      workingVector12.w = 0.5 * workingVector7.w;
#endif
      workingVector7.w = -workingVector7.w * 0.5 + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.w = workingVector9.w * workingVector7.w + workingVector11.w;
      workingVector12.w = 9.99999975e-005 + workingVector12.w;
      workingVector12.w = workingVector9.w / workingVector12.w;
      workingVector7.w = workingVector8.w * workingVector7.w + workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector13.w = workingVector9.w * workingVector7.w + workingVector12.w;
      workingVector13.w = 9.99999975e-005 + workingVector13.w;
      workingVector13.w = workingVector9.w / workingVector13.w;
      workingVector7.w = workingVector8.w * workingVector7.w + workingVector12.w;
#endif
      workingVector7.w = 9.99999975e-005 + workingVector7.w;
      workingVector7.w = workingVector8.w / workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector7.w = workingVector12.w * workingVector7.w;
      workingVector11.x = dot(-workingVector11.xyz, workingVector12.xyz);
      workingVector11.x = max(0, workingVector11.x);
      workingVector11.yzw = float3(1,1,1) + -workingVector9.xyz;
      workingVector11.x = 1 + -workingVector11.x;
      workingVector11.x = max(0, workingVector11.x);
      workingVector12.x = workingVector11.x * workingVector11.x;
      workingVector12.x = workingVector12.x * workingVector12.x;
      workingVector11.x = workingVector12.x * workingVector11.x;
      workingVector11.xyz = workingVector11.yzw * workingVector11.xxx + workingVector9.xyz;
      workingVector12.xyz = workingVector2.www * workingVector0.xyz;
      workingVector13.yzw = float3(1,1,1) + -workingVector11.xyz;
      workingVector13.yzw = workingVector13.yzw * workingVector3.yyy;
      workingVector12.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector12.xyz;
      workingVector13.yzw = workingVector13.yzw * workingVector12.xyz;
      workingVector12.xyz = workingVector12.xyz * workingVector4.xxx;
      workingVector11.xyz = workingVector11.xyz * workingVector10.www;
      workingVector11.xyz = workingVector11.xyz * workingVector7.www;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector7.w = workingVector13.w * workingVector7.w;
      workingVector12.w = dot(-workingVector12.xyz, workingVector14.xyz);
      workingVector12.w = max(0, workingVector12.w);
      workingVector14.xyz = float3(1,1,1) + -workingVector10.xyz;
      workingVector12.w = 1 + -workingVector12.w;
      workingVector12.w = max(0, workingVector12.w);
      workingVector13.w = workingVector12.w * workingVector12.w;
      workingVector13.w = workingVector13.w * workingVector13.w;
      workingVector12.w = workingVector13.w * workingVector12.w;
      workingVector14.xyz = workingVector14.xyz * workingVector12.www + workingVector10.xyz;
      workingVector15.yzw = workingVector2.www * workingVector0.xyz;
      workingVector17.xyz = float3(1,1,1) + -workingVector14.xyz;
      workingVector17.xyz = workingVector17.xyz * workingVector3.yyy;
      workingVector15.yzw = float3(0.318309873,0.318309873,0.318309873) * workingVector15.yzw;
      workingVector17.xyz = workingVector17.xyz * workingVector15.yzw;
      workingVector15.yzw = workingVector15.yzw * workingVector10.www;
      workingVector14.xyz = workingVector14.xyz * workingVector11.www;
      workingVector14.xyz = workingVector14.xyz * workingVector7.www;
#endif
      workingVector3.y = workingVector9.w * workingVector8.w;
      workingVector3.y = workingVector3.y * 4 + 9.99999975e-005;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = workingVector11.xyz / workingVector3.yyy;
      workingVector11.xyz = workingVector11.xyz * workingVector8.www;
      workingVector12.xyz = workingVector12.xyz * workingVector13.xxx;
      workingVector12.xyz = workingVector13.yzw * workingVector6.www + workingVector12.xyz;
      workingVector12.xyz = workingVector12.xyz * workingVector14.xyz;
      workingVector12.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector12.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector6.www;
      workingVector11.xyz = workingVector11.xyz * workingVector14.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector14.xyz = workingVector14.xyz / workingVector3.yyy;
      workingVector14.xyz = workingVector14.xyz * workingVector8.www;
      workingVector15.xyz = workingVector15.yzw * workingVector15.xxx;
      workingVector15.xyz = workingVector17.xyz * workingVector6.www + workingVector15.xyz;
      workingVector15.xyz = workingVector15.xyz * workingVector16.xyz;
      workingVector15.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector15.xyz;
      workingVector14.xyz = workingVector14.xyz * workingVector6.www;
      workingVector14.xyz = workingVector14.xyz * workingVector16.xyz;
      workingVector14.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector14.xyz;
#endif
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector12.xyz = float3(0,0,0);
      workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector15.xyz = float3(0,0,0);
      workingVector14.xyz = float3(0,0,0);
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector3.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z);
    if (workingVector3.y != 0) {
      workingVector6.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * -workingVector5.z;
      workingVector7.w = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * workingVector6.w;
      workingVector8.w = workingVector6.w * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w + workingVector5.x;
      workingVector7.w = workingVector7.w + workingVector7.w;
      workingVector7.w = saturate(workingVector8.w / workingVector7.w);
      workingVector8.w = -workingVector5.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + workingVector5.y;
      workingVector6.w = workingVector6.w + workingVector6.w;
      workingVector6.w = saturate(workingVector8.w / workingVector6.w);
      workingVector16.xy = RD_COMPARISON_MASK(-workingVector5.zz < RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.xy);
      workingVector8.w = log2(-workingVector5.z);
      workingVector8.w = -RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z + workingVector8.w;
      workingVector8.w = saturate(RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x * workingVector8.w);
      workingVector17.xyzw = float4(-2,-1,-1,-1) + RD_UNIFORM_CLUSTER_DIMENSIONS.zzxy;
      workingVector8.w = workingVector17.x * workingVector8.w;
      workingVector8.w = floor(workingVector8.w);
      workingVector8.w = 2 + workingVector8.w;
      workingVector8.w = min(workingVector8.w, workingVector17.y);
      workingVector8.w = workingVector16.y ? 1 : workingVector8.w;
      workingVector8.w = workingVector16.x ? 0 : workingVector8.w;
      workingVector7.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector7.w;
      workingVector7.w = floor(workingVector7.w);
      workingVector7.w = min(workingVector7.w, workingVector17.z);
      workingVector6.w = RD_UNIFORM_CLUSTER_DIMENSIONS.y * workingVector6.w;
      workingVector6.w = floor(workingVector6.w);
      workingVector6.w = min(workingVector6.w, workingVector17.w);
      workingVector9.w = RD_COMPARISON_MASK(workingVector7.w < 0);
      workingVector10.w = RD_COMPARISON_MASK(workingVector6.w < 0);
      workingVector9.w = (int)workingVector9.w | (int)workingVector10.w;
      workingVector10.w = RD_COMPARISON_MASK(workingVector8.w < 0);
      workingVector9.w = (int)workingVector9.w | (int)workingVector10.w;
      workingVector10.w = RD_COMPARISON_MASK(workingVector7.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.x);
      workingVector9.w = (int)workingVector9.w | (int)workingVector10.w;
      workingVector10.w = RD_COMPARISON_MASK(workingVector6.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.y);
      workingVector9.w = (int)workingVector9.w | (int)workingVector10.w;
      workingVector10.w = RD_COMPARISON_MASK(workingVector8.w >= RD_UNIFORM_CLUSTER_DIMENSIONS.z);
      workingVector9.w = (int)workingVector9.w | (int)workingVector10.w;
      if (workingVector9.w == 0) {
        workingVector6.w = workingVector6.w * RD_UNIFORM_CLUSTER_DIMENSIONS.x + workingVector7.w;
        workingVector7.w = RD_UNIFORM_CLUSTER_DIMENSIONS.x * workingVector8.w;
        workingVector6.w = workingVector7.w * RD_UNIFORM_CLUSTER_DIMENSIONS.y + workingVector6.w;
        workingVector6.w = (int)workingVector6.w;
        workingVector7.w = (int)RD_UNIFORM_CLUSTER_DIMENSIONS.w;
        workingVector8.w = (int)workingVector6.w * (int)workingVector7.w;
        workingVector6.w = mad((int)workingVector6.w, (int)workingVector7.w, (int)workingVector7.w);
        workingVector7.w = dot(workingVector6.xyz, -workingVector12.xyz);
        workingVector7.w = max(0, workingVector7.w);
        workingVector9.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
        workingVector9.w = workingVector9.w * workingVector9.w;
        workingVector10.w = max(0.0500000007, workingVector3.z);
        workingVector10.w = workingVector10.w * workingVector10.w;
        workingVector11.w = workingVector10.w * workingVector10.w;
        workingVector12.w = workingVector10.w * workingVector10.w + -1;
        workingVector13.w = 0.5 * workingVector10.w;
        workingVector10.w = -workingVector10.w * 0.5 + 1;
        workingVector14.w = workingVector7.w * workingVector10.w + workingVector13.w;
        workingVector14.w = 9.99999975e-005 + workingVector14.w;
        workingVector14.w = workingVector7.w / workingVector14.w;
        workingVector16.xyz = float3(1,1,1) + -workingVector10.xyz;
        workingVector17.xyz = workingVector2.www * workingVector0.xyz;
        workingVector17.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector17.xyz;
        workingVector15.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x);
        workingVector16.w = RD_COMPARISON_MASK(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.000000);
        workingVector17.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x);
        workingVector18.x = RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
        workingVector18.yz = float2(0.5,0.5) / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xy;
        workingVector18.w = RD_COMPARISON_MASK(0 < workingVector4.x);
        workingVector18.x = 1 / workingVector18.x;
        workingVector19.xyz = float3(0,0,0);
        workingVector20.xyz = float3(0,0,0);
        workingVector19.w = workingVector8.w;
        while (true) {
          workingVector20.w = RD_COMPARISON_MASK((int)workingVector19.w >= (int)workingVector6.w);
          if (workingVector20.w != 0) break;
          workingVector20.w = sampledResource11[workingVector19.w].val[0/4];
          workingVector20.w = (int)workingVector20.w;
          workingVector21.x = RD_COMPARISON_MASK((int)workingVector20.w < 0);
          if (workingVector21.x != 0) {
            break;
          }
          workingVector21.x = sampledResource12[workingVector20.w].val[0/4];
          workingVector21.y = sampledResource12[workingVector20.w].val[0/4+1];
          workingVector21.z = sampledResource12[workingVector20.w].val[0/4+2];
          workingVector22.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector21.yyy;
          workingVector22.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector21.xxx + workingVector22.xyz;
          workingVector22.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector21.zzz + workingVector22.xyz;
          workingVector22.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector22.xyz;
          workingVector22.xyz = workingVector22.xyz + workingVector9.xyz;
          workingVector21.w = dot(workingVector22.xyz, workingVector22.xyz);
          workingVector21.w = rsqrt(workingVector21.w);
          workingVector23.xyz = workingVector22.xyz * workingVector21.www;
          workingVector22.w = dot(workingVector6.xyz, workingVector23.xyz);
          workingVector23.w = max(0, workingVector22.w);
          workingVector22.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector22.w;
          workingVector22.w = workingVector22.w / workingVector9.w;
          workingVector22.w = max(0, workingVector22.w);
          workingVector22.w = workingVector22.w + -workingVector23.w;
          workingVector22.w = workingVector4.x * workingVector22.w + workingVector23.w;
          workingVector23.x = dot(-workingVector6.xyz, workingVector23.xyz);
          workingVector23.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector23.x;
          workingVector23.x = workingVector23.x / workingVector9.w;
          workingVector23.x = max(0, workingVector23.x);
          workingVector23.x = workingVector23.x * workingVector4.x;
          workingVector22.xyz = workingVector22.xyz * workingVector21.www + -workingVector12.xyz;
          workingVector21.w = dot(workingVector22.xyz, workingVector22.xyz);
          workingVector21.w = rsqrt(workingVector21.w);
          workingVector22.xyz = workingVector22.xyz * workingVector21.www;
          workingVector21.w = dot(workingVector6.xyz, workingVector22.xyz);
          workingVector21.w = max(0, workingVector21.w);
          workingVector21.w = workingVector21.w * workingVector21.w;
          workingVector21.w = workingVector21.w * workingVector12.w + 1;
          workingVector21.w = workingVector21.w * workingVector21.w;
          workingVector21.w = 3.14159274 * workingVector21.w;
          workingVector21.w = workingVector11.w / workingVector21.w;
          workingVector23.y = workingVector23.w * workingVector10.w + workingVector13.w;
          workingVector23.y = 9.99999975e-005 + workingVector23.y;
          workingVector23.y = workingVector23.w / workingVector23.y;
          workingVector23.y = workingVector23.y * workingVector14.w;
          workingVector22.x = dot(-workingVector12.xyz, workingVector22.xyz);
          workingVector22.x = max(0, workingVector22.x);
          workingVector22.x = 1 + -workingVector22.x;
          workingVector22.x = max(0, workingVector22.x);
          workingVector22.y = workingVector22.x * workingVector22.x;
          workingVector22.y = workingVector22.y * workingVector22.y;
          workingVector22.x = workingVector22.y * workingVector22.x;
          workingVector22.xyz = workingVector16.xyz * workingVector22.xxx + workingVector10.xyz;
          workingVector24.xyz = float3(1,1,1) + -workingVector22.xyz;
          workingVector24.xyz = workingVector24.xyz * workingVector22.www;
          workingVector24.xyz = workingVector24.xyz * workingVector17.xyz;
          workingVector25.xyz = workingVector23.xxx * workingVector17.xyz;
          workingVector22.xyz = workingVector22.xyz * workingVector21.www;
          workingVector22.xyz = workingVector22.xyz * workingVector23.yyy;
          workingVector21.w = workingVector23.w * workingVector7.w;
          workingVector21.w = workingVector21.w * 4 + 9.99999975e-005;
          workingVector22.xyz = workingVector22.xyz / workingVector21.www;
          workingVector22.xyz = workingVector23.www * workingVector22.xyz;
          workingVector21.w = RD_COMPARISON_MASK((int)workingVector20.w >= 0);
          if (workingVector21.w != 0) {
            workingVector23.x = sampledResource12[workingVector20.w].val[0/4];
            workingVector23.y = sampledResource12[workingVector20.w].val[0/4+1];
            workingVector23.z = sampledResource12[workingVector20.w].val[0/4+2];
            workingVector23.w = sampledResource12[workingVector20.w].val[0/4+3];
            workingVector23.xyz = -varyingTexCoord3.xyz + workingVector23.xyz;
            workingVector21.w = abs(workingVector23.x) + abs(workingVector23.y);
            workingVector21.w = workingVector21.w + abs(workingVector23.z);
            workingVector21.w = workingVector21.w * workingVector21.w;
            workingVector22.w = dot(workingVector23.xyz, workingVector23.xyz);
            workingVector21.w = workingVector15.w ? workingVector21.w : workingVector22.w;
            workingVector22.w = workingVector23.w * workingVector23.w;
            workingVector22.w = RD_COMPARISON_MASK(workingVector21.w < workingVector22.w);
            if (workingVector22.w != 0) {
              if (workingVector16.w != 0) {
                workingVector26.x = sampledResource12[workingVector20.w].val[32/4];
                workingVector26.y = sampledResource12[workingVector20.w].val[32/4+1];
                workingVector26.z = sampledResource12[workingVector20.w].val[32/4+2];
                workingVector26.w = sampledResource12[workingVector20.w].val[32/4+3];
                workingVector27.x = sampledResource12[workingVector20.w].val[48/4];
                workingVector27.y = sampledResource12[workingVector20.w].val[48/4+1];
                workingVector27.z = sampledResource12[workingVector20.w].val[48/4+2];
                workingVector27.w = sampledResource12[workingVector20.w].val[48/4+3];
                workingVector28.x = sampledResource12[workingVector20.w].val[64/4];
                workingVector28.y = sampledResource12[workingVector20.w].val[64/4+1];
                workingVector28.z = sampledResource12[workingVector20.w].val[64/4+2];
                workingVector28.w = sampledResource12[workingVector20.w].val[64/4+3];
                workingVector29.x = sampledResource12[workingVector20.w].val[80/4];
                workingVector29.y = sampledResource12[workingVector20.w].val[80/4+1];
                workingVector29.z = sampledResource12[workingVector20.w].val[80/4+2];
                workingVector29.w = sampledResource12[workingVector20.w].val[80/4+3];
                workingVector30.x = sampledResource12[workingVector20.w].val[96/4];
                workingVector30.y = sampledResource12[workingVector20.w].val[96/4+1];
                workingVector30.z = sampledResource12[workingVector20.w].val[96/4+2];
                workingVector30.w = sampledResource12[workingVector20.w].val[96/4+3];
                workingVector31.x = sampledResource12[workingVector20.w].val[112/4];
                workingVector31.y = sampledResource12[workingVector20.w].val[112/4+1];
                workingVector31.z = sampledResource12[workingVector20.w].val[112/4+2];
                workingVector31.w = sampledResource12[workingVector20.w].val[112/4+3];
                workingVector32.xyz = -workingVector21.xyz + workingVector13.xyz;
                workingVector21.xyz = RD_COMPARISON_MASK(abs(workingVector32.xxy) >= abs(workingVector32.yzz));
                workingVector21.x = workingVector21.y ? workingVector21.x : 0;
                workingVector23.xyz = RD_COMPARISON_MASK(workingVector32.xyz >= float3(0,0,0));
                workingVector23.xyz = workingVector23.xyz ? float3(0,2.80259693e-045,5.60519386e-045) : float3(1,3,5);
                workingVector21.y = workingVector21.z ? workingVector23.y : workingVector23.z;
                workingVector21.x = workingVector21.x ? workingVector23.x : workingVector21.y;
                workingVector33.xyzw = RD_COMPARISON_MASK((int4)workingVector21.xxxx == int4(1,2,3,4));
                workingVector21.x = RD_COMPARISON_MASK((int)workingVector21.x == 5);
                workingVector26.xyzw = workingVector21.xxxx ? workingVector31.xyzw : workingVector26.xyzw;
                workingVector26.xyzw = workingVector33.wwww ? workingVector30.xyzw : workingVector26.xyzw;
                workingVector26.xyzw = workingVector33.zzzz ? workingVector29.xyzw : workingVector26.xyzw;
                workingVector26.xyzw = workingVector33.yyyy ? workingVector28.xyzw : workingVector26.xyzw;
                workingVector26.xyzw = workingVector33.xxxx ? workingVector27.xyzw : workingVector26.xyzw;
                workingVector21.yz = RD_COMPARISON_MASK(workingVector26.zw == float2(0,0));
                workingVector21.y = workingVector21.z ? workingVector21.y : 0;
                if (workingVector21.y == 0) {
                  workingVector32.w = -workingVector32.x;
                  workingVector21.xy = workingVector21.xx ? workingVector32.xz : workingVector32.zw;
                  workingVector21.xz = workingVector33.ww ? -workingVector32.xz : workingVector21.xy;
                  workingVector23.xyz = float3(-1,1,1) * workingVector32.xzy;
                  workingVector21.y = workingVector23.z;
                  workingVector21.xyz = workingVector33.zzz ? workingVector23.xyz : workingVector21.xyz;
                  workingVector21.xyz = workingVector33.yyy ? -workingVector32.xzy : workingVector21.xyz;
                  workingVector23.xyz = float3(-1,1,1) * workingVector32.zyx;
                  workingVector21.xyz = workingVector33.xxx ? workingVector23.xyz : workingVector21.xyz;
                  workingVector27.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.xyzw * workingVector21.yyyy;
                  workingVector27.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.xyzw * workingVector21.xxxx + workingVector27.xyzw;
                  workingVector27.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.xyzw * workingVector21.zzzz + workingVector27.xyzw;
                  workingVector27.xyzw = RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.xyzw + workingVector27.xyzw;
                  workingVector22.w = dot(-workingVector32.xyz, -workingVector32.xyz);
                  workingVector22.w = rsqrt(workingVector22.w);
                  workingVector23.xyz = -workingVector32.xyz * workingVector22.www;
                  workingVector22.w = dot(workingVector23.xyz, workingVector1.xyw);
                  workingVector22.w = max(RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x, workingVector22.w);
                  workingVector22.w = min(1, workingVector22.w);
                  workingVector23.x = -workingVector22.w * workingVector22.w + 1;
                  workingVector23.x = sqrt(workingVector23.x);
                  workingVector22.w = workingVector23.x / workingVector22.w;
                  workingVector22.w = RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y * workingVector22.w + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x;
                  workingVector23.xyz = workingVector26.zzw + -workingVector26.xxy;
                  workingVector28.xyz = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.xxy * workingVector23.xyz;
                  workingVector23.x = max(1, workingVector28.x);
                  workingVector23.x = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / workingVector23.x;
                  workingVector27.z = -workingVector22.w * workingVector23.x + workingVector27.z;
                  workingVector27.xyz = workingVector27.xyz / workingVector27.www;
                  workingVector29.xy = workingVector27.xy * float2(0.5,0.5) + float2(0.5,0.5);
                  workingVector28.xw = workingVector26.xy + workingVector18.yz;
                  workingVector26.zw = workingVector26.zw + -workingVector18.yz;
                  workingVector29.z = 1 + -workingVector29.y;
                  workingVector29.xy = workingVector29.xz * workingVector28.yz;
                  workingVector29.xy = floor(workingVector29.xy);
                  workingVector29.xy = float2(0.5,0.5) + workingVector29.xy;
                  workingVector28.yz = workingVector29.xy / workingVector28.yz;
                  workingVector23.xy = workingVector28.yz * workingVector23.yz + workingVector26.xy;
                  workingVector23.xy = max(workingVector23.xy, workingVector28.xw);
                  workingVector23.xy = min(workingVector23.xy, workingVector26.zw);
                  workingVector22.w = materialTexture2.SampleLevel(textureSampler2, workingVector23.xy, 0).x;
                  workingVector23.x = RD_COMPARISON_MASK(workingVector22.w >= workingVector27.z);
                  workingVector23.x = workingVector23.x ? 1.000000 : 0;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.xyzw * workingVector27.yyyy;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.xyzw * workingVector27.xxxx + workingVector26.xyzw;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.xyzw * workingVector22.wwww + workingVector26.xyzw;
                  workingVector26.xyzw = RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.xyzw + workingVector26.xyzw;
                  workingVector26.xyz = workingVector26.xyz / workingVector26.www;
                  workingVector21.x = dot(workingVector21.xyz, workingVector21.xyz);
                  workingVector21.y = dot(workingVector26.xyz, workingVector26.xyz);
                  workingVector21.xy = sqrt(workingVector21.xy);
                  workingVector21.x = workingVector21.x + -workingVector21.y;
                  workingVector21.x = saturate(RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector21.x);
                  workingVector21.y = workingVector21.x * -2 + 3;
                  workingVector21.x = workingVector21.x * workingVector21.x;
                  workingVector21.x = -workingVector21.y * workingVector21.x + 1;
                  workingVector21.x = workingVector18.w ? workingVector21.x : 1;
                } else {
                  workingVector21.x = 1;
                  workingVector23.x = 0;
                }
              } else {
                workingVector23.x = 1;
                workingVector21.x = 1;
              }
              workingVector21.y = max(0.100000001, workingVector21.w);
              workingVector21.y = 1 / workingVector21.y;
              workingVector21.z = workingVector23.w * workingVector23.w + 9.99999975e-005;
              workingVector21.z = workingVector21.w / workingVector21.z;
              workingVector21.z = -workingVector21.z * workingVector21.z + 1;
              workingVector21.z = max(0, workingVector21.z);
              workingVector21.z = workingVector21.z * workingVector21.z;
              workingVector21.w = workingVector21.y * workingVector21.z;
              workingVector21.y = -workingVector21.y * workingVector21.z + -RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x;
              workingVector21.y = 1 + workingVector21.y;
              workingVector21.y = saturate(workingVector21.y * workingVector18.x);
              workingVector21.z = workingVector21.y * -2 + 3;
              workingVector21.y = workingVector21.y * workingVector21.y;
              workingVector21.y = workingVector21.z * workingVector21.y;
              workingVector21.y = saturate(workingVector21.y * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w);
              workingVector21.y = workingVector21.w * workingVector21.y;
              workingVector21.y = workingVector17.w ? workingVector21.y : workingVector21.w;
              workingVector26.x = sampledResource12[workingVector20.w].val[16/4];
              workingVector26.y = sampledResource12[workingVector20.w].val[16/4+1];
              workingVector26.z = sampledResource12[workingVector20.w].val[16/4+2];
              workingVector26.w = sampledResource12[workingVector20.w].val[16/4+3];
              workingVector23.yzw = workingVector26.xyz * workingVector26.www;
              workingVector21.yzw = workingVector23.yzw * workingVector21.yyy;
            } else {
              workingVector23.x = 1;
              workingVector21.xyzw = float4(1,0,0,0);
            }
          } else {
            workingVector23.x = 1;
            workingVector21.xyzw = float4(1,0,0,0);
          }
          workingVector23.yzw = workingVector25.xyz * workingVector21.xxx;
          workingVector23.yzw = workingVector24.xyz * workingVector23.xxx + workingVector23.yzw;
          workingVector23.yzw = workingVector23.yzw * workingVector21.yzw;
          workingVector19.xyz = workingVector23.yzw * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx + workingVector19.xyz;
          workingVector22.xyz = workingVector23.xxx * workingVector22.xyz;
          workingVector21.xyz = workingVector22.xyz * workingVector21.yzw;
          workingVector20.xyz = workingVector21.xyz * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy + workingVector20.xyz;
          workingVector19.w = (int)workingVector19.w + 1;
        }
      } else {
        workingVector19.xyz = float3(0,0,0);
        workingVector20.xyz = float3(0,0,0);
      }
      workingVector4.x = 1 + -RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
      workingVector15.xyz = workingVector4.xxx * workingVector19.xyz + workingVector15.xyz;
      workingVector14.xyz = workingVector4.xxx * workingVector20.xyz + workingVector14.xyz;
    }
    workingVector4.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    workingVector3.y = workingVector3.y ? workingVector4.x : 0;
#endif
    if (workingVector3.y != 0) {
      workingVector7.xyz = float3(-0.5,-0.5,-0.5) + workingVector7.xyz;
      workingVector7.xyz = workingVector1.xyw * float3(0.200000003,0.200000003,0.200000003) + workingVector7.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector13.xyz = floor(workingVector7.xyz);
      workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
      workingVector13.xyz = floor(workingVector13.xyz);
      workingVector13.xyz = (int3)workingVector13.xyz;
      bitMask.y = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector3.y = (((uint)workingVector13.y << 16) & bitMask.y) | ((uint)workingVector13.x & ~bitMask.y);
      workingVector4.x = (int)workingVector13.z & 0x0000ffff;
      workingVector13.xyz = (int3)workingVector13.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector14.xyz = (uint3)workingVector13.xyz >> int3(24,24,24);
      workingVector13.xyz = (int3)workingVector13.xyz ^ (int3)workingVector14.xyz;
      workingVector13.xyz = (int3)workingVector13.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector6.w = (int)workingVector13.x ^ 0x88b16480;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.xyz = floor(workingVector7.xyz);
      workingVector9.xyz = float3(0.0625,0.0625,0.0625) * workingVector9.xyz;
      workingVector9.xyz = floor(workingVector9.xyz);
      workingVector9.xyz = (int3)workingVector9.xyz;
      bitMask.y = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector3.y = (((uint)workingVector9.y << 16) & bitMask.y) | ((uint)workingVector9.x & ~bitMask.y);
      bitMask.x = ((~(-1 << 16)) << 0) & 0xffffffff;  workingVector4.x = (((uint)workingVector9.z << 0) & bitMask.x) | ((uint)0x00020000 & ~bitMask.x);
      workingVector9.xyz = (int3)workingVector9.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector12.xyz = (uint3)workingVector9.xyz >> int3(24,24,24);
      workingVector9.xyz = (int3)workingVector9.xyz ^ (int3)workingVector12.xyz;
      workingVector9.xyz = (int3)workingVector9.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector6.w = (int)workingVector9.x ^ 0x88b16480;
#endif
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector6.w = (int)workingVector13.y ^ (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.w = (int)workingVector9.y ^ (int)workingVector6.w;
#endif
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector6.w = (int)workingVector13.z ^ (int)workingVector6.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.w = (int)workingVector9.z ^ (int)workingVector6.w;
#endif
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector6.w = (int)workingVector6.w ^ 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector6.w = (int)workingVector6.w ^ 0x90210f61;
#endif
      workingVector7.w = (uint)workingVector6.w >> 13;
      workingVector6.w = (int)workingVector6.w ^ (int)workingVector7.w;
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
      workingVector7.w = (uint)workingVector6.w >> 15;
      workingVector6.w = (int)workingVector6.w ^ (int)workingVector7.w;
      workingVector7.w = (uint)workingVector6.w >> 16;
      workingVector6.w = (int)workingVector6.w ^ (int)workingVector7.w;
      workingVector6.w = (int)workingVector6.w & 0x0000ffff;
      workingVector7.w = workingVector6.w ? 0 : 1;
      workingVector6.w = (int)workingVector6.w | (int)workingVector7.w;
      workingVector7.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
      workingVector7.w = (int)workingVector7.w + -1;
      workingVector8.w = (int)workingVector6.w & (int)workingVector7.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector13.x = workingVector8.w;
      workingVector13.yzw = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.x = workingVector8.w;
      workingVector9.yzw = float3(0,0,0);
#endif
      while (true) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector13.y >= 8);
        if (workingVector9.w != 0) break;
        workingVector14.x = sampledResource8[workingVector13.x].val[0/4];
        workingVector14.y = sampledResource8[workingVector13.x].val[0/4+1];
        workingVector14.z = sampledResource8[workingVector13.x].val[0/4+2];
        workingVector14.w = sampledResource8[workingVector13.x].val[0/4+3];
        workingVector9.w = (int)workingVector14.z & 0x0000ffff;
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector6.w == (int)workingVector9.w);
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector3.y == (int)workingVector14.x);
        workingVector9.w = workingVector9.w ? workingVector11.w : 0;
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector4.x == (int)workingVector14.y);
        workingVector9.w = workingVector9.w ? workingVector11.w : 0;
        workingVector11.w = workingVector9.w ? workingVector14.w : workingVector13.z;
        workingVector14.x = workingVector13.w ? workingVector13.z : workingVector11.w;
        workingVector14.y = (int)workingVector9.w | (int)workingVector13.w;
        workingVector9.w = (int)workingVector13.x + 1;
        workingVector13.x = (int)workingVector7.w & (int)workingVector9.w;
        workingVector9.w = (int)workingVector10.w | (int)workingVector14.y;
        if (workingVector9.w != 0) {
          workingVector13.zw = workingVector14.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.y >= 8);
        if (workingVector10.w != 0) break;
        workingVector12.x = sampledResource8[workingVector9.x].val[0/4];
        workingVector12.y = sampledResource8[workingVector9.x].val[0/4+1];
        workingVector12.z = sampledResource8[workingVector9.x].val[0/4+2];
        workingVector12.w = sampledResource8[workingVector9.x].val[0/4+3];
        workingVector10.w = (int)workingVector12.z & 0x0000ffff;
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector6.w == (int)workingVector10.w);
        workingVector12.x = RD_COMPARISON_MASK((int)workingVector3.y == (int)workingVector12.x);
        workingVector10.w = workingVector10.w ? workingVector12.x : 0;
        workingVector12.x = RD_COMPARISON_MASK((int)workingVector4.x == (int)workingVector12.y);
        workingVector10.w = workingVector10.w ? workingVector12.x : 0;
        workingVector12.x = workingVector10.w ? workingVector12.w : workingVector9.z;
        workingVector12.x = workingVector9.w ? workingVector9.z : workingVector12.x;
        workingVector12.y = (int)workingVector9.w | (int)workingVector10.w;
        workingVector10.w = (int)workingVector9.x + 1;
        workingVector9.x = (int)workingVector7.w & (int)workingVector10.w;
        workingVector10.w = (int)workingVector11.w | (int)workingVector12.y;
        if (workingVector10.w != 0) {
          workingVector9.zw = workingVector12.xy;
#endif
          break;
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector13.y = (int)workingVector13.y + 1;
        workingVector13.zw = workingVector14.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.y = (int)workingVector9.y + 1;
        workingVector9.zw = workingVector12.xy;
#endif
      }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      if (workingVector13.w != 0) {
        workingVector13.xyw = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
        workingVector13.xyw = floor(workingVector13.xyw);
        workingVector7.xyz = -workingVector13.xyw * float3(16,16,16) + workingVector7.xyz;
        workingVector3.y = (uint)workingVector13.z >> 2;
        workingVector14.xyz = RD_COMPARISON_MASK(abs(workingVector1.xyw) >= float3(1,1,1));
        workingVector4.x = (int)workingVector14.y | (int)workingVector14.x;
        workingVector4.x = (int)workingVector14.z | (int)workingVector4.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      if (workingVector9.w != 0) {
        workingVector9.xyw = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
        workingVector9.xyw = floor(workingVector9.xyw);
        workingVector7.xyz = -workingVector9.xyw * float3(16,16,16) + workingVector7.xyz;
        workingVector3.y = (uint)workingVector9.z >> 2;
        workingVector12.xyz = RD_COMPARISON_MASK(abs(workingVector1.xyw) >= float3(1,1,1));
        workingVector4.x = (int)workingVector12.y | (int)workingVector12.x;
        workingVector4.x = (int)workingVector12.z | (int)workingVector4.x;
#endif
        if (workingVector4.x != 0) {
          workingVector4.x = dot(workingVector7.xyz, abs(workingVector1.xyw));
          workingVector6.w = dot(workingVector7.yzx, abs(workingVector1.xyw));
          workingVector7.w = dot(workingVector7.zxy, abs(workingVector1.xyw));
          workingVector8.w = workingVector1.x + workingVector1.y;
          workingVector0.w = workingVector1.z * workingVector0.w + workingVector8.w;
          workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
          workingVector1.z = ceil(workingVector4.x);
          workingVector4.x = floor(workingVector4.x);
          workingVector0.w = workingVector0.w ? workingVector1.z : workingVector4.x;
          workingVector1.z = floor(workingVector6.w);
          workingVector4.x = floor(workingVector7.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyz = abs(workingVector1.wxy) * workingVector1.zzz;
          workingVector14.xyz = abs(workingVector1.xyw) * workingVector0.www + workingVector14.xyz;
          workingVector14.xyz = abs(workingVector1.ywx) * workingVector4.xxx + workingVector14.xyz;
          workingVector15.xyz = workingVector14.xyz + abs(workingVector1.wxy);
          workingVector16.xyz = workingVector14.xyz + abs(workingVector1.ywx);
          workingVector17.xyz = workingVector15.xyz + abs(workingVector1.ywx);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = abs(workingVector1.wxy) * workingVector1.zzz;
          workingVector12.xyz = abs(workingVector1.xyw) * workingVector0.www + workingVector12.xyz;
          workingVector12.xyz = abs(workingVector1.ywx) * workingVector4.xxx + workingVector12.xyz;
          workingVector13.xyz = workingVector12.xyz + abs(workingVector1.wxy);
          workingVector16.xyz = workingVector12.xyz + abs(workingVector1.ywx);
          workingVector17.xyz = workingVector13.xyz + abs(workingVector1.ywx);
#endif
          workingVector0.w = workingVector6.w + -workingVector1.z;
          workingVector1.z = workingVector7.w + -workingVector4.x;
          workingVector4.x = 1 + -workingVector0.w;
          workingVector6.w = 1 + -workingVector1.z;
          workingVector7.w = workingVector6.w * workingVector4.x;
          workingVector6.w = workingVector6.w * workingVector0.w;
          workingVector4.x = workingVector4.x * workingVector1.z;
          workingVector0.w = workingVector1.z * workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector18.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector18.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(0,0,0));
#endif
          workingVector1.z = workingVector18.y ? workingVector18.x : 0;
          workingVector1.z = workingVector18.z ? workingVector1.z : 0;
          workingVector18.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(16,16,16));
          workingVector8.w = workingVector18.y ? workingVector18.x : 0;
          workingVector8.w = workingVector18.z ? workingVector8.w : 0;
          workingVector1.z = (int)workingVector1.z & (int)workingVector8.w;
          if (workingVector1.z != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector18.xyz = (uint3)workingVector14.xyz;
            workingVector19.xyz = (uint3)workingVector15.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector18.xyz = (uint3)workingVector12.xyz;
            workingVector19.xyz = (uint3)workingVector13.xyz;
#endif
            workingVector20.xyz = (uint3)workingVector16.xyz;
            workingVector21.xyz = (uint3)workingVector17.xyz;
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector1.z = (int)workingVector18.x + (int)workingVector18.y;
            workingVector1.z = (int)workingVector18.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.y;
            workingVector18.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector18.yzw = workingVector22.xyz * workingVector22.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector1.z = (int)workingVector19.x + (int)workingVector19.y;
            workingVector1.z = (int)workingVector19.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.y;
            workingVector19.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector19.yzw = workingVector22.xyz * workingVector22.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector1.z = (int)workingVector20.x + (int)workingVector20.y;
            workingVector1.z = (int)workingVector20.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.y;
            workingVector20.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector20.yzw = workingVector22.xyz * workingVector22.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
            workingVector21.xz = (uint2)workingVector21.zx << int2(4,8);
            workingVector1.z = (int)workingVector21.x + (int)workingVector21.y;
            workingVector1.z = (int)workingVector21.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.y;
            workingVector21.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector21.yzw = workingVector22.xyz * workingVector22.www;
            workingVector21.yzw = float3(6,6,6) * workingVector21.yzw;
            workingVector21.xyz = workingVector21.xxx ? workingVector21.yzw : float3(0,0,0);
          } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector22.xyz = workingVector13.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector22.xyz = workingVector9.xyw * float3(16,16,16) + workingVector12.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector12.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector12.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector23.x << 0) & bitMask.z) | ((uint)workingVector24.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector23.x;
            workingVector1.z = (int)workingVector24.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector23.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector24.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
            workingVector14.xy = (int2)workingVector3.yy + int2(4096,4097);
            workingVector10.w = sampledResource10[workingVector14.x].val[0/4];
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector12.y << 0) & bitMask.z) | ((uint)workingVector12.x & ~bitMask.z);
            workingVector9.z = (int)workingVector12.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
            workingVector12.xy = (int2)workingVector3.yy + int2(4096,4097);
            workingVector10.w = sampledResource10[workingVector12.x].val[0/4];
#endif
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
#endif
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector14.y + (int)icb[workingVector1.z+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector12.y + (int)icb[workingVector1.z+4].x;
#endif
            workingVector1.z = sampledResource10[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector14.xzw = floor(workingVector14.xzw);
            workingVector14.xzw = -workingVector14.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector12.w = (int)workingVector14.w + (int)workingVector12.w;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.w;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector12.xzw = floor(workingVector12.xzw);
            workingVector12.xzw = -workingVector12.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
            workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.x;
            workingVector1.z = workingVector8.w ? workingVector9.z : workingVector1.z;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector22.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector23.xyz * workingVector23.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector22.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector23.xyz * workingVector23.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector22.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector9.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector22.x << 0) & bitMask.z) | ((uint)workingVector23.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector22.x;
            workingVector1.z = (int)workingVector23.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector22.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector23.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector9.w = (int)workingVector15.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.y << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector9.z = (int)workingVector13.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
#endif
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
#endif
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector14.y + (int)icb[workingVector1.z+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector12.y + (int)icb[workingVector1.z+4].x;
#endif
            workingVector1.z = sampledResource10[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xzw = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector12.w = (int)workingVector14.w + (int)workingVector12.w;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.w;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
            workingVector13.xyz = floor(workingVector13.xyz);
            workingVector12.xzw = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
            workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.x;
            workingVector1.z = workingVector8.w ? workingVector9.z : workingVector1.z;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
#endif
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector22.xyz * workingVector22.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector15.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector22.xyz * workingVector22.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector13.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector9.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector13.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#endif
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector15.x << 0) & bitMask.z) | ((uint)workingVector22.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector15.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector13.x << 0) & bitMask.z) | ((uint)workingVector22.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector13.x;
#endif
            workingVector1.z = (int)workingVector22.y + (int)workingVector1.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector15.y + (int)workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector13.y + (int)workingVector1.z;
#endif
            workingVector1.z = (int)workingVector22.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector9.w = (int)workingVector15.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.y << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector9.z = (int)workingVector13.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
#endif
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector11.w = (int)workingVector10.w & (int)workingVector11.w;
#endif
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector14.y + (int)icb[workingVector1.z+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector12.y + (int)icb[workingVector1.z+4].x;
#endif
            workingVector1.z = sampledResource10[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xzw = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector12.w = (int)workingVector14.w + (int)workingVector12.w;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.w;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
            workingVector13.xyz = floor(workingVector13.xyz);
            workingVector12.xzw = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xzw = (uint3)workingVector12.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.w = (((uint)workingVector12.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 0) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
            workingVector12.x = (int)workingVector12.w + (int)workingVector12.x;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.x;
            workingVector1.z = workingVector8.w ? workingVector9.z : workingVector1.z;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector16.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
            workingVector16.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
#endif
            workingVector16.xyzw = (uint4)workingVector16.xyzw;
            workingVector16.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector16.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.xzw = workingVector16.xyz * workingVector16.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector15.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector20.xyz = workingVector8.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector17.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.xzw = workingVector16.xyz * workingVector16.www;
            workingVector12.xzw = float3(6,6,6) * workingVector12.xzw;
            workingVector12.xzw = workingVector13.xxx ? workingVector12.xzw : float3(0,0,0);
            workingVector20.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xzw;
            workingVector12.xzw = workingVector9.xyw * float3(16,16,16) + workingVector17.xyz;
            workingVector13.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(0,0,0));
#endif
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector17.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector15.x << 0) & bitMask.z) | ((uint)workingVector16.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector15.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector13.x << 0) & bitMask.z) | ((uint)workingVector16.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.y = (((uint)workingVector13.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector13.x;
#endif
            workingVector1.z = (int)workingVector16.y + (int)workingVector1.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector15.y + (int)workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector13.y + (int)workingVector1.z;
#endif
            workingVector1.z = (int)workingVector16.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = (uint3)workingVector17.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector9.w = (int)workingVector15.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = (uint3)workingVector17.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.y << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector9.z = (int)workingVector13.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
#endif
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector10.w = workingVector10.w ? workingVector11.w : 0;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector10.w = (int)workingVector10.w & (int)workingVector11.w;
#endif
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = (int)workingVector14.y + (int)icb[workingVector1.z+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = (int)workingVector12.y + (int)icb[workingVector1.z+4].x;
#endif
            workingVector1.z = sampledResource10[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xyz = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector11.w = (int)workingVector14.z + (int)workingVector11.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xzw;
            workingVector13.xyz = floor(workingVector13.xyz);
            workingVector12.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector12.xzw;
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector11.w = (int)workingVector12.z + (int)workingVector11.w;
#endif
            workingVector1.z = (int)workingVector1.z + (int)workingVector11.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector1.z = workingVector8.w ? workingVector9.z : workingVector1.z;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector10.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector14.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector15.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
            workingVector14.yzw = workingVector15.xyz * workingVector15.www;
            workingVector14.yzw = float3(6,6,6) * workingVector14.yzw;
            workingVector14.xyz = workingVector14.xxx ? workingVector14.yzw : float3(0,0,0);
            workingVector21.xyz = workingVector8.www ? float3(0,0,0) : workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector12.x = sampledResource10[workingVector1.z].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector13.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
            workingVector13.xyzw = (uint4)workingVector13.xyzw;
            workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
            workingVector12.yzw = workingVector13.xyz * workingVector13.www;
            workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
            workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
            workingVector21.xyz = workingVector8.www ? float3(0,0,0) : workingVector12.xyz;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyz = workingVector19.xyz * workingVector6.www;
          workingVector14.xyz = workingVector18.xyz * workingVector7.www + workingVector14.xyz;
          workingVector14.xyz = workingVector20.xyz * workingVector4.xxx + workingVector14.xyz;
          workingVector14.xyz = workingVector21.xyz * workingVector0.www + workingVector14.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = workingVector19.xyz * workingVector6.www;
          workingVector12.xyz = workingVector18.xyz * workingVector7.www + workingVector12.xyz;
          workingVector12.xyz = workingVector20.xyz * workingVector4.xxx + workingVector12.xyz;
          workingVector12.xyz = workingVector21.xyz * workingVector0.www + workingVector12.xyz;
#endif
        } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector15.xyz = floor(workingVector7.xyz);
          workingVector7.xyz = -workingVector15.xyz + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector13.xyz = floor(workingVector7.xyz);
          workingVector7.xyz = -workingVector13.xyz + workingVector7.xyz;
#endif
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector7.xyx >= workingVector7.yzz);
          bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector16.x << 0) & bitMask.w) | ((uint)workingVector16.y & ~bitMask.w);
          workingVector0.w = (int)workingVector16.z + (int)workingVector0.w;
          workingVector1.z = min(workingVector7.x, workingVector7.y);
          workingVector4.x = max(workingVector7.x, workingVector7.y);
          workingVector6.w = min(workingVector1.z, workingVector7.z);
          workingVector7.x = max(workingVector4.x, workingVector7.z);
          workingVector4.x = min(workingVector4.x, workingVector7.z);
          workingVector1.z = max(workingVector4.x, workingVector1.z);
          workingVector4.x = 1 + -workingVector7.x;
          workingVector7.x = workingVector7.x + -workingVector1.z;
          workingVector1.z = workingVector1.z + -workingVector6.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector7.yzw = RD_COMPARISON_MASK(workingVector15.xyz >= float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector7.yzw = RD_COMPARISON_MASK(workingVector13.xyz >= float3(0,0,0));
#endif
          workingVector7.y = workingVector7.z ? workingVector7.y : 0;
          workingVector7.y = workingVector7.w ? workingVector7.y : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector16.xyz = float3(1,1,1) + workingVector15.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector16.xyz = float3(1,1,1) + workingVector13.xyz;
#endif
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(16,16,16));
          workingVector7.z = workingVector17.y ? workingVector17.x : 0;
          workingVector7.z = workingVector17.z ? workingVector7.z : 0;
          workingVector7.y = workingVector7.z ? workingVector7.y : 0;
          if (workingVector7.y != 0) {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector7.yzw = (uint3)workingVector15.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector7.yzw = (uint3)workingVector13.xyz;
#endif
            workingVector17.xy = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector17.xz = workingVector17.xy ? float2(0,0) : 0;
            workingVector17.yw = icb[workingVector0.w+4].yz;
            workingVector18.xyz = (int3)workingVector7.yzw + (int3)workingVector17.ywx;
            workingVector17.xy = icb[workingVector0.w+12].yz;
            workingVector17.xyz = (int3)workingVector7.yzw + (int3)workingVector17.xyz;
            workingVector19.xyz = (int3)workingVector7.yzw + int3(1,1,1);
            workingVector7.yw = (uint2)workingVector7.wy << int2(4,8);
            workingVector7.y = (int)workingVector7.y + (int)workingVector7.z;
            workingVector7.y = (int)workingVector7.w + (int)workingVector7.y;
            workingVector7.y = (int)workingVector3.y + (int)workingVector7.y;
            workingVector20.x = sampledResource10[workingVector7.y].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector7.yzw = workingVector21.xyz * workingVector21.www;
            workingVector7.yzw = float3(6,6,6) * workingVector7.yzw;
            workingVector7.yzw = workingVector20.xxx ? workingVector7.yzw : float3(0,0,0);
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector8.w = (int)workingVector18.x + (int)workingVector18.y;
            workingVector8.w = (int)workingVector18.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector3.y + (int)workingVector8.w;
            workingVector18.x = sampledResource10[workingVector8.w].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector18.yzw = workingVector20.xyz * workingVector20.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
            workingVector8.w = (int)workingVector17.x + (int)workingVector17.y;
            workingVector8.w = (int)workingVector17.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector3.y + (int)workingVector8.w;
            workingVector17.x = sampledResource10[workingVector8.w].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector17.yzw = workingVector20.xyz * workingVector20.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector8.w = (int)workingVector19.x + (int)workingVector19.y;
            workingVector8.w = (int)workingVector19.z + (int)workingVector8.w;
            workingVector8.w = (int)workingVector3.y + (int)workingVector8.w;
            workingVector19.x = sampledResource10[workingVector8.w].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector19.yzw = workingVector20.xyz * workingVector20.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
          } else {
            workingVector20.xy = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector20.xy = workingVector20.xy ? float2(0,0) : 0;
            workingVector21.xy = (uint2)icb[workingVector0.w+4].yz;
            workingVector21.z = (uint)workingVector20.x;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xzw = workingVector21.xyz + workingVector15.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xzw = workingVector21.xyz + workingVector13.xyz;
#endif
            workingVector21.xy = (uint2)icb[workingVector0.w+12].yz;
            workingVector21.z = (uint)workingVector20.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector21.xyz = workingVector21.xyz + workingVector15.xyz;
            workingVector22.xyz = workingVector13.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector21.xyz = workingVector21.xyz + workingVector13.xyz;
            workingVector22.xyz = workingVector9.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector23.x << 0) & bitMask.w) | ((uint)workingVector24.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector0.w = (int)workingVector0.w + (int)workingVector23.x;
            workingVector0.w = (int)workingVector24.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector23.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector24.z + (int)workingVector0.w;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector9.w = (int)workingVector15.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
            workingVector15.xy = (int2)workingVector3.yy + int2(4096,4097);
            workingVector10.w = sampledResource10[workingVector15.x].val[0/4];
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector13.y << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector9.z = (int)workingVector13.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
            workingVector13.xy = (int2)workingVector3.yy + int2(4096,4097);
            workingVector10.w = sampledResource10[workingVector13.x].val[0/4];
#endif
            workingVector11.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector15.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource10[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector15.xzw = floor(workingVector15.xzw);
            workingVector15.xzw = -workingVector15.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector12.w = (int)workingVector15.w + (int)workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector13.xzw = floor(workingVector13.xzw);
            workingVector13.xzw = -workingVector13.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector12.w = (int)workingVector13.w + (int)workingVector12.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = workingVector8.w ? workingVector9.w : workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = workingVector8.w ? workingVector9.z : workingVector0.w;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector22.x = sampledResource10[workingVector0.w].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = workingVector23.xyz * workingVector23.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector22.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector7.yzw = workingVector8.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector13.xyw * float3(16,16,16) + workingVector20.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = workingVector23.xyz * workingVector23.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector22.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector7.yzw = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector9.xyw * float3(16,16,16) + workingVector20.xzw;
#endif
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector20.xzw < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector20.xzw >= float3(16,16,16));
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
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector20.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector9.w = (int)workingVector20.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector20.y << 0) & bitMask.z) | ((uint)workingVector20.x & ~bitMask.z);
            workingVector9.z = (int)workingVector20.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
#endif
            workingVector11.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector15.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource10[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
#endif
            workingVector20.xyz = floor(workingVector20.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector12.w = (int)workingVector15.w + (int)workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector12.w = (int)workingVector13.w + (int)workingVector12.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = workingVector8.w ? workingVector9.w : workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = workingVector8.w ? workingVector9.z : workingVector0.w;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector20.x = sampledResource10[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = workingVector22.xyz * workingVector22.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector20.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector13.xyw * float3(16,16,16) + workingVector21.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = workingVector22.xyz * workingVector22.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector20.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector9.xyw * float3(16,16,16) + workingVector21.xyz;
#endif
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector21.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector21.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector0.w = (int)workingVector0.w + (int)workingVector20.x;
            workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector20.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector22.z + (int)workingVector0.w;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector21.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector9.w = (int)workingVector20.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.y + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.z = (((uint)workingVector20.y << 0) & bitMask.z) | ((uint)workingVector20.x & ~bitMask.z);
            workingVector9.z = (int)workingVector20.z + (int)workingVector9.z;
            workingVector9.z = (int)workingVector3.y + (int)workingVector9.z;
#endif
            workingVector11.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector15.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource10[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
#endif
            workingVector20.xyz = floor(workingVector20.xyz);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector12.w = (int)workingVector15.w + (int)workingVector12.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector12.w = (int)workingVector13.w + (int)workingVector12.w;
#endif
            workingVector0.w = (int)workingVector0.w + (int)workingVector12.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = workingVector8.w ? workingVector9.w : workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = workingVector8.w ? workingVector9.z : workingVector0.w;
#endif
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector20.x = sampledResource10[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = workingVector21.xyz * workingVector21.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector20.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector15.xzw;
            workingVector13.xyz = workingVector13.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector15.xzw = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = workingVector21.xyz * workingVector21.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector20.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector9.xyz = workingVector9.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector13.xzw = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
#endif
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector15.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.w << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            workingVector0.w = (int)workingVector0.w + (int)workingVector15.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector13.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.w << 4) & bitMask.z) | ((uint)0 & ~bitMask.z);
            workingVector0.w = (int)workingVector0.w + (int)workingVector13.x;
#endif
            workingVector0.w = (int)workingVector20.y + (int)workingVector0.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector15.z + (int)workingVector0.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector13.z + (int)workingVector0.w;
#endif
            workingVector0.w = (int)workingVector20.z + (int)workingVector0.w;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xzw = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector9.w = (int)workingVector15.w + (int)workingVector9.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xzw = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.z << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector9.w = (int)workingVector13.w + (int)workingVector9.w;
#endif
            workingVector3.y = (int)workingVector3.y + (int)workingVector9.w;
            workingVector9.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector9.w = workingVector10.w ? workingVector9.w : 0;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector0.w = (int)workingVector15.y + (int)icb[workingVector0.w+4].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector0.w = (int)workingVector13.y + (int)icb[workingVector0.w+4].x;
#endif
            workingVector0.w = sampledResource10[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector13.xyz = -workingVector15.xyz * float3(16,16,16) + workingVector13.xyz;
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector10.w = (int)workingVector13.z + (int)workingVector10.w;
            workingVector0.w = (int)workingVector0.w + (int)workingVector10.w;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector9.xyz;
            workingVector13.xyz = floor(workingVector13.xyz);
            workingVector9.xyz = -workingVector13.xyz * float3(16,16,16) + workingVector9.xyz;
            workingVector9.xyz = (uint3)workingVector9.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector9.z = (((uint)workingVector9.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.x = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.x = (((uint)workingVector9.y << 0) & bitMask.x) | ((uint)workingVector9.x & ~bitMask.x);
            workingVector9.x = (int)workingVector9.z + (int)workingVector9.x;
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.x;
#endif
            workingVector0.w = workingVector8.w ? workingVector3.y : workingVector0.w;
            workingVector3.y = workingVector8.w ? 0 : workingVector9.w;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            workingVector13.x = sampledResource10[workingVector0.w].val[0/4];
            workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
            workingVector15.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
            workingVector13.yzw = workingVector15.xyz * workingVector15.www;
            workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
            workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
            workingVector19.xyz = workingVector3.yyy ? float3(0,0,0) : workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            workingVector9.x = sampledResource10[workingVector0.w].val[0/4];
            workingVector9.yzw = (uint3)workingVector9.xxx >> int3(8,16,24);
            workingVector13.xyzw = (int4)workingVector9.xyzw & int4(255,255,255,255);
            workingVector13.xyzw = (uint4)workingVector13.xyzw;
            workingVector13.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector13.xyzw;
            workingVector9.yzw = workingVector13.xyz * workingVector13.www;
            workingVector9.yzw = float3(6,6,6) * workingVector9.yzw;
            workingVector9.xyz = workingVector9.xxx ? workingVector9.yzw : float3(0,0,0);
            workingVector19.xyz = workingVector3.yyy ? float3(0,0,0) : workingVector9.xyz;
#endif
          }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector13.xyz = workingVector18.xyz * workingVector7.xxx;
          workingVector7.xyz = workingVector7.yzw * workingVector4.xxx + workingVector13.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector9.xyz = workingVector18.xyz * workingVector7.xxx;
          workingVector7.xyz = workingVector7.yzw * workingVector4.xxx + workingVector9.xyz;
#endif
          workingVector7.xyz = workingVector17.xyz * workingVector1.zzz + workingVector7.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
          workingVector14.xyz = workingVector19.xyz * workingVector6.www + workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
          workingVector12.xyz = workingVector19.xyz * workingVector6.www + workingVector7.xyz;
#endif
        }
      } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector14.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector12.xyz = float3(0,0,0);
#endif
      }
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector14.xyz = workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector12.xyz = workingVector11.xyz;
#endif
    }
    workingVector7.xyz = workingVector2.www * workingVector0.xyz;
    workingVector0.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
    workingVector1.z = workingVector0.w * workingVector0.w;
    workingVector1.z = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector1.z;
    workingVector0.w = workingVector0.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector1.z;
    workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector1.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector13.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector13.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector13.xyz;
    workingVector13.xyz = workingVector14.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector13.xyz;
    workingVector14.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector13.xyz = max(workingVector14.xyz, workingVector13.xyz);
    workingVector7.xyz = workingVector13.xyz * workingVector7.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector9.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
    workingVector9.xyz = workingVector12.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector9.xyz;
    workingVector12.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector9.xyz = max(workingVector12.xyz, workingVector9.xyz);
    workingVector7.xyz = workingVector9.xyz * workingVector7.xyz;
#endif
    workingVector7.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector7.xyz;
    workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector13.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector13.xyz + workingVector0.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector9.xyz + workingVector0.xyz;
#endif
    workingVector0.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector0.xyz;
    workingVector0.xyz = workingVector0.xyz * workingVector3.xxx;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector0.xyz;
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector12.xyz = float3(0,0,0);
    workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector15.xyz = float3(0,0,0);
    workingVector14.xyz = float3(0,0,0);
#endif
    workingVector7.xyz = float3(0,0,0);
    workingVector0.xyz = float3(0,0,0);
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector7.xyz = workingVector7.xyz + workingVector12.xyz;
  workingVector7.xyz = workingVector7.xyz + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector7.xyz = workingVector7.xyz + workingVector15.xyz;
  workingVector7.xyz = workingVector7.xyz + workingVector14.xyz;
#endif
  workingVector0.xyz = workingVector7.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector7.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector2.w = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.z != 0) {
    workingVector3.x = workingVector5.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector3.x = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector3.x;
    workingVector3.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector3.x;
    workingVector3.x = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector3.x);
    workingVector3.y = RD_COMPARISON_MASK(0 < workingVector3.x);
    if (workingVector3.y != 0) {
      workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector3.y != 0) {
        workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector3.y = workingVector0.w ? workingVector3.y : 0;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector11.xyz = max(workingVector11.xyz, workingVector7.xyz);
        workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector11.xyz;
        workingVector11.xyz = workingVector3.yyy ? workingVector11.xyz : 0;
        workingVector11.xyz = max(float3(1,1,1), workingVector11.xyz);
        workingVector11.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector9.xyz = max(workingVector9.xyz, workingVector7.xyz);
        workingVector9.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector9.xyz;
        workingVector9.xyz = workingVector3.yyy ? workingVector9.xyz : 0;
        workingVector9.xyz = max(float3(1,1,1), workingVector9.xyz);
        workingVector9.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector9.xyz;
#endif
      } else {
        workingVector3.y = dot(workingVector2.xyz, workingVector2.xyz);
        workingVector3.y = rsqrt(workingVector3.y);
        workingVector12.xyz = workingVector3.yyy * workingVector2.xyz;
        workingVector2.xz = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector13.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector14.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector2.z = workingVector2.z + -workingVector2.x;
        workingVector2.y = workingVector2.y * workingVector3.y + -workingVector2.x;
        workingVector2.z = 1 / workingVector2.z;
        workingVector2.z = saturate(workingVector2.y * workingVector2.z);
        workingVector3.y = workingVector2.z * -2 + 3;
        workingVector2.z = workingVector2.z * workingVector2.z;
        workingVector2.z = -workingVector3.y * workingVector2.z + 1;
        workingVector3.y = workingVector2.z * workingVector2.z;
        workingVector2.z = workingVector3.y * workingVector2.z;
        workingVector3.y = dot(workingVector12.xyz, RD_UNIFORM_SUN_DIR.xyz);
        workingVector4.x = dot(workingVector12.xyz, RD_UNIFORM_MOON_DIR.xyz);
        workingVector6.w = workingVector3.y * workingVector3.y + 1;
        workingVector6.w = RD_UNIFORM_SUN_COLOR.w * workingVector6.w;
        workingVector7.w = workingVector4.x * workingVector4.x + 1;
        workingVector7.w = RD_UNIFORM_MOON_COLOR.w * workingVector7.w;
        workingVector7.w = 0.75 * workingVector7.w;
        workingVector2.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector2.x;
        workingVector2.x = 1 / workingVector2.x;
        workingVector2.x = saturate(workingVector2.y * workingVector2.x);
        workingVector2.y = workingVector2.x * -2 + 3;
        workingVector2.x = workingVector2.x * workingVector2.x;
        workingVector2.x = -workingVector2.y * workingVector2.x + 1;
        workingVector2.y = workingVector2.x * workingVector2.x;
        workingVector2.x = workingVector2.y * workingVector2.x;
        workingVector12.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = workingVector2.xxx * workingVector12.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector12.xyz;
        workingVector12.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector12.xyz;
        workingVector2.x = workingVector6.w * 0.75 + workingVector7.w;
        workingVector2.y = max(0, workingVector3.y);
        workingVector2.y = log2(workingVector2.y);
        workingVector2.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector2.y;
        workingVector2.y = exp2(workingVector2.y);
        workingVector2.y = min(1, workingVector2.y);
        workingVector3.y = max(0, workingVector4.x);
        workingVector3.y = log2(workingVector3.y);
        workingVector3.y = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector3.y;
        workingVector3.y = exp2(workingVector3.y);
        workingVector3.y = min(1, workingVector3.y);
        workingVector4.x = -workingVector2.y * 1.79999995 + 1.80999994;
        workingVector6.w = sqrt(workingVector4.x);
        workingVector4.x = workingVector6.w * workingVector4.x;
        workingVector4.x = 0.0361000001 / workingVector4.x;
        workingVector6.w = -workingVector3.y * 1.79999995 + 1.80999994;
        workingVector7.w = sqrt(workingVector6.w);
        workingVector6.w = workingVector7.w * workingVector6.w;
        workingVector6.w = 0.0361000001 / workingVector6.w;
        workingVector13.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector13.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector2.yyy;
        workingVector14.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector14.xyz;
        workingVector14.xyz = workingVector14.xyz * workingVector3.yyy;
        workingVector14.xyz = workingVector14.xyz * workingVector6.www;
        workingVector15.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector2.zzz;
        workingVector15.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector15.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector4.xxx + workingVector14.xyz;
        workingVector13.xyz = workingVector15.xyz * workingVector13.xyz;
        workingVector2.xyz = workingVector12.xyz * workingVector2.xxx + workingVector13.xyz;
        workingVector3.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector4.x = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector12.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector2.xyz;
        workingVector12.xyz = workingVector4.xxx * workingVector12.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        workingVector11.xyz = workingVector3.yyy ? workingVector12.xyz : workingVector2.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        workingVector9.xyz = workingVector3.yyy ? workingVector12.xyz : workingVector2.xyz;
#endif
      }
    } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector9.xyz = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = float3(0,0,0);
#endif
    workingVector3.x = 0;
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector2.xyz = workingVector11.xyz + -workingVector0.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector2.xyz = workingVector9.xyz + -workingVector0.xyz;
#endif
  workingVector0.xyz = workingVector3.xxx * workingVector2.xyz + workingVector0.xyz;
  if (workingVector2.w != 0) {
    workingVector2.xy = float2(1,1) + workingVector4.yz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xy = float2(0.5,0.5) * workingVector2.xy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xy = float2(0.5,0.5) * workingVector2.xy;
#endif
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector4.zz;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector4.yy + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector4.ww + workingVector2.xy;
    workingVector2.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector2.xy;
    workingVector2.x = -workingVector2.x / workingVector2.y;
    workingVector2.x = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector2.x;
    workingVector2.y = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector2.x = workingVector2.x / workingVector2.y;
    workingVector2.x = workingVector2.x * 53.5981483 + 1;
    workingVector2.x = log2(workingVector2.x);
    workingVector2.x = 0.173286796 * workingVector2.x;
    workingVector2.y = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector2.z = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector2.x = workingVector2.x * workingVector2.z + -0.5;
    workingVector2.z = (int)workingVector2.x;
    workingVector2.y = (int)workingVector2.y + -2;
    workingVector2.z = max(0, (int)workingVector2.z);
    workingVector2.y = min((int)workingVector2.z, (int)workingVector2.y);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.z = (int)workingVector2.y;
    workingVector2.x = saturate(-workingVector11.z + workingVector2.x);
    workingVector12.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector11.xyz, 0).xyzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.z = (int)workingVector2.y;
    workingVector2.x = saturate(-workingVector9.z + workingVector2.x);
    workingVector12.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyz, 0).xyzw;
#endif
    workingVector2.y = (int)workingVector2.y + 1;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.w = (int)workingVector2.y;
    workingVector11.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector11.xyw, 0).xyzw;
    workingVector11.xyzw = workingVector11.xyzw + -workingVector12.xyzw;
    workingVector11.xyzw = workingVector2.xxxx * workingVector11.xyzw + workingVector12.xyzw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.w = (int)workingVector2.y;
    workingVector9.xyzw = materialTexture5.SampleLevel(textureSampler5, workingVector9.xyw, 0).xyzw;
    workingVector9.xyzw = workingVector9.xyzw + -workingVector12.xyzw;
    workingVector9.xyzw = workingVector2.xxxx * workingVector9.xyzw + workingVector12.xyzw;
#endif
  } else {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyzw = float4(0,0,0,1);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyzw = float4(0,0,0,1);
#endif
  }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
  workingVector0.xyz = workingVector11.www * workingVector0.xyz + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
  workingVector0.xyz = workingVector9.www * workingVector0.xyz + workingVector9.xyz;
#endif
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector2.x != 0) {
    workingVector2.x = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.x = max(1, workingVector2.x);
    workingVector2.y = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.x = saturate(workingVector2.y / workingVector2.x);
    workingVector2.y = workingVector2.x * workingVector2.x;
    workingVector2.x = workingVector2.y * workingVector2.x;
    workingVector2.x = RD_UNIFORM_IBL_PARAMETERS.x * workingVector2.x;
    workingVector2.y = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector2.z = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector3.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector8.yyy;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector8.xxx + workingVector11.xyz;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector8.zzz + workingVector11.xyz;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector11.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector8.yyy;
    workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector8.xxx + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector8.zzz + workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector9.xyz;
#endif
    workingVector12.xyz = workingVector3.xxx ? workingVector8.xyz : varyingTexCoord3.xyz;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = workingVector3.xxx ? workingVector11.xyz : workingVector5.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = workingVector3.xxx ? workingVector9.xyz : workingVector5.xyz;
#endif
    workingVector12.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector12.xyz;
    workingVector3.x = dot(workingVector12.xyz, workingVector12.xyz);
    workingVector3.x = rsqrt(workingVector3.x);
    workingVector12.xyz = workingVector12.xyz * workingVector3.xxx;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector3.x = dot(workingVector11.xyz, workingVector11.xyz);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.x = dot(workingVector9.xyz, workingVector9.xyz);
#endif
    workingVector3.x = rsqrt(workingVector3.x);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = workingVector11.xyz * workingVector3.xxx;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = workingVector9.xyz * workingVector3.xxx;
#endif
    workingVector3.x = dot(workingVector12.xyz, workingVector1.xyw);
    workingVector3.x = workingVector3.x + workingVector3.x;
    workingVector12.xyz = workingVector1.xyw * -workingVector3.xxx + workingVector12.xyz;
    workingVector1.x = RD_COMPARISON_MASK((int)workingVector2.z == 1);
    workingVector3.y = 1 + -workingVector3.z;
    workingVector1.y = workingVector3.y * workingVector3.y;
    workingVector1.w = -workingVector3.y * workingVector3.y + 1;
    workingVector2.z = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector1.y = workingVector1.y * workingVector1.y;
    workingVector1.y = -workingVector1.y * workingVector1.y + 1;
    workingVector1.yw = workingVector2.zz * workingVector1.yw;
    workingVector1.x = workingVector1.x ? workingVector1.w : workingVector1.y;
    workingVector1.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector1.y = (int)workingVector1.y + 2;
    workingVector1.w = (int)workingVector1.y & 0x80000000;
    workingVector1.y = max((int)-workingVector1.y, (int)workingVector1.y);
    workingVector1.y = (uint)workingVector1.y % 3;
    workingVector2.z = -(int)workingVector1.y;
    workingVector1.y = workingVector1.w ? workingVector2.z : workingVector1.y;
    workingVector12.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
    workingVector13.xyz = materialTexture7.SampleLevel(textureSampler7, workingVector12.xyzw, workingVector1.x).xyz;
    workingVector12.w = (int)workingVector1.y;
    workingVector1.xyw = materialTexture7.SampleLevel(textureSampler7, workingVector12.xyzw, workingVector1.x).xyz;
    workingVector12.xyz = workingVector13.xyz + -workingVector1.xyw;
    workingVector1.xyw = RD_UNIFORM_IBL_PARAMETERS.www * workingVector12.xyz + workingVector1.xyw;
    workingVector12.xyz = float3(301.724121,301.724121,301.724121) * workingVector1.xyw;
    workingVector1.xyw = workingVector2.yyy ? workingVector12.xyz : workingVector1.xyw;
    workingVector1.xyw = workingVector1.xyw * workingVector2.xxx;
    workingVector1.xyw = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector1.xyw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector2.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector2.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector11.xyz;
#endif
    workingVector12.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz;
    workingVector4.x = saturate(dot(workingVector12.xyz, float3(0.212599993,0.715200007,0.0722000003)));
    workingVector2.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector2.xyz + -workingVector7.xyz;
    workingVector2.xyz = workingVector4.xxx * workingVector2.xyz + workingVector7.xyz;
    workingVector2.xyz = workingVector2.xyz * workingVector3.www;
    workingVector4.x = dot(workingVector1.xyw, float3(0.212599993,0.715200007,0.0722000003));
    workingVector6.w = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.x = RD_COMPARISON_MASK(workingVector4.x < workingVector6.w);
    workingVector2.xyz = workingVector4.xxx ? workingVector2.xyz : 0;
    workingVector2.xyz = workingVector4.xxx ? workingVector2.xyz : workingVector1.xyw;
    workingVector1.xyw = workingVector0.www ? workingVector2.xyz : workingVector1.xyw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector3.x = saturate(dot(workingVector6.xyz, -workingVector11.xyz));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector3.x = saturate(dot(workingVector6.xyz, -workingVector9.xyz));
#endif
    workingVector2.xy = materialTexture0.Sample(textureSampler0, workingVector3.xy).xy;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector2.xyz = workingVector9.xyz * workingVector2.xxx + workingVector2.yyy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector2.xyz = workingVector10.xyz * workingVector2.xxx + workingVector2.yyy;
#endif
    workingVector1.xyw = workingVector2.xyz * workingVector1.xyw;
    workingVector2.x = workingVector5.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector2.x = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector2.x;
    workingVector2.x = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector2.x;
    workingVector2.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector2.x);
    workingVector2.y = 1 + -workingVector2.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector11.xyz = workingVector2.yyy * workingVector1.xyw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector9.xyz = workingVector2.yyy * workingVector1.xyw;
#endif
    workingVector2.y = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector2.x = saturate(workingVector2.x / workingVector2.y);
    workingVector2.x = 1 + -workingVector2.x;
    workingVector1.xyw = workingVector2.xxx * workingVector1.xyw;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    workingVector1.xyz = workingVector1.zzz ? workingVector11.xyz : workingVector1.xyw;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    workingVector1.xyz = workingVector1.zzz ? workingVector9.xyz : workingVector1.xyw;
#endif
    if (workingVector2.w != 0) {
      workingVector2.xy = float2(1,1) + workingVector4.yz;
      workingVector2.xy = float2(0.5,0.5) * workingVector2.xy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector4.zz;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector4.yy + workingVector3.xy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector4.ww + workingVector3.xy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector3.xy;
      workingVector1.w = -workingVector3.x / workingVector3.y;
      workingVector1.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.w;
      workingVector3.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector1.w = workingVector1.w / workingVector3.x;
      workingVector1.w = workingVector1.w * 53.5981483 + 1;
      workingVector1.w = log2(workingVector1.w);
      workingVector1.w = 0.173286796 * workingVector1.w;
      workingVector3.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector3.y = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector1.w = workingVector1.w * workingVector3.y + -0.5;
      workingVector3.y = (int)workingVector1.w;
      workingVector3.x = (int)workingVector3.x + -2;
      workingVector3.y = max(0, (int)workingVector3.y);
      workingVector3.x = min((int)workingVector3.y, (int)workingVector3.x);
      workingVector2.z = (int)workingVector3.x;
      workingVector1.w = saturate(-workingVector2.z + workingVector1.w);
      workingVector2.z = materialTexture5.SampleLevel(textureSampler5, workingVector2.xyz, 0).w;
      workingVector3.x = (int)workingVector3.x + 1;
      workingVector2.w = (int)workingVector3.x;
      workingVector2.x = materialTexture5.SampleLevel(textureSampler5, workingVector2.xyw, 0).w;
      workingVector2.x = workingVector2.x + -workingVector2.z;
      workingVector1.w = workingVector1.w * workingVector2.x + workingVector2.z;
      workingVector1.xyz = workingVector1.www * workingVector1.xyz;
    }
  } else {
    if (workingVector0.w != 0) {
      workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector8.yyy;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector8.xxx + workingVector2.xyz;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector8.zzz + workingVector2.xyz;
      workingVector2.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector2.xyz;
      workingVector2.xyz = workingVector0.www ? workingVector2.xyz : workingVector5.xyz;
      workingVector0.w = dot(workingVector2.xyz, workingVector2.xyz);
      workingVector0.w = rsqrt(workingVector0.w);
      workingVector2.xyz = workingVector2.xyz * workingVector0.www;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector4.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector10.xyz;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector4.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector11.xyz;
#endif
      workingVector5.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz;
      workingVector0.w = saturate(dot(workingVector5.xyz, float3(0.212599993,0.715200007,0.0722000003)));
      workingVector4.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector4.xyz + -workingVector7.xyz;
      workingVector4.xyz = workingVector0.www * workingVector4.xyz + workingVector7.xyz;
      workingVector3.xyw = workingVector4.xyz * workingVector3.www;
      workingVector0.w = dot(workingVector3.xyw, float3(0.212599993,0.715200007,0.0722000003));
      workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
      workingVector3.xyw = workingVector0.www ? workingVector3.xyw : 0;
      workingVector2.x = saturate(dot(workingVector6.xyz, -workingVector2.xyz));
      workingVector2.y = 1 + -workingVector3.z;
      workingVector2.xy = materialTexture0.Sample(textureSampler0, workingVector2.xy).xy;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
      workingVector2.xyz = workingVector9.xyz * workingVector2.xxx + workingVector2.yyy;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
      workingVector2.xyz = workingVector10.xyz * workingVector2.xxx + workingVector2.yyy;
#endif
      workingVector1.xyz = workingVector3.xyw * workingVector2.xyz;
    } else {
      workingVector1.xyz = float3(0,0,0);
    }
  }
  workingVector0.xyz = workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture3.Sample(textureSampler3, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    fragmentColor0.xyz = workingVector0.xyz * workingVector0.www;
  } else {
    fragmentColor0.xyz = workingVector0.xyz;
  }
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float scalarValue3 = sampledTextureValue.z;
#endif
    float scalarValue4 = sampledTextureValue.w;
    float productValue = scalarValue1 * varyingColor0.x;
    float productValue1 = scalarValue2 * varyingColor0.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue6 = scalarValue3 * varyingColor0.z;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue2;
#endif
    float productValue3;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue4;
    float productValue5;
    float intermediateValue10;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float intermediateValue9;
#endif
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
        intermediateValue10 = 1.0f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        intermediateValue9 = 1.0f;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue10 = scalarValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue9 = scalarValue4;
#endif
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue7 = (RD_UNIFORM_MAT_COLOR.x * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue8 = (RD_UNIFORM_MAT_COLOR.y * productValue4) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue9 = (RD_UNIFORM_MAT_COLOR.z * productValue5) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue10 = (((productValue7 * RD_UNIFORM_CHANGE_COLOR.x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * RD_UNIFORM_CHANGE_COLOR.y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * RD_UNIFORM_CHANGE_COLOR.z) - productValue9) * varyingColor0.w) + productValue9;
    float productValue13 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10;
    float productValue14 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11;
    float productValue15 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue311 = (RD_UNIFORM_MAT_COLOR.x * productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue312 = (RD_UNIFORM_MAT_COLOR.y * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue313 = productValue311 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue314 = productValue311 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue315 = productValue311 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue145 = ceil(productValue312);
    float productValue316 = (((productValue312 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue313) * scalarValue145) + productValue313;
    float productValue317 = (((productValue312 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue314) * scalarValue145) + productValue314;
    float productValue318 = (((productValue312 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue315) * scalarValue145) + productValue315;
    float productValue319 = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue316) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue316;
    float productValue320 = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue317) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue317;
    float productValue321 = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue318) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue318;
#endif
    uint comparisonValue1;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue16 = floor(quotientValue1 * 0.25f);
        float productValue17 = floor(quotientValue1 * 0.5f);
        float scalarValue5 = floor(quotientValue1);
        comparisonValue1 = uint(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue17 * productValue17) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue16 * productValue16) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f))));
    }
    else
    {
        comparisonValue1 = 0u;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        exponentialValue = exp2(log2(max(productValue13, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue14, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue15, 0.0f)) * 2.2000000476837158203125f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = exp2(log2(max(productValue319, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue320, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue321, 0.0f)) * 2.2000000476837158203125f);
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        exponentialValue = (productValue13 <= 0.040449999272823333740234375f) ? (productValue13 * 0.077399380505084991455078125f) : exp2(log2((productValue13 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue14 <= 0.040449999272823333740234375f) ? (productValue14 * 0.077399380505084991455078125f) : exp2(log2((productValue14 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue15 <= 0.040449999272823333740234375f) ? (productValue15 * 0.077399380505084991455078125f) : exp2(log2((productValue15 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        exponentialValue = (productValue319 <= 0.040449999272823333740234375f) ? (productValue319 * 0.077399380505084991455078125f) : exp2(log2((productValue319 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue320 <= 0.040449999272823333740234375f) ? (productValue320 * 0.077399380505084991455078125f) : exp2(log2((productValue320 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue321 <= 0.040449999272823333740234375f) ? (productValue321 * 0.077399380505084991455078125f) : exp2(log2((productValue321 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#endif
    }
    float multiplyAddValue;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if (scalarValue == 65535u)
    {
        multiplyAddValue = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
        intermediateValue14 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue17 = 1.0f;
        intermediateValue18 = 0.0f;
    }
    else
    {
        float loadedBufferValue3 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 4u).x);
        float loadedBufferValue4 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 5u).x);
        float loadedBufferValue5 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 6u).x);
        float loadedBufferValue6 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 7u).x);
        uint4 loadedBufferValue7 = rdLoad_pbrData((scalarValue * 16u) + 8u);
        uint scalarValue6 = loadedBufferValue7.x;
        float loadedBufferValue8 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 12u).x);
        float loadedBufferValue9 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 13u).x);
        float loadedBufferValue10 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 15u).x);
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((scalarValue6 & 4u) == 0u)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue9;
            float branchMergedValue18;
            float branchMergedValue19;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue14;
            float branchMergedValue26;
            float branchMergedValue27;
#endif
            if ((scalarValue6 & 8u) == 0u)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue51;
                float branchMergedValue55;
                float branchMergedValue56;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue67;
                float branchMergedValue71;
                float branchMergedValue72;
#endif
                if ((scalarValue6 & 16u) == 0u)
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue51 = 0.0f;
                    branchMergedValue55 = 0.0f;
                    branchMergedValue56 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue67 = 0.0f;
                    branchMergedValue71 = 1.0f;
                    branchMergedValue72 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue51 = 1.0f;
                    branchMergedValue55 = 0.0f;
                    branchMergedValue56 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue67 = 0.0f;
                    branchMergedValue71 = 0.0f;
                    branchMergedValue72 = 1.0f;
#endif
                }
                else
                {
                    float multiplyAddValue1 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                    float multiplyAddValue2 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                    float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue1, multiplyAddValue2), 0.0f);
                    float scalarValue7 = sampledTextureValue1.x;
                    float scalarValue8 = sampledTextureValue1.y;
                    float scalarValue9 = sampledTextureValue1.z;
                    float multiplyAddValue3 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue = multiplyAddValue3 > 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue64;
                    float branchMergedValue66;
                    float branchMergedValue67;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue89;
                    float branchMergedValue91;
                    float branchMergedValue92;
#endif
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float branchMergedValue71;
                        float branchMergedValue73;
                        float branchMergedValue74;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float branchMergedValue103;
                        float branchMergedValue105;
                        float branchMergedValue106;
#endif
                        if (conditionValue)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint unusedTextureMipCount1638;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1638);
                            float productValue18 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue1;
                            float productValue19 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue2;
                            float scalarValue10 = frac(productValue18);
                            float scalarValue11 = frac(productValue19);
                            float comparisonValue19;
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint unusedTextureMipCount1536;
                            uint2 vectorValue8 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1536);
                            float productValue238 = float(int(uint(int(float(int(vectorValue8.x)))))) * multiplyAddValue1;
                            float productValue239 = float(int(uint(int(float(int(vectorValue8.y)))))) * multiplyAddValue2;
                            float scalarValue91 = frac(productValue238);
                            float scalarValue92 = frac(productValue239);
                            float comparisonValue22;
                            if (abs(scalarValue91 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            uint unusedTextureMipCount1633;
                            uint2 vectorValue16 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1633);
                            float productValue322 = float(int(uint(int(float(int(vectorValue16.x)))))) * multiplyAddValue1;
                            float productValue323 = float(int(uint(int(float(int(vectorValue16.y)))))) * multiplyAddValue2;
                            float scalarValue146 = frac(productValue322);
                            float scalarValue147 = frac(productValue323);
                            float comparisonValue19;
                            if (abs(scalarValue146 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            uint unusedTextureMipCount1531;
                            uint2 vectorValue19 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1531);
                            float productValue331 = float(int(uint(int(float(int(vectorValue19.x)))))) * multiplyAddValue1;
                            float productValue332 = float(int(uint(int(float(int(vectorValue19.y)))))) * multiplyAddValue2;
                            float scalarValue150 = frac(productValue331);
                            float scalarValue151 = frac(productValue332);
                            float comparisonValue22;
                            if (abs(scalarValue150 + (-0.5f)) < 0.0625f)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                comparisonValue19 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                comparisonValue22 = ((scalarValue91 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                comparisonValue19 = ((scalarValue146 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                comparisonValue22 = ((scalarValue150 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                comparisonValue19 = multiplyAddValue1;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                comparisonValue22 = multiplyAddValue1;
#endif
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float comparisonValue21;
                            if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float comparisonValue24;
                            if (abs(scalarValue92 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float comparisonValue21;
                            if (abs(scalarValue147 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float comparisonValue24;
                            if (abs(scalarValue151 + (-0.5f)) < 0.0625f)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                comparisonValue21 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                comparisonValue24 = ((scalarValue92 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                comparisonValue21 = ((scalarValue147 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                comparisonValue24 = ((scalarValue151 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                comparisonValue21 = multiplyAddValue2;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                comparisonValue24 = multiplyAddValue2;
#endif
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue19, comparisonValue21));
                            float scalarValue12 = vectorValue1.x;
                            float scalarValue13 = vectorValue1.y;
                            float scalarValue14 = vectorValue1.z;
                            float scalarValue15 = vectorValue1.w;
                            float sumValue = frac(productValue18 + 0.5f);
                            float sumValue1 = frac(productValue19 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float4 vectorValue9 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue22, comparisonValue24));
                            float scalarValue93 = vectorValue9.x;
                            float scalarValue94 = vectorValue9.y;
                            float scalarValue95 = vectorValue9.z;
                            float scalarValue96 = vectorValue9.w;
                            float sumValue137 = frac(productValue238 + 0.5f);
                            float sumValue138 = frac(productValue239 + 0.5f);
                            bool conditionValue7 = sumValue138 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue19, comparisonValue21));
                            float scalarValue12 = vectorValue1.x;
                            float scalarValue13 = vectorValue1.y;
                            float scalarValue14 = vectorValue1.z;
                            float scalarValue15 = vectorValue1.w;
                            float sumValue186 = frac(productValue322 + 0.5f);
                            float sumValue187 = frac(productValue323 + 0.5f);
                            bool conditionValue12 = sumValue187 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float4 vectorValue9 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue22, comparisonValue24));
                            float scalarValue93 = vectorValue9.x;
                            float scalarValue94 = vectorValue9.y;
                            float scalarValue95 = vectorValue9.z;
                            float scalarValue96 = vectorValue9.w;
                            float sumValue193 = frac(productValue331 + 0.5f);
                            float sumValue194 = frac(productValue332 + 0.5f);
                            bool conditionValue16 = sumValue194 > 0.5f;
#endif
                            float intermediateValue4[2];
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue4[0u] = conditionValue1 ? scalarValue12 : scalarValue15;
                            intermediateValue4[1u] = conditionValue1 ? scalarValue13 : scalarValue14;
                            float clampedValue4 = intermediateValue4[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue5 = intermediateValue4[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue4 - clampedValue5;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue4[0u] = conditionValue2 ? scalarValue14 : scalarValue15;
                            intermediateValue4[1u] = conditionValue2 ? scalarValue13 : scalarValue12;
                            float clampedValue6 = intermediateValue4[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue1 = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                            float productValue20 = inverseLengthValue1 * multiplyAddValue3;
                            branchMergedValue71 = productValue20 * clampedValue6;
                            branchMergedValue73 = productValue20 * sumValue2;
                            branchMergedValue74 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue4[0u] = conditionValue7 ? scalarValue93 : scalarValue96;
                            intermediateValue4[1u] = conditionValue7 ? scalarValue94 : scalarValue95;
                            float clampedValue27 = intermediateValue4[uint(int(clamp((sumValue137 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue28 = intermediateValue4[uint(int(clamp((sumValue137 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue139 = clampedValue27 - clampedValue28;
                            bool conditionValue8 = sumValue137 > 0.5f;
                            intermediateValue4[0u] = conditionValue8 ? scalarValue95 : scalarValue96;
                            intermediateValue4[1u] = conditionValue8 ? scalarValue94 : scalarValue93;
                            float clampedValue29 = intermediateValue4[uint(int(clamp((sumValue138 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue138 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue20 = rsqrt(dot(float3(sumValue139, clampedValue29, 0.25f), float3(sumValue139, clampedValue29, 0.25f)));
                            float productValue240 = inverseLengthValue20 * multiplyAddValue3;
                            branchMergedValue103 = productValue240 * sumValue139;
                            branchMergedValue105 = inverseLengthValue20 * 0.25f;
                            branchMergedValue106 = productValue240 * clampedValue29;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue4[0u] = conditionValue12 ? scalarValue12 : scalarValue15;
                            intermediateValue4[1u] = conditionValue12 ? scalarValue13 : scalarValue14;
                            float clampedValue42 = intermediateValue4[uint(int(clamp((sumValue186 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue43 = intermediateValue4[uint(int(clamp((sumValue186 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue188 = clampedValue42 - clampedValue43;
                            bool conditionValue13 = sumValue186 > 0.5f;
                            intermediateValue4[0u] = conditionValue13 ? scalarValue14 : scalarValue15;
                            intermediateValue4[1u] = conditionValue13 ? scalarValue13 : scalarValue12;
                            float clampedValue44 = intermediateValue4[uint(int(clamp((sumValue187 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue187 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue28 = rsqrt(dot(float3(sumValue188, clampedValue44, 0.25f), float3(sumValue188, clampedValue44, 0.25f)));
                            float productValue324 = inverseLengthValue28 * multiplyAddValue3;
                            branchMergedValue71 = inverseLengthValue28 * 0.25f;
                            branchMergedValue73 = productValue324 * clampedValue44;
                            branchMergedValue74 = productValue324 * sumValue188;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue4[0u] = conditionValue16 ? scalarValue93 : scalarValue96;
                            intermediateValue4[1u] = conditionValue16 ? scalarValue94 : scalarValue95;
                            float clampedValue48 = intermediateValue4[uint(int(clamp((sumValue193 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue49 = intermediateValue4[uint(int(clamp((sumValue193 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue195 = clampedValue48 - clampedValue49;
                            bool conditionValue17 = sumValue193 > 0.5f;
                            intermediateValue4[0u] = conditionValue17 ? scalarValue95 : scalarValue96;
                            intermediateValue4[1u] = conditionValue17 ? scalarValue94 : scalarValue93;
                            float clampedValue50 = intermediateValue4[uint(int(clamp((sumValue194 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue194 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue31 = rsqrt(dot(float3(sumValue195, clampedValue50, 0.25f), float3(sumValue195, clampedValue50, 0.25f)));
                            float productValue333 = inverseLengthValue31 * multiplyAddValue3;
                            branchMergedValue103 = productValue333 * clampedValue50;
                            branchMergedValue105 = productValue333 * sumValue195;
                            branchMergedValue106 = inverseLengthValue31 * 0.25f;
#endif
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue71 = 0.0f;
                            branchMergedValue73 = 0.0f;
                            branchMergedValue74 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue103 = 0.0f;
                            branchMergedValue105 = 1.0f;
                            branchMergedValue106 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue71 = 1.0f;
                            branchMergedValue73 = 0.0f;
                            branchMergedValue74 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue103 = 0.0f;
                            branchMergedValue105 = 0.0f;
                            branchMergedValue106 = 1.0f;
#endif
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue64 = branchMergedValue71;
                        branchMergedValue66 = branchMergedValue73;
                        branchMergedValue67 = branchMergedValue74;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue89 = branchMergedValue103;
                        branchMergedValue91 = branchMergedValue105;
                        branchMergedValue92 = branchMergedValue106;
#endif
                    }
                    else
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint unusedTextureMipCount1186;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1186);
                        float branchMergedValue72;
                        float branchMergedValue75;
                        float branchMergedValue76;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint unusedTextureMipCount1199;
                        uint2 vectorValue10 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1199);
                        float branchMergedValue104;
                        float branchMergedValue107;
                        float branchMergedValue108;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint unusedTextureMipCount1181;
                        uint2 vectorValue17 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1181);
                        float branchMergedValue72;
                        float branchMergedValue75;
                        float branchMergedValue76;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        uint unusedTextureMipCount1194;
                        uint2 vectorValue20 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1194);
                        float branchMergedValue104;
                        float branchMergedValue107;
                        float branchMergedValue108;
#endif
                        if (conditionValue)
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float productValue21 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue1);
                            float productValue22 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue2);
                            float comparisonValue2 = (((productValue21 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue21 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue3 = (((productValue22 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue22 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float comparisonValue5 = ((abs(comparisonValue3) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue3;
                            float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, 0.25f), float3(comparisonValue4, comparisonValue5, 0.25f)));
                            float productValue23 = inverseLengthValue2 * multiplyAddValue3;
                            branchMergedValue72 = productValue23 * comparisonValue5;
                            branchMergedValue75 = productValue23 * comparisonValue4;
                            branchMergedValue76 = inverseLengthValue2 * 0.25f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float productValue241 = frac(float(int(uint(int(float(int(vectorValue10.x)))))) * multiplyAddValue1);
                            float productValue242 = frac(float(int(uint(int(float(int(vectorValue10.y)))))) * multiplyAddValue2);
                            float comparisonValue85 = (((productValue241 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue241 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue86 = (((productValue242 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue242 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue87 = ((abs(comparisonValue85) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue85;
                            float comparisonValue88 = ((abs(comparisonValue86) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue86;
                            float inverseLengthValue21 = rsqrt(dot(float3(comparisonValue87, comparisonValue88, 0.25f), float3(comparisonValue87, comparisonValue88, 0.25f)));
                            float productValue243 = inverseLengthValue21 * multiplyAddValue3;
                            branchMergedValue104 = productValue243 * comparisonValue87;
                            branchMergedValue107 = inverseLengthValue21 * 0.25f;
                            branchMergedValue108 = productValue243 * comparisonValue88;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            float productValue325 = frac(float(int(uint(int(float(int(vectorValue17.x)))))) * multiplyAddValue1);
                            float productValue326 = frac(float(int(uint(int(float(int(vectorValue17.y)))))) * multiplyAddValue2);
                            float comparisonValue117 = (((productValue325 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue325 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue118 = (((productValue326 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue326 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue119 = ((abs(comparisonValue117) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue117;
                            float comparisonValue120 = ((abs(comparisonValue118) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue118;
                            float inverseLengthValue29 = rsqrt(dot(float3(comparisonValue119, comparisonValue120, 0.25f), float3(comparisonValue119, comparisonValue120, 0.25f)));
                            float productValue327 = inverseLengthValue29 * multiplyAddValue3;
                            branchMergedValue72 = inverseLengthValue29 * 0.25f;
                            branchMergedValue75 = productValue327 * comparisonValue120;
                            branchMergedValue76 = productValue327 * comparisonValue119;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            float productValue334 = frac(float(int(uint(int(float(int(vectorValue20.x)))))) * multiplyAddValue1);
                            float productValue335 = frac(float(int(uint(int(float(int(vectorValue20.y)))))) * multiplyAddValue2);
                            float comparisonValue121 = (((productValue334 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue334 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue122 = (((productValue335 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue335 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue123 = ((abs(comparisonValue121) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue121;
                            float comparisonValue124 = ((abs(comparisonValue122) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue122;
                            float inverseLengthValue32 = rsqrt(dot(float3(comparisonValue123, comparisonValue124, 0.25f), float3(comparisonValue123, comparisonValue124, 0.25f)));
                            float productValue336 = inverseLengthValue32 * multiplyAddValue3;
                            branchMergedValue104 = productValue336 * comparisonValue124;
                            branchMergedValue107 = productValue336 * comparisonValue123;
                            branchMergedValue108 = inverseLengthValue32 * 0.25f;
#endif
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue72 = 0.0f;
                            branchMergedValue75 = 0.0f;
                            branchMergedValue76 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue104 = 0.0f;
                            branchMergedValue107 = 1.0f;
                            branchMergedValue108 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue72 = 1.0f;
                            branchMergedValue75 = 0.0f;
                            branchMergedValue76 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            branchMergedValue104 = 0.0f;
                            branchMergedValue107 = 0.0f;
                            branchMergedValue108 = 1.0f;
#endif
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue64 = branchMergedValue72;
                        branchMergedValue66 = branchMergedValue75;
                        branchMergedValue67 = branchMergedValue76;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue89 = branchMergedValue104;
                        branchMergedValue91 = branchMergedValue107;
                        branchMergedValue92 = branchMergedValue108;
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue51 = branchMergedValue64;
                    branchMergedValue55 = branchMergedValue66;
                    branchMergedValue56 = branchMergedValue67;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue67 = branchMergedValue89;
                    branchMergedValue71 = branchMergedValue91;
                    branchMergedValue72 = branchMergedValue92;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue9 = branchMergedValue51;
                branchMergedValue18 = branchMergedValue55;
                branchMergedValue19 = branchMergedValue56;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue14 = branchMergedValue67;
                branchMergedValue26 = branchMergedValue71;
                branchMergedValue27 = branchMergedValue72;
#endif
            }
            else
            {
                float multiplyAddValue4 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                float multiplyAddValue5 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                float multiplyAddValue6 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue52;
                float branchMergedValue57;
                float branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue68;
                float branchMergedValue73;
                float branchMergedValue74;
#endif
                if (multiplyAddValue6 > 0.0f)
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint unusedTextureMipCount1065;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1065);
                    float productValue24 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue4;
                    float productValue25 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue5;
                    float scalarValue16 = frac(productValue24);
                    float scalarValue17 = frac(productValue25);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint unusedTextureMipCount1073;
                    uint2 vectorValue11 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1073);
                    float productValue244 = float(int(uint(int(float(int(vectorValue11.x)))))) * multiplyAddValue4;
                    float productValue245 = float(int(uint(int(float(int(vectorValue11.y)))))) * multiplyAddValue5;
                    float scalarValue97 = frac(productValue244);
                    float scalarValue98 = frac(productValue245);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    uint unusedTextureMipCount1060;
                    uint2 vectorValue18 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1060);
                    float productValue328 = float(int(uint(int(float(int(vectorValue18.x)))))) * multiplyAddValue4;
                    float productValue329 = float(int(uint(int(float(int(vectorValue18.y)))))) * multiplyAddValue5;
                    float scalarValue148 = frac(productValue328);
                    float scalarValue149 = frac(productValue329);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    uint unusedTextureMipCount1068;
                    uint2 vectorValue21 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1068);
                    float productValue337 = float(int(uint(int(float(int(vectorValue21.x)))))) * multiplyAddValue4;
                    float productValue338 = float(int(uint(int(float(int(vectorValue21.y)))))) * multiplyAddValue5;
                    float scalarValue152 = frac(productValue337);
                    float scalarValue153 = frac(productValue338);
#endif
                    float comparisonValue9;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    if (abs(scalarValue97 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    if (abs(scalarValue148 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    if (abs(scalarValue152 + (-0.5f)) < 0.0625f)
#endif
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        comparisonValue9 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        comparisonValue9 = ((scalarValue97 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        comparisonValue9 = ((scalarValue148 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        comparisonValue9 = ((scalarValue152 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue4;
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float comparisonValue18;
                    if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float comparisonValue20;
                    if (abs(scalarValue98 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float comparisonValue18;
                    if (abs(scalarValue149 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float comparisonValue20;
                    if (abs(scalarValue153 + (-0.5f)) < 0.0625f)
#endif
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        comparisonValue18 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        comparisonValue20 = ((scalarValue98 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        comparisonValue18 = ((scalarValue149 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                        comparisonValue20 = ((scalarValue153 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        comparisonValue18 = multiplyAddValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        comparisonValue20 = multiplyAddValue5;
#endif
                    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue9, comparisonValue18));
                    float scalarValue18 = vectorValue4.x;
                    float scalarValue19 = vectorValue4.y;
                    float scalarValue20 = vectorValue4.z;
                    float scalarValue21 = vectorValue4.w;
                    float sumValue3 = frac(productValue24 + 0.5f);
                    float sumValue4 = frac(productValue25 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float4 vectorValue12 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue9, comparisonValue20));
                    float scalarValue99 = vectorValue12.x;
                    float scalarValue100 = vectorValue12.y;
                    float scalarValue101 = vectorValue12.z;
                    float scalarValue102 = vectorValue12.w;
                    float sumValue140 = frac(productValue244 + 0.5f);
                    float sumValue141 = frac(productValue245 + 0.5f);
                    bool conditionValue9 = sumValue141 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue9, comparisonValue18));
                    float scalarValue18 = vectorValue4.x;
                    float scalarValue19 = vectorValue4.y;
                    float scalarValue20 = vectorValue4.z;
                    float scalarValue21 = vectorValue4.w;
                    float sumValue189 = frac(productValue328 + 0.5f);
                    float sumValue190 = frac(productValue329 + 0.5f);
                    bool conditionValue14 = sumValue190 > 0.5f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    float4 vectorValue12 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue9, comparisonValue20));
                    float scalarValue99 = vectorValue12.x;
                    float scalarValue100 = vectorValue12.y;
                    float scalarValue101 = vectorValue12.z;
                    float scalarValue102 = vectorValue12.w;
                    float sumValue196 = frac(productValue337 + 0.5f);
                    float sumValue197 = frac(productValue338 + 0.5f);
                    bool conditionValue18 = sumValue197 > 0.5f;
#endif
                    float intermediateValue5[2];
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue5[0u] = conditionValue3 ? scalarValue18 : scalarValue21;
                    intermediateValue5[1u] = conditionValue3 ? scalarValue19 : scalarValue20;
                    float clampedValue7 = intermediateValue5[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue8 = intermediateValue5[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue7 - clampedValue8;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue5[0u] = conditionValue4 ? scalarValue20 : scalarValue21;
                    intermediateValue5[1u] = conditionValue4 ? scalarValue19 : scalarValue18;
                    float clampedValue9 = intermediateValue5[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue3 = rsqrt(dot(float3(sumValue5, clampedValue9, 0.25f), float3(sumValue5, clampedValue9, 0.25f)));
                    float productValue26 = inverseLengthValue3 * multiplyAddValue6;
                    branchMergedValue52 = productValue26 * clampedValue9;
                    branchMergedValue57 = productValue26 * sumValue5;
                    branchMergedValue58 = inverseLengthValue3 * 0.25f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue5[0u] = conditionValue9 ? scalarValue99 : scalarValue102;
                    intermediateValue5[1u] = conditionValue9 ? scalarValue100 : scalarValue101;
                    float clampedValue31 = intermediateValue5[uint(int(clamp((sumValue140 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue32 = intermediateValue5[uint(int(clamp((sumValue140 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue142 = clampedValue31 - clampedValue32;
                    bool conditionValue10 = sumValue140 > 0.5f;
                    intermediateValue5[0u] = conditionValue10 ? scalarValue101 : scalarValue102;
                    intermediateValue5[1u] = conditionValue10 ? scalarValue100 : scalarValue99;
                    float clampedValue33 = intermediateValue5[uint(int(clamp((sumValue141 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue141 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue22 = rsqrt(dot(float3(sumValue142, clampedValue33, 0.25f), float3(sumValue142, clampedValue33, 0.25f)));
                    float productValue246 = inverseLengthValue22 * multiplyAddValue6;
                    branchMergedValue68 = productValue246 * sumValue142;
                    branchMergedValue73 = inverseLengthValue22 * 0.25f;
                    branchMergedValue74 = productValue246 * clampedValue33;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    intermediateValue5[0u] = conditionValue14 ? scalarValue18 : scalarValue21;
                    intermediateValue5[1u] = conditionValue14 ? scalarValue19 : scalarValue20;
                    float clampedValue45 = intermediateValue5[uint(int(clamp((sumValue189 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue46 = intermediateValue5[uint(int(clamp((sumValue189 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue191 = clampedValue45 - clampedValue46;
                    bool conditionValue15 = sumValue189 > 0.5f;
                    intermediateValue5[0u] = conditionValue15 ? scalarValue20 : scalarValue21;
                    intermediateValue5[1u] = conditionValue15 ? scalarValue19 : scalarValue18;
                    float clampedValue47 = intermediateValue5[uint(int(clamp((sumValue190 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue190 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue30 = rsqrt(dot(float3(sumValue191, clampedValue47, 0.25f), float3(sumValue191, clampedValue47, 0.25f)));
                    float productValue330 = inverseLengthValue30 * multiplyAddValue6;
                    branchMergedValue52 = inverseLengthValue30 * 0.25f;
                    branchMergedValue57 = productValue330 * clampedValue47;
                    branchMergedValue58 = productValue330 * sumValue191;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    intermediateValue5[0u] = conditionValue18 ? scalarValue99 : scalarValue102;
                    intermediateValue5[1u] = conditionValue18 ? scalarValue100 : scalarValue101;
                    float clampedValue51 = intermediateValue5[uint(int(clamp((sumValue196 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue52 = intermediateValue5[uint(int(clamp((sumValue196 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue198 = clampedValue51 - clampedValue52;
                    bool conditionValue19 = sumValue196 > 0.5f;
                    intermediateValue5[0u] = conditionValue19 ? scalarValue101 : scalarValue102;
                    intermediateValue5[1u] = conditionValue19 ? scalarValue100 : scalarValue99;
                    float clampedValue53 = intermediateValue5[uint(int(clamp((sumValue197 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue197 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue33 = rsqrt(dot(float3(sumValue198, clampedValue53, 0.25f), float3(sumValue198, clampedValue53, 0.25f)));
                    float productValue339 = inverseLengthValue33 * multiplyAddValue6;
                    branchMergedValue68 = productValue339 * clampedValue53;
                    branchMergedValue73 = productValue339 * sumValue198;
                    branchMergedValue74 = inverseLengthValue33 * 0.25f;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue52 = 0.0f;
                    branchMergedValue57 = 0.0f;
                    branchMergedValue58 = 1.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue68 = 0.0f;
                    branchMergedValue73 = 1.0f;
                    branchMergedValue74 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue52 = 1.0f;
                    branchMergedValue57 = 0.0f;
                    branchMergedValue58 = 0.0f;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                    branchMergedValue68 = 0.0f;
                    branchMergedValue73 = 0.0f;
                    branchMergedValue74 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue9 = branchMergedValue52;
                branchMergedValue18 = branchMergedValue57;
                branchMergedValue19 = branchMergedValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue14 = branchMergedValue68;
                branchMergedValue26 = branchMergedValue73;
                branchMergedValue27 = branchMergedValue74;
#endif
            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue24 = branchMergedValue18;
            intermediateValue25 = branchMergedValue9;
            intermediateValue26 = branchMergedValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue24 = branchMergedValue14;
            intermediateValue25 = branchMergedValue27;
            intermediateValue26 = branchMergedValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
            intermediateValue24 = branchMergedValue19;
            intermediateValue25 = branchMergedValue18;
            intermediateValue26 = branchMergedValue9;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            intermediateValue24 = branchMergedValue26;
            intermediateValue25 = branchMergedValue14;
            intermediateValue26 = branchMergedValue27;
#endif
        }
        else
        {
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5), mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6)));
            intermediateValue24 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue25 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue26 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
        }
        float intermediateValue15;
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
        if ((scalarValue6 & 1u) == 0u)
        {
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
            loadedBufferValue1 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 9u).x);
            intermediateValue15 = loadedBufferValue8;
        }
        else
        {
            float4 sampledTextureValue4 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, asfloat(rdLoad_pbrData(scalarValue * 16u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 2u).x)), mad(varyingTexCoord0.y, asfloat(rdLoad_pbrData((scalarValue * 16u) + 1u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 3u).x))));
            loadedBufferValue = sampledTextureValue4.y;
            loadedBufferValue2 = sampledTextureValue4.x;
            loadedBufferValue1 = sampledTextureValue4.z;
            intermediateValue15 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue4.w : loadedBufferValue8;
        }
        float comparisonValue6 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue8 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, comparisonValue8), float3(comparisonValue6, comparisonValue7, comparisonValue8)));
        float inverseLengthValue5 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue6 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        multiplyAddValue = mad(inverseLengthValue4 * comparisonValue6, intermediateValue26, mad(inverseLengthValue5 * varyingBitangent0.x, intermediateValue25, inverseLengthValue6 * varyingTangent0.x));
        intermediateValue12 = mad(inverseLengthValue4 * comparisonValue7, intermediateValue26, mad(inverseLengthValue5 * varyingBitangent0.y, intermediateValue25, inverseLengthValue6 * varyingTangent0.y));
        intermediateValue13 = mad(inverseLengthValue4 * comparisonValue8, intermediateValue26, mad(inverseLengthValue5 * varyingBitangent0.z, intermediateValue25, inverseLengthValue6 * varyingTangent0.z));
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = loadedBufferValue;
        intermediateValue17 = loadedBufferValue1;
        intermediateValue18 = loadedBufferValue2;
    }
    float multiplyAddValue7 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_MODEL_MATRICES_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_MODEL_MATRICES_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_MODEL_MATRICES_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_MODEL_MATRICES_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, multiplyAddValue10, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
    float multiplyAddValue12 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, multiplyAddValue10, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
    float multiplyAddValue13 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
    float multiplyAddValue14 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_VIEW_MATRIX_ROW_0.w)));
    float multiplyAddValue15 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue16 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue15;
    float multiplyAddValue17 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue15;
    float multiplyAddValue18 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue14, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue12, multiplyAddValue11 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue15;
    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue, intermediateValue12, intermediateValue13), float3(multiplyAddValue, intermediateValue12, intermediateValue13)));
    float productValue27 = inverseLengthValue7 * multiplyAddValue;
    float productValue28 = inverseLengthValue7 * intermediateValue12;
    float productValue29 = inverseLengthValue7 * intermediateValue13;
    float multiplyAddValue19 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue28, productValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue20 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue28, productValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue29, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue28, productValue27 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue9 = (-0.0f) - multiplyAddValue13;
#endif
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_WORLD_ORIGIN.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue22 = ddx_coarse(multiplyAddValue11);
    float scalarValue23 = ddx_coarse(multiplyAddValue12);
    float scalarValue24 = ddx_coarse(multiplyAddValue13);
    float inverseLengthValue8 = rsqrt(dot(float3(scalarValue22, scalarValue23, scalarValue24), float3(scalarValue22, scalarValue23, scalarValue24)));
    float productValue30 = inverseLengthValue8 * scalarValue22;
    float productValue31 = inverseLengthValue8 * scalarValue23;
    float productValue32 = inverseLengthValue8 * scalarValue24;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float sumValue9 = (-0.0f) - multiplyAddValue13;
#endif
    float sumValue10 = ddy_coarse((-0.0f) - multiplyAddValue11);
    float sumValue11 = ddy_coarse((-0.0f) - multiplyAddValue12);
    float scalarValue25 = ddy_coarse(sumValue9);
    float inverseLengthValue9 = rsqrt(dot(float3(sumValue10, sumValue11, scalarValue25), float3(sumValue10, sumValue11, scalarValue25)));
    float productValue33 = inverseLengthValue9 * sumValue10;
    float productValue34 = inverseLengthValue9 * sumValue11;
    float productValue35 = inverseLengthValue9 * scalarValue25;
    float productValue36 = (productValue35 * productValue31) - (productValue34 * productValue32);
    float productValue37 = (productValue33 * productValue32) - (productValue35 * productValue30);
    float productValue38 = (productValue34 * productValue30) - (productValue33 * productValue31);
    float inverseLengthValue10 = rsqrt(dot(float3(productValue36, productValue37, productValue38), float3(productValue36, productValue37, productValue38)));
    float productValue39 = productValue36 * inverseLengthValue10;
    float productValue40 = productValue37 * inverseLengthValue10;
    float productValue41 = productValue38 * inverseLengthValue10;
    float multiplyAddValue22 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue41, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue40, productValue39 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue23 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue41, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue40, productValue39 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue24 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue41, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue40, productValue39 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue11 = rsqrt(dot(float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24), float3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24)));
    float quotientValue2 = round((inverseLengthValue11 * multiplyAddValue22) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue3 = round((inverseLengthValue11 * multiplyAddValue23) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue4 = round((inverseLengthValue11 * multiplyAddValue24) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue12 = rsqrt(dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(quotientValue2, quotientValue3, quotientValue4)));
    float productValue42 = inverseLengthValue12 * quotientValue2;
    float productValue43 = inverseLengthValue12 * quotientValue3;
    float productValue44 = inverseLengthValue12 * quotientValue4;
    float productValue59 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue5 = productValue59 - (sumValue6 - (floor(sumValue6 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue6 = productValue59 - (sumValue7 - (floor(sumValue7 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue7 = productValue59 - (sumValue8 - (floor(sumValue8 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue5, quotientValue6, quotientValue7), float3(productValue42, productValue43, productValue44));
    float productValue60 = ((quotientValue5 + sumValue6) - (dotProductValue * productValue42)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue61 = ((sumValue7 - (dotProductValue * productValue43)) + quotientValue6) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue65 = ((sumValue8 - (dotProductValue * productValue44)) + quotientValue7) + RD_UNIFORM_WORLD_ORIGIN.z;
    float sumValue12 = 1.0f - intermediateValue18;
    float productValue66 = sumValue12 * 0.039999999105930328369140625f;
    float productValue68 = productValue66 + (intermediateValue18 * exponentialValue);
    float productValue69 = productValue66 + (intermediateValue18 * exponentialValue1);
    float productValue70 = productValue66 + (intermediateValue18 * exponentialValue2);
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue71 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue71, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue71 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue71, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue71 * productValue71) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue71, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float sampledTextureValue2;
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
        sampledTextureValue2 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue27, productValue28, productValue29)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
    }
    else
    {
        sampledTextureValue2 = 1.0f;
    }
    float clampedValue10 = clamp(((RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float nonlinearValue = sqrt(((multiplyAddValue12 * multiplyAddValue12) + (multiplyAddValue11 * multiplyAddValue11)) + (multiplyAddValue13 * multiplyAddValue13));
    float productValue45;
    float productValue46;
    float productValue47;
    float productValue48;
    float productValue49;
    float productValue50;
    float intermediateValue28;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue29;
#endif
    float intermediateValue30;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue31;
#endif
    float intermediateValue32;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float intermediateValue34;
    float intermediateValue36;
    float intermediateValue38;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue33;
#endif
    if (multiplyAddValue18 != 1.0f)
    {
        float sumValue13 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
        float quotientValue8 = multiplyAddValue11 / sumValue13;
        float quotientValue9 = multiplyAddValue12 / sumValue13;
        float quotientValue10 = multiplyAddValue13 / sumValue13;
        float sumValue14 = (-0.0f) - quotientValue8;
        float sumValue15 = (-0.0f) - quotientValue9;
        float sumValue16 = (-0.0f) - quotientValue10;
        float productValue72 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * intermediateValue14;
        bool conditionValue5 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
#endif
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.9999997473787516355514526367188e-05f))
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            intermediateValue29 = 0.0f;
            intermediateValue31 = 0.0f;
            intermediateValue33 = 0.0f;
            intermediateValue35 = 0.0f;
            intermediateValue37 = 0.0f;
            intermediateValue39 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            intermediateValue41 = 0.0f;
            intermediateValue42 = 0.0f;
            intermediateValue43 = 0.0f;
            intermediateValue44 = 0.0f;
            intermediateValue45 = 0.0f;
            intermediateValue46 = 0.0f;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float productValue76;
            float intermediateValue51;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float productValue67;
            float intermediateValue49;
#endif
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue25 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue26 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue27 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue13 = rsqrt(dot(float3(multiplyAddValue25, multiplyAddValue26, multiplyAddValue27), float3(multiplyAddValue25, multiplyAddValue26, multiplyAddValue27)));
                float dotProductValue1 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(inverseLengthValue13 * multiplyAddValue25, inverseLengthValue13 * multiplyAddValue26, inverseLengthValue13 * multiplyAddValue27)), 0.0f);
                float clampedValue11 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue10 = (clampedValue11 * productValue27) + (conditionValue5 ? productValue60 : varyingTexCoord3.x);
                float comparisonValue11 = (clampedValue11 * productValue28) + (conditionValue5 ? productValue61 : varyingTexCoord3.y);
                float comparisonValue12 = (clampedValue11 * productValue29) + (conditionValue5 ? productValue65 : varyingTexCoord3.z);
                uint clampedValue12 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float intermediateValue52;
                float intermediateValue73;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float intermediateValue50;
                float intermediateValue72;
#endif
                if (int(clampedValue12) > int(0u))
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float intermediateValue72;
                    float intermediateValue74;
                    uint intermediateValue85;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float intermediateValue71;
                    float intermediateValue73;
                    uint intermediateValue91;
#endif
                    float scalarValue26 = 1.0f;
                    float scalarValue27 = 1.0f;
                    uint scalarValue28 = 0u;
                    uint scalarValue29 = 0u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    uint quotientValue13;
                    bool intermediateValue87;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    uint quotientValue15;
                    bool intermediateValue93;
#endif
                    for (;;)
                    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue17 = scalarValue29 + 372u;
                        quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue17 / 4u][sumValue17 % 4u])) + scalarValue28), int(8u)));
                        intermediateValue87 = int(scalarValue28) < int(quotientValue13);
                        float branchMergedValue;
                        uint branchMergedValue5;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        uint sumValue143 = scalarValue29 + 380u;
                        quotientValue15 = uint(min(int(uint(int(fragmentConstants[sumValue143 / 4u][sumValue143 % 4u])) + scalarValue28), int(8u)));
                        intermediateValue93 = int(scalarValue28) < int(quotientValue15);
                        uint branchMergedValue;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        uint sumValue17 = scalarValue29 + 372u;
                        quotientValue13 = uint(min(int(uint(int(fragmentConstants[sumValue17 / 4u][sumValue17 % 4u])) + scalarValue28), int(8u)));
                        intermediateValue87 = int(scalarValue28) < int(quotientValue13);
                        uint branchMergedValue;
                        float branchMergedValue5;
#endif
                        float branchMergedValue6;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        if (intermediateValue87)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float branchMergedValue7;
                        if (intermediateValue93)
#endif
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue101;
                            float intermediateValue102;
                            uint intermediateValue103;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue117;
                            float intermediateValue118;
                            uint intermediateValue119;
#endif
                            float scalarValue30 = scalarValue26;
                            float scalarValue31 = scalarValue27;
                            uint scalarValue32 = scalarValue28;
                            uint bitwiseValue10;
                            float multiplyAddValue42;
                            float multiplyAddValue43;
                            float multiplyAddValue44;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            bool comparisonValue31;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            bool comparisonValue30;
#endif
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue32 << 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint sumValue18 = bitwiseValue10 + 94u;
                                uint sumValue19 = bitwiseValue10 + 95u;
#endif
                                uint sumValue20 = bitwiseValue10 + 96u;
                                uint sumValue21 = bitwiseValue10 + 97u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                multiplyAddValue42 = mad(fragmentConstants[sumValue20].x, comparisonValue12, mad(fragmentConstants[sumValue19].x, comparisonValue11, fragmentConstants[sumValue18].x * comparisonValue10)) + fragmentConstants[sumValue21].x;
                                multiplyAddValue43 = mad(fragmentConstants[sumValue20].y, comparisonValue12, mad(fragmentConstants[sumValue19].y, comparisonValue11, fragmentConstants[sumValue18].y * comparisonValue10)) + fragmentConstants[sumValue21].y;
                                multiplyAddValue44 = mad(fragmentConstants[sumValue20].z, comparisonValue12, mad(fragmentConstants[sumValue19].z, comparisonValue11, fragmentConstants[sumValue18].z * comparisonValue10)) + fragmentConstants[sumValue21].z;
                                comparisonValue31 = ((abs(multiplyAddValue42) <= 1.0f) && (abs(multiplyAddValue43) <= 1.0f)) && (abs(multiplyAddValue44) <= 1.0f);
                                float branchMergedValue1;
                                uint branchMergedValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                uint sumValue144 = bitwiseValue10 + 98u;
                                uint sumValue145 = bitwiseValue10 + 99u;
                                multiplyAddValue42 = mad(fragmentConstants[sumValue144].x, comparisonValue12, mad(fragmentConstants[sumValue21].x, comparisonValue11, fragmentConstants[sumValue20].x * comparisonValue10)) + fragmentConstants[sumValue145].x;
                                multiplyAddValue43 = mad(fragmentConstants[sumValue144].y, comparisonValue12, mad(fragmentConstants[sumValue21].y, comparisonValue11, fragmentConstants[sumValue20].y * comparisonValue10)) + fragmentConstants[sumValue145].y;
                                multiplyAddValue44 = mad(fragmentConstants[sumValue144].z, comparisonValue12, mad(fragmentConstants[sumValue21].z, comparisonValue11, fragmentConstants[sumValue20].z * comparisonValue10)) + fragmentConstants[sumValue145].z;
                                comparisonValue30 = ((abs(multiplyAddValue42) <= 1.0f) && (abs(multiplyAddValue43) <= 1.0f)) && (abs(multiplyAddValue44) <= 1.0f);
                                float branchMergedValue1;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                multiplyAddValue42 = mad(fragmentConstants[sumValue20].x, comparisonValue12, mad(fragmentConstants[sumValue19].x, comparisonValue11, fragmentConstants[sumValue18].x * comparisonValue10)) + fragmentConstants[sumValue21].x;
                                multiplyAddValue43 = mad(fragmentConstants[sumValue20].y, comparisonValue12, mad(fragmentConstants[sumValue19].y, comparisonValue11, fragmentConstants[sumValue18].y * comparisonValue10)) + fragmentConstants[sumValue21].y;
                                multiplyAddValue44 = mad(fragmentConstants[sumValue20].z, comparisonValue12, mad(fragmentConstants[sumValue19].z, comparisonValue11, fragmentConstants[sumValue18].z * comparisonValue10)) + fragmentConstants[sumValue21].z;
                                comparisonValue31 = ((abs(multiplyAddValue42) <= 1.0f) && (abs(multiplyAddValue43) <= 1.0f)) && (abs(multiplyAddValue44) <= 1.0f);
                                uint branchMergedValue1;
                                float branchMergedValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                uint sumValue144 = bitwiseValue10 + 98u;
                                uint sumValue145 = bitwiseValue10 + 99u;
                                multiplyAddValue42 = mad(fragmentConstants[sumValue144].x, comparisonValue12, mad(fragmentConstants[sumValue21].x, comparisonValue11, fragmentConstants[sumValue20].x * comparisonValue10)) + fragmentConstants[sumValue145].x;
                                multiplyAddValue43 = mad(fragmentConstants[sumValue144].y, comparisonValue12, mad(fragmentConstants[sumValue21].y, comparisonValue11, fragmentConstants[sumValue20].y * comparisonValue10)) + fragmentConstants[sumValue145].y;
                                multiplyAddValue44 = mad(fragmentConstants[sumValue144].z, comparisonValue12, mad(fragmentConstants[sumValue21].z, comparisonValue11, fragmentConstants[sumValue20].z * comparisonValue10)) + fragmentConstants[sumValue145].z;
                                comparisonValue30 = ((abs(multiplyAddValue42) <= 1.0f) && (abs(multiplyAddValue43) <= 1.0f)) && (abs(multiplyAddValue44) <= 1.0f);
                                uint branchMergedValue1;
#endif
                                float branchMergedValue8;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if (comparisonValue31)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                uint branchMergedValue9;
                                if (comparisonValue30)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float branchMergedValue9;
                                if (comparisonValue30)
#endif
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue22 = scalarValue32 + 624u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue146 = scalarValue32 + 636u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    uint sumValue192 = scalarValue32 + 628u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    uint sumValue199 = scalarValue32 + 640u;
#endif
                                    uint sumValue23 = scalarValue32 + 49u;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue11 = min(max(dotProductValue1, fragmentConstants[sumValue22 / 4u][sumValue22 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue11 * quotientValue11)) / quotientValue11) * fragmentConstants[sumValue23].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue24 = min(max(dotProductValue1, fragmentConstants[sumValue146 / 4u][sumValue146 % 4u]), 1.0f);
                                    float nonlinearValue5 = (sqrt(1.0f - (quotientValue24 * quotientValue24)) / quotientValue24) * fragmentConstants[sumValue23].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    float quotientValue34 = min(max(dotProductValue1, fragmentConstants[sumValue192 / 4u][sumValue192 % 4u]), 1.0f);
                                    float nonlinearValue6 = (sqrt(1.0f - (quotientValue34 * quotientValue34)) / quotientValue34) * fragmentConstants[sumValue23].z;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    float quotientValue35 = min(max(dotProductValue1, fragmentConstants[sumValue199 / 4u][sumValue199 % 4u]), 1.0f);
                                    float nonlinearValue7 = (sqrt(1.0f - (quotientValue35 * quotientValue35)) / quotientValue35) * fragmentConstants[sumValue23].z;
#endif
                                    float productValue73 = (multiplyAddValue42 * 0.5f) + 0.5f;
                                    float productValue74 = 0.5f - (multiplyAddValue43 * 0.5f);
                                    uint sumValue24 = bitwiseValue10 + 19u;
                                    float nonlinearValue2 = sqrt((((fragmentConstants[sumValue24].x * fragmentConstants[sumValue24].x) + (fragmentConstants[sumValue24].y * fragmentConstants[sumValue24].y)) + (fragmentConstants[sumValue24].z * fragmentConstants[sumValue24].z)) + (fragmentConstants[sumValue24].w * fragmentConstants[sumValue24].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                    uint comparisonValue13 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue23].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue12 = uint(int(comparisonValue13) / int(2u));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    float intermediateValue160;
                                    float intermediateValue161;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    float intermediateValue185;
                                    float intermediateValue186;
#endif
                                    if (int(comparisonValue13) > int(0u))
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        float sumValue91;
                                        float productValue188;
                                        float intermediateValue191;
                                        float intermediateValue192;
                                        uint intermediateValue193;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        float sumValue106;
                                        float productValue221;
                                        float intermediateValue224;
                                        float intermediateValue225;
                                        uint intermediateValue226;
#endif
                                        float scalarValue33 = 0.0f;
                                        float scalarValue34 = 0.0f;
                                        uint scalarValue35 = 0u;
                                        for (;;)
                                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                            intermediateValue191 = scalarValue33;
                                            intermediateValue192 = scalarValue34;
                                            intermediateValue193 = 0u;
                                            float intermediateValue238;
                                            float intermediateValue195;
                                            float intermediateValue196;
                                            float intermediateValue197;
                                            float intermediateValue198;
                                            float productValue196;
                                            float productValue197;
                                            bool comparisonValue56;
                                            float sumValue101;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                            intermediateValue224 = scalarValue33;
                                            intermediateValue225 = scalarValue34;
                                            intermediateValue226 = 0u;
                                            float intermediateValue280;
                                            float intermediateValue228;
                                            float intermediateValue229;
                                            float intermediateValue230;
                                            float intermediateValue231;
                                            float productValue235;
                                            float productValue236;
                                            bool comparisonValue59;
                                            float sumValue116;
#endif
                                            for (;;)
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                float productValue75 = (productValue73 + ((float(int(intermediateValue193 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue23].x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                float productValue247 = (productValue73 + ((float(int(intermediateValue226 - quotientValue12)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue23].x;
#endif
                                                float productValue77 = (productValue74 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue35 - quotientValue12)) + 0.5f))) * fragmentConstants[sumValue23].x;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue75, productValue77, float(int(scalarValue32))));
                                                intermediateValue195 = vectorValue5.x;
                                                intermediateValue196 = vectorValue5.y;
                                                intermediateValue197 = vectorValue5.z;
                                                intermediateValue198 = vectorValue5.w;
                                                productValue196 = frac((productValue75 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue197 = frac((productValue77 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue13 = clamp((multiplyAddValue44 - intermediateValue195) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue14 = clamp((multiplyAddValue44 - intermediateValue196) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue15 = clamp((multiplyAddValue44 - intermediateValue197) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue16 = clamp((multiplyAddValue44 - intermediateValue198) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue78 = 1.0f - ((clampedValue13 * clampedValue13) * (3.0f - (clampedValue13 * 2.0f)));
                                                float productValue79 = 1.0f - ((clampedValue16 * clampedValue16) * (3.0f - (clampedValue16 * 2.0f)));
                                                float productValue80 = (((1.0f - ((clampedValue15 * clampedValue15) * (3.0f - (clampedValue15 * 2.0f)))) - productValue79) * productValue196) + productValue79;
                                                productValue188 = (productValue80 + intermediateValue192) + ((((((1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)))) - productValue78) * productValue196) + productValue78) - productValue80) * productValue197);
                                                comparisonValue56 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue101 = (multiplyAddValue44 - fragmentConstants[sumValue23].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue56)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float4 vectorValue13 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue247, productValue77, float(int(scalarValue32))));
                                                intermediateValue228 = vectorValue13.x;
                                                intermediateValue229 = vectorValue13.y;
                                                intermediateValue230 = vectorValue13.z;
                                                intermediateValue231 = vectorValue13.w;
                                                productValue235 = frac((productValue247 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue236 = frac((productValue77 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue34 = clamp((multiplyAddValue44 - intermediateValue228) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue35 = clamp((multiplyAddValue44 - intermediateValue229) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue36 = clamp((multiplyAddValue44 - intermediateValue230) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue37 = clamp((multiplyAddValue44 - intermediateValue231) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue248 = 1.0f - ((clampedValue34 * clampedValue34) * (3.0f - (clampedValue34 * 2.0f)));
                                                float productValue249 = 1.0f - ((clampedValue37 * clampedValue37) * (3.0f - (clampedValue37 * 2.0f)));
                                                float productValue250 = (((1.0f - ((clampedValue36 * clampedValue36) * (3.0f - (clampedValue36 * 2.0f)))) - productValue249) * productValue235) + productValue249;
                                                productValue221 = (productValue250 + intermediateValue225) + ((((((1.0f - ((clampedValue35 * clampedValue35) * (3.0f - (clampedValue35 * 2.0f)))) - productValue248) * productValue235) + productValue248) - productValue250) * productValue236);
                                                comparisonValue59 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue116 = (multiplyAddValue44 - fragmentConstants[sumValue23].y) - nonlinearValue5;
                                                float branchMergedValue5;
                                                if (comparisonValue59)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                                float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue75, productValue77, float(int(scalarValue32))));
                                                intermediateValue195 = vectorValue5.x;
                                                intermediateValue196 = vectorValue5.y;
                                                intermediateValue197 = vectorValue5.z;
                                                intermediateValue198 = vectorValue5.w;
                                                productValue196 = frac((productValue75 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue197 = frac((productValue77 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue13 = clamp((multiplyAddValue44 - intermediateValue195) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue14 = clamp((multiplyAddValue44 - intermediateValue196) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue15 = clamp((multiplyAddValue44 - intermediateValue197) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue16 = clamp((multiplyAddValue44 - intermediateValue198) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue78 = 1.0f - ((clampedValue13 * clampedValue13) * (3.0f - (clampedValue13 * 2.0f)));
                                                float productValue79 = 1.0f - ((clampedValue16 * clampedValue16) * (3.0f - (clampedValue16 * 2.0f)));
                                                float productValue80 = (((1.0f - ((clampedValue15 * clampedValue15) * (3.0f - (clampedValue15 * 2.0f)))) - productValue79) * productValue196) + productValue79;
                                                productValue188 = (productValue80 + intermediateValue192) + ((((((1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)))) - productValue78) * productValue196) + productValue78) - productValue80) * productValue197);
                                                comparisonValue56 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue101 = (multiplyAddValue44 - fragmentConstants[sumValue23].y) - nonlinearValue6;
                                                float branchMergedValue4;
                                                if (comparisonValue56)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                                float4 vectorValue13 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue247, productValue77, float(int(scalarValue32))));
                                                intermediateValue228 = vectorValue13.x;
                                                intermediateValue229 = vectorValue13.y;
                                                intermediateValue230 = vectorValue13.z;
                                                intermediateValue231 = vectorValue13.w;
                                                productValue235 = frac((productValue247 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue236 = frac((productValue77 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue34 = clamp((multiplyAddValue44 - intermediateValue228) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue35 = clamp((multiplyAddValue44 - intermediateValue229) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue36 = clamp((multiplyAddValue44 - intermediateValue230) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue37 = clamp((multiplyAddValue44 - intermediateValue231) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue248 = 1.0f - ((clampedValue34 * clampedValue34) * (3.0f - (clampedValue34 * 2.0f)));
                                                float productValue249 = 1.0f - ((clampedValue37 * clampedValue37) * (3.0f - (clampedValue37 * 2.0f)));
                                                float productValue250 = (((1.0f - ((clampedValue36 * clampedValue36) * (3.0f - (clampedValue36 * 2.0f)))) - productValue249) * productValue235) + productValue249;
                                                productValue221 = (productValue250 + intermediateValue225) + ((((((1.0f - ((clampedValue35 * clampedValue35) * (3.0f - (clampedValue35 * 2.0f)))) - productValue248) * productValue235) + productValue248) - productValue250) * productValue236);
                                                comparisonValue59 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                                sumValue116 = (multiplyAddValue44 - fragmentConstants[sumValue23].y) - nonlinearValue7;
                                                float branchMergedValue5;
                                                if (comparisonValue59)
#endif
                                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                    branchMergedValue4 = float(intermediateValue198 >= sumValue101);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                    branchMergedValue5 = float(intermediateValue231 >= sumValue116);
#endif
                                                }
                                                else
                                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                    float comparisonValue14 = (intermediateValue195 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue15 = (intermediateValue198 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue16 = ((((intermediateValue197 < sumValue101) ? 0.0f : 1.0f) - comparisonValue15) * productValue196) + comparisonValue15;
                                                    branchMergedValue4 = (((((((intermediateValue196 < sumValue101) ? 0.0f : 1.0f) - comparisonValue14) * productValue196) + comparisonValue14) - comparisonValue16) * productValue197) + comparisonValue16;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                    float comparisonValue89 = (intermediateValue228 < sumValue116) ? 0.0f : 1.0f;
                                                    float comparisonValue90 = (intermediateValue231 < sumValue116) ? 0.0f : 1.0f;
                                                    float comparisonValue91 = ((((intermediateValue230 < sumValue116) ? 0.0f : 1.0f) - comparisonValue90) * productValue235) + comparisonValue90;
                                                    branchMergedValue5 = (((((((intermediateValue229 < sumValue116) ? 0.0f : 1.0f) - comparisonValue89) * productValue235) + comparisonValue89) - comparisonValue91) * productValue236) + comparisonValue91;
#endif
                                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                intermediateValue238 = branchMergedValue4;
                                                sumValue91 = intermediateValue238 + intermediateValue191;
                                                uint sumValue25 = intermediateValue193 + 1u;
                                                if (sumValue25 == comparisonValue13)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                intermediateValue280 = branchMergedValue5;
                                                sumValue106 = intermediateValue280 + intermediateValue224;
                                                uint sumValue147 = intermediateValue226 + 1u;
                                                if (sumValue147 == comparisonValue13)
#endif
                                                {
                                                    break;
                                                }
                                                else
                                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                    intermediateValue191 = sumValue91;
                                                    intermediateValue192 = productValue188;
                                                    intermediateValue193 = sumValue25;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                    intermediateValue224 = sumValue106;
                                                    intermediateValue225 = productValue221;
                                                    intermediateValue226 = sumValue147;
#endif
                                                    continue;
                                                }
                                            }
                                            uint sumValue26 = scalarValue35 + 1u;
                                            if (sumValue26 == comparisonValue13)
                                            {
                                                break;
                                            }
                                            else
                                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                                scalarValue33 = sumValue91;
                                                scalarValue34 = productValue188;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                                scalarValue33 = sumValue106;
                                                scalarValue34 = productValue221;
#endif
                                                scalarValue35 = sumValue26;
                                                continue;
                                            }
                                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue160 = sumValue91;
                                        intermediateValue161 = productValue188;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue185 = sumValue106;
                                        intermediateValue186 = productValue221;
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue160 = 0.0f;
                                        intermediateValue161 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue185 = 0.0f;
                                        intermediateValue186 = 0.0f;
#endif
                                    }
                                    float productValue81 = float(int(comparisonValue13 * comparisonValue13));
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = min(scalarValue30, intermediateValue161 / productValue81);
                                    branchMergedValue7 = quotientValue13;
                                    branchMergedValue8 = min(scalarValue31, intermediateValue160 / productValue81);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = min(scalarValue31, intermediateValue185 / productValue81);
                                    branchMergedValue8 = min(scalarValue30, intermediateValue186 / productValue81);
                                    branchMergedValue9 = quotientValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = quotientValue13;
                                    branchMergedValue7 = min(scalarValue31, intermediateValue160 / productValue81);
                                    branchMergedValue8 = min(scalarValue30, intermediateValue161 / productValue81);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = quotientValue15;
                                    branchMergedValue8 = min(scalarValue31, intermediateValue185 / productValue81);
                                    branchMergedValue9 = min(scalarValue30, intermediateValue186 / productValue81);
#endif
                                }
                                else
                                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = scalarValue30;
                                    branchMergedValue7 = scalarValue32 + 1u;
                                    branchMergedValue8 = scalarValue31;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = scalarValue31;
                                    branchMergedValue8 = scalarValue30;
                                    branchMergedValue9 = scalarValue32 + 1u;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                    branchMergedValue1 = scalarValue32 + 1u;
                                    branchMergedValue7 = scalarValue31;
                                    branchMergedValue8 = scalarValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                    branchMergedValue1 = scalarValue32 + 1u;
                                    branchMergedValue8 = scalarValue31;
                                    branchMergedValue9 = scalarValue30;
#endif
                                }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue101 = branchMergedValue1;
                                intermediateValue103 = branchMergedValue7;
                                intermediateValue102 = branchMergedValue8;
                                if (int(intermediateValue103) < int(quotientValue13))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue118 = branchMergedValue1;
                                intermediateValue117 = branchMergedValue8;
                                intermediateValue119 = branchMergedValue9;
                                if (int(intermediateValue119) < int(quotientValue15))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                intermediateValue103 = branchMergedValue1;
                                intermediateValue102 = branchMergedValue7;
                                intermediateValue101 = branchMergedValue8;
                                if (int(intermediateValue103) < int(quotientValue13))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                intermediateValue119 = branchMergedValue1;
                                intermediateValue118 = branchMergedValue8;
                                intermediateValue117 = branchMergedValue9;
                                if (int(intermediateValue119) < int(quotientValue15))
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    scalarValue30 = intermediateValue101;
                                    scalarValue31 = intermediateValue102;
                                    scalarValue32 = intermediateValue103;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    scalarValue30 = intermediateValue117;
                                    scalarValue31 = intermediateValue118;
                                    scalarValue32 = intermediateValue119;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue102;
                            branchMergedValue5 = intermediateValue103;
                            branchMergedValue6 = intermediateValue101;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue = intermediateValue119;
                            branchMergedValue6 = intermediateValue118;
                            branchMergedValue7 = intermediateValue117;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = intermediateValue103;
                            branchMergedValue5 = intermediateValue102;
                            branchMergedValue6 = intermediateValue101;
#endif
                        }
                        else
                        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = scalarValue27;
                            branchMergedValue5 = scalarValue28;
                            branchMergedValue6 = scalarValue26;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            branchMergedValue = scalarValue28;
                            branchMergedValue6 = scalarValue27;
                            branchMergedValue7 = scalarValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            branchMergedValue = scalarValue28;
                            branchMergedValue5 = scalarValue27;
                            branchMergedValue6 = scalarValue26;
#endif
                        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue74 = branchMergedValue;
                        intermediateValue85 = branchMergedValue5;
                        intermediateValue72 = branchMergedValue6;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue91 = branchMergedValue;
                        intermediateValue73 = branchMergedValue6;
                        intermediateValue71 = branchMergedValue7;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                        intermediateValue85 = branchMergedValue;
                        intermediateValue74 = branchMergedValue5;
                        intermediateValue72 = branchMergedValue6;
#endif
                        uint sumValue27 = scalarValue29 + 1u;
                        if (sumValue27 == clampedValue12)
                        {
                            break;
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            scalarValue26 = intermediateValue72;
                            scalarValue27 = intermediateValue74;
                            scalarValue28 = intermediateValue85;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            scalarValue26 = intermediateValue71;
                            scalarValue27 = intermediateValue73;
                            scalarValue28 = intermediateValue91;
#endif
                            scalarValue29 = sumValue27;
                            continue;
                        }
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue52 = intermediateValue72;
                    intermediateValue73 = intermediateValue74;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue50 = intermediateValue71;
                    intermediateValue72 = intermediateValue73;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue52 = 1.0f;
                    intermediateValue73 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue50 = 1.0f;
                    intermediateValue72 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float intermediateValue89;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float intermediateValue95;
#endif
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
                    float scalarValue36 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue28 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue12, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue11, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue10))) - ((sqrt(1.0f - (scalarValue36 * scalarValue36)) / scalarValue36) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue29 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue12, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue11, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue10)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue30 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue12, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue11, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue10)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    uint comparisonValue17 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue17 >> 1u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float branchMergedValue12;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float branchMergedValue18;
#endif
                    if ((multiplyAddValue30 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue29 >= 0.0f) && (multiplyAddValue29 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue30 >= 0.0f)))
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float sumValue69;
                        float intermediateValue143;
                        uint intermediateValue144;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float sumValue49;
                        float intermediateValue172;
                        uint intermediateValue173;
#endif
                        float scalarValue37 = 0.0f;
                        uint scalarValue38 = 0u;
                        for (;;)
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue143 = scalarValue37;
                            intermediateValue144 = 0u;
                            float intermediateValue183;
                            float productValue184;
                            float productValue185;
                            bool comparisonValue42;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue172 = scalarValue37;
                            intermediateValue173 = 0u;
                            float intermediateValue201;
                            float productValue217;
                            float productValue218;
                            bool comparisonValue39;
#endif
                            for (;;)
                            {
                                float productValue82 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                productValue184 = (productValue82 * (float(int(intermediateValue144 - bitwiseValue)) + 0.5f)) + multiplyAddValue29;
                                productValue185 = (productValue82 * (float(int(scalarValue38 - bitwiseValue)) + 0.5f)) + multiplyAddValue30;
                                comparisonValue42 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                productValue217 = (productValue82 * (float(int(intermediateValue173 - bitwiseValue)) + 0.5f)) + multiplyAddValue29;
                                productValue218 = (productValue82 * (float(int(scalarValue38 - bitwiseValue)) + 0.5f)) + multiplyAddValue30;
                                comparisonValue39 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#endif
                                float branchMergedValue2;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if (comparisonValue42)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                if (comparisonValue39)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue184, productValue185, dotProductValue2), 0.0f).x >= multiplyAddValue28);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue217, productValue218, dotProductValue2), 0.0f).x >= multiplyAddValue28);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue184, productValue185, dotProductValue2));
                                    float productValue83 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue184) + 0.5f);
                                    float comparisonValue23 = (vectorValue6.x < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue25 = (vectorValue6.w < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue26 = ((((vectorValue6.z < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue25) * productValue83) + comparisonValue25;
                                    branchMergedValue2 = (((((((vectorValue6.y < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue23) * productValue83) + comparisonValue23) - comparisonValue26) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue185) + 0.5f)) + comparisonValue26;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    float4 vectorValue14 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue217, productValue218, dotProductValue2));
                                    float productValue251 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue217) + 0.5f);
                                    float comparisonValue92 = (vectorValue14.x < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue93 = (vectorValue14.w < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue94 = ((((vectorValue14.z < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue93) * productValue251) + comparisonValue93;
                                    branchMergedValue2 = (((((((vectorValue14.y < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue92) * productValue251) + comparisonValue92) - comparisonValue94) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue218) + 0.5f)) + comparisonValue94;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue183 = branchMergedValue2;
                                sumValue69 = intermediateValue183 + intermediateValue143;
                                uint sumValue28 = intermediateValue144 + 1u;
                                if (int(sumValue28) < int(comparisonValue17))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue201 = branchMergedValue2;
                                sumValue49 = intermediateValue201 + intermediateValue172;
                                uint sumValue148 = intermediateValue173 + 1u;
                                if (int(sumValue148) < int(comparisonValue17))
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue143 = sumValue69;
                                    intermediateValue144 = sumValue28;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue172 = sumValue49;
                                    intermediateValue173 = sumValue148;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue29 = scalarValue38 + 1u;
                            if (int(sumValue29) < int(comparisonValue17))
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue37 = sumValue69;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue37 = sumValue49;
#endif
                                scalarValue38 = sumValue29;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue12 = sumValue69 / float(int(comparisonValue17 * comparisonValue17));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue18 = sumValue49 / float(int(comparisonValue17 * comparisonValue17));
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
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue89 = branchMergedValue12;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue95 = branchMergedValue18;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue89 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue95 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float intermediateValue105;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float intermediateValue121;
#endif
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
                    float multiplyAddValue31 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue12, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue11, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue10)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue39 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue32 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue12, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue11, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue10)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue31) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue39 * scalarValue39)) / scalarValue39) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue33 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue12, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue11, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue10)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue31) * 0.5f) + 0.5f;
                    float multiplyAddValue34 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue12, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue11, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue10)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue31) * 0.5f);
                    uint comparisonValue27 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue14 = uint(int(comparisonValue27) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float intermediateValue136;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float intermediateValue149;
#endif
                    if (int(comparisonValue27) > int(0u))
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        float sumValue71;
                        float intermediateValue163;
                        uint intermediateValue164;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        float sumValue51;
                        float intermediateValue188;
                        uint intermediateValue189;
#endif
                        float scalarValue40 = 0.0f;
                        uint scalarValue41 = 0u;
                        for (;;)
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            intermediateValue163 = scalarValue40;
                            intermediateValue164 = 0u;
                            float intermediateValue199;
                            float4 intermediateValue165;
                            float productValue191;
                            float productValue192;
                            bool comparisonValue46;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            intermediateValue188 = scalarValue40;
                            intermediateValue189 = 0u;
                            float intermediateValue232;
                            float4 intermediateValue190;
                            float productValue224;
                            float productValue225;
                            bool comparisonValue49;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue165 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue191 = (multiplyAddValue33 + ((float(int(intermediateValue164 - quotientValue14)) + 0.5f) * intermediateValue165.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue192 = (multiplyAddValue34 + (intermediateValue165.x * (float(int(scalarValue41 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue46 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue46)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue190 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue224 = (multiplyAddValue33 + ((float(int(intermediateValue189 - quotientValue14)) + 0.5f) * intermediateValue190.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue225 = (multiplyAddValue34 + (intermediateValue190.x * (float(int(scalarValue41 - quotientValue14)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                comparisonValue49 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue4;
                                if (comparisonValue49)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue191, productValue192, dotProductValue3), 0.0f).x >= multiplyAddValue32);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    branchMergedValue4 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue224, productValue225, dotProductValue3), 0.0f).x >= multiplyAddValue32);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    float4 vectorValue7 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue191, productValue192, dotProductValue3));
                                    float productValue84 = frac((productValue191 * intermediateValue165.z) + 0.5f);
                                    float comparisonValue29 = (vectorValue7.x < multiplyAddValue32) ? 0.0f : 1.0f;
                                    float comparisonValue38 = (vectorValue7.w < multiplyAddValue32) ? 0.0f : 1.0f;
                                    float comparisonValue43 = ((((vectorValue7.z < multiplyAddValue32) ? 0.0f : 1.0f) - comparisonValue38) * productValue84) + comparisonValue38;
                                    branchMergedValue3 = (((((((vectorValue7.y < multiplyAddValue32) ? 0.0f : 1.0f) - comparisonValue29) * productValue84) + comparisonValue29) - comparisonValue43) * frac((productValue192 * intermediateValue165.z) + 0.5f)) + comparisonValue43;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    float4 vectorValue15 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue224, productValue225, dotProductValue3));
                                    float productValue252 = frac((productValue224 * intermediateValue190.z) + 0.5f);
                                    float comparisonValue95 = (vectorValue15.x < multiplyAddValue32) ? 0.0f : 1.0f;
                                    float comparisonValue96 = (vectorValue15.w < multiplyAddValue32) ? 0.0f : 1.0f;
                                    float comparisonValue97 = ((((vectorValue15.z < multiplyAddValue32) ? 0.0f : 1.0f) - comparisonValue96) * productValue252) + comparisonValue96;
                                    branchMergedValue4 = (((((((vectorValue15.y < multiplyAddValue32) ? 0.0f : 1.0f) - comparisonValue95) * productValue252) + comparisonValue95) - comparisonValue97) * frac((productValue225 * intermediateValue190.z) + 0.5f)) + comparisonValue97;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue199 = branchMergedValue3;
                                sumValue71 = intermediateValue199 + intermediateValue163;
                                uint sumValue30 = intermediateValue164 + 1u;
                                if (sumValue30 == comparisonValue27)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue232 = branchMergedValue4;
                                sumValue51 = intermediateValue232 + intermediateValue188;
                                uint sumValue149 = intermediateValue189 + 1u;
                                if (sumValue149 == comparisonValue27)
#endif
                                {
                                    break;
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue163 = sumValue71;
                                    intermediateValue164 = sumValue30;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue188 = sumValue51;
                                    intermediateValue189 = sumValue149;
#endif
                                    continue;
                                }
                            }
                            uint sumValue31 = scalarValue41 + 1u;
                            if (sumValue31 == comparisonValue27)
                            {
                                break;
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                scalarValue40 = sumValue71;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                scalarValue40 = sumValue51;
#endif
                                scalarValue41 = sumValue31;
                                continue;
                            }
                        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        intermediateValue136 = sumValue71;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue149 = sumValue51;
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        intermediateValue136 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue149 = 0.0f;
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float quotientValue16 = intermediateValue136 / float(int(comparisonValue27 * comparisonValue27));
                    float branchMergedValue13;
                    if (quotientValue16 < 1.0f)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float quotientValue25 = intermediateValue149 / float(int(comparisonValue27 * comparisonValue27));
                    float branchMergedValue19;
                    if (quotientValue25 < 1.0f)
#endif
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue13 = min(1.0f, max(quotientValue16, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue19 = min(1.0f, max(quotientValue25, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        branchMergedValue13 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        branchMergedValue19 = 1.0f;
#endif
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue105 = branchMergedValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue121 = branchMergedValue19;
#endif
                }
                else
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue105 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue121 = 1.0f;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float scalarValue42 = min(intermediateValue73, min(intermediateValue89, intermediateValue105));
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float scalarValue103 = min(intermediateValue72, min(intermediateValue95, intermediateValue121));
#endif
                float productValue85 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue17 = clamp((sumValue9 - productValue85) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue85), 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                productValue76 = (((clampedValue17 * clampedValue17) * (1.0f - scalarValue42)) * (3.0f - (clampedValue17 * 2.0f))) + scalarValue42;
                intermediateValue51 = intermediateValue52;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                productValue67 = (((clampedValue17 * clampedValue17) * (1.0f - scalarValue103)) * (3.0f - (clampedValue17 * 2.0f))) + scalarValue103;
                intermediateValue49 = intermediateValue50;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                productValue76 = 1.0f;
                intermediateValue51 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                productValue67 = 1.0f;
                intermediateValue49 = 1.0f;
#endif
            }
            float multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue14 = rsqrt(dot(float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
            float productValue86 = inverseLengthValue14 * multiplyAddValue35;
            float productValue87 = inverseLengthValue14 * multiplyAddValue36;
            float productValue88 = inverseLengthValue14 * multiplyAddValue37;
            float productValue89 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue2);
            float productValue90 = productValue89 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue91 = productValue89 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue92 = productValue89 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue86, productValue87, productValue88));
            float scalarValue43 = max(dotProductValue4, 0.0f);
            float dotProductValue5 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(sumValue14, sumValue15, sumValue16)), 0.0f);
            float sumValue32 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue93 = sumValue32 * sumValue32;
            float sumValue33 = productValue86 - quotientValue8;
            float sumValue34 = productValue87 - quotientValue9;
            float sumValue35 = productValue88 - quotientValue10;
            float inverseLengthValue15 = rsqrt(dot(float3(sumValue33, sumValue34, sumValue35), float3(sumValue33, sumValue34, sumValue35)));
            float productValue94 = inverseLengthValue15 * sumValue33;
            float productValue95 = inverseLengthValue15 * sumValue34;
            float productValue96 = inverseLengthValue15 * sumValue35;
            float scalarValue44 = max(intermediateValue17, 0.0500000007450580596923828125f);
            float productValue97 = scalarValue44 * scalarValue44;
            float productValue98 = productValue97 * productValue97;
            float dotProductValue6 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue94, productValue95, productValue96)), 0.0f);
            float productValue99 = ((dotProductValue6 * dotProductValue6) * (productValue98 + (-1.0f))) + 1.0f;
            float productValue100 = productValue97 * 0.5f;
            float sumValue36 = 1.0f - productValue100;
            float sumValue37 = productValue100 + 9.9999997473787516355514526367188e-05f;
            float clampedValue18 = clamp(1.0f - max(dot(float3(sumValue14, sumValue15, sumValue16), float3(productValue94, productValue95, productValue96)), 0.0f), 0.0f, 1.0f);
            float productValue101 = clampedValue18 * clampedValue18;
            float productValue102 = (productValue101 * productValue101) * clampedValue18;
            float productValue103 = (productValue102 * (1.0f - productValue68)) + productValue68;
            float productValue104 = (productValue102 * (1.0f - productValue69)) + productValue69;
            float productValue105 = (productValue102 * (1.0f - productValue70)) + productValue70;
            float quotientValue17 = ((dotProductValue5 / ((sumValue36 * dotProductValue5) + sumValue37)) * (productValue98 / ((productValue99 * productValue99) * 3.1415927410125732421875f))) * (scalarValue43 / ((sumValue36 * scalarValue43) + sumValue37));
            float productValue106 = ((scalarValue43 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float quotientValue18 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue93, 0.0f) - scalarValue43) * productValue72) + scalarValue43) * productValue76;
            float dotProductValue7 = (intermediateValue51 * productValue72) * max((dot(float3((-0.0f) - multiplyAddValue19, (-0.0f) - multiplyAddValue20, (-0.0f) - multiplyAddValue21), float3(productValue86, productValue87, productValue88)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue93, 0.0f);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float quotientValue26 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue93, 0.0f) - scalarValue43) * productValue72) + scalarValue43) * productValue67;
            float dotProductValue17 = (intermediateValue49 * productValue72) * max((dot(float3((-0.0f) - multiplyAddValue19, (-0.0f) - multiplyAddValue20, (-0.0f) - multiplyAddValue21), float3(productValue86, productValue87, productValue88)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue93, 0.0f);
#endif
            float productValue107 = sumValue12 * 0.3183098733425140380859375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float productValue108 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue43 * productValue76);
            intermediateValue29 = (productValue108 * productValue90) * ((productValue103 * quotientValue17) / productValue106);
            intermediateValue31 = (productValue108 * productValue91) * ((productValue104 * quotientValue17) / productValue106);
            intermediateValue33 = (productValue108 * productValue92) * ((productValue105 * quotientValue17) / productValue106);
            intermediateValue35 = (((productValue107 * exponentialValue) * productValue90) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue103) * quotientValue18) + dotProductValue7);
            intermediateValue37 = (((productValue107 * exponentialValue1) * productValue91) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue104) * quotientValue18) + dotProductValue7);
            intermediateValue39 = (((productValue107 * exponentialValue2) * productValue92) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue105) * quotientValue18) + dotProductValue7);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float productValue253 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue43 * productValue67);
            intermediateValue41 = (productValue253 * productValue90) * ((productValue103 * quotientValue17) / productValue106);
            intermediateValue42 = (productValue253 * productValue91) * ((productValue104 * quotientValue17) / productValue106);
            intermediateValue43 = (productValue253 * productValue92) * ((productValue105 * quotientValue17) / productValue106);
            intermediateValue44 = (((productValue107 * exponentialValue) * productValue90) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue103) * quotientValue26) + dotProductValue17);
            intermediateValue45 = (((productValue107 * exponentialValue1) * productValue91) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue104) * quotientValue26) + dotProductValue17);
            intermediateValue46 = (((productValue107 * exponentialValue2) * productValue92) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue105) * quotientValue26) + dotProductValue17);
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float intermediateValue48;
        float intermediateValue49;
        float intermediateValue50;
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue51;
        float productValue52;
        float productValue53;
        float productValue54;
        float productValue55;
        float productValue56;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue11 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue98 = conditionValue11 ? productValue60 : varyingTexCoord3.x;
            float comparisonValue99 = conditionValue11 ? productValue61 : varyingTexCoord3.y;
            float comparisonValue100 = conditionValue11 ? productValue65 : varyingTexCoord3.z;
            float productValue254 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue9;
            float productValue255 = productValue254 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue67;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue9)
            {
                intermediateValue67 = 0.0f;
            }
            else
            {
                float branchMergedValue16;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue9)
                {
                    branchMergedValue16 = 1.0f;
                }
                else
                {
                    branchMergedValue16 = min(floor(min(max((log2(sumValue9) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue67 = branchMergedValue16;
            }
            float quotientValue27 = min(floor(min(max((productValue255 + multiplyAddValue11) / (productValue255 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue28 = min(floor(min(max((productValue254 + multiplyAddValue12) / (productValue254 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue80;
            bool intermediateValue82;
            uint intermediateValue83;
            if ((intermediateValue67 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue27 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue67 < 0.0f) || ((quotientValue27 < 0.0f) || (quotientValue28 < 0.0f))))))
            {
                intermediateValue80 = intermediateValue81;
                intermediateValue82 = false;
                intermediateValue83 = 0u;
            }
            else
            {
                uint scalarValue104 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue256 = uint(int(((quotientValue28 + (intermediateValue67 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue27)) * scalarValue104;
                intermediateValue80 = productValue256;
                intermediateValue82 = true;
                intermediateValue83 = productValue256 + scalarValue104;
            }
            float intermediateValue104;
            float intermediateValue106;
            float intermediateValue108;
            float intermediateValue110;
            float intermediateValue112;
            float intermediateValue114;
            if (intermediateValue82 && (int(intermediateValue80) < int(intermediateValue83)))
            {
                float intermediateValue157;
                float quotientValue19;
                float dotProductValue15;
                float sumValue58;
                float sumValue59;
                float sumValue60;
                float quotientValue21;
                float quotientValue22;
                float quotientValue23;
                float intermediateValue203;
                float intermediateValue204;
                float intermediateValue205;
                float intermediateValue206;
                float intermediateValue208;
                float intermediateValue105;
                float intermediateValue107;
                float intermediateValue109;
                float intermediateValue111;
                float intermediateValue113;
                float intermediateValue115;
                uint scalarValue105 = intermediateValue80;
                float scalarValue106 = 0.0f;
                float scalarValue107 = 0.0f;
                float scalarValue108 = 0.0f;
                float scalarValue109 = 0.0f;
                float scalarValue110 = 0.0f;
                float scalarValue111 = 0.0f;
                uint loadedBufferValue14;
                for (;;)
                {
                    loadedBufferValue14 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue105).x)));
                    if (int(loadedBufferValue14) < int(0u))
                    {
                        intermediateValue105 = scalarValue106;
                        intermediateValue107 = scalarValue107;
                        intermediateValue109 = scalarValue108;
                        intermediateValue111 = scalarValue109;
                        intermediateValue113 = scalarValue110;
                        intermediateValue115 = scalarValue111;
                        break;
                    }
                    else
                    {
                        uint productValue257 = loadedBufferValue14 * 32u;
                        float4 loadedBufferValue47 = asfloat(uint4(rdLoad_zLights(productValue257).x, rdLoad_zLights(productValue257 + 1u).x, rdLoad_zLights(productValue257 + 2u).x, rdLoad_zLights(productValue257 + 3u).x));
                        float scalarValue112 = loadedBufferValue47.x;
                        float scalarValue113 = loadedBufferValue47.y;
                        float scalarValue114 = loadedBufferValue47.z;
                        float multiplyAddValue49 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue11);
                        float multiplyAddValue50 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue12);
                        float multiplyAddValue51 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue13);
                        float inverseLengthValue23 = rsqrt(dot(float3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51), float3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51)));
                        float productValue258 = inverseLengthValue23 * multiplyAddValue49;
                        float productValue259 = inverseLengthValue23 * multiplyAddValue50;
                        float productValue260 = inverseLengthValue23 * multiplyAddValue51;
                        float dotProductValue18 = dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue258, productValue259, productValue260));
                        intermediateValue157 = max(dotProductValue18, 0.0f);
                        float dotProductValue19 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(sumValue14, sumValue15, sumValue16)), 0.0f);
                        float sumValue150 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue261 = sumValue150 * sumValue150;
                        quotientValue19 = ((max((dotProductValue18 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue261, 0.0f) - intermediateValue157) * productValue72) + intermediateValue157;
                        dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue19, (-0.0f) - multiplyAddValue20, (-0.0f) - multiplyAddValue21), float3(productValue258, productValue259, productValue260)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue261, 0.0f) * productValue72;
                        float sumValue151 = productValue258 - quotientValue8;
                        float sumValue152 = productValue259 - quotientValue9;
                        float sumValue153 = productValue260 - quotientValue10;
                        float inverseLengthValue24 = rsqrt(dot(float3(sumValue151, sumValue152, sumValue153), float3(sumValue151, sumValue152, sumValue153)));
                        float productValue262 = inverseLengthValue24 * sumValue151;
                        float productValue263 = inverseLengthValue24 * sumValue152;
                        float productValue264 = inverseLengthValue24 * sumValue153;
                        float scalarValue115 = max(intermediateValue17, 0.0500000007450580596923828125f);
                        float productValue265 = scalarValue115 * scalarValue115;
                        float productValue266 = productValue265 * productValue265;
                        float dotProductValue20 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue262, productValue263, productValue264)), 0.0f);
                        float productValue267 = ((dotProductValue20 * dotProductValue20) * (productValue266 + (-1.0f))) + 1.0f;
                        float productValue268 = productValue265 * 0.5f;
                        float sumValue154 = 1.0f - productValue268;
                        float sumValue155 = productValue268 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue38 = clamp(1.0f - max(dot(float3(sumValue14, sumValue15, sumValue16), float3(productValue262, productValue263, productValue264)), 0.0f), 0.0f, 1.0f);
                        float productValue269 = clampedValue38 * clampedValue38;
                        float productValue270 = (productValue269 * productValue269) * clampedValue38;
                        float productValue271 = (productValue270 * (1.0f - productValue68)) + productValue68;
                        float productValue272 = (productValue270 * (1.0f - productValue69)) + productValue69;
                        float productValue273 = (productValue270 * (1.0f - productValue70)) + productValue70;
                        sumValue58 = 1.0f - productValue271;
                        sumValue59 = 1.0f - productValue272;
                        sumValue60 = 1.0f - productValue273;
                        float quotientValue29 = ((dotProductValue19 / ((sumValue154 * dotProductValue19) + sumValue155)) * (productValue266 / ((productValue267 * productValue267) * 3.1415927410125732421875f))) * (intermediateValue157 / ((sumValue154 * intermediateValue157) + sumValue155));
                        float productValue274 = ((intermediateValue157 * 4.0f) * dotProductValue19) + 9.9999997473787516355514526367188e-05f;
                        quotientValue21 = (productValue271 * quotientValue29) / productValue274;
                        quotientValue22 = (productValue272 * quotientValue29) / productValue274;
                        quotientValue23 = (productValue273 * quotientValue29) / productValue274;
                        float sumValue156 = scalarValue112 - varyingTexCoord3.x;
                        float sumValue157 = scalarValue113 - varyingTexCoord3.y;
                        float sumValue158 = scalarValue114 - varyingTexCoord3.z;
                        float productValue226;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue159 = (abs(sumValue157) + abs(sumValue156)) + abs(sumValue158);
                            productValue226 = sumValue159 * sumValue159;
                        }
                        else
                        {
                            productValue226 = dot(float3(sumValue156, sumValue157, sumValue158), float3(sumValue156, sumValue157, sumValue158));
                        }
                        float scalarValue116 = loadedBufferValue47.w;
                        float productValue275 = scalarValue116 * scalarValue116;
                        float branchMergedValue3;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        if (!(productValue226 >= productValue275))
                        {
                            float intermediateValue207;
                            float intermediateValue209;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue276 = (loadedBufferValue14 * 32u) + 8u;
                                float4 loadedBufferValue48 = asfloat(uint4(rdLoad_zLights(productValue276).x, rdLoad_zLights(productValue276 + 1u).x, rdLoad_zLights(productValue276 + 2u).x, rdLoad_zLights(productValue276 + 3u).x));
                                uint productValue277 = (loadedBufferValue14 * 32u) + 12u;
                                float4 loadedBufferValue49 = asfloat(uint4(rdLoad_zLights(productValue277).x, rdLoad_zLights(productValue277 + 1u).x, rdLoad_zLights(productValue277 + 2u).x, rdLoad_zLights(productValue277 + 3u).x));
                                uint productValue278 = (loadedBufferValue14 * 32u) + 16u;
                                float4 loadedBufferValue50 = asfloat(uint4(rdLoad_zLights(productValue278).x, rdLoad_zLights(productValue278 + 1u).x, rdLoad_zLights(productValue278 + 2u).x, rdLoad_zLights(productValue278 + 3u).x));
                                uint productValue279 = (loadedBufferValue14 * 32u) + 20u;
                                float4 loadedBufferValue51 = asfloat(uint4(rdLoad_zLights(productValue279).x, rdLoad_zLights(productValue279 + 1u).x, rdLoad_zLights(productValue279 + 2u).x, rdLoad_zLights(productValue279 + 3u).x));
                                uint productValue280 = (loadedBufferValue14 * 32u) + 24u;
                                float4 loadedBufferValue52 = asfloat(uint4(rdLoad_zLights(productValue280).x, rdLoad_zLights(productValue280 + 1u).x, rdLoad_zLights(productValue280 + 2u).x, rdLoad_zLights(productValue280 + 3u).x));
                                uint productValue281 = (loadedBufferValue14 * 32u) + 28u;
                                float4 loadedBufferValue53 = asfloat(uint4(rdLoad_zLights(productValue281).x, rdLoad_zLights(productValue281 + 1u).x, rdLoad_zLights(productValue281 + 2u).x, rdLoad_zLights(productValue281 + 3u).x));
                                float sumValue160 = comparisonValue98 - scalarValue112;
                                float sumValue161 = comparisonValue99 - scalarValue113;
                                float sumValue162 = comparisonValue100 - scalarValue114;
                                float scalarValue117 = abs(sumValue160);
                                float scalarValue118 = abs(sumValue161);
                                float scalarValue119 = abs(sumValue162);
                                uint comparisonValue69;
                                if ((scalarValue117 >= scalarValue118) && (scalarValue117 >= scalarValue119))
                                {
                                    comparisonValue69 = uint(!(sumValue160 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue25;
                                    if (!(scalarValue118 >= scalarValue119))
                                    {
                                        branchMergedValue25 = (sumValue162 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue25 = (sumValue161 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue69 = branchMergedValue25;
                                }
                                float sumValue163 = (-0.0f) - sumValue160;
                                float intermediateValue283;
                                float intermediateValue284;
                                float intermediateValue285;
                                float intermediateValue286;
                                float sumValue133;
                                float intermediateValue287;
                                float intermediateValue288;
                                if (comparisonValue69 == 1u)
                                {
                                    intermediateValue283 = loadedBufferValue49.x;
                                    intermediateValue284 = loadedBufferValue49.y;
                                    intermediateValue285 = loadedBufferValue49.z;
                                    intermediateValue286 = loadedBufferValue49.w;
                                    sumValue133 = (-0.0f) - sumValue162;
                                    intermediateValue287 = sumValue161;
                                    intermediateValue288 = sumValue160;
                                }
                                else
                                {
                                    float branchMergedValue28;
                                    float branchMergedValue57;
                                    float branchMergedValue58;
                                    float branchMergedValue59;
                                    float branchMergedValue60;
                                    float branchMergedValue61;
                                    float branchMergedValue62;
                                    if (comparisonValue69 == 2u)
                                    {
                                        branchMergedValue28 = sumValue163;
                                        branchMergedValue57 = (-0.0f) - sumValue161;
                                        branchMergedValue58 = (-0.0f) - sumValue162;
                                        branchMergedValue59 = loadedBufferValue50.w;
                                        branchMergedValue60 = loadedBufferValue50.z;
                                        branchMergedValue61 = loadedBufferValue50.y;
                                        branchMergedValue62 = loadedBufferValue50.x;
                                    }
                                    else
                                    {
                                        float branchMergedValue81;
                                        float branchMergedValue83;
                                        float branchMergedValue84;
                                        float branchMergedValue85;
                                        float branchMergedValue86;
                                        float branchMergedValue87;
                                        float branchMergedValue88;
                                        if (comparisonValue69 == 3u)
                                        {
                                            branchMergedValue81 = sumValue163;
                                            branchMergedValue83 = sumValue161;
                                            branchMergedValue84 = sumValue162;
                                            branchMergedValue85 = loadedBufferValue51.w;
                                            branchMergedValue86 = loadedBufferValue51.z;
                                            branchMergedValue87 = loadedBufferValue51.y;
                                            branchMergedValue88 = loadedBufferValue51.x;
                                        }
                                        else
                                        {
                                            float branchMergedValue96;
                                            float branchMergedValue97;
                                            float branchMergedValue98;
                                            float branchMergedValue99;
                                            float branchMergedValue100;
                                            float branchMergedValue101;
                                            float branchMergedValue102;
                                            if (comparisonValue69 == 4u)
                                            {
                                                branchMergedValue96 = sumValue163;
                                                branchMergedValue97 = (-0.0f) - sumValue162;
                                                branchMergedValue98 = sumValue161;
                                                branchMergedValue99 = loadedBufferValue52.w;
                                                branchMergedValue100 = loadedBufferValue52.z;
                                                branchMergedValue101 = loadedBufferValue52.y;
                                                branchMergedValue102 = loadedBufferValue52.x;
                                            }
                                            else
                                            {
                                                bool comparisonValue101 = comparisonValue69 == 5u;
                                                branchMergedValue96 = comparisonValue101 ? sumValue160 : sumValue162;
                                                branchMergedValue97 = comparisonValue101 ? sumValue162 : sumValue163;
                                                branchMergedValue98 = sumValue161;
                                                branchMergedValue99 = comparisonValue101 ? loadedBufferValue53.w : loadedBufferValue48.w;
                                                branchMergedValue100 = comparisonValue101 ? loadedBufferValue53.z : loadedBufferValue48.z;
                                                branchMergedValue101 = comparisonValue101 ? loadedBufferValue53.y : loadedBufferValue48.y;
                                                branchMergedValue102 = comparisonValue101 ? loadedBufferValue53.x : loadedBufferValue48.x;
                                            }
                                            branchMergedValue81 = branchMergedValue96;
                                            branchMergedValue83 = branchMergedValue97;
                                            branchMergedValue84 = branchMergedValue98;
                                            branchMergedValue85 = branchMergedValue99;
                                            branchMergedValue86 = branchMergedValue100;
                                            branchMergedValue87 = branchMergedValue101;
                                            branchMergedValue88 = branchMergedValue102;
                                        }
                                        branchMergedValue28 = branchMergedValue81;
                                        branchMergedValue57 = branchMergedValue83;
                                        branchMergedValue58 = branchMergedValue84;
                                        branchMergedValue59 = branchMergedValue85;
                                        branchMergedValue60 = branchMergedValue86;
                                        branchMergedValue61 = branchMergedValue87;
                                        branchMergedValue62 = branchMergedValue88;
                                    }
                                    intermediateValue283 = branchMergedValue62;
                                    intermediateValue284 = branchMergedValue61;
                                    intermediateValue285 = branchMergedValue60;
                                    intermediateValue286 = branchMergedValue59;
                                    sumValue133 = branchMergedValue28;
                                    intermediateValue287 = branchMergedValue58;
                                    intermediateValue288 = branchMergedValue57;
                                }
                                float branchMergedValue22;
                                float branchMergedValue38;
                                if ((intermediateValue285 == 0.0f) && (intermediateValue286 == 0.0f))
                                {
                                    branchMergedValue22 = 1.0f;
                                    branchMergedValue38 = 0.0f;
                                }
                                else
                                {
                                    float multiplyAddValue52 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue25 = rsqrt(dot(float3(productValue27, productValue28, productValue29), float3(productValue27, productValue28, productValue29)));
                                    float sumValue164 = (-0.0f) - sumValue161;
                                    float sumValue165 = (-0.0f) - sumValue162;
                                    float inverseLengthValue26 = rsqrt(dot(float3(sumValue163, sumValue164, sumValue165), float3(sumValue163, sumValue164, sumValue165)));
                                    float dotProductValue21 = min(max(dot(float3(inverseLengthValue26 * sumValue163, inverseLengthValue26 * sumValue164, inverseLengthValue26 * sumValue165), float3(inverseLengthValue25 * productValue27, inverseLengthValue25 * productValue28, inverseLengthValue25 * productValue29)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue166 = intermediateValue285 - intermediateValue283;
                                    float productValue282 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue166;
                                    float multiplyAddValue53 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue52;
                                    float multiplyAddValue54 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue52;
                                    float quotientValue30 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue167 = intermediateValue286 - intermediateValue284;
                                    float productValue283 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue167;
                                    float4 sampledTextureValue14 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue53 * 0.5f) + 0.5f) * productValue282) + 0.5f) / productValue282) * sumValue166) + intermediateValue283, quotientValue30 + intermediateValue283), intermediateValue285 - quotientValue30), min(max((((floor((0.5f - (multiplyAddValue54 * 0.5f)) * productValue283) + 0.5f) / productValue283) * sumValue167) + intermediateValue284, quotientValue31 + intermediateValue284), intermediateValue286 - quotientValue31)), 0.0f);
                                    float scalarValue120 = sampledTextureValue14.x;
                                    float multiplyAddValue55 = float(scalarValue120 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue282, 1.0f)) * (((sqrt(1.0f - (dotProductValue21 * dotProductValue21)) / dotProductValue21) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue52));
                                    float branchMergedValue80;
                                    float branchMergedValue82;
                                    if (productValue72 > 0.0f)
                                    {
                                        float multiplyAddValue56 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue57 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue56;
                                        float multiplyAddValue58 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue56;
                                        float multiplyAddValue59 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue56;
                                        float clampedValue39 = clamp((sqrt(((intermediateValue287 * intermediateValue287) + (sumValue133 * sumValue133)) + (intermediateValue288 * intermediateValue288)) - sqrt(((multiplyAddValue58 * multiplyAddValue58) + (multiplyAddValue57 * multiplyAddValue57)) + (multiplyAddValue59 * multiplyAddValue59))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue80 = 1.0f - ((clampedValue39 * clampedValue39) * (3.0f - (clampedValue39 * 2.0f)));
                                        branchMergedValue82 = multiplyAddValue55;
                                    }
                                    else
                                    {
                                        branchMergedValue80 = 1.0f;
                                        branchMergedValue82 = multiplyAddValue55;
                                    }
                                    branchMergedValue22 = branchMergedValue80;
                                    branchMergedValue38 = branchMergedValue82;
                                }
                                intermediateValue207 = branchMergedValue38;
                                intermediateValue209 = branchMergedValue22;
                            }
                            else
                            {
                                intermediateValue207 = 1.0f;
                                intermediateValue209 = 1.0f;
                            }
                            uint productValue284 = (loadedBufferValue14 * 32u) + 4u;
                            float4 loadedBufferValue54 = asfloat(uint4(rdLoad_zLights(productValue284).x, rdLoad_zLights(productValue284 + 1u).x, rdLoad_zLights(productValue284 + 2u).x, rdLoad_zLights(productValue284 + 3u).x));
                            float quotientValue32 = productValue226 / (productValue275 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue40 = clamp(1.0f - (quotientValue32 * quotientValue32), 0.0f, 1.0f);
                            float quotientValue33 = (clampedValue40 * clampedValue40) * (1.0f / max(productValue226, 0.100000001490116119384765625f));
                            float clampedValue30;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue41 = clamp(((1.0f - quotientValue33) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue30 = clamp((((clampedValue41 * clampedValue41) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue41 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue33;
                            }
                            else
                            {
                                clampedValue30 = quotientValue33;
                            }
                            float productValue285 = clampedValue30 * loadedBufferValue54.w;
                            branchMergedValue3 = intermediateValue209;
                            branchMergedValue10 = intermediateValue207;
                            branchMergedValue11 = productValue285 * loadedBufferValue54.z;
                            branchMergedValue12 = productValue285 * loadedBufferValue54.y;
                            branchMergedValue13 = productValue285 * loadedBufferValue54.x;
                        }
                        else
                        {
                            branchMergedValue3 = 1.0f;
                            branchMergedValue10 = 1.0f;
                            branchMergedValue11 = 0.0f;
                            branchMergedValue12 = 0.0f;
                            branchMergedValue13 = 0.0f;
                        }
                        intermediateValue208 = branchMergedValue3;
                        intermediateValue206 = branchMergedValue10;
                        intermediateValue205 = branchMergedValue11;
                        intermediateValue204 = branchMergedValue12;
                        intermediateValue203 = branchMergedValue13;
                        float productValue286 = intermediateValue206 * quotientValue19;
                        float productValue287 = dotProductValue15 * intermediateValue208;
                        float productValue288 = sumValue12 * 0.3183098733425140380859375f;
                        float productValue289 = ((((productValue288 * exponentialValue) * intermediateValue203) * (productValue287 + (productValue286 * sumValue58))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue109;
                        float productValue290 = ((((productValue288 * exponentialValue1) * intermediateValue204) * (productValue287 + (productValue286 * sumValue59))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue110;
                        float productValue291 = ((((productValue288 * exponentialValue2) * intermediateValue205) * (productValue287 + (productValue286 * sumValue60))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue111;
                        float productValue292 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue206 * intermediateValue157);
                        float productValue293 = ((productValue292 * quotientValue21) * intermediateValue203) + scalarValue106;
                        float productValue294 = ((productValue292 * quotientValue22) * intermediateValue204) + scalarValue107;
                        float productValue295 = ((productValue292 * quotientValue23) * intermediateValue205) + scalarValue108;
                        uint sumValue168 = scalarValue105 + 1u;
                        if (int(sumValue168) < int(intermediateValue83))
                        {
                            scalarValue105 = sumValue168;
                            scalarValue106 = productValue293;
                            scalarValue107 = productValue294;
                            scalarValue108 = productValue295;
                            scalarValue109 = productValue289;
                            scalarValue110 = productValue290;
                            scalarValue111 = productValue291;
                            continue;
                        }
                        else
                        {
                            intermediateValue105 = productValue293;
                            intermediateValue107 = productValue294;
                            intermediateValue109 = productValue295;
                            intermediateValue111 = productValue289;
                            intermediateValue113 = productValue290;
                            intermediateValue115 = productValue291;
                            break;
                        }
                    }
                }
                intermediateValue104 = intermediateValue105;
                intermediateValue106 = intermediateValue107;
                intermediateValue108 = intermediateValue109;
                intermediateValue110 = intermediateValue111;
                intermediateValue112 = intermediateValue113;
                intermediateValue114 = intermediateValue115;
            }
            else
            {
                intermediateValue104 = 0.0f;
                intermediateValue106 = 0.0f;
                intermediateValue108 = 0.0f;
                intermediateValue110 = 0.0f;
                intermediateValue112 = 0.0f;
                intermediateValue114 = 0.0f;
            }
            float sumValue169 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue51 = (sumValue169 * intermediateValue104) + intermediateValue41;
            productValue52 = (sumValue169 * intermediateValue106) + intermediateValue42;
            productValue53 = (sumValue169 * intermediateValue108) + intermediateValue43;
            productValue54 = (sumValue169 * intermediateValue110) + intermediateValue44;
            productValue55 = (sumValue169 * intermediateValue112) + intermediateValue45;
            productValue56 = (sumValue169 * intermediateValue114) + intermediateValue46;
        }
        else
        {
            productValue51 = intermediateValue41;
            productValue52 = intermediateValue42;
            productValue53 = intermediateValue43;
            productValue54 = intermediateValue44;
            productValue55 = intermediateValue45;
            productValue56 = intermediateValue46;
        }
        float intermediateValue68;
        float intermediateValue69;
        float intermediateValue70;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        float productValue51;
        float productValue52;
        float productValue53;
        float productValue54;
        float productValue55;
        float productValue56;
        if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
        {
            bool conditionValue11 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
            float comparisonValue98 = conditionValue11 ? productValue60 : varyingTexCoord3.x;
            float comparisonValue99 = conditionValue11 ? productValue61 : varyingTexCoord3.y;
            float comparisonValue100 = conditionValue11 ? productValue65 : varyingTexCoord3.z;
            float productValue254 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * sumValue9;
            float productValue255 = productValue254 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
            float intermediateValue67;
            if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x > sumValue9)
            {
                intermediateValue67 = 0.0f;
            }
            else
            {
                float branchMergedValue16;
                if (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y > sumValue9)
                {
                    branchMergedValue16 = 1.0f;
                }
                else
                {
                    branchMergedValue16 = min(floor(min(max((log2(sumValue9) - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z) * RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.x, 0.0f), 1.0f) * (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) + 2.0f, RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-1.0f));
                }
                intermediateValue67 = branchMergedValue16;
            }
            float quotientValue27 = min(floor(min(max((productValue255 + multiplyAddValue11) / (productValue255 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.x), RD_UNIFORM_CLUSTER_DIMENSIONS.x + (-1.0f));
            float quotientValue28 = min(floor(min(max((productValue254 + multiplyAddValue12) / (productValue254 * 2.0f), 0.0f), 1.0f) * RD_UNIFORM_CLUSTER_DIMENSIONS.y), RD_UNIFORM_CLUSTER_DIMENSIONS.y + (-1.0f));
            uint intermediateValue80;
            bool intermediateValue82;
            uint intermediateValue83;
            if ((intermediateValue67 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((quotientValue28 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y) || ((quotientValue27 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || ((intermediateValue67 < 0.0f) || ((quotientValue27 < 0.0f) || (quotientValue28 < 0.0f))))))
            {
                intermediateValue80 = intermediateValue81;
                intermediateValue82 = false;
                intermediateValue83 = 0u;
            }
            else
            {
                uint scalarValue104 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
                uint productValue256 = uint(int(((quotientValue28 + (intermediateValue67 * RD_UNIFORM_CLUSTER_DIMENSIONS.y)) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + quotientValue27)) * scalarValue104;
                intermediateValue80 = productValue256;
                intermediateValue82 = true;
                intermediateValue83 = productValue256 + scalarValue104;
            }
            float intermediateValue104;
            float intermediateValue106;
            float intermediateValue108;
            float intermediateValue110;
            float intermediateValue112;
            float intermediateValue114;
            if (intermediateValue82 && (int(intermediateValue80) < int(intermediateValue83)))
            {
                float intermediateValue157;
                float quotientValue19;
                float dotProductValue15;
                float sumValue58;
                float sumValue59;
                float sumValue60;
                float quotientValue21;
                float quotientValue22;
                float quotientValue23;
                float intermediateValue203;
                float intermediateValue204;
                float intermediateValue205;
                float intermediateValue206;
                float intermediateValue208;
                float intermediateValue105;
                float intermediateValue107;
                float intermediateValue109;
                float intermediateValue111;
                float intermediateValue113;
                float intermediateValue115;
                uint scalarValue105 = intermediateValue80;
                float scalarValue106 = 0.0f;
                float scalarValue107 = 0.0f;
                float scalarValue108 = 0.0f;
                float scalarValue109 = 0.0f;
                float scalarValue110 = 0.0f;
                float scalarValue111 = 0.0f;
                uint loadedBufferValue14;
                for (;;)
                {
                    loadedBufferValue14 = uint(int(asfloat(rdLoad_zLightLookupArray(scalarValue105).x)));
                    if (int(loadedBufferValue14) < int(0u))
                    {
                        intermediateValue105 = scalarValue106;
                        intermediateValue107 = scalarValue107;
                        intermediateValue109 = scalarValue108;
                        intermediateValue111 = scalarValue109;
                        intermediateValue113 = scalarValue110;
                        intermediateValue115 = scalarValue111;
                        break;
                    }
                    else
                    {
                        uint productValue257 = loadedBufferValue14 * 32u;
                        float4 loadedBufferValue47 = asfloat(uint4(rdLoad_zLights(productValue257).x, rdLoad_zLights(productValue257 + 1u).x, rdLoad_zLights(productValue257 + 2u).x, rdLoad_zLights(productValue257 + 3u).x));
                        float scalarValue112 = loadedBufferValue47.x;
                        float scalarValue113 = loadedBufferValue47.y;
                        float scalarValue114 = loadedBufferValue47.z;
                        float multiplyAddValue49 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.x - multiplyAddValue11);
                        float multiplyAddValue50 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.y - multiplyAddValue12);
                        float multiplyAddValue51 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, scalarValue114, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, scalarValue113, scalarValue112 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + (RD_UNIFORM_VIEW_MATRIX_ROW_3.z - multiplyAddValue13);
                        float inverseLengthValue23 = rsqrt(dot(float3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51), float3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51)));
                        float productValue258 = inverseLengthValue23 * multiplyAddValue49;
                        float productValue259 = inverseLengthValue23 * multiplyAddValue50;
                        float productValue260 = inverseLengthValue23 * multiplyAddValue51;
                        float dotProductValue18 = dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue258, productValue259, productValue260));
                        intermediateValue157 = max(dotProductValue18, 0.0f);
                        float dotProductValue19 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(sumValue14, sumValue15, sumValue16)), 0.0f);
                        float sumValue150 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
                        float productValue261 = sumValue150 * sumValue150;
                        quotientValue19 = ((max((dotProductValue18 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue261, 0.0f) - intermediateValue157) * productValue72) + intermediateValue157;
                        dotProductValue15 = max((dot(float3((-0.0f) - multiplyAddValue19, (-0.0f) - multiplyAddValue20, (-0.0f) - multiplyAddValue21), float3(productValue258, productValue259, productValue260)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue261, 0.0f) * productValue72;
                        float sumValue151 = productValue258 - quotientValue8;
                        float sumValue152 = productValue259 - quotientValue9;
                        float sumValue153 = productValue260 - quotientValue10;
                        float inverseLengthValue24 = rsqrt(dot(float3(sumValue151, sumValue152, sumValue153), float3(sumValue151, sumValue152, sumValue153)));
                        float productValue262 = inverseLengthValue24 * sumValue151;
                        float productValue263 = inverseLengthValue24 * sumValue152;
                        float productValue264 = inverseLengthValue24 * sumValue153;
                        float scalarValue115 = max(intermediateValue17, 0.0500000007450580596923828125f);
                        float productValue265 = scalarValue115 * scalarValue115;
                        float productValue266 = productValue265 * productValue265;
                        float dotProductValue20 = max(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3(productValue262, productValue263, productValue264)), 0.0f);
                        float productValue267 = ((dotProductValue20 * dotProductValue20) * (productValue266 + (-1.0f))) + 1.0f;
                        float productValue268 = productValue265 * 0.5f;
                        float sumValue154 = 1.0f - productValue268;
                        float sumValue155 = productValue268 + 9.9999997473787516355514526367188e-05f;
                        float clampedValue38 = clamp(1.0f - max(dot(float3(sumValue14, sumValue15, sumValue16), float3(productValue262, productValue263, productValue264)), 0.0f), 0.0f, 1.0f);
                        float productValue269 = clampedValue38 * clampedValue38;
                        float productValue270 = (productValue269 * productValue269) * clampedValue38;
                        float productValue271 = (productValue270 * (1.0f - productValue68)) + productValue68;
                        float productValue272 = (productValue270 * (1.0f - productValue69)) + productValue69;
                        float productValue273 = (productValue270 * (1.0f - productValue70)) + productValue70;
                        sumValue58 = 1.0f - productValue271;
                        sumValue59 = 1.0f - productValue272;
                        sumValue60 = 1.0f - productValue273;
                        float quotientValue29 = ((dotProductValue19 / ((sumValue154 * dotProductValue19) + sumValue155)) * (productValue266 / ((productValue267 * productValue267) * 3.1415927410125732421875f))) * (intermediateValue157 / ((sumValue154 * intermediateValue157) + sumValue155));
                        float productValue274 = ((intermediateValue157 * 4.0f) * dotProductValue19) + 9.9999997473787516355514526367188e-05f;
                        quotientValue21 = (productValue271 * quotientValue29) / productValue274;
                        quotientValue22 = (productValue272 * quotientValue29) / productValue274;
                        quotientValue23 = (productValue273 * quotientValue29) / productValue274;
                        float sumValue156 = scalarValue112 - varyingTexCoord3.x;
                        float sumValue157 = scalarValue113 - varyingTexCoord3.y;
                        float sumValue158 = scalarValue114 - varyingTexCoord3.z;
                        float productValue226;
                        if (RD_UNIFORM_MANHATTAN_DIST_ATTENUATION_ENABLED.x > 0.0f)
                        {
                            float sumValue159 = (abs(sumValue157) + abs(sumValue156)) + abs(sumValue158);
                            productValue226 = sumValue159 * sumValue159;
                        }
                        else
                        {
                            productValue226 = dot(float3(sumValue156, sumValue157, sumValue158), float3(sumValue156, sumValue157, sumValue158));
                        }
                        float scalarValue116 = loadedBufferValue47.w;
                        float productValue275 = scalarValue116 * scalarValue116;
                        float branchMergedValue3;
                        float branchMergedValue10;
                        float branchMergedValue11;
                        float branchMergedValue12;
                        float branchMergedValue13;
                        if (!(productValue226 >= productValue275))
                        {
                            float intermediateValue207;
                            float intermediateValue209;
                            if (RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f)
                            {
                                uint productValue276 = (loadedBufferValue14 * 32u) + 8u;
                                float4 loadedBufferValue48 = asfloat(uint4(rdLoad_zLights(productValue276).x, rdLoad_zLights(productValue276 + 1u).x, rdLoad_zLights(productValue276 + 2u).x, rdLoad_zLights(productValue276 + 3u).x));
                                uint productValue277 = (loadedBufferValue14 * 32u) + 12u;
                                float4 loadedBufferValue49 = asfloat(uint4(rdLoad_zLights(productValue277).x, rdLoad_zLights(productValue277 + 1u).x, rdLoad_zLights(productValue277 + 2u).x, rdLoad_zLights(productValue277 + 3u).x));
                                uint productValue278 = (loadedBufferValue14 * 32u) + 16u;
                                float4 loadedBufferValue50 = asfloat(uint4(rdLoad_zLights(productValue278).x, rdLoad_zLights(productValue278 + 1u).x, rdLoad_zLights(productValue278 + 2u).x, rdLoad_zLights(productValue278 + 3u).x));
                                uint productValue279 = (loadedBufferValue14 * 32u) + 20u;
                                float4 loadedBufferValue51 = asfloat(uint4(rdLoad_zLights(productValue279).x, rdLoad_zLights(productValue279 + 1u).x, rdLoad_zLights(productValue279 + 2u).x, rdLoad_zLights(productValue279 + 3u).x));
                                uint productValue280 = (loadedBufferValue14 * 32u) + 24u;
                                float4 loadedBufferValue52 = asfloat(uint4(rdLoad_zLights(productValue280).x, rdLoad_zLights(productValue280 + 1u).x, rdLoad_zLights(productValue280 + 2u).x, rdLoad_zLights(productValue280 + 3u).x));
                                uint productValue281 = (loadedBufferValue14 * 32u) + 28u;
                                float4 loadedBufferValue53 = asfloat(uint4(rdLoad_zLights(productValue281).x, rdLoad_zLights(productValue281 + 1u).x, rdLoad_zLights(productValue281 + 2u).x, rdLoad_zLights(productValue281 + 3u).x));
                                float sumValue160 = comparisonValue98 - scalarValue112;
                                float sumValue161 = comparisonValue99 - scalarValue113;
                                float sumValue162 = comparisonValue100 - scalarValue114;
                                float scalarValue117 = abs(sumValue160);
                                float scalarValue118 = abs(sumValue161);
                                float scalarValue119 = abs(sumValue162);
                                uint comparisonValue69;
                                if ((scalarValue117 >= scalarValue118) && (scalarValue117 >= scalarValue119))
                                {
                                    comparisonValue69 = uint(!(sumValue160 >= 0.0f));
                                }
                                else
                                {
                                    uint branchMergedValue25;
                                    if (!(scalarValue118 >= scalarValue119))
                                    {
                                        branchMergedValue25 = (sumValue162 >= 0.0f) ? 4u : 5u;
                                    }
                                    else
                                    {
                                        branchMergedValue25 = (sumValue161 >= 0.0f) ? 2u : 3u;
                                    }
                                    comparisonValue69 = branchMergedValue25;
                                }
                                float sumValue163 = (-0.0f) - sumValue160;
                                float intermediateValue283;
                                float intermediateValue284;
                                float intermediateValue285;
                                float intermediateValue286;
                                float sumValue133;
                                float intermediateValue287;
                                float intermediateValue288;
                                if (comparisonValue69 == 1u)
                                {
                                    intermediateValue283 = loadedBufferValue49.x;
                                    intermediateValue284 = loadedBufferValue49.y;
                                    intermediateValue285 = loadedBufferValue49.z;
                                    intermediateValue286 = loadedBufferValue49.w;
                                    sumValue133 = (-0.0f) - sumValue162;
                                    intermediateValue287 = sumValue161;
                                    intermediateValue288 = sumValue160;
                                }
                                else
                                {
                                    float branchMergedValue28;
                                    float branchMergedValue57;
                                    float branchMergedValue58;
                                    float branchMergedValue59;
                                    float branchMergedValue60;
                                    float branchMergedValue61;
                                    float branchMergedValue62;
                                    if (comparisonValue69 == 2u)
                                    {
                                        branchMergedValue28 = loadedBufferValue50.w;
                                        branchMergedValue57 = loadedBufferValue50.x;
                                        branchMergedValue58 = loadedBufferValue50.y;
                                        branchMergedValue59 = loadedBufferValue50.z;
                                        branchMergedValue60 = sumValue163;
                                        branchMergedValue61 = (-0.0f) - sumValue161;
                                        branchMergedValue62 = (-0.0f) - sumValue162;
                                    }
                                    else
                                    {
                                        float branchMergedValue81;
                                        float branchMergedValue83;
                                        float branchMergedValue84;
                                        float branchMergedValue85;
                                        float branchMergedValue86;
                                        float branchMergedValue87;
                                        float branchMergedValue88;
                                        if (comparisonValue69 == 3u)
                                        {
                                            branchMergedValue81 = loadedBufferValue51.w;
                                            branchMergedValue83 = loadedBufferValue51.x;
                                            branchMergedValue84 = loadedBufferValue51.y;
                                            branchMergedValue85 = loadedBufferValue51.z;
                                            branchMergedValue86 = sumValue163;
                                            branchMergedValue87 = sumValue161;
                                            branchMergedValue88 = sumValue162;
                                        }
                                        else
                                        {
                                            float branchMergedValue96;
                                            float branchMergedValue97;
                                            float branchMergedValue98;
                                            float branchMergedValue99;
                                            float branchMergedValue100;
                                            float branchMergedValue101;
                                            float branchMergedValue102;
                                            if (comparisonValue69 == 4u)
                                            {
                                                branchMergedValue96 = loadedBufferValue52.w;
                                                branchMergedValue97 = loadedBufferValue52.x;
                                                branchMergedValue98 = loadedBufferValue52.y;
                                                branchMergedValue99 = loadedBufferValue52.z;
                                                branchMergedValue100 = sumValue163;
                                                branchMergedValue101 = (-0.0f) - sumValue162;
                                                branchMergedValue102 = sumValue161;
                                            }
                                            else
                                            {
                                                bool comparisonValue101 = comparisonValue69 == 5u;
                                                branchMergedValue96 = comparisonValue101 ? loadedBufferValue53.w : loadedBufferValue48.w;
                                                branchMergedValue97 = comparisonValue101 ? loadedBufferValue53.x : loadedBufferValue48.x;
                                                branchMergedValue98 = comparisonValue101 ? loadedBufferValue53.y : loadedBufferValue48.y;
                                                branchMergedValue99 = comparisonValue101 ? loadedBufferValue53.z : loadedBufferValue48.z;
                                                branchMergedValue100 = comparisonValue101 ? sumValue160 : sumValue162;
                                                branchMergedValue101 = comparisonValue101 ? sumValue162 : sumValue163;
                                                branchMergedValue102 = sumValue161;
                                            }
                                            branchMergedValue81 = branchMergedValue96;
                                            branchMergedValue83 = branchMergedValue97;
                                            branchMergedValue84 = branchMergedValue98;
                                            branchMergedValue85 = branchMergedValue99;
                                            branchMergedValue86 = branchMergedValue100;
                                            branchMergedValue87 = branchMergedValue101;
                                            branchMergedValue88 = branchMergedValue102;
                                        }
                                        branchMergedValue28 = branchMergedValue81;
                                        branchMergedValue57 = branchMergedValue83;
                                        branchMergedValue58 = branchMergedValue84;
                                        branchMergedValue59 = branchMergedValue85;
                                        branchMergedValue60 = branchMergedValue86;
                                        branchMergedValue61 = branchMergedValue87;
                                        branchMergedValue62 = branchMergedValue88;
                                    }
                                    intermediateValue283 = branchMergedValue57;
                                    intermediateValue284 = branchMergedValue58;
                                    intermediateValue285 = branchMergedValue59;
                                    intermediateValue286 = branchMergedValue28;
                                    sumValue133 = branchMergedValue60;
                                    intermediateValue287 = branchMergedValue62;
                                    intermediateValue288 = branchMergedValue61;
                                }
                                float branchMergedValue22;
                                float branchMergedValue38;
                                if ((intermediateValue285 == 0.0f) && (intermediateValue286 == 0.0f))
                                {
                                    branchMergedValue22 = 0.0f;
                                    branchMergedValue38 = 1.0f;
                                }
                                else
                                {
                                    float multiplyAddValue52 = mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.w, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.w, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.w * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.w;
                                    float inverseLengthValue25 = rsqrt(dot(float3(productValue27, productValue28, productValue29), float3(productValue27, productValue28, productValue29)));
                                    float sumValue164 = (-0.0f) - sumValue161;
                                    float sumValue165 = (-0.0f) - sumValue162;
                                    float inverseLengthValue26 = rsqrt(dot(float3(sumValue163, sumValue164, sumValue165), float3(sumValue163, sumValue164, sumValue165)));
                                    float dotProductValue21 = min(max(dot(float3(inverseLengthValue26 * sumValue163, inverseLengthValue26 * sumValue164, inverseLengthValue26 * sumValue165), float3(inverseLengthValue25 * productValue27, inverseLengthValue25 * productValue28, inverseLengthValue25 * productValue29)), RD_UNIFORM_POINT_LIGHT_ND_LFLOOR.x), 1.0f);
                                    float sumValue166 = intermediateValue285 - intermediateValue283;
                                    float productValue282 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x * sumValue166;
                                    float multiplyAddValue53 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.x, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.x, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.x * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.x) / multiplyAddValue52;
                                    float multiplyAddValue54 = (mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.y, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.y, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.y * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.y) / multiplyAddValue52;
                                    float quotientValue30 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.x;
                                    float quotientValue31 = 0.5f / RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y;
                                    float sumValue167 = intermediateValue286 - intermediateValue284;
                                    float productValue283 = RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.y * sumValue167;
                                    float4 sampledTextureValue14 = pointLightShadowTextureAtlasTexture.SampleLevel(pointLightShadowTextureAtlasSampler, float2(min(max((((floor(((multiplyAddValue53 * 0.5f) + 0.5f) * productValue282) + 0.5f) / productValue282) * sumValue166) + intermediateValue283, quotientValue30 + intermediateValue283), intermediateValue285 - quotientValue30), min(max((((floor((0.5f - (multiplyAddValue54 * 0.5f)) * productValue283) + 0.5f) / productValue283) * sumValue167) + intermediateValue284, quotientValue31 + intermediateValue284), intermediateValue286 - quotientValue31)), 0.0f);
                                    float scalarValue120 = sampledTextureValue14.x;
                                    float multiplyAddValue55 = float(scalarValue120 >= (((mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_2.z, intermediateValue288, mad(RD_UNIFORM_POINT_LIGHT_PROJ_ROW_1.z, intermediateValue287, RD_UNIFORM_POINT_LIGHT_PROJ_ROW_0.z * sumValue133)) + RD_UNIFORM_POINT_LIGHT_PROJ_ROW_3.z) - ((RD_UNIFORM_POINT_LIGHT_SHADOW_ATLAS_RESOLUTION.z / max(productValue282, 1.0f)) * (((sqrt(1.0f - (dotProductValue21 * dotProductValue21)) / dotProductValue21) * RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.y) + RD_UNIFORM_POINT_LIGHT_SHADOW_PARAMS1.x))) / multiplyAddValue52));
                                    float branchMergedValue80;
                                    float branchMergedValue82;
                                    if (productValue72 > 0.0f)
                                    {
                                        float multiplyAddValue56 = mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.w, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.w, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.w * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.w;
                                        float multiplyAddValue57 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.x, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.x, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.x * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.x) / multiplyAddValue56;
                                        float multiplyAddValue58 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.y, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.y, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.y * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.y) / multiplyAddValue56;
                                        float multiplyAddValue59 = (mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_2.z, scalarValue120, mad(RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_1.z, multiplyAddValue54, RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_0.z * multiplyAddValue53)) + RD_UNIFORM_POINT_LIGHT_INV_PROJ_ROW_3.z) / multiplyAddValue56;
                                        float clampedValue39 = clamp((sqrt(((intermediateValue287 * intermediateValue287) + (sumValue133 * sumValue133)) + (intermediateValue288 * intermediateValue288)) - sqrt(((multiplyAddValue58 * multiplyAddValue58) + (multiplyAddValue57 * multiplyAddValue57)) + (multiplyAddValue59 * multiplyAddValue59))) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z, 0.0f, 1.0f);
                                        branchMergedValue80 = multiplyAddValue55;
                                        branchMergedValue82 = 1.0f - ((clampedValue39 * clampedValue39) * (3.0f - (clampedValue39 * 2.0f)));
                                    }
                                    else
                                    {
                                        branchMergedValue80 = multiplyAddValue55;
                                        branchMergedValue82 = 1.0f;
                                    }
                                    branchMergedValue22 = branchMergedValue80;
                                    branchMergedValue38 = branchMergedValue82;
                                }
                                intermediateValue207 = branchMergedValue22;
                                intermediateValue209 = branchMergedValue38;
                            }
                            else
                            {
                                intermediateValue207 = 1.0f;
                                intermediateValue209 = 1.0f;
                            }
                            uint productValue284 = (loadedBufferValue14 * 32u) + 4u;
                            float4 loadedBufferValue54 = asfloat(uint4(rdLoad_zLights(productValue284).x, rdLoad_zLights(productValue284 + 1u).x, rdLoad_zLights(productValue284 + 2u).x, rdLoad_zLights(productValue284 + 3u).x));
                            float quotientValue32 = productValue226 / (productValue275 + 9.9999997473787516355514526367188e-05f);
                            float clampedValue40 = clamp(1.0f - (quotientValue32 * quotientValue32), 0.0f, 1.0f);
                            float quotientValue33 = (clampedValue40 * clampedValue40) * (1.0f / max(productValue226, 0.100000001490116119384765625f));
                            float clampedValue30;
                            if (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW_ENABLED.x > 0.0f)
                            {
                                float clampedValue41 = clamp(((1.0f - quotientValue33) - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x) / (RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.y - RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.x), 0.0f, 1.0f);
                                clampedValue30 = clamp((((clampedValue41 * clampedValue41) * RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.z) * (3.0f - (clampedValue41 * 2.0f))) + RD_UNIFORM_POINT_LIGHT_ATTENUATION_WINDOW.w, 0.0f, 1.0f) * quotientValue33;
                            }
                            else
                            {
                                clampedValue30 = quotientValue33;
                            }
                            float productValue285 = clampedValue30 * loadedBufferValue54.w;
                            branchMergedValue3 = intermediateValue209;
                            branchMergedValue10 = intermediateValue207;
                            branchMergedValue11 = productValue285 * loadedBufferValue54.z;
                            branchMergedValue12 = productValue285 * loadedBufferValue54.y;
                            branchMergedValue13 = productValue285 * loadedBufferValue54.x;
                        }
                        else
                        {
                            branchMergedValue3 = 1.0f;
                            branchMergedValue10 = 1.0f;
                            branchMergedValue11 = 0.0f;
                            branchMergedValue12 = 0.0f;
                            branchMergedValue13 = 0.0f;
                        }
                        intermediateValue208 = branchMergedValue3;
                        intermediateValue206 = branchMergedValue10;
                        intermediateValue205 = branchMergedValue11;
                        intermediateValue204 = branchMergedValue12;
                        intermediateValue203 = branchMergedValue13;
                        float productValue286 = intermediateValue206 * quotientValue19;
                        float productValue287 = dotProductValue15 * intermediateValue208;
                        float productValue288 = sumValue12 * 0.3183098733425140380859375f;
                        float productValue289 = ((((productValue288 * exponentialValue) * intermediateValue203) * (productValue287 + (productValue286 * sumValue58))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue109;
                        float productValue290 = ((((productValue288 * exponentialValue1) * intermediateValue204) * (productValue287 + (productValue286 * sumValue59))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue110;
                        float productValue291 = ((((productValue288 * exponentialValue2) * intermediateValue205) * (productValue287 + (productValue286 * sumValue60))) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) + scalarValue111;
                        float productValue292 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (intermediateValue206 * intermediateValue157);
                        float productValue293 = ((productValue292 * quotientValue21) * intermediateValue203) + scalarValue106;
                        float productValue294 = ((productValue292 * quotientValue22) * intermediateValue204) + scalarValue107;
                        float productValue295 = ((productValue292 * quotientValue23) * intermediateValue205) + scalarValue108;
                        uint sumValue168 = scalarValue105 + 1u;
                        if (int(sumValue168) < int(intermediateValue83))
                        {
                            scalarValue105 = sumValue168;
                            scalarValue106 = productValue293;
                            scalarValue107 = productValue294;
                            scalarValue108 = productValue295;
                            scalarValue109 = productValue289;
                            scalarValue110 = productValue290;
                            scalarValue111 = productValue291;
                            continue;
                        }
                        else
                        {
                            intermediateValue105 = productValue293;
                            intermediateValue107 = productValue294;
                            intermediateValue109 = productValue295;
                            intermediateValue111 = productValue289;
                            intermediateValue113 = productValue290;
                            intermediateValue115 = productValue291;
                            break;
                        }
                    }
                }
                intermediateValue104 = intermediateValue105;
                intermediateValue106 = intermediateValue107;
                intermediateValue108 = intermediateValue109;
                intermediateValue110 = intermediateValue111;
                intermediateValue112 = intermediateValue113;
                intermediateValue114 = intermediateValue115;
            }
            else
            {
                intermediateValue104 = 0.0f;
                intermediateValue106 = 0.0f;
                intermediateValue108 = 0.0f;
                intermediateValue110 = 0.0f;
                intermediateValue112 = 0.0f;
                intermediateValue114 = 0.0f;
            }
            float sumValue169 = 1.0f - RD_UNIFORM_TRANSITIONING_AMBIENT_SCALAR.x;
            productValue51 = (sumValue169 * intermediateValue104) + intermediateValue41;
            productValue52 = (sumValue169 * intermediateValue106) + intermediateValue42;
            productValue53 = (sumValue169 * intermediateValue108) + intermediateValue43;
            productValue54 = (sumValue169 * intermediateValue110) + intermediateValue44;
            productValue55 = (sumValue169 * intermediateValue112) + intermediateValue45;
            productValue56 = (sumValue169 * intermediateValue114) + intermediateValue46;
        }
        else
        {
            productValue51 = intermediateValue41;
            productValue52 = intermediateValue42;
            productValue53 = intermediateValue43;
            productValue54 = intermediateValue44;
            productValue55 = intermediateValue45;
            productValue56 = intermediateValue46;
        }
        float intermediateValue68;
        float intermediateValue69;
        float intermediateValue70;
        if ((RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.z != 0.0f) && (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f))
#endif
        {
            float productValue109 = ((varyingTexCoord3.x + (-0.5f)) + (productValue27 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue110 = ((varyingTexCoord3.y + (-0.5f)) + (productValue28 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue115 = ((varyingTexCoord3.z + (-0.5f)) + (productValue29 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue116 = floor(productValue109 * 0.0625f) * 16.0f;
            float productValue117 = floor(productValue110 * 0.0625f) * 16.0f;
            float productValue118 = floor(productValue115 * 0.0625f) * 16.0f;
            uint productValue123 = uint(int(floor(float(int(uint(int(floor(productValue109))))) * 0.0625f)));
            uint productValue124 = uint(int(floor(float(int(uint(int(floor(productValue110))))) * 0.0625f)));
            uint productValue125 = uint(int(floor(float(int(uint(int(floor(productValue115))))) * 0.0625f)));
            float sumValue38 = productValue109 - productValue116;
            float sumValue39 = productValue110 - productValue117;
            float sumValue40 = productValue115 - productValue118;
            uint bitwiseValue1 = (productValue124 << 16u) | (productValue123 & 65535u);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue2 = productValue125 & 65535u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue35 = (productValue125 & 65535u) | 131072u;
#endif
            uint productValue126 = productValue123 * 1540483477u;
            uint productValue127 = productValue124 * 1540483477u;
            uint productValue128 = productValue125 * 1540483477u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            uint bitwiseValue3 = ((((((((productValue126 >> 24u) ^ productValue126) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue127 >> 24u) ^ productValue127) * 1540483477u)) * 1540483477u) ^ (((productValue128 >> 24u) ^ productValue128) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue47 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            uint bitwiseValue36 = (((((((((productValue126 >> 24u) ^ productValue126) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue127 >> 24u) ^ productValue127) * 1540483477u)) * 1540483477u) ^ (((productValue128 >> 24u) ^ productValue128) * 1540483477u)) * 1540483477u) ^ 2418085729u;
            uint bitwiseValue37 = ((bitwiseValue36 >> 13u) ^ bitwiseValue36) * 1540483477u;
            uint bitwiseValue38 = (bitwiseValue37 >> 15u) ^ bitwiseValue37;
            uint bitwiseValue39 = bitwiseValue38 >> 16u;
            uint bitwiseValue40 = bitwiseValue38 & 65535u;
            uint comparisonValue102 = uint(bitwiseValue40 == bitwiseValue39) | (bitwiseValue40 ^ bitwiseValue39);
#endif
            uint sumValue41 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            bool intermediateValue81;
            uint scalarValue45 = comparisonValue47;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            bool intermediateValue116;
            uint scalarValue121 = comparisonValue102;
#endif
            uint scalarValue46 = 0u;
            uint scalarValue47 = 0u;
            uint loadedBufferValue11;
            uint bitwiseValue7;
            for (;;)
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bitwiseValue7 = scalarValue45 & sumValue41;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bitwiseValue7 = scalarValue121 & sumValue41;
#endif
                uint loadedBufferValue12 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                bool loadedBufferValue13 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue12 == comparisonValue47));
                loadedBufferValue11 = loadedBufferValue13 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue46;
                if ((loadedBufferValue12 == 0u) || loadedBufferValue13)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                bool loadedBufferValue55 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue35) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue12 == comparisonValue102));
                loadedBufferValue11 = loadedBufferValue55 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue46;
                if ((loadedBufferValue12 == 0u) || loadedBufferValue55)
#endif
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    intermediateValue81 = loadedBufferValue13;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    intermediateValue116 = loadedBufferValue55;
#endif
                    break;
                }
                else
                {
                    uint sumValue42 = scalarValue47 + 1u;
                    if (int(sumValue42) < int(8u))
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        scalarValue45 = bitwiseValue7 + 1u;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        scalarValue121 = bitwiseValue7 + 1u;
#endif
                        scalarValue46 = loadedBufferValue11;
                        scalarValue47 = sumValue42;
                        continue;
                    }
                    else
                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        intermediateValue81 = false;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        intermediateValue116 = false;
#endif
                        break;
                    }
                }
            }
            uint bitwiseValue9 = loadedBufferValue11 >> 2u;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue10;
            float branchMergedValue20;
            float branchMergedValue21;
            if (intermediateValue81)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue17;
            float branchMergedValue32;
            float branchMergedValue33;
            if (intermediateValue116)
#endif
            {
                float scalarValue48 = abs(productValue27);
                float scalarValue49 = abs(productValue28);
                float scalarValue50 = abs(productValue29);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue53;
                float branchMergedValue59;
                float branchMergedValue60;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue70;
                float branchMergedValue78;
                float branchMergedValue79;
#endif
                if (((scalarValue48 >= 1.0f) || (scalarValue49 >= 1.0f)) || (scalarValue50 >= 1.0f))
                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    float intermediateValue200;
                    float intermediateValue201;
                    float intermediateValue202;
                    float intermediateValue203;
                    float intermediateValue205;
                    float intermediateValue207;
                    float intermediateValue209;
                    float intermediateValue211;
                    float intermediateValue213;
                    float intermediateValue215;
                    float intermediateValue216;
                    float intermediateValue217;
                    float productValue145;
                    float productValue146;
                    float productValue147;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float sumValue46;
                    float sumValue47;
                    float sumValue48;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float productValue148;
                    float productValue149;
                    float productValue150;
                    float productValue151;
                    bool comparisonValue28;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    float intermediateValue242;
                    float intermediateValue243;
                    float intermediateValue244;
                    float intermediateValue245;
                    float intermediateValue247;
                    float intermediateValue249;
                    float intermediateValue251;
                    float intermediateValue253;
                    float intermediateValue255;
                    float intermediateValue257;
                    float intermediateValue258;
                    float intermediateValue259;
                    float productValue201;
                    float productValue202;
                    float productValue203;
                    float sumValue64;
                    float sumValue65;
                    float sumValue66;
                    float sumValue67;
                    float sumValue68;
                    float sumValue69;
                    float sumValue70;
                    float sumValue71;
                    float sumValue72;
                    float productValue204;
                    float productValue205;
                    float productValue206;
                    float productValue207;
                    bool comparisonValue35;
#endif
                    for (;;)
                    {
                        float dotProductValue8 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue48, scalarValue49, scalarValue50));
                        float dotProductValue9 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue50, scalarValue48, scalarValue49));
                        float dotProductValue10 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue49, scalarValue50, scalarValue48));
                        float comparisonValue50 = ((inverseLengthValue7 * ((intermediateValue12 + multiplyAddValue) + intermediateValue13)) > 0.0f) ? ceil(dotProductValue8) : floor(dotProductValue8);
                        float scalarValue51 = floor(dotProductValue9);
                        float scalarValue52 = floor(dotProductValue10);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        productValue145 = ((comparisonValue50 * scalarValue48) + (scalarValue51 * scalarValue50)) + (scalarValue52 * scalarValue49);
                        productValue146 = ((comparisonValue50 * scalarValue49) + (scalarValue51 * scalarValue48)) + (scalarValue52 * scalarValue50);
                        productValue147 = ((comparisonValue50 * scalarValue50) + (scalarValue51 * scalarValue49)) + (scalarValue52 * scalarValue48);
                        sumValue43 = productValue145 + scalarValue50;
                        sumValue44 = productValue146 + scalarValue48;
                        sumValue45 = productValue147 + scalarValue49;
                        sumValue46 = productValue145 + scalarValue49;
                        sumValue47 = productValue146 + scalarValue50;
                        sumValue48 = productValue147 + scalarValue48;
                        sumValue49 = sumValue43 + scalarValue49;
                        sumValue50 = sumValue47 + scalarValue48;
                        sumValue51 = sumValue45 + scalarValue48;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        productValue201 = ((comparisonValue50 * scalarValue48) + (scalarValue51 * scalarValue50)) + (scalarValue52 * scalarValue49);
                        productValue202 = ((comparisonValue50 * scalarValue49) + (scalarValue51 * scalarValue48)) + (scalarValue52 * scalarValue50);
                        productValue203 = ((comparisonValue50 * scalarValue50) + (scalarValue51 * scalarValue49)) + (scalarValue52 * scalarValue48);
                        sumValue64 = productValue201 + scalarValue50;
                        sumValue65 = productValue202 + scalarValue48;
                        sumValue66 = productValue203 + scalarValue49;
                        sumValue67 = productValue201 + scalarValue49;
                        sumValue68 = productValue202 + scalarValue50;
                        sumValue69 = productValue203 + scalarValue48;
                        sumValue70 = sumValue64 + scalarValue49;
                        sumValue71 = sumValue68 + scalarValue48;
                        sumValue72 = sumValue66 + scalarValue48;
#endif
                        float sumValue52 = dotProductValue9 - scalarValue51;
                        float sumValue53 = dotProductValue10 - scalarValue52;
                        float sumValue54 = 1.0f - sumValue52;
                        float sumValue55 = 1.0f - sumValue53;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                        productValue148 = sumValue55 * sumValue54;
                        productValue149 = sumValue55 * sumValue52;
                        productValue150 = sumValue54 * sumValue53;
                        productValue151 = sumValue53 * sumValue52;
                        comparisonValue28 = ((productValue147 >= 0.0f) && ((productValue145 >= 0.0f) && (productValue146 >= 0.0f))) && ((sumValue51 < 16.0f) && ((sumValue49 < 16.0f) && (sumValue50 < 16.0f)));
                        if (comparisonValue28)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                        productValue204 = sumValue55 * sumValue54;
                        productValue205 = sumValue55 * sumValue52;
                        productValue206 = sumValue54 * sumValue53;
                        productValue207 = sumValue53 * sumValue52;
                        comparisonValue35 = ((productValue203 >= 0.0f) && ((productValue201 >= 0.0f) && (productValue202 >= 0.0f))) && ((sumValue72 < 16.0f) && ((sumValue70 < 16.0f) && (sumValue71 < 16.0f)));
                        if (comparisonValue35)
#endif
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue15 = rdLoad_voxelBuffer(((uint(productValue146) + bitwiseValue9) + (uint(productValue147) << 4u)) + (uint(productValue145) << 8u));
                            uint scalarValue53 = loadedBufferValue15.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue56 = rdLoad_voxelBuffer(((uint(productValue202) + bitwiseValue9) + (uint(productValue203) << 4u)) + (uint(productValue201) << 8u));
                            uint scalarValue122 = loadedBufferValue56.x;
#endif
                            float bitwiseValue13;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue154;
                            float intermediateValue155;
                            if (scalarValue53 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue192;
                            float intermediateValue193;
                            if (scalarValue122 == 0u)
#endif
                            {
                                bitwiseValue13 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue192 = 0.0f;
                                intermediateValue193 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float bitwiseValue11 = float(scalarValue53 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue53 & 255u);
                                intermediateValue154 = bitwiseValue11 * float((scalarValue53 >> 8u) & 255u);
                                intermediateValue155 = bitwiseValue11 * float((scalarValue53 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue41 = float(scalarValue122 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue41 * float(scalarValue122 & 255u);
                                intermediateValue192 = bitwiseValue41 * float((scalarValue122 >> 8u) & 255u);
                                intermediateValue193 = bitwiseValue41 * float((scalarValue122 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                            uint scalarValue54 = loadedBufferValue16.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue57 = rdLoad_voxelBuffer(((uint(sumValue65) + bitwiseValue9) + (uint(sumValue66) << 4u)) + (uint(sumValue64) << 8u));
                            uint scalarValue123 = loadedBufferValue57.x;
#endif
                            float bitwiseValue17;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue166;
                            float intermediateValue167;
                            if (scalarValue54 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue210;
                            float intermediateValue211;
                            if (scalarValue123 == 0u)
#endif
                            {
                                bitwiseValue17 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue166 = 0.0f;
                                intermediateValue167 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue210 = 0.0f;
                                intermediateValue211 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float bitwiseValue12 = float(scalarValue54 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue54 & 255u);
                                intermediateValue166 = bitwiseValue12 * float((scalarValue54 >> 8u) & 255u);
                                intermediateValue167 = bitwiseValue12 * float((scalarValue54 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue42 = float(scalarValue123 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue42 * float(scalarValue123 & 255u);
                                intermediateValue210 = bitwiseValue42 * float((scalarValue123 >> 8u) & 255u);
                                intermediateValue211 = bitwiseValue42 * float((scalarValue123 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue17 = rdLoad_voxelBuffer(((uint(sumValue47) + bitwiseValue9) + (uint(sumValue48) << 4u)) + (uint(sumValue46) << 8u));
                            uint scalarValue55 = loadedBufferValue17.x;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue58 = rdLoad_voxelBuffer(((uint(sumValue68) + bitwiseValue9) + (uint(sumValue69) << 4u)) + (uint(sumValue67) << 8u));
                            uint scalarValue124 = loadedBufferValue58.x;
#endif
                            float bitwiseValue21;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue185;
                            float intermediateValue186;
                            if (scalarValue55 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue236;
                            float intermediateValue237;
                            if (scalarValue124 == 0u)
#endif
                            {
                                bitwiseValue21 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue185 = 0.0f;
                                intermediateValue186 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue236 = 0.0f;
                                intermediateValue237 = 0.0f;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue55 & 255u);
                                intermediateValue185 = bitwiseValue14 * float((scalarValue55 >> 8u) & 255u);
                                intermediateValue186 = bitwiseValue14 * float((scalarValue55 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue18 = rdLoad_voxelBuffer(((uint(sumValue50) + bitwiseValue9) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u));
                            uint scalarValue56 = loadedBufferValue18.x;
                            float branchMergedValue16;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            if (scalarValue56 == 0u)
                            {
                                branchMergedValue16 = intermediateValue154;
                                branchMergedValue29 = bitwiseValue13;
                                branchMergedValue30 = 0.0f;
                                branchMergedValue31 = 0.0f;
                                branchMergedValue32 = 0.0f;
                                branchMergedValue33 = intermediateValue186;
                                branchMergedValue34 = intermediateValue185;
                                branchMergedValue35 = bitwiseValue21;
                                branchMergedValue36 = intermediateValue167;
                                branchMergedValue37 = intermediateValue166;
                                branchMergedValue47 = bitwiseValue17;
                                branchMergedValue48 = intermediateValue155;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue16 = intermediateValue154;
                                branchMergedValue29 = bitwiseValue13;
                                branchMergedValue30 = bitwiseValue16 * float((scalarValue56 >> 16u) & 255u);
                                branchMergedValue31 = bitwiseValue16 * float((scalarValue56 >> 8u) & 255u);
                                branchMergedValue32 = bitwiseValue16 * float(scalarValue56 & 255u);
                                branchMergedValue33 = intermediateValue186;
                                branchMergedValue34 = intermediateValue185;
                                branchMergedValue35 = bitwiseValue21;
                                branchMergedValue36 = intermediateValue167;
                                branchMergedValue37 = intermediateValue166;
                                branchMergedValue47 = bitwiseValue17;
                                branchMergedValue48 = intermediateValue155;
                            }
                            intermediateValue200 = branchMergedValue29;
                            intermediateValue201 = branchMergedValue16;
                            intermediateValue202 = branchMergedValue48;
                            intermediateValue203 = branchMergedValue47;
                            intermediateValue205 = branchMergedValue37;
                            intermediateValue207 = branchMergedValue36;
                            intermediateValue209 = branchMergedValue35;
                            intermediateValue211 = branchMergedValue34;
                            intermediateValue213 = branchMergedValue33;
                            intermediateValue215 = branchMergedValue32;
                            intermediateValue216 = branchMergedValue31;
                            intermediateValue217 = branchMergedValue30;
                            break;
                        }
                        else
                        {
                            float intermediateValue169;
                            float intermediateValue170;
                            float intermediateValue171;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue72 = productValue145 + productValue116;
                                sumValue73 = productValue146 + productValue117;
                                sumValue74 = productValue147 + productValue118;
                                uint comparisonValue53 = ((((uint(productValue145 >= 16.0f) << 1u) | uint(productValue145 < 0.0f)) | (uint(productValue146 < 0.0f) << 2u)) | (uint(productValue146 >= 16.0f) << 3u)) | (uint(productValue147 < 0.0f) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue53 | (uint(productValue147 >= 16.0f) << 5u)];
                                comparisonValue37 = ((((comparisonValue53 | (uint(productValue147 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue37)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue36).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(productValue147) << 4u) & 240u) | (uint(productValue146) & 15u)) | ((uint(productValue145) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue20 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue57 = loadedBufferValue20.x;
                                if (scalarValue57 == 0u)
                                {
                                    intermediateValue169 = 0.0f;
                                    intermediateValue170 = 0.0f;
                                    intermediateValue171 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue169 = bitwiseValue18 * float(scalarValue57 & 255u);
                                intermediateValue170 = bitwiseValue18 * float((scalarValue57 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue18 * float((scalarValue57 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue204;
                            float intermediateValue206;
                            float intermediateValue208;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue48;
                            bool comparisonValue49;
                            for (;;)
                            {
                                sumValue93 = sumValue43 + productValue116;
                                sumValue94 = sumValue44 + productValue117;
                                sumValue95 = sumValue45 + productValue118;
                                uint comparisonValue60 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue60 | (uint(sumValue45 >= 16.0f) << 5u)];
                                comparisonValue49 = ((((comparisonValue60 | (uint(sumValue45 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue60 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue49)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue204 = 0.0f;
                                        intermediateValue206 = 0.0f;
                                        intermediateValue208 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue26 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue48).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue26 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue23 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue58 = loadedBufferValue23.x;
                                if (scalarValue58 == 0u)
                                {
                                    intermediateValue204 = 0.0f;
                                    intermediateValue206 = 0.0f;
                                    intermediateValue208 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue204 = bitwiseValue20 * float(scalarValue58 & 255u);
                                intermediateValue206 = bitwiseValue20 * float((scalarValue58 >> 8u) & 255u);
                                intermediateValue208 = bitwiseValue20 * float((scalarValue58 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue210;
                            float intermediateValue212;
                            float intermediateValue214;
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            uint comparisonValue58;
                            bool comparisonValue59;
                            for (;;)
                            {
                                sumValue102 = sumValue46 + productValue116;
                                sumValue103 = sumValue47 + productValue117;
                                sumValue104 = sumValue48 + productValue118;
                                uint comparisonValue63 = ((((uint(sumValue46 >= 16.0f) << 1u) | uint(sumValue46 < 0.0f)) | (uint(sumValue47 < 0.0f) << 2u)) | (uint(sumValue47 >= 16.0f) << 3u)) | (uint(sumValue48 < 0.0f) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue63 | (uint(sumValue48 >= 16.0f) << 5u)];
                                comparisonValue59 = ((((comparisonValue63 | (uint(sumValue48 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue63 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue59)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue58 & 31u))) == 0u)
                                    {
                                        intermediateValue210 = 0.0f;
                                        intermediateValue212 = 0.0f;
                                        intermediateValue214 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue58).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue25 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue59 = loadedBufferValue25.x;
                                if (scalarValue59 == 0u)
                                {
                                    intermediateValue210 = 0.0f;
                                    intermediateValue212 = 0.0f;
                                    intermediateValue214 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue210 = bitwiseValue22 * float(scalarValue59 & 255u);
                                intermediateValue212 = bitwiseValue22 * float((scalarValue59 >> 8u) & 255u);
                                intermediateValue214 = bitwiseValue22 * float((scalarValue59 >> 16u) & 255u);
                                break;
                            }
                            float sumValue56 = sumValue49 + productValue116;
                            float sumValue57 = sumValue50 + productValue117;
                            float sumValue75 = sumValue51 + productValue118;
                            uint comparisonValue66 = ((((uint(sumValue49 >= 16.0f) << 1u) | uint(sumValue49 < 0.0f)) | (uint(sumValue50 < 0.0f) << 2u)) | (uint(sumValue50 >= 16.0f) << 3u)) | (uint(sumValue51 < 0.0f) << 4u);
                            uint comparisonValue70 = comparisonValue66 | (uint(sumValue51 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue70 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue66 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue70] & 31u))) == 0u)
                                {
                                    intermediateValue200 = intermediateValue169;
                                    intermediateValue201 = intermediateValue170;
                                    intermediateValue202 = intermediateValue171;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = intermediateValue212;
                                    intermediateValue213 = intermediateValue214;
                                    intermediateValue215 = 0.0f;
                                    intermediateValue216 = 0.0f;
                                    intermediateValue217 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue56 - (floor(sumValue56 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue57 - (floor(sumValue57 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue75 - (floor(sumValue75 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue70]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue34 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue27 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue60 = loadedBufferValue27.x;
                            if (scalarValue60 == 0u)
                            {
                                intermediateValue200 = intermediateValue169;
                                intermediateValue201 = intermediateValue170;
                                intermediateValue202 = intermediateValue171;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = intermediateValue212;
                                intermediateValue213 = intermediateValue214;
                                intermediateValue215 = 0.0f;
                                intermediateValue216 = 0.0f;
                                intermediateValue217 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue60 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue200 = intermediateValue169;
                            intermediateValue201 = intermediateValue170;
                            intermediateValue202 = intermediateValue171;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = intermediateValue206;
                            intermediateValue207 = intermediateValue208;
                            intermediateValue209 = intermediateValue210;
                            intermediateValue211 = intermediateValue212;
                            intermediateValue213 = intermediateValue214;
                            intermediateValue215 = bitwiseValue23 * float(scalarValue60 & 255u);
                            intermediateValue216 = bitwiseValue23 * float((scalarValue60 >> 8u) & 255u);
                            intermediateValue217 = bitwiseValue23 * float((scalarValue60 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue53 = (((intermediateValue207 * productValue149) + (intermediateValue202 * productValue148)) + (intermediateValue213 * productValue150)) + (intermediateValue217 * productValue151);
                    branchMergedValue59 = (((intermediateValue205 * productValue149) + (intermediateValue201 * productValue148)) + (intermediateValue211 * productValue150)) + (intermediateValue216 * productValue151);
                    branchMergedValue60 = (((intermediateValue203 * productValue149) + (intermediateValue200 * productValue148)) + (intermediateValue209 * productValue150)) + (intermediateValue215 * productValue151);
                }
                else
                {
                    float intermediateValue219;
                    float intermediateValue220;
                    float intermediateValue221;
                    float intermediateValue222;
                    float intermediateValue224;
                    float intermediateValue226;
                    float intermediateValue228;
                    float intermediateValue230;
                    float intermediateValue232;
                    float intermediateValue234;
                    float intermediateValue235;
                    float intermediateValue236;
                    float intermediateValue120;
                    float intermediateValue121;
                    float intermediateValue122;
                    uint intermediateValue123;
                    uint intermediateValue124;
                    uint intermediateValue125;
                    float intermediateValue128;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    bool comparisonValue30;
                    uint productValue152;
                    uint productValue153;
                    uint productValue154;
                    uint productValue155;
                    uint productValue156;
                    uint productValue157;
                    for (;;)
                    {
                        intermediateValue120 = floor(sumValue38);
                        intermediateValue121 = floor(sumValue39);
                        intermediateValue122 = floor(sumValue40);
                        float sumValue86 = sumValue38 - intermediateValue120;
                        float sumValue87 = sumValue39 - intermediateValue121;
                        float sumValue88 = sumValue40 - intermediateValue122;
                        uint comparisonValue71 = ((uint(sumValue87 >= sumValue88) << 1u) | uint(sumValue86 >= sumValue87)) | (uint(sumValue86 >= sumValue88) << 2u);
                        intermediateValue123 = uint(intermediateValue120);
                        intermediateValue124 = uint(intermediateValue121);
                        intermediateValue125 = uint(intermediateValue122);
                        float scalarValue61 = min(sumValue86, sumValue87);
                        float scalarValue62 = max(sumValue86, sumValue87);
                        intermediateValue128 = min(scalarValue61, sumValue88);
                        float scalarValue63 = max(scalarValue62, sumValue88);
                        float scalarValue64 = max(min(scalarValue62, sumValue88), scalarValue61);
                        sumValue59 = 1.0f - scalarValue63;
                        sumValue60 = scalarValue63 - scalarValue64;
                        sumValue61 = scalarValue64 - intermediateValue128;
                        sumValue62 = intermediateValue120 + 1.0f;
                        sumValue63 = intermediateValue121 + 1.0f;
                        sumValue64 = intermediateValue122 + 1.0f;
                        comparisonValue30 = (((intermediateValue120 >= 0.0f) && (intermediateValue121 >= 0.0f)) && (intermediateValue122 >= 0.0f)) && (((sumValue62 < 16.0f) && (sumValue63 < 16.0f)) && (sumValue64 < 16.0f));
                        productValue152 = 0u + (comparisonValue71 * 3u);
                        productValue153 = 1u + (comparisonValue71 * 3u);
                        productValue154 = 2u + (comparisonValue71 * 3u);
                        productValue155 = 0u + (comparisonValue71 * 3u);
                        productValue156 = 1u + (comparisonValue71 * 3u);
                        productValue157 = 2u + (comparisonValue71 * 3u);
                        if (comparisonValue30)
                        {
                            uint bitwiseValue25 = intermediateValue125 << 4u;
                            uint sumValue89 = intermediateValue124 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue89 + (intermediateValue123 << 8u);
                            uint4 loadedBufferValue29 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue65 = loadedBufferValue29.x;
                            float bitwiseValue15;
                            float intermediateValue157;
                            float intermediateValue158;
                            if (scalarValue65 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue157 = 0.0f;
                                intermediateValue158 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue65 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue65 & 255u);
                                intermediateValue157 = bitwiseValue27 * float((scalarValue65 >> 8u) & 255u);
                                intermediateValue158 = bitwiseValue27 * float((scalarValue65 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue31 = rdLoad_voxelBuffer(((intermediateValue1[productValue153] + sumValue89) + ((intermediateValue1[productValue152] + intermediateValue123) << 8u)) + ((intermediateValue1[productValue154] + intermediateValue125) << 4u));
                            uint scalarValue66 = loadedBufferValue31.x;
                            float bitwiseValue19;
                            float intermediateValue173;
                            float intermediateValue174;
                            if (scalarValue66 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue66 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue66 & 255u);
                                intermediateValue173 = bitwiseValue28 * float((scalarValue66 >> 8u) & 255u);
                                intermediateValue174 = bitwiseValue28 * float((scalarValue66 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue33 = rdLoad_voxelBuffer(((intermediateValue2[productValue156] + sumValue89) + ((intermediateValue2[productValue155] + intermediateValue123) << 8u)) + ((intermediateValue2[productValue157] + intermediateValue125) << 4u));
                            uint scalarValue67 = loadedBufferValue33.x;
                            float bitwiseValue24;
                            float intermediateValue188;
                            float intermediateValue189;
                            if (scalarValue67 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue188 = 0.0f;
                                intermediateValue189 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue67 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue67 & 255u);
                                intermediateValue188 = bitwiseValue29 * float((scalarValue67 >> 8u) & 255u);
                                intermediateValue189 = bitwiseValue29 * float((scalarValue67 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue38 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue68 = loadedBufferValue38.x;
                            float branchMergedValue17;
                            float branchMergedValue38;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue43 = float(scalarValue124 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue43 * float(scalarValue124 & 255u);
                                intermediateValue236 = bitwiseValue43 * float((scalarValue124 >> 8u) & 255u);
                                intermediateValue237 = bitwiseValue43 * float((scalarValue124 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue59 = rdLoad_voxelBuffer(((uint(sumValue71) + bitwiseValue9) + (uint(sumValue72) << 4u)) + (uint(sumValue70) << 8u));
                            uint scalarValue125 = loadedBufferValue59.x;
                            float branchMergedValue23;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue14 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue55 & 255u);
                                intermediateValue185 = bitwiseValue14 * float((scalarValue55 >> 8u) & 255u);
                                intermediateValue186 = bitwiseValue14 * float((scalarValue55 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue18 = rdLoad_voxelBuffer(((uint(sumValue50) + bitwiseValue9) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u));
                            uint scalarValue56 = loadedBufferValue18.x;
                            float branchMergedValue16;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            if (scalarValue56 == 0u)
                            {
                                branchMergedValue16 = intermediateValue155;
                                branchMergedValue29 = intermediateValue154;
                                branchMergedValue30 = bitwiseValue13;
                                branchMergedValue31 = 0.0f;
                                branchMergedValue32 = 0.0f;
                                branchMergedValue33 = 0.0f;
                                branchMergedValue34 = intermediateValue186;
                                branchMergedValue35 = intermediateValue185;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue167;
                                branchMergedValue47 = intermediateValue166;
                                branchMergedValue48 = bitwiseValue17;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue16 = intermediateValue155;
                                branchMergedValue29 = intermediateValue154;
                                branchMergedValue30 = bitwiseValue13;
                                branchMergedValue31 = bitwiseValue16 * float((scalarValue56 >> 16u) & 255u);
                                branchMergedValue32 = bitwiseValue16 * float((scalarValue56 >> 8u) & 255u);
                                branchMergedValue33 = bitwiseValue16 * float(scalarValue56 & 255u);
                                branchMergedValue34 = intermediateValue186;
                                branchMergedValue35 = intermediateValue185;
                                branchMergedValue36 = bitwiseValue21;
                                branchMergedValue37 = intermediateValue167;
                                branchMergedValue47 = intermediateValue166;
                                branchMergedValue48 = bitwiseValue17;
                            }
                            intermediateValue200 = branchMergedValue30;
                            intermediateValue201 = branchMergedValue29;
                            intermediateValue202 = branchMergedValue16;
                            intermediateValue203 = branchMergedValue48;
                            intermediateValue205 = branchMergedValue47;
                            intermediateValue207 = branchMergedValue37;
                            intermediateValue209 = branchMergedValue36;
                            intermediateValue211 = branchMergedValue35;
                            intermediateValue213 = branchMergedValue34;
                            intermediateValue215 = branchMergedValue33;
                            intermediateValue216 = branchMergedValue32;
                            intermediateValue217 = branchMergedValue31;
                            break;
                        }
                        else
                        {
                            float intermediateValue169;
                            float intermediateValue170;
                            float intermediateValue171;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue72 = productValue145 + productValue116;
                                sumValue73 = productValue146 + productValue117;
                                sumValue74 = productValue147 + productValue118;
                                uint comparisonValue53 = ((((uint(productValue145 >= 16.0f) << 1u) | uint(productValue145 < 0.0f)) | (uint(productValue146 < 0.0f) << 2u)) | (uint(productValue146 >= 16.0f) << 3u)) | (uint(productValue147 < 0.0f) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue53 | (uint(productValue147 >= 16.0f) << 5u)];
                                comparisonValue37 = ((((comparisonValue53 | (uint(productValue147 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                uint loadedBufferValue19;
                                if (comparisonValue37)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
                                        intermediateValue171 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue36).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue19 = ((((uint(productValue147) << 4u) & 240u) | (uint(productValue146) & 15u)) | ((uint(productValue145) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue20 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue57 = loadedBufferValue20.x;
                                if (scalarValue57 == 0u)
                                {
                                    intermediateValue169 = 0.0f;
                                    intermediateValue170 = 0.0f;
                                    intermediateValue171 = 0.0f;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue169 = bitwiseValue18 * float(scalarValue57 & 255u);
                                intermediateValue170 = bitwiseValue18 * float((scalarValue57 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue18 * float((scalarValue57 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue204;
                            float intermediateValue206;
                            float intermediateValue208;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue48;
                            bool comparisonValue49;
                            for (;;)
                            {
                                sumValue93 = sumValue43 + productValue116;
                                sumValue94 = sumValue44 + productValue117;
                                sumValue95 = sumValue45 + productValue118;
                                uint comparisonValue60 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue60 | (uint(sumValue45 >= 16.0f) << 5u)];
                                comparisonValue49 = ((((comparisonValue60 | (uint(sumValue45 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue60 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue49)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue204 = 0.0f;
                                        intermediateValue206 = 0.0f;
                                        intermediateValue208 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue26 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue48).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue26 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue23 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue58 = loadedBufferValue23.x;
                                if (scalarValue58 == 0u)
                                {
                                    intermediateValue204 = 0.0f;
                                    intermediateValue206 = 0.0f;
                                    intermediateValue208 = 0.0f;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue204 = bitwiseValue20 * float(scalarValue58 & 255u);
                                intermediateValue206 = bitwiseValue20 * float((scalarValue58 >> 8u) & 255u);
                                intermediateValue208 = bitwiseValue20 * float((scalarValue58 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue210;
                            float intermediateValue212;
                            float intermediateValue214;
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            uint comparisonValue58;
                            bool comparisonValue59;
                            for (;;)
                            {
                                sumValue102 = sumValue46 + productValue116;
                                sumValue103 = sumValue47 + productValue117;
                                sumValue104 = sumValue48 + productValue118;
                                uint comparisonValue63 = ((((uint(sumValue46 >= 16.0f) << 1u) | uint(sumValue46 < 0.0f)) | (uint(sumValue47 < 0.0f) << 2u)) | (uint(sumValue47 >= 16.0f) << 3u)) | (uint(sumValue48 < 0.0f) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue63 | (uint(sumValue48 >= 16.0f) << 5u)];
                                comparisonValue59 = ((((comparisonValue63 | (uint(sumValue48 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue63 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue59)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue58 & 31u))) == 0u)
                                    {
                                        intermediateValue210 = 0.0f;
                                        intermediateValue212 = 0.0f;
                                        intermediateValue214 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue58).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue25 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue59 = loadedBufferValue25.x;
                                if (scalarValue59 == 0u)
                                {
                                    intermediateValue210 = 0.0f;
                                    intermediateValue212 = 0.0f;
                                    intermediateValue214 = 0.0f;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue210 = bitwiseValue22 * float(scalarValue59 & 255u);
                                intermediateValue212 = bitwiseValue22 * float((scalarValue59 >> 8u) & 255u);
                                intermediateValue214 = bitwiseValue22 * float((scalarValue59 >> 16u) & 255u);
                                break;
                            }
                            float sumValue56 = sumValue49 + productValue116;
                            float sumValue57 = sumValue50 + productValue117;
                            float sumValue75 = sumValue51 + productValue118;
                            uint comparisonValue66 = ((((uint(sumValue49 >= 16.0f) << 1u) | uint(sumValue49 < 0.0f)) | (uint(sumValue50 < 0.0f) << 2u)) | (uint(sumValue50 >= 16.0f) << 3u)) | (uint(sumValue51 < 0.0f) << 4u);
                            uint comparisonValue70 = comparisonValue66 | (uint(sumValue51 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue70 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue66 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue70] & 31u))) == 0u)
                                {
                                    intermediateValue200 = intermediateValue169;
                                    intermediateValue201 = intermediateValue170;
                                    intermediateValue202 = intermediateValue171;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = intermediateValue212;
                                    intermediateValue213 = intermediateValue214;
                                    intermediateValue215 = 0.0f;
                                    intermediateValue216 = 0.0f;
                                    intermediateValue217 = 0.0f;
                                    break;
                                }
                                loadedBufferValue34 = ((((uint(sumValue56 - (floor(sumValue56 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue57 - (floor(sumValue57 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue75 - (floor(sumValue75 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue70]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue34 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue27 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue60 = loadedBufferValue27.x;
                            if (scalarValue60 == 0u)
                            {
                                intermediateValue200 = intermediateValue169;
                                intermediateValue201 = intermediateValue170;
                                intermediateValue202 = intermediateValue171;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = intermediateValue212;
                                intermediateValue213 = intermediateValue214;
                                intermediateValue215 = 0.0f;
                                intermediateValue216 = 0.0f;
                                intermediateValue217 = 0.0f;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue60 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue200 = intermediateValue169;
                            intermediateValue201 = intermediateValue170;
                            intermediateValue202 = intermediateValue171;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = intermediateValue206;
                            intermediateValue207 = intermediateValue208;
                            intermediateValue209 = intermediateValue210;
                            intermediateValue211 = intermediateValue212;
                            intermediateValue213 = intermediateValue214;
                            intermediateValue215 = bitwiseValue23 * float(scalarValue60 & 255u);
                            intermediateValue216 = bitwiseValue23 * float((scalarValue60 >> 8u) & 255u);
                            intermediateValue217 = bitwiseValue23 * float((scalarValue60 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue53 = (((intermediateValue207 * productValue149) + (intermediateValue202 * productValue148)) + (intermediateValue213 * productValue150)) + (intermediateValue217 * productValue151);
                    branchMergedValue59 = (((intermediateValue205 * productValue149) + (intermediateValue201 * productValue148)) + (intermediateValue211 * productValue150)) + (intermediateValue216 * productValue151);
                    branchMergedValue60 = (((intermediateValue203 * productValue149) + (intermediateValue200 * productValue148)) + (intermediateValue209 * productValue150)) + (intermediateValue215 * productValue151);
                }
                else
                {
                    float intermediateValue219;
                    float intermediateValue220;
                    float intermediateValue221;
                    float intermediateValue222;
                    float intermediateValue224;
                    float intermediateValue226;
                    float intermediateValue228;
                    float intermediateValue230;
                    float intermediateValue232;
                    float intermediateValue234;
                    float intermediateValue235;
                    float intermediateValue236;
                    float intermediateValue120;
                    float intermediateValue121;
                    float intermediateValue122;
                    uint intermediateValue123;
                    uint intermediateValue124;
                    uint intermediateValue125;
                    float intermediateValue128;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    bool comparisonValue30;
                    uint productValue152;
                    uint productValue153;
                    uint productValue154;
                    uint productValue155;
                    uint productValue156;
                    uint productValue157;
                    for (;;)
                    {
                        intermediateValue120 = floor(sumValue38);
                        intermediateValue121 = floor(sumValue39);
                        intermediateValue122 = floor(sumValue40);
                        float sumValue86 = sumValue38 - intermediateValue120;
                        float sumValue87 = sumValue39 - intermediateValue121;
                        float sumValue88 = sumValue40 - intermediateValue122;
                        uint comparisonValue71 = ((uint(sumValue87 >= sumValue88) << 1u) | uint(sumValue86 >= sumValue87)) | (uint(sumValue86 >= sumValue88) << 2u);
                        intermediateValue123 = uint(intermediateValue120);
                        intermediateValue124 = uint(intermediateValue121);
                        intermediateValue125 = uint(intermediateValue122);
                        float scalarValue61 = min(sumValue86, sumValue87);
                        float scalarValue62 = max(sumValue86, sumValue87);
                        intermediateValue128 = min(scalarValue61, sumValue88);
                        float scalarValue63 = max(scalarValue62, sumValue88);
                        float scalarValue64 = max(min(scalarValue62, sumValue88), scalarValue61);
                        sumValue59 = 1.0f - scalarValue63;
                        sumValue60 = scalarValue63 - scalarValue64;
                        sumValue61 = scalarValue64 - intermediateValue128;
                        sumValue62 = intermediateValue120 + 1.0f;
                        sumValue63 = intermediateValue121 + 1.0f;
                        sumValue64 = intermediateValue122 + 1.0f;
                        comparisonValue30 = (((intermediateValue120 >= 0.0f) && (intermediateValue121 >= 0.0f)) && (intermediateValue122 >= 0.0f)) && (((sumValue62 < 16.0f) && (sumValue63 < 16.0f)) && (sumValue64 < 16.0f));
                        productValue152 = 0u + (comparisonValue71 * 3u);
                        productValue153 = 1u + (comparisonValue71 * 3u);
                        productValue154 = 2u + (comparisonValue71 * 3u);
                        productValue155 = 0u + (comparisonValue71 * 3u);
                        productValue156 = 1u + (comparisonValue71 * 3u);
                        productValue157 = 2u + (comparisonValue71 * 3u);
                        if (comparisonValue30)
                        {
                            uint bitwiseValue25 = intermediateValue125 << 4u;
                            uint sumValue89 = intermediateValue124 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue89 + (intermediateValue123 << 8u);
                            uint4 loadedBufferValue29 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue65 = loadedBufferValue29.x;
                            float bitwiseValue15;
                            float intermediateValue157;
                            float intermediateValue158;
                            if (scalarValue65 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue157 = 0.0f;
                                intermediateValue158 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue65 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue65 & 255u);
                                intermediateValue157 = bitwiseValue27 * float((scalarValue65 >> 8u) & 255u);
                                intermediateValue158 = bitwiseValue27 * float((scalarValue65 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue31 = rdLoad_voxelBuffer(((intermediateValue1[productValue153] + sumValue89) + ((intermediateValue1[productValue152] + intermediateValue123) << 8u)) + ((intermediateValue1[productValue154] + intermediateValue125) << 4u));
                            uint scalarValue66 = loadedBufferValue31.x;
                            float bitwiseValue19;
                            float intermediateValue173;
                            float intermediateValue174;
                            if (scalarValue66 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue173 = 0.0f;
                                intermediateValue174 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue66 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue66 & 255u);
                                intermediateValue173 = bitwiseValue28 * float((scalarValue66 >> 8u) & 255u);
                                intermediateValue174 = bitwiseValue28 * float((scalarValue66 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue33 = rdLoad_voxelBuffer(((intermediateValue2[productValue156] + sumValue89) + ((intermediateValue2[productValue155] + intermediateValue123) << 8u)) + ((intermediateValue2[productValue157] + intermediateValue125) << 4u));
                            uint scalarValue67 = loadedBufferValue33.x;
                            float bitwiseValue24;
                            float intermediateValue188;
                            float intermediateValue189;
                            if (scalarValue67 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue188 = 0.0f;
                                intermediateValue189 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue67 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue67 & 255u);
                                intermediateValue188 = bitwiseValue29 * float((scalarValue67 >> 8u) & 255u);
                                intermediateValue189 = bitwiseValue29 * float((scalarValue67 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue38 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue68 = loadedBufferValue38.x;
                            float branchMergedValue17;
                            float branchMergedValue38;
#endif
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
                            float branchMergedValue44;
                            float branchMergedValue45;
                            float branchMergedValue46;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float branchMergedValue49;
                            float branchMergedValue50;
                            if (scalarValue68 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float branchMergedValue47;
                            float branchMergedValue63;
                            float branchMergedValue64;
                            if (scalarValue125 == 0u)
#endif
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue17 = intermediateValue173;
                                branchMergedValue38 = bitwiseValue15;
                                branchMergedValue39 = 0.0f;
                                branchMergedValue40 = 0.0f;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = intermediateValue189;
                                branchMergedValue43 = intermediateValue188;
                                branchMergedValue44 = bitwiseValue24;
                                branchMergedValue45 = intermediateValue174;
                                branchMergedValue46 = bitwiseValue19;
                                branchMergedValue49 = intermediateValue158;
                                branchMergedValue50 = intermediateValue157;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue23 = intermediateValue192;
                                branchMergedValue39 = bitwiseValue13;
                                branchMergedValue40 = intermediateValue211;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = 0.0f;
                                branchMergedValue43 = 0.0f;
                                branchMergedValue44 = intermediateValue237;
                                branchMergedValue45 = intermediateValue236;
                                branchMergedValue46 = bitwiseValue21;
                                branchMergedValue47 = intermediateValue210;
                                branchMergedValue63 = bitwiseValue17;
                                branchMergedValue64 = intermediateValue193;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                branchMergedValue17 = intermediateValue174;
                                branchMergedValue38 = intermediateValue158;
                                branchMergedValue39 = intermediateValue157;
                                branchMergedValue40 = 0.0f;
                                branchMergedValue41 = 0.0f;
                                branchMergedValue42 = 0.0f;
                                branchMergedValue43 = intermediateValue189;
                                branchMergedValue44 = intermediateValue188;
                                branchMergedValue45 = bitwiseValue24;
                                branchMergedValue46 = bitwiseValue15;
                                branchMergedValue49 = intermediateValue173;
                                branchMergedValue50 = bitwiseValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                branchMergedValue23 = intermediateValue193;
                                branchMergedValue39 = intermediateValue192;
                                branchMergedValue40 = bitwiseValue13;
                                branchMergedValue41 = bitwiseValue21;
                                branchMergedValue42 = 0.0f;
                                branchMergedValue43 = 0.0f;
                                branchMergedValue44 = 0.0f;
                                branchMergedValue45 = intermediateValue237;
                                branchMergedValue46 = intermediateValue236;
                                branchMergedValue47 = intermediateValue211;
                                branchMergedValue63 = intermediateValue210;
                                branchMergedValue64 = bitwiseValue17;
#endif
                            }
                            else
                            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue30 = float(scalarValue68 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue17 = intermediateValue173;
                                branchMergedValue38 = bitwiseValue15;
                                branchMergedValue39 = bitwiseValue30 * float((scalarValue68 >> 16u) & 255u);
                                branchMergedValue40 = bitwiseValue30 * float((scalarValue68 >> 8u) & 255u);
                                branchMergedValue41 = bitwiseValue30 * float(scalarValue68 & 255u);
                                branchMergedValue42 = intermediateValue189;
                                branchMergedValue43 = intermediateValue188;
                                branchMergedValue44 = bitwiseValue24;
                                branchMergedValue45 = intermediateValue174;
                                branchMergedValue46 = bitwiseValue19;
                                branchMergedValue49 = intermediateValue158;
                                branchMergedValue50 = intermediateValue157;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue44 = float(scalarValue125 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue23 = intermediateValue192;
                                branchMergedValue39 = bitwiseValue13;
                                branchMergedValue40 = intermediateValue211;
                                branchMergedValue41 = bitwiseValue44 * float((scalarValue125 >> 16u) & 255u);
                                branchMergedValue42 = bitwiseValue44 * float((scalarValue125 >> 8u) & 255u);
                                branchMergedValue43 = bitwiseValue44 * float(scalarValue125 & 255u);
                                branchMergedValue44 = intermediateValue237;
                                branchMergedValue45 = intermediateValue236;
                                branchMergedValue46 = bitwiseValue21;
                                branchMergedValue47 = intermediateValue210;
                                branchMergedValue63 = bitwiseValue17;
                                branchMergedValue64 = intermediateValue193;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                                float bitwiseValue30 = float(scalarValue68 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue17 = intermediateValue174;
                                branchMergedValue38 = intermediateValue158;
                                branchMergedValue39 = intermediateValue157;
                                branchMergedValue40 = bitwiseValue30 * float((scalarValue68 >> 16u) & 255u);
                                branchMergedValue41 = bitwiseValue30 * float((scalarValue68 >> 8u) & 255u);
                                branchMergedValue42 = bitwiseValue30 * float(scalarValue68 & 255u);
                                branchMergedValue43 = intermediateValue189;
                                branchMergedValue44 = intermediateValue188;
                                branchMergedValue45 = bitwiseValue24;
                                branchMergedValue46 = bitwiseValue15;
                                branchMergedValue49 = intermediateValue173;
                                branchMergedValue50 = bitwiseValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                                float bitwiseValue44 = float(scalarValue125 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue23 = intermediateValue193;
                                branchMergedValue39 = intermediateValue192;
                                branchMergedValue40 = bitwiseValue13;
                                branchMergedValue41 = bitwiseValue21;
                                branchMergedValue42 = bitwiseValue44 * float((scalarValue125 >> 16u) & 255u);
                                branchMergedValue43 = bitwiseValue44 * float((scalarValue125 >> 8u) & 255u);
                                branchMergedValue44 = bitwiseValue44 * float(scalarValue125 & 255u);
                                branchMergedValue45 = intermediateValue237;
                                branchMergedValue46 = intermediateValue236;
                                branchMergedValue47 = intermediateValue211;
                                branchMergedValue63 = intermediateValue210;
                                branchMergedValue64 = bitwiseValue17;
#endif
                            }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue219 = branchMergedValue38;
                            intermediateValue220 = branchMergedValue50;
                            intermediateValue221 = branchMergedValue49;
                            intermediateValue222 = branchMergedValue46;
                            intermediateValue224 = branchMergedValue17;
                            intermediateValue226 = branchMergedValue45;
                            intermediateValue228 = branchMergedValue44;
                            intermediateValue230 = branchMergedValue43;
                            intermediateValue232 = branchMergedValue42;
                            intermediateValue234 = branchMergedValue41;
                            intermediateValue235 = branchMergedValue40;
                            intermediateValue236 = branchMergedValue39;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue242 = branchMergedValue39;
                            intermediateValue243 = branchMergedValue23;
                            intermediateValue244 = branchMergedValue64;
                            intermediateValue245 = branchMergedValue63;
                            intermediateValue247 = branchMergedValue47;
                            intermediateValue249 = branchMergedValue40;
                            intermediateValue251 = branchMergedValue46;
                            intermediateValue253 = branchMergedValue45;
                            intermediateValue255 = branchMergedValue44;
                            intermediateValue257 = branchMergedValue43;
                            intermediateValue258 = branchMergedValue42;
                            intermediateValue259 = branchMergedValue41;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                            intermediateValue219 = branchMergedValue46;
                            intermediateValue220 = branchMergedValue39;
                            intermediateValue221 = branchMergedValue38;
                            intermediateValue222 = branchMergedValue50;
                            intermediateValue224 = branchMergedValue49;
                            intermediateValue226 = branchMergedValue17;
                            intermediateValue228 = branchMergedValue45;
                            intermediateValue230 = branchMergedValue44;
                            intermediateValue232 = branchMergedValue43;
                            intermediateValue234 = branchMergedValue42;
                            intermediateValue235 = branchMergedValue41;
                            intermediateValue236 = branchMergedValue40;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
                            intermediateValue242 = branchMergedValue40;
                            intermediateValue243 = branchMergedValue39;
                            intermediateValue244 = branchMergedValue23;
                            intermediateValue245 = branchMergedValue64;
                            intermediateValue247 = branchMergedValue63;
                            intermediateValue249 = branchMergedValue47;
                            intermediateValue251 = branchMergedValue41;
                            intermediateValue253 = branchMergedValue46;
                            intermediateValue255 = branchMergedValue45;
                            intermediateValue257 = branchMergedValue44;
                            intermediateValue258 = branchMergedValue43;
                            intermediateValue259 = branchMergedValue42;
#endif
                            break;
                        }
                        else
                        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue176;
                            float intermediateValue177;
                            float intermediateValue178;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            float sumValue80;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue39;
                            bool comparisonValue40;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue213;
                            float intermediateValue214;
                            float intermediateValue215;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue41;
                            bool comparisonValue42;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue76 = float(intermediateValue1[productValue152]) + intermediateValue120;
                                sumValue77 = float(intermediateValue1[productValue153]) + intermediateValue121;
                                sumValue78 = float(intermediateValue1[productValue154]) + intermediateValue122;
                                sumValue79 = float(intermediateValue2[productValue155]) + intermediateValue120;
                                sumValue80 = float(intermediateValue2[productValue156]) + intermediateValue121;
                                sumValue81 = float(intermediateValue2[productValue157]) + intermediateValue122;
                                sumValue82 = intermediateValue120 + productValue116;
                                sumValue83 = intermediateValue121 + productValue117;
                                sumValue84 = intermediateValue122 + productValue118;
                                uint comparisonValue72 = ((((uint(intermediateValue120 >= 16.0f) << 1u) | uint(intermediateValue120 < 0.0f)) | (uint(intermediateValue121 < 0.0f) << 2u)) | (uint(intermediateValue121 >= 16.0f) << 3u)) | (uint(intermediateValue122 < 0.0f) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue72 | (uint(intermediateValue122 >= 16.0f) << 5u)];
                                comparisonValue40 = ((((comparisonValue72 | (uint(intermediateValue122 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue72 & 31u))) == 0u;
                                uint loadedBufferValue22;
                                if (comparisonValue40)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue93 = productValue201 + productValue116;
                                sumValue94 = productValue202 + productValue117;
                                sumValue95 = productValue203 + productValue118;
                                uint comparisonValue103 = ((((uint(productValue201 >= 16.0f) << 1u) | uint(productValue201 < 0.0f)) | (uint(productValue202 < 0.0f) << 2u)) | (uint(productValue202 >= 16.0f) << 3u)) | (uint(productValue203 < 0.0f) << 4u);
                                comparisonValue41 = intermediateValue[comparisonValue103 | (uint(productValue203 >= 16.0f) << 5u)];
                                comparisonValue42 = ((((comparisonValue103 | (uint(productValue203 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue103 & 31u))) == 0u;
                                uint loadedBufferValue21;
                                if (comparisonValue42)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue39 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue41 & 31u))) == 0u)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue176 = 0.0f;
                                        intermediateValue177 = 0.0f;
                                        intermediateValue178 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue213 = 0.0f;
                                        intermediateValue214 = 0.0f;
                                        intermediateValue215 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue22 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue39).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue21 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue41).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue22 = ((((intermediateValue123 << 8u) & 3840u) | (intermediateValue124 & 15u)) | ((intermediateValue125 << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue21 = ((((uint(productValue203) << 4u) & 240u) | (uint(productValue202) & 15u)) | ((uint(productValue201) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue40 = rdLoad_voxelBuffer(loadedBufferValue22);
                                uint scalarValue69 = loadedBufferValue40.x;
                                if (scalarValue69 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue60 = rdLoad_voxelBuffer(loadedBufferValue21);
                                uint scalarValue126 = loadedBufferValue60.x;
                                if (scalarValue126 == 0u)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue176 = 0.0f;
                                    intermediateValue177 = 0.0f;
                                    intermediateValue178 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue213 = 0.0f;
                                    intermediateValue214 = 0.0f;
                                    intermediateValue215 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float bitwiseValue31 = float(scalarValue69 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue176 = bitwiseValue31 * float(scalarValue69 & 255u);
                                intermediateValue177 = bitwiseValue31 * float((scalarValue69 >> 8u) & 255u);
                                intermediateValue178 = bitwiseValue31 * float((scalarValue69 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue45 = float(scalarValue126 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue213 = bitwiseValue45 * float(scalarValue126 & 255u);
                                intermediateValue214 = bitwiseValue45 * float((scalarValue126 >> 8u) & 255u);
                                intermediateValue215 = bitwiseValue45 * float((scalarValue126 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue223;
                            float intermediateValue225;
                            float intermediateValue227;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue51;
                            bool comparisonValue52;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue246;
                            float intermediateValue248;
                            float intermediateValue250;
                            float sumValue109;
                            float sumValue110;
                            float sumValue111;
                            uint comparisonValue54;
                            bool comparisonValue55;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue96 = sumValue76 + productValue116;
                                sumValue97 = sumValue77 + productValue117;
                                sumValue98 = sumValue78 + productValue118;
                                uint comparisonValue73 = ((((uint(sumValue76 >= 16.0f) << 1u) | uint(sumValue76 < 0.0f)) | (uint(sumValue77 < 0.0f) << 2u)) | (uint(sumValue77 >= 16.0f) << 3u)) | (uint(sumValue78 < 0.0f) << 4u);
                                comparisonValue51 = intermediateValue[comparisonValue73 | (uint(sumValue78 >= 16.0f) << 5u)];
                                comparisonValue52 = ((((comparisonValue73 | (uint(sumValue78 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue73 & 31u))) == 0u;
                                uint loadedBufferValue28;
                                if (comparisonValue52)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue109 = sumValue64 + productValue116;
                                sumValue110 = sumValue65 + productValue117;
                                sumValue111 = sumValue66 + productValue118;
                                uint comparisonValue104 = ((((uint(sumValue64 >= 16.0f) << 1u) | uint(sumValue64 < 0.0f)) | (uint(sumValue65 < 0.0f) << 2u)) | (uint(sumValue65 >= 16.0f) << 3u)) | (uint(sumValue66 < 0.0f) << 4u);
                                comparisonValue54 = intermediateValue[comparisonValue104 | (uint(sumValue66 >= 16.0f) << 5u)];
                                comparisonValue55 = ((((comparisonValue104 | (uint(sumValue66 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue104 & 31u))) == 0u;
                                uint loadedBufferValue35;
                                if (comparisonValue55)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue51 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue54 & 31u))) == 0u)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue223 = 0.0f;
                                        intermediateValue225 = 0.0f;
                                        intermediateValue227 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue246 = 0.0f;
                                        intermediateValue248 = 0.0f;
                                        intermediateValue250 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue28 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue51).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue35 = ((((uint(sumValue109 - (floor(sumValue109 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue110 - (floor(sumValue110 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue111 - (floor(sumValue111 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue54).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue28 = ((((uint(sumValue76) << 8u) & 3840u) | (uint(sumValue77) & 15u)) | ((uint(sumValue78) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue35 = ((((uint(sumValue66) << 4u) & 240u) | (uint(sumValue65) & 15u)) | ((uint(sumValue64) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue42 = rdLoad_voxelBuffer(loadedBufferValue28);
                                uint scalarValue70 = loadedBufferValue42.x;
                                if (scalarValue70 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue61 = rdLoad_voxelBuffer(loadedBufferValue35);
                                uint scalarValue127 = loadedBufferValue61.x;
                                if (scalarValue127 == 0u)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue223 = 0.0f;
                                    intermediateValue225 = 0.0f;
                                    intermediateValue227 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue246 = 0.0f;
                                    intermediateValue248 = 0.0f;
                                    intermediateValue250 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float bitwiseValue32 = float(scalarValue70 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue223 = bitwiseValue32 * float(scalarValue70 & 255u);
                                intermediateValue225 = bitwiseValue32 * float((scalarValue70 >> 8u) & 255u);
                                intermediateValue227 = bitwiseValue32 * float((scalarValue70 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue46 = float(scalarValue127 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue246 = bitwiseValue46 * float(scalarValue127 & 255u);
                                intermediateValue248 = bitwiseValue46 * float((scalarValue127 >> 8u) & 255u);
                                intermediateValue250 = bitwiseValue46 * float((scalarValue127 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float intermediateValue229;
                            float intermediateValue231;
                            float intermediateValue233;
                            float sumValue105;
                            float sumValue106;
                            float sumValue107;
                            uint comparisonValue61;
                            bool comparisonValue62;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float intermediateValue252;
                            float intermediateValue254;
                            float intermediateValue256;
                            float sumValue120;
                            float sumValue121;
                            float sumValue122;
                            uint comparisonValue64;
                            bool comparisonValue65;
#endif
                            for (;;)
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                sumValue105 = sumValue79 + productValue116;
                                sumValue106 = sumValue80 + productValue117;
                                sumValue107 = sumValue81 + productValue118;
                                uint comparisonValue74 = ((((uint(sumValue79 >= 16.0f) << 1u) | uint(sumValue79 < 0.0f)) | (uint(sumValue80 < 0.0f) << 2u)) | (uint(sumValue80 >= 16.0f) << 3u)) | (uint(sumValue81 < 0.0f) << 4u);
                                comparisonValue61 = intermediateValue[comparisonValue74 | (uint(sumValue81 >= 16.0f) << 5u)];
                                comparisonValue62 = ((((comparisonValue74 | (uint(sumValue81 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue74 & 31u))) == 0u;
                                uint loadedBufferValue32;
                                if (comparisonValue62)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                sumValue120 = sumValue67 + productValue116;
                                sumValue121 = sumValue68 + productValue117;
                                sumValue122 = sumValue69 + productValue118;
                                uint comparisonValue105 = ((((uint(sumValue67 >= 16.0f) << 1u) | uint(sumValue67 < 0.0f)) | (uint(sumValue68 < 0.0f) << 2u)) | (uint(sumValue68 >= 16.0f) << 3u)) | (uint(sumValue69 < 0.0f) << 4u);
                                comparisonValue64 = intermediateValue[comparisonValue105 | (uint(sumValue69 >= 16.0f) << 5u)];
                                comparisonValue65 = ((((comparisonValue105 | (uint(sumValue69 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue105 & 31u))) == 0u;
                                uint loadedBufferValue39;
                                if (comparisonValue65)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue61 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue64 & 31u))) == 0u)
#endif
                                    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                        intermediateValue229 = 0.0f;
                                        intermediateValue231 = 0.0f;
                                        intermediateValue233 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                        intermediateValue252 = 0.0f;
                                        intermediateValue254 = 0.0f;
                                        intermediateValue256 = 0.0f;
#endif
                                        break;
                                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue32 = ((((uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue61).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue39 = ((((uint(sumValue120 - (floor(sumValue120 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue121 - (floor(sumValue121 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue122 - (floor(sumValue122 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue64).x >> 2u);
#endif
                                }
                                else
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    loadedBufferValue32 = ((((uint(sumValue79) << 8u) & 3840u) | (uint(sumValue80) & 15u)) | ((uint(sumValue81) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    loadedBufferValue39 = ((((uint(sumValue69) << 4u) & 240u) | (uint(sumValue68) & 15u)) | ((uint(sumValue67) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                uint4 loadedBufferValue44 = rdLoad_voxelBuffer(loadedBufferValue32);
                                uint scalarValue71 = loadedBufferValue44.x;
                                if (scalarValue71 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                uint4 loadedBufferValue62 = rdLoad_voxelBuffer(loadedBufferValue39);
                                uint scalarValue128 = loadedBufferValue62.x;
                                if (scalarValue128 == 0u)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue229 = 0.0f;
                                    intermediateValue231 = 0.0f;
                                    intermediateValue233 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue252 = 0.0f;
                                    intermediateValue254 = 0.0f;
                                    intermediateValue256 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                float bitwiseValue33 = float(scalarValue71 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue229 = bitwiseValue33 * float(scalarValue71 & 255u);
                                intermediateValue231 = bitwiseValue33 * float((scalarValue71 >> 8u) & 255u);
                                intermediateValue233 = bitwiseValue33 * float((scalarValue71 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                float bitwiseValue47 = float(scalarValue128 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue252 = bitwiseValue47 * float(scalarValue128 & 255u);
                                intermediateValue254 = bitwiseValue47 * float((scalarValue128 >> 8u) & 255u);
                                intermediateValue256 = bitwiseValue47 * float((scalarValue128 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float sumValue90 = sumValue62 + productValue116;
                            float sumValue92 = sumValue63 + productValue117;
                            float sumValue108 = sumValue64 + productValue118;
                            uint comparisonValue75 = ((((uint(sumValue62 >= 16.0f) << 1u) | uint(sumValue62 < 0.0f)) | (uint(sumValue63 < 0.0f) << 2u)) | (uint(sumValue63 >= 16.0f) << 3u)) | (uint(sumValue64 < 0.0f) << 4u);
                            uint comparisonValue76 = comparisonValue75 | (uint(sumValue64 >= 16.0f) << 5u);
                            uint loadedBufferValue36;
                            if ((((comparisonValue76 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue75 & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float sumValue170 = sumValue70 + productValue116;
                            float sumValue171 = sumValue71 + productValue117;
                            float sumValue172 = sumValue72 + productValue118;
                            uint comparisonValue106 = ((((uint(sumValue70 >= 16.0f) << 1u) | uint(sumValue70 < 0.0f)) | (uint(sumValue71 < 0.0f) << 2u)) | (uint(sumValue71 >= 16.0f) << 3u)) | (uint(sumValue72 < 0.0f) << 4u);
                            uint comparisonValue107 = comparisonValue106 | (uint(sumValue72 >= 16.0f) << 5u);
                            uint loadedBufferValue43;
                            if ((((comparisonValue107 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue106 & 31u))) == 0u)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue76] & 31u))) == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue107] & 31u))) == 0u)
#endif
                                {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                    intermediateValue219 = intermediateValue176;
                                    intermediateValue220 = intermediateValue177;
                                    intermediateValue221 = intermediateValue178;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = intermediateValue225;
                                    intermediateValue226 = intermediateValue227;
                                    intermediateValue228 = intermediateValue229;
                                    intermediateValue230 = intermediateValue231;
                                    intermediateValue232 = intermediateValue233;
                                    intermediateValue234 = 0.0f;
                                    intermediateValue235 = 0.0f;
                                    intermediateValue236 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                    intermediateValue242 = intermediateValue213;
                                    intermediateValue243 = intermediateValue214;
                                    intermediateValue244 = intermediateValue215;
                                    intermediateValue245 = intermediateValue246;
                                    intermediateValue247 = intermediateValue248;
                                    intermediateValue249 = intermediateValue250;
                                    intermediateValue251 = intermediateValue252;
                                    intermediateValue253 = intermediateValue254;
                                    intermediateValue255 = intermediateValue256;
                                    intermediateValue257 = 0.0f;
                                    intermediateValue258 = 0.0f;
                                    intermediateValue259 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue36 = ((((uint(sumValue90 - (floor(sumValue90 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue92 - (floor(sumValue92 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue108 - (floor(sumValue108 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue76]).x >> 2u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                loadedBufferValue43 = ((((uint(sumValue170 - (floor(sumValue170 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue171 - (floor(sumValue171 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue172 - (floor(sumValue172 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue107]).x >> 2u);
#endif
                            }
                            else
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                loadedBufferValue36 = ((((uint(sumValue62) << 8u) & 3840u) | (uint(sumValue63) & 15u)) | ((uint(sumValue64) << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                loadedBufferValue43 = ((((uint(sumValue72) << 4u) & 240u) | (uint(sumValue71) & 15u)) | ((uint(sumValue70) << 8u) & 3840u)) + bitwiseValue9;
#endif
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            uint4 loadedBufferValue46 = rdLoad_voxelBuffer(loadedBufferValue36);
                            uint scalarValue72 = loadedBufferValue46.x;
                            if (scalarValue72 == 0u)
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            uint4 loadedBufferValue63 = rdLoad_voxelBuffer(loadedBufferValue43);
                            uint scalarValue129 = loadedBufferValue63.x;
                            if (scalarValue129 == 0u)
#endif
                            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                                intermediateValue219 = intermediateValue176;
                                intermediateValue220 = intermediateValue177;
                                intermediateValue221 = intermediateValue178;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = intermediateValue225;
                                intermediateValue226 = intermediateValue227;
                                intermediateValue228 = intermediateValue229;
                                intermediateValue230 = intermediateValue231;
                                intermediateValue232 = intermediateValue233;
                                intermediateValue234 = 0.0f;
                                intermediateValue235 = 0.0f;
                                intermediateValue236 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                                intermediateValue242 = intermediateValue213;
                                intermediateValue243 = intermediateValue214;
                                intermediateValue244 = intermediateValue215;
                                intermediateValue245 = intermediateValue246;
                                intermediateValue247 = intermediateValue248;
                                intermediateValue249 = intermediateValue250;
                                intermediateValue251 = intermediateValue252;
                                intermediateValue253 = intermediateValue254;
                                intermediateValue255 = intermediateValue256;
                                intermediateValue257 = 0.0f;
                                intermediateValue258 = 0.0f;
                                intermediateValue259 = 0.0f;
#endif
                                break;
                            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                            float bitwiseValue34 = float(scalarValue72 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue219 = intermediateValue176;
                            intermediateValue220 = intermediateValue177;
                            intermediateValue221 = intermediateValue178;
                            intermediateValue222 = intermediateValue223;
                            intermediateValue224 = intermediateValue225;
                            intermediateValue226 = intermediateValue227;
                            intermediateValue228 = intermediateValue229;
                            intermediateValue230 = intermediateValue231;
                            intermediateValue232 = intermediateValue233;
                            intermediateValue234 = bitwiseValue34 * float(scalarValue72 & 255u);
                            intermediateValue235 = bitwiseValue34 * float((scalarValue72 >> 8u) & 255u);
                            intermediateValue236 = bitwiseValue34 * float((scalarValue72 >> 16u) & 255u);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                            float bitwiseValue48 = float(scalarValue129 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue242 = intermediateValue213;
                            intermediateValue243 = intermediateValue214;
                            intermediateValue244 = intermediateValue215;
                            intermediateValue245 = intermediateValue246;
                            intermediateValue247 = intermediateValue248;
                            intermediateValue249 = intermediateValue250;
                            intermediateValue251 = intermediateValue252;
                            intermediateValue253 = intermediateValue254;
                            intermediateValue255 = intermediateValue256;
                            intermediateValue257 = bitwiseValue48 * float(scalarValue129 & 255u);
                            intermediateValue258 = bitwiseValue48 * float((scalarValue129 >> 8u) & 255u);
                            intermediateValue259 = bitwiseValue48 * float((scalarValue129 >> 16u) & 255u);
#endif
                            break;
                        }
                    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                    branchMergedValue53 = (((intermediateValue226 * sumValue60) + (intermediateValue221 * sumValue59)) + (intermediateValue232 * sumValue61)) + (intermediateValue236 * intermediateValue128);
                    branchMergedValue59 = (((intermediateValue224 * sumValue60) + (intermediateValue220 * sumValue59)) + (intermediateValue230 * sumValue61)) + (intermediateValue235 * intermediateValue128);
                    branchMergedValue60 = (((intermediateValue222 * sumValue60) + (intermediateValue219 * sumValue59)) + (intermediateValue228 * sumValue61)) + (intermediateValue234 * intermediateValue128);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue70 = (((intermediateValue249 * productValue205) + (intermediateValue244 * productValue204)) + (intermediateValue255 * productValue206)) + (intermediateValue259 * productValue207);
                    branchMergedValue78 = (((intermediateValue247 * productValue205) + (intermediateValue243 * productValue204)) + (intermediateValue253 * productValue206)) + (intermediateValue258 * productValue207);
                    branchMergedValue79 = (((intermediateValue245 * productValue205) + (intermediateValue242 * productValue204)) + (intermediateValue251 * productValue206)) + (intermediateValue257 * productValue207);
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue10 = branchMergedValue53;
                branchMergedValue20 = branchMergedValue59;
                branchMergedValue21 = branchMergedValue60;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                else
                {
                    float intermediateValue261;
                    float intermediateValue262;
                    float intermediateValue263;
                    float intermediateValue264;
                    float intermediateValue266;
                    float intermediateValue268;
                    float intermediateValue270;
                    float intermediateValue272;
                    float intermediateValue274;
                    float intermediateValue276;
                    float intermediateValue277;
                    float intermediateValue278;
                    float intermediateValue161;
                    float intermediateValue162;
                    float intermediateValue163;
                    uint intermediateValue164;
                    uint intermediateValue165;
                    uint intermediateValue166;
                    float intermediateValue169;
                    float sumValue80;
                    float sumValue81;
                    float sumValue82;
                    float sumValue83;
                    float sumValue84;
                    float sumValue85;
                    bool comparisonValue37;
                    uint productValue208;
                    uint productValue209;
                    uint productValue210;
                    uint productValue211;
                    uint productValue212;
                    uint productValue213;
                    for (;;)
                    {
                        intermediateValue161 = floor(sumValue38);
                        intermediateValue162 = floor(sumValue39);
                        intermediateValue163 = floor(sumValue40);
                        float sumValue173 = sumValue38 - intermediateValue161;
                        float sumValue174 = sumValue39 - intermediateValue162;
                        float sumValue175 = sumValue40 - intermediateValue163;
                        uint comparisonValue108 = ((uint(sumValue174 >= sumValue175) << 1u) | uint(sumValue173 >= sumValue174)) | (uint(sumValue173 >= sumValue175) << 2u);
                        intermediateValue164 = uint(intermediateValue161);
                        intermediateValue165 = uint(intermediateValue162);
                        intermediateValue166 = uint(intermediateValue163);
                        float scalarValue130 = min(sumValue173, sumValue174);
                        float scalarValue131 = max(sumValue173, sumValue174);
                        intermediateValue169 = min(scalarValue130, sumValue175);
                        float scalarValue132 = max(scalarValue131, sumValue175);
                        float scalarValue133 = max(min(scalarValue131, sumValue175), scalarValue130);
                        sumValue80 = 1.0f - scalarValue132;
                        sumValue81 = scalarValue132 - scalarValue133;
                        sumValue82 = scalarValue133 - intermediateValue169;
                        sumValue83 = intermediateValue161 + 1.0f;
                        sumValue84 = intermediateValue162 + 1.0f;
                        sumValue85 = intermediateValue163 + 1.0f;
                        comparisonValue37 = (((intermediateValue161 >= 0.0f) && (intermediateValue162 >= 0.0f)) && (intermediateValue163 >= 0.0f)) && (((sumValue83 < 16.0f) && (sumValue84 < 16.0f)) && (sumValue85 < 16.0f));
                        productValue208 = 0u + (comparisonValue108 * 3u);
                        productValue209 = 1u + (comparisonValue108 * 3u);
                        productValue210 = 2u + (comparisonValue108 * 3u);
                        productValue211 = 0u + (comparisonValue108 * 3u);
                        productValue212 = 1u + (comparisonValue108 * 3u);
                        productValue213 = 2u + (comparisonValue108 * 3u);
                        if (comparisonValue37)
                        {
                            uint bitwiseValue49 = intermediateValue166 << 4u;
                            uint sumValue176 = intermediateValue165 + bitwiseValue9;
                            uint bitwiseValue50 = sumValue176 + (intermediateValue164 << 8u);
                            uint4 loadedBufferValue64 = rdLoad_voxelBuffer(bitwiseValue50 + bitwiseValue49);
                            uint scalarValue134 = loadedBufferValue64.x;
                            float bitwiseValue15;
                            float intermediateValue195;
                            float intermediateValue196;
                            if (scalarValue134 == 0u)
                            {
                                bitwiseValue15 = 0.0f;
                                intermediateValue195 = 0.0f;
                                intermediateValue196 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue51 = float(scalarValue134 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue51 * float(scalarValue134 & 255u);
                                intermediateValue195 = bitwiseValue51 * float((scalarValue134 >> 8u) & 255u);
                                intermediateValue196 = bitwiseValue51 * float((scalarValue134 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue65 = rdLoad_voxelBuffer(((intermediateValue1[productValue209] + sumValue176) + ((intermediateValue1[productValue208] + intermediateValue164) << 8u)) + ((intermediateValue1[productValue210] + intermediateValue166) << 4u));
                            uint scalarValue135 = loadedBufferValue65.x;
                            float bitwiseValue19;
                            float intermediateValue217;
                            float intermediateValue218;
                            if (scalarValue135 == 0u)
                            {
                                bitwiseValue19 = 0.0f;
                                intermediateValue217 = 0.0f;
                                intermediateValue218 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue52 = float(scalarValue135 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue52 * float(scalarValue135 & 255u);
                                intermediateValue217 = bitwiseValue52 * float((scalarValue135 >> 8u) & 255u);
                                intermediateValue218 = bitwiseValue52 * float((scalarValue135 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue66 = rdLoad_voxelBuffer(((intermediateValue2[productValue212] + sumValue176) + ((intermediateValue2[productValue211] + intermediateValue164) << 8u)) + ((intermediateValue2[productValue213] + intermediateValue166) << 4u));
                            uint scalarValue136 = loadedBufferValue66.x;
                            float bitwiseValue24;
                            float intermediateValue239;
                            float intermediateValue240;
                            if (scalarValue136 == 0u)
                            {
                                bitwiseValue24 = 0.0f;
                                intermediateValue239 = 0.0f;
                                intermediateValue240 = 0.0f;
                            }
                            else
                            {
                                float bitwiseValue53 = float(scalarValue136 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue53 * float(scalarValue136 & 255u);
                                intermediateValue239 = bitwiseValue53 * float((scalarValue136 >> 8u) & 255u);
                                intermediateValue240 = bitwiseValue53 * float((scalarValue136 >> 16u) & 255u);
                            }
                            uint4 loadedBufferValue67 = rdLoad_voxelBuffer((bitwiseValue50 + 273u) + bitwiseValue49);
                            uint scalarValue137 = loadedBufferValue67.x;
                            float branchMergedValue24;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue50;
                            float branchMergedValue51;
                            float branchMergedValue52;
                            float branchMergedValue53;
                            float branchMergedValue54;
                            float branchMergedValue55;
                            float branchMergedValue56;
                            float branchMergedValue65;
                            float branchMergedValue66;
                            if (scalarValue137 == 0u)
                            {
                                branchMergedValue24 = intermediateValue240;
                                branchMergedValue48 = 0.0f;
                                branchMergedValue49 = 0.0f;
                                branchMergedValue50 = 0.0f;
                                branchMergedValue51 = intermediateValue239;
                                branchMergedValue52 = bitwiseValue24;
                                branchMergedValue53 = intermediateValue218;
                                branchMergedValue54 = intermediateValue217;
                                branchMergedValue55 = bitwiseValue19;
                                branchMergedValue56 = intermediateValue196;
                                branchMergedValue65 = intermediateValue195;
                                branchMergedValue66 = bitwiseValue15;
                            }
                            else
                            {
                                float bitwiseValue54 = float(scalarValue137 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue24 = intermediateValue240;
                                branchMergedValue48 = bitwiseValue54 * float((scalarValue137 >> 16u) & 255u);
                                branchMergedValue49 = bitwiseValue54 * float((scalarValue137 >> 8u) & 255u);
                                branchMergedValue50 = bitwiseValue54 * float(scalarValue137 & 255u);
                                branchMergedValue51 = intermediateValue239;
                                branchMergedValue52 = bitwiseValue24;
                                branchMergedValue53 = intermediateValue218;
                                branchMergedValue54 = intermediateValue217;
                                branchMergedValue55 = bitwiseValue19;
                                branchMergedValue56 = intermediateValue196;
                                branchMergedValue65 = intermediateValue195;
                                branchMergedValue66 = bitwiseValue15;
                            }
                            intermediateValue261 = branchMergedValue66;
                            intermediateValue262 = branchMergedValue65;
                            intermediateValue263 = branchMergedValue56;
                            intermediateValue264 = branchMergedValue55;
                            intermediateValue266 = branchMergedValue54;
                            intermediateValue268 = branchMergedValue53;
                            intermediateValue270 = branchMergedValue52;
                            intermediateValue272 = branchMergedValue51;
                            intermediateValue274 = branchMergedValue24;
                            intermediateValue276 = branchMergedValue50;
                            intermediateValue277 = branchMergedValue49;
                            intermediateValue278 = branchMergedValue48;
                            break;
                        }
                        else
                        {
                            float intermediateValue220;
                            float intermediateValue221;
                            float intermediateValue222;
                            float sumValue97;
                            float sumValue98;
                            float sumValue99;
                            float sumValue100;
                            float sumValue101;
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            float sumValue105;
                            uint comparisonValue44;
                            bool comparisonValue45;
                            for (;;)
                            {
                                sumValue97 = float(intermediateValue1[productValue208]) + intermediateValue161;
                                sumValue98 = float(intermediateValue1[productValue209]) + intermediateValue162;
                                sumValue99 = float(intermediateValue1[productValue210]) + intermediateValue163;
                                sumValue100 = float(intermediateValue2[productValue211]) + intermediateValue161;
                                sumValue101 = float(intermediateValue2[productValue212]) + intermediateValue162;
                                sumValue102 = float(intermediateValue2[productValue213]) + intermediateValue163;
                                sumValue103 = intermediateValue161 + productValue116;
                                sumValue104 = intermediateValue162 + productValue117;
                                sumValue105 = intermediateValue163 + productValue118;
                                uint comparisonValue109 = ((((uint(intermediateValue161 >= 16.0f) << 1u) | uint(intermediateValue161 < 0.0f)) | (uint(intermediateValue162 < 0.0f) << 2u)) | (uint(intermediateValue162 >= 16.0f) << 3u)) | (uint(intermediateValue163 < 0.0f) << 4u);
                                comparisonValue44 = intermediateValue[comparisonValue109 | (uint(intermediateValue163 >= 16.0f) << 5u)];
                                comparisonValue45 = ((((comparisonValue109 | (uint(intermediateValue163 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue109 & 31u))) == 0u;
                                uint loadedBufferValue24;
                                if (comparisonValue45)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue44 & 31u))) == 0u)
                                    {
                                        intermediateValue220 = 0.0f;
                                        intermediateValue221 = 0.0f;
                                        intermediateValue222 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue24 = ((((uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue44).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue24 = ((((intermediateValue164 << 8u) & 3840u) | (intermediateValue165 & 15u)) | ((intermediateValue166 << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue68 = rdLoad_voxelBuffer(loadedBufferValue24);
                                uint scalarValue138 = loadedBufferValue68.x;
                                if (scalarValue138 == 0u)
                                {
                                    intermediateValue220 = 0.0f;
                                    intermediateValue221 = 0.0f;
                                    intermediateValue222 = 0.0f;
                                    break;
                                }
                                float bitwiseValue55 = float(scalarValue138 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue220 = bitwiseValue55 * float(scalarValue138 & 255u);
                                intermediateValue221 = bitwiseValue55 * float((scalarValue138 >> 8u) & 255u);
                                intermediateValue222 = bitwiseValue55 * float((scalarValue138 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue265;
                            float intermediateValue267;
                            float intermediateValue269;
                            float sumValue112;
                            float sumValue113;
                            float sumValue114;
                            uint comparisonValue57;
                            bool comparisonValue58;
                            for (;;)
                            {
                                sumValue112 = sumValue97 + productValue116;
                                sumValue113 = sumValue98 + productValue117;
                                sumValue114 = sumValue99 + productValue118;
                                uint comparisonValue110 = ((((uint(sumValue97 >= 16.0f) << 1u) | uint(sumValue97 < 0.0f)) | (uint(sumValue98 < 0.0f) << 2u)) | (uint(sumValue98 >= 16.0f) << 3u)) | (uint(sumValue99 < 0.0f) << 4u);
                                comparisonValue57 = intermediateValue[comparisonValue110 | (uint(sumValue99 >= 16.0f) << 5u)];
                                comparisonValue58 = ((((comparisonValue110 | (uint(sumValue99 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue110 & 31u))) == 0u;
                                uint loadedBufferValue37;
                                if (comparisonValue58)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue57 & 31u))) == 0u)
                                    {
                                        intermediateValue265 = 0.0f;
                                        intermediateValue267 = 0.0f;
                                        intermediateValue269 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue37 = ((((uint(sumValue112 - (floor(sumValue112 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue113 - (floor(sumValue113 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue114 - (floor(sumValue114 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue57).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue37 = ((((uint(sumValue97) << 8u) & 3840u) | (uint(sumValue98) & 15u)) | ((uint(sumValue99) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue69 = rdLoad_voxelBuffer(loadedBufferValue37);
                                uint scalarValue139 = loadedBufferValue69.x;
                                if (scalarValue139 == 0u)
                                {
                                    intermediateValue265 = 0.0f;
                                    intermediateValue267 = 0.0f;
                                    intermediateValue269 = 0.0f;
                                    break;
                                }
                                float bitwiseValue56 = float(scalarValue139 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue265 = bitwiseValue56 * float(scalarValue139 & 255u);
                                intermediateValue267 = bitwiseValue56 * float((scalarValue139 >> 8u) & 255u);
                                intermediateValue269 = bitwiseValue56 * float((scalarValue139 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue271;
                            float intermediateValue273;
                            float intermediateValue275;
                            float sumValue123;
                            float sumValue124;
                            float sumValue125;
                            uint comparisonValue67;
                            bool comparisonValue68;
                            for (;;)
                            {
                                sumValue123 = sumValue100 + productValue116;
                                sumValue124 = sumValue101 + productValue117;
                                sumValue125 = sumValue102 + productValue118;
                                uint comparisonValue111 = ((((uint(sumValue100 >= 16.0f) << 1u) | uint(sumValue100 < 0.0f)) | (uint(sumValue101 < 0.0f) << 2u)) | (uint(sumValue101 >= 16.0f) << 3u)) | (uint(sumValue102 < 0.0f) << 4u);
                                comparisonValue67 = intermediateValue[comparisonValue111 | (uint(sumValue102 >= 16.0f) << 5u)];
                                comparisonValue68 = ((((comparisonValue111 | (uint(sumValue102 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue111 & 31u))) == 0u;
                                uint loadedBufferValue41;
                                if (comparisonValue68)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue67 & 31u))) == 0u)
                                    {
                                        intermediateValue271 = 0.0f;
                                        intermediateValue273 = 0.0f;
                                        intermediateValue275 = 0.0f;
                                        break;
                                    }
                                    loadedBufferValue41 = ((((uint(sumValue123 - (floor(sumValue123 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue124 - (floor(sumValue124 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue125 - (floor(sumValue125 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue67).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue41 = ((((uint(sumValue100) << 8u) & 3840u) | (uint(sumValue101) & 15u)) | ((uint(sumValue102) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue70 = rdLoad_voxelBuffer(loadedBufferValue41);
                                uint scalarValue140 = loadedBufferValue70.x;
                                if (scalarValue140 == 0u)
                                {
                                    intermediateValue271 = 0.0f;
                                    intermediateValue273 = 0.0f;
                                    intermediateValue275 = 0.0f;
                                    break;
                                }
                                float bitwiseValue57 = float(scalarValue140 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                intermediateValue271 = bitwiseValue57 * float(scalarValue140 & 255u);
                                intermediateValue273 = bitwiseValue57 * float((scalarValue140 >> 8u) & 255u);
                                intermediateValue275 = bitwiseValue57 * float((scalarValue140 >> 16u) & 255u);
                                break;
                            }
                            float sumValue177 = sumValue83 + productValue116;
                            float sumValue178 = sumValue84 + productValue117;
                            float sumValue179 = sumValue85 + productValue118;
                            uint comparisonValue112 = ((((uint(sumValue83 >= 16.0f) << 1u) | uint(sumValue83 < 0.0f)) | (uint(sumValue84 < 0.0f) << 2u)) | (uint(sumValue84 >= 16.0f) << 3u)) | (uint(sumValue85 < 0.0f) << 4u);
                            uint comparisonValue113 = comparisonValue112 | (uint(sumValue85 >= 16.0f) << 5u);
                            uint loadedBufferValue45;
                            if ((((comparisonValue113 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue112 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue113] & 31u))) == 0u)
                                {
                                    intermediateValue261 = intermediateValue220;
                                    intermediateValue262 = intermediateValue221;
                                    intermediateValue263 = intermediateValue222;
                                    intermediateValue264 = intermediateValue265;
                                    intermediateValue266 = intermediateValue267;
                                    intermediateValue268 = intermediateValue269;
                                    intermediateValue270 = intermediateValue271;
                                    intermediateValue272 = intermediateValue273;
                                    intermediateValue274 = intermediateValue275;
                                    intermediateValue276 = 0.0f;
                                    intermediateValue277 = 0.0f;
                                    intermediateValue278 = 0.0f;
                                    break;
                                }
                                loadedBufferValue45 = ((((uint(sumValue177 - (floor(sumValue177 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue178 - (floor(sumValue178 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue179 - (floor(sumValue179 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue113]).x >> 2u);
                            }
                            else
                            {
                                loadedBufferValue45 = ((((uint(sumValue83) << 8u) & 3840u) | (uint(sumValue84) & 15u)) | ((uint(sumValue85) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue71 = rdLoad_voxelBuffer(loadedBufferValue45);
                            uint scalarValue141 = loadedBufferValue71.x;
                            if (scalarValue141 == 0u)
                            {
                                intermediateValue261 = intermediateValue220;
                                intermediateValue262 = intermediateValue221;
                                intermediateValue263 = intermediateValue222;
                                intermediateValue264 = intermediateValue265;
                                intermediateValue266 = intermediateValue267;
                                intermediateValue268 = intermediateValue269;
                                intermediateValue270 = intermediateValue271;
                                intermediateValue272 = intermediateValue273;
                                intermediateValue274 = intermediateValue275;
                                intermediateValue276 = 0.0f;
                                intermediateValue277 = 0.0f;
                                intermediateValue278 = 0.0f;
                                break;
                            }
                            float bitwiseValue58 = float(scalarValue141 >> 24u) * 9.2272217443678528070449829101562e-05f;
                            intermediateValue261 = intermediateValue220;
                            intermediateValue262 = intermediateValue221;
                            intermediateValue263 = intermediateValue222;
                            intermediateValue264 = intermediateValue265;
                            intermediateValue266 = intermediateValue267;
                            intermediateValue268 = intermediateValue269;
                            intermediateValue270 = intermediateValue271;
                            intermediateValue272 = intermediateValue273;
                            intermediateValue274 = intermediateValue275;
                            intermediateValue276 = bitwiseValue58 * float(scalarValue141 & 255u);
                            intermediateValue277 = bitwiseValue58 * float((scalarValue141 >> 8u) & 255u);
                            intermediateValue278 = bitwiseValue58 * float((scalarValue141 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue70 = (((intermediateValue268 * sumValue81) + (intermediateValue263 * sumValue80)) + (intermediateValue274 * sumValue82)) + (intermediateValue278 * intermediateValue169);
                    branchMergedValue78 = (((intermediateValue266 * sumValue81) + (intermediateValue262 * sumValue80)) + (intermediateValue272 * sumValue82)) + (intermediateValue277 * intermediateValue169);
                    branchMergedValue79 = (((intermediateValue264 * sumValue81) + (intermediateValue261 * sumValue80)) + (intermediateValue270 * sumValue82)) + (intermediateValue276 * intermediateValue169);
                }
                branchMergedValue17 = branchMergedValue70;
                branchMergedValue32 = branchMergedValue78;
                branchMergedValue33 = branchMergedValue79;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue10 = 0.0f;
                branchMergedValue20 = 0.0f;
                branchMergedValue21 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue17 = 0.0f;
                branchMergedValue32 = 0.0f;
                branchMergedValue33 = 0.0f;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            intermediateValue48 = branchMergedValue21;
            intermediateValue49 = branchMergedValue20;
            intermediateValue50 = branchMergedValue10;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            intermediateValue68 = branchMergedValue33;
            intermediateValue69 = branchMergedValue32;
            intermediateValue70 = branchMergedValue17;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            intermediateValue48 = clampedValue1;
            intermediateValue49 = clampedValue2;
            intermediateValue50 = clampedValue3;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            intermediateValue68 = clampedValue1;
            intermediateValue69 = clampedValue2;
            intermediateValue70 = clampedValue3;
#endif
        }
        float productValue129 = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
        float productValue130 = productValue129 * productValue129;
        float productValue131 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue129 - productValue130)) + productValue130) * RD_UNIFORM_TILE_LIGHT_INTENSITY.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
        float productValue132 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue12;
        float dotProductValue11 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float productValue133 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * intermediateValue16) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue45 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue133;
        productValue46 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue133;
        productValue47 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue133;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue48 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue48), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue132;
        productValue49 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue49), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue132;
        productValue50 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue50), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue132;
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = intermediateValue31;
        intermediateValue32 = intermediateValue33;
        intermediateValue34 = intermediateValue35;
        intermediateValue36 = intermediateValue37;
        intermediateValue38 = intermediateValue39;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue48 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue68), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue132;
        productValue49 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue69), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue132;
        productValue50 = (max((productValue131 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue70), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue132;
        intermediateValue28 = productValue51;
        intermediateValue29 = productValue52;
        intermediateValue30 = productValue53;
        intermediateValue31 = productValue54;
        intermediateValue32 = productValue55;
        intermediateValue33 = productValue56;
#endif
    }
    else
    {
        productValue45 = 0.0f;
        productValue46 = 0.0f;
        productValue47 = 0.0f;
        productValue48 = 0.0f;
        productValue49 = 0.0f;
        productValue50 = 0.0f;
        intermediateValue28 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue29 = 0.0f;
#endif
        intermediateValue30 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue31 = 0.0f;
#endif
        intermediateValue32 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue34 = 0.0f;
        intermediateValue36 = 0.0f;
        intermediateValue38 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue33 = 0.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float sumValue115 = ((productValue48 + productValue45) + intermediateValue28) + intermediateValue34;
    float sumValue117 = ((productValue49 + productValue46) + intermediateValue30) + intermediateValue36;
    float sumValue118 = ((productValue50 + productValue47) + intermediateValue32) + intermediateValue38;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float sumValue180 = ((productValue48 + productValue45) + intermediateValue28) + intermediateValue31;
    float sumValue181 = ((productValue49 + productValue46) + intermediateValue29) + intermediateValue32;
    float sumValue182 = ((productValue50 + productValue47) + intermediateValue30) + intermediateValue33;
#endif
    float sumValue119 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue126 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue127 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue16 = rsqrt(dot(float3(sumValue119, sumValue126, sumValue127), float3(sumValue119, sumValue126, sumValue127)));
    float productValue134 = inverseLengthValue16 * sumValue119;
    float productValue135 = inverseLengthValue16 * sumValue126;
    float productValue136 = inverseLengthValue16 * sumValue127;
    bool comparisonValue77 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    bool comparisonValue78 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue56;
    float productValue57;
    float productValue58;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue62;
    float productValue63;
    float productValue64;
#endif
    if ((comparisonValue77 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue78)
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue56 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue57 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue58 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue62 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue63 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue64 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue56 = 0.0f;
        productValue57 = 0.0f;
        productValue58 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue62 = 0.0f;
        productValue63 = 0.0f;
        productValue64 = 0.0f;
#endif
    }
    bool comparisonValue79 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    bool comparisonValue80 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue53;
    float intermediateValue54;
#endif
    float intermediateValue55;
    float intermediateValue56;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float intermediateValue57;
    float intermediateValue58;
#endif
    if (comparisonValue80)
    {
        float clampedValue19 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue11;
        float branchMergedValue22;
        float branchMergedValue23;
        float branchMergedValue24;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue15;
        float branchMergedValue29;
        float branchMergedValue30;
        float branchMergedValue31;
#endif
        if (clampedValue19 > 0.0f)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float branchMergedValue54;
            float branchMergedValue61;
            float branchMergedValue62;
            float branchMergedValue63;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float branchMergedValue69;
            float branchMergedValue75;
            float branchMergedValue76;
            float branchMergedValue77;
#endif
            if (comparisonValue77)
            {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue54 = RD_UNIFORM_FOG_COLOR.x * max(productValue56, 1.0f);
                branchMergedValue61 = clampedValue19;
                branchMergedValue62 = max(productValue58, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue63 = max(productValue57, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue69 = max(productValue64, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue75 = max(productValue63, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue76 = RD_UNIFORM_FOG_COLOR.x * max(productValue62, 1.0f);
                branchMergedValue77 = clampedValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                branchMergedValue54 = max(productValue57, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue61 = clampedValue19;
                branchMergedValue62 = RD_UNIFORM_FOG_COLOR.x * max(productValue56, 1.0f);
                branchMergedValue63 = max(productValue58, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
#endif
            }
            else
            {
                float clampedValue20 = clamp(((productValue135 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue137 = 1.0f - ((clampedValue20 * clampedValue20) * (3.0f - (clampedValue20 * 2.0f)));
                float productValue138 = (productValue137 * productValue137) * productValue137;
                float dotProductValue12 = dot(float3(productValue134, productValue135, productValue136), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue13 = dot(float3(productValue134, productValue135, productValue136), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue128 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue21 = clamp((productValue135 - sumValue128) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue128), 0.0f, 1.0f);
                float productValue139 = 1.0f - ((clampedValue21 * clampedValue21) * (3.0f - (clampedValue21 * 2.0f)));
                float productValue140 = (productValue139 * productValue139) * productValue139;
                float productValue141 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue13 * dotProductValue13) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue22 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue23 = clamp(exp2(log2(max(dotProductValue13, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue142 = 1.809999942779541015625f - (clampedValue22 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue142) * productValue142);
                float productValue143 = 1.809999942779541015625f - (clampedValue23 * 1.7999999523162841796875f);
                float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue143) * productValue143);
                float productValue144 = clampedValue22 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue158 = clampedValue23 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue159 = (((productValue138 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue158 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue144 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue140 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue141)) * 0.079577468335628509521484375f;
                float productValue160 = (((productValue138 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue158 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue144 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue140 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue141)) * 0.079577468335628509521484375f;
                float productValue161 = (((productValue138 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue158 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue144 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue140 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue141)) * 0.079577468335628509521484375f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                float branchMergedValue65;
                float branchMergedValue68;
                float branchMergedValue69;
                float branchMergedValue70;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                float branchMergedValue90;
                float branchMergedValue93;
                float branchMergedValue94;
                float branchMergedValue95;
#endif
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue73 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue65 = ((productValue159 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue68 = clampedValue19;
                    branchMergedValue69 = ((productValue161 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue70 = ((productValue160 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue90 = ((productValue161 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue93 = ((productValue160 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue94 = ((productValue159 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue95 = clampedValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue65 = ((productValue160 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue68 = clampedValue19;
                    branchMergedValue69 = ((productValue159 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue70 = ((productValue161 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue73) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
#endif
                }
                else
                {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue65 = productValue159;
                    branchMergedValue68 = clampedValue19;
                    branchMergedValue69 = productValue161;
                    branchMergedValue70 = productValue160;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                    branchMergedValue90 = productValue161;
                    branchMergedValue93 = productValue160;
                    branchMergedValue94 = productValue159;
                    branchMergedValue95 = clampedValue19;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
                    branchMergedValue65 = productValue160;
                    branchMergedValue68 = clampedValue19;
                    branchMergedValue69 = productValue159;
                    branchMergedValue70 = productValue161;
#endif
                }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                branchMergedValue54 = branchMergedValue65;
                branchMergedValue61 = branchMergedValue68;
                branchMergedValue62 = branchMergedValue69;
                branchMergedValue63 = branchMergedValue70;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                branchMergedValue69 = branchMergedValue90;
                branchMergedValue75 = branchMergedValue93;
                branchMergedValue76 = branchMergedValue94;
                branchMergedValue77 = branchMergedValue95;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue11 = branchMergedValue54;
            branchMergedValue22 = branchMergedValue61;
            branchMergedValue23 = branchMergedValue62;
            branchMergedValue24 = branchMergedValue63;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue15 = branchMergedValue69;
            branchMergedValue29 = branchMergedValue75;
            branchMergedValue30 = branchMergedValue76;
            branchMergedValue31 = branchMergedValue77;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue11 = 0.0f;
            branchMergedValue22 = clampedValue19;
            branchMergedValue23 = 0.0f;
            branchMergedValue24 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue15 = 0.0f;
            branchMergedValue29 = 0.0f;
            branchMergedValue30 = 0.0f;
            branchMergedValue31 = clampedValue19;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue55 = branchMergedValue22;
        intermediateValue56 = branchMergedValue11;
        intermediateValue57 = branchMergedValue24;
        intermediateValue58 = branchMergedValue23;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue53 = branchMergedValue31;
        intermediateValue54 = branchMergedValue30;
        intermediateValue55 = branchMergedValue29;
        intermediateValue56 = branchMergedValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
        intermediateValue55 = branchMergedValue22;
        intermediateValue56 = branchMergedValue23;
        intermediateValue57 = branchMergedValue11;
        intermediateValue58 = branchMergedValue24;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        intermediateValue53 = 0.0f;
        intermediateValue54 = 0.0f;
#endif
        intermediateValue55 = 0.0f;
        intermediateValue56 = 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue57 = 0.0f;
        intermediateValue58 = 0.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue111;
    float productValue112;
    float productValue113;
    float productValue114;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue119;
    float productValue120;
    float productValue121;
    float productValue122;
#endif
    if (comparisonValue79)
    {
        float productValue162 = (multiplyAddValue16 + 1.0f) * 0.5f;
        float productValue163 = (multiplyAddValue17 + 1.0f) * 0.5f;
        uint scalarValue74 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue38 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue18, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue18, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue74))) + (-0.5f);
        uint sumValue129 = uint(min(int(uint(max(int(uint(int(multiplyAddValue38))), int(0u)))), int(scalarValue74 + 4294967294u)));
        float scalarValue75 = float(int(sumValue129));
        float sumValue130 = min(max(multiplyAddValue38 - scalarValue75, 0.0f), 1.0f);
        float4 sampledTextureValue5 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue162, productValue163, scalarValue75), 0.0f);
        float scalarValue76 = sampledTextureValue5.x;
        float scalarValue77 = sampledTextureValue5.y;
        float scalarValue78 = sampledTextureValue5.z;
        float scalarValue79 = sampledTextureValue5.w;
        float4 sampledTextureValue6 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue162, productValue163, float(int(sumValue129 + 1u))), 0.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue111 = ((sampledTextureValue6.x - scalarValue76) * sumValue130) + scalarValue76;
        productValue112 = ((sampledTextureValue6.y - scalarValue77) * sumValue130) + scalarValue77;
        productValue113 = ((sampledTextureValue6.z - scalarValue78) * sumValue130) + scalarValue78;
        productValue114 = ((sampledTextureValue6.w - scalarValue79) * sumValue130) + scalarValue79;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue119 = ((sampledTextureValue6.x - scalarValue76) * sumValue130) + scalarValue76;
        productValue120 = ((sampledTextureValue6.y - scalarValue77) * sumValue130) + scalarValue77;
        productValue121 = ((sampledTextureValue6.z - scalarValue78) * sumValue130) + scalarValue78;
        productValue122 = ((sampledTextureValue6.w - scalarValue79) * sumValue130) + scalarValue79;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue111 = 0.0f;
        productValue112 = 0.0f;
        productValue113 = 0.0f;
        productValue114 = 1.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue119 = 0.0f;
        productValue120 = 0.0f;
        productValue121 = 0.0f;
        productValue122 = 1.0f;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float intermediateValue115;
    float intermediateValue116;
    float intermediateValue117;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float intermediateValue131;
    float intermediateValue132;
    float intermediateValue133;
#endif
    if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
    {
        bool conditionValue6 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float intermediateValue108;
        float intermediateValue109;
        float intermediateValue110;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float intermediateValue124;
        float intermediateValue125;
        float intermediateValue126;
#endif
        float multiplyAddValue39;
        float multiplyAddValue40;
        float multiplyAddValue41;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            intermediateValue108 = productValue60;
            intermediateValue109 = productValue61;
            intermediateValue110 = productValue65;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            intermediateValue124 = productValue60;
            intermediateValue125 = productValue61;
            intermediateValue126 = productValue65;
#endif
            multiplyAddValue39 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue40 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue41 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            intermediateValue108 = varyingTexCoord3.x;
            intermediateValue109 = varyingTexCoord3.y;
            intermediateValue110 = varyingTexCoord3.z;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            intermediateValue124 = varyingTexCoord3.x;
            intermediateValue125 = varyingTexCoord3.y;
            intermediateValue126 = varyingTexCoord3.z;
#endif
            multiplyAddValue39 = multiplyAddValue11;
            multiplyAddValue40 = multiplyAddValue12;
            multiplyAddValue41 = multiplyAddValue13;
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float sumValue131 = intermediateValue108 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue132 = intermediateValue109 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue134 = intermediateValue110 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue17 = rsqrt(dot(float3(sumValue131, sumValue132, sumValue134), float3(sumValue131, sumValue132, sumValue134)));
        float productValue164 = inverseLengthValue17 * sumValue131;
        float productValue165 = inverseLengthValue17 * sumValue132;
        float productValue166 = inverseLengthValue17 * sumValue134;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float sumValue183 = intermediateValue124 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue184 = intermediateValue125 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue185 = intermediateValue126 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue27 = rsqrt(dot(float3(sumValue183, sumValue184, sumValue185), float3(sumValue183, sumValue184, sumValue185)));
        float productValue296 = inverseLengthValue27 * sumValue183;
        float productValue297 = inverseLengthValue27 * sumValue184;
        float productValue298 = inverseLengthValue27 * sumValue185;
#endif
        float inverseLengthValue18 = rsqrt(dot(float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41), float3(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41)));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float dotProductValue14 = dot(float3(productValue164, productValue165, productValue166), float3(productValue27, productValue28, productValue29)) * 2.0f;
        float productValue167 = productValue164 - (dotProductValue14 * productValue27);
        float productValue168 = productValue165 - (dotProductValue14 * productValue28);
        float productValue169 = productValue166 - (dotProductValue14 * productValue29);
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float dotProductValue22 = dot(float3(productValue296, productValue297, productValue298), float3(productValue27, productValue28, productValue29)) * 2.0f;
        float productValue299 = productValue296 - (dotProductValue22 * productValue27);
        float productValue300 = productValue297 - (dotProductValue22 * productValue28);
        float productValue301 = productValue298 - (dotProductValue22 * productValue29);
#endif
        float sumValue135 = 1.0f - intermediateValue17;
        float productValue170 = sumValue135 * sumValue135;
        float productValue171 = productValue170 * productValue170;
        precise float comparisonValue81 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue170 : (productValue171 * productValue171));
        precise float productValue172 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue81;
        uint scalarValue80 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float4 sampledTextureValue7 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue167, productValue168, productValue169, float(int(scalarValue80))), productValue172);
        float4 sampledTextureValue8 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue167, productValue168, productValue169, float(int(uint(int(scalarValue80 + 2u) - int(3u) * (int(scalarValue80 + 2u) / int(3u)))))), productValue172);
        float scalarValue81 = sampledTextureValue8.x;
        float scalarValue82 = sampledTextureValue8.y;
        float scalarValue83 = sampledTextureValue8.z;
        float productValue173 = ((sampledTextureValue7.x - scalarValue81) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue81;
        float productValue174 = ((sampledTextureValue7.y - scalarValue82) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue82;
        float productValue175 = ((sampledTextureValue7.z - scalarValue83) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue83;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float4 sampledTextureValue15 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue299, productValue300, productValue301, float(int(scalarValue80))), productValue172);
        float4 sampledTextureValue16 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue299, productValue300, productValue301, float(int(uint(int(scalarValue80 + 2u) - int(3u) * (int(scalarValue80 + 2u) / int(3u)))))), productValue172);
        float scalarValue142 = sampledTextureValue16.x;
        float scalarValue143 = sampledTextureValue16.y;
        float scalarValue144 = sampledTextureValue16.z;
        float productValue302 = ((sampledTextureValue15.x - scalarValue142) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue142;
        float productValue303 = ((sampledTextureValue15.y - scalarValue143) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue143;
        float productValue304 = ((sampledTextureValue15.z - scalarValue144) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue144;
#endif
        float productValue176 = (((clampedValue10 * clampedValue10) * clampedValue10) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float comparisonValue82 = (conditionValue6 ? (productValue173 * 301.72412109375f) : productValue173) * productValue176;
        float comparisonValue83 = (conditionValue6 ? (productValue174 * 301.72412109375f) : productValue174) * productValue176;
        float comparisonValue84 = (conditionValue6 ? (productValue175 * 301.72412109375f) : productValue175) * productValue176;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float comparisonValue114 = (conditionValue6 ? (productValue302 * 301.72412109375f) : productValue302) * productValue176;
        float comparisonValue115 = (conditionValue6 ? (productValue303 * 301.72412109375f) : productValue303) * productValue176;
        float comparisonValue116 = (conditionValue6 ? (productValue304 * 301.72412109375f) : productValue304) * productValue176;
        float comparisonValue31;
#endif
        float comparisonValue32;
        float comparisonValue33;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float comparisonValue34;
#endif
        if (comparisonValue78)
        {
            float productValue177 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue183 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue186 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue187 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue189 = productValue187 * clampedValue1;
            float productValue190 = productValue187 * clampedValue2;
            float productValue193 = productValue187 * clampedValue3;
            float clampedValue24 = clamp(dot(float3(productValue189, productValue190, productValue193), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue194 = ((clampedValue24 * (productValue189 - productValue177)) + productValue177) * intermediateValue18;
            float productValue195 = ((clampedValue24 * (productValue190 - productValue183)) + productValue183) * intermediateValue18;
            float productValue198 = ((clampedValue24 * (productValue193 - productValue186)) + productValue186) * intermediateValue18;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            float intermediateValue147;
            float intermediateValue148;
            float intermediateValue149;
            bool intermediateValue150;
            if (!(dot(float3(comparisonValue82, comparisonValue83, comparisonValue84), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue194, productValue195, productValue198), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            float intermediateValue176;
            float intermediateValue177;
            float intermediateValue178;
            bool intermediateValue179;
            if (!(dot(float3(comparisonValue114, comparisonValue115, comparisonValue116), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue194, productValue195, productValue198), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#endif
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue147 = productValue194;
                intermediateValue148 = productValue195;
                intermediateValue149 = productValue198;
                intermediateValue150 = true;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue176 = productValue194;
                intermediateValue177 = productValue195;
                intermediateValue178 = productValue198;
                intermediateValue179 = true;
#endif
            }
            else
            {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
                intermediateValue147 = 0.0f;
                intermediateValue148 = 0.0f;
                intermediateValue149 = 0.0f;
                intermediateValue150 = false;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
                intermediateValue176 = 0.0f;
                intermediateValue177 = 0.0f;
                intermediateValue178 = 0.0f;
                intermediateValue179 = false;
#endif
            }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            comparisonValue32 = intermediateValue150 ? intermediateValue147 : comparisonValue82;
            comparisonValue33 = intermediateValue150 ? intermediateValue148 : comparisonValue83;
            comparisonValue34 = intermediateValue150 ? intermediateValue149 : comparisonValue84;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            comparisonValue31 = intermediateValue179 ? intermediateValue176 : comparisonValue114;
            comparisonValue32 = intermediateValue179 ? intermediateValue177 : comparisonValue115;
            comparisonValue33 = intermediateValue179 ? intermediateValue178 : comparisonValue116;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            comparisonValue32 = comparisonValue82;
            comparisonValue33 = comparisonValue83;
            comparisonValue34 = comparisonValue84;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            comparisonValue31 = comparisonValue114;
            comparisonValue32 = comparisonValue115;
            comparisonValue33 = comparisonValue116;
#endif
        }
        float4 sampledTextureValue9 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3((-0.0f) - (multiplyAddValue39 * inverseLengthValue18), (-0.0f) - (multiplyAddValue40 * inverseLengthValue18), (-0.0f) - (multiplyAddValue41 * inverseLengthValue18))), 0.0f, 1.0f), sumValue135));
        float scalarValue84 = sampledTextureValue9.x;
        float scalarValue85 = sampledTextureValue9.y;
        float quotientValue20 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
        float clampedValue25 = 1.0f - clamp(comparisonValue80 ? (quotientValue20 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue20 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float productValue199 = (((scalarValue84 * productValue68) + scalarValue85) * comparisonValue32) * clampedValue25;
        float productValue200 = (((scalarValue84 * productValue69) + scalarValue85) * comparisonValue33) * clampedValue25;
        float productValue214 = (((scalarValue84 * productValue70) + scalarValue85) * comparisonValue34) * clampedValue25;
        float branchMergedValue15;
        float branchMergedValue27;
        float branchMergedValue28;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float productValue305 = (((scalarValue84 * productValue68) + scalarValue85) * comparisonValue31) * clampedValue25;
        float productValue306 = (((scalarValue84 * productValue69) + scalarValue85) * comparisonValue32) * clampedValue25;
        float productValue307 = (((scalarValue84 * productValue70) + scalarValue85) * comparisonValue33) * clampedValue25;
        float branchMergedValue21;
        float branchMergedValue36;
        float branchMergedValue37;
#endif
        if (comparisonValue79)
        {
            float productValue215 = (multiplyAddValue16 + 1.0f) * 0.5f;
            float productValue216 = (multiplyAddValue17 + 1.0f) * 0.5f;
            uint scalarValue86 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue48 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue18, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue18, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue17, multiplyAddValue16 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue86))) + (-0.5f);
            uint sumValue136 = uint(min(int(uint(max(int(uint(int(multiplyAddValue48))), int(0u)))), int(scalarValue86 + 4294967294u)));
            float scalarValue87 = float(int(sumValue136));
            float4 sampledTextureValue10 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue215, productValue216, scalarValue87), 0.0f);
            float scalarValue88 = sampledTextureValue10.w;
            float sampledTextureValue11 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue215, productValue216, float(int(sumValue136 + 1u))), 0.0f).w - scalarValue88) * min(max(multiplyAddValue48 - scalarValue87, 0.0f), 1.0f)) + scalarValue88;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue15 = sampledTextureValue11 * productValue214;
            branchMergedValue27 = sampledTextureValue11 * productValue200;
            branchMergedValue28 = sampledTextureValue11 * productValue199;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue21 = sampledTextureValue11 * productValue305;
            branchMergedValue36 = sampledTextureValue11 * productValue306;
            branchMergedValue37 = sampledTextureValue11 * productValue307;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue21 = sampledTextureValue11 * productValue307;
            branchMergedValue36 = sampledTextureValue11 * productValue306;
            branchMergedValue37 = sampledTextureValue11 * productValue305;
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue15 = productValue214;
            branchMergedValue27 = productValue200;
            branchMergedValue28 = productValue199;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue21 = productValue305;
            branchMergedValue36 = productValue306;
            branchMergedValue37 = productValue307;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue21 = productValue307;
            branchMergedValue36 = productValue306;
            branchMergedValue37 = productValue305;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue115 = branchMergedValue28;
        intermediateValue116 = branchMergedValue27;
        intermediateValue117 = branchMergedValue15;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue131 = branchMergedValue21;
        intermediateValue132 = branchMergedValue36;
        intermediateValue133 = branchMergedValue37;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue131 = branchMergedValue37;
        intermediateValue132 = branchMergedValue36;
        intermediateValue133 = branchMergedValue21;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        float branchMergedValue14;
        float branchMergedValue25;
        float branchMergedValue26;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        float branchMergedValue20;
        float branchMergedValue34;
        float branchMergedValue35;
#endif
        if (comparisonValue78)
        {
            float multiplyAddValue45;
            float multiplyAddValue46;
            float multiplyAddValue47;
            if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
            {
                multiplyAddValue45 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
                multiplyAddValue46 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
                multiplyAddValue47 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue65, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue61, productValue60 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
            }
            else
            {
                multiplyAddValue45 = multiplyAddValue11;
                multiplyAddValue46 = multiplyAddValue12;
                multiplyAddValue47 = multiplyAddValue13;
            }
            float inverseLengthValue19 = rsqrt(dot(float3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47), float3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47)));
            float productValue219 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue220 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue222 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue223 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue227 = productValue223 * clampedValue1;
            float productValue228 = productValue223 * clampedValue2;
            float productValue229 = productValue223 * clampedValue3;
            float clampedValue26 = clamp(dot(float3(productValue227, productValue228, productValue229), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
            float productValue230 = ((clampedValue26 * (productValue227 - productValue219)) + productValue219) * intermediateValue18;
            float productValue231 = ((clampedValue26 * (productValue228 - productValue220)) + productValue220) * intermediateValue18;
            float productValue232 = ((clampedValue26 * (productValue229 - productValue222)) + productValue222) * intermediateValue18;
            bool dotProductValue16 = dot(float3(productValue230, productValue231, productValue232), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) <= 0.0f;
            float4 sampledTextureValue12 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21), float3((-0.0f) - (multiplyAddValue45 * inverseLengthValue19), (-0.0f) - (multiplyAddValue46 * inverseLengthValue19), (-0.0f) - (multiplyAddValue47 * inverseLengthValue19))), 0.0f, 1.0f), 1.0f - intermediateValue17));
            float scalarValue89 = sampledTextureValue12.x;
            float scalarValue90 = sampledTextureValue12.y;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue14 = ((scalarValue89 * productValue70) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue232);
            branchMergedValue25 = ((scalarValue89 * productValue69) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue231);
            branchMergedValue26 = ((scalarValue89 * productValue68) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue230);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue20 = ((scalarValue89 * productValue68) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue230);
            branchMergedValue34 = ((scalarValue89 * productValue69) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue231);
            branchMergedValue35 = ((scalarValue89 * productValue70) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue232);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
            branchMergedValue20 = ((scalarValue89 * productValue70) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue232);
            branchMergedValue34 = ((scalarValue89 * productValue69) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue231);
            branchMergedValue35 = ((scalarValue89 * productValue68) + scalarValue90) * (dotProductValue16 ? 0.0f : productValue230);
#endif
        }
        else
        {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
            branchMergedValue14 = 0.0f;
            branchMergedValue25 = 0.0f;
            branchMergedValue26 = 0.0f;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
            branchMergedValue20 = 0.0f;
            branchMergedValue34 = 0.0f;
            branchMergedValue35 = 0.0f;
#endif
        }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        intermediateValue115 = branchMergedValue26;
        intermediateValue116 = branchMergedValue25;
        intermediateValue117 = branchMergedValue14;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue131 = branchMergedValue20;
        intermediateValue132 = branchMergedValue34;
        intermediateValue133 = branchMergedValue35;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
        intermediateValue131 = branchMergedValue35;
        intermediateValue132 = branchMergedValue34;
        intermediateValue133 = branchMergedValue20;
#endif
    }
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
    float productValue233 = ((productValue114 * (((intermediateValue56 - sumValue115) * intermediateValue55) + sumValue115)) + productValue111) + intermediateValue115;
    float productValue234 = ((productValue114 * (((intermediateValue57 - sumValue117) * intermediateValue55) + sumValue117)) + productValue112) + intermediateValue116;
    float productValue237 = ((productValue114 * (((intermediateValue58 - sumValue118) * intermediateValue55) + sumValue118)) + productValue113) + intermediateValue117;
    float productValue178;
    float productValue179;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue308 = ((productValue122 * (((intermediateValue54 - sumValue180) * intermediateValue53) + sumValue180)) + productValue119) + intermediateValue131;
    float productValue309 = ((productValue122 * (((intermediateValue55 - sumValue181) * intermediateValue53) + sumValue181)) + productValue120) + intermediateValue132;
    float productValue310 = ((productValue122 * (((intermediateValue56 - sumValue182) * intermediateValue53) + sumValue182)) + productValue121) + intermediateValue133;
#endif
    float productValue180;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
    float productValue181;
    float productValue182;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue13 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue178 = sampledTextureValue13 * productValue233;
        productValue179 = sampledTextureValue13 * productValue234;
        productValue180 = sampledTextureValue13 * productValue237;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue180 = sampledTextureValue13 * productValue308;
        productValue181 = sampledTextureValue13 * productValue309;
        productValue182 = sampledTextureValue13 * productValue310;
#endif
    }
    else
    {
#if RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF
        productValue178 = productValue233;
        productValue179 = productValue234;
        productValue180 = productValue237;
#elif RD_FEATURE_POINT_LIGHT_SHADING == RD_ON
        productValue180 = productValue308;
        productValue181 = productValue309;
        productValue182 = productValue310;
#endif
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue178;
    fragmentColor0.y = productValue179;
    fragmentColor0.z = productValue180;
    fragmentColor0.w = (comparisonValue1 != 0u) ? 0.0f : (RD_UNIFORM_MAT_COLOR.w * intermediateValue10);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    fragmentColor0.x = productValue180;
    fragmentColor0.y = productValue181;
    fragmentColor0.z = productValue182;
    fragmentColor0.w = (comparisonValue1 != 0u) ? 0.0f : (RD_UNIFORM_MAT_COLOR.w * intermediateValue10);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_OFF)
    fragmentColor0.x = productValue178;
    fragmentColor0.y = productValue179;
    fragmentColor0.z = productValue180;
    fragmentColor0.w = (comparisonValue1 != 0u) ? 0.0f : (RD_UNIFORM_MAT_COLOR.w * intermediateValue9);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_POINT_LIGHT_SHADING == RD_ON)
    fragmentColor0.x = productValue180;
    fragmentColor0.y = productValue181;
    fragmentColor0.z = productValue182;
    fragmentColor0.w = (comparisonValue1 != 0u) ? 0.0f : (RD_UNIFORM_MAT_COLOR.w * intermediateValue9);
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
    varyingTexCoord8 = stage_input.varyingTexCoord8;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
