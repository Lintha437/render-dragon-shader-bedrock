// SingleBlockForwardPBR / ForwardPBRAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/SingleBlockForwardPBR/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  nointerpolation int varyingFrontFacing0 : FRONTFACING0,
  nointerpolation int varyingTexCoord4 : TEXCOORD4,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  uint varyingSv_Isfrontface0 : SV_IsFrontFace0,
  out float4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1)
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
#if RD_FEATURE_SEASONS == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24,workingVector25;
#elif RD_FEATURE_SEASONS == RD_ON
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13,workingVector14,workingVector15,workingVector16,workingVector17,workingVector18,workingVector19,workingVector20,workingVector21,workingVector22,workingVector23,workingVector24;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector2.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector1.yzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector0.w = 1;
  workingVector0.xyzw = workingVector1.xxxx ? workingVector0.xyzw : workingVector2.xyzw;
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
  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector0.xyz);
  workingVector2.xyz = workingVector4.xyz ? workingVector2.xyz : workingVector3.xyz;
  workingVector1.xyz = workingVector1.xxx ? workingVector1.yzw : workingVector2.xyz;
  workingVector1.w = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector1.w != 0) {
    workingVector2.x = sampledResource11[varyingTexCoord4.x].val[16/4];
    workingVector2.y = sampledResource11[varyingTexCoord4.x].val[16/4+1];
    workingVector2.z = sampledResource11[varyingTexCoord4.x].val[16/4+2];
    workingVector2.w = sampledResource11[varyingTexCoord4.x].val[16/4+3];
    workingVector3.x = sampledResource11[varyingTexCoord4.x].val[32/4+2];
    workingVector3.y = sampledResource11[varyingTexCoord4.x].val[32/4];
    workingVector3.z = sampledResource11[varyingTexCoord4.x].val[32/4+1];
    workingVector3.w = sampledResource11[varyingTexCoord4.x].val[32/4+3];
    workingVector4.x = sampledResource11[varyingTexCoord4.x].val[48/4];
    workingVector4.y = sampledResource11[varyingTexCoord4.x].val[48/4+1];
    workingVector4.zw = (int2)workingVector3.yy & int2(4,1);
    workingVector4.zw = RD_COMPARISON_MASK((int2)workingVector4.zw == int2(4,1));
    if (workingVector4.z != 0) {
      workingVector5.xy = varyingTexCoord0.xy * workingVector2.xy + workingVector2.zw;
      workingVector5.xyz = materialTexture2.Sample(textureSampler2, workingVector5.xy).xyz;
      workingVector5.xyz = workingVector5.xyz * float3(2,2,2) + float3(-1,-1,-1);
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector0.xyz = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = materialTexture5.Sample(textureSampler5, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x);
  workingVector2.xyz = max(float3(0,0,0), workingVector1.xyz);
  workingVector2.xyz = log2(workingVector2.xyz);
  workingVector2.xyz = float3(2.20000005,2.20000005,2.20000005) * workingVector2.xyz;
  workingVector2.xyz = exp2(workingVector2.xyz);
  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector1.xyz;
  workingVector0.xyz = workingVector0.xyz * varyingColor0.www + float3(0.0549999997,0.0549999997,0.0549999997);
  workingVector0.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector0.xyz;
  workingVector0.xyz = log2(workingVector0.xyz);
  workingVector0.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector0.xyz;
  workingVector0.xyz = exp2(workingVector0.xyz);
  workingVector1.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) >= workingVector1.xyz);
  workingVector0.xyz = workingVector1.xyz ? workingVector3.xyz : workingVector0.xyz;
  workingVector0.xyz = workingVector0.www ? workingVector2.xyz : workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.w != 0) {
    workingVector1.x = sampledResource11[varyingTexCoord4.x].val[16/4];
    workingVector1.y = sampledResource11[varyingTexCoord4.x].val[16/4+1];
    workingVector1.z = sampledResource11[varyingTexCoord4.x].val[16/4+2];
    workingVector1.w = sampledResource11[varyingTexCoord4.x].val[16/4+3];
    workingVector2.x = sampledResource11[varyingTexCoord4.x].val[32/4+2];
    workingVector2.y = sampledResource11[varyingTexCoord4.x].val[32/4];
    workingVector2.z = sampledResource11[varyingTexCoord4.x].val[32/4+1];
    workingVector2.w = sampledResource11[varyingTexCoord4.x].val[32/4+3];
    workingVector3.x = sampledResource11[varyingTexCoord4.x].val[48/4];
    workingVector3.y = sampledResource11[varyingTexCoord4.x].val[48/4+1];
    workingVector3.zw = (int2)workingVector2.yy & int2(4,1);
    workingVector3.zw = RD_COMPARISON_MASK((int2)workingVector3.zw == int2(4,1));
    if (workingVector3.z != 0) {
      workingVector4.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
      workingVector4.xyz = materialTexture2.Sample(textureSampler2, workingVector4.xy).xyz;
      workingVector4.xyz = workingVector4.xyz * float3(2,2,2) + float3(-1,-1,-1);
#endif
    } else {
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector1.w = sampledResource11[varyingTexCoord4.x].val[60/4];
      workingVector4.z = (int)workingVector3.y & 8;
      workingVector4.z = RD_COMPARISON_MASK((int)workingVector4.z == 8);
      if (workingVector4.z != 0) {
        workingVector4.z = workingVector1.w + -workingVector4.y;
        workingVector4.z = min(workingVector4.z, workingVector1.w);
        workingVector4.z = saturate(2 + -workingVector4.z);
        workingVector5.w = RD_COMPARISON_MASK(0 < workingVector4.z);
        if (workingVector5.w != 0) {
          workingVector6.xy = varyingTexCoord0.xy * workingVector2.xy + workingVector2.zw;
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector0.w = sampledResource11[varyingTexCoord4.x].val[60/4];
      workingVector3.z = (int)workingVector2.y & 8;
      workingVector3.z = RD_COMPARISON_MASK((int)workingVector3.z == 8);
      if (workingVector3.z != 0) {
        workingVector3.z = workingVector0.w + -workingVector3.y;
        workingVector3.z = min(workingVector3.z, workingVector0.w);
        workingVector3.z = saturate(2 + -workingVector3.z);
        workingVector4.w = RD_COMPARISON_MASK(0 < workingVector3.z);
        if (workingVector4.w != 0) {
          workingVector5.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
#endif
          materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_SEASONS == RD_OFF
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
          workingVector8.xyzw = materialTexture2.Gather(textureSampler2, workingVector6.zw).xyzw;
          workingVector6.xyzw = workingVector6.xxyy * workingVector7.xyzw + float4(0.5,0.5,0.5,0.5);
          workingVector6.xyzw = frac(workingVector6.xyzw);
          workingVector7.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector6.wwyy);
          workingVector7.xyzw = workingVector7.xyzw ? workingVector8.xyzy : workingVector8.wzwx;
          workingVector6.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector6.xyzw;
          workingVector6.xyzw = saturate(workingVector6.xyzw + workingVector6.xyzw);
          workingVector6.xyzw = (int4)workingVector6.xyzw;
          workingVector5.w = dot(workingVector7.xy, icb[workingVector6.x+0].xy);
          workingVector6.x = dot(workingVector7.xy, icb[workingVector6.y+0].xy);
          workingVector8.x = -workingVector6.x + workingVector5.w;
          workingVector5.w = dot(workingVector7.zw, icb[workingVector6.z+0].xy);
          workingVector6.x = dot(workingVector7.zw, icb[workingVector6.w+0].xy);
          workingVector8.y = -workingVector6.x + workingVector5.w;
          workingVector8.z = 0.25;
          workingVector5.w = dot(workingVector8.xyz, workingVector8.xyz);
          workingVector5.w = rsqrt(workingVector5.w);
          workingVector5.xyz = workingVector8.xyz * workingVector5.www;
          workingVector5.xy = workingVector5.xy * workingVector4.zz;
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector5.zw = floatingPointResult.xy;
          workingVector6.xyzw = workingVector5.zzww;
          workingVector5.zw = workingVector6.yw * workingVector5.xy;
          workingVector5.zw = frac(workingVector5.zw);
          workingVector7.xy = float2(-0.5,-0.5) + workingVector5.zw;
          workingVector7.xy = RD_COMPARISON_MASK(abs(workingVector7.xy) < float2(0.0625,0.0625));
          workingVector5.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector5.zw);
          workingVector5.zw = workingVector5.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
          workingVector5.zw = workingVector5.xy + workingVector5.zw;
          workingVector5.zw = workingVector7.xy ? workingVector5.zw : workingVector5.xy;
          workingVector7.xyzw = materialTexture2.Gather(textureSampler2, workingVector5.zw).xyzw;
          workingVector5.xyzw = workingVector5.xxyy * workingVector6.xyzw + float4(0.5,0.5,0.5,0.5);
          workingVector5.xyzw = frac(workingVector5.xyzw);
          workingVector6.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector5.wwyy);
          workingVector6.xyzw = workingVector6.xyzw ? workingVector7.xyzy : workingVector7.wzwx;
          workingVector5.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector5.xyzw;
          workingVector5.xyzw = saturate(workingVector5.xyzw + workingVector5.xyzw);
          workingVector5.xyzw = (int4)workingVector5.xyzw;
          workingVector4.w = dot(workingVector6.xy, icb[workingVector5.x+0].xy);
          workingVector5.x = dot(workingVector6.xy, icb[workingVector5.y+0].xy);
          workingVector7.x = -workingVector5.x + workingVector4.w;
          workingVector4.w = dot(workingVector6.zw, icb[workingVector5.z+0].xy);
          workingVector5.x = dot(workingVector6.zw, icb[workingVector5.w+0].xy);
          workingVector7.y = -workingVector5.x + workingVector4.w;
          workingVector7.z = 0.25;
          workingVector4.w = dot(workingVector7.xyz, workingVector7.xyz);
          workingVector4.w = rsqrt(workingVector4.w);
          workingVector4.xyz = workingVector7.xyz * workingVector4.www;
          workingVector4.xy = workingVector4.xy * workingVector3.zz;
#endif
        } else {
#if RD_FEATURE_SEASONS == RD_OFF
          workingVector5.xyz = float3(0,0,1);
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector4.xyz = float3(0,0,1);
#endif
        }
      } else {
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector4.z = (int)workingVector3.y & 16;
        workingVector4.z = RD_COMPARISON_MASK((int)workingVector4.z == 16);
        if (workingVector4.z != 0) {
          workingVector2.xy = varyingTexCoord0.xy * workingVector2.xy + workingVector2.zw;
          workingVector2.z = workingVector1.w + -workingVector4.y;
          workingVector1.w = min(workingVector2.z, workingVector1.w);
          workingVector6.xyzw = materialTexture2.SampleLevel(textureSampler2, workingVector2.xy, 0).xyzw;
          workingVector2.zw = RD_COMPARISON_MASK(workingVector6.yz == workingVector6.xy);
          workingVector2.z = workingVector2.w ? workingVector2.z : 0;
          if (workingVector2.z != 0) {
            workingVector2.z = saturate(2 + -workingVector1.w);
            workingVector2.w = RD_COMPARISON_MASK(0 < workingVector2.z);
            if (workingVector2.w != 0) {
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector3.z = (int)workingVector2.y & 16;
        workingVector3.z = RD_COMPARISON_MASK((int)workingVector3.z == 16);
        if (workingVector3.z != 0) {
          workingVector1.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
          workingVector1.z = workingVector0.w + -workingVector3.y;
          workingVector0.w = min(workingVector1.z, workingVector0.w);
          workingVector5.xyzw = materialTexture2.SampleLevel(textureSampler2, workingVector1.xy, 0).xyzw;
          workingVector1.zw = RD_COMPARISON_MASK(workingVector5.yz == workingVector5.xy);
          workingVector1.z = workingVector1.w ? workingVector1.z : 0;
          if (workingVector1.z != 0) {
            workingVector1.z = saturate(2 + -workingVector0.w);
            workingVector1.w = RD_COMPARISON_MASK(0 < workingVector1.z);
            if (workingVector1.w != 0) {
#endif
              materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector4.yz = floatingPointResult.xy;
              workingVector7.xyzw = workingVector4.yyzz;
              workingVector4.yz = workingVector7.yw * workingVector2.xy;
              workingVector4.yz = frac(workingVector4.yz);
              workingVector8.xy = float2(-0.5,-0.5) + workingVector4.yz;
              workingVector8.xy = RD_COMPARISON_MASK(abs(workingVector8.xy) < float2(0.0625,0.0625));
              workingVector4.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector4.yz);
              workingVector4.yz = workingVector4.yz ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
              workingVector4.yz = workingVector4.yz + workingVector2.xy;
              workingVector4.yz = workingVector8.xy ? workingVector4.yz : workingVector2.xy;
              workingVector8.xyzw = materialTexture2.Gather(textureSampler2, workingVector4.yz).xyzw;
              workingVector7.xyzw = workingVector2.xxyy * workingVector7.xyzw + float4(0.5,0.5,0.5,0.5);
              workingVector7.xyzw = frac(workingVector7.xyzw);
              workingVector9.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector7.wwyy);
              workingVector8.xyzw = workingVector9.xyzw ? workingVector8.xyzy : workingVector8.wzwx;
              workingVector7.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector7.xyzw;
              workingVector7.xyzw = saturate(workingVector7.xyzw + workingVector7.xyzw);
              workingVector7.xyzw = (int4)workingVector7.xyzw;
              workingVector2.w = dot(workingVector8.xy, icb[workingVector7.x+0].xy);
              workingVector4.y = dot(workingVector8.xy, icb[workingVector7.y+0].xy);
              workingVector9.x = -workingVector4.y + workingVector2.w;
              workingVector2.w = dot(workingVector8.zw, icb[workingVector7.z+0].xy);
              workingVector4.y = dot(workingVector8.zw, icb[workingVector7.w+0].xy);
              workingVector9.y = -workingVector4.y + workingVector2.w;
              workingVector9.z = 0.25;
              workingVector2.w = dot(workingVector9.xyz, workingVector9.xyz);
              workingVector2.w = rsqrt(workingVector2.w);
              workingVector5.xyz = workingVector9.xyz * workingVector2.www;
              workingVector5.xy = workingVector5.xy * workingVector2.zz;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector3.yz = floatingPointResult.xy;
              workingVector6.xyzw = workingVector3.yyzz;
              workingVector3.yz = workingVector6.yw * workingVector1.xy;
              workingVector3.yz = frac(workingVector3.yz);
              workingVector7.xy = float2(-0.5,-0.5) + workingVector3.yz;
              workingVector7.xy = RD_COMPARISON_MASK(abs(workingVector7.xy) < float2(0.0625,0.0625));
              workingVector3.yz = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector3.yz);
              workingVector3.yz = workingVector3.yz ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
              workingVector3.yz = workingVector3.yz + workingVector1.xy;
              workingVector3.yz = workingVector7.xy ? workingVector3.yz : workingVector1.xy;
              workingVector7.xyzw = materialTexture2.Gather(textureSampler2, workingVector3.yz).xyzw;
              workingVector6.xyzw = workingVector1.xxyy * workingVector6.xyzw + float4(0.5,0.5,0.5,0.5);
              workingVector6.xyzw = frac(workingVector6.xyzw);
              workingVector8.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector6.wwyy);
              workingVector7.xyzw = workingVector8.xyzw ? workingVector7.xyzy : workingVector7.wzwx;
              workingVector6.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector6.xyzw;
              workingVector6.xyzw = saturate(workingVector6.xyzw + workingVector6.xyzw);
              workingVector6.xyzw = (int4)workingVector6.xyzw;
              workingVector1.w = dot(workingVector7.xy, icb[workingVector6.x+0].xy);
              workingVector3.y = dot(workingVector7.xy, icb[workingVector6.y+0].xy);
              workingVector8.x = -workingVector3.y + workingVector1.w;
              workingVector1.w = dot(workingVector7.zw, icb[workingVector6.z+0].xy);
              workingVector3.y = dot(workingVector7.zw, icb[workingVector6.w+0].xy);
              workingVector8.y = -workingVector3.y + workingVector1.w;
              workingVector8.z = 0.25;
              workingVector1.w = dot(workingVector8.xyz, workingVector8.xyz);
              workingVector1.w = rsqrt(workingVector1.w);
              workingVector4.xyz = workingVector8.xyz * workingVector1.www;
              workingVector4.xy = workingVector4.xy * workingVector1.zz;
#endif
            } else {
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector5.xyz = float3(0,0,1);
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector4.xyz = float3(0,0,1);
#endif
            }
          } else {
            materialTexture2.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector2.zw = floatingPointResult.xy;
            workingVector1.w = saturate(2 + -workingVector1.w);
            workingVector4.y = RD_COMPARISON_MASK(0 < workingVector1.w);
            workingVector2.xy = workingVector2.xy * workingVector2.zw;
            workingVector2.xy = frac(workingVector2.xy);
            workingVector2.zw = RD_COMPARISON_MASK(workingVector2.xy >= float2(0.916666687,0.916666687));
            workingVector6.xyzw = workingVector6.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
            workingVector2.xy = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector2.xy);
            workingVector2.xyzw = workingVector2.xyzw ? float4(1,1,1,1) : 0;
            workingVector2.xy = workingVector2.xy * -workingVector6.yw;
            workingVector2.xy = workingVector2.zw * workingVector6.xz + workingVector2.xy;
            workingVector2.zw = RD_COMPARISON_MASK(abs(workingVector2.xy) >= float2(0.00499999989,0.00499999989));
            workingVector2.zw = workingVector2.zw ? float2(1,1) : 0;
            workingVector2.xy = workingVector2.zw * workingVector2.xy;
            workingVector2.z = 0.25;
            workingVector2.w = dot(workingVector2.xyz, workingVector2.xyz);
            workingVector2.w = rsqrt(workingVector2.w);
            workingVector2.xyz = workingVector2.xyz * workingVector2.www;
            workingVector2.xy = workingVector2.xy * workingVector1.ww;
            workingVector5.xyz = workingVector4.yyy ? workingVector2.xyz : float3(0,0,1);
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector1.zw = floatingPointResult.xy;
            workingVector0.w = saturate(2 + -workingVector0.w);
            workingVector3.y = RD_COMPARISON_MASK(0 < workingVector0.w);
            workingVector1.xy = workingVector1.xy * workingVector1.zw;
            workingVector1.xy = frac(workingVector1.xy);
            workingVector1.zw = RD_COMPARISON_MASK(workingVector1.xy >= float2(0.916666687,0.916666687));
            workingVector5.xyzw = workingVector5.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
            workingVector1.xy = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector1.xy);
            workingVector1.xyzw = workingVector1.xyzw ? float4(1,1,1,1) : 0;
            workingVector1.xy = workingVector1.xy * -workingVector5.yw;
            workingVector1.xy = workingVector1.zw * workingVector5.xz + workingVector1.xy;
            workingVector1.zw = RD_COMPARISON_MASK(abs(workingVector1.xy) >= float2(0.00499999989,0.00499999989));
            workingVector1.zw = workingVector1.zw ? float2(1,1) : 0;
            workingVector1.xy = workingVector1.zw * workingVector1.xy;
            workingVector1.z = 0.25;
            workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
            workingVector1.w = rsqrt(workingVector1.w);
            workingVector1.xyz = workingVector1.xyz * workingVector1.www;
            workingVector1.xy = workingVector1.xy * workingVector0.ww;
            workingVector4.xyz = workingVector3.yyy ? workingVector1.xyz : float3(0,0,1);
#endif
          }
        } else {
#if RD_FEATURE_SEASONS == RD_OFF
          workingVector5.xyz = float3(0,0,1);
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector4.xyz = float3(0,0,1);
#endif
        }
      }
    }
#if RD_FEATURE_SEASONS == RD_OFF
    if (workingVector4.w != 0) {
      workingVector2.x = sampledResource11[varyingTexCoord4.x].val[0/4];
      workingVector2.y = sampledResource11[varyingTexCoord4.x].val[0/4+1];
      workingVector2.z = sampledResource11[varyingTexCoord4.x].val[0/4+2];
      workingVector2.w = sampledResource11[varyingTexCoord4.x].val[0/4+3];
      workingVector2.xy = varyingTexCoord0.xy * workingVector2.xy + workingVector2.zw;
      workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
      workingVector1.w = (int)workingVector3.y & 2;
      workingVector1.w = RD_COMPARISON_MASK((int)workingVector1.w == 2);
      workingVector4.x = workingVector1.w ? workingVector2.w : workingVector4.x;
      workingVector3.xzw = workingVector2.yzx;
#elif RD_FEATURE_SEASONS == RD_ON
    if (workingVector3.w != 0) {
      workingVector1.x = sampledResource11[varyingTexCoord4.x].val[0/4];
      workingVector1.y = sampledResource11[varyingTexCoord4.x].val[0/4+1];
      workingVector1.z = sampledResource11[varyingTexCoord4.x].val[0/4+2];
      workingVector1.w = sampledResource11[varyingTexCoord4.x].val[0/4+3];
      workingVector1.xy = varyingTexCoord0.xy * workingVector1.xy + workingVector1.zw;
      workingVector1.xyzw = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyzw;
      workingVector0.w = (int)workingVector2.y & 2;
      workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 2);
      workingVector3.x = workingVector0.w ? workingVector1.w : workingVector3.x;
      workingVector2.xzw = workingVector1.yzx;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector2.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
    workingVector1.w = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector4.yzw = varyingTangent0.xyz * workingVector1.www;
    workingVector1.w = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector6.xyz = varyingBitangent0.xyz * workingVector1.www;
    workingVector1.w = dot(workingVector2.xyz, workingVector2.xyz);
    workingVector1.w = rsqrt(workingVector1.w);
    workingVector2.xyz = workingVector2.xyz * workingVector1.www;
    workingVector6.xyz = workingVector6.xyz * workingVector5.yyy;
    workingVector4.yzw = workingVector4.yzw * workingVector5.xxx + workingVector6.xyz;
    workingVector2.xyz = workingVector2.xyz * workingVector5.zzz + workingVector4.yzw;
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector1.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
    workingVector0.w = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector3.yzw = varyingTangent0.xyz * workingVector0.www;
    workingVector0.w = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector5.xyz = varyingBitangent0.xyz * workingVector0.www;
    workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector1.xyz = workingVector1.xyz * workingVector0.www;
    workingVector5.xyz = workingVector5.xyz * workingVector4.yyy;
    workingVector3.yzw = workingVector3.yzw * workingVector4.xxx + workingVector5.xyz;
    workingVector1.xyz = workingVector1.xyz * workingVector4.zzz + workingVector3.yzw;
#endif
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector3.xzw = float3(0,1,0);
    workingVector4.x = 0;
    workingVector2.xyz = float3(0,1,0);
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector2.xzw = float3(0,1,0);
    workingVector3.x = 0;
    workingVector1.xyz = float3(0,1,0);
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector5.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector5.yyyy;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector5.xxxx + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector5.zzzz + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector5.wwww + workingVector6.xyzw;
  workingVector4.yzw = workingVector6.xyz / workingVector6.www;
  workingVector1.w = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector2.xyw = workingVector2.xyz * workingVector1.www;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector2.yyy;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector2.xxx + workingVector6.xyz;
  workingVector6.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector2.www + workingVector6.xyz;
  workingVector7.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector8.xyz = ddx_coarse(workingVector5.zxy);
  workingVector3.y = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector3.y = rsqrt(workingVector3.y);
  workingVector8.xyz = workingVector8.xyz * workingVector3.yyy;
  workingVector9.xyz = -workingVector5.yzx;
  workingVector9.xyz = ddy_coarse(workingVector9.xyz);
  workingVector3.y = dot(workingVector9.xyz, workingVector9.xyz);
  workingVector3.y = rsqrt(workingVector3.y);
  workingVector9.xyz = workingVector9.xyz * workingVector3.yyy;
  workingVector10.xyz = workingVector9.xyz * workingVector8.xyz;
  workingVector8.xyz = workingVector8.zxy * workingVector9.yzx + -workingVector10.xyz;
  workingVector3.y = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector3.y = rsqrt(workingVector3.y);
  workingVector8.xyz = workingVector8.xyz * workingVector3.yyy;
  workingVector9.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector8.yyy;
  workingVector8.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector8.xxx + workingVector9.xyz;
  workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector8.zzz + workingVector8.xyw;
  workingVector3.y = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector3.y = rsqrt(workingVector3.y);
  workingVector8.xyz = workingVector8.xyz * workingVector3.yyy;
  workingVector8.xyz = workingVector8.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector8.xyz = round(workingVector8.xyz);
  workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector8.xyz;
  workingVector3.y = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector3.y = rsqrt(workingVector3.y);
  workingVector8.xyz = workingVector8.xyz * workingVector3.yyy;
  workingVector9.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector9.xyz = floor(workingVector9.xyz);
  workingVector9.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector9.xyz + workingVector7.xyz;
  workingVector9.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector9.xyz;
  workingVector3.y = dot(workingVector9.xyz, workingVector8.xyz);
  workingVector8.xyz = -workingVector3.yyy * workingVector8.xyz + workingVector9.xyz;
  workingVector8.xyz = workingVector8.xyz + workingVector7.xyz;
  workingVector8.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector8.xyz;
  workingVector3.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector3.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector3.y;
  workingVector3.y = RD_COMPARISON_MASK(workingVector3.y < 9.99999975e-005);
  workingVector5.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector3.y = workingVector3.y ? workingVector5.w : 0;
  workingVector9.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector5.w = workingVector9.x * 0.600000024 + 0.400000006;
  workingVector5.w = workingVector5.w * 0.600000024 + 0.400000006;
  workingVector9.y = workingVector9.x * workingVector5.w;
  workingVector5.w = workingVector9.x * workingVector9.x;
  workingVector5.w = workingVector5.w * 0.600000024 + 0.400000006;
  workingVector9.z = workingVector9.x * workingVector5.w;
  workingVector9.xyz = min(float3(1,1,1), workingVector9.xyz);
  workingVector9.xyz = workingVector3.yyy ? workingVector9.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector3.y = 1 + -workingVector3.w;
  workingVector10.xyz = workingVector3.www * workingVector1.xyz;
  workingVector10.xyz = workingVector3.yyy * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector10.xyz;
  workingVector11.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector5.w = workingVector11.y ? workingVector11.x : 0;
  if (workingVector5.w != 0) {
    workingVector11.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector11.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector11.xy;
    workingVector11.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector5.w = materialTexture6.Sample(textureSampler6, workingVector11.xyz).x;
    workingVector5.w = workingVector5.w + workingVector5.w;
    workingVector6.w = saturate(workingVector2.y);
    workingVector5.w = workingVector6.w * workingVector5.w;
    workingVector5.w = log2(workingVector5.w);
    workingVector5.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector5.w;
    workingVector5.w = exp2(workingVector5.w);
    workingVector6.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector5.w = workingVector6.w * workingVector5.w;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyzw * varyingTexCoord3.yyyy;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyzw * varyingTexCoord3.xxxx + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyzw * varyingTexCoord3.zzzz + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyzw + workingVector4.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_1.xyzw * workingVector4.yyyy;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_0.xyzw * workingVector4.xxxx + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_2.xyzw * workingVector4.zzzz + workingVector5.xyzw;
  workingVector5.xyzw = RD_UNIFORM_PROJECTION_MATRIX_ROW_3.xyzw * workingVector4.wwww + workingVector5.xyzw;
  workingVector3.yzw = workingVector5.xyz / workingVector5.www;
  workingVector0.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector1.xyw = workingVector1.xyz * workingVector0.www;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector1.yyy;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector1.xxx + workingVector5.xyz;
  workingVector5.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector1.www + workingVector5.xyz;
  workingVector6.xyz = -RD_UNIFORM_WORLD_ORIGIN.xyz + varyingTexCoord3.xyz;
  workingVector7.xyz = ddx_coarse(workingVector4.zxy);
  workingVector2.y = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector7.xyz = workingVector7.xyz * workingVector2.yyy;
  workingVector8.xyz = -workingVector4.yzx;
  workingVector8.xyz = ddy_coarse(workingVector8.xyz);
  workingVector2.y = dot(workingVector8.xyz, workingVector8.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector8.xyz = workingVector8.xyz * workingVector2.yyy;
  workingVector9.xyz = workingVector8.xyz * workingVector7.xyz;
  workingVector7.xyz = workingVector7.zxy * workingVector8.yzx + -workingVector9.xyz;
  workingVector2.y = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector7.xyz = workingVector7.xyz * workingVector2.yyy;
  workingVector8.xyz = RD_UNIFORM_INV_VIEW_ROW_1.xyz * workingVector7.yyy;
  workingVector7.xyw = RD_UNIFORM_INV_VIEW_ROW_0.xyz * workingVector7.xxx + workingVector8.xyz;
  workingVector7.xyz = RD_UNIFORM_INV_VIEW_ROW_2.xyz * workingVector7.zzz + workingVector7.xyw;
  workingVector2.y = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector7.xyz = workingVector7.xyz * workingVector2.yyy;
  workingVector7.xyz = workingVector7.xyz / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx;
  workingVector7.xyz = round(workingVector7.xyz);
  workingVector7.xyz = RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.xxx * workingVector7.xyz;
  workingVector2.y = dot(workingVector7.xyz, workingVector7.xyz);
  workingVector2.y = rsqrt(workingVector2.y);
  workingVector7.xyz = workingVector7.xyz * workingVector2.yyy;
  workingVector8.xyz = workingVector6.xyz / RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz;
  workingVector8.xyz = floor(workingVector8.xyz);
  workingVector8.xyz = -RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * workingVector8.xyz + workingVector6.xyz;
  workingVector8.xyz = RD_UNIFORM_QUANTIZATION_PARAMETERS.zzz * float3(0.5,0.5,0.5) + -workingVector8.xyz;
  workingVector2.y = dot(workingVector8.xyz, workingVector7.xyz);
  workingVector7.xyz = -workingVector2.yyy * workingVector7.xyz + workingVector8.xyz;
  workingVector7.xyz = workingVector7.xyz + workingVector6.xyz;
  workingVector7.xyz = RD_UNIFORM_WORLD_ORIGIN.xyz + workingVector7.xyz;
  workingVector2.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector2.y = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector2.y;
  workingVector2.y = RD_COMPARISON_MASK(workingVector2.y < 9.99999975e-005);
  workingVector4.w = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector2.y = workingVector2.y ? workingVector4.w : 0;
  workingVector8.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector4.w = workingVector8.x * 0.600000024 + 0.400000006;
  workingVector4.w = workingVector4.w * 0.600000024 + 0.400000006;
  workingVector8.y = workingVector8.x * workingVector4.w;
  workingVector4.w = workingVector8.x * workingVector8.x;
  workingVector4.w = workingVector4.w * 0.600000024 + 0.400000006;
  workingVector8.z = workingVector8.x * workingVector4.w;
  workingVector8.xyz = min(float3(1,1,1), workingVector8.xyz);
  workingVector8.xyz = workingVector2.yyy ? workingVector8.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector2.y = 1 + -workingVector2.w;
  workingVector9.xyz = workingVector2.www * workingVector0.xyz;
  workingVector9.xyz = workingVector2.yyy * float3(0.0399999991,0.0399999991,0.0399999991) + workingVector9.xyz;
  workingVector10.xy = RD_COMPARISON_MASK(float2(0,0) != RD_UNIFORM_CAUSTICS_PARAMETERS.xw);
  workingVector4.w = workingVector10.y ? workingVector10.x : 0;
  if (workingVector4.w != 0) {
    workingVector10.xy = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector10.xy = RD_UNIFORM_CAUSTICS_PARAMETERS.yy * workingVector10.xy;
    workingVector10.z = RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y;
    workingVector4.w = materialTexture6.Sample(textureSampler6, workingVector10.xyz).x;
    workingVector4.w = workingVector4.w + workingVector4.w;
    workingVector5.w = saturate(workingVector1.y);
    workingVector4.w = workingVector5.w * workingVector4.w;
    workingVector4.w = log2(workingVector4.w);
    workingVector4.w = RD_UNIFORM_CAUSTICS_PARAMETERS.z * workingVector4.w;
    workingVector4.w = exp2(workingVector4.w);
    workingVector5.w = 1 + RD_UNIFORM_CAUSTICS_PARAMETERS.z;
    workingVector4.w = workingVector5.w * workingVector4.w;
#endif
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector5.w = 1;
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector4.w = 1;
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector6.w = dot(workingVector5.xyz, workingVector5.xyz);
  workingVector6.w = sqrt(workingVector6.w);
  workingVector7.w = RD_COMPARISON_MASK(workingVector4.w != 1.000000);
  if (workingVector7.w != 0) {
    workingVector7.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector8.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector7.w = workingVector7.w ? workingVector8.w : 0;
    if (workingVector7.w == 0) {
      workingVector7.w = 9.99999975e-005 + workingVector6.w;
      workingVector11.xyz = workingVector5.xyz / workingVector7.www;
      workingVector4.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector4.x;
      workingVector7.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector7.w = RD_COMPARISON_MASK((int)workingVector7.w == 1);
      if (workingVector7.w != 0) {
        workingVector7.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector7.w = RD_COMPARISON_MASK(0 < (int)workingVector7.w);
        workingVector12.xyz = workingVector7.www ? workingVector8.xyz : varyingTexCoord3.xyz;
        workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector13.xyz;
        workingVector13.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector13.xyz;
        workingVector7.w = dot(workingVector13.xyz, workingVector13.xyz);
        workingVector7.w = rsqrt(workingVector7.w);
        workingVector13.xyz = workingVector13.xyz * workingVector7.www;
        workingVector7.w = dot(workingVector6.xyz, workingVector13.xyz);
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector5.w = dot(workingVector4.xyz, workingVector4.xyz);
  workingVector5.w = sqrt(workingVector5.w);
  workingVector6.w = RD_COMPARISON_MASK(workingVector3.w != 1.000000);
  if (workingVector6.w != 0) {
    workingVector6.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x);
    workingVector7.w = RD_COMPARISON_MASK(abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.99999975e-005);
    workingVector6.w = workingVector6.w ? workingVector7.w : 0;
    if (workingVector6.w == 0) {
      workingVector6.w = 9.99999975e-005 + workingVector5.w;
      workingVector10.xyz = workingVector4.xyz / workingVector6.www;
      workingVector3.x = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * workingVector3.x;
      workingVector6.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x;
      workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 1);
      if (workingVector6.w != 0) {
        workingVector6.w = (int)RD_UNIFORM_QUANTIZATION_PARAMETERS.y;
        workingVector6.w = RD_COMPARISON_MASK(0 < (int)workingVector6.w);
        workingVector11.xyz = workingVector6.www ? workingVector7.xyz : varyingTexCoord3.xyz;
        workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.xxx + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.zzz + workingVector12.xyz;
        workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.www + workingVector12.xyz;
        workingVector6.w = dot(workingVector12.xyz, workingVector12.xyz);
        workingVector6.w = rsqrt(workingVector6.w);
        workingVector12.xyz = workingVector12.xyz * workingVector6.www;
        workingVector6.w = dot(workingVector5.xyz, workingVector12.xyz);
        workingVector6.w = max(0, workingVector6.w);
        workingVector12.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector1.xyw;
        workingVector7.w = 1 + -workingVector6.w;
#endif
        workingVector7.w = max(0, workingVector7.w);
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector13.xyz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.www * workingVector2.xyw;
        workingVector8.w = 1 + -workingVector7.w;
        workingVector8.w = max(0, workingVector8.w);
        workingVector12.xyz = workingVector13.xyz * workingVector8.www + workingVector12.xyz;
        workingVector13.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector8.w = dot(workingVector13.xyzw, float4(1,1,1,1));
        workingVector8.w = (int)workingVector8.w;
        workingVector9.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
        workingVector13.xyz = float3(1,1,0);
        workingVector10.w = 0;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector11.xyz = workingVector12.xyz * workingVector7.www + workingVector11.xyz;
        workingVector12.xyzw = saturate(RD_UNIFORM_CASCADES_PER_SET.xyzw);
        workingVector7.w = dot(workingVector12.xyzw, float4(1,1,1,1));
        workingVector7.w = (int)workingVector7.w;
        workingVector8.w = RD_COMPARISON_MASK(0 != RD_UNIFORM_QUANTIZATION_PARAMETERS.x);
        workingVector12.xyz = float3(1,1,0);
        workingVector9.w = 0;
#endif
        while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
          workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w >= (int)workingVector8.w);
          if (workingVector11.w != 0) break;
          workingVector11.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector10.w+0].xyzw);
          workingVector11.w = (int)workingVector11.w;
          workingVector11.w = (int)workingVector11.w + (int)workingVector13.z;
          workingVector11.w = min(8, (int)workingVector11.w);
          workingVector14.xy = workingVector13.xy;
          workingVector12.w = workingVector13.z;
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w >= (int)workingVector7.w);
          if (workingVector10.w != 0) break;
          workingVector10.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, icb[workingVector9.w+0].xyzw);
          workingVector10.w = (int)workingVector10.w;
          workingVector10.w = (int)workingVector10.w + (int)workingVector12.z;
          workingVector10.w = min(8, (int)workingVector10.w);
          workingVector13.xy = workingVector12.xy;
          workingVector11.w = workingVector12.z;
#endif
          while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector11.w);
            if (workingVector13.w != 0) break;
            workingVector13.w = (uint)workingVector12.w << 2;
            workingVector15.xyz = fragmentVectorConstants1[workingVector13.w+80].xyz * workingVector12.yyy;
            workingVector15.xyz = fragmentVectorConstants1[workingVector13.w+79].xyz * workingVector12.xxx + workingVector15.xyz;
            workingVector15.xyz = fragmentVectorConstants1[workingVector13.w+81].xyz * workingVector12.zzz + workingVector15.xyz;
            workingVector15.xyz = fragmentVectorConstants1[workingVector13.w+82].xyz + workingVector15.xyz;
            workingVector16.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector15.xyz));
            workingVector14.z = workingVector16.y ? workingVector16.x : 0;
            workingVector14.z = workingVector16.z ? workingVector14.z : 0;
            if (workingVector14.z != 0) {
              workingVector14.z = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector12.w+0].xyzw);
              workingVector14.z = max(workingVector14.z, workingVector7.w);
              workingVector14.z = min(1, workingVector14.z);
              workingVector14.w = -workingVector14.z * workingVector14.z + 1;
              workingVector14.w = sqrt(workingVector14.w);
              workingVector14.z = workingVector14.w / workingVector14.z;
              workingVector14.z = fragmentVectorConstants1[workingVector12.w+48].z * workingVector14.z + fragmentVectorConstants1[workingVector12.w+48].y;
              workingVector16.xy = workingVector15.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector13.w = dot(fragmentVectorConstants1[workingVector13.w+18].xyzw, fragmentVectorConstants1[workingVector13.w+18].xyzw);
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector10.w);
            if (workingVector12.w != 0) break;
            workingVector12.w = (uint)workingVector11.w << 2;
            workingVector14.xyz = fragmentVectorConstants1[workingVector12.w+79].xyz * workingVector11.yyy;
            workingVector14.xyz = fragmentVectorConstants1[workingVector12.w+78].xyz * workingVector11.xxx + workingVector14.xyz;
            workingVector14.xyz = fragmentVectorConstants1[workingVector12.w+80].xyz * workingVector11.zzz + workingVector14.xyz;
            workingVector14.xyz = fragmentVectorConstants1[workingVector12.w+81].xyz + workingVector14.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(float3(1,1,1) >= abs(workingVector14.xyz));
            workingVector13.z = workingVector15.y ? workingVector15.x : 0;
            workingVector13.z = workingVector15.z ? workingVector13.z : 0;
            if (workingVector13.z != 0) {
              workingVector13.z = dot(RD_UNIFORM_ND_LFLOOR.xyzw, icb[workingVector11.w+0].xyzw);
              workingVector13.z = max(workingVector13.z, workingVector6.w);
              workingVector13.z = min(1, workingVector13.z);
              workingVector13.w = -workingVector13.z * workingVector13.z + 1;
#endif
              workingVector13.w = sqrt(workingVector13.w);
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector13.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector13.w;
              workingVector14.w = fragmentVectorConstants1[workingVector12.w+48].w + 0.5;
              workingVector14.w = (int)workingVector14.w;
              workingVector14.w = max(1, (int)workingVector14.w);
              workingVector14.w = min(9, (int)workingVector14.w);
              workingVector14.w = workingVector9.w ? 1 : workingVector14.w;
              workingVector15.x = (uint)workingVector14.w >> 1;
              workingVector16.z = 1 + -workingVector16.y;
              workingVector17.z = (int)workingVector12.w;
              workingVector14.z = workingVector15.z + -workingVector14.z;
              workingVector15.yw = float2(0,0);
              workingVector16.y = 0;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector13.z = workingVector13.w / workingVector13.z;
              workingVector13.z = fragmentVectorConstants1[workingVector11.w+48].z * workingVector13.z + fragmentVectorConstants1[workingVector11.w+48].y;
              workingVector15.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
              workingVector12.w = dot(fragmentVectorConstants1[workingVector12.w+18].xyzw, fragmentVectorConstants1[workingVector12.w+18].xyzw);
              workingVector12.w = sqrt(workingVector12.w);
              workingVector12.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z * workingVector12.w;
              workingVector13.w = fragmentVectorConstants1[workingVector11.w+48].w + 0.5;
              workingVector13.w = (int)workingVector13.w;
              workingVector13.w = max(1, (int)workingVector13.w);
              workingVector13.w = min(9, (int)workingVector13.w);
              workingVector13.w = workingVector8.w ? 1 : workingVector13.w;
              workingVector14.x = (uint)workingVector13.w >> 1;
              workingVector15.z = 1 + -workingVector15.y;
              workingVector16.z = (int)workingVector11.w;
              workingVector13.z = workingVector14.z + -workingVector13.z;
              workingVector14.yw = float2(0,0);
              workingVector15.y = 0;
#endif
              while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
                workingVector16.w = RD_COMPARISON_MASK((int)workingVector16.y >= (int)workingVector14.w);
                if (workingVector16.w != 0) break;
                workingVector16.w = (int)-workingVector15.x + (int)workingVector16.y;
                workingVector16.w = (int)workingVector16.w;
                workingVector18.y = 0.5 + workingVector16.w;
                workingVector18.zw = workingVector15.wy;
                workingVector16.w = 0;
#elif RD_FEATURE_SEASONS == RD_ON
                workingVector15.w = RD_COMPARISON_MASK((int)workingVector15.y >= (int)workingVector13.w);
                if (workingVector15.w != 0) break;
                workingVector15.w = (int)-workingVector14.x + (int)workingVector15.y;
                workingVector15.w = (int)workingVector15.w;
                workingVector17.y = 0.5 + workingVector15.w;
                workingVector17.zw = workingVector14.wy;
                workingVector15.w = 0;
#endif
                while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
                  workingVector17.w = RD_COMPARISON_MASK((int)workingVector16.w >= (int)workingVector14.w);
                  if (workingVector17.w != 0) break;
                  workingVector17.w = (int)-workingVector15.x + (int)workingVector16.w;
                  workingVector17.w = (int)workingVector17.w;
                  workingVector18.x = 0.5 + workingVector17.w;
                  workingVector19.xy = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector18.xy;
                  workingVector19.xy = fragmentVectorConstants1[workingVector12.w+48].xx * workingVector19.xy;
                  workingVector17.xy = workingVector16.xz * fragmentVectorConstants1[workingVector12.w+48].xx + workingVector19.xy;
                  workingVector19.xyzw = materialTexture8.Gather(textureSampler8, workingVector17.xyz).xyzw;
                  workingVector17.xy = workingVector17.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector17.xy = frac(workingVector17.xy);
                  workingVector20.xyzw = -workingVector19.xyzw + workingVector15.zzzz;
                  workingVector20.xyzw = saturate(workingVector20.xyzw * workingVector13.wwww);
                  workingVector21.xyzw = workingVector20.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector20.xyzw = workingVector20.xyzw * workingVector20.xyzw;
                  workingVector20.xyzw = -workingVector21.xyzw * workingVector20.xyzw + float4(1,1,1,1);
                  workingVector20.yz = workingVector20.zy + -workingVector20.wx;
                  workingVector20.xy = workingVector17.xx * workingVector20.yz + workingVector20.wx;
                  workingVector17.w = workingVector20.y + -workingVector20.x;
                  workingVector17.w = workingVector17.y * workingVector17.w + workingVector20.x;
                  workingVector18.w = workingVector18.w + workingVector17.w;
                  workingVector17.w = RD_COMPARISON_MASK(workingVector19.w >= workingVector14.z);
                  workingVector17.w = workingVector17.w ? 1.000000 : 0;
                  workingVector19.xyzw = RD_COMPARISON_MASK(workingVector19.xyzw >= workingVector14.zzzz);
                  workingVector20.xyzw = workingVector19.xyzw ? float4(1,1,1,1) : 0;
                  workingVector19.xy = workingVector19.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector19.xy = workingVector20.zy + workingVector19.xy;
                  workingVector19.xy = workingVector17.xx * workingVector19.xy + workingVector20.wx;
                  workingVector17.x = workingVector19.y + -workingVector19.x;
                  workingVector17.x = workingVector17.y * workingVector17.x + workingVector19.x;
                  workingVector17.xw = workingVector18.zz + workingVector17.xw;
                  workingVector18.z = workingVector9.w ? workingVector17.w : workingVector17.x;
                  workingVector16.w = (int)workingVector16.w + 1;
#elif RD_FEATURE_SEASONS == RD_ON
                  workingVector16.w = RD_COMPARISON_MASK((int)workingVector15.w >= (int)workingVector13.w);
                  if (workingVector16.w != 0) break;
                  workingVector16.w = (int)-workingVector14.x + (int)workingVector15.w;
                  workingVector16.w = (int)workingVector16.w;
                  workingVector17.x = 0.5 + workingVector16.w;
                  workingVector18.xy = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector17.xy;
                  workingVector18.xy = fragmentVectorConstants1[workingVector11.w+48].xx * workingVector18.xy;
                  workingVector16.xy = workingVector15.xz * fragmentVectorConstants1[workingVector11.w+48].xx + workingVector18.xy;
                  workingVector18.xyzw = materialTexture8.Gather(textureSampler8, workingVector16.xyz).xyzw;
                  workingVector16.xy = workingVector16.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector16.xy = frac(workingVector16.xy);
                  workingVector19.xyzw = -workingVector18.xyzw + workingVector14.zzzz;
                  workingVector19.xyzw = saturate(workingVector19.xyzw * workingVector12.wwww);
                  workingVector20.xyzw = workingVector19.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
                  workingVector19.xyzw = workingVector19.xyzw * workingVector19.xyzw;
                  workingVector19.xyzw = -workingVector20.xyzw * workingVector19.xyzw + float4(1,1,1,1);
                  workingVector19.yz = workingVector19.zy + -workingVector19.wx;
                  workingVector19.xy = workingVector16.xx * workingVector19.yz + workingVector19.wx;
                  workingVector16.w = workingVector19.y + -workingVector19.x;
                  workingVector16.w = workingVector16.y * workingVector16.w + workingVector19.x;
                  workingVector17.w = workingVector17.w + workingVector16.w;
                  workingVector16.w = RD_COMPARISON_MASK(workingVector18.w >= workingVector13.z);
                  workingVector16.w = workingVector16.w ? 1.000000 : 0;
                  workingVector18.xyzw = RD_COMPARISON_MASK(workingVector18.xyzw >= workingVector13.zzzz);
                  workingVector19.xyzw = workingVector18.xyzw ? float4(1,1,1,1) : 0;
                  workingVector18.xy = workingVector18.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector18.xy = workingVector19.zy + workingVector18.xy;
                  workingVector18.xy = workingVector16.xx * workingVector18.xy + workingVector19.wx;
                  workingVector16.x = workingVector18.y + -workingVector18.x;
                  workingVector16.x = workingVector16.y * workingVector16.x + workingVector18.x;
                  workingVector16.xw = workingVector17.zz + workingVector16.xw;
                  workingVector17.z = workingVector8.w ? workingVector16.w : workingVector16.x;
                  workingVector15.w = (int)workingVector15.w + 1;
#endif
                }
#if RD_FEATURE_SEASONS == RD_OFF
                workingVector15.yw = workingVector18.wz;
                workingVector16.y = (int)workingVector16.y + 1;
#elif RD_FEATURE_SEASONS == RD_ON
                workingVector14.yw = workingVector17.wz;
                workingVector15.y = (int)workingVector15.y + 1;
#endif
              }
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector13.w = (int)workingVector14.w * (int)workingVector14.w;
              workingVector13.w = (int)workingVector13.w;
              workingVector14.zw = workingVector15.yw / workingVector13.ww;
              workingVector14.xy = min(workingVector14.xy, workingVector14.zw);
              workingVector12.w = workingVector11.w;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector12.w = (int)workingVector13.w * (int)workingVector13.w;
              workingVector12.w = (int)workingVector12.w;
              workingVector13.zw = workingVector14.yw / workingVector12.ww;
              workingVector13.xy = min(workingVector13.xy, workingVector13.zw);
              workingVector11.w = workingVector10.w;
#endif
            } else {
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector12.w = (int)workingVector12.w + 1;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector11.w = (int)workingVector11.w + 1;
#endif
            }
          }
#if RD_FEATURE_SEASONS == RD_OFF
          workingVector13.xy = workingVector14.xy;
          workingVector13.z = workingVector12.w;
          workingVector10.w = (int)workingVector10.w + 1;
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector12.xy = workingVector13.xy;
          workingVector12.z = workingVector11.w;
          workingVector9.w = (int)workingVector9.w + 1;
#endif
        }
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector8.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector8.w = RD_COMPARISON_MASK(0 < (int)workingVector8.w);
        if (workingVector8.w != 0) {
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector12.yyy;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector12.xxx + workingVector14.xyz;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector12.zzz + workingVector14.xyz;
          workingVector14.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector14.xyz;
          workingVector15.xy = workingVector14.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector15.z = 1 + -workingVector15.y;
          workingVector13.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector15.xz;
          workingVector14.xy = RD_COMPARISON_MASK(workingVector13.zw >= float2(0,0));
          workingVector15.xy = RD_COMPARISON_MASK(workingVector13.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector8.w = workingVector14.x ? workingVector15.x : 0;
          workingVector8.w = workingVector14.y ? workingVector8.w : 0;
          workingVector8.w = workingVector15.y ? workingVector8.w : 0;
          if (workingVector8.w != 0) {
            workingVector8.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector7.w);
            workingVector8.w = min(1, workingVector8.w);
            workingVector10.w = -workingVector8.w * workingVector8.w + 1;
            workingVector10.w = sqrt(workingVector10.w);
            workingVector8.w = workingVector10.w / workingVector8.w;
            workingVector8.w = fragmentVectorConstants1[workingVector12.w+48].z * workingVector8.w + fragmentVectorConstants1[workingVector12.w+48].y;
            workingVector8.w = workingVector14.z + -workingVector8.w;
            workingVector8.w = min(1, workingVector8.w);
            workingVector14.xy = workingVector9.ww ? float2(1,1) : float2(2,4);
            workingVector10.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector15.z = 1 + workingVector10.w;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector7.w = (int)RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x;
        workingVector7.w = RD_COMPARISON_MASK(0 < (int)workingVector7.w);
        if (workingVector7.w != 0) {
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.xyz * workingVector11.yyy;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.xyz * workingVector11.xxx + workingVector13.xyz;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.xyz * workingVector11.zzz + workingVector13.xyz;
          workingVector13.xyz = RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.xyz + workingVector13.xyz;
          workingVector14.xy = workingVector13.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector14.z = 1 + -workingVector14.y;
          workingVector12.zw = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy * workingVector14.xz;
          workingVector13.xy = RD_COMPARISON_MASK(workingVector12.zw >= float2(0,0));
          workingVector14.xy = RD_COMPARISON_MASK(workingVector12.zw < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy);
          workingVector7.w = workingVector13.x ? workingVector14.x : 0;
          workingVector7.w = workingVector13.y ? workingVector7.w : 0;
          workingVector7.w = workingVector14.y ? workingVector7.w : 0;
          if (workingVector7.w != 0) {
            workingVector7.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector6.w);
            workingVector7.w = min(1, workingVector7.w);
            workingVector9.w = -workingVector7.w * workingVector7.w + 1;
            workingVector9.w = sqrt(workingVector9.w);
            workingVector7.w = workingVector9.w / workingVector7.w;
            workingVector7.w = fragmentVectorConstants1[workingVector11.w+48].z * workingVector7.w + fragmentVectorConstants1[workingVector11.w+48].y;
            workingVector7.w = workingVector13.z + -workingVector7.w;
            workingVector7.w = min(1, workingVector7.w);
            workingVector13.xy = workingVector8.ww ? float2(1,1) : float2(2,4);
            workingVector9.w = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
            workingVector14.z = 1 + workingVector9.w;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector10.w = 0;
#endif
            workingVector11.w = 0;
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector12.w = 0;
#endif
            while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector14.z = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector14.x);
              if (workingVector14.z != 0) break;
              workingVector14.z = (int)workingVector10.w + (int)workingVector12.w;
              workingVector14.z = (int)workingVector14.z;
              workingVector16.y = 0.5 + workingVector14.z;
              workingVector14.z = workingVector11.w;
              workingVector14.w = 0;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector13.z = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector13.x);
              if (workingVector13.z != 0) break;
              workingVector13.z = (int)workingVector9.w + (int)workingVector11.w;
              workingVector13.z = (int)workingVector13.z;
              workingVector15.y = 0.5 + workingVector13.z;
              workingVector13.z = workingVector10.w;
              workingVector13.w = 0;
#endif
              while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
                workingVector15.w = RD_COMPARISON_MASK((int)workingVector14.w >= (int)workingVector14.x);
                if (workingVector15.w != 0) break;
                workingVector15.w = (int)workingVector10.w + (int)workingVector14.w;
                workingVector15.w = (int)workingVector15.w;
                workingVector16.x = 0.5 + workingVector15.w;
                workingVector16.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector16.xy;
                workingVector15.xy = workingVector16.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector13.zw;
                if (workingVector9.w != 0) {
                  workingVector15.w = materialTexture8.SampleLevel(textureSampler8, workingVector15.xyz, 0).x;
                  workingVector15.w = RD_COMPARISON_MASK(workingVector15.w >= workingVector8.w);
                  workingVector15.w = workingVector15.w ? 1.000000 : 0;
                  workingVector14.z = workingVector15.w + workingVector14.z;
#elif RD_FEATURE_SEASONS == RD_ON
                workingVector14.w = RD_COMPARISON_MASK((int)workingVector13.w >= (int)workingVector13.x);
                if (workingVector14.w != 0) break;
                workingVector14.w = (int)workingVector9.w + (int)workingVector13.w;
                workingVector14.w = (int)workingVector14.w;
                workingVector15.x = 0.5 + workingVector14.w;
                workingVector15.xz = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.zz * workingVector15.xy;
                workingVector14.xy = workingVector15.xz * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.yy + workingVector12.zw;
                if (workingVector8.w != 0) {
                  workingVector14.w = materialTexture8.SampleLevel(textureSampler8, workingVector14.xyz, 0).x;
                  workingVector14.w = RD_COMPARISON_MASK(workingVector14.w >= workingVector7.w);
                  workingVector14.w = workingVector14.w ? 1.000000 : 0;
                  workingVector13.z = workingVector14.w + workingVector13.z;
#endif
                } else {
#if RD_FEATURE_SEASONS == RD_OFF
                  workingVector17.xyzw = materialTexture8.Gather(textureSampler8, workingVector15.xyz).xyzw;
                  workingVector15.xy = workingVector15.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector15.xy = frac(workingVector15.xy);
                  workingVector17.xyzw = RD_COMPARISON_MASK(workingVector17.xyzw >= workingVector8.wwww);
                  workingVector18.xyzw = workingVector17.xyzw ? float4(1,1,1,1) : 0;
                  workingVector16.xz = workingVector17.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector16.xz = workingVector18.zy + workingVector16.xz;
                  workingVector15.xw = workingVector15.xx * workingVector16.xz + workingVector18.wx;
                  workingVector15.w = workingVector15.w + -workingVector15.x;
                  workingVector15.x = workingVector15.y * workingVector15.w + workingVector15.x;
                  workingVector14.z = workingVector15.x + workingVector14.z;
#elif RD_FEATURE_SEASONS == RD_ON
                  workingVector16.xyzw = materialTexture8.Gather(textureSampler8, workingVector14.xyz).xyzw;
                  workingVector14.xy = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                  workingVector14.xy = frac(workingVector14.xy);
                  workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector7.wwww);
                  workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                  workingVector15.xz = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                  workingVector15.xz = workingVector17.zy + workingVector15.xz;
                  workingVector14.xw = workingVector14.xx * workingVector15.xz + workingVector17.wx;
                  workingVector14.w = workingVector14.w + -workingVector14.x;
                  workingVector14.x = workingVector14.y * workingVector14.w + workingVector14.x;
                  workingVector13.z = workingVector14.x + workingVector13.z;
#endif
                }
#if RD_FEATURE_SEASONS == RD_OFF
                workingVector14.w = (int)workingVector14.w + 1;
#elif RD_FEATURE_SEASONS == RD_ON
                workingVector13.w = (int)workingVector13.w + 1;
#endif
              }
#if RD_FEATURE_SEASONS == RD_OFF
              workingVector11.w = workingVector14.z;
              workingVector12.w = (int)workingVector12.w + 1;
#elif RD_FEATURE_SEASONS == RD_ON
              workingVector10.w = workingVector13.z;
              workingVector11.w = (int)workingVector11.w + 1;
#endif
            }
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector8.w = workingVector11.w / workingVector14.y;
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector7.w = workingVector10.w / workingVector13.y;
#endif
          } else {
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector8.w = 1;
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector7.w = 1;
#endif
          }
#if RD_FEATURE_SEASONS == RD_OFF
        } else {
          workingVector8.w = 1;
        }
        workingVector10.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector10.w = RD_COMPARISON_MASK(0 < (int)workingVector10.w);
        workingVector11.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector11.w = RD_COMPARISON_MASK(0 < (int)workingVector11.w);
        workingVector10.w = workingVector10.w ? workingVector11.w : 0;
        if (workingVector10.w != 0) {
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector12.yyyy;
          workingVector14.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector12.xxxx + workingVector14.xyzw;
          workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector12.zzzz + workingVector14.xyzw;
          workingVector12.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector12.xyzw;
          workingVector12.xyzw = workingVector12.xyzw / workingVector12.wwww;
          workingVector7.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector7.w);
          workingVector7.w = min(1, workingVector7.w);
          workingVector10.w = -workingVector7.w * workingVector7.w + 1;
          workingVector10.w = sqrt(workingVector10.w);
          workingVector7.w = workingVector10.w / workingVector7.w;
          workingVector7.w = fragmentVectorConstants1[workingVector12.w+48].z * workingVector7.w + fragmentVectorConstants1[workingVector12.w+48].y;
          workingVector7.w = workingVector7.w / workingVector12.w;
          workingVector7.w = workingVector12.z + -workingVector7.w;
          workingVector12.xy = workingVector12.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector12.z = 1 + -workingVector12.y;
          workingVector10.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector10.w = (int)workingVector10.w;
          workingVector10.w = max(1, (int)workingVector10.w);
          workingVector10.w = min(9, (int)workingVector10.w);
          workingVector10.w = workingVector9.w ? 1 : workingVector10.w;
          workingVector11.w = (uint)workingVector10.w >> 1;
          workingVector14.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector12.yw = float2(0,0);
          while (true) {
            workingVector13.z = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector10.w);
            if (workingVector13.z != 0) break;
            workingVector13.z = (int)-workingVector11.w + (int)workingVector12.w;
            workingVector13.z = (int)workingVector13.z;
            workingVector15.y = 0.5 + workingVector13.z;
            workingVector13.z = workingVector12.y;
            workingVector13.w = 0;
            while (true) {
              workingVector14.w = RD_COMPARISON_MASK((int)workingVector13.w >= (int)workingVector10.w);
              if (workingVector14.w != 0) break;
              workingVector14.w = (int)-workingVector11.w + (int)workingVector13.w;
              workingVector14.w = (int)workingVector14.w;
              workingVector15.x = 0.5 + workingVector14.w;
              workingVector15.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector15.xy;
              workingVector15.xz = fragmentVectorConstants1[workingVector12.w+48].xx * workingVector15.xz;
              workingVector14.xy = workingVector12.xz * fragmentVectorConstants1[workingVector12.w+48].xx + workingVector15.xz;
              if (workingVector9.w != 0) {
                workingVector14.w = materialTexture8.SampleLevel(textureSampler8, workingVector14.xyz, 0).x;
                workingVector14.w = RD_COMPARISON_MASK(workingVector14.w >= workingVector7.w);
                workingVector14.w = workingVector14.w ? 1.000000 : 0;
                workingVector13.z = workingVector14.w + workingVector13.z;
              } else {
                workingVector16.xyzw = materialTexture8.Gather(textureSampler8, workingVector14.xyz).xyzw;
                workingVector14.xy = workingVector14.xy * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.zz + float2(0.5,0.5);
                workingVector14.xy = frac(workingVector14.xy);
                workingVector16.xyzw = RD_COMPARISON_MASK(workingVector16.xyzw >= workingVector7.wwww);
                workingVector17.xyzw = workingVector16.xyzw ? float4(1,1,1,1) : 0;
                workingVector15.xz = workingVector16.wx ? float2(-1,-1) : float2(-0,-0);
                workingVector15.xz = workingVector17.zy + workingVector15.xz;
                workingVector14.xw = workingVector14.xx * workingVector15.xz + workingVector17.wx;
                workingVector14.w = workingVector14.w + -workingVector14.x;
                workingVector14.x = workingVector14.y * workingVector14.w + workingVector14.x;
                workingVector13.z = workingVector14.x + workingVector13.z;
              }
              workingVector13.w = (int)workingVector13.w + 1;
            }
            workingVector12.y = workingVector13.z;
            workingVector12.w = (int)workingVector12.w + 1;
          }
          workingVector7.w = (int)workingVector10.w * (int)workingVector10.w;
          workingVector7.w = (int)workingVector7.w;
          workingVector7.w = workingVector12.y / workingVector7.w;
          workingVector9.w = RD_COMPARISON_MASK(workingVector7.w < 1);
          workingVector10.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector7.w = max(workingVector10.w, workingVector7.w);
          workingVector7.w = min(1, workingVector7.w);
          workingVector7.w = workingVector9.w ? workingVector7.w : 1;
#endif
        } else {
          workingVector7.w = 1;
        }
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector7.w = min(workingVector8.w, workingVector7.w);
        workingVector7.w = min(workingVector13.y, workingVector7.w);
        workingVector8.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector8.w = min(8, workingVector8.w);
        workingVector8.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector8.w;
        workingVector8.w = max(0, workingVector8.w);
        workingVector9.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector8.w;
        workingVector8.w = -workingVector8.w + -workingVector5.z;
        workingVector9.w = 1 / workingVector9.w;
        workingVector8.w = saturate(workingVector9.w * workingVector8.w);
        workingVector9.w = workingVector8.w * -2 + 3;
        workingVector8.w = workingVector8.w * workingVector8.w;
        workingVector8.w = workingVector9.w * workingVector8.w;
        workingVector9.w = 1 + -workingVector7.w;
        workingVector7.w = workingVector8.w * workingVector9.w + workingVector7.w;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector9.w = (int)RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x;
        workingVector9.w = RD_COMPARISON_MASK(0 < (int)workingVector9.w);
        workingVector10.w = (int)RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y;
        workingVector10.w = RD_COMPARISON_MASK(0 < (int)workingVector10.w);
        workingVector9.w = workingVector9.w ? workingVector10.w : 0;
        if (workingVector9.w != 0) {
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.xyzw * workingVector11.yyyy;
          workingVector13.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.xyzw * workingVector11.xxxx + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.xyzw * workingVector11.zzzz + workingVector13.xyzw;
          workingVector11.xyzw = RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.xyzw + workingVector11.xyzw;
          workingVector11.xyzw = workingVector11.xyzw / workingVector11.wwww;
          workingVector6.w = max(RD_UNIFORM_ND_LFLOOR.x, workingVector6.w);
          workingVector6.w = min(1, workingVector6.w);
          workingVector9.w = -workingVector6.w * workingVector6.w + 1;
          workingVector9.w = sqrt(workingVector9.w);
          workingVector6.w = workingVector9.w / workingVector6.w;
          workingVector6.w = fragmentVectorConstants1[workingVector11.w+48].z * workingVector6.w + fragmentVectorConstants1[workingVector11.w+48].y;
          workingVector6.w = workingVector6.w / workingVector11.w;
          workingVector6.w = workingVector11.z + -workingVector6.w;
          workingVector11.xy = workingVector11.xy * float2(0.5,0.5) + float2(0.5,0.5);
          workingVector11.z = 1 + -workingVector11.y;
          workingVector9.w = 0.5 + RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z;
          workingVector9.w = (int)workingVector9.w;
          workingVector9.w = max(1, (int)workingVector9.w);
          workingVector9.w = min(9, (int)workingVector9.w);
          workingVector9.w = workingVector8.w ? 1 : workingVector9.w;
          workingVector10.w = (uint)workingVector9.w >> 1;
          workingVector13.z = dot(RD_UNIFORM_CASCADES_PER_SET.xyzw, float4(1,1,1,1));
          workingVector11.yw = float2(0,0);
          while (true) {
            workingVector12.z = RD_COMPARISON_MASK((int)workingVector11.w >= (int)workingVector9.w);
            if (workingVector12.z != 0) break;
            workingVector12.z = (int)-workingVector10.w + (int)workingVector11.w;
            workingVector12.z = (int)workingVector12.z;
            workingVector14.y = 0.5 + workingVector12.z;
            workingVector12.z = workingVector11.y;
            workingVector12.w = 0;
            while (true) {
              workingVector13.w = RD_COMPARISON_MASK((int)workingVector12.w >= (int)workingVector9.w);
              if (workingVector13.w != 0) break;
              workingVector13.w = (int)-workingVector10.w + (int)workingVector12.w;
              workingVector13.w = (int)workingVector13.w;
              workingVector14.x = 0.5 + workingVector13.w;
              workingVector14.xz = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.xx * workingVector14.xy;
              workingVector14.xz = fragmentVectorConstants1[workingVector11.w+48].xx * workingVector14.xz;
              workingVector13.xy = workingVector11.xz * fragmentVectorConstants1[workingVector11.w+48].xx + workingVector14.xz;
              if (workingVector8.w != 0) {
                workingVector13.w = materialTexture8.SampleLevel(textureSampler8, workingVector13.xyz, 0).x;
                workingVector13.w = RD_COMPARISON_MASK(workingVector13.w >= workingVector6.w);
                workingVector13.w = workingVector13.w ? 1.000000 : 0;
                workingVector12.z = workingVector13.w + workingVector12.z;
              } else {
                workingVector15.xyzw = materialTexture8.Gather(textureSampler8, workingVector13.xyz).xyzw;
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
              }
              workingVector12.w = (int)workingVector12.w + 1;
            }
            workingVector11.y = workingVector12.z;
            workingVector11.w = (int)workingVector11.w + 1;
          }
          workingVector6.w = (int)workingVector9.w * (int)workingVector9.w;
          workingVector6.w = (int)workingVector6.w;
          workingVector6.w = workingVector11.y / workingVector6.w;
          workingVector8.w = RD_COMPARISON_MASK(workingVector6.w < 1);
          workingVector9.w = 1 + -RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w;
          workingVector6.w = max(workingVector9.w, workingVector6.w);
          workingVector6.w = min(1, workingVector6.w);
          workingVector6.w = workingVector8.w ? workingVector6.w : 1;
        } else {
          workingVector6.w = 1;
        }
        workingVector6.w = min(workingVector7.w, workingVector6.w);
        workingVector6.w = min(workingVector12.y, workingVector6.w);
        workingVector7.w = 0.100000001 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y;
        workingVector7.w = min(8, workingVector7.w);
        workingVector7.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector7.w;
        workingVector7.w = max(0, workingVector7.w);
        workingVector8.w = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y + -workingVector7.w;
        workingVector7.w = -workingVector7.w + -workingVector4.z;
        workingVector8.w = 1 / workingVector8.w;
        workingVector7.w = saturate(workingVector8.w * workingVector7.w);
        workingVector8.w = workingVector7.w * -2 + 3;
        workingVector7.w = workingVector7.w * workingVector7.w;
        workingVector7.w = workingVector8.w * workingVector7.w;
        workingVector8.w = 1 + -workingVector6.w;
        workingVector6.w = workingVector7.w * workingVector8.w + workingVector6.w;
#endif
      } else {
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector7.w = 1;
        workingVector13.x = 1;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector6.w = 1;
        workingVector12.x = 1;
#endif
      }
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector12.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector12.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector12.xyz;
      workingVector12.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector12.xyz;
      workingVector8.w = dot(workingVector12.xyz, workingVector12.xyz);
      workingVector8.w = rsqrt(workingVector8.w);
      workingVector13.yzw = workingVector12.xyz * workingVector8.www;
      workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector14.xyz = workingVector14.xyz * workingVector5.www;
      workingVector14.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector14.xyz;
      workingVector5.w = dot(workingVector6.xyz, workingVector13.yzw);
      workingVector9.w = max(0, workingVector5.w);
      workingVector10.w = dot(workingVector6.xyz, -workingVector11.xyz);
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector11.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.yyy * RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.xxx + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.zzz + workingVector11.xyz;
      workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.www + workingVector11.xyz;
      workingVector7.w = dot(workingVector11.xyz, workingVector11.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector12.yzw = workingVector11.xyz * workingVector7.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.xyz * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.www;
      workingVector13.xyz = workingVector13.xyz * workingVector4.www;
      workingVector13.xyz = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.xxx * workingVector13.xyz;
      workingVector4.w = dot(workingVector5.xyz, workingVector12.yzw);
      workingVector8.w = max(0, workingVector4.w);
      workingVector9.w = dot(workingVector5.xyz, -workingVector10.xyz);
      workingVector9.w = max(0, workingVector9.w);
      workingVector4.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector4.w;
      workingVector10.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
      workingVector10.w = workingVector10.w * workingVector10.w;
      workingVector4.w = workingVector4.w / workingVector10.w;
      workingVector4.w = max(0, workingVector4.w);
      workingVector4.w = workingVector4.w + -workingVector8.w;
      workingVector4.w = workingVector3.x * workingVector4.w + workingVector8.w;
      workingVector11.w = dot(-workingVector5.xyz, workingVector12.yzw);
      workingVector11.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector11.w;
      workingVector10.w = workingVector11.w / workingVector10.w;
#endif
      workingVector10.w = max(0, workingVector10.w);
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector5.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector5.w;
      workingVector11.w = 1 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y;
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector3.x = workingVector10.w * workingVector3.x;
      workingVector11.xyz = workingVector11.xyz * workingVector7.www + -workingVector10.xyz;
      workingVector7.w = dot(workingVector11.xyz, workingVector11.xyz);
      workingVector7.w = rsqrt(workingVector7.w);
      workingVector11.xyz = workingVector11.xyz * workingVector7.www;
      workingVector7.w = max(0.0500000007, workingVector2.z);
      workingVector7.w = workingVector7.w * workingVector7.w;
      workingVector10.w = workingVector7.w * workingVector7.w;
      workingVector11.w = dot(workingVector5.xyz, workingVector11.xyz);
      workingVector11.w = max(0, workingVector11.w);
      workingVector12.y = workingVector7.w * workingVector7.w + -1;
#endif
      workingVector11.w = workingVector11.w * workingVector11.w;
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector5.w = workingVector5.w / workingVector11.w;
      workingVector5.w = max(0, workingVector5.w);
      workingVector5.w = workingVector5.w + -workingVector9.w;
      workingVector5.w = workingVector4.x * workingVector5.w + workingVector9.w;
      workingVector12.w = dot(-workingVector6.xyz, workingVector13.yzw);
      workingVector12.w = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + workingVector12.w;
      workingVector11.w = workingVector12.w / workingVector11.w;
      workingVector11.w = max(0, workingVector11.w);
      workingVector4.x = workingVector11.w * workingVector4.x;
      workingVector12.xyz = workingVector12.xyz * workingVector8.www + -workingVector11.xyz;
      workingVector8.w = dot(workingVector12.xyz, workingVector12.xyz);
      workingVector8.w = rsqrt(workingVector8.w);
      workingVector12.xyz = workingVector12.xyz * workingVector8.www;
      workingVector8.w = max(0.0500000007, workingVector3.z);
      workingVector8.w = workingVector8.w * workingVector8.w;
      workingVector11.w = workingVector8.w * workingVector8.w;
      workingVector12.w = dot(workingVector6.xyz, workingVector12.xyz);
      workingVector12.w = max(0, workingVector12.w);
      workingVector13.y = workingVector8.w * workingVector8.w + -1;
      workingVector12.w = workingVector12.w * workingVector12.w;
      workingVector12.w = workingVector12.w * workingVector13.y + 1;
      workingVector12.w = workingVector12.w * workingVector12.w;
      workingVector12.w = 3.14159274 * workingVector12.w;
      workingVector11.w = workingVector11.w / workingVector12.w;
      workingVector12.w = 0.5 * workingVector8.w;
      workingVector8.w = -workingVector8.w * 0.5 + 1;
      workingVector13.y = workingVector10.w * workingVector8.w + workingVector12.w;
      workingVector13.y = 9.99999975e-005 + workingVector13.y;
      workingVector13.y = workingVector10.w / workingVector13.y;
      workingVector8.w = workingVector9.w * workingVector8.w + workingVector12.w;
      workingVector8.w = 9.99999975e-005 + workingVector8.w;
      workingVector8.w = workingVector9.w / workingVector8.w;
      workingVector8.w = workingVector13.y * workingVector8.w;
      workingVector11.x = dot(-workingVector11.xyz, workingVector12.xyz);
      workingVector11.x = max(0, workingVector11.x);
      workingVector12.xyz = float3(1,1,1) + -workingVector10.xyz;
      workingVector11.x = 1 + -workingVector11.x;
      workingVector11.x = max(0, workingVector11.x);
      workingVector11.y = workingVector11.x * workingVector11.x;
      workingVector11.y = workingVector11.y * workingVector11.y;
      workingVector11.x = workingVector11.y * workingVector11.x;
      workingVector11.xyz = workingVector12.xyz * workingVector11.xxx + workingVector10.xyz;
      workingVector12.xyz = workingVector3.yyy * workingVector1.xyz;
      workingVector13.yzw = float3(1,1,1) + -workingVector11.xyz;
      workingVector13.yzw = workingVector13.yzw * workingVector5.www;
      workingVector12.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector12.xyz;
      workingVector13.yzw = workingVector13.yzw * workingVector12.xyz;
      workingVector12.xyz = workingVector12.xyz * workingVector4.xxx;
      workingVector11.xyz = workingVector11.xyz * workingVector11.www;
      workingVector11.xyz = workingVector11.xyz * workingVector8.www;
      workingVector4.x = workingVector10.w * workingVector9.w;
      workingVector4.x = workingVector4.x * 4 + 9.99999975e-005;
      workingVector11.xyz = workingVector11.xyz / workingVector4.xxx;
      workingVector11.xyz = workingVector11.xyz * workingVector9.www;
      workingVector12.xyz = workingVector12.xyz * workingVector13.xxx;
      workingVector12.xyz = workingVector13.yzw * workingVector7.www + workingVector12.xyz;
      workingVector12.xyz = workingVector12.xyz * workingVector14.xyz;
      workingVector12.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector12.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector7.www;
      workingVector11.xyz = workingVector11.xyz * workingVector14.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector11.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector11.w = workingVector11.w * workingVector12.y + 1;
      workingVector11.w = workingVector11.w * workingVector11.w;
      workingVector11.w = 3.14159274 * workingVector11.w;
      workingVector10.w = workingVector10.w / workingVector11.w;
      workingVector11.w = 0.5 * workingVector7.w;
      workingVector7.w = -workingVector7.w * 0.5 + 1;
      workingVector12.y = workingVector9.w * workingVector7.w + workingVector11.w;
      workingVector12.y = 9.99999975e-005 + workingVector12.y;
      workingVector12.y = workingVector9.w / workingVector12.y;
      workingVector7.w = workingVector8.w * workingVector7.w + workingVector11.w;
      workingVector7.w = 9.99999975e-005 + workingVector7.w;
      workingVector7.w = workingVector8.w / workingVector7.w;
      workingVector7.w = workingVector12.y * workingVector7.w;
      workingVector10.x = dot(-workingVector10.xyz, workingVector11.xyz);
      workingVector10.x = max(0, workingVector10.x);
      workingVector11.xyz = float3(1,1,1) + -workingVector9.xyz;
      workingVector10.x = 1 + -workingVector10.x;
      workingVector10.x = max(0, workingVector10.x);
      workingVector10.y = workingVector10.x * workingVector10.x;
      workingVector10.y = workingVector10.y * workingVector10.y;
      workingVector10.x = workingVector10.y * workingVector10.x;
      workingVector10.xyz = workingVector11.xyz * workingVector10.xxx + workingVector9.xyz;
      workingVector11.xyz = workingVector2.yyy * workingVector0.xyz;
      workingVector12.yzw = float3(1,1,1) + -workingVector10.xyz;
      workingVector12.yzw = workingVector12.yzw * workingVector4.www;
      workingVector11.xyz = float3(0.318309873,0.318309873,0.318309873) * workingVector11.xyz;
      workingVector12.yzw = workingVector12.yzw * workingVector11.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector3.xxx;
      workingVector10.xyz = workingVector10.xyz * workingVector10.www;
      workingVector10.xyz = workingVector10.xyz * workingVector7.www;
      workingVector3.x = workingVector9.w * workingVector8.w;
      workingVector3.x = workingVector3.x * 4 + 9.99999975e-005;
      workingVector10.xyz = workingVector10.xyz / workingVector3.xxx;
      workingVector10.xyz = workingVector10.xyz * workingVector8.www;
      workingVector11.xyz = workingVector11.xyz * workingVector12.xxx;
      workingVector11.xyz = workingVector12.yzw * workingVector6.www + workingVector11.xyz;
      workingVector11.xyz = workingVector11.xyz * workingVector13.xyz;
      workingVector11.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.xxx * workingVector11.xyz;
      workingVector10.xyz = workingVector10.xyz * workingVector6.www;
      workingVector10.xyz = workingVector10.xyz * workingVector13.xyz;
      workingVector10.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.yyy * workingVector10.xyz;
#endif
    } else {
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector12.xyz = float3(0,0,0);
#endif
      workingVector11.xyz = float3(0,0,0);
#if RD_FEATURE_SEASONS == RD_ON
      workingVector10.xyz = float3(0,0,0);
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector4.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    if (workingVector4.x != 0) {
      workingVector7.xyz = float3(-0.5,-0.5,-0.5) + workingVector7.xyz;
      workingVector7.xyz = workingVector2.xyw * float3(0.200000003,0.200000003,0.200000003) + workingVector7.xyz;
      workingVector13.xyz = floor(workingVector7.xyz);
      workingVector13.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
      workingVector13.xyz = floor(workingVector13.xyz);
      workingVector13.xyz = (int3)workingVector13.xyz;
      bitMask.x = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector4.x = (((uint)workingVector13.y << 16) & bitMask.x) | ((uint)workingVector13.x & ~bitMask.x);
      workingVector5.w = (int)workingVector13.z & 0x0000ffff;
      workingVector13.xyz = (int3)workingVector13.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector14.xyz = (uint3)workingVector13.xyz >> int3(24,24,24);
      workingVector13.xyz = (int3)workingVector13.xyz ^ (int3)workingVector14.xyz;
      workingVector13.xyz = (int3)workingVector13.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector7.w = (int)workingVector13.x ^ 0x88b16480;
      workingVector7.w = (int)workingVector7.w * 0x5bd1e995;
      workingVector7.w = (int)workingVector13.y ^ (int)workingVector7.w;
      workingVector7.w = (int)workingVector7.w * 0x5bd1e995;
      workingVector7.w = (int)workingVector13.z ^ (int)workingVector7.w;
      workingVector7.w = (int)workingVector7.w * 0x5bd1e995;
      workingVector7.w = (int)workingVector7.w ^ 0;
      workingVector8.w = (uint)workingVector7.w >> 13;
      workingVector7.w = (int)workingVector7.w ^ (int)workingVector8.w;
      workingVector7.w = (int)workingVector7.w * 0x5bd1e995;
      workingVector8.w = (uint)workingVector7.w >> 15;
      workingVector7.w = (int)workingVector7.w ^ (int)workingVector8.w;
      workingVector8.w = (uint)workingVector7.w >> 16;
      workingVector7.w = (int)workingVector7.w ^ (int)workingVector8.w;
      workingVector7.w = (int)workingVector7.w & 0x0000ffff;
      workingVector8.w = workingVector7.w ? 0 : 1;
      workingVector7.w = (int)workingVector7.w | (int)workingVector8.w;
      workingVector8.w = (uint)RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x;
      workingVector8.w = (int)workingVector8.w + -1;
      workingVector9.w = (int)workingVector7.w & (int)workingVector8.w;
      workingVector13.x = workingVector9.w;
      workingVector13.yzw = float3(0,0,0);
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector3.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w);
    if (workingVector3.x != 0) {
      workingVector6.xyz = float3(-0.5,-0.5,-0.5) + workingVector6.xyz;
      workingVector6.xyz = workingVector1.xyw * float3(0.200000003,0.200000003,0.200000003) + workingVector6.xyz;
      workingVector12.xyz = floor(workingVector6.xyz);
      workingVector12.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xyz;
      workingVector12.xyz = floor(workingVector12.xyz);
      workingVector12.xyz = (int3)workingVector12.xyz;
      bitMask.x = ((~(-1 << 16)) << 16) & 0xffffffff;  workingVector3.x = (((uint)workingVector12.y << 16) & bitMask.x) | ((uint)workingVector12.x & ~bitMask.x);
      workingVector4.w = (int)workingVector12.z & 0x0000ffff;
      workingVector12.xyz = (int3)workingVector12.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector13.xyz = (uint3)workingVector12.xyz >> int3(24,24,24);
      workingVector12.xyz = (int3)workingVector12.xyz ^ (int3)workingVector13.xyz;
      workingVector12.xyz = (int3)workingVector12.xyz * int3(0x5bd1e995,0x5bd1e995,0x5bd1e995);
      workingVector6.w = (int)workingVector12.x ^ 0x88b16480;
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
      workingVector6.w = (int)workingVector12.y ^ (int)workingVector6.w;
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
      workingVector6.w = (int)workingVector12.z ^ (int)workingVector6.w;
      workingVector6.w = (int)workingVector6.w * 0x5bd1e995;
      workingVector6.w = (int)workingVector6.w ^ 0;
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
      workingVector12.x = workingVector8.w;
      workingVector12.yzw = float3(0,0,0);
#endif
      while (true) {
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector13.y >= 8);
        if (workingVector10.w != 0) break;
        workingVector14.x = sampledResource10[workingVector13.x].val[0/4];
        workingVector14.y = sampledResource10[workingVector13.x].val[0/4+1];
        workingVector14.z = sampledResource10[workingVector13.x].val[0/4+2];
        workingVector14.w = sampledResource10[workingVector13.x].val[0/4+3];
        workingVector10.w = (int)workingVector14.z & 0x0000ffff;
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector7.w == (int)workingVector10.w);
        workingVector12.w = RD_COMPARISON_MASK((int)workingVector4.x == (int)workingVector14.x);
        workingVector10.w = workingVector10.w ? workingVector12.w : 0;
        workingVector12.w = RD_COMPARISON_MASK((int)workingVector5.w == (int)workingVector14.y);
        workingVector10.w = workingVector10.w ? workingVector12.w : 0;
        workingVector12.w = workingVector10.w ? workingVector14.w : workingVector13.z;
        workingVector14.x = workingVector13.w ? workingVector13.z : workingVector12.w;
        workingVector14.y = (int)workingVector10.w | (int)workingVector13.w;
        workingVector10.w = (int)workingVector13.x + 1;
        workingVector13.x = (int)workingVector8.w & (int)workingVector10.w;
        workingVector10.w = (int)workingVector11.w | (int)workingVector14.y;
        if (workingVector10.w != 0) {
          workingVector13.zw = workingVector14.xy;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector12.y >= 8);
        if (workingVector9.w != 0) break;
        workingVector13.x = sampledResource10[workingVector12.x].val[0/4];
        workingVector13.y = sampledResource10[workingVector12.x].val[0/4+1];
        workingVector13.z = sampledResource10[workingVector12.x].val[0/4+2];
        workingVector13.w = sampledResource10[workingVector12.x].val[0/4+3];
        workingVector9.w = (int)workingVector13.z & 0x0000ffff;
        workingVector10.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
        workingVector9.w = RD_COMPARISON_MASK((int)workingVector6.w == (int)workingVector9.w);
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector3.x == (int)workingVector13.x);
        workingVector9.w = workingVector9.w ? workingVector11.w : 0;
        workingVector11.w = RD_COMPARISON_MASK((int)workingVector4.w == (int)workingVector13.y);
        workingVector9.w = workingVector9.w ? workingVector11.w : 0;
        workingVector11.w = workingVector9.w ? workingVector13.w : workingVector12.z;
        workingVector13.x = workingVector12.w ? workingVector12.z : workingVector11.w;
        workingVector13.y = (int)workingVector9.w | (int)workingVector12.w;
        workingVector9.w = (int)workingVector12.x + 1;
        workingVector12.x = (int)workingVector7.w & (int)workingVector9.w;
        workingVector9.w = (int)workingVector10.w | (int)workingVector13.y;
        if (workingVector9.w != 0) {
          workingVector12.zw = workingVector13.xy;
#endif
          break;
        }
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector13.y = (int)workingVector13.y + 1;
        workingVector13.zw = workingVector14.xy;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector12.y = (int)workingVector12.y + 1;
        workingVector12.zw = workingVector13.xy;
#endif
      }
#if RD_FEATURE_SEASONS == RD_OFF
      if (workingVector13.w != 0) {
        workingVector13.xyw = float3(0.0625,0.0625,0.0625) * workingVector7.xyz;
        workingVector13.xyw = floor(workingVector13.xyw);
        workingVector7.xyz = -workingVector13.xyw * float3(16,16,16) + workingVector7.xyz;
        workingVector4.x = (uint)workingVector13.z >> 2;
        workingVector14.xyz = RD_COMPARISON_MASK(abs(workingVector2.xyw) >= float3(1,1,1));
        workingVector5.w = (int)workingVector14.y | (int)workingVector14.x;
        workingVector5.w = (int)workingVector14.z | (int)workingVector5.w;
        if (workingVector5.w != 0) {
          workingVector5.w = dot(workingVector7.xyz, abs(workingVector2.xyw));
          workingVector7.w = dot(workingVector7.yzx, abs(workingVector2.xyw));
          workingVector8.w = dot(workingVector7.zxy, abs(workingVector2.xyw));
          workingVector9.w = workingVector2.x + workingVector2.y;
          workingVector1.w = workingVector2.z * workingVector1.w + workingVector9.w;
          workingVector1.w = RD_COMPARISON_MASK(0 < workingVector1.w);
          workingVector2.z = ceil(workingVector5.w);
          workingVector5.w = floor(workingVector5.w);
          workingVector1.w = workingVector1.w ? workingVector2.z : workingVector5.w;
          workingVector2.z = floor(workingVector7.w);
          workingVector5.w = floor(workingVector8.w);
          workingVector14.xyz = abs(workingVector2.wxy) * workingVector2.zzz;
          workingVector14.xyz = abs(workingVector2.xyw) * workingVector1.www + workingVector14.xyz;
          workingVector14.xyz = abs(workingVector2.ywx) * workingVector5.www + workingVector14.xyz;
          workingVector15.xyz = workingVector14.xyz + abs(workingVector2.wxy);
          workingVector16.xyz = workingVector14.xyz + abs(workingVector2.ywx);
          workingVector17.xyz = workingVector15.xyz + abs(workingVector2.ywx);
          workingVector1.w = workingVector7.w + -workingVector2.z;
          workingVector2.z = workingVector8.w + -workingVector5.w;
          workingVector5.w = 1 + -workingVector1.w;
          workingVector7.w = 1 + -workingVector2.z;
          workingVector8.w = workingVector7.w * workingVector5.w;
          workingVector7.w = workingVector7.w * workingVector1.w;
          workingVector5.w = workingVector5.w * workingVector2.z;
          workingVector1.w = workingVector2.z * workingVector1.w;
          workingVector18.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(0,0,0));
          workingVector2.z = workingVector18.y ? workingVector18.x : 0;
          workingVector2.z = workingVector18.z ? workingVector2.z : 0;
          workingVector18.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(16,16,16));
          workingVector9.w = workingVector18.y ? workingVector18.x : 0;
          workingVector9.w = workingVector18.z ? workingVector9.w : 0;
          workingVector2.z = (int)workingVector2.z & (int)workingVector9.w;
          if (workingVector2.z != 0) {
#elif RD_FEATURE_SEASONS == RD_ON
      if (workingVector12.w != 0) {
        workingVector12.xyw = float3(0.0625,0.0625,0.0625) * workingVector6.xyz;
        workingVector12.xyw = floor(workingVector12.xyw);
        workingVector6.xyz = -workingVector12.xyw * float3(16,16,16) + workingVector6.xyz;
        workingVector3.x = (uint)workingVector12.z >> 2;
        workingVector13.xyz = RD_COMPARISON_MASK(abs(workingVector1.xyw) >= float3(1,1,1));
        workingVector4.w = (int)workingVector13.y | (int)workingVector13.x;
        workingVector4.w = (int)workingVector13.z | (int)workingVector4.w;
        if (workingVector4.w != 0) {
          workingVector4.w = dot(workingVector6.xyz, abs(workingVector1.xyw));
          workingVector6.w = dot(workingVector6.yzx, abs(workingVector1.xyw));
          workingVector7.w = dot(workingVector6.zxy, abs(workingVector1.xyw));
          workingVector8.w = workingVector1.x + workingVector1.y;
          workingVector0.w = workingVector1.z * workingVector0.w + workingVector8.w;
          workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
          workingVector1.z = ceil(workingVector4.w);
          workingVector4.w = floor(workingVector4.w);
          workingVector0.w = workingVector0.w ? workingVector1.z : workingVector4.w;
          workingVector1.z = floor(workingVector6.w);
          workingVector4.w = floor(workingVector7.w);
          workingVector13.xyz = abs(workingVector1.wxy) * workingVector1.zzz;
          workingVector13.xyz = abs(workingVector1.xyw) * workingVector0.www + workingVector13.xyz;
          workingVector13.xyz = abs(workingVector1.ywx) * workingVector4.www + workingVector13.xyz;
          workingVector14.xyz = workingVector13.xyz + abs(workingVector1.wxy);
          workingVector15.xyz = workingVector13.xyz + abs(workingVector1.ywx);
          workingVector16.xyz = workingVector14.xyz + abs(workingVector1.ywx);
          workingVector0.w = workingVector6.w + -workingVector1.z;
          workingVector1.z = workingVector7.w + -workingVector4.w;
          workingVector4.w = 1 + -workingVector0.w;
          workingVector6.w = 1 + -workingVector1.z;
          workingVector7.w = workingVector6.w * workingVector4.w;
          workingVector6.w = workingVector6.w * workingVector0.w;
          workingVector4.w = workingVector4.w * workingVector1.z;
          workingVector0.w = workingVector1.z * workingVector0.w;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(0,0,0));
          workingVector1.z = workingVector17.y ? workingVector17.x : 0;
          workingVector1.z = workingVector17.z ? workingVector1.z : 0;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(16,16,16));
          workingVector8.w = workingVector17.y ? workingVector17.x : 0;
          workingVector8.w = workingVector17.z ? workingVector8.w : 0;
          workingVector1.z = (int)workingVector1.z & (int)workingVector8.w;
          if (workingVector1.z != 0) {
            workingVector17.xyz = (uint3)workingVector13.xyz;
#endif
            workingVector18.xyz = (uint3)workingVector14.xyz;
            workingVector19.xyz = (uint3)workingVector15.xyz;
            workingVector20.xyz = (uint3)workingVector16.xyz;
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector21.xyz = (uint3)workingVector17.xyz;
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector2.z = (int)workingVector18.x + (int)workingVector18.y;
            workingVector2.z = (int)workingVector18.z + (int)workingVector2.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector4.x;
            workingVector18.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector18.yzw = workingVector22.xyz * workingVector22.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector2.z = (int)workingVector19.x + (int)workingVector19.y;
            workingVector2.z = (int)workingVector19.z + (int)workingVector2.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector4.x;
            workingVector19.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector19.yzw = workingVector22.xyz * workingVector22.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector2.z = (int)workingVector20.x + (int)workingVector20.y;
            workingVector2.z = (int)workingVector20.z + (int)workingVector2.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector4.x;
            workingVector20.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector20.yzw = workingVector22.xyz * workingVector22.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
            workingVector21.xz = (uint2)workingVector21.zx << int2(4,8);
            workingVector2.z = (int)workingVector21.x + (int)workingVector21.y;
            workingVector2.z = (int)workingVector21.z + (int)workingVector2.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector4.x;
            workingVector21.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector21.yzw = workingVector22.xyz * workingVector22.www;
            workingVector21.yzw = float3(6,6,6) * workingVector21.yzw;
            workingVector21.xyz = workingVector21.xxx ? workingVector21.yzw : float3(0,0,0);
          } else {
            workingVector22.xyz = workingVector13.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
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
            workingVector9.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector10.w = (int)workingVector14.z + (int)workingVector10.w;
            workingVector10.w = (int)workingVector4.x + (int)workingVector10.w;
            workingVector14.xy = (int2)workingVector4.xx + int2(4096,4097);
            workingVector11.w = sampledResource12[workingVector14.x].val[0/4];
            workingVector12.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector12.w = workingVector11.w ? workingVector12.w : 0;
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.w == 0);
            workingVector2.z = (int)workingVector14.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector14.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector14.xzw = floor(workingVector14.xzw);
            workingVector14.xzw = -workingVector14.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector13.z = (((uint)workingVector14.z << 0) & bitMask.z) | ((uint)workingVector14.x & ~bitMask.z);
            workingVector13.z = (int)workingVector14.w + (int)workingVector13.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector13.z;
            workingVector2.z = workingVector9.w ? workingVector10.w : workingVector2.z;
            workingVector9.w = workingVector9.w ? 0 : workingVector12.w;
            workingVector22.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector14.xzw = workingVector23.xyz * workingVector23.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector22.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector9.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector22.x << 0) & bitMask.z) | ((uint)workingVector23.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector22.x;
            workingVector2.z = (int)workingVector23.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector22.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector23.z + (int)workingVector2.z;
            workingVector9.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.z + (int)workingVector10.w;
            workingVector10.w = (int)workingVector4.x + (int)workingVector10.w;
            workingVector12.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector12.w = workingVector11.w ? workingVector12.w : 0;
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.w == 0);
            workingVector2.z = (int)workingVector14.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xzw = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector13.z = (((uint)workingVector14.z << 0) & bitMask.z) | ((uint)workingVector14.x & ~bitMask.z);
            workingVector13.z = (int)workingVector14.w + (int)workingVector13.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector13.z;
            workingVector2.z = workingVector9.w ? workingVector10.w : workingVector2.z;
            workingVector9.w = workingVector9.w ? 0 : workingVector12.w;
            workingVector15.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector14.xzw = workingVector22.xyz * workingVector22.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector15.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector9.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector15.x << 0) & bitMask.z) | ((uint)workingVector22.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector15.x;
            workingVector2.z = (int)workingVector22.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector15.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector22.z + (int)workingVector2.z;
            workingVector9.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector15.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.z + (int)workingVector10.w;
            workingVector10.w = (int)workingVector4.x + (int)workingVector10.w;
            workingVector12.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector12.w = workingVector11.w ? workingVector12.w : 0;
            workingVector12.w = RD_COMPARISON_MASK((int)workingVector12.w == 0);
            workingVector2.z = (int)workingVector14.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xzw = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector13.z = (((uint)workingVector14.z << 0) & bitMask.z) | ((uint)workingVector14.x & ~bitMask.z);
            workingVector13.z = (int)workingVector14.w + (int)workingVector13.z;
            workingVector2.z = (int)workingVector2.z + (int)workingVector13.z;
            workingVector2.z = workingVector9.w ? workingVector10.w : workingVector2.z;
            workingVector9.w = workingVector9.w ? 0 : workingVector12.w;
            workingVector15.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector15.yzw = (uint3)workingVector15.xxx >> int3(8,16,24);
            workingVector16.xyzw = (int4)workingVector15.xyzw & int4(255,255,255,255);
            workingVector16.xyzw = (uint4)workingVector16.xyzw;
            workingVector16.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector16.xyzw;
            workingVector14.xzw = workingVector16.xyz * workingVector16.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector15.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector20.xyz = workingVector9.www ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector13.xyw * float3(16,16,16) + workingVector17.xyz;
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector17.xyz < float3(0,0,0));
            workingVector16.xyz = RD_COMPARISON_MASK(workingVector17.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.x = (((uint)workingVector16.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector2.z = (((uint)workingVector15.x << 0) & bitMask.z) | ((uint)workingVector16.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector2.z = (int)workingVector2.z + (int)workingVector15.x;
            workingVector2.z = (int)workingVector16.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector15.y + (int)workingVector2.z;
            workingVector2.z = (int)workingVector16.z + (int)workingVector2.z;
            workingVector9.w = RD_COMPARISON_MASK((int)icb[workingVector2.z+4].x < 0);
            workingVector15.xyz = (uint3)workingVector17.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.z + (int)workingVector10.w;
            workingVector10.w = (int)workingVector4.x + (int)workingVector10.w;
            workingVector12.w = 1 << (int)icb[workingVector2.z+4].x;
            workingVector11.w = workingVector11.w ? workingVector12.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector2.z = (int)workingVector14.y + (int)icb[workingVector2.z+4].x;
            workingVector2.z = sampledResource12[workingVector2.z].val[0/4];
            workingVector2.z = (uint)workingVector2.z >> 2;
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector14.xyz = -workingVector15.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector12.w = (int)workingVector14.z + (int)workingVector12.w;
            workingVector2.z = (int)workingVector2.z + (int)workingVector12.w;
            workingVector2.z = workingVector9.w ? workingVector10.w : workingVector2.z;
            workingVector9.w = workingVector9.w ? 0 : workingVector11.w;
            workingVector14.x = sampledResource12[workingVector2.z].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector15.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
            workingVector14.yzw = workingVector15.xyz * workingVector15.www;
            workingVector14.yzw = float3(6,6,6) * workingVector14.yzw;
            workingVector14.xyz = workingVector14.xxx ? workingVector14.yzw : float3(0,0,0);
            workingVector21.xyz = workingVector9.www ? float3(0,0,0) : workingVector14.xyz;
          }
          workingVector14.xyz = workingVector19.xyz * workingVector7.www;
          workingVector14.xyz = workingVector18.xyz * workingVector8.www + workingVector14.xyz;
          workingVector14.xyz = workingVector20.xyz * workingVector5.www + workingVector14.xyz;
          workingVector14.xyz = workingVector21.xyz * workingVector1.www + workingVector14.xyz;
        } else {
          workingVector15.xyz = floor(workingVector7.xyz);
          workingVector7.xyz = -workingVector15.xyz + workingVector7.xyz;
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector7.xyx >= workingVector7.yzz);
          bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector16.y = (((uint)workingVector16.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector16.z = (((uint)workingVector16.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.w = (((uint)workingVector16.x << 0) & bitMask.w) | ((uint)workingVector16.y & ~bitMask.w);
          workingVector1.w = (int)workingVector16.z + (int)workingVector1.w;
          workingVector2.z = min(workingVector7.x, workingVector7.y);
          workingVector5.w = max(workingVector7.x, workingVector7.y);
          workingVector7.x = min(workingVector2.z, workingVector7.z);
          workingVector7.y = max(workingVector5.w, workingVector7.z);
          workingVector5.w = min(workingVector5.w, workingVector7.z);
          workingVector2.z = max(workingVector5.w, workingVector2.z);
          workingVector5.w = 1 + -workingVector7.y;
          workingVector7.y = workingVector7.y + -workingVector2.z;
          workingVector2.z = workingVector2.z + -workingVector7.x;
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(0,0,0));
          workingVector7.z = workingVector16.y ? workingVector16.x : 0;
          workingVector7.z = workingVector16.z ? workingVector7.z : 0;
          workingVector16.xyz = float3(1,1,1) + workingVector15.xyz;
          workingVector17.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(16,16,16));
          workingVector7.w = workingVector17.y ? workingVector17.x : 0;
          workingVector7.w = workingVector17.z ? workingVector7.w : 0;
          workingVector7.z = (int)workingVector7.w & (int)workingVector7.z;
          if (workingVector7.z != 0) {
            workingVector17.xyz = (uint3)workingVector15.xyz;
            workingVector7.zw = RD_COMPARISON_MASK((uint2)workingVector1.ww < int2(2,6));
            workingVector18.xz = workingVector7.zw ? float2(0,0) : 0;
            workingVector18.yw = icb[workingVector1.w+4].yz;
            workingVector19.xyz = (int3)workingVector17.xyz + (int3)workingVector18.ywx;
            workingVector18.xy = icb[workingVector1.w+12].yz;
            workingVector18.xyz = (int3)workingVector17.xyz + (int3)workingVector18.xyz;
            workingVector20.xyz = (int3)workingVector17.xyz + int3(1,1,1);
            workingVector7.zw = (uint2)workingVector17.zx << int2(4,8);
            workingVector7.z = (int)workingVector7.z + (int)workingVector17.y;
            workingVector7.z = (int)workingVector7.w + (int)workingVector7.z;
            workingVector7.z = (int)workingVector4.x + (int)workingVector7.z;
            workingVector17.x = sampledResource12[workingVector7.z].val[0/4];
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector17.xz = (uint2)workingVector17.zx << int2(4,8);
            workingVector1.z = (int)workingVector17.x + (int)workingVector17.y;
            workingVector1.z = (int)workingVector17.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.x;
            workingVector17.x = sampledResource12[workingVector1.z].val[0/4];
#endif
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector17.yzw = workingVector21.xyz * workingVector21.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector7.zw = (uint2)workingVector19.zx << int2(4,8);
            workingVector7.z = (int)workingVector7.z + (int)workingVector19.y;
            workingVector7.z = (int)workingVector7.w + (int)workingVector7.z;
            workingVector7.z = (int)workingVector4.x + (int)workingVector7.z;
            workingVector19.x = sampledResource12[workingVector7.z].val[0/4];
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector18.xz = (uint2)workingVector18.zx << int2(4,8);
            workingVector1.z = (int)workingVector18.x + (int)workingVector18.y;
            workingVector1.z = (int)workingVector18.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.x;
            workingVector18.x = sampledResource12[workingVector1.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector18.yzw = workingVector21.xyz * workingVector21.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector19.xz = (uint2)workingVector19.zx << int2(4,8);
            workingVector1.z = (int)workingVector19.x + (int)workingVector19.y;
            workingVector1.z = (int)workingVector19.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.x;
            workingVector19.x = sampledResource12[workingVector1.z].val[0/4];
#endif
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector19.yzw = workingVector21.xyz * workingVector21.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector7.zw = (uint2)workingVector18.zx << int2(4,8);
            workingVector7.z = (int)workingVector7.z + (int)workingVector18.y;
            workingVector7.z = (int)workingVector7.w + (int)workingVector7.z;
            workingVector7.z = (int)workingVector4.x + (int)workingVector7.z;
            workingVector18.x = sampledResource12[workingVector7.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector18.yzw = workingVector21.xyz * workingVector21.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector7.zw = (uint2)workingVector20.zx << int2(4,8);
            workingVector7.z = (int)workingVector7.z + (int)workingVector20.y;
            workingVector7.z = (int)workingVector7.w + (int)workingVector7.z;
            workingVector7.z = (int)workingVector4.x + (int)workingVector7.z;
            workingVector20.x = sampledResource12[workingVector7.z].val[0/4];
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector20.xz = (uint2)workingVector20.zx << int2(4,8);
            workingVector1.z = (int)workingVector20.x + (int)workingVector20.y;
            workingVector1.z = (int)workingVector20.z + (int)workingVector1.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector3.x;
            workingVector20.x = sampledResource12[workingVector1.z].val[0/4];
#endif
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector20.yzw = workingVector21.xyz * workingVector21.www;
            workingVector20.yzw = float3(6,6,6) * workingVector20.yzw;
            workingVector20.xyz = workingVector20.xxx ? workingVector20.yzw : float3(0,0,0);
          } else {
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector7.zw = RD_COMPARISON_MASK((uint2)workingVector1.ww < int2(2,6));
            workingVector7.zw = workingVector7.zw ? float2(0,0) : 0;
            workingVector21.xy = (uint2)icb[workingVector1.w+4].yz;
            workingVector21.z = (uint)workingVector7.z;
            workingVector21.xyz = workingVector21.xyz + workingVector15.xyz;
            workingVector22.xy = (uint2)icb[workingVector1.w+12].yz;
            workingVector22.z = (uint)workingVector7.w;
            workingVector22.xyz = workingVector22.xyz + workingVector15.xyz;
            workingVector23.xyz = workingVector13.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector25.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector25.x = (((uint)workingVector25.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector25.y = (((uint)workingVector25.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector25.z = (((uint)workingVector25.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.w = (((uint)workingVector24.x << 0) & bitMask.w) | ((uint)workingVector25.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.z = (((uint)workingVector24.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector24.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector1.w = (int)workingVector1.w + (int)workingVector7.z;
            workingVector1.w = (int)workingVector25.y + (int)workingVector1.w;
            workingVector1.w = (int)workingVector7.w + (int)workingVector1.w;
            workingVector1.w = (int)workingVector25.z + (int)workingVector1.w;
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector1.w+4].x < 0);
            workingVector15.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector15.y << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector7.w = (int)workingVector15.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector4.x + (int)workingVector7.w;
            workingVector15.xy = (int2)workingVector4.xx + int2(4096,4097);
            workingVector8.w = sampledResource12[workingVector15.x].val[0/4];
            workingVector9.w = 1 << (int)icb[workingVector1.w+4].x;
            workingVector9.w = (int)workingVector8.w & (int)workingVector9.w;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
            workingVector1.w = (int)workingVector15.y + (int)icb[workingVector1.w+4].x;
            workingVector1.w = sampledResource12[workingVector1.w].val[0/4];
            workingVector1.w = (uint)workingVector1.w >> 2;
            workingVector15.xzw = float3(0.0625,0.0625,0.0625) * workingVector23.xyz;
            workingVector15.xzw = floor(workingVector15.xzw);
            workingVector15.xzw = -workingVector15.xzw * float3(16,16,16) + workingVector23.xyz;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.w + (int)workingVector10.w;
            workingVector1.w = (int)workingVector1.w + (int)workingVector10.w;
            workingVector1.w = workingVector7.z ? workingVector7.w : workingVector1.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.w;
            workingVector23.x = sampledResource12[workingVector1.w].val[0/4];
            workingVector23.yzw = (uint3)workingVector23.xxx >> int3(8,16,24);
            workingVector24.xyzw = (int4)workingVector23.xyzw & int4(255,255,255,255);
            workingVector24.xyzw = (uint4)workingVector24.xyzw;
            workingVector24.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector24.xyzw;
            workingVector15.xzw = workingVector24.xyz * workingVector24.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector23.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector13.xyw * float3(16,16,16) + workingVector21.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector21.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector21.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.w = (((uint)workingVector23.x << 0) & bitMask.w) | ((uint)workingVector24.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.z = (((uint)workingVector23.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector23.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector1.w = (int)workingVector1.w + (int)workingVector7.z;
            workingVector1.w = (int)workingVector24.y + (int)workingVector1.w;
            workingVector1.w = (int)workingVector7.w + (int)workingVector1.w;
            workingVector1.w = (int)workingVector24.z + (int)workingVector1.w;
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector1.w+4].x < 0);
            workingVector21.xyz = (uint3)workingVector21.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector21.y << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            workingVector7.w = (int)workingVector21.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector4.x + (int)workingVector7.w;
            workingVector9.w = 1 << (int)icb[workingVector1.w+4].x;
            workingVector9.w = (int)workingVector8.w & (int)workingVector9.w;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
            workingVector1.w = (int)workingVector15.y + (int)icb[workingVector1.w+4].x;
            workingVector1.w = sampledResource12[workingVector1.w].val[0/4];
            workingVector1.w = (uint)workingVector1.w >> 2;
            workingVector21.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
            workingVector21.xyz = floor(workingVector21.xyz);
            workingVector15.xzw = -workingVector21.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.w + (int)workingVector10.w;
            workingVector1.w = (int)workingVector1.w + (int)workingVector10.w;
            workingVector1.w = workingVector7.z ? workingVector7.w : workingVector1.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.w;
            workingVector21.x = sampledResource12[workingVector1.w].val[0/4];
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector15.xzw = workingVector23.xyz * workingVector23.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector21.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector15.xzw;
            workingVector15.xzw = workingVector13.xyw * float3(16,16,16) + workingVector22.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector22.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector22.xyz >= float3(16,16,16));
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector21.xyz = workingVector12.xyw * float3(16,16,16) + workingVector13.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector13.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector13.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_SEASONS == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.w = (((uint)workingVector21.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.z = (((uint)workingVector21.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector21.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector1.w = (int)workingVector1.w + (int)workingVector7.z;
            workingVector1.w = (int)workingVector23.y + (int)workingVector1.w;
            workingVector1.w = (int)workingVector7.w + (int)workingVector1.w;
            workingVector1.w = (int)workingVector23.z + (int)workingVector1.w;
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector1.w+4].x < 0);
            workingVector21.xyz = (uint3)workingVector22.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector21.y << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            workingVector7.w = (int)workingVector21.z + (int)workingVector7.w;
            workingVector7.w = (int)workingVector4.x + (int)workingVector7.w;
            workingVector9.w = 1 << (int)icb[workingVector1.w+4].x;
            workingVector9.w = (int)workingVector8.w & (int)workingVector9.w;
            workingVector9.w = RD_COMPARISON_MASK((int)workingVector9.w == 0);
            workingVector1.w = (int)workingVector15.y + (int)icb[workingVector1.w+4].x;
            workingVector1.w = sampledResource12[workingVector1.w].val[0/4];
            workingVector1.w = (uint)workingVector1.w >> 2;
            workingVector21.xyz = float3(0.0625,0.0625,0.0625) * workingVector15.xzw;
            workingVector21.xyz = floor(workingVector21.xyz);
            workingVector15.xzw = -workingVector21.xyz * float3(16,16,16) + workingVector15.xzw;
            workingVector15.xzw = (uint3)workingVector15.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector10.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector10.w = (int)workingVector15.w + (int)workingVector10.w;
            workingVector1.w = (int)workingVector1.w + (int)workingVector10.w;
            workingVector1.w = workingVector7.z ? workingVector7.w : workingVector1.w;
            workingVector7.z = workingVector7.z ? 0 : workingVector9.w;
            workingVector21.x = sampledResource12[workingVector1.w].val[0/4];
#elif RD_FEATURE_SEASONS == RD_ON
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector22.x << 0) & bitMask.z) | ((uint)workingVector23.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector22.x;
            workingVector1.z = (int)workingVector23.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector22.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector23.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector9.w = (int)workingVector13.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.x + (int)workingVector9.w;
            workingVector13.xy = (int2)workingVector3.xx + int2(4096,4097);
            workingVector10.w = sampledResource12[workingVector13.x].val[0/4];
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector1.z = (int)workingVector13.y + (int)icb[workingVector1.z+4].x;
            workingVector1.z = sampledResource12[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
            workingVector13.xzw = float3(0.0625,0.0625,0.0625) * workingVector21.xyz;
            workingVector13.xzw = floor(workingVector13.xzw);
            workingVector13.xzw = -workingVector13.xzw * float3(16,16,16) + workingVector21.xyz;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.z;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector21.x = sampledResource12[workingVector1.z].val[0/4];
#endif
            workingVector21.yzw = (uint3)workingVector21.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector21.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector15.xzw = workingVector22.xyz * workingVector22.www;
            workingVector15.xzw = float3(6,6,6) * workingVector15.xzw;
            workingVector15.xzw = workingVector21.xxx ? workingVector15.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector7.zzz ? float3(0,0,0) : workingVector15.xzw;
            workingVector13.xyz = workingVector13.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector15.xzw = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector13.xzw = workingVector22.xyz * workingVector22.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector21.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector21.x << 0) & bitMask.z) | ((uint)workingVector22.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector21.x;
            workingVector1.z = (int)workingVector22.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector21.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector22.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.x + (int)workingVector9.w;
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector1.z = (int)workingVector13.y + (int)icb[workingVector1.z+4].x;
            workingVector1.z = sampledResource12[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xzw = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.z;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector14.x = sampledResource12[workingVector1.z].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector13.xzw = workingVector21.xyz * workingVector21.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector14.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector21.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
#endif
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector21.x = (((uint)workingVector21.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector21.y = (((uint)workingVector21.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector21.z = (((uint)workingVector21.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_SEASONS == RD_OFF
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.w = (((uint)workingVector15.x << 0) & bitMask.w) | ((uint)workingVector21.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector7.z = (((uint)workingVector15.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector7.w = (((uint)workingVector15.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector1.w = (int)workingVector1.w + (int)workingVector7.z;
            workingVector1.w = (int)workingVector21.y + (int)workingVector1.w;
            workingVector1.w = (int)workingVector7.w + (int)workingVector1.w;
            workingVector1.w = (int)workingVector21.z + (int)workingVector1.w;
            workingVector7.z = RD_COMPARISON_MASK((int)icb[workingVector1.w+4].x < 0);
            workingVector15.xzw = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector15.w = (((uint)workingVector15.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector15.z << 0) & bitMask.w) | ((uint)workingVector15.x & ~bitMask.w);
            workingVector7.w = (int)workingVector15.w + (int)workingVector7.w;
            workingVector4.x = (int)workingVector4.x + (int)workingVector7.w;
            workingVector7.w = 1 << (int)icb[workingVector1.w+4].x;
            workingVector7.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector7.w = RD_COMPARISON_MASK((int)workingVector7.w == 0);
            workingVector1.w = (int)workingVector15.y + (int)icb[workingVector1.w+4].x;
            workingVector1.w = sampledResource12[workingVector1.w].val[0/4];
            workingVector1.w = (uint)workingVector1.w >> 2;
            workingVector15.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xyz;
            workingVector15.xyz = floor(workingVector15.xyz);
            workingVector13.xyz = -workingVector15.xyz * float3(16,16,16) + workingVector13.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector14.x << 0) & bitMask.z) | ((uint)workingVector21.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector14.x;
            workingVector1.z = (int)workingVector21.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector14.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector21.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
            workingVector14.xyz = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.x + (int)workingVector9.w;
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
            workingVector11.w = workingVector10.w ? workingVector11.w : 0;
            workingVector11.w = RD_COMPARISON_MASK((int)workingVector11.w == 0);
            workingVector1.z = (int)workingVector13.y + (int)icb[workingVector1.z+4].x;
            workingVector1.z = sampledResource12[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xzw = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
            workingVector13.xzw = (uint3)workingVector13.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.w = (((uint)workingVector13.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.z = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector12.z = (((uint)workingVector13.z << 0) & bitMask.z) | ((uint)workingVector13.x & ~bitMask.z);
            workingVector12.z = (int)workingVector13.w + (int)workingVector12.z;
            workingVector1.z = (int)workingVector1.z + (int)workingVector12.z;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
            workingVector8.w = workingVector8.w ? 0 : workingVector11.w;
            workingVector14.x = sampledResource12[workingVector1.z].val[0/4];
            workingVector14.yzw = (uint3)workingVector14.xxx >> int3(8,16,24);
            workingVector15.xyzw = (int4)workingVector14.xyzw & int4(255,255,255,255);
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
            workingVector13.xzw = workingVector15.xyz * workingVector15.www;
            workingVector13.xzw = float3(6,6,6) * workingVector13.xzw;
            workingVector13.xzw = workingVector14.xxx ? workingVector13.xzw : float3(0,0,0);
            workingVector19.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xzw;
            workingVector13.xzw = workingVector12.xyw * float3(16,16,16) + workingVector16.xyz;
            workingVector14.xyz = RD_COMPARISON_MASK(workingVector16.xyz < float3(0,0,0));
            workingVector15.xyz = RD_COMPARISON_MASK(workingVector16.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.x = (((uint)workingVector15.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.z = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector1.z = (((uint)workingVector14.x << 0) & bitMask.z) | ((uint)workingVector15.x & ~bitMask.z);
            bitMask.x = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.y << 2) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector14.y = (((uint)workingVector14.z << 4) & bitMask.y) | ((uint)0 & ~bitMask.y);
            workingVector1.z = (int)workingVector1.z + (int)workingVector14.x;
            workingVector1.z = (int)workingVector15.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector14.y + (int)workingVector1.z;
            workingVector1.z = (int)workingVector15.z + (int)workingVector1.z;
            workingVector8.w = RD_COMPARISON_MASK((int)icb[workingVector1.z+4].x < 0);
            workingVector14.xyz = (uint3)workingVector16.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.z + (int)workingVector9.w;
            workingVector9.w = (int)workingVector3.x + (int)workingVector9.w;
            workingVector11.w = 1 << (int)icb[workingVector1.z+4].x;
            workingVector10.w = workingVector10.w ? workingVector11.w : 0;
            workingVector10.w = RD_COMPARISON_MASK((int)workingVector10.w == 0);
            workingVector1.z = (int)workingVector13.y + (int)icb[workingVector1.z+4].x;
            workingVector1.z = sampledResource12[workingVector1.z].val[0/4];
            workingVector1.z = (uint)workingVector1.z >> 2;
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector13.xzw;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector13.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector13.xzw;
#endif
            workingVector13.xyz = (uint3)workingVector13.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector13.x = (((uint)workingVector13.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector13.z = (((uint)workingVector13.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
#if RD_FEATURE_SEASONS == RD_OFF
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector8.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector8.w = (int)workingVector13.z + (int)workingVector8.w;
            workingVector1.w = (int)workingVector1.w + (int)workingVector8.w;
            workingVector1.w = workingVector7.z ? workingVector4.x : workingVector1.w;
            workingVector4.x = workingVector7.z ? 0 : workingVector7.w;
            workingVector13.x = sampledResource12[workingVector1.w].val[0/4];
#elif RD_FEATURE_SEASONS == RD_ON
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector11.w = (((uint)workingVector13.y << 0) & bitMask.w) | ((uint)workingVector13.x & ~bitMask.w);
            workingVector11.w = (int)workingVector13.z + (int)workingVector11.w;
            workingVector1.z = (int)workingVector1.z + (int)workingVector11.w;
            workingVector1.z = workingVector8.w ? workingVector9.w : workingVector1.z;
            workingVector8.w = workingVector8.w ? 0 : workingVector10.w;
            workingVector13.x = sampledResource12[workingVector1.z].val[0/4];
#endif
            workingVector13.yzw = (uint3)workingVector13.xxx >> int3(8,16,24);
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector15.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
            workingVector15.xyzw = (uint4)workingVector15.xyzw;
            workingVector15.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector15.xyzw;
            workingVector13.yzw = workingVector15.xyz * workingVector15.www;
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector14.xyzw = (int4)workingVector13.xyzw & int4(255,255,255,255);
            workingVector14.xyzw = (uint4)workingVector14.xyzw;
            workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
            workingVector13.yzw = workingVector14.xyz * workingVector14.www;
#endif
            workingVector13.yzw = float3(6,6,6) * workingVector13.yzw;
            workingVector13.xyz = workingVector13.xxx ? workingVector13.yzw : float3(0,0,0);
#if RD_FEATURE_SEASONS == RD_OFF
            workingVector20.xyz = workingVector4.xxx ? float3(0,0,0) : workingVector13.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
            workingVector20.xyz = workingVector8.www ? float3(0,0,0) : workingVector13.xyz;
#endif
          }
#if RD_FEATURE_SEASONS == RD_OFF
          workingVector7.yzw = workingVector19.xyz * workingVector7.yyy;
          workingVector7.yzw = workingVector17.xyz * workingVector5.www + workingVector7.yzw;
          workingVector7.yzw = workingVector18.xyz * workingVector2.zzz + workingVector7.yzw;
          workingVector14.xyz = workingVector20.xyz * workingVector7.xxx + workingVector7.yzw;
#elif RD_FEATURE_SEASONS == RD_ON
          workingVector13.xyz = workingVector18.xyz * workingVector6.www;
          workingVector13.xyz = workingVector17.xyz * workingVector7.www + workingVector13.xyz;
          workingVector13.xyz = workingVector19.xyz * workingVector4.www + workingVector13.xyz;
          workingVector13.xyz = workingVector20.xyz * workingVector0.www + workingVector13.xyz;
        } else {
          workingVector14.xyz = floor(workingVector6.xyz);
          workingVector6.xyz = -workingVector14.xyz + workingVector6.xyz;
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector6.xyx >= workingVector6.yzz);
          bitMask.y = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector15.y = (((uint)workingVector15.y << 1) & bitMask.y) | ((uint)0 & ~bitMask.y);
          bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector15.z = (((uint)workingVector15.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
          bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector15.x << 0) & bitMask.w) | ((uint)workingVector15.y & ~bitMask.w);
          workingVector0.w = (int)workingVector15.z + (int)workingVector0.w;
          workingVector1.z = min(workingVector6.x, workingVector6.y);
          workingVector4.w = max(workingVector6.x, workingVector6.y);
          workingVector6.x = min(workingVector1.z, workingVector6.z);
          workingVector6.y = max(workingVector4.w, workingVector6.z);
          workingVector4.w = min(workingVector4.w, workingVector6.z);
          workingVector1.z = max(workingVector4.w, workingVector1.z);
          workingVector4.w = 1 + -workingVector6.y;
          workingVector6.y = workingVector6.y + -workingVector1.z;
          workingVector1.z = workingVector1.z + -workingVector6.x;
          workingVector15.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(0,0,0));
          workingVector6.z = workingVector15.y ? workingVector15.x : 0;
          workingVector6.z = workingVector15.z ? workingVector6.z : 0;
          workingVector15.xyz = float3(1,1,1) + workingVector14.xyz;
          workingVector16.xyz = RD_COMPARISON_MASK(workingVector15.xyz < float3(16,16,16));
          workingVector6.w = workingVector16.y ? workingVector16.x : 0;
          workingVector6.w = workingVector16.z ? workingVector6.w : 0;
          workingVector6.z = (int)workingVector6.w & (int)workingVector6.z;
          if (workingVector6.z != 0) {
            workingVector16.xyz = (uint3)workingVector14.xyz;
            workingVector6.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector17.xz = workingVector6.zw ? float2(0,0) : 0;
            workingVector17.yw = icb[workingVector0.w+4].yz;
            workingVector18.xyz = (int3)workingVector16.xyz + (int3)workingVector17.ywx;
            workingVector17.xy = icb[workingVector0.w+12].yz;
            workingVector17.xyz = (int3)workingVector16.xyz + (int3)workingVector17.xyz;
            workingVector19.xyz = (int3)workingVector16.xyz + int3(1,1,1);
            workingVector6.zw = (uint2)workingVector16.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector16.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector3.x + (int)workingVector6.z;
            workingVector16.x = sampledResource12[workingVector6.z].val[0/4];
            workingVector16.yzw = (uint3)workingVector16.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector16.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector16.yzw = workingVector20.xyz * workingVector20.www;
            workingVector16.yzw = float3(6,6,6) * workingVector16.yzw;
            workingVector16.xyz = workingVector16.xxx ? workingVector16.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector18.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector18.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector3.x + (int)workingVector6.z;
            workingVector18.x = sampledResource12[workingVector6.z].val[0/4];
            workingVector18.yzw = (uint3)workingVector18.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector18.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector18.yzw = workingVector20.xyz * workingVector20.www;
            workingVector18.yzw = float3(6,6,6) * workingVector18.yzw;
            workingVector18.xyz = workingVector18.xxx ? workingVector18.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector17.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector17.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector3.x + (int)workingVector6.z;
            workingVector17.x = sampledResource12[workingVector6.z].val[0/4];
            workingVector17.yzw = (uint3)workingVector17.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector17.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector17.yzw = workingVector20.xyz * workingVector20.www;
            workingVector17.yzw = float3(6,6,6) * workingVector17.yzw;
            workingVector17.xyz = workingVector17.xxx ? workingVector17.yzw : float3(0,0,0);
            workingVector6.zw = (uint2)workingVector19.zx << int2(4,8);
            workingVector6.z = (int)workingVector6.z + (int)workingVector19.y;
            workingVector6.z = (int)workingVector6.w + (int)workingVector6.z;
            workingVector6.z = (int)workingVector3.x + (int)workingVector6.z;
            workingVector19.x = sampledResource12[workingVector6.z].val[0/4];
            workingVector19.yzw = (uint3)workingVector19.xxx >> int3(8,16,24);
            workingVector20.xyzw = (int4)workingVector19.xyzw & int4(255,255,255,255);
            workingVector20.xyzw = (uint4)workingVector20.xyzw;
            workingVector20.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector20.xyzw;
            workingVector19.yzw = workingVector20.xyz * workingVector20.www;
            workingVector19.yzw = float3(6,6,6) * workingVector19.yzw;
            workingVector19.xyz = workingVector19.xxx ? workingVector19.yzw : float3(0,0,0);
          } else {
            workingVector6.zw = RD_COMPARISON_MASK((uint2)workingVector0.ww < int2(2,6));
            workingVector6.zw = workingVector6.zw ? float2(0,0) : 0;
            workingVector20.xy = (uint2)icb[workingVector0.w+4].yz;
            workingVector20.z = (uint)workingVector6.z;
            workingVector20.xyz = workingVector20.xyz + workingVector14.xyz;
            workingVector21.xy = (uint2)icb[workingVector0.w+12].yz;
            workingVector21.z = (uint)workingVector6.w;
            workingVector21.xyz = workingVector21.xyz + workingVector14.xyz;
            workingVector22.xyz = workingVector12.xyw * float3(16,16,16) + workingVector14.xyz;
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector14.xyz < float3(0,0,0));
            workingVector24.xyz = RD_COMPARISON_MASK(workingVector14.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector24.x = (((uint)workingVector24.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector24.y = (((uint)workingVector24.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector24.z = (((uint)workingVector24.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector23.x << 0) & bitMask.w) | ((uint)workingVector24.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector23.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector23.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector24.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector24.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector14.xyz = (uint3)workingVector14.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.z = (((uint)workingVector14.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.y << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector6.w = (int)workingVector14.z + (int)workingVector6.w;
            workingVector6.w = (int)workingVector3.x + (int)workingVector6.w;
            workingVector14.xy = (int2)workingVector3.xx + int2(4096,4097);
            workingVector7.w = sampledResource12[workingVector14.x].val[0/4];
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
            workingVector0.w = sampledResource12[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
            workingVector14.xzw = float3(0.0625,0.0625,0.0625) * workingVector22.xyz;
            workingVector14.xzw = floor(workingVector14.xzw);
            workingVector14.xzw = -workingVector14.xzw * float3(16,16,16) + workingVector22.xyz;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
            workingVector22.x = sampledResource12[workingVector0.w].val[0/4];
            workingVector22.yzw = (uint3)workingVector22.xxx >> int3(8,16,24);
            workingVector23.xyzw = (int4)workingVector22.xyzw & int4(255,255,255,255);
            workingVector23.xyzw = (uint4)workingVector23.xyzw;
            workingVector23.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector23.xyzw;
            workingVector14.xzw = workingVector23.xyz * workingVector23.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector22.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector16.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector12.xyw * float3(16,16,16) + workingVector20.xyz;
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector20.xyz < float3(0,0,0));
            workingVector23.xyz = RD_COMPARISON_MASK(workingVector20.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector23.x = (((uint)workingVector23.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector23.y = (((uint)workingVector23.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector23.z = (((uint)workingVector23.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector22.x << 0) & bitMask.w) | ((uint)workingVector23.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector22.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector22.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector23.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector23.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector20.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector6.w = (int)workingVector20.z + (int)workingVector6.w;
            workingVector6.w = (int)workingVector3.x + (int)workingVector6.w;
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
            workingVector0.w = sampledResource12[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector20.xyz = floor(workingVector20.xyz);
            workingVector14.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
            workingVector20.x = sampledResource12[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector22.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector22.xyzw = (uint4)workingVector22.xyzw;
            workingVector22.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector22.xyzw;
            workingVector14.xzw = workingVector22.xyz * workingVector22.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector20.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector18.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector14.xzw = workingVector12.xyw * float3(16,16,16) + workingVector21.xyz;
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector21.xyz < float3(0,0,0));
            workingVector22.xyz = RD_COMPARISON_MASK(workingVector21.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector22.x = (((uint)workingVector22.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector22.y = (((uint)workingVector22.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector22.z = (((uint)workingVector22.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector20.x << 0) & bitMask.w) | ((uint)workingVector22.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector20.y << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.z << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector22.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector22.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector20.xyz = (uint3)workingVector21.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector20.y << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            workingVector6.w = (int)workingVector20.z + (int)workingVector6.w;
            workingVector6.w = (int)workingVector3.x + (int)workingVector6.w;
            workingVector8.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector8.w = (int)workingVector7.w & (int)workingVector8.w;
            workingVector8.w = RD_COMPARISON_MASK((int)workingVector8.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
            workingVector0.w = sampledResource12[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
            workingVector20.xyz = float3(0.0625,0.0625,0.0625) * workingVector14.xzw;
            workingVector20.xyz = floor(workingVector20.xyz);
            workingVector14.xzw = -workingVector20.xyz * float3(16,16,16) + workingVector14.xzw;
            workingVector14.xzw = (uint3)workingVector14.xzw;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector9.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector9.w = (int)workingVector14.w + (int)workingVector9.w;
            workingVector0.w = (int)workingVector0.w + (int)workingVector9.w;
            workingVector0.w = workingVector6.z ? workingVector6.w : workingVector0.w;
            workingVector6.z = workingVector6.z ? 0 : workingVector8.w;
            workingVector20.x = sampledResource12[workingVector0.w].val[0/4];
            workingVector20.yzw = (uint3)workingVector20.xxx >> int3(8,16,24);
            workingVector21.xyzw = (int4)workingVector20.xyzw & int4(255,255,255,255);
            workingVector21.xyzw = (uint4)workingVector21.xyzw;
            workingVector21.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector21.xyzw;
            workingVector14.xzw = workingVector21.xyz * workingVector21.www;
            workingVector14.xzw = float3(6,6,6) * workingVector14.xzw;
            workingVector14.xzw = workingVector20.xxx ? workingVector14.xzw : float3(0,0,0);
            workingVector17.xyz = workingVector6.zzz ? float3(0,0,0) : workingVector14.xzw;
            workingVector12.xyz = workingVector12.xyw * float3(16,16,16) + workingVector15.xyz;
            workingVector14.xzw = RD_COMPARISON_MASK(workingVector15.xyz < float3(0,0,0));
            workingVector20.xyz = RD_COMPARISON_MASK(workingVector15.xyz >= float3(16,16,16));
            bitMask.x = ((~(-1 << 1)) << 1) & 0xffffffff;  workingVector20.x = (((uint)workingVector20.x << 1) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.y = ((~(-1 << 1)) << 3) & 0xffffffff;  workingVector20.y = (((uint)workingVector20.y << 3) & bitMask.y) | ((uint)0 & ~bitMask.y);
            bitMask.z = ((~(-1 << 1)) << 5) & 0xffffffff;  workingVector20.z = (((uint)workingVector20.z << 5) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 0) & 0xffffffff;  workingVector0.w = (((uint)workingVector14.x << 0) & bitMask.w) | ((uint)workingVector20.x & ~bitMask.w);
            bitMask.z = ((~(-1 << 1)) << 2) & 0xffffffff;  workingVector6.z = (((uint)workingVector14.z << 2) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 1)) << 4) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.w << 4) & bitMask.w) | ((uint)0 & ~bitMask.w);
            workingVector0.w = (int)workingVector0.w + (int)workingVector6.z;
            workingVector0.w = (int)workingVector20.y + (int)workingVector0.w;
            workingVector0.w = (int)workingVector6.w + (int)workingVector0.w;
            workingVector0.w = (int)workingVector20.z + (int)workingVector0.w;
            workingVector6.z = RD_COMPARISON_MASK((int)icb[workingVector0.w+4].x < 0);
            workingVector14.xzw = (uint3)workingVector15.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector14.x = (((uint)workingVector14.w << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.w = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector14.w = (((uint)workingVector14.x << 8) & bitMask.w) | ((uint)0 & ~bitMask.w);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector6.w = (((uint)workingVector14.z << 0) & bitMask.w) | ((uint)workingVector14.x & ~bitMask.w);
            workingVector6.w = (int)workingVector14.w + (int)workingVector6.w;
            workingVector3.x = (int)workingVector3.x + (int)workingVector6.w;
            workingVector6.w = 1 << (int)icb[workingVector0.w+4].x;
            workingVector6.w = (int)workingVector6.w & (int)workingVector7.w;
            workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.w == 0);
            workingVector0.w = (int)workingVector14.y + (int)icb[workingVector0.w+4].x;
            workingVector0.w = sampledResource12[workingVector0.w].val[0/4];
            workingVector0.w = (uint)workingVector0.w >> 2;
            workingVector14.xyz = float3(0.0625,0.0625,0.0625) * workingVector12.xyz;
            workingVector14.xyz = floor(workingVector14.xyz);
            workingVector12.xyz = -workingVector14.xyz * float3(16,16,16) + workingVector12.xyz;
            workingVector12.xyz = (uint3)workingVector12.xyz;
            bitMask.x = ((~(-1 << 4)) << 4) & 0xffffffff;  workingVector12.x = (((uint)workingVector12.z << 4) & bitMask.x) | ((uint)0 & ~bitMask.x);
            bitMask.z = ((~(-1 << 4)) << 8) & 0xffffffff;  workingVector12.z = (((uint)workingVector12.x << 8) & bitMask.z) | ((uint)0 & ~bitMask.z);
            bitMask.w = ((~(-1 << 4)) << 0) & 0xffffffff;  workingVector7.w = (((uint)workingVector12.y << 0) & bitMask.w) | ((uint)workingVector12.x & ~bitMask.w);
            workingVector7.w = (int)workingVector12.z + (int)workingVector7.w;
            workingVector0.w = (int)workingVector0.w + (int)workingVector7.w;
            workingVector0.w = workingVector6.z ? workingVector3.x : workingVector0.w;
            workingVector3.x = workingVector6.z ? 0 : workingVector6.w;
            workingVector12.x = sampledResource12[workingVector0.w].val[0/4];
            workingVector12.yzw = (uint3)workingVector12.xxx >> int3(8,16,24);
            workingVector14.xyzw = (int4)workingVector12.xyzw & int4(255,255,255,255);
            workingVector14.xyzw = (uint4)workingVector14.xyzw;
            workingVector14.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * workingVector14.xyzw;
            workingVector12.yzw = workingVector14.xyz * workingVector14.www;
            workingVector12.yzw = float3(6,6,6) * workingVector12.yzw;
            workingVector12.xyz = workingVector12.xxx ? workingVector12.yzw : float3(0,0,0);
            workingVector19.xyz = workingVector3.xxx ? float3(0,0,0) : workingVector12.xyz;
          }
          workingVector6.yzw = workingVector18.xyz * workingVector6.yyy;
          workingVector6.yzw = workingVector16.xyz * workingVector4.www + workingVector6.yzw;
          workingVector6.yzw = workingVector17.xyz * workingVector1.zzz + workingVector6.yzw;
          workingVector13.xyz = workingVector19.xyz * workingVector6.xxx + workingVector6.yzw;
#endif
        }
      } else {
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector14.xyz = float3(0,0,0);
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector13.xyz = float3(0,0,0);
#endif
      }
    } else {
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector14.xyz = workingVector9.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector13.xyz = workingVector8.xyz;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector7.xyz = workingVector3.yyy * workingVector1.xyz;
    workingVector1.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
    workingVector2.z = workingVector1.w * workingVector1.w;
    workingVector2.z = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector2.z;
    workingVector1.w = workingVector1.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector2.z;
    workingVector1.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector1.w + workingVector2.z;
    workingVector13.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector1.www;
    workingVector13.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector13.xyz;
    workingVector13.xyz = workingVector14.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector13.xyz;
    workingVector14.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector13.xyz = max(workingVector14.xyz, workingVector13.xyz);
    workingVector7.xyz = workingVector13.xyz * workingVector7.xyz;
    workingVector7.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector7.xyz;
    workingVector1.w = dot(workingVector1.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector13.xyz = workingVector1.www + -workingVector1.xyz;
    workingVector1.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector13.xyz + workingVector1.xyz;
    workingVector1.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector1.xyz;
    workingVector1.xyz = workingVector1.xyz * workingVector3.xxx;
    workingVector1.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector1.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector6.xyz = workingVector2.yyy * workingVector0.xyz;
    workingVector0.w = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
    workingVector1.z = workingVector0.w * workingVector0.w;
    workingVector1.z = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * workingVector1.z;
    workingVector0.w = workingVector0.w * RD_UNIFORM_TILE_LIGHT_INTENSITY.y + -workingVector1.z;
    workingVector0.w = RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * workingVector0.w + workingVector1.z;
    workingVector12.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * workingVector0.www;
    workingVector12.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector12.xyz;
    workingVector12.xyz = workingVector13.xyz * RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www + workingVector12.xyz;
    workingVector13.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector12.xyz = max(workingVector13.xyz, workingVector12.xyz);
    workingVector6.xyz = workingVector12.xyz * workingVector6.xyz;
    workingVector6.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.www * workingVector6.xyz;
    workingVector0.w = dot(workingVector0.xyz, float3(0.212599993,0.715200007,0.0722000003));
    workingVector12.xyz = workingVector0.www + -workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.yyy * workingVector12.xyz + workingVector0.xyz;
    workingVector0.xyz = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.zzz * workingVector0.xyz;
    workingVector0.xyz = workingVector0.xyz * workingVector2.xxx;
    workingVector0.xyz = RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.xxx * workingVector0.xyz;
#endif
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector12.xyz = float3(0,0,0);
#endif
    workingVector11.xyz = float3(0,0,0);
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector7.xyz = float3(0,0,0);
    workingVector1.xyz = float3(0,0,0);
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector10.xyz = float3(0,0,0);
    workingVector6.xyz = float3(0,0,0);
    workingVector0.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector7.xyz = workingVector7.xyz + workingVector12.xyz;
  workingVector7.xyz = workingVector7.xyz + workingVector11.xyz;
  workingVector1.xyz = workingVector7.xyz + workingVector1.xyz;
  workingVector1.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector7.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
  workingVector2.z = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector2.z != 0) {
    workingVector3.y = workingVector6.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector3.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector3.y;
    workingVector3.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector3.y;
    workingVector3.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector3.y);
    workingVector4.x = RD_COMPARISON_MASK(0 < workingVector3.y);
    if (workingVector4.x != 0) {
      workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector4.x != 0) {
        workingVector4.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector4.x = workingVector1.w ? workingVector4.x : 0;
        workingVector11.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector11.xyz = max(workingVector11.xyz, workingVector7.xyz);
        workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector11.xyz;
        workingVector11.xyz = workingVector4.xxx ? workingVector11.xyz : 0;
        workingVector11.xyz = max(float3(1,1,1), workingVector11.xyz);
        workingVector11.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector11.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector6.xyz = workingVector6.xyz + workingVector11.xyz;
  workingVector6.xyz = workingVector6.xyz + workingVector10.xyz;
  workingVector0.xyz = workingVector6.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.000000);
  workingVector1.z = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.000000);
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.000000);
  if (workingVector1.z != 0) {
    workingVector2.y = workingVector5.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector2.y = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector2.y;
    workingVector2.y = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector2.y;
    workingVector2.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector2.y);
    workingVector3.x = RD_COMPARISON_MASK(0 < workingVector2.y);
    if (workingVector3.x != 0) {
      workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.000000);
      if (workingVector3.x != 0) {
        workingVector3.x = RD_COMPARISON_MASK(RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.000000);
        workingVector3.x = workingVector0.w ? workingVector3.x : 0;
        workingVector6.xyz = RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.xyz * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.www + RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www;
        workingVector10.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
        workingVector6.xyz = max(workingVector10.xyz, workingVector6.xyz);
        workingVector6.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.zzz * workingVector6.xyz;
        workingVector6.xyz = workingVector3.xxx ? workingVector6.xyz : 0;
        workingVector6.xyz = max(float3(1,1,1), workingVector6.xyz);
        workingVector6.xyz = RD_UNIFORM_FOG_COLOR.xyz * workingVector6.xyz;
#endif
      } else {
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector12.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
        workingVector4.x = dot(workingVector12.xyz, workingVector12.xyz);
        workingVector4.x = rsqrt(workingVector4.x);
        workingVector12.xzw = workingVector12.xyz * workingVector4.xxx;
        workingVector13.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector14.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector15.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector5.w = workingVector13.y + -workingVector13.x;
        workingVector4.x = workingVector12.y * workingVector4.x + -workingVector13.x;
        workingVector5.w = 1 / workingVector5.w;
        workingVector5.w = saturate(workingVector5.w * workingVector4.x);
        workingVector7.w = workingVector5.w * -2 + 3;
        workingVector5.w = workingVector5.w * workingVector5.w;
        workingVector5.w = -workingVector7.w * workingVector5.w + 1;
        workingVector7.w = workingVector5.w * workingVector5.w;
        workingVector5.w = workingVector7.w * workingVector5.w;
        workingVector7.w = dot(workingVector12.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector8.w = dot(workingVector12.xzw, RD_UNIFORM_MOON_DIR.xyz);
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector10.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
        workingVector3.x = dot(workingVector10.xyz, workingVector10.xyz);
        workingVector3.x = rsqrt(workingVector3.x);
        workingVector10.xzw = workingVector10.xyz * workingVector3.xxx;
        workingVector11.xy = RD_UNIFORM_FOG_SKY_BLEND.xz + -RD_UNIFORM_FOG_SKY_BLEND.ww;
        workingVector12.xyz = RD_UNIFORM_SUN_COLOR.www * RD_UNIFORM_SUN_COLOR.xyz;
        workingVector13.xyz = RD_UNIFORM_MOON_COLOR.www * RD_UNIFORM_MOON_COLOR.xyz;
        workingVector4.w = workingVector11.y + -workingVector11.x;
        workingVector3.x = workingVector10.y * workingVector3.x + -workingVector11.x;
        workingVector4.w = 1 / workingVector4.w;
        workingVector4.w = saturate(workingVector4.w * workingVector3.x);
        workingVector6.w = workingVector4.w * -2 + 3;
        workingVector4.w = workingVector4.w * workingVector4.w;
        workingVector4.w = -workingVector6.w * workingVector4.w + 1;
        workingVector6.w = workingVector4.w * workingVector4.w;
        workingVector4.w = workingVector6.w * workingVector4.w;
        workingVector6.w = dot(workingVector10.xzw, RD_UNIFORM_SUN_DIR.xyz);
        workingVector7.w = dot(workingVector10.xzw, RD_UNIFORM_MOON_DIR.xyz);
        workingVector8.w = workingVector6.w * workingVector6.w + 1;
        workingVector8.w = RD_UNIFORM_SUN_COLOR.w * workingVector8.w;
#endif
        workingVector9.w = workingVector7.w * workingVector7.w + 1;
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector9.w = RD_UNIFORM_SUN_COLOR.w * workingVector9.w;
        workingVector10.w = workingVector8.w * workingVector8.w + 1;
        workingVector10.w = RD_UNIFORM_MOON_COLOR.w * workingVector10.w;
        workingVector10.w = 0.75 * workingVector10.w;
        workingVector11.w = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector13.x;
        workingVector11.w = 1 / workingVector11.w;
        workingVector4.x = saturate(workingVector11.w * workingVector4.x);
        workingVector11.w = workingVector4.x * -2 + 3;
        workingVector4.x = workingVector4.x * workingVector4.x;
        workingVector4.x = -workingVector11.w * workingVector4.x + 1;
        workingVector11.w = workingVector4.x * workingVector4.x;
        workingVector4.x = workingVector11.w * workingVector4.x;
        workingVector12.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = workingVector4.xxx * workingVector12.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector12.xyz;
        workingVector12.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector12.xyz;
        workingVector4.x = workingVector9.w * 0.75 + workingVector10.w;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector9.w = RD_UNIFORM_MOON_COLOR.w * workingVector9.w;
        workingVector9.w = 0.75 * workingVector9.w;
        workingVector10.x = RD_UNIFORM_FOG_SKY_BLEND.y + -workingVector11.x;
        workingVector10.x = 1 / workingVector10.x;
        workingVector3.x = saturate(workingVector10.x * workingVector3.x);
        workingVector10.x = workingVector3.x * -2 + 3;
        workingVector3.x = workingVector3.x * workingVector3.x;
        workingVector3.x = -workingVector10.x * workingVector3.x + 1;
        workingVector10.x = workingVector3.x * workingVector3.x;
        workingVector3.x = workingVector10.x * workingVector3.x;
        workingVector10.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz + -RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector10.xyz = workingVector3.xxx * workingVector10.xyz + RD_UNIFORM_SKY_ZENITH_COLOR.xyz;
        workingVector10.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.xxx * workingVector10.xyz;
        workingVector10.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector10.xyz;
        workingVector3.x = workingVector8.w * 0.75 + workingVector9.w;
        workingVector6.w = max(0, workingVector6.w);
        workingVector6.w = log2(workingVector6.w);
        workingVector6.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector6.w;
        workingVector6.w = exp2(workingVector6.w);
        workingVector6.w = min(1, workingVector6.w);
#endif
        workingVector7.w = max(0, workingVector7.w);
        workingVector7.w = log2(workingVector7.w);
        workingVector7.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector7.w;
        workingVector7.w = exp2(workingVector7.w);
        workingVector7.w = min(1, workingVector7.w);
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector8.w = max(0, workingVector8.w);
        workingVector8.w = log2(workingVector8.w);
        workingVector8.w = RD_UNIFORM_ATMOSPHERIC_SCATTERING.w * workingVector8.w;
        workingVector8.w = exp2(workingVector8.w);
        workingVector8.w = min(1, workingVector8.w);
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector8.w = -workingVector6.w * 1.79999995 + 1.80999994;
        workingVector9.w = sqrt(workingVector8.w);
        workingVector8.w = workingVector9.w * workingVector8.w;
        workingVector8.w = 0.0361000001 / workingVector8.w;
#endif
        workingVector9.w = -workingVector7.w * 1.79999995 + 1.80999994;
        workingVector10.w = sqrt(workingVector9.w);
        workingVector9.w = workingVector10.w * workingVector9.w;
        workingVector9.w = 0.0361000001 / workingVector9.w;
#if RD_FEATURE_SEASONS == RD_OFF
        workingVector10.w = -workingVector8.w * 1.79999995 + 1.80999994;
        workingVector11.w = sqrt(workingVector10.w);
        workingVector10.w = workingVector11.w * workingVector10.w;
        workingVector10.w = 0.0361000001 / workingVector10.w;
        workingVector13.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector14.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector7.www;
        workingVector14.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector15.xyz;
        workingVector14.xyz = workingVector14.xyz * workingVector8.www;
        workingVector14.xyz = workingVector14.xyz * workingVector10.www;
        workingVector15.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector5.www;
        workingVector15.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector15.xyz;
        workingVector13.xyz = workingVector13.xyz * workingVector9.www + workingVector14.xyz;
        workingVector13.xyz = workingVector15.xyz * workingVector13.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector4.xxx + workingVector13.xyz;
        workingVector4.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector5.w = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector13.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector12.xyz;
        workingVector13.xyz = workingVector5.www * workingVector13.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector11.xyz = workingVector4.xxx ? workingVector13.xyz : workingVector12.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
        workingVector11.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.yyy * workingVector12.xyz;
        workingVector11.xyz = workingVector11.xyz * workingVector6.www;
        workingVector12.xyz = RD_UNIFORM_ATMOSPHERIC_SCATTERING.zzz * workingVector13.xyz;
        workingVector12.xyz = workingVector12.xyz * workingVector7.www;
        workingVector12.xyz = workingVector12.xyz * workingVector9.www;
        workingVector13.xyz = RD_UNIFORM_SKY_HORIZON_COLOR.xyz * workingVector4.www;
        workingVector13.xyz = float3(0.0795774683,0.0795774683,0.0795774683) * workingVector13.xyz;
        workingVector11.xyz = workingVector11.xyz * workingVector8.www + workingVector12.xyz;
        workingVector11.xyz = workingVector13.xyz * workingVector11.xyz;
        workingVector10.xyz = workingVector10.xyz * workingVector3.xxx + workingVector11.xyz;
        workingVector3.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w);
        workingVector4.w = max(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y);
        workingVector11.xyz = -RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz + workingVector10.xyz;
        workingVector11.xyz = workingVector4.www * workingVector11.xyz + RD_UNIFORM_UNDERGROUND_FOG_COLOR.xyz;
        workingVector6.xyz = workingVector3.xxx ? workingVector11.xyz : workingVector10.xyz;
#endif
      }
    } else {
#if RD_FEATURE_SEASONS == RD_OFF
      workingVector11.xyz = float3(0,0,0);
#elif RD_FEATURE_SEASONS == RD_ON
      workingVector6.xyz = float3(0,0,0);
#endif
    }
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector11.xyz = float3(0,0,0);
    workingVector3.y = 0;
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector6.xyz = float3(0,0,0);
    workingVector2.y = 0;
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector11.xyz = workingVector11.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector3.yyy * workingVector11.xyz + workingVector1.xyz;
  if (workingVector3.x != 0) {
    workingVector11.xy = float2(1,1) + workingVector4.yz;
    workingVector11.xy = float2(0.5,0.5) * workingVector11.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector4.zz;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector4.yy + workingVector12.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector4.ww + workingVector12.xy;
    workingVector12.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector12.xy;
    workingVector3.y = -workingVector12.x / workingVector12.y;
    workingVector3.y = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector3.y;
    workingVector4.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector3.y = workingVector3.y / workingVector4.x;
    workingVector3.y = workingVector3.y * 53.5981483 + 1;
    workingVector3.y = log2(workingVector3.y);
    workingVector3.y = 0.173286796 * workingVector3.y;
    workingVector4.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector5.w = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector3.y = workingVector3.y * workingVector5.w + -0.5;
    workingVector5.w = (int)workingVector3.y;
    workingVector4.x = (int)workingVector4.x + -2;
    workingVector5.w = max(0, (int)workingVector5.w);
    workingVector4.x = min((int)workingVector5.w, (int)workingVector4.x);
    workingVector11.z = (int)workingVector4.x;
    workingVector3.y = saturate(-workingVector11.z + workingVector3.y);
    workingVector12.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector11.xyz, 0).xyzw;
    workingVector4.x = (int)workingVector4.x + 1;
    workingVector11.w = (int)workingVector4.x;
    workingVector11.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector11.xyw, 0).xyzw;
    workingVector11.xyzw = workingVector11.xyzw + -workingVector12.xyzw;
    workingVector11.xyzw = workingVector3.yyyy * workingVector11.xyzw + workingVector12.xyzw;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector6.xyz = workingVector6.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.yyy * workingVector6.xyz + workingVector0.xyz;
  if (workingVector2.x != 0) {
    workingVector6.xy = float2(1,1) + workingVector3.yz;
    workingVector6.xy = float2(0.5,0.5) * workingVector6.xy;
    workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector3.zz;
    workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector3.yy + workingVector10.xy;
    workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector3.ww + workingVector10.xy;
    workingVector10.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector10.xy;
    workingVector2.y = -workingVector10.x / workingVector10.y;
    workingVector2.y = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector2.y;
    workingVector3.x = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
    workingVector2.y = workingVector2.y / workingVector3.x;
    workingVector2.y = workingVector2.y * 53.5981483 + 1;
    workingVector2.y = log2(workingVector2.y);
    workingVector2.y = 0.173286796 * workingVector2.y;
    workingVector3.x = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
    workingVector4.w = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
    workingVector2.y = workingVector2.y * workingVector4.w + -0.5;
    workingVector4.w = (int)workingVector2.y;
    workingVector3.x = (int)workingVector3.x + -2;
    workingVector4.w = max(0, (int)workingVector4.w);
    workingVector3.x = min((int)workingVector4.w, (int)workingVector3.x);
    workingVector6.z = (int)workingVector3.x;
    workingVector2.y = saturate(-workingVector6.z + workingVector2.y);
    workingVector10.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector6.xyz, 0).xyzw;
    workingVector3.x = (int)workingVector3.x + 1;
    workingVector6.w = (int)workingVector3.x;
    workingVector6.xyzw = materialTexture7.SampleLevel(textureSampler7, workingVector6.xyw, 0).xyzw;
    workingVector6.xyzw = workingVector6.xyzw + -workingVector10.xyzw;
    workingVector6.xyzw = workingVector2.yyyy * workingVector6.xyzw + workingVector10.xyzw;
#endif
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector11.xyzw = float4(0,0,0,1);
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector6.xyzw = float4(0,0,0,1);
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector1.xyz = workingVector11.www * workingVector1.xyz + workingVector11.xyz;
  workingVector3.y = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector3.y != 0) {
    workingVector3.y = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector3.y = max(1, workingVector3.y);
    workingVector4.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector3.y = saturate(workingVector4.x / workingVector3.y);
    workingVector4.x = workingVector3.y * workingVector3.y;
    workingVector3.y = workingVector4.x * workingVector3.y;
    workingVector3.y = RD_UNIFORM_IBL_PARAMETERS.x * workingVector3.y;
    workingVector4.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector5.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector7.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector8.yyy;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector8.xxx + workingVector11.xyz;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector8.zzz + workingVector11.xyz;
    workingVector11.xyz = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector11.xyz;
    workingVector8.xyz = workingVector7.www ? workingVector8.xyz : varyingTexCoord3.xyz;
    workingVector5.xyz = workingVector7.www ? workingVector11.xyz : workingVector5.xyz;
    workingVector8.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector8.xyz;
    workingVector7.w = dot(workingVector8.xyz, workingVector8.xyz);
    workingVector7.w = rsqrt(workingVector7.w);
    workingVector8.xyz = workingVector8.xyz * workingVector7.www;
    workingVector7.w = dot(workingVector5.xyz, workingVector5.xyz);
    workingVector7.w = rsqrt(workingVector7.w);
    workingVector5.xyz = workingVector7.www * workingVector5.xyz;
    workingVector7.w = dot(workingVector8.xyz, workingVector2.xyw);
    workingVector7.w = workingVector7.w + workingVector7.w;
    workingVector8.xyz = workingVector2.xyw * -workingVector7.www + workingVector8.xyz;
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector5.w == 1);
    workingVector11.y = 1 + -workingVector3.z;
    workingVector2.y = workingVector11.y * workingVector11.y;
    workingVector2.w = -workingVector11.y * workingVector11.y + 1;
    workingVector3.z = -1 + RD_UNIFORM_IBL_PARAMETERS.y;
    workingVector2.y = workingVector2.y * workingVector2.y;
    workingVector2.y = -workingVector2.y * workingVector2.y + 1;
    workingVector2.yw = workingVector3.zz * workingVector2.yw;
    workingVector2.x = workingVector2.x ? workingVector2.w : workingVector2.y;
    workingVector2.y = (int)RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x;
    workingVector2.y = (int)workingVector2.y + 2;
    workingVector2.w = (int)workingVector2.y & 0x80000000;
    workingVector2.y = max((int)-workingVector2.y, (int)workingVector2.y);
    workingVector2.y = (uint)workingVector2.y % 3;
    workingVector3.z = -(int)workingVector2.y;
    workingVector2.y = workingVector2.w ? workingVector3.z : workingVector2.y;
    workingVector8.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
    workingVector12.xyz = materialTexture9.SampleLevel(textureSampler9, workingVector8.xyzw, workingVector2.x).xyz;
    workingVector8.w = (int)workingVector2.y;
    workingVector2.xyw = materialTexture9.SampleLevel(textureSampler9, workingVector8.xyzw, workingVector2.x).xyz;
    workingVector8.xyz = workingVector12.xyz + -workingVector2.xyw;
    workingVector2.xyw = RD_UNIFORM_IBL_PARAMETERS.www * workingVector8.xyz + workingVector2.xyw;
    workingVector8.xyz = float3(301.724121,301.724121,301.724121) * workingVector2.xyw;
    workingVector2.xyw = workingVector4.xxx ? workingVector8.xyz : workingVector2.xyw;
    workingVector2.xyw = workingVector2.xyw * workingVector3.yyy;
    workingVector2.xyw = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector2.xyw;
    workingVector8.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector9.xyz;
    workingVector9.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector8.xyz;
    workingVector3.y = saturate(dot(workingVector9.xyz, float3(0.212599993,0.715200007,0.0722000003)));
    workingVector8.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector8.xyz + -workingVector7.xyz;
    workingVector7.xyz = workingVector3.yyy * workingVector8.xyz + workingVector7.xyz;
    workingVector3.yzw = workingVector7.xyz * workingVector3.www;
    workingVector4.x = dot(workingVector2.xyw, float3(0.212599993,0.715200007,0.0722000003));
    workingVector5.w = dot(workingVector3.yzw, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.x = RD_COMPARISON_MASK(workingVector4.x < workingVector5.w);
    workingVector3.yzw = workingVector4.xxx ? workingVector3.yzw : 0;
    workingVector3.yzw = workingVector4.xxx ? workingVector3.yzw : workingVector2.xyw;
    workingVector2.xyw = workingVector1.www ? workingVector3.yzw : workingVector2.xyw;
    workingVector11.x = saturate(dot(workingVector6.xyz, -workingVector5.xyz));
    workingVector3.yz = materialTexture0.Sample(textureSampler0, workingVector11.xy).xy;
    workingVector3.yzw = workingVector10.xyz * workingVector3.yyy + workingVector3.zzz;
    workingVector2.xyw = workingVector3.yzw * workingVector2.xyw;
    workingVector1.w = workingVector6.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector1.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector1.w;
    workingVector1.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector1.w;
    workingVector3.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector1.w);
    workingVector3.y = 1 + -workingVector3.y;
    workingVector3.yzw = workingVector3.yyy * workingVector2.xyw;
    workingVector4.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector1.w = saturate(workingVector1.w / workingVector4.x);
    workingVector1.w = 1 + -workingVector1.w;
    workingVector2.xyw = workingVector2.xyw * workingVector1.www;
    workingVector2.xyz = workingVector2.zzz ? workingVector3.yzw : workingVector2.xyw;
    if (workingVector3.x != 0) {
      workingVector3.xy = float2(1,1) + workingVector4.yz;
      workingVector3.xy = float2(0.5,0.5) * workingVector3.xy;
      workingVector4.xz = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector4.zz;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector4.yy + workingVector4.xz;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector4.ww + workingVector4.xy;
      workingVector4.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector4.xy;
      workingVector1.w = -workingVector4.x / workingVector4.y;
      workingVector1.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector1.w;
      workingVector2.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector1.w = workingVector1.w / workingVector2.w;
      workingVector1.w = workingVector1.w * 53.5981483 + 1;
      workingVector1.w = log2(workingVector1.w);
      workingVector1.w = 0.173286796 * workingVector1.w;
      workingVector2.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector4.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector1.w = workingVector1.w * workingVector4.x + -0.5;
      workingVector4.x = (int)workingVector1.w;
      workingVector2.w = (int)workingVector2.w + -2;
      workingVector4.x = max(0, (int)workingVector4.x);
      workingVector2.w = min((int)workingVector4.x, (int)workingVector2.w);
      workingVector3.z = (int)workingVector2.w;
      workingVector1.w = saturate(-workingVector3.z + workingVector1.w);
      workingVector3.z = materialTexture7.SampleLevel(textureSampler7, workingVector3.xyz, 0).w;
      workingVector2.w = (int)workingVector2.w + 1;
      workingVector3.w = (int)workingVector2.w;
      workingVector2.w = materialTexture7.SampleLevel(textureSampler7, workingVector3.xyw, 0).w;
      workingVector2.w = workingVector2.w + -workingVector3.z;
      workingVector1.w = workingVector1.w * workingVector2.w + workingVector3.z;
      workingVector2.xyz = workingVector1.www * workingVector2.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector0.xyz = workingVector6.www * workingVector0.xyz + workingVector6.xyz;
  workingVector2.y = RD_COMPARISON_MASK(RD_UNIFORM_IBL_PARAMETERS.x != 0.000000);
  if (workingVector2.y != 0) {
    workingVector2.y = RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.y = max(1, workingVector2.y);
    workingVector3.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16 + -RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y;
    workingVector2.y = saturate(workingVector3.x / workingVector2.y);
    workingVector3.x = workingVector2.y * workingVector2.y;
    workingVector2.y = workingVector3.x * workingVector2.y;
    workingVector2.y = RD_UNIFORM_IBL_PARAMETERS.x * workingVector2.y;
    workingVector3.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
    workingVector4.w = (int)RD_UNIFORM_CONVOLUTION_TYPE.x;
    workingVector6.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_QUANTIZATION_PARAMETERS.w);
    workingVector6.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_1.xyz * workingVector7.yyy;
    workingVector6.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_0.xyz * workingVector7.xxx + workingVector6.yzw;
    workingVector6.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_2.xyz * workingVector7.zzz + workingVector6.yzw;
    workingVector6.yzw = RD_UNIFORM_VIEW_MATRIX_ROW_3.xyz + workingVector6.yzw;
    workingVector7.xyz = workingVector6.xxx ? workingVector7.xyz : varyingTexCoord3.xyz;
    workingVector4.xyz = workingVector6.xxx ? workingVector6.yzw : workingVector4.xyz;
    workingVector6.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + workingVector7.xyz;
    workingVector6.w = dot(workingVector6.xyz, workingVector6.xyz);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector6.xyz = workingVector6.xyz * workingVector6.www;
    workingVector6.w = dot(workingVector4.xyz, workingVector4.xyz);
    workingVector6.w = rsqrt(workingVector6.w);
    workingVector4.xyz = workingVector6.www * workingVector4.xyz;
    workingVector6.w = dot(workingVector6.xyz, workingVector1.xyw);
    workingVector6.w = workingVector6.w + workingVector6.w;
    workingVector6.xyz = workingVector1.xyw * -workingVector6.www + workingVector6.xyz;
    workingVector1.x = RD_COMPARISON_MASK((int)workingVector4.w == 1);
    workingVector7.y = 1 + -workingVector2.z;
    workingVector1.y = workingVector7.y * workingVector7.y;
    workingVector1.w = -workingVector7.y * workingVector7.y + 1;
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
    workingVector6.w = trunc(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x);
    workingVector10.xyz = materialTexture9.SampleLevel(textureSampler9, workingVector6.xyzw, workingVector1.x).xyz;
    workingVector6.w = (int)workingVector1.y;
    workingVector1.xyw = materialTexture9.SampleLevel(textureSampler9, workingVector6.xyzw, workingVector1.x).xyz;
    workingVector6.xyz = workingVector10.xyz + -workingVector1.xyw;
    workingVector1.xyw = RD_UNIFORM_IBL_PARAMETERS.www * workingVector6.xyz + workingVector1.xyw;
    workingVector6.xyz = float3(301.724121,301.724121,301.724121) * workingVector1.xyw;
    workingVector1.xyw = workingVector3.xxx ? workingVector6.xyz : workingVector1.xyw;
    workingVector1.xyw = workingVector1.xyw * workingVector2.yyy;
    workingVector1.xyw = RD_UNIFORM_IBL_PARAMETERS.zzz * workingVector1.xyw;
    workingVector6.xyz = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.xyz * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.www;
    workingVector8.xyz = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.www * workingVector8.xyz;
    workingVector10.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector8.xyz;
    workingVector2.y = saturate(dot(workingVector10.xyz, float3(0.212599993,0.715200007,0.0722000003)));
    workingVector8.xyz = RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.xxx * workingVector8.xyz + -workingVector6.xyz;
    workingVector6.xyz = workingVector2.yyy * workingVector8.xyz + workingVector6.xyz;
    workingVector2.yzw = workingVector6.xyz * workingVector2.www;
    workingVector3.x = dot(workingVector1.xyw, float3(0.212599993,0.715200007,0.0722000003));
    workingVector4.w = dot(workingVector2.yzw, float3(0.212599993,0.715200007,0.0722000003));
    workingVector3.x = RD_COMPARISON_MASK(workingVector3.x < workingVector4.w);
    workingVector2.yzw = workingVector3.xxx ? workingVector2.yzw : 0;
    workingVector2.yzw = workingVector3.xxx ? workingVector2.yzw : workingVector1.xyw;
    workingVector1.xyw = workingVector0.www ? workingVector2.yzw : workingVector1.xyw;
    workingVector7.x = saturate(dot(workingVector5.xyz, -workingVector4.xyz));
    workingVector2.yz = materialTexture0.Sample(textureSampler0, workingVector7.xy).xy;
    workingVector2.yzw = workingVector9.xyz * workingVector2.yyy + workingVector2.zzz;
    workingVector1.xyw = workingVector2.yzw * workingVector1.xyw;
    workingVector0.w = workingVector5.w / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z;
    workingVector0.w = RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x + workingVector0.w;
    workingVector0.w = -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x + workingVector0.w;
    workingVector2.y = saturate(RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y * workingVector0.w);
    workingVector2.y = 1 + -workingVector2.y;
    workingVector2.yzw = workingVector2.yyy * workingVector1.xyw;
    workingVector3.x = RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y + -RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x;
    workingVector0.w = saturate(workingVector0.w / workingVector3.x);
    workingVector0.w = 1 + -workingVector0.w;
    workingVector1.xyw = workingVector1.xyw * workingVector0.www;
    workingVector1.xyz = workingVector1.zzz ? workingVector2.yzw : workingVector1.xyw;
    if (workingVector2.x != 0) {
      workingVector2.xy = float2(1,1) + workingVector3.yz;
      workingVector2.xy = float2(0.5,0.5) * workingVector2.xy;
      workingVector3.xz = RD_UNIFORM_INV_PROJ_ROW_1.zw * workingVector3.zz;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_0.zw * workingVector3.yy + workingVector3.xz;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_2.zw * workingVector3.ww + workingVector3.xy;
      workingVector3.xy = RD_UNIFORM_INV_PROJ_ROW_3.zw + workingVector3.xy;
      workingVector0.w = -workingVector3.x / workingVector3.y;
      workingVector0.w = -RD_UNIFORM_VOLUME_NEAR_FAR.x + workingVector0.w;
      workingVector1.w = RD_UNIFORM_VOLUME_NEAR_FAR.y + -RD_UNIFORM_VOLUME_NEAR_FAR.x;
      workingVector0.w = workingVector0.w / workingVector1.w;
      workingVector0.w = workingVector0.w * 53.5981483 + 1;
      workingVector0.w = log2(workingVector0.w);
      workingVector0.w = 0.173286796 * workingVector0.w;
      workingVector1.w = (int)RD_UNIFORM_VOLUME_DIMENSIONS.z;
      workingVector3.x = trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z);
      workingVector0.w = workingVector0.w * workingVector3.x + -0.5;
      workingVector3.x = (int)workingVector0.w;
      workingVector1.w = (int)workingVector1.w + -2;
      workingVector3.x = max(0, (int)workingVector3.x);
      workingVector1.w = min((int)workingVector3.x, (int)workingVector1.w);
      workingVector2.z = (int)workingVector1.w;
      workingVector0.w = saturate(-workingVector2.z + workingVector0.w);
      workingVector2.z = materialTexture7.SampleLevel(textureSampler7, workingVector2.xyz, 0).w;
      workingVector1.w = (int)workingVector1.w + 1;
      workingVector2.w = (int)workingVector1.w;
      workingVector1.w = materialTexture7.SampleLevel(textureSampler7, workingVector2.xyw, 0).w;
      workingVector1.w = workingVector1.w + -workingVector2.z;
      workingVector0.w = workingVector0.w * workingVector1.w + workingVector2.z;
      workingVector1.xyz = workingVector0.www * workingVector1.xyz;
#endif
    }
  } else {
#if RD_FEATURE_SEASONS == RD_OFF
    workingVector2.xyz = float3(0,0,0);
#elif RD_FEATURE_SEASONS == RD_ON
    workingVector1.xyz = float3(0,0,0);
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector0.xyz = workingVector2.xyz + workingVector1.xyz;
  workingVector1.x = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.x != 0) {
    workingVector1.x = materialTexture4.Sample(textureSampler4, float2(0.5,0.5)).x;
    workingVector1.x = 0.180000007 / workingVector1.x;
    workingVector1.x = 9.99999975e-005 + workingVector1.x;
    workingVector0.xyz = workingVector1.xxx * workingVector0.xyz;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector0.xyz = workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.w != 0) {
    workingVector0.w = materialTexture4.Sample(textureSampler4, float2(0.5,0.5)).x;
    workingVector0.w = 0.180000007 / workingVector0.w;
    workingVector0.w = 9.99999975e-005 + workingVector0.w;
    workingVector0.xyz = workingVector0.xyz * workingVector0.www;
#endif
  }
#if RD_FEATURE_SEASONS == RD_OFF
  fragmentColor0.xyzw = workingVector0.xyzw;
#elif RD_FEATURE_SEASONS == RD_ON
  fragmentColor0.xyz = workingVector0.xyz;
  fragmentColor0.w = 1;
#endif
  fragmentColor1.xyzw = float4(0,0,0,0);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_SEASONS == RD_OFF
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    float productValue = scalarValue1 * varyingColor0.x;
    float productValue1 = scalarValue2 * varyingColor0.y;
    float productValue2 = scalarValue3 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue10;
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
        intermediateValue10 = 1.0f;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
        intermediateValue10 = scalarValue4 * varyingColor0.w;
    }
#elif RD_FEATURE_SEASONS == RD_ON
    float4 sampledTextureValue14 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
    float productValue198 = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue14.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    float productValue199 = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue14.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    float productValue200 = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue14.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
#endif
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_COLOR_GRADING_OPTIMIZE_GAMMA_CORRECTION.x != 0.0f)
    {
#if RD_FEATURE_SEASONS == RD_OFF
        exponentialValue = exp2(log2(max(productValue3, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue4, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue5, 0.0f)) * 2.2000000476837158203125f);
#elif RD_FEATURE_SEASONS == RD_ON
        exponentialValue = exp2(log2(max(productValue198, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue1 = exp2(log2(max(productValue199, 0.0f)) * 2.2000000476837158203125f);
        exponentialValue2 = exp2(log2(max(productValue200, 0.0f)) * 2.2000000476837158203125f);
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        exponentialValue = (productValue3 <= 0.040449999272823333740234375f) ? (productValue3 * 0.077399380505084991455078125f) : exp2(log2((productValue3 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue4 <= 0.040449999272823333740234375f) ? (productValue4 * 0.077399380505084991455078125f) : exp2(log2((productValue4 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue5 <= 0.040449999272823333740234375f) ? (productValue5 * 0.077399380505084991455078125f) : exp2(log2((productValue5 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#elif RD_FEATURE_SEASONS == RD_ON
        exponentialValue = (productValue198 <= 0.040449999272823333740234375f) ? (productValue198 * 0.077399380505084991455078125f) : exp2(log2((productValue198 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue1 = (productValue199 <= 0.040449999272823333740234375f) ? (productValue199 * 0.077399380505084991455078125f) : exp2(log2((productValue199 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
        exponentialValue2 = (productValue200 <= 0.040449999272823333740234375f) ? (productValue200 * 0.077399380505084991455078125f) : exp2(log2((productValue200 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
#endif
    }
    float multiplyAddValue;
#if RD_FEATURE_SEASONS == RD_ON
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue10;
#endif
    float intermediateValue11;
    float intermediateValue12;
#if RD_FEATURE_SEASONS == RD_OFF
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
#endif
    if (scalarValue == 65535u)
    {
        multiplyAddValue = 0.0f;
#if RD_FEATURE_SEASONS == RD_ON
        intermediateValue6 = 1.0f;
        intermediateValue7 = 0.0f;
        intermediateValue8 = 0.0f;
        intermediateValue10 = 0.0f;
#endif
        intermediateValue11 = 1.0f;
        intermediateValue12 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue13 = 0.0f;
        intermediateValue15 = 0.0f;
        intermediateValue16 = 1.0f;
        intermediateValue17 = 0.0f;
#endif
    }
    else
    {
        float loadedBufferValue3 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 4u).x);
        float loadedBufferValue4 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 5u).x);
        float loadedBufferValue5 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 6u).x);
        float loadedBufferValue6 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 7u).x);
        uint4 loadedBufferValue7 = rdLoad_pbrData((scalarValue * 16u) + 8u);
        uint scalarValue5 = loadedBufferValue7.x;
        float loadedBufferValue8 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 12u).x);
        float loadedBufferValue9 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 13u).x);
        float loadedBufferValue10 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 15u).x);
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
#endif
        if ((scalarValue5 & 4u) == 0u)
        {
            float branchMergedValue9;
#if RD_FEATURE_SEASONS == RD_OFF
            float branchMergedValue17;
            float branchMergedValue18;
#elif RD_FEATURE_SEASONS == RD_ON
            float branchMergedValue15;
            float branchMergedValue16;
#endif
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue48;
                float branchMergedValue52;
                float branchMergedValue53;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue48 = 1.0f;
                    branchMergedValue52 = 0.0f;
                    branchMergedValue53 = 0.0f;
                }
                else
                {
                    float multiplyAddValue1 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                    float multiplyAddValue2 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                    float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue1, multiplyAddValue2), 0.0f);
                    float scalarValue6 = sampledTextureValue1.x;
                    float scalarValue7 = sampledTextureValue1.y;
                    float scalarValue8 = sampledTextureValue1.z;
                    float multiplyAddValue3 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue = multiplyAddValue3 > 0.0f;
                    float branchMergedValue61;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue68;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if (conditionValue)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            uint unusedTextureMipCount1435;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1435);
                            float productValue6 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue1;
                            float productValue7 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue2;
                            float scalarValue9 = frac(productValue6);
                            float scalarValue10 = frac(productValue7);
#elif RD_FEATURE_SEASONS == RD_ON
                            uint unusedTextureMipCount1437;
                            uint2 vectorValue8 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1437);
                            float productValue201 = float(int(uint(int(float(int(vectorValue8.x)))))) * multiplyAddValue1;
                            float productValue202 = float(int(uint(int(float(int(vectorValue8.y)))))) * multiplyAddValue2;
                            float scalarValue88 = frac(productValue201);
                            float scalarValue89 = frac(productValue202);
#endif
                            float comparisonValue18;
#if RD_FEATURE_SEASONS == RD_OFF
                            if (abs(scalarValue9 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                            if (abs(scalarValue88 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                comparisonValue18 = ((scalarValue9 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif RD_FEATURE_SEASONS == RD_ON
                                comparisonValue18 = ((scalarValue88 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                            }
                            else
                            {
                                comparisonValue18 = multiplyAddValue1;
                            }
                            float comparisonValue20;
#if RD_FEATURE_SEASONS == RD_OFF
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                            if (abs(scalarValue89 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                comparisonValue20 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif RD_FEATURE_SEASONS == RD_ON
                                comparisonValue20 = ((scalarValue89 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#endif
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue2;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue18, comparisonValue20));
                            float scalarValue11 = vectorValue1.x;
                            float scalarValue12 = vectorValue1.y;
                            float scalarValue13 = vectorValue1.z;
                            float scalarValue14 = vectorValue1.w;
#if RD_FEATURE_SEASONS == RD_OFF
                            float sumValue = frac(productValue6 + 0.5f);
                            float sumValue1 = frac(productValue7 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
#elif RD_FEATURE_SEASONS == RD_ON
                            float sumValue114 = frac(productValue201 + 0.5f);
                            float sumValue115 = frac(productValue202 + 0.5f);
                            bool conditionValue7 = sumValue115 > 0.5f;
#endif
                            float intermediateValue4[2];
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue4[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue4[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float clampedValue3 = intermediateValue4[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue4 = intermediateValue4[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue3 - clampedValue4;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue4[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue4[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float clampedValue5 = intermediateValue4[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                            float productValue8 = inverseLengthValue * multiplyAddValue3;
                            branchMergedValue68 = inverseLengthValue * 0.25f;
                            branchMergedValue70 = productValue8 * clampedValue5;
                            branchMergedValue71 = productValue8 * sumValue2;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue4[0u] = conditionValue7 ? scalarValue11 : scalarValue14;
                            intermediateValue4[1u] = conditionValue7 ? scalarValue12 : scalarValue13;
                            float clampedValue25 = intermediateValue4[uint(int(clamp((sumValue114 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue26 = intermediateValue4[uint(int(clamp((sumValue114 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue116 = clampedValue25 - clampedValue26;
                            bool conditionValue8 = sumValue114 > 0.5f;
                            intermediateValue4[0u] = conditionValue8 ? scalarValue13 : scalarValue14;
                            intermediateValue4[1u] = conditionValue8 ? scalarValue12 : scalarValue11;
                            float clampedValue27 = intermediateValue4[uint(int(clamp((sumValue115 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue4[uint(int(clamp((sumValue115 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue18 = rsqrt(dot(float3(sumValue116, clampedValue27, 0.25f), float3(sumValue116, clampedValue27, 0.25f)));
                            float productValue203 = inverseLengthValue18 * multiplyAddValue3;
                            branchMergedValue68 = inverseLengthValue18 * 0.25f;
                            branchMergedValue70 = productValue203 * clampedValue27;
                            branchMergedValue71 = productValue203 * sumValue116;
#endif
                        }
                        else
                        {
                            branchMergedValue68 = 1.0f;
                            branchMergedValue70 = 0.0f;
                            branchMergedValue71 = 0.0f;
                        }
                        branchMergedValue61 = branchMergedValue68;
                        branchMergedValue63 = branchMergedValue70;
                        branchMergedValue64 = branchMergedValue71;
                    }
                    else
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        uint unusedTextureMipCount983;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount983);
#elif RD_FEATURE_SEASONS == RD_ON
                        uint unusedTextureMipCount985;
                        uint2 vectorValue9 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount985);
#endif
                        float branchMergedValue69;
                        float branchMergedValue72;
                        float branchMergedValue73;
                        if (conditionValue)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            float productValue9 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue1);
                            float productValue10 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue2);
                            float comparisonValue1 = (((productValue9 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue9 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue2 = (((productValue10 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue10 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                            float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, 0.25f), float3(comparisonValue3, comparisonValue4, 0.25f)));
                            float productValue11 = inverseLengthValue1 * multiplyAddValue3;
                            branchMergedValue69 = inverseLengthValue1 * 0.25f;
                            branchMergedValue72 = productValue11 * comparisonValue4;
                            branchMergedValue73 = productValue11 * comparisonValue3;
#elif RD_FEATURE_SEASONS == RD_ON
                            float productValue204 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * multiplyAddValue1);
                            float productValue205 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * multiplyAddValue2);
                            float comparisonValue69 = (((productValue204 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue204 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue70 = (((productValue205 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue205 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue71 = ((abs(comparisonValue69) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue69;
                            float comparisonValue72 = ((abs(comparisonValue70) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue70;
                            float inverseLengthValue19 = rsqrt(dot(float3(comparisonValue71, comparisonValue72, 0.25f), float3(comparisonValue71, comparisonValue72, 0.25f)));
                            float productValue206 = inverseLengthValue19 * multiplyAddValue3;
                            branchMergedValue69 = inverseLengthValue19 * 0.25f;
                            branchMergedValue72 = productValue206 * comparisonValue72;
                            branchMergedValue73 = productValue206 * comparisonValue71;
#endif
                        }
                        else
                        {
                            branchMergedValue69 = 1.0f;
                            branchMergedValue72 = 0.0f;
                            branchMergedValue73 = 0.0f;
                        }
                        branchMergedValue61 = branchMergedValue69;
                        branchMergedValue63 = branchMergedValue72;
                        branchMergedValue64 = branchMergedValue73;
                    }
                    branchMergedValue48 = branchMergedValue61;
                    branchMergedValue52 = branchMergedValue63;
                    branchMergedValue53 = branchMergedValue64;
                }
                branchMergedValue9 = branchMergedValue48;
#if RD_FEATURE_SEASONS == RD_OFF
                branchMergedValue17 = branchMergedValue52;
                branchMergedValue18 = branchMergedValue53;
#elif RD_FEATURE_SEASONS == RD_ON
                branchMergedValue15 = branchMergedValue52;
                branchMergedValue16 = branchMergedValue53;
#endif
            }
            else
            {
                float multiplyAddValue4 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                float multiplyAddValue5 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                float multiplyAddValue6 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue49;
                float branchMergedValue54;
                float branchMergedValue55;
                if (multiplyAddValue6 > 0.0f)
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    uint unusedTextureMipCount863;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount863);
                    float productValue12 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue4;
                    float productValue13 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue5;
                    float scalarValue15 = frac(productValue12);
                    float scalarValue16 = frac(productValue13);
#elif RD_FEATURE_SEASONS == RD_ON
                    uint unusedTextureMipCount865;
                    uint2 vectorValue10 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount865);
                    float productValue207 = float(int(uint(int(float(int(vectorValue10.x)))))) * multiplyAddValue4;
                    float productValue208 = float(int(uint(int(float(int(vectorValue10.y)))))) * multiplyAddValue5;
                    float scalarValue90 = frac(productValue207);
                    float scalarValue91 = frac(productValue208);
#endif
                    float comparisonValue8;
#if RD_FEATURE_SEASONS == RD_OFF
                    if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                    if (abs(scalarValue90 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        comparisonValue8 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif RD_FEATURE_SEASONS == RD_ON
                        comparisonValue8 = ((scalarValue90 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue4;
                    }
                    float comparisonValue17;
#if RD_FEATURE_SEASONS == RD_OFF
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                    if (abs(scalarValue91 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        comparisonValue17 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif RD_FEATURE_SEASONS == RD_ON
                        comparisonValue17 = ((scalarValue91 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#endif
                    }
                    else
                    {
                        comparisonValue17 = multiplyAddValue5;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue8, comparisonValue17));
                    float scalarValue17 = vectorValue4.x;
                    float scalarValue18 = vectorValue4.y;
                    float scalarValue19 = vectorValue4.z;
                    float scalarValue20 = vectorValue4.w;
#if RD_FEATURE_SEASONS == RD_OFF
                    float sumValue3 = frac(productValue12 + 0.5f);
                    float sumValue4 = frac(productValue13 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
#elif RD_FEATURE_SEASONS == RD_ON
                    float sumValue117 = frac(productValue207 + 0.5f);
                    float sumValue118 = frac(productValue208 + 0.5f);
                    bool conditionValue9 = sumValue118 > 0.5f;
#endif
                    float intermediateValue5[2];
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue5[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue5[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float clampedValue6 = intermediateValue5[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue7 = intermediateValue5[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue6 - clampedValue7;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue5[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue5[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float clampedValue8 = intermediateValue5[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue8, 0.25f), float3(sumValue5, clampedValue8, 0.25f)));
                    float productValue14 = inverseLengthValue2 * multiplyAddValue6;
                    branchMergedValue49 = inverseLengthValue2 * 0.25f;
                    branchMergedValue54 = productValue14 * clampedValue8;
                    branchMergedValue55 = productValue14 * sumValue5;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue5[0u] = conditionValue9 ? scalarValue17 : scalarValue20;
                    intermediateValue5[1u] = conditionValue9 ? scalarValue18 : scalarValue19;
                    float clampedValue28 = intermediateValue5[uint(int(clamp((sumValue117 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue29 = intermediateValue5[uint(int(clamp((sumValue117 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue119 = clampedValue28 - clampedValue29;
                    bool conditionValue10 = sumValue117 > 0.5f;
                    intermediateValue5[0u] = conditionValue10 ? scalarValue19 : scalarValue20;
                    intermediateValue5[1u] = conditionValue10 ? scalarValue18 : scalarValue17;
                    float clampedValue30 = intermediateValue5[uint(int(clamp((sumValue118 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue5[uint(int(clamp((sumValue118 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue20 = rsqrt(dot(float3(sumValue119, clampedValue30, 0.25f), float3(sumValue119, clampedValue30, 0.25f)));
                    float productValue209 = inverseLengthValue20 * multiplyAddValue6;
                    branchMergedValue49 = inverseLengthValue20 * 0.25f;
                    branchMergedValue54 = productValue209 * clampedValue30;
                    branchMergedValue55 = productValue209 * sumValue119;
#endif
                }
                else
                {
                    branchMergedValue49 = 1.0f;
                    branchMergedValue54 = 0.0f;
                    branchMergedValue55 = 0.0f;
                }
                branchMergedValue9 = branchMergedValue49;
#if RD_FEATURE_SEASONS == RD_OFF
                branchMergedValue17 = branchMergedValue54;
                branchMergedValue18 = branchMergedValue55;
#elif RD_FEATURE_SEASONS == RD_ON
                branchMergedValue15 = branchMergedValue54;
                branchMergedValue16 = branchMergedValue55;
#endif
            }
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue23 = branchMergedValue18;
            intermediateValue24 = branchMergedValue17;
            intermediateValue25 = branchMergedValue9;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue18 = branchMergedValue16;
            intermediateValue19 = branchMergedValue15;
            intermediateValue20 = branchMergedValue9;
#endif
        }
        else
        {
            float4 sampledTextureValue4 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5), mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6)));
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue23 = (sampledTextureValue4.x * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue4.y * 2.0f) + (-1.0f);
            intermediateValue25 = (sampledTextureValue4.z * 2.0f) + (-1.0f);
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue18 = (sampledTextureValue4.x * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue4.y * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue4.z * 2.0f) + (-1.0f);
#endif
        }
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue14;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue9;
#endif
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
        if ((scalarValue5 & 1u) == 0u)
        {
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
            loadedBufferValue1 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 9u).x);
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue14 = loadedBufferValue8;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue9 = loadedBufferValue8;
#endif
        }
        else
        {
            float4 sampledTextureValue5 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, asfloat(rdLoad_pbrData(scalarValue * 16u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 2u).x)), mad(varyingTexCoord0.y, asfloat(rdLoad_pbrData((scalarValue * 16u) + 1u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 3u).x))));
            loadedBufferValue = sampledTextureValue5.y;
            loadedBufferValue2 = sampledTextureValue5.x;
            loadedBufferValue1 = sampledTextureValue5.z;
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue14 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue5.w : loadedBufferValue8;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue9 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue5.w : loadedBufferValue8;
#endif
        }
        float comparisonValue5 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue6 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue5, comparisonValue6, comparisonValue7), float3(comparisonValue5, comparisonValue6, comparisonValue7)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if RD_FEATURE_SEASONS == RD_OFF
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue23;
        multiplyAddValue = mad(inverseLengthValue3 * comparisonValue5, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue24, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue11 = mad(inverseLengthValue3 * comparisonValue6, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue24, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue12 = mad(inverseLengthValue3 * comparisonValue7, intermediateValue25, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue24, inverseLengthValue5 * varyingTangent0.z));
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = loadedBufferValue;
        intermediateValue16 = loadedBufferValue1;
        intermediateValue17 = loadedBufferValue2;
#elif RD_FEATURE_SEASONS == RD_ON
        float inverseLengthValue21 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        multiplyAddValue = mad(inverseLengthValue3 * comparisonValue5, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue21 * varyingTangent0.x));
        intermediateValue6 = mad(inverseLengthValue3 * comparisonValue6, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue21 * varyingTangent0.y));
        intermediateValue7 = mad(inverseLengthValue3 * comparisonValue7, intermediateValue20, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue21 * varyingTangent0.z));
        intermediateValue8 = intermediateValue9;
        intermediateValue10 = loadedBufferValue;
        intermediateValue11 = loadedBufferValue1;
        intermediateValue12 = loadedBufferValue2;
#endif
    }
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
    float multiplyAddValue8 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.z * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.w, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.w)));
    float multiplyAddValue12 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.x, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.x, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.x))) / multiplyAddValue11;
    float multiplyAddValue13 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.y, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.y, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.y))) / multiplyAddValue11;
    float multiplyAddValue14 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z, multiplyAddValue10, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue9, mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_1.z, multiplyAddValue8, multiplyAddValue7 * RD_UNIFORM_PROJECTION_MATRIX_ROW_0.z))) / multiplyAddValue11;
#if RD_FEATURE_SEASONS == RD_OFF
    float inverseLengthValue6 = rsqrt(dot(float3(multiplyAddValue, intermediateValue11, intermediateValue12), float3(multiplyAddValue, intermediateValue11, intermediateValue12)));
    float productValue15 = inverseLengthValue6 * multiplyAddValue;
    float productValue16 = inverseLengthValue6 * intermediateValue11;
    float productValue17 = inverseLengthValue6 * intermediateValue12;
    float multiplyAddValue15 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue16, productValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue16 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue16, productValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue17 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue17, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue16, productValue15 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
#elif RD_FEATURE_SEASONS == RD_ON
    float inverseLengthValue22 = rsqrt(dot(float3(multiplyAddValue, intermediateValue6, intermediateValue7), float3(multiplyAddValue, intermediateValue6, intermediateValue7)));
    float productValue210 = inverseLengthValue22 * multiplyAddValue;
    float productValue211 = inverseLengthValue22 * intermediateValue6;
    float productValue212 = inverseLengthValue22 * intermediateValue7;
    float multiplyAddValue42 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue212, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue211, productValue210 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x));
    float multiplyAddValue43 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue212, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue211, productValue210 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y));
    float multiplyAddValue44 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue212, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue211, productValue210 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
#endif
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_WORLD_ORIGIN.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
    float scalarValue21 = ddx_coarse(multiplyAddValue7);
    float scalarValue22 = ddx_coarse(multiplyAddValue8);
    float scalarValue23 = ddx_coarse(multiplyAddValue9);
    float inverseLengthValue7 = rsqrt(dot(float3(scalarValue21, scalarValue22, scalarValue23), float3(scalarValue21, scalarValue22, scalarValue23)));
    float productValue18 = inverseLengthValue7 * scalarValue21;
    float productValue19 = inverseLengthValue7 * scalarValue22;
    float productValue20 = inverseLengthValue7 * scalarValue23;
    float sumValue9 = (-0.0f) - multiplyAddValue9;
    float sumValue10 = ddy_coarse((-0.0f) - multiplyAddValue7);
    float sumValue11 = ddy_coarse((-0.0f) - multiplyAddValue8);
    float scalarValue24 = ddy_coarse(sumValue9);
    float inverseLengthValue8 = rsqrt(dot(float3(sumValue10, sumValue11, scalarValue24), float3(sumValue10, sumValue11, scalarValue24)));
    float productValue21 = inverseLengthValue8 * sumValue10;
    float productValue22 = inverseLengthValue8 * sumValue11;
    float productValue23 = inverseLengthValue8 * scalarValue24;
    float productValue24 = (productValue23 * productValue19) - (productValue22 * productValue20);
    float productValue25 = (productValue21 * productValue20) - (productValue23 * productValue18);
    float productValue26 = (productValue22 * productValue18) - (productValue21 * productValue19);
    float inverseLengthValue9 = rsqrt(dot(float3(productValue24, productValue25, productValue26), float3(productValue24, productValue25, productValue26)));
    float productValue27 = productValue24 * inverseLengthValue9;
    float productValue28 = productValue25 * inverseLengthValue9;
    float productValue29 = productValue26 * inverseLengthValue9;
    float multiplyAddValue18 = mad(RD_UNIFORM_INV_VIEW_ROW_2.x, productValue29, mad(RD_UNIFORM_INV_VIEW_ROW_1.x, productValue28, productValue27 * RD_UNIFORM_INV_VIEW_ROW_0.x));
    float multiplyAddValue19 = mad(RD_UNIFORM_INV_VIEW_ROW_2.y, productValue29, mad(RD_UNIFORM_INV_VIEW_ROW_1.y, productValue28, productValue27 * RD_UNIFORM_INV_VIEW_ROW_0.y));
    float multiplyAddValue20 = mad(RD_UNIFORM_INV_VIEW_ROW_2.z, productValue29, mad(RD_UNIFORM_INV_VIEW_ROW_1.z, productValue28, productValue27 * RD_UNIFORM_INV_VIEW_ROW_0.z));
    float inverseLengthValue10 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
    float quotientValue = round((inverseLengthValue10 * multiplyAddValue18) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue1 = round((inverseLengthValue10 * multiplyAddValue19) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float quotientValue2 = round((inverseLengthValue10 * multiplyAddValue20) / RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x) * RD_UNIFORM_QUANTIZATION_PRECISION_ROUNDING_PARAMETERS.x;
    float inverseLengthValue11 = rsqrt(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(quotientValue, quotientValue1, quotientValue2)));
    float productValue30 = inverseLengthValue11 * quotientValue;
    float productValue40 = inverseLengthValue11 * quotientValue1;
    float productValue41 = inverseLengthValue11 * quotientValue2;
    float productValue48 = RD_UNIFORM_QUANTIZATION_PARAMETERS.z * 0.5f;
    float quotientValue3 = productValue48 - (sumValue6 - (floor(sumValue6 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue4 = productValue48 - (sumValue7 - (floor(sumValue7 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float quotientValue5 = productValue48 - (sumValue8 - (floor(sumValue8 / RD_UNIFORM_QUANTIZATION_PARAMETERS.z) * RD_UNIFORM_QUANTIZATION_PARAMETERS.z));
    float dotProductValue = dot(float3(quotientValue3, quotientValue4, quotientValue5), float3(productValue30, productValue40, productValue41));
    float productValue49 = ((quotientValue3 + sumValue6) - (dotProductValue * productValue30)) + RD_UNIFORM_WORLD_ORIGIN.x;
    float productValue50 = ((sumValue7 - (dotProductValue * productValue40)) + quotientValue4) + RD_UNIFORM_WORLD_ORIGIN.y;
    float productValue51 = ((sumValue8 - (dotProductValue * productValue41)) + quotientValue5) + RD_UNIFORM_WORLD_ORIGIN.z;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue52 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue52, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue52 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue52, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue52 * productValue52) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue52, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
#if RD_FEATURE_SEASONS == RD_OFF
    float sumValue12 = 1.0f - intermediateValue17;
    float productValue53 = sumValue12 * 0.039999999105930328369140625f;
    float productValue54 = productValue53 + (intermediateValue17 * exponentialValue);
    float productValue55 = productValue53 + (intermediateValue17 * exponentialValue1);
    float productValue56 = productValue53 + (intermediateValue17 * exponentialValue2);
    float sampledTextureValue2;
#elif RD_FEATURE_SEASONS == RD_ON
    float sumValue120 = 1.0f - intermediateValue12;
    float productValue213 = sumValue120 * 0.039999999105930328369140625f;
    float productValue214 = productValue213 + (intermediateValue12 * exponentialValue);
    float productValue215 = productValue213 + (intermediateValue12 * exponentialValue1);
    float productValue216 = productValue213 + (intermediateValue12 * exponentialValue2);
    float sampledTextureValue3;
#endif
    if ((RD_UNIFORM_CAUSTICS_PARAMETERS.x != 0.0f) && (RD_UNIFORM_CAUSTICS_PARAMETERS.w != 0.0f))
    {
#if RD_FEATURE_SEASONS == RD_OFF
        sampledTextureValue2 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue15, productValue16, productValue17)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
#elif RD_FEATURE_SEASONS == RD_ON
        sampledTextureValue3 = exp2(log2((causticsTextureTexture.Sample(causticsTextureSampler, float3((varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, (varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z) * RD_UNIFORM_CAUSTICS_PARAMETERS.y, RD_UNIFORM_CAUSTICS_TEXTURE_PARAMETERS.y)).x * 2.0f) * clamp(dot(float3(0.0f, 1.0f, 0.0f), float3(productValue210, productValue211, productValue212)), 0.0f, 1.0f)) * RD_UNIFORM_CAUSTICS_PARAMETERS.z) * (RD_UNIFORM_CAUSTICS_PARAMETERS.z + 1.0f);
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        sampledTextureValue2 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        sampledTextureValue3 = 1.0f;
#endif
    }
    float clampedValue9 = clamp(((RD_UNIFORM_TILE_LIGHT_INTENSITY.y * 16.0f) - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y) / max(RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.x - RD_UNIFORM_IBL_SKY_FADE_PARAMETERS.y, 1.0f), 0.0f, 1.0f);
    float nonlinearValue = sqrt(((multiplyAddValue8 * multiplyAddValue8) + (multiplyAddValue7 * multiplyAddValue7)) + (multiplyAddValue9 * multiplyAddValue9));
#if RD_FEATURE_SEASONS == RD_ON
    float productValue31;
    float productValue32;
    float productValue33;
#endif
    float productValue34;
    float productValue35;
    float productValue36;
#if RD_FEATURE_SEASONS == RD_OFF
    float productValue37;
    float productValue38;
    float productValue39;
    float intermediateValue27;
    float intermediateValue29;
    float intermediateValue31;
    float intermediateValue33;
    float intermediateValue35;
    float intermediateValue37;
#elif RD_FEATURE_SEASONS == RD_ON
    float intermediateValue22;
    float intermediateValue24;
    float intermediateValue26;
    float intermediateValue28;
    float intermediateValue30;
    float intermediateValue32;
#endif
    if (multiplyAddValue14 != 1.0f)
    {
        float sumValue13 = nonlinearValue + 9.9999997473787516355514526367188e-05f;
        float quotientValue6 = multiplyAddValue7 / sumValue13;
        float quotientValue7 = multiplyAddValue8 / sumValue13;
        float quotientValue8 = multiplyAddValue9 / sumValue13;
        float sumValue14 = (-0.0f) - quotientValue6;
        float sumValue15 = (-0.0f) - quotientValue7;
        float sumValue16 = (-0.0f) - quotientValue8;
#if RD_FEATURE_SEASONS == RD_OFF
        float productValue57 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * intermediateValue13;
#elif RD_FEATURE_SEASONS == RD_ON
        float productValue217 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.x * intermediateValue8;
#endif
        bool conditionValue5 = int(uint(int(RD_UNIFORM_QUANTIZATION_PARAMETERS.y))) > int(0u);
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
#endif
        if ((RD_UNIFORM_DIRECTIONAL_LIGHT_SKY_LIGHT_HEURISTIC_TOGGLES.x != 0.0f) && (abs(RD_UNIFORM_TILE_LIGHT_INTENSITY.y) < 9.9999997473787516355514526367188e-05f))
        {
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue28 = 0.0f;
            intermediateValue30 = 0.0f;
            intermediateValue32 = 0.0f;
            intermediateValue34 = 0.0f;
            intermediateValue36 = 0.0f;
            intermediateValue38 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue23 = 0.0f;
            intermediateValue25 = 0.0f;
            intermediateValue27 = 0.0f;
            intermediateValue29 = 0.0f;
            intermediateValue31 = 0.0f;
            intermediateValue33 = 0.0f;
#endif
        }
        else
        {
#if RD_FEATURE_SEASONS == RD_OFF
            float productValue65;
            float intermediateValue50;
#elif RD_FEATURE_SEASONS == RD_ON
            float productValue62;
            float intermediateValue45;
#endif
            if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
            {
                float multiplyAddValue21 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
                float multiplyAddValue22 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
                float multiplyAddValue23 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_SHADOW_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
                float inverseLengthValue12 = rsqrt(dot(float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), float3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23)));
#if RD_FEATURE_SEASONS == RD_OFF
                float dotProductValue1 = max(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(inverseLengthValue12 * multiplyAddValue21, inverseLengthValue12 * multiplyAddValue22, inverseLengthValue12 * multiplyAddValue23)), 0.0f);
                float clampedValue10 = clamp(1.0f - dotProductValue1, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue9 = (clampedValue10 * productValue15) + (conditionValue5 ? productValue49 : varyingTexCoord3.x);
                float comparisonValue10 = (clampedValue10 * productValue16) + (conditionValue5 ? productValue50 : varyingTexCoord3.y);
                float comparisonValue11 = (clampedValue10 * productValue17) + (conditionValue5 ? productValue51 : varyingTexCoord3.z);
#elif RD_FEATURE_SEASONS == RD_ON
                float dotProductValue15 = max(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(inverseLengthValue12 * multiplyAddValue21, inverseLengthValue12 * multiplyAddValue22, inverseLengthValue12 * multiplyAddValue23)), 0.0f);
                float clampedValue31 = clamp(1.0f - dotProductValue15, 0.0f, 1.0f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.w;
                float comparisonValue73 = (clampedValue31 * productValue210) + (conditionValue5 ? productValue49 : varyingTexCoord3.x);
                float comparisonValue74 = (clampedValue31 * productValue211) + (conditionValue5 ? productValue50 : varyingTexCoord3.y);
                float comparisonValue75 = (clampedValue31 * productValue212) + (conditionValue5 ? productValue51 : varyingTexCoord3.z);
#endif
                uint clampedValue11 = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
#if RD_FEATURE_SEASONS == RD_OFF
                float intermediateValue51;
                float intermediateValue72;
#elif RD_FEATURE_SEASONS == RD_ON
                float intermediateValue46;
                float intermediateValue67;
#endif
                if (int(clampedValue11) > int(0u))
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue71;
                    float intermediateValue73;
                    uint intermediateValue84;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue66;
                    float intermediateValue68;
                    uint intermediateValue79;
#endif
                    float scalarValue25 = 1.0f;
                    float scalarValue26 = 1.0f;
                    uint scalarValue27 = 0u;
                    uint scalarValue28 = 0u;
                    uint quotientValue11;
#if RD_FEATURE_SEASONS == RD_OFF
                    bool intermediateValue86;
#elif RD_FEATURE_SEASONS == RD_ON
                    bool intermediateValue81;
#endif
                    for (;;)
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        uint sumValue17 = scalarValue28 + 312u;
                        quotientValue11 = uint(min(int(uint(int(fragmentConstants[sumValue17 / 4u][sumValue17 % 4u])) + scalarValue27), int(8u)));
                        intermediateValue86 = int(scalarValue27) < int(quotientValue11);
#elif RD_FEATURE_SEASONS == RD_ON
                        uint sumValue121 = scalarValue28 + 308u;
                        quotientValue11 = uint(min(int(uint(int(fragmentConstants[sumValue121 / 4u][sumValue121 % 4u])) + scalarValue27), int(8u)));
                        intermediateValue81 = int(scalarValue27) < int(quotientValue11);
#endif
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
#if RD_FEATURE_SEASONS == RD_OFF
                        if (intermediateValue86)
#elif RD_FEATURE_SEASONS == RD_ON
                        if (intermediateValue81)
#endif
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue103;
                            float intermediateValue104;
                            uint intermediateValue105;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue98;
                            float intermediateValue99;
                            uint intermediateValue100;
#endif
                            float scalarValue29 = scalarValue25;
                            float scalarValue30 = scalarValue26;
                            uint scalarValue31 = scalarValue27;
                            uint bitwiseValue10;
                            float multiplyAddValue38;
                            float multiplyAddValue39;
                            float multiplyAddValue40;
                            bool comparisonValue30;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue31 << 2u;
#if RD_FEATURE_SEASONS == RD_ON
                                uint sumValue122 = bitwiseValue10 + 78u;
#endif
                                uint sumValue18 = bitwiseValue10 + 79u;
                                uint sumValue19 = bitwiseValue10 + 80u;
                                uint sumValue20 = bitwiseValue10 + 81u;
#if RD_FEATURE_SEASONS == RD_OFF
                                uint sumValue21 = bitwiseValue10 + 82u;
                                multiplyAddValue38 = mad(fragmentConstants[sumValue20].x, comparisonValue11, mad(fragmentConstants[sumValue19].x, comparisonValue10, fragmentConstants[sumValue18].x * comparisonValue9)) + fragmentConstants[sumValue21].x;
                                multiplyAddValue39 = mad(fragmentConstants[sumValue20].y, comparisonValue11, mad(fragmentConstants[sumValue19].y, comparisonValue10, fragmentConstants[sumValue18].y * comparisonValue9)) + fragmentConstants[sumValue21].y;
                                multiplyAddValue40 = mad(fragmentConstants[sumValue20].z, comparisonValue11, mad(fragmentConstants[sumValue19].z, comparisonValue10, fragmentConstants[sumValue18].z * comparisonValue9)) + fragmentConstants[sumValue21].z;
#elif RD_FEATURE_SEASONS == RD_ON
                                multiplyAddValue38 = mad(fragmentConstants[sumValue19].x, comparisonValue75, mad(fragmentConstants[sumValue18].x, comparisonValue74, fragmentConstants[sumValue122].x * comparisonValue73)) + fragmentConstants[sumValue20].x;
                                multiplyAddValue39 = mad(fragmentConstants[sumValue19].y, comparisonValue75, mad(fragmentConstants[sumValue18].y, comparisonValue74, fragmentConstants[sumValue122].y * comparisonValue73)) + fragmentConstants[sumValue20].y;
                                multiplyAddValue40 = mad(fragmentConstants[sumValue19].z, comparisonValue75, mad(fragmentConstants[sumValue18].z, comparisonValue74, fragmentConstants[sumValue122].z * comparisonValue73)) + fragmentConstants[sumValue20].z;
#endif
                                comparisonValue30 = ((abs(multiplyAddValue38) <= 1.0f) && (abs(multiplyAddValue39) <= 1.0f)) && (abs(multiplyAddValue40) <= 1.0f);
#if RD_FEATURE_SEASONS == RD_OFF
                                float branchMergedValue1;
                                uint branchMergedValue7;
#elif RD_FEATURE_SEASONS == RD_ON
                                uint branchMergedValue1;
                                float branchMergedValue7;
#endif
                                float branchMergedValue8;
                                if (comparisonValue30)
                                {
                                    uint sumValue22 = scalarValue31 + 244u;
                                    uint sumValue23 = scalarValue31 + 48u;
#if RD_FEATURE_SEASONS == RD_OFF
                                    float quotientValue9 = min(max(dotProductValue1, fragmentConstants[sumValue22 / 4u][sumValue22 % 4u]), 1.0f);
                                    float nonlinearValue1 = (sqrt(1.0f - (quotientValue9 * quotientValue9)) / quotientValue9) * fragmentConstants[sumValue23].z;
#elif RD_FEATURE_SEASONS == RD_ON
                                    float quotientValue17 = min(max(dotProductValue15, fragmentConstants[sumValue22 / 4u][sumValue22 % 4u]), 1.0f);
                                    float nonlinearValue5 = (sqrt(1.0f - (quotientValue17 * quotientValue17)) / quotientValue17) * fragmentConstants[sumValue23].z;
#endif
                                    float productValue58 = (multiplyAddValue38 * 0.5f) + 0.5f;
                                    float productValue59 = 0.5f - (multiplyAddValue39 * 0.5f);
                                    uint sumValue24 = bitwiseValue10 + 18u;
                                    float nonlinearValue2 = sqrt((((fragmentConstants[sumValue24].x * fragmentConstants[sumValue24].x) + (fragmentConstants[sumValue24].y * fragmentConstants[sumValue24].y)) + (fragmentConstants[sumValue24].z * fragmentConstants[sumValue24].z)) + (fragmentConstants[sumValue24].w * fragmentConstants[sumValue24].w)) * RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.z;
                                    uint comparisonValue12 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentConstants[sumValue23].w + 0.5f))), int(1u)))), int(9u)));
                                    uint quotientValue10 = uint(int(comparisonValue12) / int(2u));
#if RD_FEATURE_SEASONS == RD_OFF
                                    float intermediateValue157;
                                    float intermediateValue158;
#elif RD_FEATURE_SEASONS == RD_ON
                                    float intermediateValue152;
                                    float intermediateValue153;
#endif
                                    if (int(comparisonValue12) > int(0u))
                                    {
                                        float sumValue91;
#if RD_FEATURE_SEASONS == RD_OFF
                                        float productValue167;
                                        float intermediateValue188;
                                        float intermediateValue189;
                                        uint intermediateValue190;
#elif RD_FEATURE_SEASONS == RD_ON
                                        float productValue164;
                                        float intermediateValue183;
                                        float intermediateValue184;
                                        uint intermediateValue185;
#endif
                                        float scalarValue32 = 0.0f;
                                        float scalarValue33 = 0.0f;
                                        uint scalarValue34 = 0u;
                                        for (;;)
                                        {
#if RD_FEATURE_SEASONS == RD_OFF
                                            intermediateValue188 = scalarValue32;
                                            intermediateValue189 = scalarValue33;
                                            intermediateValue190 = 0u;
                                            float intermediateValue235;
                                            float intermediateValue192;
                                            float intermediateValue193;
                                            float intermediateValue194;
                                            float intermediateValue195;
                                            float productValue175;
                                            float productValue176;
#elif RD_FEATURE_SEASONS == RD_ON
                                            intermediateValue183 = scalarValue32;
                                            intermediateValue184 = scalarValue33;
                                            intermediateValue185 = 0u;
                                            float intermediateValue230;
                                            float intermediateValue187;
                                            float intermediateValue188;
                                            float intermediateValue189;
                                            float intermediateValue190;
                                            float productValue172;
                                            float productValue173;
#endif
                                            bool comparisonValue55;
                                            float sumValue101;
                                            for (;;)
                                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                                float productValue60 = (productValue58 + ((float(int(intermediateValue190 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue23].x;
#elif RD_FEATURE_SEASONS == RD_ON
                                                float productValue218 = (productValue58 + ((float(int(intermediateValue185 - quotientValue10)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * fragmentConstants[sumValue23].x;
#endif
                                                float productValue61 = (productValue59 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue34 - quotientValue10)) + 0.5f))) * fragmentConstants[sumValue23].x;
#if RD_FEATURE_SEASONS == RD_OFF
                                                float4 vectorValue5 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue60, productValue61, float(int(scalarValue31))));
                                                intermediateValue192 = vectorValue5.x;
                                                intermediateValue193 = vectorValue5.y;
                                                intermediateValue194 = vectorValue5.z;
                                                intermediateValue195 = vectorValue5.w;
                                                productValue175 = frac((productValue60 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue176 = frac((productValue61 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue12 = clamp((multiplyAddValue40 - intermediateValue192) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue13 = clamp((multiplyAddValue40 - intermediateValue193) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue14 = clamp((multiplyAddValue40 - intermediateValue194) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue15 = clamp((multiplyAddValue40 - intermediateValue195) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue63 = 1.0f - ((clampedValue12 * clampedValue12) * (3.0f - (clampedValue12 * 2.0f)));
                                                float productValue64 = 1.0f - ((clampedValue15 * clampedValue15) * (3.0f - (clampedValue15 * 2.0f)));
                                                float productValue66 = (((1.0f - ((clampedValue14 * clampedValue14) * (3.0f - (clampedValue14 * 2.0f)))) - productValue64) * productValue175) + productValue64;
                                                productValue167 = (productValue66 + intermediateValue189) + ((((((1.0f - ((clampedValue13 * clampedValue13) * (3.0f - (clampedValue13 * 2.0f)))) - productValue63) * productValue175) + productValue63) - productValue66) * productValue176);
#elif RD_FEATURE_SEASONS == RD_ON
                                                float4 vectorValue11 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue218, productValue61, float(int(scalarValue31))));
                                                intermediateValue187 = vectorValue11.x;
                                                intermediateValue188 = vectorValue11.y;
                                                intermediateValue189 = vectorValue11.z;
                                                intermediateValue190 = vectorValue11.w;
                                                productValue172 = frac((productValue218 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                productValue173 = frac((productValue61 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z) + 0.5f);
                                                float clampedValue32 = clamp((multiplyAddValue40 - intermediateValue187) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue33 = clamp((multiplyAddValue40 - intermediateValue188) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue34 = clamp((multiplyAddValue40 - intermediateValue189) * nonlinearValue2, 0.0f, 1.0f);
                                                float clampedValue35 = clamp((multiplyAddValue40 - intermediateValue190) * nonlinearValue2, 0.0f, 1.0f);
                                                float productValue219 = 1.0f - ((clampedValue32 * clampedValue32) * (3.0f - (clampedValue32 * 2.0f)));
                                                float productValue220 = 1.0f - ((clampedValue35 * clampedValue35) * (3.0f - (clampedValue35 * 2.0f)));
                                                float productValue221 = (((1.0f - ((clampedValue34 * clampedValue34) * (3.0f - (clampedValue34 * 2.0f)))) - productValue220) * productValue172) + productValue220;
                                                productValue164 = (productValue221 + intermediateValue184) + ((((((1.0f - ((clampedValue33 * clampedValue33) * (3.0f - (clampedValue33 * 2.0f)))) - productValue219) * productValue172) + productValue219) - productValue221) * productValue173);
#endif
                                                comparisonValue55 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                                sumValue101 = (multiplyAddValue40 - fragmentConstants[sumValue23].y) - nonlinearValue1;
#elif RD_FEATURE_SEASONS == RD_ON
                                                sumValue101 = (multiplyAddValue40 - fragmentConstants[sumValue23].y) - nonlinearValue5;
#endif
                                                float branchMergedValue4;
                                                if (comparisonValue55)
                                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                                    branchMergedValue4 = float(intermediateValue195 >= sumValue101);
#elif RD_FEATURE_SEASONS == RD_ON
                                                    branchMergedValue4 = float(intermediateValue190 >= sumValue101);
#endif
                                                }
                                                else
                                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                                    float comparisonValue13 = (intermediateValue192 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue14 = (intermediateValue195 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue15 = ((((intermediateValue194 < sumValue101) ? 0.0f : 1.0f) - comparisonValue14) * productValue175) + comparisonValue14;
                                                    branchMergedValue4 = (((((((intermediateValue193 < sumValue101) ? 0.0f : 1.0f) - comparisonValue13) * productValue175) + comparisonValue13) - comparisonValue15) * productValue176) + comparisonValue15;
#elif RD_FEATURE_SEASONS == RD_ON
                                                    float comparisonValue76 = (intermediateValue187 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue77 = (intermediateValue190 < sumValue101) ? 0.0f : 1.0f;
                                                    float comparisonValue78 = ((((intermediateValue189 < sumValue101) ? 0.0f : 1.0f) - comparisonValue77) * productValue172) + comparisonValue77;
                                                    branchMergedValue4 = (((((((intermediateValue188 < sumValue101) ? 0.0f : 1.0f) - comparisonValue76) * productValue172) + comparisonValue76) - comparisonValue78) * productValue173) + comparisonValue78;
#endif
                                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                                intermediateValue235 = branchMergedValue4;
                                                sumValue91 = intermediateValue235 + intermediateValue188;
                                                uint sumValue25 = intermediateValue190 + 1u;
                                                if (sumValue25 == comparisonValue12)
#elif RD_FEATURE_SEASONS == RD_ON
                                                intermediateValue230 = branchMergedValue4;
                                                sumValue91 = intermediateValue230 + intermediateValue183;
                                                uint sumValue123 = intermediateValue185 + 1u;
                                                if (sumValue123 == comparisonValue12)
#endif
                                                {
                                                    break;
                                                }
                                                else
                                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                                    intermediateValue188 = sumValue91;
                                                    intermediateValue189 = productValue167;
                                                    intermediateValue190 = sumValue25;
#elif RD_FEATURE_SEASONS == RD_ON
                                                    intermediateValue183 = sumValue91;
                                                    intermediateValue184 = productValue164;
                                                    intermediateValue185 = sumValue123;
#endif
                                                    continue;
                                                }
                                            }
                                            uint sumValue26 = scalarValue34 + 1u;
                                            if (sumValue26 == comparisonValue12)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue32 = sumValue91;
#if RD_FEATURE_SEASONS == RD_OFF
                                                scalarValue33 = productValue167;
#elif RD_FEATURE_SEASONS == RD_ON
                                                scalarValue33 = productValue164;
#endif
                                                scalarValue34 = sumValue26;
                                                continue;
                                            }
                                        }
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue157 = sumValue91;
                                        intermediateValue158 = productValue167;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue152 = sumValue91;
                                        intermediateValue153 = productValue164;
#endif
                                    }
                                    else
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue157 = 0.0f;
                                        intermediateValue158 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue152 = 0.0f;
                                        intermediateValue153 = 0.0f;
#endif
                                    }
                                    float productValue67 = float(int(comparisonValue12 * comparisonValue12));
#if RD_FEATURE_SEASONS == RD_OFF
                                    branchMergedValue1 = min(scalarValue30, intermediateValue157 / productValue67);
                                    branchMergedValue7 = quotientValue11;
                                    branchMergedValue8 = min(scalarValue29, intermediateValue158 / productValue67);
#elif RD_FEATURE_SEASONS == RD_ON
                                    branchMergedValue1 = quotientValue11;
                                    branchMergedValue7 = min(scalarValue30, intermediateValue152 / productValue67);
                                    branchMergedValue8 = min(scalarValue29, intermediateValue153 / productValue67);
#endif
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    branchMergedValue1 = scalarValue30;
                                    branchMergedValue7 = scalarValue31 + 1u;
#elif RD_FEATURE_SEASONS == RD_ON
                                    branchMergedValue1 = scalarValue31 + 1u;
                                    branchMergedValue7 = scalarValue30;
#endif
                                    branchMergedValue8 = scalarValue29;
                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue104 = branchMergedValue1;
                                intermediateValue105 = branchMergedValue7;
                                intermediateValue103 = branchMergedValue8;
                                if (int(intermediateValue105) < int(quotientValue11))
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue100 = branchMergedValue1;
                                intermediateValue99 = branchMergedValue7;
                                intermediateValue98 = branchMergedValue8;
                                if (int(intermediateValue100) < int(quotientValue11))
#endif
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    scalarValue29 = intermediateValue103;
                                    scalarValue30 = intermediateValue104;
                                    scalarValue31 = intermediateValue105;
#elif RD_FEATURE_SEASONS == RD_ON
                                    scalarValue29 = intermediateValue98;
                                    scalarValue30 = intermediateValue99;
                                    scalarValue31 = intermediateValue100;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            branchMergedValue = intermediateValue105;
                            branchMergedValue5 = intermediateValue104;
                            branchMergedValue6 = intermediateValue103;
#elif RD_FEATURE_SEASONS == RD_ON
                            branchMergedValue = intermediateValue100;
                            branchMergedValue5 = intermediateValue99;
                            branchMergedValue6 = intermediateValue98;
#endif
                        }
                        else
                        {
                            branchMergedValue = scalarValue27;
                            branchMergedValue5 = scalarValue26;
                            branchMergedValue6 = scalarValue25;
                        }
#if RD_FEATURE_SEASONS == RD_OFF
                        intermediateValue84 = branchMergedValue;
                        intermediateValue73 = branchMergedValue5;
                        intermediateValue71 = branchMergedValue6;
#elif RD_FEATURE_SEASONS == RD_ON
                        intermediateValue79 = branchMergedValue;
                        intermediateValue68 = branchMergedValue5;
                        intermediateValue66 = branchMergedValue6;
#endif
                        uint sumValue27 = scalarValue28 + 1u;
                        if (sumValue27 == clampedValue11)
                        {
                            break;
                        }
                        else
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            scalarValue25 = intermediateValue71;
                            scalarValue26 = intermediateValue73;
                            scalarValue27 = intermediateValue84;
#elif RD_FEATURE_SEASONS == RD_ON
                            scalarValue25 = intermediateValue66;
                            scalarValue26 = intermediateValue68;
                            scalarValue27 = intermediateValue79;
#endif
                            scalarValue28 = sumValue27;
                            continue;
                        }
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue51 = intermediateValue71;
                    intermediateValue72 = intermediateValue73;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue46 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
#endif
                }
                else
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue51 = 1.0f;
                    intermediateValue72 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue46 = 1.0f;
                    intermediateValue67 = 1.0f;
#endif
                }
#if RD_FEATURE_SEASONS == RD_OFF
                float intermediateValue88;
#elif RD_FEATURE_SEASONS == RD_ON
                float intermediateValue83;
#endif
                if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    float scalarValue35 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue24 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue11, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue10, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue9))) - ((sqrt(1.0f - (scalarValue35 * scalarValue35)) / scalarValue35) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue25 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue11, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue10, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue9)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue26 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue11, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue10, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue9)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
#elif RD_FEATURE_SEASONS == RD_ON
                    float scalarValue92 = min(max(dotProductValue15, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue45 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, comparisonValue75, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, comparisonValue74, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * comparisonValue73))) - ((sqrt(1.0f - (scalarValue92 * scalarValue92)) / scalarValue92) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                    float multiplyAddValue46 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, comparisonValue75, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, comparisonValue74, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * comparisonValue73)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                    float multiplyAddValue47 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, comparisonValue75, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, comparisonValue74, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * comparisonValue73)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
#endif
                    uint comparisonValue16 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue16 >> 1u;
                    float branchMergedValue12;
#if RD_FEATURE_SEASONS == RD_OFF
                    if ((multiplyAddValue26 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue25 >= 0.0f) && (multiplyAddValue25 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue26 >= 0.0f)))
#elif RD_FEATURE_SEASONS == RD_ON
                    if ((multiplyAddValue47 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue46 >= 0.0f) && (multiplyAddValue46 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue47 >= 0.0f)))
#endif
                    {
                        float dotProductValue2 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
                        float sumValue69;
#if RD_FEATURE_SEASONS == RD_OFF
                        float intermediateValue140;
                        uint intermediateValue141;
#elif RD_FEATURE_SEASONS == RD_ON
                        float intermediateValue135;
                        uint intermediateValue136;
#endif
                        float scalarValue36 = 0.0f;
                        uint scalarValue37 = 0u;
                        for (;;)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue140 = scalarValue36;
                            intermediateValue141 = 0u;
                            float intermediateValue180;
                            float productValue163;
                            float productValue164;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue135 = scalarValue36;
                            intermediateValue136 = 0u;
                            float intermediateValue175;
                            float productValue160;
                            float productValue161;
#endif
                            bool comparisonValue41;
                            for (;;)
                            {
                                float productValue68 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
#if RD_FEATURE_SEASONS == RD_OFF
                                productValue163 = (productValue68 * (float(int(intermediateValue141 - bitwiseValue)) + 0.5f)) + multiplyAddValue25;
                                productValue164 = (productValue68 * (float(int(scalarValue37 - bitwiseValue)) + 0.5f)) + multiplyAddValue26;
#elif RD_FEATURE_SEASONS == RD_ON
                                productValue160 = (productValue68 * (float(int(intermediateValue136 - bitwiseValue)) + 0.5f)) + multiplyAddValue46;
                                productValue161 = (productValue68 * (float(int(scalarValue37 - bitwiseValue)) + 0.5f)) + multiplyAddValue47;
#endif
                                comparisonValue41 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue2;
                                if (comparisonValue41)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue163, productValue164, dotProductValue2), 0.0f).x >= multiplyAddValue24);
#elif RD_FEATURE_SEASONS == RD_ON
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue160, productValue161, dotProductValue2), 0.0f).x >= multiplyAddValue45);
#endif
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    float4 vectorValue6 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue163, productValue164, dotProductValue2));
                                    float productValue69 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue163) + 0.5f);
                                    float comparisonValue19 = (vectorValue6.x < multiplyAddValue24) ? 0.0f : 1.0f;
                                    float comparisonValue21 = (vectorValue6.w < multiplyAddValue24) ? 0.0f : 1.0f;
                                    float comparisonValue22 = ((((vectorValue6.z < multiplyAddValue24) ? 0.0f : 1.0f) - comparisonValue21) * productValue69) + comparisonValue21;
                                    branchMergedValue2 = (((((((vectorValue6.y < multiplyAddValue24) ? 0.0f : 1.0f) - comparisonValue19) * productValue69) + comparisonValue19) - comparisonValue22) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue164) + 0.5f)) + comparisonValue22;
#elif RD_FEATURE_SEASONS == RD_ON
                                    float4 vectorValue12 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue160, productValue161, dotProductValue2));
                                    float productValue222 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue160) + 0.5f);
                                    float comparisonValue79 = (vectorValue12.x < multiplyAddValue45) ? 0.0f : 1.0f;
                                    float comparisonValue80 = (vectorValue12.w < multiplyAddValue45) ? 0.0f : 1.0f;
                                    float comparisonValue81 = ((((vectorValue12.z < multiplyAddValue45) ? 0.0f : 1.0f) - comparisonValue80) * productValue222) + comparisonValue80;
                                    branchMergedValue2 = (((((((vectorValue12.y < multiplyAddValue45) ? 0.0f : 1.0f) - comparisonValue79) * productValue222) + comparisonValue79) - comparisonValue81) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue161) + 0.5f)) + comparisonValue81;
#endif
                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue180 = branchMergedValue2;
                                sumValue69 = intermediateValue180 + intermediateValue140;
                                uint sumValue28 = intermediateValue141 + 1u;
                                if (int(sumValue28) < int(comparisonValue16))
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue175 = branchMergedValue2;
                                sumValue69 = intermediateValue175 + intermediateValue135;
                                uint sumValue124 = intermediateValue136 + 1u;
                                if (int(sumValue124) < int(comparisonValue16))
#endif
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue140 = sumValue69;
                                    intermediateValue141 = sumValue28;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue135 = sumValue69;
                                    intermediateValue136 = sumValue124;
#endif
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue29 = scalarValue37 + 1u;
                            if (int(sumValue29) < int(comparisonValue16))
                            {
                                scalarValue36 = sumValue69;
                                scalarValue37 = sumValue29;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue12 = sumValue69 / float(int(comparisonValue16 * comparisonValue16));
                    }
                    else
                    {
                        branchMergedValue12 = 1.0f;
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue88 = branchMergedValue12;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue83 = branchMergedValue12;
#endif
                }
                else
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue88 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue83 = 1.0f;
#endif
                }
#if RD_FEATURE_SEASONS == RD_OFF
                float intermediateValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                float intermediateValue102;
#endif
                if ((int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)) && (int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)))
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    float multiplyAddValue27 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue11, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue10, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue9)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue38 = min(max(dotProductValue1, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue28 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue11, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue10, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue9)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue27) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue38 * scalarValue38)) / scalarValue38) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue29 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue11, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue10, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue9)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue27) * 0.5f) + 0.5f;
                    float multiplyAddValue30 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue11, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue10, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue9)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue27) * 0.5f);
#elif RD_FEATURE_SEASONS == RD_ON
                    float multiplyAddValue48 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, comparisonValue75, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, comparisonValue74, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * comparisonValue73)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                    float scalarValue93 = min(max(dotProductValue15, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                    float multiplyAddValue49 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, comparisonValue75, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, comparisonValue74, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * comparisonValue73)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue48) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue93 * scalarValue93)) / scalarValue93) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                    float multiplyAddValue50 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, comparisonValue75, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, comparisonValue74, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * comparisonValue73)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue48) * 0.5f) + 0.5f;
                    float multiplyAddValue51 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, comparisonValue75, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, comparisonValue74, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * comparisonValue73)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue48) * 0.5f);
#endif
                    uint comparisonValue23 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z + 0.5f))), int(1u)))), int(9u)));
                    uint quotientValue12 = uint(int(comparisonValue23) / int(2u));
                    float dotProductValue3 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue135;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue130;
#endif
                    if (int(comparisonValue23) > int(0u))
                    {
                        float sumValue71;
#if RD_FEATURE_SEASONS == RD_OFF
                        float intermediateValue160;
                        uint intermediateValue161;
#elif RD_FEATURE_SEASONS == RD_ON
                        float intermediateValue155;
                        uint intermediateValue156;
#endif
                        float scalarValue39 = 0.0f;
                        uint scalarValue40 = 0u;
                        for (;;)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue160 = scalarValue39;
                            intermediateValue161 = 0u;
                            float intermediateValue196;
                            float4 intermediateValue162;
                            float productValue170;
                            float productValue171;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue155 = scalarValue39;
                            intermediateValue156 = 0u;
                            float intermediateValue191;
                            float4 intermediateValue157;
                            float productValue167;
                            float productValue168;
#endif
                            bool comparisonValue45;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue162 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue170 = (multiplyAddValue29 + ((float(int(intermediateValue161 - quotientValue12)) + 0.5f) * intermediateValue162.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue171 = (multiplyAddValue30 + (intermediateValue162.x * (float(int(scalarValue40 - quotientValue12)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue157 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                                productValue167 = (multiplyAddValue50 + ((float(int(intermediateValue156 - quotientValue12)) + 0.5f) * intermediateValue157.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                                productValue168 = (multiplyAddValue51 + (intermediateValue157.x * (float(int(scalarValue40 - quotientValue12)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
#endif
                                comparisonValue45 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue3;
                                if (comparisonValue45)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue170, productValue171, dotProductValue3), 0.0f).x >= multiplyAddValue28);
#elif RD_FEATURE_SEASONS == RD_ON
                                    branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue167, productValue168, dotProductValue3), 0.0f).x >= multiplyAddValue49);
#endif
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    float4 vectorValue7 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue170, productValue171, dotProductValue3));
                                    float productValue70 = frac((productValue170 * intermediateValue162.z) + 0.5f);
                                    float comparisonValue24 = (vectorValue7.x < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue25 = (vectorValue7.w < multiplyAddValue28) ? 0.0f : 1.0f;
                                    float comparisonValue26 = ((((vectorValue7.z < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue25) * productValue70) + comparisonValue25;
                                    branchMergedValue3 = (((((((vectorValue7.y < multiplyAddValue28) ? 0.0f : 1.0f) - comparisonValue24) * productValue70) + comparisonValue24) - comparisonValue26) * frac((productValue171 * intermediateValue162.z) + 0.5f)) + comparisonValue26;
#elif RD_FEATURE_SEASONS == RD_ON
                                    float4 vectorValue13 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue167, productValue168, dotProductValue3));
                                    float productValue223 = frac((productValue167 * intermediateValue157.z) + 0.5f);
                                    float comparisonValue82 = (vectorValue13.x < multiplyAddValue49) ? 0.0f : 1.0f;
                                    float comparisonValue83 = (vectorValue13.w < multiplyAddValue49) ? 0.0f : 1.0f;
                                    float comparisonValue84 = ((((vectorValue13.z < multiplyAddValue49) ? 0.0f : 1.0f) - comparisonValue83) * productValue223) + comparisonValue83;
                                    branchMergedValue3 = (((((((vectorValue13.y < multiplyAddValue49) ? 0.0f : 1.0f) - comparisonValue82) * productValue223) + comparisonValue82) - comparisonValue84) * frac((productValue168 * intermediateValue157.z) + 0.5f)) + comparisonValue84;
#endif
                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue196 = branchMergedValue3;
                                sumValue71 = intermediateValue196 + intermediateValue160;
                                uint sumValue30 = intermediateValue161 + 1u;
                                if (sumValue30 == comparisonValue23)
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue191 = branchMergedValue3;
                                sumValue71 = intermediateValue191 + intermediateValue155;
                                uint sumValue125 = intermediateValue156 + 1u;
                                if (sumValue125 == comparisonValue23)
#endif
                                {
                                    break;
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue160 = sumValue71;
                                    intermediateValue161 = sumValue30;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue155 = sumValue71;
                                    intermediateValue156 = sumValue125;
#endif
                                    continue;
                                }
                            }
                            uint sumValue31 = scalarValue40 + 1u;
                            if (sumValue31 == comparisonValue23)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue39 = sumValue71;
                                scalarValue40 = sumValue31;
                                continue;
                            }
                        }
#if RD_FEATURE_SEASONS == RD_OFF
                        intermediateValue135 = sumValue71;
#elif RD_FEATURE_SEASONS == RD_ON
                        intermediateValue130 = sumValue71;
#endif
                    }
                    else
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        intermediateValue135 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                        intermediateValue130 = 0.0f;
#endif
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    float quotientValue13 = intermediateValue135 / float(int(comparisonValue23 * comparisonValue23));
#elif RD_FEATURE_SEASONS == RD_ON
                    float quotientValue18 = intermediateValue130 / float(int(comparisonValue23 * comparisonValue23));
#endif
                    float branchMergedValue14;
#if RD_FEATURE_SEASONS == RD_OFF
                    if (quotientValue13 < 1.0f)
#elif RD_FEATURE_SEASONS == RD_ON
                    if (quotientValue18 < 1.0f)
#endif
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        branchMergedValue14 = min(1.0f, max(quotientValue13, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#elif RD_FEATURE_SEASONS == RD_ON
                        branchMergedValue14 = min(1.0f, max(quotientValue18, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
#endif
                    }
                    else
                    {
                        branchMergedValue14 = 1.0f;
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue107 = branchMergedValue14;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue102 = branchMergedValue14;
#endif
                }
                else
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue107 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue102 = 1.0f;
#endif
                }
#if RD_FEATURE_SEASONS == RD_OFF
                float scalarValue41 = min(intermediateValue72, min(intermediateValue88, intermediateValue107));
#elif RD_FEATURE_SEASONS == RD_ON
                float scalarValue94 = min(intermediateValue67, min(intermediateValue83, intermediateValue102));
#endif
                float productValue71 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
                float clampedValue16 = clamp((sumValue9 - productValue71) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue71), 0.0f, 1.0f);
#if RD_FEATURE_SEASONS == RD_OFF
                productValue65 = (((clampedValue16 * clampedValue16) * (1.0f - scalarValue41)) * (3.0f - (clampedValue16 * 2.0f))) + scalarValue41;
                intermediateValue50 = intermediateValue51;
#elif RD_FEATURE_SEASONS == RD_ON
                productValue62 = (((clampedValue16 * clampedValue16) * (1.0f - scalarValue94)) * (3.0f - (clampedValue16 * 2.0f))) + scalarValue94;
                intermediateValue45 = intermediateValue46;
#endif
            }
            else
            {
#if RD_FEATURE_SEASONS == RD_OFF
                productValue65 = 1.0f;
                intermediateValue50 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                productValue62 = 1.0f;
                intermediateValue45 = 1.0f;
#endif
            }
            float multiplyAddValue31 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)));
            float multiplyAddValue32 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)));
            float multiplyAddValue33 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_3.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.w, mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.z, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.y, RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_WORLD_SPACE_DIRECTION.x * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)));
            float inverseLengthValue13 = rsqrt(dot(float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
            float productValue72 = inverseLengthValue13 * multiplyAddValue31;
            float productValue73 = inverseLengthValue13 * multiplyAddValue32;
            float productValue74 = inverseLengthValue13 * multiplyAddValue33;
#if RD_FEATURE_SEASONS == RD_OFF
            float productValue75 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue2);
            float productValue76 = productValue75 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue77 = productValue75 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue78 = productValue75 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue4 = dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(productValue72, productValue73, productValue74));
            float scalarValue42 = max(dotProductValue4, 0.0f);
            float dotProductValue5 = max(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(sumValue14, sumValue15, sumValue16)), 0.0f);
#elif RD_FEATURE_SEASONS == RD_ON
            float productValue224 = RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.x * (RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.w * sampledTextureValue3);
            float productValue225 = productValue224 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.x;
            float productValue226 = productValue224 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.y;
            float productValue227 = productValue224 * RD_UNIFORM_DIRECTIONAL_LIGHT_SOURCE_DIFFUSE_COLOR_AND_ILLUMINANCE.z;
            float dotProductValue16 = dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(productValue72, productValue73, productValue74));
            float scalarValue95 = max(dotProductValue16, 0.0f);
            float dotProductValue17 = max(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(sumValue14, sumValue15, sumValue16)), 0.0f);
#endif
            float sumValue32 = RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y + 1.0f;
            float productValue79 = sumValue32 * sumValue32;
            float sumValue33 = productValue72 - quotientValue6;
            float sumValue34 = productValue73 - quotientValue7;
            float sumValue35 = productValue74 - quotientValue8;
            float inverseLengthValue14 = rsqrt(dot(float3(sumValue33, sumValue34, sumValue35), float3(sumValue33, sumValue34, sumValue35)));
            float productValue80 = inverseLengthValue14 * sumValue33;
            float productValue81 = inverseLengthValue14 * sumValue34;
            float productValue82 = inverseLengthValue14 * sumValue35;
#if RD_FEATURE_SEASONS == RD_OFF
            float scalarValue43 = max(intermediateValue16, 0.0500000007450580596923828125f);
            float productValue83 = scalarValue43 * scalarValue43;
            float productValue84 = productValue83 * productValue83;
            float dotProductValue6 = max(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3(productValue80, productValue81, productValue82)), 0.0f);
            float productValue85 = ((dotProductValue6 * dotProductValue6) * (productValue84 + (-1.0f))) + 1.0f;
            float productValue86 = productValue83 * 0.5f;
            float sumValue36 = 1.0f - productValue86;
            float sumValue37 = productValue86 + 9.9999997473787516355514526367188e-05f;
#elif RD_FEATURE_SEASONS == RD_ON
            float scalarValue96 = max(intermediateValue11, 0.0500000007450580596923828125f);
            float productValue228 = scalarValue96 * scalarValue96;
            float productValue229 = productValue228 * productValue228;
            float dotProductValue18 = max(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3(productValue80, productValue81, productValue82)), 0.0f);
            float productValue230 = ((dotProductValue18 * dotProductValue18) * (productValue229 + (-1.0f))) + 1.0f;
            float productValue231 = productValue228 * 0.5f;
            float sumValue126 = 1.0f - productValue231;
            float sumValue127 = productValue231 + 9.9999997473787516355514526367188e-05f;
#endif
            float clampedValue17 = clamp(1.0f - max(dot(float3(sumValue14, sumValue15, sumValue16), float3(productValue80, productValue81, productValue82)), 0.0f), 0.0f, 1.0f);
            float productValue87 = clampedValue17 * clampedValue17;
            float productValue88 = (productValue87 * productValue87) * clampedValue17;
#if RD_FEATURE_SEASONS == RD_OFF
            float productValue89 = (productValue88 * (1.0f - productValue54)) + productValue54;
            float productValue90 = (productValue88 * (1.0f - productValue55)) + productValue55;
            float productValue91 = (productValue88 * (1.0f - productValue56)) + productValue56;
            float quotientValue14 = ((dotProductValue5 / ((sumValue36 * dotProductValue5) + sumValue37)) * (productValue84 / ((productValue85 * productValue85) * 3.1415927410125732421875f))) * (scalarValue42 / ((sumValue36 * scalarValue42) + sumValue37));
            float productValue92 = ((scalarValue42 * 4.0f) * dotProductValue5) + 9.9999997473787516355514526367188e-05f;
            float quotientValue15 = (((max((dotProductValue4 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue79, 0.0f) - scalarValue42) * productValue57) + scalarValue42) * productValue65;
            float dotProductValue7 = (intermediateValue50 * productValue57) * max((dot(float3((-0.0f) - multiplyAddValue15, (-0.0f) - multiplyAddValue16, (-0.0f) - multiplyAddValue17), float3(productValue72, productValue73, productValue74)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue79, 0.0f);
            float productValue93 = sumValue12 * 0.3183098733425140380859375f;
            float productValue94 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue42 * productValue65);
            intermediateValue28 = (productValue94 * productValue76) * ((productValue89 * quotientValue14) / productValue92);
            intermediateValue30 = (productValue94 * productValue77) * ((productValue90 * quotientValue14) / productValue92);
            intermediateValue32 = (productValue94 * productValue78) * ((productValue91 * quotientValue14) / productValue92);
            intermediateValue34 = (((productValue93 * exponentialValue) * productValue76) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue89) * quotientValue15) + dotProductValue7);
            intermediateValue36 = (((productValue93 * exponentialValue1) * productValue77) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue90) * quotientValue15) + dotProductValue7);
            intermediateValue38 = (((productValue93 * exponentialValue2) * productValue78) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue91) * quotientValue15) + dotProductValue7);
#elif RD_FEATURE_SEASONS == RD_ON
            float productValue232 = (productValue88 * (1.0f - productValue214)) + productValue214;
            float productValue233 = (productValue88 * (1.0f - productValue215)) + productValue215;
            float productValue234 = (productValue88 * (1.0f - productValue216)) + productValue216;
            float quotientValue19 = ((dotProductValue17 / ((sumValue126 * dotProductValue17) + sumValue127)) * (productValue229 / ((productValue230 * productValue230) * 3.1415927410125732421875f))) * (scalarValue95 / ((sumValue126 * scalarValue95) + sumValue127));
            float productValue235 = ((scalarValue95 * 4.0f) * dotProductValue17) + 9.9999997473787516355514526367188e-05f;
            float quotientValue20 = (((max((dotProductValue16 + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue79, 0.0f) - scalarValue95) * productValue217) + scalarValue95) * productValue62;
            float dotProductValue19 = (intermediateValue45 * productValue217) * max((dot(float3((-0.0f) - multiplyAddValue42, (-0.0f) - multiplyAddValue43, (-0.0f) - multiplyAddValue44), float3(productValue72, productValue73, productValue74)) + RD_UNIFORM_SUBSURFACE_SCATTERING_CONTRIBUTION_AND_DIFFUSE_WRAP_VALUE_AND_FALLOFF_SCALE.y) / productValue79, 0.0f);
            float productValue236 = sumValue120 * 0.3183098733425140380859375f;
            float productValue237 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.y * (scalarValue95 * productValue62);
            intermediateValue23 = (productValue237 * productValue225) * ((productValue232 * quotientValue19) / productValue235);
            intermediateValue25 = (productValue237 * productValue226) * ((productValue233 * quotientValue19) / productValue235);
            intermediateValue27 = (productValue237 * productValue227) * ((productValue234 * quotientValue19) / productValue235);
            intermediateValue29 = (((productValue236 * exponentialValue) * productValue225) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue232) * quotientValue20) + dotProductValue19);
            intermediateValue31 = (((productValue236 * exponentialValue1) * productValue226) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue233) * quotientValue20) + dotProductValue19);
            intermediateValue33 = (((productValue236 * exponentialValue2) * productValue227) * RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.x) * (((1.0f - productValue234) * quotientValue20) + dotProductValue19);
#endif
        }
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue47;
        float intermediateValue48;
        float intermediateValue49;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
#endif
        if (RD_UNIFORM_DIRECTIONAL_LIGHT_TOGGLE_AND_MAX_DISTANCE_AND_MAX_CASCADES_PER_LIGHT_AND_GPU_BLOCK_LIGHTING_ENABLED.w != 0.0f)
        {
#if RD_FEATURE_SEASONS == RD_OFF
            float productValue95 = ((varyingTexCoord3.x + (-0.5f)) + (productValue15 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue96 = ((varyingTexCoord3.y + (-0.5f)) + (productValue16 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue104 = ((varyingTexCoord3.z + (-0.5f)) + (productValue17 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue105 = floor(productValue95 * 0.0625f) * 16.0f;
            float productValue106 = floor(productValue96 * 0.0625f) * 16.0f;
            float productValue107 = floor(productValue104 * 0.0625f) * 16.0f;
            uint productValue108 = uint(int(floor(float(int(uint(int(floor(productValue95))))) * 0.0625f)));
            uint productValue109 = uint(int(floor(float(int(uint(int(floor(productValue96))))) * 0.0625f)));
            uint productValue110 = uint(int(floor(float(int(uint(int(floor(productValue104))))) * 0.0625f)));
            float sumValue38 = productValue95 - productValue105;
            float sumValue39 = productValue96 - productValue106;
            float sumValue40 = productValue104 - productValue107;
            uint bitwiseValue1 = (productValue109 << 16u) | (productValue108 & 65535u);
            uint bitwiseValue2 = productValue110 & 65535u;
            uint productValue111 = productValue108 * 1540483477u;
            uint productValue112 = productValue109 * 1540483477u;
            uint productValue113 = productValue110 * 1540483477u;
            uint bitwiseValue3 = ((((((((productValue111 >> 24u) ^ productValue111) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue112 >> 24u) ^ productValue112) * 1540483477u)) * 1540483477u) ^ (((productValue113 >> 24u) ^ productValue113) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue28 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
#elif RD_FEATURE_SEASONS == RD_ON
            float productValue238 = ((varyingTexCoord3.x + (-0.5f)) + (productValue210 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.x;
            float productValue239 = ((varyingTexCoord3.y + (-0.5f)) + (productValue211 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.y;
            float productValue240 = ((varyingTexCoord3.z + (-0.5f)) + (productValue212 * 0.20000000298023223876953125f)) - RD_UNIFORM_WORLD_ORIGIN.z;
            float productValue241 = floor(productValue238 * 0.0625f) * 16.0f;
            float productValue242 = floor(productValue239 * 0.0625f) * 16.0f;
            float productValue243 = floor(productValue240 * 0.0625f) * 16.0f;
            uint productValue244 = uint(int(floor(float(int(uint(int(floor(productValue238))))) * 0.0625f)));
            uint productValue245 = uint(int(floor(float(int(uint(int(floor(productValue239))))) * 0.0625f)));
            uint productValue246 = uint(int(floor(float(int(uint(int(floor(productValue240))))) * 0.0625f)));
            float sumValue128 = productValue238 - productValue241;
            float sumValue129 = productValue239 - productValue242;
            float sumValue130 = productValue240 - productValue243;
            uint bitwiseValue35 = (productValue245 << 16u) | (productValue244 & 65535u);
            uint bitwiseValue36 = productValue246 & 65535u;
            uint productValue247 = productValue244 * 1540483477u;
            uint productValue248 = productValue245 * 1540483477u;
            uint productValue249 = productValue246 * 1540483477u;
            uint bitwiseValue37 = ((((((((productValue247 >> 24u) ^ productValue247) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue248 >> 24u) ^ productValue248) * 1540483477u)) * 1540483477u) ^ (((productValue249 >> 24u) ^ productValue249) * 1540483477u)) * 1540483477u;
            uint bitwiseValue38 = ((bitwiseValue37 >> 13u) ^ bitwiseValue37) * 1540483477u;
            uint bitwiseValue39 = (bitwiseValue38 >> 15u) ^ bitwiseValue38;
            uint bitwiseValue40 = bitwiseValue39 >> 16u;
            uint bitwiseValue41 = bitwiseValue39 & 65535u;
            uint comparisonValue85 = uint(bitwiseValue41 == bitwiseValue40) | (bitwiseValue41 ^ bitwiseValue40);
#endif
            uint sumValue41 = uint(RD_UNIFORM_GPU_ENTRY_BUFFER_CAPACITY.x) + 4294967295u;
#if RD_FEATURE_SEASONS == RD_OFF
            bool intermediateValue80;
            uint scalarValue44 = comparisonValue28;
#elif RD_FEATURE_SEASONS == RD_ON
            bool intermediateValue75;
            uint scalarValue97 = comparisonValue85;
#endif
            uint scalarValue45 = 0u;
            uint scalarValue46 = 0u;
            uint loadedBufferValue11;
            uint bitwiseValue7;
            for (;;)
            {
#if RD_FEATURE_SEASONS == RD_OFF
                bitwiseValue7 = scalarValue44 & sumValue41;
#elif RD_FEATURE_SEASONS == RD_ON
                bitwiseValue7 = scalarValue97 & sumValue41;
#endif
                uint loadedBufferValue12 = rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 2u).x & 65535u;
#if RD_FEATURE_SEASONS == RD_OFF
                bool loadedBufferValue13 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue2) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue1) && (loadedBufferValue12 == comparisonValue28));
                loadedBufferValue11 = loadedBufferValue13 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue45;
                if ((loadedBufferValue12 == 0u) || loadedBufferValue13)
#elif RD_FEATURE_SEASONS == RD_ON
                bool loadedBufferValue38 = (rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 1u).x == bitwiseValue36) && ((rdLoad_gpuEntryBuffer(bitwiseValue7 * 4u).x == bitwiseValue35) && (loadedBufferValue12 == comparisonValue85));
                loadedBufferValue11 = loadedBufferValue38 ? rdLoad_gpuEntryBuffer((bitwiseValue7 * 4u) + 3u).x : scalarValue45;
                if ((loadedBufferValue12 == 0u) || loadedBufferValue38)
#endif
                {
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue80 = loadedBufferValue13;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue75 = loadedBufferValue38;
#endif
                    break;
                }
                else
                {
                    uint sumValue42 = scalarValue46 + 1u;
                    if (int(sumValue42) < int(8u))
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        scalarValue44 = bitwiseValue7 + 1u;
#elif RD_FEATURE_SEASONS == RD_ON
                        scalarValue97 = bitwiseValue7 + 1u;
#endif
                        scalarValue45 = loadedBufferValue11;
                        scalarValue46 = sumValue42;
                        continue;
                    }
                    else
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        intermediateValue80 = false;
#elif RD_FEATURE_SEASONS == RD_ON
                        intermediateValue75 = false;
#endif
                        break;
                    }
                }
            }
            uint bitwiseValue9 = loadedBufferValue11 >> 2u;
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
#if RD_FEATURE_SEASONS == RD_OFF
            if (intermediateValue80)
#elif RD_FEATURE_SEASONS == RD_ON
            if (intermediateValue75)
#endif
            {
#if RD_FEATURE_SEASONS == RD_OFF
                float scalarValue47 = abs(productValue15);
                float scalarValue48 = abs(productValue16);
                float scalarValue49 = abs(productValue17);
#elif RD_FEATURE_SEASONS == RD_ON
                float scalarValue98 = abs(productValue210);
                float scalarValue99 = abs(productValue211);
                float scalarValue100 = abs(productValue212);
#endif
                float branchMergedValue50;
                float branchMergedValue56;
                float branchMergedValue57;
#if RD_FEATURE_SEASONS == RD_OFF
                if (((scalarValue47 >= 1.0f) || (scalarValue48 >= 1.0f)) || (scalarValue49 >= 1.0f))
#elif RD_FEATURE_SEASONS == RD_ON
                if (((scalarValue98 >= 1.0f) || (scalarValue99 >= 1.0f)) || (scalarValue100 >= 1.0f))
#endif
                {
#if RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue192;
                    float intermediateValue193;
                    float intermediateValue194;
                    float intermediateValue195;
#endif
                    float intermediateValue197;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue198;
#endif
                    float intermediateValue199;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue200;
                    float intermediateValue202;
                    float intermediateValue204;
                    float intermediateValue206;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue201;
                    float intermediateValue203;
                    float intermediateValue205;
                    float intermediateValue207;
#endif
                    float intermediateValue208;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue210;
                    float intermediateValue212;
                    float intermediateValue213;
                    float intermediateValue214;
                    float productValue137;
                    float productValue138;
                    float productValue139;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue209;
                    float productValue134;
                    float productValue135;
                    float productValue136;
#endif
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float sumValue46;
                    float sumValue47;
                    float sumValue48;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
#if RD_FEATURE_SEASONS == RD_ON
                    float productValue137;
                    float productValue138;
                    float productValue139;
#endif
                    float productValue140;
#if RD_FEATURE_SEASONS == RD_OFF
                    float productValue141;
                    float productValue142;
                    float productValue143;
#endif
                    bool comparisonValue27;
                    for (;;)
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        float dotProductValue8 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue47, scalarValue48, scalarValue49));
                        float dotProductValue9 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue49, scalarValue47, scalarValue48));
                        float dotProductValue10 = dot(float3(sumValue38, sumValue39, sumValue40), float3(scalarValue48, scalarValue49, scalarValue47));
                        float comparisonValue34 = ((inverseLengthValue6 * ((intermediateValue11 + multiplyAddValue) + intermediateValue12)) > 0.0f) ? ceil(dotProductValue8) : floor(dotProductValue8);
                        float scalarValue50 = floor(dotProductValue9);
                        float scalarValue51 = floor(dotProductValue10);
                        productValue137 = ((comparisonValue34 * scalarValue47) + (scalarValue50 * scalarValue49)) + (scalarValue51 * scalarValue48);
                        productValue138 = ((comparisonValue34 * scalarValue48) + (scalarValue50 * scalarValue47)) + (scalarValue51 * scalarValue49);
                        productValue139 = ((comparisonValue34 * scalarValue49) + (scalarValue50 * scalarValue48)) + (scalarValue51 * scalarValue47);
                        sumValue43 = productValue137 + scalarValue49;
                        sumValue44 = productValue138 + scalarValue47;
                        sumValue45 = productValue139 + scalarValue48;
                        sumValue46 = productValue137 + scalarValue48;
                        sumValue47 = productValue138 + scalarValue49;
                        sumValue48 = productValue139 + scalarValue47;
                        sumValue49 = sumValue43 + scalarValue48;
                        sumValue50 = sumValue47 + scalarValue47;
                        sumValue51 = sumValue45 + scalarValue47;
                        float sumValue52 = dotProductValue9 - scalarValue50;
                        float sumValue53 = dotProductValue10 - scalarValue51;
                        float sumValue54 = 1.0f - sumValue52;
                        float sumValue55 = 1.0f - sumValue53;
                        productValue140 = sumValue55 * sumValue54;
                        productValue141 = sumValue55 * sumValue52;
                        productValue142 = sumValue54 * sumValue53;
                        productValue143 = sumValue53 * sumValue52;
                        comparisonValue27 = ((productValue139 >= 0.0f) && ((productValue137 >= 0.0f) && (productValue138 >= 0.0f))) && ((sumValue51 < 16.0f) && ((sumValue49 < 16.0f) && (sumValue50 < 16.0f)));
#elif RD_FEATURE_SEASONS == RD_ON
                        float dotProductValue20 = dot(float3(sumValue128, sumValue129, sumValue130), float3(scalarValue98, scalarValue99, scalarValue100));
                        float dotProductValue21 = dot(float3(sumValue128, sumValue129, sumValue130), float3(scalarValue100, scalarValue98, scalarValue99));
                        float dotProductValue22 = dot(float3(sumValue128, sumValue129, sumValue130), float3(scalarValue99, scalarValue100, scalarValue98));
                        float comparisonValue86 = ((inverseLengthValue22 * ((intermediateValue6 + multiplyAddValue) + intermediateValue7)) > 0.0f) ? ceil(dotProductValue20) : floor(dotProductValue20);
                        float scalarValue101 = floor(dotProductValue21);
                        float scalarValue102 = floor(dotProductValue22);
                        productValue134 = ((comparisonValue86 * scalarValue98) + (scalarValue101 * scalarValue100)) + (scalarValue102 * scalarValue99);
                        productValue135 = ((comparisonValue86 * scalarValue99) + (scalarValue101 * scalarValue98)) + (scalarValue102 * scalarValue100);
                        productValue136 = ((comparisonValue86 * scalarValue100) + (scalarValue101 * scalarValue99)) + (scalarValue102 * scalarValue98);
                        sumValue43 = productValue134 + scalarValue100;
                        sumValue44 = productValue135 + scalarValue98;
                        sumValue45 = productValue136 + scalarValue99;
                        sumValue46 = productValue134 + scalarValue99;
                        sumValue47 = productValue135 + scalarValue100;
                        sumValue48 = productValue136 + scalarValue98;
                        sumValue49 = sumValue43 + scalarValue99;
                        sumValue50 = sumValue47 + scalarValue98;
                        sumValue51 = sumValue45 + scalarValue98;
                        float sumValue131 = dotProductValue21 - scalarValue101;
                        float sumValue132 = dotProductValue22 - scalarValue102;
                        float sumValue133 = 1.0f - sumValue131;
                        float sumValue134 = 1.0f - sumValue132;
                        productValue137 = sumValue134 * sumValue133;
                        productValue138 = sumValue134 * sumValue131;
                        productValue139 = sumValue133 * sumValue132;
                        productValue140 = sumValue132 * sumValue131;
                        comparisonValue27 = ((productValue136 >= 0.0f) && ((productValue134 >= 0.0f) && (productValue135 >= 0.0f))) && ((sumValue51 < 16.0f) && ((sumValue49 < 16.0f) && (sumValue50 < 16.0f)));
#endif
                        if (comparisonValue27)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            uint4 loadedBufferValue14 = rdLoad_voxelBuffer(((uint(productValue138) + bitwiseValue9) + (uint(productValue139) << 4u)) + (uint(productValue137) << 8u));
                            uint scalarValue52 = loadedBufferValue14.x;
#elif RD_FEATURE_SEASONS == RD_ON
                            uint4 loadedBufferValue39 = rdLoad_voxelBuffer(((uint(productValue135) + bitwiseValue9) + (uint(productValue136) << 4u)) + (uint(productValue134) << 8u));
                            uint scalarValue103 = loadedBufferValue39.x;
#endif
                            float bitwiseValue13;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue151;
                            float intermediateValue152;
                            if (scalarValue52 == 0u)
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue146;
                            float intermediateValue147;
                            if (scalarValue103 == 0u)
#endif
                            {
                                bitwiseValue13 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue151 = 0.0f;
                                intermediateValue152 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue146 = 0.0f;
                                intermediateValue147 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                float bitwiseValue11 = float(scalarValue52 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue52 & 255u);
                                intermediateValue151 = bitwiseValue11 * float((scalarValue52 >> 8u) & 255u);
                                intermediateValue152 = bitwiseValue11 * float((scalarValue52 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                float bitwiseValue42 = float(scalarValue103 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue13 = bitwiseValue42 * float(scalarValue103 & 255u);
                                intermediateValue146 = bitwiseValue42 * float((scalarValue103 >> 8u) & 255u);
                                intermediateValue147 = bitwiseValue42 * float((scalarValue103 >> 16u) & 255u);
#endif
                            }
                            uint4 loadedBufferValue15 = rdLoad_voxelBuffer(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u));
                            uint scalarValue53 = loadedBufferValue15.x;
                            float bitwiseValue17;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue163;
                            float intermediateValue164;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue158;
                            float intermediateValue159;
#endif
                            if (scalarValue53 == 0u)
                            {
                                bitwiseValue17 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue163 = 0.0f;
                                intermediateValue164 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue158 = 0.0f;
                                intermediateValue159 = 0.0f;
#endif
                            }
                            else
                            {
                                float bitwiseValue12 = float(scalarValue53 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue53 & 255u);
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue163 = bitwiseValue12 * float((scalarValue53 >> 8u) & 255u);
                                intermediateValue164 = bitwiseValue12 * float((scalarValue53 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue158 = bitwiseValue12 * float((scalarValue53 >> 8u) & 255u);
                                intermediateValue159 = bitwiseValue12 * float((scalarValue53 >> 16u) & 255u);
#endif
                            }
                            uint4 loadedBufferValue16 = rdLoad_voxelBuffer(((uint(sumValue47) + bitwiseValue9) + (uint(sumValue48) << 4u)) + (uint(sumValue46) << 8u));
                            uint scalarValue54 = loadedBufferValue16.x;
                            float bitwiseValue21;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue182;
                            float intermediateValue183;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue177;
                            float intermediateValue178;
#endif
                            if (scalarValue54 == 0u)
                            {
                                bitwiseValue21 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue182 = 0.0f;
                                intermediateValue183 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue177 = 0.0f;
                                intermediateValue178 = 0.0f;
#endif
                            }
                            else
                            {
                                float bitwiseValue14 = float(scalarValue54 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue54 & 255u);
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue182 = bitwiseValue14 * float((scalarValue54 >> 8u) & 255u);
                                intermediateValue183 = bitwiseValue14 * float((scalarValue54 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue177 = bitwiseValue14 * float((scalarValue54 >> 8u) & 255u);
                                intermediateValue178 = bitwiseValue14 * float((scalarValue54 >> 16u) & 255u);
#endif
                            }
                            uint4 loadedBufferValue17 = rdLoad_voxelBuffer(((uint(sumValue50) + bitwiseValue9) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u));
                            uint scalarValue55 = loadedBufferValue17.x;
#if RD_FEATURE_SEASONS == RD_OFF
                            float branchMergedValue15;
#elif RD_FEATURE_SEASONS == RD_ON
                            float branchMergedValue17;
#endif
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
                            if (scalarValue55 == 0u)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                branchMergedValue15 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                branchMergedValue17 = 0.0f;
#endif
                                branchMergedValue26 = 0.0f;
                                branchMergedValue27 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                branchMergedValue28 = intermediateValue183;
                                branchMergedValue29 = intermediateValue182;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue164;
                                branchMergedValue32 = intermediateValue163;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue152;
                                branchMergedValue44 = bitwiseValue13;
                                branchMergedValue45 = intermediateValue151;
#elif RD_FEATURE_SEASONS == RD_ON
                                branchMergedValue28 = intermediateValue177;
                                branchMergedValue29 = bitwiseValue21;
                                branchMergedValue30 = intermediateValue159;
                                branchMergedValue31 = intermediateValue158;
                                branchMergedValue32 = intermediateValue178;
                                branchMergedValue33 = intermediateValue147;
                                branchMergedValue34 = bitwiseValue13;
                                branchMergedValue44 = intermediateValue146;
                                branchMergedValue45 = bitwiseValue17;
#endif
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                branchMergedValue15 = bitwiseValue16 * float((scalarValue55 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                branchMergedValue17 = bitwiseValue16 * float((scalarValue55 >> 16u) & 255u);
#endif
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue55 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue55 & 255u);
#if RD_FEATURE_SEASONS == RD_OFF
                                branchMergedValue28 = intermediateValue183;
                                branchMergedValue29 = intermediateValue182;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue164;
                                branchMergedValue32 = intermediateValue163;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue152;
                                branchMergedValue44 = bitwiseValue13;
                                branchMergedValue45 = intermediateValue151;
#elif RD_FEATURE_SEASONS == RD_ON
                                branchMergedValue28 = intermediateValue177;
                                branchMergedValue29 = bitwiseValue21;
                                branchMergedValue30 = intermediateValue159;
                                branchMergedValue31 = intermediateValue158;
                                branchMergedValue32 = intermediateValue178;
                                branchMergedValue33 = intermediateValue147;
                                branchMergedValue34 = bitwiseValue13;
                                branchMergedValue44 = intermediateValue146;
                                branchMergedValue45 = bitwiseValue17;
#endif
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue197 = branchMergedValue44;
                            intermediateValue198 = branchMergedValue45;
                            intermediateValue199 = branchMergedValue34;
                            intermediateValue200 = branchMergedValue33;
                            intermediateValue202 = branchMergedValue32;
                            intermediateValue204 = branchMergedValue31;
                            intermediateValue206 = branchMergedValue30;
                            intermediateValue208 = branchMergedValue29;
                            intermediateValue210 = branchMergedValue28;
                            intermediateValue212 = branchMergedValue27;
                            intermediateValue213 = branchMergedValue26;
                            intermediateValue214 = branchMergedValue15;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue192 = branchMergedValue34;
                            intermediateValue193 = branchMergedValue44;
                            intermediateValue194 = branchMergedValue33;
                            intermediateValue195 = branchMergedValue45;
                            intermediateValue197 = branchMergedValue31;
                            intermediateValue199 = branchMergedValue30;
                            intermediateValue201 = branchMergedValue29;
                            intermediateValue203 = branchMergedValue28;
                            intermediateValue205 = branchMergedValue32;
                            intermediateValue207 = branchMergedValue27;
                            intermediateValue208 = branchMergedValue26;
                            intermediateValue209 = branchMergedValue17;
#endif
                            break;
                        }
                        else
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue166;
                            float intermediateValue167;
                            float intermediateValue168;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue161;
                            float intermediateValue162;
                            float intermediateValue163;
#endif
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue35;
                            bool comparisonValue36;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue72 = productValue137 + productValue105;
                                sumValue73 = productValue138 + productValue106;
                                sumValue74 = productValue139 + productValue107;
                                uint comparisonValue37 = ((((uint(productValue137 >= 16.0f) << 1u) | uint(productValue137 < 0.0f)) | (uint(productValue138 < 0.0f) << 2u)) | (uint(productValue138 >= 16.0f) << 3u)) | (uint(productValue139 < 0.0f) << 4u);
                                comparisonValue35 = intermediateValue[comparisonValue37 | (uint(productValue139 >= 16.0f) << 5u)];
                                comparisonValue36 = ((((comparisonValue37 | (uint(productValue139 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue37 & 31u))) == 0u;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue72 = productValue134 + productValue241;
                                sumValue73 = productValue135 + productValue242;
                                sumValue74 = productValue136 + productValue243;
                                uint comparisonValue87 = ((((uint(productValue134 >= 16.0f) << 1u) | uint(productValue134 < 0.0f)) | (uint(productValue135 < 0.0f) << 2u)) | (uint(productValue135 >= 16.0f) << 3u)) | (uint(productValue136 < 0.0f) << 4u);
                                comparisonValue35 = intermediateValue[comparisonValue87 | (uint(productValue136 >= 16.0f) << 5u)];
                                comparisonValue36 = ((((comparisonValue87 | (uint(productValue136 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue87 & 31u))) == 0u;
#endif
                                uint loadedBufferValue19;
                                if (comparisonValue36)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue35 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue166 = 0.0f;
                                        intermediateValue167 = 0.0f;
                                        intermediateValue168 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue161 = 0.0f;
                                        intermediateValue162 = 0.0f;
                                        intermediateValue163 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue19 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue35).x >> 2u);
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    loadedBufferValue19 = ((((uint(productValue139) << 4u) & 240u) | (uint(productValue138) & 15u)) | ((uint(productValue137) << 8u) & 3840u)) + bitwiseValue9;
#elif RD_FEATURE_SEASONS == RD_ON
                                    loadedBufferValue19 = ((((uint(productValue136) << 4u) & 240u) | (uint(productValue135) & 15u)) | ((uint(productValue134) << 8u) & 3840u)) + bitwiseValue9;
#endif
                                }
                                uint4 loadedBufferValue18 = rdLoad_voxelBuffer(loadedBufferValue19);
                                uint scalarValue56 = loadedBufferValue18.x;
                                if (scalarValue56 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue166 = 0.0f;
                                    intermediateValue167 = 0.0f;
                                    intermediateValue168 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue161 = 0.0f;
                                    intermediateValue162 = 0.0f;
                                    intermediateValue163 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue166 = bitwiseValue18 * float(scalarValue56 & 255u);
                                intermediateValue167 = bitwiseValue18 * float((scalarValue56 >> 8u) & 255u);
                                intermediateValue168 = bitwiseValue18 * float((scalarValue56 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue161 = bitwiseValue18 * float(scalarValue56 & 255u);
                                intermediateValue162 = bitwiseValue18 * float((scalarValue56 >> 8u) & 255u);
                                intermediateValue163 = bitwiseValue18 * float((scalarValue56 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue201;
                            float intermediateValue203;
                            float intermediateValue205;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue196;
                            float intermediateValue198;
                            float intermediateValue200;
#endif
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue47;
                            bool comparisonValue48;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue93 = sumValue43 + productValue105;
                                sumValue94 = sumValue44 + productValue106;
                                sumValue95 = sumValue45 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue93 = sumValue43 + productValue241;
                                sumValue94 = sumValue44 + productValue242;
                                sumValue95 = sumValue45 + productValue243;
#endif
                                uint comparisonValue40 = ((((uint(sumValue43 >= 16.0f) << 1u) | uint(sumValue43 < 0.0f)) | (uint(sumValue44 < 0.0f) << 2u)) | (uint(sumValue44 >= 16.0f) << 3u)) | (uint(sumValue45 < 0.0f) << 4u);
                                comparisonValue47 = intermediateValue[comparisonValue40 | (uint(sumValue45 >= 16.0f) << 5u)];
                                comparisonValue48 = ((((comparisonValue40 | (uint(sumValue45 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue40 & 31u))) == 0u;
                                uint loadedBufferValue26;
                                if (comparisonValue48)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue47 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue201 = 0.0f;
                                        intermediateValue203 = 0.0f;
                                        intermediateValue205 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue196 = 0.0f;
                                        intermediateValue198 = 0.0f;
                                        intermediateValue200 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue26 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue47).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue26 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue20 = rdLoad_voxelBuffer(loadedBufferValue26);
                                uint scalarValue57 = loadedBufferValue20.x;
                                if (scalarValue57 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue201 = 0.0f;
                                    intermediateValue203 = 0.0f;
                                    intermediateValue205 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue196 = 0.0f;
                                    intermediateValue198 = 0.0f;
                                    intermediateValue200 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue201 = bitwiseValue20 * float(scalarValue57 & 255u);
                                intermediateValue203 = bitwiseValue20 * float((scalarValue57 >> 8u) & 255u);
                                intermediateValue205 = bitwiseValue20 * float((scalarValue57 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue196 = bitwiseValue20 * float(scalarValue57 & 255u);
                                intermediateValue198 = bitwiseValue20 * float((scalarValue57 >> 8u) & 255u);
                                intermediateValue200 = bitwiseValue20 * float((scalarValue57 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue207;
                            float intermediateValue209;
                            float intermediateValue211;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue202;
                            float intermediateValue204;
                            float intermediateValue206;
#endif
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            uint comparisonValue57;
                            bool comparisonValue58;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue102 = sumValue46 + productValue105;
                                sumValue103 = sumValue47 + productValue106;
                                sumValue104 = sumValue48 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue102 = sumValue46 + productValue241;
                                sumValue103 = sumValue47 + productValue242;
                                sumValue104 = sumValue48 + productValue243;
#endif
                                uint comparisonValue42 = ((((uint(sumValue46 >= 16.0f) << 1u) | uint(sumValue46 < 0.0f)) | (uint(sumValue47 < 0.0f) << 2u)) | (uint(sumValue47 >= 16.0f) << 3u)) | (uint(sumValue48 < 0.0f) << 4u);
                                comparisonValue57 = intermediateValue[comparisonValue42 | (uint(sumValue48 >= 16.0f) << 5u)];
                                comparisonValue58 = ((((comparisonValue42 | (uint(sumValue48 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue42 & 31u))) == 0u;
                                uint loadedBufferValue30;
                                if (comparisonValue58)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue57 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue207 = 0.0f;
                                        intermediateValue209 = 0.0f;
                                        intermediateValue211 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue202 = 0.0f;
                                        intermediateValue204 = 0.0f;
                                        intermediateValue206 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue30 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue57).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue30 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue21 = rdLoad_voxelBuffer(loadedBufferValue30);
                                uint scalarValue58 = loadedBufferValue21.x;
                                if (scalarValue58 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue207 = 0.0f;
                                    intermediateValue209 = 0.0f;
                                    intermediateValue211 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue202 = 0.0f;
                                    intermediateValue204 = 0.0f;
                                    intermediateValue206 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue207 = bitwiseValue22 * float(scalarValue58 & 255u);
                                intermediateValue209 = bitwiseValue22 * float((scalarValue58 >> 8u) & 255u);
                                intermediateValue211 = bitwiseValue22 * float((scalarValue58 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue202 = bitwiseValue22 * float(scalarValue58 & 255u);
                                intermediateValue204 = bitwiseValue22 * float((scalarValue58 >> 8u) & 255u);
                                intermediateValue206 = bitwiseValue22 * float((scalarValue58 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float sumValue56 = sumValue49 + productValue105;
                            float sumValue57 = sumValue50 + productValue106;
                            float sumValue58 = sumValue51 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                            float sumValue135 = sumValue49 + productValue241;
                            float sumValue136 = sumValue50 + productValue242;
                            float sumValue137 = sumValue51 + productValue243;
#endif
                            uint comparisonValue43 = ((((uint(sumValue49 >= 16.0f) << 1u) | uint(sumValue49 < 0.0f)) | (uint(sumValue50 < 0.0f) << 2u)) | (uint(sumValue50 >= 16.0f) << 3u)) | (uint(sumValue51 < 0.0f) << 4u);
                            uint comparisonValue44 = comparisonValue43 | (uint(sumValue51 >= 16.0f) << 5u);
                            uint loadedBufferValue34;
                            if ((((comparisonValue44 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue43 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue44] & 31u))) == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue197 = intermediateValue166;
                                    intermediateValue198 = intermediateValue167;
                                    intermediateValue199 = intermediateValue168;
                                    intermediateValue200 = intermediateValue201;
                                    intermediateValue202 = intermediateValue203;
                                    intermediateValue204 = intermediateValue205;
                                    intermediateValue206 = intermediateValue207;
                                    intermediateValue208 = intermediateValue209;
                                    intermediateValue210 = intermediateValue211;
                                    intermediateValue212 = 0.0f;
                                    intermediateValue213 = 0.0f;
                                    intermediateValue214 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue192 = intermediateValue161;
                                    intermediateValue193 = intermediateValue162;
                                    intermediateValue194 = intermediateValue163;
                                    intermediateValue195 = intermediateValue196;
                                    intermediateValue197 = intermediateValue198;
                                    intermediateValue199 = intermediateValue200;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = intermediateValue206;
                                    intermediateValue207 = 0.0f;
                                    intermediateValue208 = 0.0f;
                                    intermediateValue209 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                loadedBufferValue34 = ((((uint(sumValue56 - (floor(sumValue56 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue57 - (floor(sumValue57 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue58 - (floor(sumValue58 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue44]).x >> 2u);
#elif RD_FEATURE_SEASONS == RD_ON
                                loadedBufferValue34 = ((((uint(sumValue135 - (floor(sumValue135 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue136 - (floor(sumValue136 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue137 - (floor(sumValue137 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue44]).x >> 2u);
#endif
                            }
                            else
                            {
                                loadedBufferValue34 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue23 = rdLoad_voxelBuffer(loadedBufferValue34);
                            uint scalarValue59 = loadedBufferValue23.x;
                            if (scalarValue59 == 0u)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue197 = intermediateValue166;
                                intermediateValue198 = intermediateValue167;
                                intermediateValue199 = intermediateValue168;
                                intermediateValue200 = intermediateValue201;
                                intermediateValue202 = intermediateValue203;
                                intermediateValue204 = intermediateValue205;
                                intermediateValue206 = intermediateValue207;
                                intermediateValue208 = intermediateValue209;
                                intermediateValue210 = intermediateValue211;
                                intermediateValue212 = 0.0f;
                                intermediateValue213 = 0.0f;
                                intermediateValue214 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue192 = intermediateValue161;
                                intermediateValue193 = intermediateValue162;
                                intermediateValue194 = intermediateValue163;
                                intermediateValue195 = intermediateValue196;
                                intermediateValue197 = intermediateValue198;
                                intermediateValue199 = intermediateValue200;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = intermediateValue206;
                                intermediateValue207 = 0.0f;
                                intermediateValue208 = 0.0f;
                                intermediateValue209 = 0.0f;
#endif
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue197 = intermediateValue166;
                            intermediateValue198 = intermediateValue167;
                            intermediateValue199 = intermediateValue168;
                            intermediateValue200 = intermediateValue201;
                            intermediateValue202 = intermediateValue203;
                            intermediateValue204 = intermediateValue205;
                            intermediateValue206 = intermediateValue207;
                            intermediateValue208 = intermediateValue209;
                            intermediateValue210 = intermediateValue211;
                            intermediateValue212 = bitwiseValue23 * float(scalarValue59 & 255u);
                            intermediateValue213 = bitwiseValue23 * float((scalarValue59 >> 8u) & 255u);
                            intermediateValue214 = bitwiseValue23 * float((scalarValue59 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue192 = intermediateValue161;
                            intermediateValue193 = intermediateValue162;
                            intermediateValue194 = intermediateValue163;
                            intermediateValue195 = intermediateValue196;
                            intermediateValue197 = intermediateValue198;
                            intermediateValue199 = intermediateValue200;
                            intermediateValue201 = intermediateValue202;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = intermediateValue206;
                            intermediateValue207 = bitwiseValue23 * float(scalarValue59 & 255u);
                            intermediateValue208 = bitwiseValue23 * float((scalarValue59 >> 8u) & 255u);
                            intermediateValue209 = bitwiseValue23 * float((scalarValue59 >> 16u) & 255u);
#endif
                            break;
                        }
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    branchMergedValue50 = (((intermediateValue204 * productValue141) + (intermediateValue199 * productValue140)) + (intermediateValue210 * productValue142)) + (intermediateValue214 * productValue143);
                    branchMergedValue56 = (((intermediateValue202 * productValue141) + (intermediateValue198 * productValue140)) + (intermediateValue208 * productValue142)) + (intermediateValue213 * productValue143);
                    branchMergedValue57 = (((intermediateValue200 * productValue141) + (intermediateValue197 * productValue140)) + (intermediateValue206 * productValue142)) + (intermediateValue212 * productValue143);
#elif RD_FEATURE_SEASONS == RD_ON
                    branchMergedValue50 = (((intermediateValue195 * productValue138) + (intermediateValue192 * productValue137)) + (intermediateValue201 * productValue139)) + (intermediateValue207 * productValue140);
                    branchMergedValue56 = (((intermediateValue199 * productValue138) + (intermediateValue194 * productValue137)) + (intermediateValue205 * productValue139)) + (intermediateValue209 * productValue140);
                    branchMergedValue57 = (((intermediateValue197 * productValue138) + (intermediateValue193 * productValue137)) + (intermediateValue203 * productValue139)) + (intermediateValue208 * productValue140);
#endif
                }
                else
                {
#if RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue211;
                    float intermediateValue212;
                    float intermediateValue213;
                    float intermediateValue214;
#endif
                    float intermediateValue216;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue217;
#endif
                    float intermediateValue218;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue219;
                    float intermediateValue221;
                    float intermediateValue223;
                    float intermediateValue225;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue220;
                    float intermediateValue222;
                    float intermediateValue224;
                    float intermediateValue226;
#endif
                    float intermediateValue227;
#if RD_FEATURE_SEASONS == RD_OFF
                    float intermediateValue229;
                    float intermediateValue231;
                    float intermediateValue232;
                    float intermediateValue233;
                    float intermediateValue119;
                    float intermediateValue120;
                    float intermediateValue121;
                    uint intermediateValue122;
                    uint intermediateValue123;
                    uint intermediateValue124;
                    float intermediateValue127;
#elif RD_FEATURE_SEASONS == RD_ON
                    float intermediateValue228;
                    float intermediateValue114;
                    float intermediateValue115;
                    float intermediateValue116;
                    uint intermediateValue117;
                    uint intermediateValue118;
                    uint intermediateValue119;
                    float intermediateValue122;
#endif
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    bool comparisonValue29;
#if RD_FEATURE_SEASONS == RD_ON
                    uint productValue141;
                    uint productValue142;
                    uint productValue143;
#endif
                    uint productValue144;
                    uint productValue145;
                    uint productValue146;
#if RD_FEATURE_SEASONS == RD_OFF
                    uint productValue147;
                    uint productValue148;
                    uint productValue149;
#endif
                    for (;;)
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        intermediateValue119 = floor(sumValue38);
                        intermediateValue120 = floor(sumValue39);
                        intermediateValue121 = floor(sumValue40);
                        float sumValue65 = sumValue38 - intermediateValue119;
                        float sumValue66 = sumValue39 - intermediateValue120;
                        float sumValue67 = sumValue40 - intermediateValue121;
                        uint comparisonValue46 = ((uint(sumValue66 >= sumValue67) << 1u) | uint(sumValue65 >= sumValue66)) | (uint(sumValue65 >= sumValue67) << 2u);
                        intermediateValue122 = uint(intermediateValue119);
                        intermediateValue123 = uint(intermediateValue120);
                        intermediateValue124 = uint(intermediateValue121);
                        float scalarValue60 = min(sumValue65, sumValue66);
                        float scalarValue61 = max(sumValue65, sumValue66);
                        intermediateValue127 = min(scalarValue60, sumValue67);
                        float scalarValue62 = max(scalarValue61, sumValue67);
                        float scalarValue63 = max(min(scalarValue61, sumValue67), scalarValue60);
                        sumValue59 = 1.0f - scalarValue62;
                        sumValue60 = scalarValue62 - scalarValue63;
                        sumValue61 = scalarValue63 - intermediateValue127;
                        sumValue62 = intermediateValue119 + 1.0f;
                        sumValue63 = intermediateValue120 + 1.0f;
                        sumValue64 = intermediateValue121 + 1.0f;
                        comparisonValue29 = (((intermediateValue119 >= 0.0f) && (intermediateValue120 >= 0.0f)) && (intermediateValue121 >= 0.0f)) && (((sumValue62 < 16.0f) && (sumValue63 < 16.0f)) && (sumValue64 < 16.0f));
                        productValue144 = 0u + (comparisonValue46 * 3u);
                        productValue145 = 1u + (comparisonValue46 * 3u);
                        productValue146 = 2u + (comparisonValue46 * 3u);
                        productValue147 = 0u + (comparisonValue46 * 3u);
                        productValue148 = 1u + (comparisonValue46 * 3u);
                        productValue149 = 2u + (comparisonValue46 * 3u);
#elif RD_FEATURE_SEASONS == RD_ON
                        intermediateValue114 = floor(sumValue128);
                        intermediateValue115 = floor(sumValue129);
                        intermediateValue116 = floor(sumValue130);
                        float sumValue138 = sumValue128 - intermediateValue114;
                        float sumValue139 = sumValue129 - intermediateValue115;
                        float sumValue140 = sumValue130 - intermediateValue116;
                        uint comparisonValue88 = ((uint(sumValue139 >= sumValue140) << 1u) | uint(sumValue138 >= sumValue139)) | (uint(sumValue138 >= sumValue140) << 2u);
                        intermediateValue117 = uint(intermediateValue114);
                        intermediateValue118 = uint(intermediateValue115);
                        intermediateValue119 = uint(intermediateValue116);
                        float scalarValue104 = min(sumValue138, sumValue139);
                        float scalarValue105 = max(sumValue138, sumValue139);
                        intermediateValue122 = min(scalarValue104, sumValue140);
                        float scalarValue106 = max(scalarValue105, sumValue140);
                        float scalarValue107 = max(min(scalarValue105, sumValue140), scalarValue104);
                        sumValue59 = 1.0f - scalarValue106;
                        sumValue60 = scalarValue106 - scalarValue107;
                        sumValue61 = scalarValue107 - intermediateValue122;
                        sumValue62 = intermediateValue114 + 1.0f;
                        sumValue63 = intermediateValue115 + 1.0f;
                        sumValue64 = intermediateValue116 + 1.0f;
                        comparisonValue29 = (((intermediateValue114 >= 0.0f) && (intermediateValue115 >= 0.0f)) && (intermediateValue116 >= 0.0f)) && (((sumValue62 < 16.0f) && (sumValue63 < 16.0f)) && (sumValue64 < 16.0f));
                        productValue141 = 0u + (comparisonValue88 * 3u);
                        productValue142 = 1u + (comparisonValue88 * 3u);
                        productValue143 = 2u + (comparisonValue88 * 3u);
                        productValue144 = 0u + (comparisonValue88 * 3u);
                        productValue145 = 1u + (comparisonValue88 * 3u);
                        productValue146 = 2u + (comparisonValue88 * 3u);
#endif
                        if (comparisonValue29)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            uint bitwiseValue25 = intermediateValue124 << 4u;
                            uint sumValue68 = intermediateValue123 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue68 + (intermediateValue122 << 8u);
                            uint4 loadedBufferValue24 = rdLoad_voxelBuffer(bitwiseValue26 + bitwiseValue25);
                            uint scalarValue64 = loadedBufferValue24.x;
#elif RD_FEATURE_SEASONS == RD_ON
                            uint bitwiseValue43 = intermediateValue119 << 4u;
                            uint sumValue141 = intermediateValue118 + bitwiseValue9;
                            uint bitwiseValue44 = sumValue141 + (intermediateValue117 << 8u);
                            uint4 loadedBufferValue40 = rdLoad_voxelBuffer(bitwiseValue44 + bitwiseValue43);
                            uint scalarValue108 = loadedBufferValue40.x;
#endif
                            float bitwiseValue15;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue154;
                            float intermediateValue155;
                            if (scalarValue64 == 0u)
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue149;
                            float intermediateValue150;
                            if (scalarValue108 == 0u)
#endif
                            {
                                bitwiseValue15 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue154 = 0.0f;
                                intermediateValue155 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue149 = 0.0f;
                                intermediateValue150 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                float bitwiseValue27 = float(scalarValue64 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue64 & 255u);
                                intermediateValue154 = bitwiseValue27 * float((scalarValue64 >> 8u) & 255u);
                                intermediateValue155 = bitwiseValue27 * float((scalarValue64 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                float bitwiseValue45 = float(scalarValue108 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue15 = bitwiseValue45 * float(scalarValue108 & 255u);
                                intermediateValue149 = bitwiseValue45 * float((scalarValue108 >> 8u) & 255u);
                                intermediateValue150 = bitwiseValue45 * float((scalarValue108 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            uint4 loadedBufferValue25 = rdLoad_voxelBuffer(((intermediateValue1[productValue145] + sumValue68) + ((intermediateValue1[productValue144] + intermediateValue122) << 8u)) + ((intermediateValue1[productValue146] + intermediateValue124) << 4u));
                            uint scalarValue65 = loadedBufferValue25.x;
#elif RD_FEATURE_SEASONS == RD_ON
                            uint4 loadedBufferValue41 = rdLoad_voxelBuffer(((intermediateValue1[productValue142] + sumValue141) + ((intermediateValue1[productValue141] + intermediateValue117) << 8u)) + ((intermediateValue1[productValue143] + intermediateValue119) << 4u));
                            uint scalarValue109 = loadedBufferValue41.x;
#endif
                            float bitwiseValue19;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue170;
                            float intermediateValue171;
                            if (scalarValue65 == 0u)
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue165;
                            float intermediateValue166;
                            if (scalarValue109 == 0u)
#endif
                            {
                                bitwiseValue19 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue170 = 0.0f;
                                intermediateValue171 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue165 = 0.0f;
                                intermediateValue166 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                float bitwiseValue28 = float(scalarValue65 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue65 & 255u);
                                intermediateValue170 = bitwiseValue28 * float((scalarValue65 >> 8u) & 255u);
                                intermediateValue171 = bitwiseValue28 * float((scalarValue65 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                float bitwiseValue46 = float(scalarValue109 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue19 = bitwiseValue46 * float(scalarValue109 & 255u);
                                intermediateValue165 = bitwiseValue46 * float((scalarValue109 >> 8u) & 255u);
                                intermediateValue166 = bitwiseValue46 * float((scalarValue109 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            uint4 loadedBufferValue27 = rdLoad_voxelBuffer(((intermediateValue2[productValue148] + sumValue68) + ((intermediateValue2[productValue147] + intermediateValue122) << 8u)) + ((intermediateValue2[productValue149] + intermediateValue124) << 4u));
                            uint scalarValue66 = loadedBufferValue27.x;
#elif RD_FEATURE_SEASONS == RD_ON
                            uint4 loadedBufferValue42 = rdLoad_voxelBuffer(((intermediateValue2[productValue145] + sumValue141) + ((intermediateValue2[productValue144] + intermediateValue117) << 8u)) + ((intermediateValue2[productValue146] + intermediateValue119) << 4u));
                            uint scalarValue110 = loadedBufferValue42.x;
#endif
                            float bitwiseValue24;
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue185;
                            float intermediateValue186;
                            if (scalarValue66 == 0u)
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue180;
                            float intermediateValue181;
                            if (scalarValue110 == 0u)
#endif
                            {
                                bitwiseValue24 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue185 = 0.0f;
                                intermediateValue186 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue180 = 0.0f;
                                intermediateValue181 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                float bitwiseValue29 = float(scalarValue66 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue66 & 255u);
                                intermediateValue185 = bitwiseValue29 * float((scalarValue66 >> 8u) & 255u);
                                intermediateValue186 = bitwiseValue29 * float((scalarValue66 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                float bitwiseValue47 = float(scalarValue110 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                bitwiseValue24 = bitwiseValue47 * float(scalarValue110 & 255u);
                                intermediateValue180 = bitwiseValue47 * float((scalarValue110 >> 8u) & 255u);
                                intermediateValue181 = bitwiseValue47 * float((scalarValue110 >> 16u) & 255u);
#endif
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            uint4 loadedBufferValue29 = rdLoad_voxelBuffer((bitwiseValue26 + 273u) + bitwiseValue25);
                            uint scalarValue67 = loadedBufferValue29.x;
                            float branchMergedValue16;
#elif RD_FEATURE_SEASONS == RD_ON
                            uint4 loadedBufferValue43 = rdLoad_voxelBuffer((bitwiseValue44 + 273u) + bitwiseValue43);
                            uint scalarValue111 = loadedBufferValue43.x;
                            float branchMergedValue18;
#endif
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
                            float branchMergedValue46;
                            float branchMergedValue47;
#if RD_FEATURE_SEASONS == RD_OFF
                            if (scalarValue67 == 0u)
#elif RD_FEATURE_SEASONS == RD_ON
                            if (scalarValue111 == 0u)
#endif
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                branchMergedValue16 = 0.0f;
                                branchMergedValue35 = 0.0f;
                                branchMergedValue36 = 0.0f;
                                branchMergedValue37 = intermediateValue186;
                                branchMergedValue38 = intermediateValue185;
                                branchMergedValue39 = bitwiseValue24;
                                branchMergedValue40 = intermediateValue171;
                                branchMergedValue41 = intermediateValue170;
                                branchMergedValue42 = bitwiseValue19;
                                branchMergedValue43 = intermediateValue155;
                                branchMergedValue46 = intermediateValue154;
                                branchMergedValue47 = bitwiseValue15;
#elif RD_FEATURE_SEASONS == RD_ON
                                branchMergedValue18 = 0.0f;
                                branchMergedValue35 = intermediateValue181;
                                branchMergedValue36 = intermediateValue180;
                                branchMergedValue37 = bitwiseValue24;
                                branchMergedValue38 = intermediateValue166;
                                branchMergedValue39 = intermediateValue165;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue150;
                                branchMergedValue42 = intermediateValue149;
                                branchMergedValue43 = bitwiseValue15;
                                branchMergedValue46 = 0.0f;
                                branchMergedValue47 = 0.0f;
#endif
                            }
                            else
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                float bitwiseValue30 = float(scalarValue67 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue16 = bitwiseValue30 * float((scalarValue67 >> 16u) & 255u);
                                branchMergedValue35 = bitwiseValue30 * float((scalarValue67 >> 8u) & 255u);
                                branchMergedValue36 = bitwiseValue30 * float(scalarValue67 & 255u);
                                branchMergedValue37 = intermediateValue186;
                                branchMergedValue38 = intermediateValue185;
                                branchMergedValue39 = bitwiseValue24;
                                branchMergedValue40 = intermediateValue171;
                                branchMergedValue41 = intermediateValue170;
                                branchMergedValue42 = bitwiseValue19;
                                branchMergedValue43 = intermediateValue155;
                                branchMergedValue46 = intermediateValue154;
                                branchMergedValue47 = bitwiseValue15;
#elif RD_FEATURE_SEASONS == RD_ON
                                float bitwiseValue48 = float(scalarValue111 >> 24u) * 9.2272217443678528070449829101562e-05f;
                                branchMergedValue18 = bitwiseValue48 * float(scalarValue111 & 255u);
                                branchMergedValue35 = intermediateValue181;
                                branchMergedValue36 = intermediateValue180;
                                branchMergedValue37 = bitwiseValue24;
                                branchMergedValue38 = intermediateValue166;
                                branchMergedValue39 = intermediateValue165;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue150;
                                branchMergedValue42 = intermediateValue149;
                                branchMergedValue43 = bitwiseValue15;
                                branchMergedValue46 = bitwiseValue48 * float((scalarValue111 >> 16u) & 255u);
                                branchMergedValue47 = bitwiseValue48 * float((scalarValue111 >> 8u) & 255u);
#endif
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue216 = branchMergedValue47;
                            intermediateValue217 = branchMergedValue46;
                            intermediateValue218 = branchMergedValue43;
                            intermediateValue219 = branchMergedValue42;
                            intermediateValue221 = branchMergedValue41;
                            intermediateValue223 = branchMergedValue40;
                            intermediateValue225 = branchMergedValue39;
                            intermediateValue227 = branchMergedValue38;
                            intermediateValue229 = branchMergedValue37;
                            intermediateValue231 = branchMergedValue36;
                            intermediateValue232 = branchMergedValue35;
                            intermediateValue233 = branchMergedValue16;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue211 = branchMergedValue43;
                            intermediateValue212 = branchMergedValue42;
                            intermediateValue213 = branchMergedValue41;
                            intermediateValue214 = branchMergedValue40;
                            intermediateValue216 = branchMergedValue39;
                            intermediateValue218 = branchMergedValue38;
                            intermediateValue220 = branchMergedValue37;
                            intermediateValue222 = branchMergedValue36;
                            intermediateValue224 = branchMergedValue35;
                            intermediateValue226 = branchMergedValue18;
                            intermediateValue227 = branchMergedValue47;
                            intermediateValue228 = branchMergedValue46;
#endif
                            break;
                        }
                        else
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue173;
                            float intermediateValue174;
                            float intermediateValue175;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue168;
                            float intermediateValue169;
                            float intermediateValue170;
#endif
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            float sumValue80;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue38;
                            bool comparisonValue39;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue76 = float(intermediateValue1[productValue144]) + intermediateValue119;
                                sumValue77 = float(intermediateValue1[productValue145]) + intermediateValue120;
                                sumValue78 = float(intermediateValue1[productValue146]) + intermediateValue121;
                                sumValue79 = float(intermediateValue2[productValue147]) + intermediateValue119;
                                sumValue80 = float(intermediateValue2[productValue148]) + intermediateValue120;
                                sumValue81 = float(intermediateValue2[productValue149]) + intermediateValue121;
                                sumValue82 = intermediateValue119 + productValue105;
                                sumValue83 = intermediateValue120 + productValue106;
                                sumValue84 = intermediateValue121 + productValue107;
                                uint comparisonValue49 = ((((uint(intermediateValue119 >= 16.0f) << 1u) | uint(intermediateValue119 < 0.0f)) | (uint(intermediateValue120 < 0.0f) << 2u)) | (uint(intermediateValue120 >= 16.0f) << 3u)) | (uint(intermediateValue121 < 0.0f) << 4u);
                                comparisonValue38 = intermediateValue[comparisonValue49 | (uint(intermediateValue121 >= 16.0f) << 5u)];
                                comparisonValue39 = ((((comparisonValue49 | (uint(intermediateValue121 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue49 & 31u))) == 0u;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue76 = float(intermediateValue1[productValue141]) + intermediateValue114;
                                sumValue77 = float(intermediateValue1[productValue142]) + intermediateValue115;
                                sumValue78 = float(intermediateValue1[productValue143]) + intermediateValue116;
                                sumValue79 = float(intermediateValue2[productValue144]) + intermediateValue114;
                                sumValue80 = float(intermediateValue2[productValue145]) + intermediateValue115;
                                sumValue81 = float(intermediateValue2[productValue146]) + intermediateValue116;
                                sumValue82 = intermediateValue114 + productValue241;
                                sumValue83 = intermediateValue115 + productValue242;
                                sumValue84 = intermediateValue116 + productValue243;
                                uint comparisonValue89 = ((((uint(intermediateValue114 >= 16.0f) << 1u) | uint(intermediateValue114 < 0.0f)) | (uint(intermediateValue115 < 0.0f) << 2u)) | (uint(intermediateValue115 >= 16.0f) << 3u)) | (uint(intermediateValue116 < 0.0f) << 4u);
                                comparisonValue38 = intermediateValue[comparisonValue89 | (uint(intermediateValue116 >= 16.0f) << 5u)];
                                comparisonValue39 = ((((comparisonValue89 | (uint(intermediateValue116 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue89 & 31u))) == 0u;
#endif
                                uint loadedBufferValue22;
                                if (comparisonValue39)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue38 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue173 = 0.0f;
                                        intermediateValue174 = 0.0f;
                                        intermediateValue175 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue168 = 0.0f;
                                        intermediateValue169 = 0.0f;
                                        intermediateValue170 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue22 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue38).x >> 2u);
                                }
                                else
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    loadedBufferValue22 = ((((intermediateValue122 << 8u) & 3840u) | (intermediateValue123 & 15u)) | ((intermediateValue124 << 4u) & 240u)) + bitwiseValue9;
#elif RD_FEATURE_SEASONS == RD_ON
                                    loadedBufferValue22 = ((((intermediateValue117 << 8u) & 3840u) | (intermediateValue118 & 15u)) | ((intermediateValue119 << 4u) & 240u)) + bitwiseValue9;
#endif
                                }
                                uint4 loadedBufferValue31 = rdLoad_voxelBuffer(loadedBufferValue22);
                                uint scalarValue68 = loadedBufferValue31.x;
                                if (scalarValue68 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue173 = 0.0f;
                                    intermediateValue174 = 0.0f;
                                    intermediateValue175 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue168 = 0.0f;
                                    intermediateValue169 = 0.0f;
                                    intermediateValue170 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue31 = float(scalarValue68 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue173 = bitwiseValue31 * float(scalarValue68 & 255u);
                                intermediateValue174 = bitwiseValue31 * float((scalarValue68 >> 8u) & 255u);
                                intermediateValue175 = bitwiseValue31 * float((scalarValue68 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue168 = bitwiseValue31 * float(scalarValue68 & 255u);
                                intermediateValue169 = bitwiseValue31 * float((scalarValue68 >> 8u) & 255u);
                                intermediateValue170 = bitwiseValue31 * float((scalarValue68 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue220;
                            float intermediateValue222;
                            float intermediateValue224;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue215;
                            float intermediateValue217;
                            float intermediateValue219;
#endif
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue50;
                            bool comparisonValue51;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue96 = sumValue76 + productValue105;
                                sumValue97 = sumValue77 + productValue106;
                                sumValue98 = sumValue78 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue96 = sumValue76 + productValue241;
                                sumValue97 = sumValue77 + productValue242;
                                sumValue98 = sumValue78 + productValue243;
#endif
                                uint comparisonValue52 = ((((uint(sumValue76 >= 16.0f) << 1u) | uint(sumValue76 < 0.0f)) | (uint(sumValue77 < 0.0f) << 2u)) | (uint(sumValue77 >= 16.0f) << 3u)) | (uint(sumValue78 < 0.0f) << 4u);
                                comparisonValue50 = intermediateValue[comparisonValue52 | (uint(sumValue78 >= 16.0f) << 5u)];
                                comparisonValue51 = ((((comparisonValue52 | (uint(sumValue78 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue52 & 31u))) == 0u;
                                uint loadedBufferValue28;
                                if (comparisonValue51)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue50 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue220 = 0.0f;
                                        intermediateValue222 = 0.0f;
                                        intermediateValue224 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue215 = 0.0f;
                                        intermediateValue217 = 0.0f;
                                        intermediateValue219 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue28 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue50).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue28 = ((((uint(sumValue76) << 8u) & 3840u) | (uint(sumValue77) & 15u)) | ((uint(sumValue78) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue33 = rdLoad_voxelBuffer(loadedBufferValue28);
                                uint scalarValue69 = loadedBufferValue33.x;
                                if (scalarValue69 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue220 = 0.0f;
                                    intermediateValue222 = 0.0f;
                                    intermediateValue224 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue215 = 0.0f;
                                    intermediateValue217 = 0.0f;
                                    intermediateValue219 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue32 = float(scalarValue69 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue220 = bitwiseValue32 * float(scalarValue69 & 255u);
                                intermediateValue222 = bitwiseValue32 * float((scalarValue69 >> 8u) & 255u);
                                intermediateValue224 = bitwiseValue32 * float((scalarValue69 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue215 = bitwiseValue32 * float(scalarValue69 & 255u);
                                intermediateValue217 = bitwiseValue32 * float((scalarValue69 >> 8u) & 255u);
                                intermediateValue219 = bitwiseValue32 * float((scalarValue69 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float intermediateValue226;
                            float intermediateValue228;
                            float intermediateValue230;
#elif RD_FEATURE_SEASONS == RD_ON
                            float intermediateValue221;
                            float intermediateValue223;
                            float intermediateValue225;
#endif
                            float sumValue105;
                            float sumValue106;
                            float sumValue107;
                            uint comparisonValue60;
                            bool comparisonValue61;
                            for (;;)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                sumValue105 = sumValue79 + productValue105;
                                sumValue106 = sumValue80 + productValue106;
                                sumValue107 = sumValue81 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                                sumValue105 = sumValue79 + productValue241;
                                sumValue106 = sumValue80 + productValue242;
                                sumValue107 = sumValue81 + productValue243;
#endif
                                uint comparisonValue53 = ((((uint(sumValue79 >= 16.0f) << 1u) | uint(sumValue79 < 0.0f)) | (uint(sumValue80 < 0.0f) << 2u)) | (uint(sumValue80 >= 16.0f) << 3u)) | (uint(sumValue81 < 0.0f) << 4u);
                                comparisonValue60 = intermediateValue[comparisonValue53 | (uint(sumValue81 >= 16.0f) << 5u)];
                                comparisonValue61 = ((((comparisonValue53 | (uint(sumValue81 >= 16.0f) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                uint loadedBufferValue32;
                                if (comparisonValue61)
                                {
                                    if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (comparisonValue60 & 31u))) == 0u)
                                    {
#if RD_FEATURE_SEASONS == RD_OFF
                                        intermediateValue226 = 0.0f;
                                        intermediateValue228 = 0.0f;
                                        intermediateValue230 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                        intermediateValue221 = 0.0f;
                                        intermediateValue223 = 0.0f;
                                        intermediateValue225 = 0.0f;
#endif
                                        break;
                                    }
                                    loadedBufferValue32 = ((((uint(sumValue105 - (floor(sumValue105 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue106 - (floor(sumValue106 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue107 - (floor(sumValue107 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + comparisonValue60).x >> 2u);
                                }
                                else
                                {
                                    loadedBufferValue32 = ((((uint(sumValue79) << 8u) & 3840u) | (uint(sumValue80) & 15u)) | ((uint(sumValue81) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uint4 loadedBufferValue35 = rdLoad_voxelBuffer(loadedBufferValue32);
                                uint scalarValue70 = loadedBufferValue35.x;
                                if (scalarValue70 == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue226 = 0.0f;
                                    intermediateValue228 = 0.0f;
                                    intermediateValue230 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue221 = 0.0f;
                                    intermediateValue223 = 0.0f;
                                    intermediateValue225 = 0.0f;
#endif
                                    break;
                                }
                                float bitwiseValue33 = float(scalarValue70 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue226 = bitwiseValue33 * float(scalarValue70 & 255u);
                                intermediateValue228 = bitwiseValue33 * float((scalarValue70 >> 8u) & 255u);
                                intermediateValue230 = bitwiseValue33 * float((scalarValue70 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue221 = bitwiseValue33 * float(scalarValue70 & 255u);
                                intermediateValue223 = bitwiseValue33 * float((scalarValue70 >> 8u) & 255u);
                                intermediateValue225 = bitwiseValue33 * float((scalarValue70 >> 16u) & 255u);
#endif
                                break;
                            }
#if RD_FEATURE_SEASONS == RD_OFF
                            float sumValue70 = sumValue62 + productValue105;
                            float sumValue75 = sumValue63 + productValue106;
                            float sumValue85 = sumValue64 + productValue107;
#elif RD_FEATURE_SEASONS == RD_ON
                            float sumValue142 = sumValue62 + productValue241;
                            float sumValue143 = sumValue63 + productValue242;
                            float sumValue144 = sumValue64 + productValue243;
#endif
                            uint comparisonValue54 = ((((uint(sumValue62 >= 16.0f) << 1u) | uint(sumValue62 < 0.0f)) | (uint(sumValue63 < 0.0f) << 2u)) | (uint(sumValue63 >= 16.0f) << 3u)) | (uint(sumValue64 < 0.0f) << 4u);
                            uint comparisonValue56 = comparisonValue54 | (uint(sumValue64 >= 16.0f) << 5u);
                            uint loadedBufferValue36;
                            if ((((comparisonValue56 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue54 & 31u))) == 0u)
                            {
                                if ((rdLoad_voxelBuffer(bitwiseValue9 + 4096u).x & (1u << (intermediateValue[comparisonValue56] & 31u))) == 0u)
                                {
#if RD_FEATURE_SEASONS == RD_OFF
                                    intermediateValue216 = intermediateValue173;
                                    intermediateValue217 = intermediateValue174;
                                    intermediateValue218 = intermediateValue175;
                                    intermediateValue219 = intermediateValue220;
                                    intermediateValue221 = intermediateValue222;
                                    intermediateValue223 = intermediateValue224;
                                    intermediateValue225 = intermediateValue226;
                                    intermediateValue227 = intermediateValue228;
                                    intermediateValue229 = intermediateValue230;
                                    intermediateValue231 = 0.0f;
                                    intermediateValue232 = 0.0f;
                                    intermediateValue233 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                    intermediateValue211 = intermediateValue168;
                                    intermediateValue212 = intermediateValue169;
                                    intermediateValue213 = intermediateValue170;
                                    intermediateValue214 = intermediateValue215;
                                    intermediateValue216 = intermediateValue217;
                                    intermediateValue218 = intermediateValue219;
                                    intermediateValue220 = intermediateValue221;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = intermediateValue225;
                                    intermediateValue226 = 0.0f;
                                    intermediateValue227 = 0.0f;
                                    intermediateValue228 = 0.0f;
#endif
                                    break;
                                }
#if RD_FEATURE_SEASONS == RD_OFF
                                loadedBufferValue36 = ((((uint(sumValue70 - (floor(sumValue70 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue75 - (floor(sumValue75 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue85 - (floor(sumValue85 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue56]).x >> 2u);
#elif RD_FEATURE_SEASONS == RD_ON
                                loadedBufferValue36 = ((((uint(sumValue142 - (floor(sumValue142 * 0.0625f) * 16.0f)) << 8u) & 3840u) | (uint(sumValue143 - (floor(sumValue143 * 0.0625f) * 16.0f)) & 15u)) | ((uint(sumValue144 - (floor(sumValue144 * 0.0625f) * 16.0f)) << 4u) & 240u)) + (rdLoad_voxelBuffer((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue56]).x >> 2u);
#endif
                            }
                            else
                            {
                                loadedBufferValue36 = ((((uint(sumValue62) << 8u) & 3840u) | (uint(sumValue63) & 15u)) | ((uint(sumValue64) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uint4 loadedBufferValue37 = rdLoad_voxelBuffer(loadedBufferValue36);
                            uint scalarValue71 = loadedBufferValue37.x;
                            if (scalarValue71 == 0u)
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                intermediateValue216 = intermediateValue173;
                                intermediateValue217 = intermediateValue174;
                                intermediateValue218 = intermediateValue175;
                                intermediateValue219 = intermediateValue220;
                                intermediateValue221 = intermediateValue222;
                                intermediateValue223 = intermediateValue224;
                                intermediateValue225 = intermediateValue226;
                                intermediateValue227 = intermediateValue228;
                                intermediateValue229 = intermediateValue230;
                                intermediateValue231 = 0.0f;
                                intermediateValue232 = 0.0f;
                                intermediateValue233 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
                                intermediateValue211 = intermediateValue168;
                                intermediateValue212 = intermediateValue169;
                                intermediateValue213 = intermediateValue170;
                                intermediateValue214 = intermediateValue215;
                                intermediateValue216 = intermediateValue217;
                                intermediateValue218 = intermediateValue219;
                                intermediateValue220 = intermediateValue221;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = intermediateValue225;
                                intermediateValue226 = 0.0f;
                                intermediateValue227 = 0.0f;
                                intermediateValue228 = 0.0f;
#endif
                                break;
                            }
                            float bitwiseValue34 = float(scalarValue71 >> 24u) * 9.2272217443678528070449829101562e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue216 = intermediateValue173;
                            intermediateValue217 = intermediateValue174;
                            intermediateValue218 = intermediateValue175;
                            intermediateValue219 = intermediateValue220;
                            intermediateValue221 = intermediateValue222;
                            intermediateValue223 = intermediateValue224;
                            intermediateValue225 = intermediateValue226;
                            intermediateValue227 = intermediateValue228;
                            intermediateValue229 = intermediateValue230;
                            intermediateValue231 = bitwiseValue34 * float(scalarValue71 & 255u);
                            intermediateValue232 = bitwiseValue34 * float((scalarValue71 >> 8u) & 255u);
                            intermediateValue233 = bitwiseValue34 * float((scalarValue71 >> 16u) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue211 = intermediateValue168;
                            intermediateValue212 = intermediateValue169;
                            intermediateValue213 = intermediateValue170;
                            intermediateValue214 = intermediateValue215;
                            intermediateValue216 = intermediateValue217;
                            intermediateValue218 = intermediateValue219;
                            intermediateValue220 = intermediateValue221;
                            intermediateValue222 = intermediateValue223;
                            intermediateValue224 = intermediateValue225;
                            intermediateValue226 = bitwiseValue34 * float(scalarValue71 & 255u);
                            intermediateValue227 = bitwiseValue34 * float((scalarValue71 >> 8u) & 255u);
                            intermediateValue228 = bitwiseValue34 * float((scalarValue71 >> 16u) & 255u);
#endif
                            break;
                        }
                    }
#if RD_FEATURE_SEASONS == RD_OFF
                    branchMergedValue50 = (((intermediateValue223 * sumValue60) + (intermediateValue218 * sumValue59)) + (intermediateValue229 * sumValue61)) + (intermediateValue233 * intermediateValue127);
                    branchMergedValue56 = (((intermediateValue221 * sumValue60) + (intermediateValue217 * sumValue59)) + (intermediateValue227 * sumValue61)) + (intermediateValue232 * intermediateValue127);
                    branchMergedValue57 = (((intermediateValue219 * sumValue60) + (intermediateValue216 * sumValue59)) + (intermediateValue225 * sumValue61)) + (intermediateValue231 * intermediateValue127);
#elif RD_FEATURE_SEASONS == RD_ON
                    branchMergedValue50 = (((intermediateValue214 * sumValue60) + (intermediateValue211 * sumValue59)) + (intermediateValue220 * sumValue61)) + (intermediateValue226 * intermediateValue122);
                    branchMergedValue56 = (((intermediateValue218 * sumValue60) + (intermediateValue213 * sumValue59)) + (intermediateValue224 * sumValue61)) + (intermediateValue228 * intermediateValue122);
                    branchMergedValue57 = (((intermediateValue216 * sumValue60) + (intermediateValue212 * sumValue59)) + (intermediateValue222 * sumValue61)) + (intermediateValue227 * intermediateValue122);
#endif
                }
                branchMergedValue10 = branchMergedValue50;
                branchMergedValue19 = branchMergedValue56;
                branchMergedValue20 = branchMergedValue57;
            }
            else
            {
                branchMergedValue10 = 0.0f;
                branchMergedValue19 = 0.0f;
                branchMergedValue20 = 0.0f;
            }
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue47 = branchMergedValue20;
            intermediateValue48 = branchMergedValue19;
            intermediateValue49 = branchMergedValue10;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue42 = branchMergedValue10;
            intermediateValue43 = branchMergedValue20;
            intermediateValue44 = branchMergedValue19;
#endif
        }
        else
        {
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue47 = clampedValue;
            intermediateValue48 = clampedValue1;
            intermediateValue49 = clampedValue2;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue42 = clampedValue;
            intermediateValue43 = clampedValue1;
            intermediateValue44 = clampedValue2;
#endif
        }
        float productValue114 = RD_UNIFORM_TILE_LIGHT_INTENSITY.y * RD_UNIFORM_TILE_LIGHT_INTENSITY.y;
        float productValue115 = productValue114 * productValue114;
        float productValue116 = (((RD_UNIFORM_CAMERA_LIGHT_INTENSITY.y * (productValue114 - productValue115)) + productValue115) * RD_UNIFORM_TILE_LIGHT_INTENSITY.y) * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w;
#if RD_FEATURE_SEASONS == RD_OFF
        float productValue117 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue12;
#elif RD_FEATURE_SEASONS == RD_ON
        float productValue250 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w * sumValue120;
#endif
        float dotProductValue11 = dot(float3(exponentialValue, exponentialValue1, exponentialValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
#if RD_FEATURE_SEASONS == RD_OFF
        float productValue118 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * intermediateValue15) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue34 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue118;
        productValue35 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue118;
        productValue36 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue118;
        productValue37 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue47), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue117;
        productValue38 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue48), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue117;
        productValue39 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue49), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue117;
        intermediateValue27 = intermediateValue28;
        intermediateValue29 = intermediateValue30;
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = intermediateValue34;
        intermediateValue35 = intermediateValue36;
        intermediateValue37 = intermediateValue38;
#elif RD_FEATURE_SEASONS == RD_ON
        float productValue251 = (RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.z * intermediateValue10) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.x;
        productValue31 = (((dotProductValue11 - exponentialValue) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue) * productValue251;
        productValue32 = (((dotProductValue11 - exponentialValue1) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue1) * productValue251;
        productValue33 = (((dotProductValue11 - exponentialValue2) * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.y) + exponentialValue2) * productValue251;
        productValue34 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue42), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue) * productValue250;
        productValue35 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue43), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue1) * productValue250;
        productValue36 = (max((productValue116 * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z) + (RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * intermediateValue44), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * exponentialValue2) * productValue250;
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = intermediateValue27;
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = intermediateValue31;
        intermediateValue32 = intermediateValue33;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_ON
        productValue31 = 0.0f;
        productValue32 = 0.0f;
        productValue33 = 0.0f;
#endif
        productValue34 = 0.0f;
        productValue35 = 0.0f;
        productValue36 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
        productValue37 = 0.0f;
        productValue38 = 0.0f;
        productValue39 = 0.0f;
        intermediateValue27 = 0.0f;
        intermediateValue29 = 0.0f;
        intermediateValue31 = 0.0f;
        intermediateValue33 = 0.0f;
        intermediateValue35 = 0.0f;
        intermediateValue37 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue22 = 0.0f;
        intermediateValue24 = 0.0f;
        intermediateValue26 = 0.0f;
        intermediateValue28 = 0.0f;
        intermediateValue30 = 0.0f;
        intermediateValue32 = 0.0f;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    float sumValue86 = ((productValue37 + productValue34) + intermediateValue27) + intermediateValue33;
    float sumValue87 = ((productValue38 + productValue35) + intermediateValue29) + intermediateValue35;
    float sumValue88 = ((productValue39 + productValue36) + intermediateValue31) + intermediateValue37;
#elif RD_FEATURE_SEASONS == RD_ON
    float sumValue145 = ((productValue34 + productValue31) + intermediateValue22) + intermediateValue28;
    float sumValue146 = ((productValue35 + productValue32) + intermediateValue24) + intermediateValue30;
    float sumValue147 = ((productValue36 + productValue33) + intermediateValue26) + intermediateValue32;
#endif
    float sumValue89 = varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x;
    float sumValue90 = varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y;
    float sumValue92 = varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z;
    float inverseLengthValue15 = rsqrt(dot(float3(sumValue89, sumValue90, sumValue92), float3(sumValue89, sumValue90, sumValue92)));
    float productValue119 = inverseLengthValue15 * sumValue89;
    float productValue120 = inverseLengthValue15 * sumValue90;
    float productValue121 = inverseLengthValue15 * sumValue92;
    bool comparisonValue59 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.y != 0.0f;
    bool comparisonValue62 = RD_UNIFORM_DIFFUSE_SPECULAR_EMISSIVE_AMBIENT_TERM_TOGGLES.w != 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
    float productValue45;
    float productValue46;
    float productValue47;
#elif RD_FEATURE_SEASONS == RD_ON
    float productValue42;
    float productValue43;
    float productValue44;
#endif
    if ((comparisonValue59 && (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z != 0.0f)) && comparisonValue62)
    {
#if RD_FEATURE_SEASONS == RD_OFF
        productValue45 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue46 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue47 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue42 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.x * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue43 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.y * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
        productValue44 = max(RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w + (RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.z * RD_UNIFORM_SKY_AMBIENT_LIGHT_COLOR_INTENSITY.w), RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w) * RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.z;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        productValue45 = 0.0f;
        productValue46 = 0.0f;
        productValue47 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue42 = 0.0f;
        productValue43 = 0.0f;
        productValue44 = 0.0f;
#endif
    }
    bool comparisonValue63 = RD_UNIFORM_VOLUME_SCATTERING_ENABLED_AND_POINT_LIGHT_VOLUMETRICS_ENABLED.x != 0.0f;
    bool comparisonValue64 = RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.x != 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue57;
#elif RD_FEATURE_SEASONS == RD_ON
    float intermediateValue49;
    float intermediateValue50;
    float intermediateValue51;
    float intermediateValue52;
#endif
    if (comparisonValue64)
    {
        float clampedValue18 = clamp(((RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z)) * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y, 0.0f, 1.0f);
        float branchMergedValue11;
        float branchMergedValue21;
        float branchMergedValue22;
        float branchMergedValue23;
        if (clampedValue18 > 0.0f)
        {
            float branchMergedValue51;
            float branchMergedValue58;
            float branchMergedValue59;
            float branchMergedValue60;
            if (comparisonValue59)
            {
#if RD_FEATURE_SEASONS == RD_OFF
                branchMergedValue51 = max(productValue47, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue58 = max(productValue46, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue59 = RD_UNIFORM_FOG_COLOR.x * max(productValue45, 1.0f);
#elif RD_FEATURE_SEASONS == RD_ON
                branchMergedValue51 = max(productValue44, 1.0f) * RD_UNIFORM_FOG_COLOR.z;
                branchMergedValue58 = max(productValue43, 1.0f) * RD_UNIFORM_FOG_COLOR.y;
                branchMergedValue59 = RD_UNIFORM_FOG_COLOR.x * max(productValue42, 1.0f);
#endif
                branchMergedValue60 = clampedValue18;
            }
            else
            {
                float clampedValue19 = clamp(((productValue120 - RD_UNIFORM_FOG_SKY_BLEND.x) + RD_UNIFORM_FOG_SKY_BLEND.w) / (RD_UNIFORM_FOG_SKY_BLEND.z - RD_UNIFORM_FOG_SKY_BLEND.x), 0.0f, 1.0f);
                float productValue122 = 1.0f - ((clampedValue19 * clampedValue19) * (3.0f - (clampedValue19 * 2.0f)));
                float productValue123 = (productValue122 * productValue122) * productValue122;
                float dotProductValue12 = dot(float3(productValue119, productValue120, productValue121), float3(RD_UNIFORM_SUN_DIR.xyz));
                float dotProductValue13 = dot(float3(productValue119, productValue120, productValue121), float3(RD_UNIFORM_MOON_DIR.xyz));
                float sumValue99 = RD_UNIFORM_FOG_SKY_BLEND.x - RD_UNIFORM_FOG_SKY_BLEND.w;
                float clampedValue20 = clamp((productValue120 - sumValue99) / (RD_UNIFORM_FOG_SKY_BLEND.y - sumValue99), 0.0f, 1.0f);
                float productValue124 = 1.0f - ((clampedValue20 * clampedValue20) * (3.0f - (clampedValue20 * 2.0f)));
                float productValue125 = (productValue124 * productValue124) * productValue124;
                float productValue126 = (RD_UNIFORM_ATMOSPHERIC_SCATTERING.x * 0.75f) * ((((dotProductValue13 * dotProductValue13) + 1.0f) * RD_UNIFORM_MOON_COLOR.w) + (((dotProductValue12 * dotProductValue12) + 1.0f) * RD_UNIFORM_SUN_COLOR.w));
                float clampedValue21 = clamp(exp2(log2(max(dotProductValue12, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float clampedValue22 = clamp(exp2(log2(max(dotProductValue13, 0.0f)) * RD_UNIFORM_ATMOSPHERIC_SCATTERING.w), 0.0f, 1.0f);
                float productValue127 = 1.809999942779541015625f - (clampedValue21 * 1.7999999523162841796875f);
                float nonlinearValue3 = 0.036100022494792938232421875f / (sqrt(productValue127) * productValue127);
                float productValue128 = 1.809999942779541015625f - (clampedValue22 * 1.7999999523162841796875f);
                float nonlinearValue4 = 0.036100022494792938232421875f / (sqrt(productValue128) * productValue128);
                float productValue129 = clampedValue21 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.y * RD_UNIFORM_SUN_COLOR.w);
                float productValue130 = clampedValue22 * (RD_UNIFORM_ATMOSPHERIC_SCATTERING.z * RD_UNIFORM_MOON_COLOR.w);
                float productValue150 = (((productValue123 * RD_UNIFORM_SKY_HORIZON_COLOR.x) * (((productValue130 * RD_UNIFORM_MOON_COLOR.x) * nonlinearValue4) + ((productValue129 * RD_UNIFORM_SUN_COLOR.x) * nonlinearValue3))) + (((productValue125 * (RD_UNIFORM_SKY_HORIZON_COLOR.x - RD_UNIFORM_SKY_ZENITH_COLOR.x)) + RD_UNIFORM_SKY_ZENITH_COLOR.x) * productValue126)) * 0.079577468335628509521484375f;
                float productValue151 = (((productValue123 * RD_UNIFORM_SKY_HORIZON_COLOR.y) * (((productValue130 * RD_UNIFORM_MOON_COLOR.y) * nonlinearValue4) + ((productValue129 * RD_UNIFORM_SUN_COLOR.y) * nonlinearValue3))) + (((productValue125 * (RD_UNIFORM_SKY_HORIZON_COLOR.y - RD_UNIFORM_SKY_ZENITH_COLOR.y)) + RD_UNIFORM_SKY_ZENITH_COLOR.y) * productValue126)) * 0.079577468335628509521484375f;
                float productValue152 = (((productValue123 * RD_UNIFORM_SKY_HORIZON_COLOR.z) * (((productValue130 * RD_UNIFORM_MOON_COLOR.z) * nonlinearValue4) + ((productValue129 * RD_UNIFORM_SUN_COLOR.z) * nonlinearValue3))) + (((productValue125 * (RD_UNIFORM_SKY_HORIZON_COLOR.z - RD_UNIFORM_SKY_ZENITH_COLOR.z)) + RD_UNIFORM_SKY_ZENITH_COLOR.z) * productValue126)) * 0.079577468335628509521484375f;
                float branchMergedValue62;
                float branchMergedValue65;
                float branchMergedValue66;
                float branchMergedValue67;
                if (RD_UNIFORM_ATMOSPHERIC_SCATTERING_TOGGLES.w != 0.0f)
                {
                    float scalarValue72 = max(RD_UNIFORM_CAMERA_AMBIENT_CONTRIBUTION.y, RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
                    branchMergedValue62 = ((productValue152 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.z) * scalarValue72) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.z;
                    branchMergedValue65 = ((productValue151 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.y) * scalarValue72) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.y;
                    branchMergedValue66 = ((productValue150 - RD_UNIFORM_UNDERGROUND_FOG_COLOR.x) * scalarValue72) + RD_UNIFORM_UNDERGROUND_FOG_COLOR.x;
                    branchMergedValue67 = clampedValue18;
                }
                else
                {
                    branchMergedValue62 = productValue152;
                    branchMergedValue65 = productValue151;
                    branchMergedValue66 = productValue150;
                    branchMergedValue67 = clampedValue18;
                }
                branchMergedValue51 = branchMergedValue62;
                branchMergedValue58 = branchMergedValue65;
                branchMergedValue59 = branchMergedValue66;
                branchMergedValue60 = branchMergedValue67;
            }
            branchMergedValue11 = branchMergedValue51;
            branchMergedValue21 = branchMergedValue58;
            branchMergedValue22 = branchMergedValue59;
            branchMergedValue23 = branchMergedValue60;
        }
        else
        {
            branchMergedValue11 = 0.0f;
            branchMergedValue21 = 0.0f;
            branchMergedValue22 = 0.0f;
            branchMergedValue23 = clampedValue18;
        }
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue54 = branchMergedValue23;
        intermediateValue55 = branchMergedValue22;
        intermediateValue56 = branchMergedValue21;
        intermediateValue57 = branchMergedValue11;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue49 = branchMergedValue23;
        intermediateValue50 = branchMergedValue22;
        intermediateValue51 = branchMergedValue21;
        intermediateValue52 = branchMergedValue11;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue54 = 0.0f;
        intermediateValue55 = 0.0f;
        intermediateValue56 = 0.0f;
        intermediateValue57 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue49 = 0.0f;
        intermediateValue50 = 0.0f;
        intermediateValue51 = 0.0f;
        intermediateValue52 = 0.0f;
#endif
    }
#if RD_FEATURE_SEASONS == RD_ON
    float productValue97;
    float productValue98;
    float productValue99;
#endif
    float productValue100;
#if RD_FEATURE_SEASONS == RD_OFF
    float productValue101;
    float productValue102;
    float productValue103;
#endif
    if (comparisonValue63)
    {
        float productValue153 = (multiplyAddValue12 + 1.0f) * 0.5f;
        float productValue154 = (multiplyAddValue13 + 1.0f) * 0.5f;
        uint scalarValue73 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float multiplyAddValue34 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue14, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue73))) + (-0.5f);
        uint sumValue100 = uint(min(int(uint(max(int(uint(int(multiplyAddValue34))), int(0u)))), int(scalarValue73 + 4294967294u)));
        float scalarValue74 = float(int(sumValue100));
        float sumValue108 = min(max(multiplyAddValue34 - scalarValue74, 0.0f), 1.0f);
        float4 sampledTextureValue6 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue153, productValue154, scalarValue74), 0.0f);
        float scalarValue75 = sampledTextureValue6.x;
        float scalarValue76 = sampledTextureValue6.y;
        float scalarValue77 = sampledTextureValue6.z;
        float scalarValue78 = sampledTextureValue6.w;
        float4 sampledTextureValue7 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue153, productValue154, float(int(sumValue100 + 1u))), 0.0f);
#if RD_FEATURE_SEASONS == RD_OFF
        productValue100 = ((sampledTextureValue7.x - scalarValue75) * sumValue108) + scalarValue75;
        productValue101 = ((sampledTextureValue7.y - scalarValue76) * sumValue108) + scalarValue76;
        productValue102 = ((sampledTextureValue7.z - scalarValue77) * sumValue108) + scalarValue77;
        productValue103 = ((sampledTextureValue7.w - scalarValue78) * sumValue108) + scalarValue78;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue97 = ((sampledTextureValue7.x - scalarValue75) * sumValue108) + scalarValue75;
        productValue98 = ((sampledTextureValue7.y - scalarValue76) * sumValue108) + scalarValue76;
        productValue99 = ((sampledTextureValue7.z - scalarValue77) * sumValue108) + scalarValue77;
        productValue100 = ((sampledTextureValue7.w - scalarValue78) * sumValue108) + scalarValue78;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        productValue100 = 0.0f;
        productValue101 = 0.0f;
        productValue102 = 0.0f;
        productValue103 = 1.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue97 = 0.0f;
        productValue98 = 0.0f;
        productValue99 = 0.0f;
        productValue100 = 1.0f;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    float intermediateValue90;
    float intermediateValue91;
    float intermediateValue92;
#elif RD_FEATURE_SEASONS == RD_ON
    float intermediateValue85;
    float intermediateValue86;
    float intermediateValue87;
#endif
    if (RD_UNIFORM_IBL_PARAMETERS.x != 0.0f)
    {
        bool conditionValue6 = RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue110;
        float intermediateValue111;
        float intermediateValue112;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue105;
        float intermediateValue106;
        float intermediateValue107;
#endif
        float multiplyAddValue35;
        float multiplyAddValue36;
        float multiplyAddValue37;
        if (RD_UNIFORM_QUANTIZATION_PARAMETERS.w > 0.0f)
        {
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue110 = productValue49;
            intermediateValue111 = productValue50;
            intermediateValue112 = productValue51;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue105 = productValue49;
            intermediateValue106 = productValue50;
            intermediateValue107 = productValue51;
#endif
            multiplyAddValue35 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.x, productValue51, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.x, productValue50, productValue49 * RD_UNIFORM_VIEW_MATRIX_ROW_0.x)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.x;
            multiplyAddValue36 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.y, productValue51, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.y, productValue50, productValue49 * RD_UNIFORM_VIEW_MATRIX_ROW_0.y)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.y;
            multiplyAddValue37 = mad(RD_UNIFORM_VIEW_MATRIX_ROW_2.z, productValue51, mad(RD_UNIFORM_VIEW_MATRIX_ROW_1.z, productValue50, productValue49 * RD_UNIFORM_VIEW_MATRIX_ROW_0.z)) + RD_UNIFORM_VIEW_MATRIX_ROW_3.z;
        }
        else
        {
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue110 = varyingTexCoord3.x;
            intermediateValue111 = varyingTexCoord3.y;
            intermediateValue112 = varyingTexCoord3.z;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue105 = varyingTexCoord3.x;
            intermediateValue106 = varyingTexCoord3.y;
            intermediateValue107 = varyingTexCoord3.z;
#endif
            multiplyAddValue35 = multiplyAddValue7;
            multiplyAddValue36 = multiplyAddValue8;
            multiplyAddValue37 = multiplyAddValue9;
        }
#if RD_FEATURE_SEASONS == RD_OFF
        float sumValue109 = intermediateValue110 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue110 = intermediateValue111 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue111 = intermediateValue112 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue16 = rsqrt(dot(float3(sumValue109, sumValue110, sumValue111), float3(sumValue109, sumValue110, sumValue111)));
        float productValue155 = inverseLengthValue16 * sumValue109;
        float productValue156 = inverseLengthValue16 * sumValue110;
        float productValue157 = inverseLengthValue16 * sumValue111;
#elif RD_FEATURE_SEASONS == RD_ON
        float sumValue148 = intermediateValue105 - RD_UNIFORM_INV_VIEW_ROW_3.x;
        float sumValue149 = intermediateValue106 - RD_UNIFORM_INV_VIEW_ROW_3.y;
        float sumValue150 = intermediateValue107 - RD_UNIFORM_INV_VIEW_ROW_3.z;
        float inverseLengthValue23 = rsqrt(dot(float3(sumValue148, sumValue149, sumValue150), float3(sumValue148, sumValue149, sumValue150)));
        float productValue252 = inverseLengthValue23 * sumValue148;
        float productValue253 = inverseLengthValue23 * sumValue149;
        float productValue254 = inverseLengthValue23 * sumValue150;
#endif
        float inverseLengthValue17 = rsqrt(dot(float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), float3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
#if RD_FEATURE_SEASONS == RD_OFF
        float dotProductValue14 = dot(float3(productValue155, productValue156, productValue157), float3(productValue15, productValue16, productValue17)) * 2.0f;
        float productValue158 = productValue155 - (dotProductValue14 * productValue15);
        float productValue159 = productValue156 - (dotProductValue14 * productValue16);
        float productValue162 = productValue157 - (dotProductValue14 * productValue17);
        float sumValue112 = 1.0f - intermediateValue16;
        float productValue165 = sumValue112 * sumValue112;
        float productValue166 = productValue165 * productValue165;
        precise float comparisonValue65 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue165 : (productValue166 * productValue166));
        precise float productValue169 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue65;
#elif RD_FEATURE_SEASONS == RD_ON
        float dotProductValue23 = dot(float3(productValue252, productValue253, productValue254), float3(productValue210, productValue211, productValue212)) * 2.0f;
        float productValue255 = productValue252 - (dotProductValue23 * productValue210);
        float productValue256 = productValue253 - (dotProductValue23 * productValue211);
        float productValue257 = productValue254 - (dotProductValue23 * productValue212);
        float sumValue151 = 1.0f - intermediateValue11;
        float productValue258 = sumValue151 * sumValue151;
        float productValue259 = productValue258 * productValue258;
        precise float comparisonValue90 = 1.0f - ((uint(int(RD_UNIFORM_CONVOLUTION_TYPE.x)) == 1u) ? productValue258 : (productValue259 * productValue259));
        precise float productValue260 = (RD_UNIFORM_IBL_PARAMETERS.y + (-1.0f)) * comparisonValue90;
#endif
        uint scalarValue79 = uint(int(RD_UNIFORM_LAST_SPECULAR_IBL_IDX.x));
#if RD_FEATURE_SEASONS == RD_OFF
        float4 sampledTextureValue8 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue158, productValue159, productValue162, float(int(scalarValue79))), productValue169);
        float4 sampledTextureValue9 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue158, productValue159, productValue162, float(int(uint(int(scalarValue79 + 2u) - int(3u) * (int(scalarValue79 + 2u) / int(3u)))))), productValue169);
        float scalarValue80 = sampledTextureValue9.x;
        float scalarValue81 = sampledTextureValue9.y;
        float scalarValue82 = sampledTextureValue9.z;
        float productValue174 = ((sampledTextureValue8.x - scalarValue80) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue80;
        float productValue177 = ((sampledTextureValue8.y - scalarValue81) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue81;
        float productValue178 = ((sampledTextureValue8.z - scalarValue82) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue82;
#elif RD_FEATURE_SEASONS == RD_ON
        float4 sampledTextureValue15 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue255, productValue256, productValue257, float(int(scalarValue79))), productValue260);
        float4 sampledTextureValue16 = specularIblRecordsTexture.SampleLevel(specularIblRecordsSampler, float4(productValue255, productValue256, productValue257, float(int(uint(int(scalarValue79 + 2u) - int(3u) * (int(scalarValue79 + 2u) / int(3u)))))), productValue260);
        float scalarValue112 = sampledTextureValue16.x;
        float scalarValue113 = sampledTextureValue16.y;
        float scalarValue114 = sampledTextureValue16.z;
        float productValue261 = ((sampledTextureValue15.x - scalarValue112) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue112;
        float productValue262 = ((sampledTextureValue15.y - scalarValue113) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue113;
        float productValue263 = ((sampledTextureValue15.z - scalarValue114) * RD_UNIFORM_IBL_PARAMETERS.w) + scalarValue114;
#endif
        float productValue179 = (((clampedValue9 * clampedValue9) * clampedValue9) * RD_UNIFORM_IBL_PARAMETERS.x) * RD_UNIFORM_IBL_PARAMETERS.z;
#if RD_FEATURE_SEASONS == RD_OFF
        float comparisonValue66 = (conditionValue6 ? (productValue174 * 301.72412109375f) : productValue174) * productValue179;
        float comparisonValue67 = (conditionValue6 ? (productValue177 * 301.72412109375f) : productValue177) * productValue179;
        float comparisonValue68 = (conditionValue6 ? (productValue178 * 301.72412109375f) : productValue178) * productValue179;
#elif RD_FEATURE_SEASONS == RD_ON
        float comparisonValue91 = (conditionValue6 ? (productValue261 * 301.72412109375f) : productValue261) * productValue179;
        float comparisonValue92 = (conditionValue6 ? (productValue262 * 301.72412109375f) : productValue262) * productValue179;
        float comparisonValue93 = (conditionValue6 ? (productValue263 * 301.72412109375f) : productValue263) * productValue179;
#endif
        float comparisonValue31;
        float comparisonValue32;
        float comparisonValue33;
        if (comparisonValue62)
        {
            float productValue180 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.x * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue181 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.y * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue182 = RD_UNIFORM_AMBIENT_LIGHT_PARAMS.z * RD_UNIFORM_AMBIENT_LIGHT_PARAMS.w;
            float productValue183 = RD_UNIFORM_BLOCK_BASE_AMBIENT_LIGHT_COLOR_INTENSITY.w * RD_UNIFORM_BLOCK_LIGHT_INDIRECT_SPECULAR_INTENSITY.x;
            float productValue184 = productValue183 * clampedValue;
            float productValue185 = productValue183 * clampedValue1;
            float productValue186 = productValue183 * clampedValue2;
            float clampedValue23 = clamp(dot(float3(productValue184, productValue185, productValue186), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), 0.0f, 1.0f);
#if RD_FEATURE_SEASONS == RD_OFF
            float productValue187 = ((clampedValue23 * (productValue184 - productValue180)) + productValue180) * intermediateValue17;
            float productValue188 = ((clampedValue23 * (productValue185 - productValue181)) + productValue181) * intermediateValue17;
            float productValue189 = ((clampedValue23 * (productValue186 - productValue182)) + productValue182) * intermediateValue17;
            float intermediateValue144;
            float intermediateValue145;
            float intermediateValue146;
            bool intermediateValue147;
            if (!(dot(float3(comparisonValue66, comparisonValue67, comparisonValue68), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue187, productValue188, productValue189), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#elif RD_FEATURE_SEASONS == RD_ON
            float productValue264 = ((clampedValue23 * (productValue184 - productValue180)) + productValue180) * intermediateValue12;
            float productValue265 = ((clampedValue23 * (productValue185 - productValue181)) + productValue181) * intermediateValue12;
            float productValue266 = ((clampedValue23 * (productValue186 - productValue182)) + productValue182) * intermediateValue12;
            float intermediateValue139;
            float intermediateValue140;
            float intermediateValue141;
            bool intermediateValue142;
            if (!(dot(float3(comparisonValue91, comparisonValue92, comparisonValue93), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) >= dot(float3(productValue264, productValue265, productValue266), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f))))
#endif
            {
#if RD_FEATURE_SEASONS == RD_OFF
                intermediateValue144 = productValue187;
                intermediateValue145 = productValue188;
                intermediateValue146 = productValue189;
                intermediateValue147 = true;
#elif RD_FEATURE_SEASONS == RD_ON
                intermediateValue139 = productValue264;
                intermediateValue140 = productValue265;
                intermediateValue141 = productValue266;
                intermediateValue142 = true;
#endif
            }
            else
            {
#if RD_FEATURE_SEASONS == RD_OFF
                intermediateValue144 = 0.0f;
                intermediateValue145 = 0.0f;
                intermediateValue146 = 0.0f;
                intermediateValue147 = false;
#elif RD_FEATURE_SEASONS == RD_ON
                intermediateValue139 = 0.0f;
                intermediateValue140 = 0.0f;
                intermediateValue141 = 0.0f;
                intermediateValue142 = false;
#endif
            }
#if RD_FEATURE_SEASONS == RD_OFF
            comparisonValue31 = intermediateValue147 ? intermediateValue144 : comparisonValue66;
            comparisonValue32 = intermediateValue147 ? intermediateValue145 : comparisonValue67;
            comparisonValue33 = intermediateValue147 ? intermediateValue146 : comparisonValue68;
#elif RD_FEATURE_SEASONS == RD_ON
            comparisonValue31 = intermediateValue142 ? intermediateValue139 : comparisonValue91;
            comparisonValue32 = intermediateValue142 ? intermediateValue140 : comparisonValue92;
            comparisonValue33 = intermediateValue142 ? intermediateValue141 : comparisonValue93;
#endif
        }
        else
        {
#if RD_FEATURE_SEASONS == RD_OFF
            comparisonValue31 = comparisonValue66;
            comparisonValue32 = comparisonValue67;
            comparisonValue33 = comparisonValue68;
#elif RD_FEATURE_SEASONS == RD_ON
            comparisonValue31 = comparisonValue91;
            comparisonValue32 = comparisonValue92;
            comparisonValue33 = comparisonValue93;
#endif
        }
#if RD_FEATURE_SEASONS == RD_OFF
        float4 sampledTextureValue10 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17), float3((-0.0f) - (multiplyAddValue35 * inverseLengthValue17), (-0.0f) - (multiplyAddValue36 * inverseLengthValue17), (-0.0f) - (multiplyAddValue37 * inverseLengthValue17))), 0.0f, 1.0f), sumValue112));
        float scalarValue83 = sampledTextureValue10.x;
        float scalarValue84 = sampledTextureValue10.y;
#elif RD_FEATURE_SEASONS == RD_ON
        float4 sampledTextureValue17 = brdfLutTexture.Sample(brdfLutSampler, float2(clamp(dot(float3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), float3((-0.0f) - (multiplyAddValue35 * inverseLengthValue17), (-0.0f) - (multiplyAddValue36 * inverseLengthValue17), (-0.0f) - (multiplyAddValue37 * inverseLengthValue17))), 0.0f, 1.0f), sumValue151));
        float scalarValue115 = sampledTextureValue17.x;
        float scalarValue116 = sampledTextureValue17.y;
#endif
        float quotientValue16 = (RD_UNIFORM_RENDER_CHUNK_FOG_ALPHA.x - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x) + (nonlinearValue / RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.z);
        float clampedValue24 = 1.0f - clamp(comparisonValue64 ? (quotientValue16 * RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y) : (quotientValue16 / (RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.y - RD_UNIFORM_FOG_AND_DISTANCE_CONTROL.x)), 0.0f, 1.0f);
#if RD_FEATURE_SEASONS == RD_OFF
        float productValue190 = (((scalarValue83 * productValue54) + scalarValue84) * comparisonValue31) * clampedValue24;
        float productValue191 = (((scalarValue83 * productValue55) + scalarValue84) * comparisonValue32) * clampedValue24;
        float productValue192 = (((scalarValue83 * productValue56) + scalarValue84) * comparisonValue33) * clampedValue24;
#elif RD_FEATURE_SEASONS == RD_ON
        float productValue267 = (((scalarValue115 * productValue214) + scalarValue116) * comparisonValue31) * clampedValue24;
        float productValue268 = (((scalarValue115 * productValue215) + scalarValue116) * comparisonValue32) * clampedValue24;
        float productValue269 = (((scalarValue115 * productValue216) + scalarValue116) * comparisonValue33) * clampedValue24;
#endif
        float branchMergedValue13;
        float branchMergedValue24;
        float branchMergedValue25;
        if (comparisonValue63)
        {
            float productValue193 = (multiplyAddValue12 + 1.0f) * 0.5f;
            float productValue194 = (multiplyAddValue13 + 1.0f) * 0.5f;
            uint scalarValue85 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float multiplyAddValue41 = ((log2(((((((-0.0f) - (RD_UNIFORM_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_INV_PROJ_ROW_2.z, multiplyAddValue14, mad(RD_UNIFORM_INV_PROJ_ROW_1.z, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_INV_PROJ_ROW_2.w, multiplyAddValue14, mad(RD_UNIFORM_INV_PROJ_ROW_1.w, multiplyAddValue13, multiplyAddValue12 * RD_UNIFORM_INV_PROJ_ROW_0.w)) + RD_UNIFORM_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f) * float(int(scalarValue85))) + (-0.5f);
            uint sumValue113 = uint(min(int(uint(max(int(uint(int(multiplyAddValue41))), int(0u)))), int(scalarValue85 + 4294967294u)));
            float scalarValue86 = float(int(sumValue113));
            float4 sampledTextureValue11 = scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue193, productValue194, scalarValue86), 0.0f);
            float scalarValue87 = sampledTextureValue11.w;
            float sampledTextureValue12 = ((scatteringBufferTexture.SampleLevel(scatteringBufferSampler, float3(productValue193, productValue194, float(int(sumValue113 + 1u))), 0.0f).w - scalarValue87) * min(max(multiplyAddValue41 - scalarValue86, 0.0f), 1.0f)) + scalarValue87;
#if RD_FEATURE_SEASONS == RD_OFF
            branchMergedValue13 = sampledTextureValue12 * productValue192;
            branchMergedValue24 = sampledTextureValue12 * productValue191;
            branchMergedValue25 = sampledTextureValue12 * productValue190;
#elif RD_FEATURE_SEASONS == RD_ON
            branchMergedValue13 = sampledTextureValue12 * productValue269;
            branchMergedValue24 = sampledTextureValue12 * productValue268;
            branchMergedValue25 = sampledTextureValue12 * productValue267;
#endif
        }
        else
        {
#if RD_FEATURE_SEASONS == RD_OFF
            branchMergedValue13 = productValue192;
            branchMergedValue24 = productValue191;
            branchMergedValue25 = productValue190;
#elif RD_FEATURE_SEASONS == RD_ON
            branchMergedValue13 = productValue269;
            branchMergedValue24 = productValue268;
            branchMergedValue25 = productValue267;
#endif
        }
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue90 = branchMergedValue25;
        intermediateValue91 = branchMergedValue24;
        intermediateValue92 = branchMergedValue13;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue85 = branchMergedValue25;
        intermediateValue86 = branchMergedValue24;
        intermediateValue87 = branchMergedValue13;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue90 = 0.0f;
        intermediateValue91 = 0.0f;
        intermediateValue92 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue85 = 0.0f;
        intermediateValue86 = 0.0f;
        intermediateValue87 = 0.0f;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    float productValue195 = ((productValue103 * (((intermediateValue55 - sumValue86) * intermediateValue54) + sumValue86)) + productValue100) + intermediateValue90;
    float productValue196 = ((productValue103 * (((intermediateValue56 - sumValue87) * intermediateValue54) + sumValue87)) + productValue101) + intermediateValue91;
    float productValue197 = ((productValue103 * (((intermediateValue57 - sumValue88) * intermediateValue54) + sumValue88)) + productValue102) + intermediateValue92;
    float productValue134;
    float productValue135;
    float productValue136;
#elif RD_FEATURE_SEASONS == RD_ON
    float productValue270 = ((productValue100 * (((intermediateValue50 - sumValue145) * intermediateValue49) + sumValue145)) + productValue97) + intermediateValue85;
    float productValue271 = ((productValue100 * (((intermediateValue51 - sumValue146) * intermediateValue49) + sumValue146)) + productValue98) + intermediateValue86;
    float productValue272 = ((productValue100 * (((intermediateValue52 - sumValue147) * intermediateValue49) + sumValue147)) + productValue99) + intermediateValue87;
    float productValue131;
    float productValue132;
    float productValue133;
#endif
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
    {
        float sampledTextureValue13 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Sample(previousFrameAverageLuminanceSampler, 0.5f.xx).x) + 9.9999997473787516355514526367188e-05f;
#if RD_FEATURE_SEASONS == RD_OFF
        productValue134 = sampledTextureValue13 * productValue195;
        productValue135 = sampledTextureValue13 * productValue196;
        productValue136 = sampledTextureValue13 * productValue197;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue131 = sampledTextureValue13 * productValue270;
        productValue132 = sampledTextureValue13 * productValue271;
        productValue133 = sampledTextureValue13 * productValue272;
#endif
    }
    else
    {
#if RD_FEATURE_SEASONS == RD_OFF
        productValue134 = productValue195;
        productValue135 = productValue196;
        productValue136 = productValue197;
#elif RD_FEATURE_SEASONS == RD_ON
        productValue131 = productValue270;
        productValue132 = productValue271;
        productValue133 = productValue272;
#endif
    }
#if RD_FEATURE_SEASONS == RD_OFF
    fragmentColor0.x = productValue134;
    fragmentColor0.y = productValue135;
    fragmentColor0.z = productValue136;
    fragmentColor0.w = intermediateValue10;
#elif RD_FEATURE_SEASONS == RD_ON
    fragmentColor0.x = productValue131;
    fragmentColor0.y = productValue132;
    fragmentColor0.z = productValue133;
    fragmentColor0.w = 1.0f;
#endif
    fragmentColor1.x = 0.0f;
    fragmentColor1.y = 0.0f;
    fragmentColor1.z = 0.0f;
    fragmentColor1.w = 0.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingNormal0 = stage_input.varyingNormal0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    return stage_output;
}
#endif
