// GamefaceStandard / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceStandard/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord4 : TEXCOORD4,
  float4 varyingTexCoord2 : TEXCOORD2,
  nointerpolation float4 varyingTexCoord3 : TEXCOORD3,
  float4 varyingTexCoord5 : TEXCOORD5,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = (uint3)varyingTexCoord3.yzw;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.y = (uint)workingVector0.y << 4;
  workingVector0.x = (uint)workingVector0.x >> 4;
  workingVector0.x = (int)workingVector0.x & 15;
  workingVector0.x = (int)workingVector0.x + (int)workingVector0.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  if (4 == 0) workingVector0.x = 0; else if (4+4 < 32) {   workingVector0.x = (uint)workingVector0.x << (32-(4 + 4)); workingVector0.x = (uint)workingVector0.x >> (32-4);  } else workingVector0.x = (uint)workingVector0.x >> 4;
  bitMask.x = ((~(-1 << 28)) << 4) & 0xffffffff;  workingVector0.x = (((uint)workingVector0.y << 4) & bitMask.x) | ((uint)workingVector0.x & ~bitMask.x);
#endif
  workingVector0.y = (int)workingVector0.x + 1;
  workingVector0.w = (int)fragmentVectorConstants1[workingVector0.x+0].x;
  workingVector1.x = (int)workingVector0.w + -1;
  workingVector1.x = max(0, (int)workingVector1.x);
  workingVector1.xy = (int2)fragmentVectorConstants1[workingVector1.x+0].yz;
  if (workingVector0.z == 0) {
    workingVector1.z = varyingTexCoord1.z * varyingTexCoord1.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector2.x = min(1, workingVector1.z);
    workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
    workingVector1.zw = float2(1,0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector1.z = min(1, workingVector1.z);
    workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
    workingVector1.w = 1;
    workingVector3.x = 0;
#endif
  } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector4.x = RD_COMPARISON_MASK((int)workingVector0.z == 3);
    if (workingVector4.x != 0) {
      workingVector4.xy = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector0.w+0].zw);
      workingVector4.x = (int)workingVector4.y | (int)workingVector4.x;
      workingVector4.yz = fragmentVectorConstants1[workingVector0.w+0].xy + fragmentVectorConstants1[workingVector0.w+0].zw;
      workingVector5.xy = max(fragmentVectorConstants1[workingVector0.w+0].xy, varyingTexCoord1.xy);
      workingVector4.yz = min(workingVector5.xy, workingVector4.yz);
      workingVector4.xy = workingVector4.xx ? workingVector4.yz : varyingTexCoord1.xy;
      workingVector4.xy = workingVector4.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
      workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector4.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector3.y = RD_COMPARISON_MASK((int)workingVector0.z == 3);
    if (workingVector3.y != 0) {
      workingVector3.yz = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector0.w+0].zw);
      workingVector3.y = (int)workingVector3.z | (int)workingVector3.y;
      workingVector3.zw = fragmentVectorConstants1[workingVector0.w+0].xy + fragmentVectorConstants1[workingVector0.w+0].zw;
      workingVector4.xy = max(fragmentVectorConstants1[workingVector0.w+0].xy, varyingTexCoord1.xy);
      workingVector3.zw = min(workingVector4.xy, workingVector3.zw);
      workingVector3.yz = workingVector3.yy ? workingVector3.zw : varyingTexCoord1.xy;
      workingVector3.yz = workingVector3.yz * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
      workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector3.yz).xyzw;
#endif
      workingVector0.w = (int)workingVector1.x & 2;
      if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector4.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector3.xyz;
        workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector3.xyz);
        workingVector6.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector3.xyz;
        workingVector6.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector6.xyz;
        workingVector6.xyz = log2(workingVector6.xyz);
        workingVector6.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector6.xyz;
        workingVector6.xyz = exp2(workingVector6.xyz);
        workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector3.yzw = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
        workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
        workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
        workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
        workingVector5.xyz = log2(workingVector5.xyz);
        workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
        workingVector5.xyz = exp2(workingVector5.xyz);
        workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.yzw;
#endif
      } else {
        workingVector0.w = (int)workingVector1.x & 16;
        if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
          workingVector5.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector3.xyz);
          workingVector6.xyz = log2(workingVector3.xyz);
          workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
          workingVector6.xyz = exp2(workingVector6.xyz);
          workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
          workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.yzw = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
          workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
          workingVector5.xyz = log2(workingVector2.xyz);
          workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
          workingVector5.xyz = exp2(workingVector5.xyz);
          workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
          workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.yzw;
#endif
        }
      }
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector0.w = 1 + -workingVector3.w;
      workingVector4.x = workingVector3.w + -workingVector0.w;
      workingVector0.w = fragmentVectorConstants1[workingVector0.y+0].x * workingVector4.x + workingVector0.w;
      workingVector4.x = dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector0.w = -workingVector4.x + workingVector0.w;
      workingVector3.w = fragmentVectorConstants1[workingVector0.y+0].z * workingVector0.w + workingVector4.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector0.w = 1 + -workingVector2.w;
      workingVector3.y = workingVector2.w + -workingVector0.w;
      workingVector0.w = fragmentVectorConstants1[workingVector0.y+0].x * workingVector3.y + workingVector0.w;
      workingVector3.y = dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003));
      workingVector0.w = -workingVector3.y + workingVector0.w;
      workingVector2.w = fragmentVectorConstants1[workingVector0.y+0].z * workingVector0.w + workingVector3.y;
#endif
      workingVector0.w = saturate(varyingTexCoord1.z);
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].w * workingVector0.w;
      workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].z;
      workingVector1.w = 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].w * workingVector0.w;
      workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].z;
      workingVector3.x = 0;
#endif
    } else {
      workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 17);
      if (workingVector0.w != 0) {
        workingVector0.w = (int)workingVector1.x & 8;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.w != 0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector3.x = RD_COMPARISON_MASK((int)workingVector0.w != 0);
#endif
        if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
          workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector4.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
          workingVector2.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.yz).xyzw;
#endif
          workingVector0.w = RD_COMPARISON_MASK((int)workingVector1.y != -1);
          if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector4.w = max(9.99999975e-006, workingVector3.w);
            workingVector4.xyz = workingVector3.xyz / workingVector4.www;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector4.w = max(9.99999975e-006, workingVector2.w);
            workingVector4.xyz = workingVector2.xyz / workingVector4.www;
#endif
            workingVector5.xyzw = (int4)workingVector1.yyyy + int4(1,2,3,4);
            workingVector6.x = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector1.y+0].xyzw);
            workingVector6.y = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector5.x+0].xyzw);
            workingVector6.z = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector5.y+0].xyzw);
            workingVector6.w = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector5.z+0].xyzw);
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector3.xyzw = fragmentVectorConstants1[workingVector5.w+0].xyzw + workingVector6.xyzw;
            workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].w * workingVector3.w;
            workingVector3.w = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector2.xyzw = fragmentVectorConstants1[workingVector5.w+0].xyzw + workingVector6.xyzw;
            workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].w * workingVector2.w;
            workingVector2.w = 1;
#endif
          } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].w;
#endif
          }
        } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
          workingVector4.xyzw = materialTexture1.Sample(textureSampler1, workingVector4.xy).xyzw;
          workingVector0.w = (int)workingVector1.x & 1;
          workingVector4.y = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
          workingVector4.z = 12.9200001 * workingVector4.y;
          workingVector4.w = RD_COMPARISON_MASK(0.00313080009 < workingVector4.y);
          workingVector5.x = log2(workingVector4.y);
          workingVector5.x = 0.416666657 * workingVector5.x;
          workingVector5.x = exp2(workingVector5.x);
          workingVector5.x = workingVector5.x * 1.05499995 + -0.0549999997;
          workingVector4.z = workingVector4.w ? workingVector5.x : workingVector4.z;
          workingVector0.w = workingVector0.w ? workingVector4.z : workingVector4.y;
          workingVector0.w = 1.45000005 + -workingVector0.w;
          workingVector0.w = max(9.99999975e-005, abs(workingVector0.w));
          workingVector4.x = log2(abs(workingVector4.x));
          workingVector0.w = workingVector4.x * workingVector0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
          workingVector0.w = materialTexture1.Sample(textureSampler1, workingVector3.yz).x;
          workingVector3.y = (int)workingVector1.x & 1;
          workingVector3.z = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
          workingVector3.w = 12.9200001 * workingVector3.z;
          workingVector4.x = RD_COMPARISON_MASK(0.00313080009 < workingVector3.z);
          workingVector4.y = log2(workingVector3.z);
          workingVector4.y = 0.416666657 * workingVector4.y;
          workingVector4.y = exp2(workingVector4.y);
          workingVector4.y = workingVector4.y * 1.05499995 + -0.0549999997;
          workingVector3.w = workingVector4.x ? workingVector4.y : workingVector3.w;
          workingVector3.y = workingVector3.y ? workingVector3.w : workingVector3.z;
          workingVector3.y = 1.45000005 + -workingVector3.y;
          workingVector3.y = max(9.99999975e-005, abs(workingVector3.y));
          workingVector0.w = log2(abs(workingVector0.w));
          workingVector0.w = workingVector3.y * workingVector0.w;
#endif
          workingVector0.w = exp2(workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
          workingVector2.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
          workingVector1.z = 1;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector1.z = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector1.w = 1;
#endif
      } else {
        workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 18);
        if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
          workingVector4.xyzw = materialTexture2.Sample(textureSampler2, workingVector4.xy).xyzw;
          workingVector0.w = workingVector4.x * 7.96875 + -3.984375;
          workingVector4.xy = float2(-0.501960814,0.501960814) / varyingTexCoord1.zz;
          workingVector4.y = workingVector4.y + -workingVector4.x;
          workingVector0.w = -workingVector4.x + workingVector0.w;
          workingVector4.x = 1 / workingVector4.y;
          workingVector0.w = saturate(workingVector4.x * workingVector0.w);
          workingVector4.x = workingVector0.w * -2 + 3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
          workingVector0.w = materialTexture2.Sample(textureSampler2, workingVector3.yz).x;
          workingVector0.w = workingVector0.w * 7.96875 + -3.984375;
          workingVector3.yz = float2(-0.501960814,0.501960814) / varyingTexCoord1.zz;
          workingVector3.z = workingVector3.z + -workingVector3.y;
          workingVector0.w = -workingVector3.y + workingVector0.w;
          workingVector3.y = 1 / workingVector3.z;
          workingVector0.w = saturate(workingVector3.y * workingVector0.w);
          workingVector3.y = workingVector0.w * -2 + 3;
#endif
          workingVector0.w = workingVector0.w * workingVector0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector0.w = workingVector4.x * workingVector0.w;
          workingVector4.x = (int)workingVector1.x & 1;
          workingVector4.y = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
          workingVector4.z = 12.9200001 * workingVector4.y;
          workingVector4.w = RD_COMPARISON_MASK(0.00313080009 < workingVector4.y);
          workingVector5.x = log2(workingVector4.y);
          workingVector5.x = 0.416666657 * workingVector5.x;
          workingVector5.x = exp2(workingVector5.x);
          workingVector5.x = workingVector5.x * 1.05499995 + -0.0549999997;
          workingVector4.z = workingVector4.w ? workingVector5.x : workingVector4.z;
          workingVector4.x = workingVector4.x ? workingVector4.z : workingVector4.y;
          workingVector4.x = 1.45000005 + -workingVector4.x;
          workingVector4.x = max(9.99999975e-005, abs(workingVector4.x));
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector0.w = workingVector3.y * workingVector0.w;
          workingVector3.y = (int)workingVector1.x & 1;
          workingVector3.z = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
          workingVector3.w = 12.9200001 * workingVector3.z;
          workingVector4.x = RD_COMPARISON_MASK(0.00313080009 < workingVector3.z);
          workingVector4.y = log2(workingVector3.z);
          workingVector4.y = 0.416666657 * workingVector4.y;
          workingVector4.y = exp2(workingVector4.y);
          workingVector4.y = workingVector4.y * 1.05499995 + -0.0549999997;
          workingVector3.w = workingVector4.x ? workingVector4.y : workingVector3.w;
          workingVector3.y = workingVector3.y ? workingVector3.w : workingVector3.z;
          workingVector3.y = 1.45000005 + -workingVector3.y;
          workingVector3.y = max(9.99999975e-005, abs(workingVector3.y));
#endif
          workingVector0.w = log2(workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector0.w = workingVector4.x * workingVector0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector0.w = workingVector3.y * workingVector0.w;
#endif
          workingVector0.w = exp2(workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
          workingVector2.x = 1;
          workingVector1.z = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
          workingVector1.zw = float2(1,1);
#endif
        } else {
          workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 22);
          if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
            workingVector4.xyzw = materialTexture2.Sample(textureSampler2, workingVector4.xy).xyzw;
            workingVector0.w = 0.5 + -varyingTexCoord1.z;
            workingVector4.y = 0.5 + varyingTexCoord1.z;
            workingVector4.y = workingVector4.y + -workingVector0.w;
            workingVector0.w = workingVector4.x + -workingVector0.w;
            workingVector4.x = 1 / workingVector4.y;
            workingVector0.w = saturate(workingVector4.x * workingVector0.w);
            workingVector4.x = workingVector0.w * -2 + 3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
            workingVector0.w = materialTexture2.Sample(textureSampler2, workingVector3.yz).x;
            workingVector3.y = 0.5 + -varyingTexCoord1.z;
            workingVector3.z = 0.5 + varyingTexCoord1.z;
            workingVector3.z = workingVector3.z + -workingVector3.y;
            workingVector0.w = -workingVector3.y + workingVector0.w;
            workingVector3.y = 1 / workingVector3.z;
            workingVector0.w = saturate(workingVector3.y * workingVector0.w);
            workingVector3.y = workingVector0.w * -2 + 3;
#endif
            workingVector0.w = workingVector0.w * workingVector0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector0.w = workingVector4.x * workingVector0.w;
            workingVector4.x = (int)workingVector1.x & 1;
            workingVector4.y = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
            workingVector4.z = 12.9200001 * workingVector4.y;
            workingVector4.w = RD_COMPARISON_MASK(0.00313080009 < workingVector4.y);
            workingVector5.x = log2(workingVector4.y);
            workingVector5.x = 0.416666657 * workingVector5.x;
            workingVector5.x = exp2(workingVector5.x);
            workingVector5.x = workingVector5.x * 1.05499995 + -0.0549999997;
            workingVector4.z = workingVector4.w ? workingVector5.x : workingVector4.z;
            workingVector4.x = workingVector4.x ? workingVector4.z : workingVector4.y;
            workingVector4.x = 1.45000005 + -workingVector4.x;
            workingVector4.x = max(9.99999975e-005, abs(workingVector4.x));
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector0.w = workingVector3.y * workingVector0.w;
            workingVector3.y = (int)workingVector1.x & 1;
            workingVector3.z = dot(fragmentVectorConstants1[workingVector0.y+0].xyz, float3(0.212599993,0.715200007,0.0722000003));
            workingVector3.w = 12.9200001 * workingVector3.z;
            workingVector4.x = RD_COMPARISON_MASK(0.00313080009 < workingVector3.z);
            workingVector4.y = log2(workingVector3.z);
            workingVector4.y = 0.416666657 * workingVector4.y;
            workingVector4.y = exp2(workingVector4.y);
            workingVector4.y = workingVector4.y * 1.05499995 + -0.0549999997;
            workingVector3.w = workingVector4.x ? workingVector4.y : workingVector3.w;
            workingVector3.y = workingVector3.y ? workingVector3.w : workingVector3.z;
            workingVector3.y = 1.45000005 + -workingVector3.y;
            workingVector3.y = max(9.99999975e-005, abs(workingVector3.y));
#endif
            workingVector0.w = log2(workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector0.w = workingVector4.x * workingVector0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector0.w = workingVector3.y * workingVector0.w;
#endif
            workingVector0.w = exp2(workingVector0.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
            workingVector2.x = 1;
            workingVector1.z = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector0.wwww;
            workingVector1.zw = float2(1,1);
#endif
          } else {
            workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 30);
            if (workingVector0.w != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
              workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
              workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector4.xy).xyzw;
              workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
              workingVector1.z = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
              workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
              workingVector1.z = materialTexture0.Sample(textureSampler0, workingVector3.yz).x;
              workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
              workingVector1.w = 1;
#endif
            } else {
              workingVector0.z = RD_COMPARISON_MASK((int)workingVector0.z == 34);
              if (workingVector0.z != 0) {
                workingVector0.zw = frac(varyingTexCoord1.xy);
                workingVector0.zw = fragmentVectorConstants1[workingVector0.y+0].zw * workingVector0.zw + fragmentVectorConstants1[workingVector0.y+0].xy;
                workingVector0.zw = workingVector0.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.zw).xyzw;
#endif
                workingVector0.z = (int)workingVector1.x & 2;
                if (workingVector0.z != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
                  workingVector2.yzw = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector3.xyz;
                  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector3.xyz);
                  workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector3.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                  workingVector3.yzw = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                  workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
#endif
                  workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
                  workingVector5.xyz = log2(workingVector5.xyz);
                  workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
                  workingVector5.xyz = exp2(workingVector5.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
                  workingVector3.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector2.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                  workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.yzw;
#endif
                } else {
                  workingVector0.z = (int)workingVector1.x & 16;
                  if (workingVector0.z != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector2.yzw = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
                    workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector3.xyz);
                    workingVector5.xyz = log2(workingVector3.xyz);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector3.yzw = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                    workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                    workingVector5.xyz = log2(workingVector2.xyz);
#endif
                    workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
                    workingVector5.xyz = exp2(workingVector5.xyz);
                    workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector3.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector2.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.yzw;
#endif
                  }
                }
                workingVector0.x = (int)fragmentVectorConstants1[workingVector0.x+0].y;
                workingVector0.xzw = (int3)workingVector0.xxx & int3(1,4,2);
#if RD_PLATFORM == RD_PLATFORM_SM40
                workingVector2.y = 1 + -workingVector3.w;
                workingVector0.x = workingVector0.x ? workingVector2.y : workingVector3.w;
                workingVector2.y = saturate(dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                workingVector0.x = workingVector0.z ? workingVector2.y : workingVector0.x;
                workingVector3.w = workingVector0.w ? 1 : workingVector0.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                workingVector3.y = 1 + -workingVector2.w;
                workingVector0.x = workingVector0.x ? workingVector3.y : workingVector2.w;
                workingVector3.y = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                workingVector0.x = workingVector0.z ? workingVector3.y : workingVector0.x;
                workingVector2.w = workingVector0.w ? 1 : workingVector0.x;
#endif
                workingVector0.x = saturate(varyingTexCoord1.z);
#if RD_PLATFORM == RD_PLATFORM_SM40
                workingVector2.x = varyingTexCoord1.w * workingVector0.x;
                workingVector1.z = workingVector0.z ? 0 : 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                workingVector1.z = varyingTexCoord1.w * workingVector0.x;
                workingVector1.w = workingVector0.z ? 0 : 1;
#endif
              } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
                workingVector3.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
                workingVector2.x = 1;
                workingVector1.z = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
                workingVector1.zw = float2(1,1);
#endif
              }
            }
          }
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector1.w = 0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector3.x = 0;
#endif
      }
    }
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  if (workingVector1.w == 0) {
#elif RD_PLATFORM == RD_PLATFORM_SM50
  if (workingVector3.x == 0) {
#endif
    workingVector0.x = (int)workingVector1.x & 64;
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector0.yzw = workingVector3.xyz * workingVector3.www;
    workingVector3.xyz = workingVector0.xxx ? workingVector0.yzw : workingVector3.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.yzw = workingVector2.xyz * workingVector2.www;
    workingVector2.xyz = workingVector0.xxx ? workingVector0.yzw : workingVector2.xyz;
#endif
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector1.y != -1);
    if (workingVector0.x != 0) {
#if RD_PLATFORM == RD_PLATFORM_SM40
      workingVector0.w = max(9.99999975e-006, workingVector3.w);
      workingVector0.xyz = workingVector3.xyz / workingVector0.www;
      workingVector4.xyzw = (int4)workingVector1.yyyy + int4(1,2,3,4);
      workingVector5.x = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector1.y+0].xyzw);
      workingVector5.y = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector4.x+0].xyzw);
      workingVector5.z = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector4.y+0].xyzw);
      workingVector5.w = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector4.z+0].xyzw);
      workingVector3.xyzw = fragmentVectorConstants1[workingVector4.w+0].xyzw + workingVector5.xyzw;
      workingVector0.x = saturate(dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003)));
      workingVector0.y = workingVector3.w + -workingVector0.x;
      workingVector0.x = workingVector1.z * workingVector0.y + workingVector0.x;
      workingVector2.x = workingVector2.x * workingVector0.x;
      workingVector3.w = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
      workingVector0.w = max(9.99999975e-006, workingVector2.w);
      workingVector0.xyz = workingVector2.xyz / workingVector0.www;
      workingVector3.xyzw = (int4)workingVector1.yyyy + int4(1,2,3,4);
      workingVector4.x = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector1.y+0].xyzw);
      workingVector4.y = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector3.x+0].xyzw);
      workingVector4.z = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector3.y+0].xyzw);
      workingVector4.w = dot(workingVector0.xyzw, fragmentVectorConstants1[workingVector3.z+0].xyzw);
      workingVector2.xyzw = fragmentVectorConstants1[workingVector3.w+0].xyzw + workingVector4.xyzw;
      workingVector0.x = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
      workingVector0.y = workingVector2.w + -workingVector0.x;
      workingVector0.x = workingVector1.w * workingVector0.y + workingVector0.x;
      workingVector1.z = workingVector1.z * workingVector0.x;
      workingVector2.w = 1;
#endif
    }
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  fragmentColor0.xyzw = workingVector3.xyzw * workingVector2.xxxx;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  fragmentColor0.xyzw = workingVector2.xyzw * workingVector1.zzzz;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float dotProductValue;
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue36;
    float intermediateValue38;
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    uint intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    uint intermediateValue10;
    uint intermediateValue11;
    uint intermediateValue12;
    bool comparisonValue;
    for (;;)
    {
        intermediateValue = varyingTexCoord1.x;
        intermediateValue1 = varyingTexCoord1.y;
        intermediateValue2 = varyingTexCoord1.z;
        intermediateValue3 = varyingTexCoord1.w;
        intermediateValue4 = uint(varyingTexCoord3.w);
        uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
        intermediateValue5 = fragmentConstants[bitwiseValue].y;
        uint sumValue = bitwiseValue + 1u;
        intermediateValue6 = fragmentConstants[sumValue].x;
        intermediateValue7 = fragmentConstants[sumValue].y;
        intermediateValue8 = fragmentConstants[sumValue].z;
        intermediateValue9 = fragmentConstants[sumValue].w;
        intermediateValue10 = uint(int(fragmentConstants[bitwiseValue].x));
        uint sumValue1 = uint(max(int(0u), int(intermediateValue10 + 4294967295u)));
        intermediateValue11 = uint(int(fragmentConstants[sumValue1].y));
        intermediateValue12 = uint(int(fragmentConstants[sumValue1].z));
        comparisonValue = intermediateValue4 == 0u;
        float intermediateValue13;
        float productValue;
        float intermediateValue14;
        float intermediateValue17;
        float intermediateValue20;
        float intermediateValue23;
        if (comparisonValue)
        {
            intermediateValue13 = 1.0f;
            productValue = min(1.0f, intermediateValue3 * intermediateValue2);
            intermediateValue14 = intermediateValue6;
            intermediateValue17 = intermediateValue7;
            intermediateValue20 = intermediateValue8;
            intermediateValue23 = intermediateValue9;
        }
        else
        {
            float branchMergedValue;
            float branchMergedValue6;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            if (intermediateValue4 == 3u)
            {
                float sumValue2;
                float sumValue3;
                if ((fragmentConstants[intermediateValue10].z != (-1.0f)) || (fragmentConstants[intermediateValue10].w != (-1.0f)))
                {
                    sumValue2 = min(max(intermediateValue, fragmentConstants[intermediateValue10].x), fragmentConstants[intermediateValue10].x + fragmentConstants[intermediateValue10].z);
                    sumValue3 = min(max(intermediateValue1, fragmentConstants[intermediateValue10].y), fragmentConstants[intermediateValue10].y + fragmentConstants[intermediateValue10].w);
                }
                else
                {
                    sumValue2 = intermediateValue;
                    sumValue3 = intermediateValue1;
                }
                float4 sampledTextureValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * sumValue2) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * sumValue3) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                float scalarValue = sampledTextureValue.x;
                float scalarValue1 = sampledTextureValue.y;
                float scalarValue2 = sampledTextureValue.z;
                float scalarValue3 = sampledTextureValue.w;
                float intermediateValue15;
                float intermediateValue18;
                float intermediateValue21;
                if ((intermediateValue11 & 2u) == 0u)
                {
                    float branchMergedValue1;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if ((intermediateValue11 & 16u) == 0u)
                    {
                        branchMergedValue1 = scalarValue2;
                        branchMergedValue13 = scalarValue;
                        branchMergedValue14 = scalarValue1;
                    }
                    else
                    {
                        float exponentialValue1;
                        if (!(scalarValue <= 0.003130800090730190277099609375f))
                        {
                            exponentialValue1 = (exp2(log2(scalarValue) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                        }
                        else
                        {
                            exponentialValue1 = scalarValue * 12.9200000762939453125f;
                        }
                        float exponentialValue3;
                        if (!(scalarValue1 <= 0.003130800090730190277099609375f))
                        {
                            exponentialValue3 = (exp2(log2(scalarValue1) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                        }
                        else
                        {
                            exponentialValue3 = scalarValue1 * 12.9200000762939453125f;
                        }
                        float branchMergedValue27;
                        float branchMergedValue29;
                        float branchMergedValue30;
                        if (!(scalarValue2 <= 0.003130800090730190277099609375f))
                        {
                            branchMergedValue27 = (exp2(log2(scalarValue2) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                            branchMergedValue29 = exponentialValue1;
                            branchMergedValue30 = exponentialValue3;
                        }
                        else
                        {
                            branchMergedValue27 = scalarValue2 * 12.9200000762939453125f;
                            branchMergedValue29 = exponentialValue1;
                            branchMergedValue30 = exponentialValue3;
                        }
                        branchMergedValue1 = branchMergedValue27;
                        branchMergedValue13 = branchMergedValue29;
                        branchMergedValue14 = branchMergedValue30;
                    }
                    intermediateValue15 = branchMergedValue13;
                    intermediateValue18 = branchMergedValue14;
                    intermediateValue21 = branchMergedValue1;
                }
                else
                {
                    float exponentialValue;
                    if (!(scalarValue <= 0.040449999272823333740234375f))
                    {
                        exponentialValue = exp2(log2((scalarValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                    }
                    else
                    {
                        exponentialValue = scalarValue * 0.077399380505084991455078125f;
                    }
                    float exponentialValue2;
                    if (!(scalarValue1 <= 0.040449999272823333740234375f))
                    {
                        exponentialValue2 = exp2(log2((scalarValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                    }
                    else
                    {
                        exponentialValue2 = scalarValue1 * 0.077399380505084991455078125f;
                    }
                    float branchMergedValue2;
                    float branchMergedValue15;
                    float branchMergedValue16;
                    if (!(scalarValue2 <= 0.040449999272823333740234375f))
                    {
                        branchMergedValue2 = exp2(log2((scalarValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                        branchMergedValue15 = exponentialValue;
                        branchMergedValue16 = exponentialValue2;
                    }
                    else
                    {
                        branchMergedValue2 = scalarValue2 * 0.077399380505084991455078125f;
                        branchMergedValue15 = exponentialValue;
                        branchMergedValue16 = exponentialValue2;
                    }
                    intermediateValue15 = branchMergedValue15;
                    intermediateValue18 = branchMergedValue16;
                    intermediateValue21 = branchMergedValue2;
                }
                float sumValue4 = 1.0f - scalarValue3;
                float productValue1 = ((intermediateValue18 * 0.715200006961822509765625f) + (intermediateValue15 * 0.2125999927520751953125f)) + (intermediateValue21 * 0.072200000286102294921875f);
                branchMergedValue = intermediateValue18;
                branchMergedValue6 = intermediateValue15;
                branchMergedValue7 = clamp(intermediateValue2, 0.0f, 1.0f) * intermediateValue9;
                branchMergedValue8 = intermediateValue8;
                branchMergedValue9 = (((((scalarValue3 - sumValue4) * intermediateValue6) + sumValue4) - productValue1) * intermediateValue8) + productValue1;
                branchMergedValue10 = intermediateValue21;
            }
            else
            {
                float branchMergedValue21;
                float branchMergedValue22;
                float branchMergedValue23;
                float branchMergedValue24;
                float branchMergedValue25;
                float branchMergedValue26;
                if (intermediateValue4 == 17u)
                {
                    float4 vectorValue = txBuffer1Texture.Sample(txBuffer1Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_1.z * intermediateValue) + RD_UNIFORM_UV_TRANSFORM_ROW_1.x, (RD_UNIFORM_UV_TRANSFORM_ROW_1.w * intermediateValue1) + RD_UNIFORM_UV_TRANSFORM_ROW_1.y));
                    float scalarValue4 = vectorValue.x;
                    if (!((intermediateValue11 & 8u) == 0u))
                    {
                        float scalarValue5 = vectorValue.y;
                        float scalarValue6 = vectorValue.z;
                        float scalarValue7 = vectorValue.w;
                        if (intermediateValue12 == 4294967295u)
                        {
                            dotProductValue = intermediateValue9;
                            intermediateValue33 = scalarValue4;
                            intermediateValue34 = scalarValue5;
                            intermediateValue36 = scalarValue6;
                            intermediateValue38 = scalarValue7;
                            break;
                        }
                        float scalarValue8 = max(scalarValue7, 9.9999997473787516355514526367188e-06f);
                        float quotientValue = scalarValue4 / scalarValue8;
                        float quotientValue1 = scalarValue5 / scalarValue8;
                        float quotientValue2 = scalarValue6 / scalarValue8;
                        uint sumValue5 = intermediateValue12 + 4u;
                        dotProductValue = (dot(float4(quotientValue, quotientValue1, quotientValue2, scalarValue8), float4(fragmentConstants[intermediateValue12 + 3u])) + fragmentConstants[sumValue5].w) * intermediateValue9;
                        intermediateValue33 = dot(float4(quotientValue, quotientValue1, quotientValue2, scalarValue8), float4(fragmentConstants[intermediateValue12])) + fragmentConstants[sumValue5].x;
                        intermediateValue34 = dot(float4(quotientValue, quotientValue1, quotientValue2, scalarValue8), float4(fragmentConstants[intermediateValue12 + 1u])) + fragmentConstants[sumValue5].y;
                        intermediateValue36 = dot(float4(quotientValue, quotientValue1, quotientValue2, scalarValue8), float4(fragmentConstants[intermediateValue12 + 2u])) + fragmentConstants[sumValue5].z;
                        intermediateValue38 = 1.0f;
                        break;
                    }
                    float productValue2 = ((intermediateValue7 * 0.715200006961822509765625f) + (intermediateValue6 * 0.2125999927520751953125f)) + (intermediateValue8 * 0.072200000286102294921875f);
                    float intermediateValue42;
                    if ((intermediateValue11 & 1u) == 0u)
                    {
                        intermediateValue42 = productValue2;
                    }
                    else
                    {
                        float branchMergedValue3;
                        if (!(productValue2 <= 0.003130800090730190277099609375f))
                        {
                            branchMergedValue3 = (exp2(log2(productValue2) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                        }
                        else
                        {
                            branchMergedValue3 = productValue2 * 12.9200000762939453125f;
                        }
                        intermediateValue42 = branchMergedValue3;
                    }
                    float exponentialValue4 = exp2(log2(abs(scalarValue4)) * max(abs(1.4500000476837158203125f - intermediateValue42), 9.9999997473787516355514526367188e-05f));
                    branchMergedValue21 = exponentialValue4 * intermediateValue7;
                    branchMergedValue22 = exponentialValue4 * intermediateValue6;
                    branchMergedValue23 = 1.0f;
                    branchMergedValue24 = 1.0f;
                    branchMergedValue25 = exponentialValue4 * intermediateValue9;
                    branchMergedValue26 = exponentialValue4 * intermediateValue8;
                }
                else
                {
                    float branchMergedValue33;
                    float branchMergedValue34;
                    float branchMergedValue35;
                    float branchMergedValue36;
                    float branchMergedValue37;
                    float branchMergedValue38;
                    if (intermediateValue4 == 18u)
                    {
                        float4 vectorValue1 = txBuffer2Texture.Sample(txBuffer2Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_2.z * intermediateValue) + RD_UNIFORM_UV_TRANSFORM_ROW_2.x, (RD_UNIFORM_UV_TRANSFORM_ROW_2.w * intermediateValue1) + RD_UNIFORM_UV_TRANSFORM_ROW_2.y));
                        float clampedValue = clamp((intermediateValue2 * 0.996093690395355224609375f) * (((0.501960813999176025390625f / intermediateValue2) + (-3.984375f)) + (vectorValue1.x * 7.96875f)), 0.0f, 1.0f);
                        float productValue3 = ((intermediateValue7 * 0.715200006961822509765625f) + (intermediateValue6 * 0.2125999927520751953125f)) + (intermediateValue8 * 0.072200000286102294921875f);
                        float intermediateValue44;
                        if ((intermediateValue11 & 1u) == 0u)
                        {
                            intermediateValue44 = productValue3;
                        }
                        else
                        {
                            float branchMergedValue4;
                            if (!(productValue3 <= 0.003130800090730190277099609375f))
                            {
                                branchMergedValue4 = (exp2(log2(productValue3) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                            }
                            else
                            {
                                branchMergedValue4 = productValue3 * 12.9200000762939453125f;
                            }
                            intermediateValue44 = branchMergedValue4;
                        }
                        float exponentialValue5 = exp2(log2(abs((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f)))) * max(abs(1.4500000476837158203125f - intermediateValue44), 9.9999997473787516355514526367188e-05f));
                        branchMergedValue33 = exponentialValue5 * intermediateValue7;
                        branchMergedValue34 = exponentialValue5 * intermediateValue6;
                        branchMergedValue35 = 1.0f;
                        branchMergedValue36 = 1.0f;
                        branchMergedValue37 = exponentialValue5 * intermediateValue9;
                        branchMergedValue38 = exponentialValue5 * intermediateValue8;
                    }
                    else
                    {
                        float branchMergedValue39;
                        float branchMergedValue40;
                        float branchMergedValue41;
                        float branchMergedValue42;
                        float branchMergedValue43;
                        float branchMergedValue44;
                        if (intermediateValue4 == 22u)
                        {
                            float4 vectorValue2 = txBuffer2Texture.Sample(txBuffer2Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_2.z * intermediateValue) + RD_UNIFORM_UV_TRANSFORM_ROW_2.x, (RD_UNIFORM_UV_TRANSFORM_ROW_2.w * intermediateValue1) + RD_UNIFORM_UV_TRANSFORM_ROW_2.y));
                            float sumValue6 = 0.5f - intermediateValue2;
                            float clampedValue1 = clamp((vectorValue2.x - sumValue6) / ((intermediateValue2 + 0.5f) - sumValue6), 0.0f, 1.0f);
                            float productValue4 = ((intermediateValue7 * 0.715200006961822509765625f) + (intermediateValue6 * 0.2125999927520751953125f)) + (intermediateValue8 * 0.072200000286102294921875f);
                            float intermediateValue46;
                            if ((intermediateValue11 & 1u) == 0u)
                            {
                                intermediateValue46 = productValue4;
                            }
                            else
                            {
                                float branchMergedValue5;
                                if (!(productValue4 <= 0.003130800090730190277099609375f))
                                {
                                    branchMergedValue5 = (exp2(log2(productValue4) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                }
                                else
                                {
                                    branchMergedValue5 = productValue4 * 12.9200000762939453125f;
                                }
                                intermediateValue46 = branchMergedValue5;
                            }
                            float exponentialValue6 = exp2(log2(abs((clampedValue1 * clampedValue1) * (3.0f - (clampedValue1 * 2.0f)))) * max(abs(1.4500000476837158203125f - intermediateValue46), 9.9999997473787516355514526367188e-05f));
                            branchMergedValue39 = exponentialValue6 * intermediateValue7;
                            branchMergedValue40 = exponentialValue6 * intermediateValue6;
                            branchMergedValue41 = 1.0f;
                            branchMergedValue42 = 1.0f;
                            branchMergedValue43 = exponentialValue6 * intermediateValue9;
                            branchMergedValue44 = exponentialValue6 * intermediateValue8;
                        }
                        else
                        {
                            float branchMergedValue45;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            float branchMergedValue48;
                            float branchMergedValue49;
                            float branchMergedValue50;
                            if (intermediateValue4 == 30u)
                            {
                                branchMergedValue45 = intermediateValue7;
                                branchMergedValue46 = intermediateValue6;
                                branchMergedValue47 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * intermediateValue) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * intermediateValue1) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).x;
                                branchMergedValue48 = 1.0f;
                                branchMergedValue49 = intermediateValue9;
                                branchMergedValue50 = intermediateValue8;
                            }
                            else
                            {
                                float branchMergedValue51;
                                float branchMergedValue52;
                                float branchMergedValue53;
                                float branchMergedValue54;
                                float branchMergedValue55;
                                float branchMergedValue56;
                                if (intermediateValue4 == 34u)
                                {
                                    float4 vectorValue3 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * ((frac(intermediateValue) * intermediateValue8) + intermediateValue6)) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(intermediateValue1) * intermediateValue9) + intermediateValue7) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                    float scalarValue9 = vectorValue3.x;
                                    float scalarValue10 = vectorValue3.y;
                                    float scalarValue11 = vectorValue3.z;
                                    float scalarValue12 = vectorValue3.w;
                                    float intermediateValue16;
                                    float intermediateValue19;
                                    float intermediateValue22;
                                    if ((intermediateValue11 & 2u) == 0u)
                                    {
                                        float branchMergedValue11;
                                        float branchMergedValue17;
                                        float branchMergedValue18;
                                        if ((intermediateValue11 & 16u) == 0u)
                                        {
                                            branchMergedValue11 = scalarValue11;
                                            branchMergedValue17 = scalarValue10;
                                            branchMergedValue18 = scalarValue9;
                                        }
                                        else
                                        {
                                            float exponentialValue8;
                                            if (!(scalarValue9 <= 0.003130800090730190277099609375f))
                                            {
                                                exponentialValue8 = (exp2(log2(scalarValue9) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                            }
                                            else
                                            {
                                                exponentialValue8 = scalarValue9 * 12.9200000762939453125f;
                                            }
                                            float exponentialValue10;
                                            if (!(scalarValue10 <= 0.003130800090730190277099609375f))
                                            {
                                                exponentialValue10 = (exp2(log2(scalarValue10) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                            }
                                            else
                                            {
                                                exponentialValue10 = scalarValue10 * 12.9200000762939453125f;
                                            }
                                            float branchMergedValue28;
                                            float branchMergedValue31;
                                            float branchMergedValue32;
                                            if (!(scalarValue11 <= 0.003130800090730190277099609375f))
                                            {
                                                branchMergedValue28 = (exp2(log2(scalarValue11) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                branchMergedValue31 = exponentialValue10;
                                                branchMergedValue32 = exponentialValue8;
                                            }
                                            else
                                            {
                                                branchMergedValue28 = scalarValue11 * 12.9200000762939453125f;
                                                branchMergedValue31 = exponentialValue10;
                                                branchMergedValue32 = exponentialValue8;
                                            }
                                            branchMergedValue11 = branchMergedValue28;
                                            branchMergedValue17 = branchMergedValue31;
                                            branchMergedValue18 = branchMergedValue32;
                                        }
                                        intermediateValue16 = branchMergedValue18;
                                        intermediateValue19 = branchMergedValue17;
                                        intermediateValue22 = branchMergedValue11;
                                    }
                                    else
                                    {
                                        float exponentialValue7;
                                        if (!(scalarValue9 <= 0.040449999272823333740234375f))
                                        {
                                            exponentialValue7 = exp2(log2((scalarValue9 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                        }
                                        else
                                        {
                                            exponentialValue7 = scalarValue9 * 0.077399380505084991455078125f;
                                        }
                                        float exponentialValue9;
                                        if (!(scalarValue10 <= 0.040449999272823333740234375f))
                                        {
                                            exponentialValue9 = exp2(log2((scalarValue10 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                        }
                                        else
                                        {
                                            exponentialValue9 = scalarValue10 * 0.077399380505084991455078125f;
                                        }
                                        float branchMergedValue12;
                                        float branchMergedValue19;
                                        float branchMergedValue20;
                                        if (!(scalarValue11 <= 0.040449999272823333740234375f))
                                        {
                                            branchMergedValue12 = exp2(log2((scalarValue11 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                            branchMergedValue19 = exponentialValue9;
                                            branchMergedValue20 = exponentialValue7;
                                        }
                                        else
                                        {
                                            branchMergedValue12 = scalarValue11 * 0.077399380505084991455078125f;
                                            branchMergedValue19 = exponentialValue9;
                                            branchMergedValue20 = exponentialValue7;
                                        }
                                        intermediateValue16 = branchMergedValue20;
                                        intermediateValue19 = branchMergedValue19;
                                        intermediateValue22 = branchMergedValue12;
                                    }
                                    uint scalarValue13 = uint(int(intermediateValue5));
                                    bool comparisonValue1 = (scalarValue13 & 4u) != 0u;
                                    branchMergedValue51 = intermediateValue19;
                                    branchMergedValue52 = intermediateValue16;
                                    branchMergedValue53 = clamp(intermediateValue2, 0.0f, 1.0f) * intermediateValue3;
                                    branchMergedValue54 = comparisonValue1 ? 0.0f : 1.0f;
                                    branchMergedValue55 = ((scalarValue13 & 2u) != 0u) ? 1.0f : (comparisonValue1 ? clamp(((intermediateValue19 * 0.715200006961822509765625f) + (intermediateValue16 * 0.2125999927520751953125f)) + (intermediateValue22 * 0.072200000286102294921875f), 0.0f, 1.0f) : (((scalarValue13 & 1u) != 0u) ? (1.0f - scalarValue12) : scalarValue12));
                                    branchMergedValue56 = intermediateValue22;
                                }
                                else
                                {
                                    branchMergedValue51 = intermediateValue7;
                                    branchMergedValue52 = intermediateValue6;
                                    branchMergedValue53 = 1.0f;
                                    branchMergedValue54 = 1.0f;
                                    branchMergedValue55 = intermediateValue9;
                                    branchMergedValue56 = intermediateValue8;
                                }
                                branchMergedValue45 = branchMergedValue51;
                                branchMergedValue46 = branchMergedValue52;
                                branchMergedValue47 = branchMergedValue53;
                                branchMergedValue48 = branchMergedValue54;
                                branchMergedValue49 = branchMergedValue55;
                                branchMergedValue50 = branchMergedValue56;
                            }
                            branchMergedValue39 = branchMergedValue45;
                            branchMergedValue40 = branchMergedValue46;
                            branchMergedValue41 = branchMergedValue47;
                            branchMergedValue42 = branchMergedValue48;
                            branchMergedValue43 = branchMergedValue49;
                            branchMergedValue44 = branchMergedValue50;
                        }
                        branchMergedValue33 = branchMergedValue39;
                        branchMergedValue34 = branchMergedValue40;
                        branchMergedValue35 = branchMergedValue41;
                        branchMergedValue36 = branchMergedValue42;
                        branchMergedValue37 = branchMergedValue43;
                        branchMergedValue38 = branchMergedValue44;
                    }
                    branchMergedValue21 = branchMergedValue33;
                    branchMergedValue22 = branchMergedValue34;
                    branchMergedValue23 = branchMergedValue35;
                    branchMergedValue24 = branchMergedValue36;
                    branchMergedValue25 = branchMergedValue37;
                    branchMergedValue26 = branchMergedValue38;
                }
                branchMergedValue = branchMergedValue21;
                branchMergedValue6 = branchMergedValue22;
                branchMergedValue7 = branchMergedValue23;
                branchMergedValue8 = branchMergedValue24;
                branchMergedValue9 = branchMergedValue25;
                branchMergedValue10 = branchMergedValue26;
            }
            intermediateValue13 = branchMergedValue8;
            productValue = branchMergedValue7;
            intermediateValue14 = branchMergedValue6;
            intermediateValue17 = branchMergedValue;
            intermediateValue20 = branchMergedValue10;
            intermediateValue23 = branchMergedValue9;
        }
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((intermediateValue11 & 64u) == 0u)
        {
            intermediateValue24 = intermediateValue14;
            intermediateValue25 = intermediateValue17;
            intermediateValue26 = intermediateValue20;
        }
        else
        {
            intermediateValue24 = intermediateValue23 * intermediateValue14;
            intermediateValue25 = intermediateValue23 * intermediateValue17;
            intermediateValue26 = intermediateValue23 * intermediateValue20;
        }
        if (intermediateValue12 == 4294967295u)
        {
            dotProductValue = productValue;
            intermediateValue33 = intermediateValue24;
            intermediateValue34 = intermediateValue25;
            intermediateValue36 = intermediateValue26;
            intermediateValue38 = intermediateValue23;
            break;
        }
        float scalarValue14 = max(intermediateValue23, 9.9999997473787516355514526367188e-06f);
        float quotientValue3 = intermediateValue24 / scalarValue14;
        float quotientValue4 = intermediateValue25 / scalarValue14;
        float quotientValue5 = intermediateValue26 / scalarValue14;
        uint sumValue7 = intermediateValue12 + 4u;
        float dotProductValue1 = dot(float4(quotientValue3, quotientValue4, quotientValue5, scalarValue14), float4(fragmentConstants[intermediateValue12])) + fragmentConstants[sumValue7].x;
        float dotProductValue2 = dot(float4(quotientValue3, quotientValue4, quotientValue5, scalarValue14), float4(fragmentConstants[intermediateValue12 + 1u])) + fragmentConstants[sumValue7].y;
        float dotProductValue3 = dot(float4(quotientValue3, quotientValue4, quotientValue5, scalarValue14), float4(fragmentConstants[intermediateValue12 + 2u])) + fragmentConstants[sumValue7].z;
        float clampedValue2 = clamp(((dotProductValue2 * 0.715200006961822509765625f) + (dotProductValue1 * 0.2125999927520751953125f)) + (dotProductValue3 * 0.072200000286102294921875f), 0.0f, 1.0f);
        dotProductValue = ((((dot(float4(quotientValue3, quotientValue4, quotientValue5, scalarValue14), float4(fragmentConstants[intermediateValue12 + 3u])) + fragmentConstants[sumValue7].w) - clampedValue2) * intermediateValue13) + clampedValue2) * productValue;
        intermediateValue33 = dotProductValue1;
        intermediateValue34 = dotProductValue2;
        intermediateValue36 = dotProductValue3;
        intermediateValue38 = 1.0f;
        break;
    }
    fragmentColor0.x = intermediateValue33 * dotProductValue;
    fragmentColor0.y = intermediateValue34 * dotProductValue;
    fragmentColor0.z = intermediateValue36 * dotProductValue;
    fragmentColor0.w = intermediateValue38 * dotProductValue;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord4 = stage_input.varyingTexCoord4;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
