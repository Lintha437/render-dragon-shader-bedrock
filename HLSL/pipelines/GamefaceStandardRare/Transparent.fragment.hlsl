// GamefaceStandardRare / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/GamefaceStandardRare/FragmentBindings.hlsli"

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
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11;
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
  workingVector1.x = (int)fragmentVectorConstants1[workingVector1.x+0].y;
  workingVector1.y = RD_COMPARISON_MASK((int)workingVector0.z == 1);
  if (workingVector1.y != 0) {
    workingVector1.yz = varyingTexCoord2.xy + -varyingTexCoord1.xy;
    workingVector1.y = dot(workingVector1.yz, workingVector1.yz);
    workingVector1.y = sqrt(workingVector1.y);
    workingVector1.y = -varyingTexCoord1.z + workingVector1.y;
    workingVector1.y = saturate(0.5 + -workingVector1.y);
    workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
  } else {
    workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 2);
    if (workingVector1.z != 0) {
      workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
      workingVector1.z = dot(workingVector1.zw, workingVector1.zw);
      workingVector1.z = sqrt(workingVector1.z);
      workingVector1.w = -varyingTexCoord1.z + workingVector1.z;
      workingVector3.x = varyingTexCoord1.z + -varyingTexCoord1.w;
      workingVector1.z = -workingVector3.x + workingVector1.z;
      workingVector1.zw = saturate(float2(0.5,0.5) + -workingVector1.zw);
      workingVector1.z = 1 + -workingVector1.z;
      workingVector1.y = workingVector1.w * workingVector1.z;
      workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
    } else {
      workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 4);
      if (workingVector1.z != 0) {
        workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
        workingVector1.zw = workingVector1.zw / varyingTexCoord1.zw;
        workingVector3.x = dot(workingVector1.zw, workingVector1.zw);
        workingVector3.x = -1 + workingVector3.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector3.yz = ddx(workingVector1.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector3.yz = ddx_coarse(workingVector1.zw);
#endif
        workingVector4.xy = -workingVector1.zw;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector4.xy = ddy(workingVector4.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector4.xy = ddy_coarse(workingVector4.xy);
#endif
        workingVector1.zw = workingVector1.zw + workingVector1.zw;
        workingVector3.yz = workingVector1.zw * workingVector3.yz;
        workingVector5.x = workingVector3.y + workingVector3.z;
        workingVector1.zw = workingVector1.zw * workingVector4.xy;
        workingVector5.y = workingVector1.z + workingVector1.w;
        workingVector1.z = dot(workingVector5.xy, workingVector5.xy);
        workingVector1.z = max(9.99999975e-005, workingVector1.z);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector1.y = saturate(-workingVector3.x * workingVector1.z + 0.5);
        workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
      } else {
        workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 5);
        if (workingVector1.z != 0) {
          workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
          workingVector3.xy = fragmentVectorConstants1[workingVector0.x+0].yy * float2(0.5,0.5) + varyingTexCoord1.zw;
          workingVector3.xy = workingVector1.zw / workingVector3.xy;
          workingVector3.z = dot(workingVector3.xy, workingVector3.xy);
          workingVector3.z = -1 + workingVector3.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xy = ddx(workingVector3.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector4.xy = ddx_coarse(workingVector3.xy);
#endif
          workingVector4.zw = -workingVector3.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.zw = ddy(workingVector4.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector4.zw = ddy_coarse(workingVector4.zw);
#endif
          workingVector3.xy = workingVector3.xy + workingVector3.xy;
          workingVector4.xy = workingVector3.xy * workingVector4.xy;
          workingVector4.x = workingVector4.x + workingVector4.y;
          workingVector3.xy = workingVector3.xy * workingVector4.zw;
          workingVector4.y = workingVector3.x + workingVector3.y;
          workingVector3.x = dot(workingVector4.xy, workingVector4.xy);
          workingVector3.x = max(9.99999975e-005, workingVector3.x);
          workingVector3.x = rsqrt(workingVector3.x);
          workingVector3.x = saturate(-workingVector3.z * workingVector3.x + 0.5);
          workingVector3.yz = -fragmentVectorConstants1[workingVector0.x+0].yy * float2(0.5,0.5) + varyingTexCoord1.zw;
          workingVector1.zw = workingVector1.zw / workingVector3.yz;
          workingVector3.y = dot(workingVector1.zw, workingVector1.zw);
          workingVector3.y = -1 + workingVector3.y;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector3.zw = ddx(workingVector1.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.zw = ddx_coarse(workingVector1.zw);
#endif
          workingVector4.xy = -workingVector1.zw;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector4.xy = ddy(workingVector4.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector4.xy = ddy_coarse(workingVector4.xy);
#endif
          workingVector1.zw = workingVector1.zw + workingVector1.zw;
          workingVector3.zw = workingVector1.zw * workingVector3.zw;
          workingVector5.x = workingVector3.z + workingVector3.w;
          workingVector1.zw = workingVector1.zw * workingVector4.xy;
          workingVector5.y = workingVector1.z + workingVector1.w;
          workingVector1.z = dot(workingVector5.xy, workingVector5.xy);
          workingVector1.z = max(9.99999975e-005, workingVector1.z);
          workingVector1.z = rsqrt(workingVector1.z);
          workingVector1.z = saturate(workingVector3.y * workingVector1.z + 0.5);
          workingVector1.y = workingVector3.x * workingVector1.z;
          workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
        } else {
          workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 6);
          if (workingVector1.z != 0) {
            workingVector1.z = (int)workingVector0.w + 1;
            workingVector1.w = RD_COMPARISON_MASK(3 < fragmentVectorConstants1[workingVector0.w+0].x);
            workingVector3.x = fragmentVectorConstants1[workingVector0.w+0].x * 0.307196319;
            workingVector3.yz = fragmentVectorConstants1[workingVector0.w+0].xx * float2(0.100000001,0.5) + float2(0.600000024,1);
            workingVector1.w = workingVector1.w ? workingVector3.x : workingVector3.y;
            workingVector3.x = (int)fragmentVectorConstants1[workingVector0.w+0].x;
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector3.x = (uint)workingVector3.x << 1;
            workingVector3.x = (int)workingVector3.x + 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bitMask.x = ((~(-1 << 31)) << 1) & 0xffffffff;  workingVector3.x = (((uint)workingVector3.x << 1) & bitMask.x) | ((uint)1 & ~bitMask.x);
#endif
            workingVector3.y = (int)workingVector3.x ^ 2;
            workingVector3.w = max((int)-workingVector3.x, (int)workingVector3.x);
            workingVector3.w = (uint)workingVector3.w >> 1;
            workingVector4.x = -(int)workingVector3.w;
            workingVector3.y = (int)workingVector3.y & 0x80000000;
            workingVector3.y = workingVector3.y ? workingVector4.x : workingVector3.w;
            workingVector3.w = 2.50662827 * workingVector1.w;
            workingVector4.xy = float2(0,0);
            while (true) {
              workingVector4.z = RD_COMPARISON_MASK((int)workingVector4.y >= (int)workingVector3.x);
              if (workingVector4.z != 0) break;
              workingVector4.z = (int)-workingVector3.y + (int)workingVector4.y;
              workingVector4.z = (int)workingVector4.z;
              workingVector4.z = workingVector4.z / workingVector1.w;
              workingVector4.z = workingVector4.z * workingVector4.z;
              workingVector4.z = -0.721347511 * workingVector4.z;
              workingVector4.z = exp2(workingVector4.z);
              workingVector4.z = workingVector4.z / workingVector3.w;
              workingVector4.x = workingVector4.x + workingVector4.z;
              workingVector4.y = (int)workingVector4.y + 1;
            }
            workingVector3.x = fragmentVectorConstants1[workingVector0.w+0].x + 1;
            workingVector3.y = 0.5 * workingVector3.x;
            workingVector3.y = floor(workingVector3.y);
            workingVector3.x = -workingVector3.y * 2 + workingVector3.x;
            workingVector3.y = 1 / workingVector3.w;
            workingVector3.y = workingVector3.y / workingVector4.x;
            workingVector3.y = 0.5 * workingVector3.y;
            workingVector3.xz = (int2)workingVector3.xz;
            workingVector4.y = RD_COMPARISON_MASK((int)workingVector3.x != 1);
            workingVector4.zw = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector1.z+0].zw);
            workingVector4.z = (int)workingVector4.w | (int)workingVector4.z;
            workingVector5.xy = fragmentVectorConstants1[workingVector1.z+0].xy + fragmentVectorConstants1[workingVector1.z+0].zw;
            workingVector5.zw = (int2)workingVector1.xx & int2(2,16);
            workingVector2.xyzw = float4(0,0,0,0);
            workingVector4.w = workingVector3.y;
            workingVector6.xyz = float3(0,0,0);
            while (true) {
              workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.z >= (int)workingVector3.z);
              if (workingVector6.w != 0) break;
              workingVector6.w = RD_COMPARISON_MASK((int)workingVector6.z != 0);
              workingVector6.w = (int)workingVector4.y | (int)workingVector6.w;
              if (workingVector6.w != 0) {
                workingVector6.w = (uint)workingVector6.z << 1;
                workingVector7.x = (int)workingVector3.x + (int)-workingVector6.w;
                workingVector7.y = (int)workingVector7.x;
                workingVector7.y = workingVector7.y / workingVector1.w;
                workingVector7.y = workingVector7.y * workingVector7.y;
                workingVector7.y = -0.721347511 * workingVector7.y;
                workingVector7.y = exp2(workingVector7.y);
                workingVector7.y = workingVector7.y / workingVector3.w;
                workingVector7.y = workingVector7.y / workingVector4.x;
                workingVector7.y = workingVector6.z ? workingVector7.y : workingVector4.w;
                workingVector7.x = (int)workingVector7.x + -1;
                workingVector7.x = (int)workingVector7.x;
                workingVector7.x = workingVector7.x / workingVector1.w;
                workingVector7.x = workingVector7.x * workingVector7.x;
                workingVector7.x = -0.721347511 * workingVector7.x;
                workingVector7.x = exp2(workingVector7.x);
                workingVector7.x = workingVector7.x / workingVector3.w;
                workingVector7.x = workingVector7.x / workingVector4.x;
                workingVector4.w = workingVector7.y + workingVector7.x;
                workingVector6.w = (int)-workingVector3.x + (int)workingVector6.w;
                workingVector6.w = (int)workingVector6.w;
                workingVector7.x = workingVector7.x / workingVector4.w;
                workingVector6.w = workingVector7.x + workingVector6.w;
                workingVector6.xy = fragmentVectorConstants1[workingVector0.w+0].yz * workingVector6.ww;
              }
              workingVector7.xy = varyingTexCoord1.xy + workingVector6.xy;
              workingVector7.zw = varyingTexCoord1.xy + -workingVector6.xy;
              workingVector8.xy = max(fragmentVectorConstants1[workingVector1.z+0].xy, workingVector7.xy);
              workingVector8.xy = min(workingVector8.xy, workingVector5.xy);
              workingVector9.xy = max(fragmentVectorConstants1[workingVector1.z+0].xy, workingVector7.zw);
              workingVector8.zw = min(workingVector9.xy, workingVector5.xy);
              workingVector7.xyzw = workingVector4.zzzz ? workingVector8.xyzw : workingVector7.xyzw;
              workingVector7.xyzw = workingVector7.xyzw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zwzw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xyxy;
              workingVector8.xyzw = materialTexture0.Sample(textureSampler0, workingVector7.xy).xyzw;
              workingVector7.xyzw = materialTexture0.Sample(textureSampler0, workingVector7.zw).xyzw;
              if (workingVector5.z != 0) {
                workingVector9.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector8.xyz;
                workingVector10.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector8.xyz);
                workingVector11.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector8.xyz;
                workingVector11.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector11.xyz;
                workingVector11.xyz = log2(workingVector11.xyz);
                workingVector11.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector11.xyz;
                workingVector11.xyz = exp2(workingVector11.xyz);
                workingVector8.xyz = workingVector10.xyz ? workingVector11.xyz : workingVector9.xyz;
                workingVector9.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector7.xyz;
                workingVector10.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector7.xyz);
                workingVector11.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector7.xyz;
                workingVector11.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector11.xyz;
                workingVector11.xyz = log2(workingVector11.xyz);
                workingVector11.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector11.xyz;
                workingVector11.xyz = exp2(workingVector11.xyz);
                workingVector7.xyz = workingVector10.xyz ? workingVector11.xyz : workingVector9.xyz;
              } else {
                if (workingVector5.w != 0) {
                  workingVector9.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector8.xyz;
                  workingVector10.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector8.xyz);
                  workingVector11.xyz = log2(workingVector8.xyz);
                  workingVector11.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector11.xyz;
                  workingVector11.xyz = exp2(workingVector11.xyz);
                  workingVector11.xyz = workingVector11.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                  workingVector8.xyz = workingVector10.xyz ? workingVector11.xyz : workingVector9.xyz;
                  workingVector9.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector7.xyz;
                  workingVector10.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector7.xyz);
                  workingVector11.xyz = log2(workingVector7.xyz);
                  workingVector11.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector11.xyz;
                  workingVector11.xyz = exp2(workingVector11.xyz);
                  workingVector11.xyz = workingVector11.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                  workingVector7.xyz = workingVector10.xyz ? workingVector11.xyz : workingVector9.xyz;
                }
              }
              workingVector7.xyzw = workingVector8.xyzw + workingVector7.xyzw;
              workingVector2.xyzw = workingVector4.wwww * workingVector7.xyzw + workingVector2.xyzw;
              workingVector6.z = (int)workingVector6.z + 1;
            }
            workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w;
          } else {
            workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 7);
            if (workingVector1.z != 0) {
              workingVector1.zw = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector0.w+0].zw);
              workingVector1.z = (int)workingVector1.w | (int)workingVector1.z;
              workingVector3.xy = fragmentVectorConstants1[workingVector0.w+0].xy + fragmentVectorConstants1[workingVector0.w+0].zw;
              workingVector3.zw = max(fragmentVectorConstants1[workingVector0.w+0].xy, varyingTexCoord1.xy);
              workingVector3.xy = min(workingVector3.zw, workingVector3.xy);
              workingVector1.zw = workingVector1.zz ? workingVector3.xy : varyingTexCoord1.xy;
              workingVector1.zw = workingVector1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
              workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
              workingVector1.z = (int)workingVector1.x & 2;
              if (workingVector1.z != 0) {
                workingVector4.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector3.xyz;
                workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector3.xyz);
                workingVector6.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector3.xyz;
                workingVector6.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector6.xyz;
                workingVector6.xyz = log2(workingVector6.xyz);
                workingVector6.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector6.xyz;
                workingVector6.xyz = exp2(workingVector6.xyz);
                workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
              } else {
                workingVector1.z = (int)workingVector1.x & 16;
                if (workingVector1.z != 0) {
                  workingVector4.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
                  workingVector5.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector3.xyz);
                  workingVector6.xyz = log2(workingVector3.xyz);
                  workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
                  workingVector6.xyz = exp2(workingVector6.xyz);
                  workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                  workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
                }
              }
              workingVector4.w = max(9.99999975e-006, workingVector3.w);
              workingVector4.xyz = workingVector3.xyz / workingVector4.www;
              workingVector3.xyzw = (int4)workingVector0.wwww + int4(4,5,1,2);
              workingVector1.z = (int)workingVector0.w + 3;
              workingVector5.x = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector3.z+0].xyzw);
              workingVector5.y = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector3.w+0].xyzw);
              workingVector5.z = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector1.z+0].xyzw);
              workingVector5.w = dot(workingVector4.xyzw, fragmentVectorConstants1[workingVector3.x+0].xyzw);
              workingVector2.xyzw = fragmentVectorConstants1[workingVector3.y+0].xyzw + workingVector5.xyzw;
              workingVector1.z = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
              workingVector1.w = workingVector2.w + -workingVector1.z;
              workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].z * workingVector1.w + workingVector1.z;
              workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.z;
              workingVector1.w = saturate(varyingTexCoord1.z);
              workingVector1.y = workingVector1.z * workingVector1.w;
              workingVector2.w = 1;
            } else {
              workingVector1.zw = RD_COMPARISON_MASK((int2)workingVector0.zz == int2(9,12));
              workingVector1.z = (int)workingVector1.w | (int)workingVector1.z;
              if (workingVector1.z != 0) {
                workingVector3.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector3.xy).xyzw;
                workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
                workingVector4.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.yz).xyzw;
                workingVector3.yz = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
                workingVector5.xyzw = materialTexture2.Sample(textureSampler2, workingVector3.yz).yzxw;
                workingVector5.x = workingVector3.x;
                workingVector5.y = workingVector4.x;
                workingVector3.xyz = float3(-0.0625,-0.5,-0.5) + workingVector5.xyz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                workingVector3.x = materialTexture0.Sample(textureSampler0, workingVector3.xy).x;
                workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_1.zw + RD_UNIFORM_UV_TRANSFORM_ROW_1.xy;
                workingVector3.y = materialTexture1.Sample(textureSampler1, workingVector4.xy).x;
                workingVector4.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_2.zw + RD_UNIFORM_UV_TRANSFORM_ROW_2.xy;
                workingVector3.z = materialTexture2.Sample(textureSampler2, workingVector4.xy).x;
                workingVector3.xyz = float3(-0.0625,-0.5,-0.5) + workingVector3.xyz;
#endif
                workingVector2.x = dot(float2(1.16400003,1.59599996), workingVector3.xz);
                workingVector2.y = dot(float3(1.16400003,-0.391000003,-0.813000023), workingVector3.xyz);
                workingVector2.z = dot(float2(1.16400003,2.01799989), workingVector3.xy);
                workingVector1.z = (int)workingVector1.x & 2;
                if (workingVector1.z != 0) {
                  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                  workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
                  workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
                  workingVector5.xyz = log2(workingVector5.xyz);
                  workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
                  workingVector5.xyz = exp2(workingVector5.xyz);
                  workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                } else {
                  workingVector1.z = (int)workingVector1.x & 16;
                  if (workingVector1.z != 0) {
                    workingVector3.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                    workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                    workingVector5.xyz = log2(workingVector2.xyz);
                    workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
                    workingVector5.xyz = exp2(workingVector5.xyz);
                    workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                    workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                  }
                }
                if (workingVector1.w != 0) {
                  workingVector1.z = saturate(varyingTexCoord1.z);
                  workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.z;
                  workingVector3.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_3.zw + RD_UNIFORM_UV_TRANSFORM_ROW_3.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                  workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector3.xy).xyzw;
                  workingVector1.y = workingVector3.x * workingVector1.z;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                  workingVector1.w = materialTexture3.Sample(textureSampler3, workingVector3.xy).x;
                  workingVector1.y = workingVector1.z * workingVector1.w;
#endif
                } else {
                  workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w;
                }
                workingVector2.w = 1;
              } else {
                workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 11);
                if (workingVector1.z != 0) {
                  workingVector3.xy = varyingTexCoord2.xy;
                  workingVector3.z = 1;
                  workingVector1.z = dot(varyingTexCoord1.xyz, workingVector3.xyz);
                  workingVector1.z = min(1, abs(workingVector1.z));
                  workingVector1.z = 1 + -workingVector1.z;
                  workingVector1.y = saturate(varyingTexCoord1.w * workingVector1.z);
                  workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
                } else {
                  workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 19);
                  if (workingVector1.z != 0) {
                    workingVector1.zw = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
                    workingVector1.z = (int)workingVector0.w + 1;
                    workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].y * 0.5;
                    workingVector1.w = sqrt(workingVector1.w);
                    workingVector3.y = workingVector1.w * 0.5 + -0.899999976;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector1.z = materialTexture0.Sample(textureSampler0, workingVector1.zw).x;
                    workingVector1.w = (int)workingVector0.w + 1;
                    workingVector3.x = fragmentVectorConstants1[workingVector0.w+0].y * 0.5;
                    workingVector3.x = sqrt(workingVector3.x);
                    workingVector3.y = workingVector3.x * 0.5 + -0.899999976;
#endif
                    workingVector3.z = fragmentVectorConstants1[workingVector0.w+0].z / fragmentVectorConstants1[workingVector0.w+0].y;
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector3.z = workingVector3.z * workingVector1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector3.z = workingVector3.z * workingVector3.x;
#endif
                    workingVector3.w = workingVector3.z * 0.5 + workingVector3.y;
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector3.w = saturate(workingVector3.x * workingVector1.w + -workingVector3.w);
                    workingVector4.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw + -fragmentVectorConstants1[workingVector1.z+0].xyzw;
                    workingVector4.xyzw = workingVector3.wwww * workingVector4.xyzw + fragmentVectorConstants1[workingVector1.z+0].xyzw;
                    workingVector1.z = -workingVector3.z * 0.5 + workingVector3.y;
                    workingVector1.z = max(0, workingVector1.z);
                    workingVector1.z = saturate(workingVector3.x * workingVector1.w + -workingVector1.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector3.w = saturate(workingVector1.z * workingVector3.x + -workingVector3.w);
                    workingVector4.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw + -fragmentVectorConstants1[workingVector1.w+0].xyzw;
                    workingVector4.xyzw = workingVector3.wwww * workingVector4.xyzw + fragmentVectorConstants1[workingVector1.w+0].xyzw;
                    workingVector1.w = -workingVector3.z * 0.5 + workingVector3.y;
                    workingVector1.w = max(0, workingVector1.w);
                    workingVector1.z = saturate(workingVector1.z * workingVector3.x + -workingVector1.w);
#endif
                    workingVector2.xyzw = workingVector4.xyzw * workingVector1.zzzz;
                    workingVector1.y = 1;
                  } else {
                    workingVector1.zw = RD_COMPARISON_MASK((int2)workingVector0.zz == int2(32,35));
                    workingVector1.z = (int)workingVector1.w | (int)workingVector1.z;
                    if (workingVector1.z != 0) {
                      workingVector1.z = (int)fragmentVectorConstants1[workingVector0.y+0].x;
                      workingVector3.xy = (int2)workingVector1.zz & int2(1,2);
                      workingVector3.xy = workingVector3.xy ? float2(1,1) : float2(0,0);
                      if (workingVector1.w != 0) {
                        workingVector1.zw = frac(varyingTexCoord1.zw);
                        workingVector1.zw = fragmentVectorConstants1[workingVector0.w+0].zw * workingVector1.zw + fragmentVectorConstants1[workingVector0.w+0].xy;
                        workingVector1.zw = workingVector1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
                      } else {
                        workingVector1.zw = varyingTexCoord1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
                      }
                      workingVector1.z = (int)workingVector1.x & 2;
                      if (workingVector1.z != 0) {
                        workingVector4.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                        workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                        workingVector6.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
                        workingVector6.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector6.xyz;
                        workingVector6.xyz = log2(workingVector6.xyz);
                        workingVector6.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector6.xyz;
                        workingVector6.xyz = exp2(workingVector6.xyz);
                        workingVector2.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
                      } else {
                        workingVector1.z = (int)workingVector1.x & 16;
                        if (workingVector1.z != 0) {
                          workingVector4.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                          workingVector5.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                          workingVector6.xyz = log2(workingVector2.xyz);
                          workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
                          workingVector6.xyz = exp2(workingVector6.xyz);
                          workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                          workingVector2.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
                        }
                      }
                      workingVector1.z = workingVector2.w * -2 + 1;
                      workingVector1.z = workingVector3.x * workingVector1.z + workingVector2.w;
                      workingVector1.w = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                      workingVector1.z = workingVector1.z + -workingVector1.w;
                      workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].z * workingVector1.z + workingVector1.w;
                      workingVector1.w = 1 + -workingVector1.z;
                      workingVector2.w = workingVector3.y * workingVector1.w + workingVector1.z;
                      workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                      workingVector3.x = varyingTexCoord2.z;
                      workingVector3.y = fragmentVectorConstants1[workingVector0.x+0].y;
                      workingVector1.zw = workingVector1.zw / workingVector3.xy;
                      workingVector3.x = dot(workingVector1.zw, workingVector1.zw);
                      workingVector3.x = -1 + workingVector3.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
                      workingVector3.yz = ddx(workingVector1.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                      workingVector3.yz = ddx_coarse(workingVector1.zw);
#endif
                      workingVector4.xy = -workingVector1.zw;
#if RD_PLATFORM == RD_PLATFORM_SM40
                      workingVector4.xy = ddy(workingVector4.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                      workingVector4.xy = ddy_coarse(workingVector4.xy);
#endif
                      workingVector1.zw = workingVector1.zw + workingVector1.zw;
                      workingVector3.yz = workingVector1.zw * workingVector3.yz;
                      workingVector5.x = workingVector3.y + workingVector3.z;
                      workingVector1.zw = workingVector1.zw * workingVector4.xy;
                      workingVector5.y = workingVector1.z + workingVector1.w;
                      workingVector1.z = dot(workingVector5.xy, workingVector5.xy);
                      workingVector1.z = max(9.99999975e-005, workingVector1.z);
                      workingVector1.z = rsqrt(workingVector1.z);
                      workingVector1.z = saturate(-workingVector3.x * workingVector1.z + 0.5);
                      workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.z;
                    } else {
                      workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 33);
                      if (workingVector1.z != 0) {
                        workingVector1.z = min(fragmentVectorConstants1[workingVector0.w+0].y, fragmentVectorConstants1[workingVector0.w+0].x);
                        workingVector1.w = (int)workingVector0.w + 1;
                        workingVector3.xy = frac(varyingTexCoord1.zw);
                        workingVector3.xy = fragmentVectorConstants1[workingVector1.w+0].zw * workingVector3.xy + fragmentVectorConstants1[workingVector1.w+0].xy;
                        workingVector3.xy = workingVector3.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector3.xy).xyzw;
                        workingVector1.w = (int)workingVector1.x & 2;
                        if (workingVector1.w != 0) {
                          workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                          workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                          workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
                          workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
                          workingVector5.xyz = log2(workingVector5.xyz);
                          workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
                          workingVector5.xyz = exp2(workingVector5.xyz);
                          workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                        } else {
                          workingVector1.w = (int)workingVector1.x & 16;
                          if (workingVector1.w != 0) {
                            workingVector3.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                            workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                            workingVector5.xyz = log2(workingVector2.xyz);
                            workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
                            workingVector5.xyz = exp2(workingVector5.xyz);
                            workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                            workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                          }
                        }
                        workingVector1.w = 1 + -workingVector2.w;
                        workingVector3.x = workingVector2.w + -workingVector1.w;
                        workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].x * workingVector3.x + workingVector1.w;
                        workingVector3.x = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                        workingVector1.w = -workingVector3.x + workingVector1.w;
                        workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].z * workingVector1.w + workingVector3.x;
                        workingVector3.x = 1 + -workingVector1.w;
                        workingVector2.w = fragmentVectorConstants1[workingVector0.x+0].y * workingVector3.x + workingVector1.w;
                        workingVector3.xy = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                        workingVector1.w = dot(workingVector3.xy, workingVector3.xy);
                        workingVector1.w = sqrt(workingVector1.w);
                        workingVector1.w = -varyingTexCoord2.z + workingVector1.w;
                        workingVector1.z = saturate(-workingVector1.z * workingVector1.w + 0.5);
                        workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.z;
                      } else {
                        workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 23);
                        if (workingVector1.z != 0) {
                          workingVector1.zw = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
                          workingVector1.z = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                          workingVector1.z = workingVector1.z * 0.5 + 0.5;
                          workingVector1.w = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                          workingVector3.y = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = workingVector1.w + -workingVector3.y;
                          workingVector3.y = workingVector3.x + -workingVector3.y;
                          workingVector1.w = 1 / workingVector1.w;
                          workingVector1.w = saturate(workingVector3.y * workingVector1.w);
                          workingVector3.y = workingVector1.w * -2 + 3;
                          workingVector1.w = workingVector1.w * workingVector1.w;
                          workingVector1.w = workingVector3.y * workingVector1.w;
                          workingVector3.y = RD_COMPARISON_MASK(0 >= workingVector1.w);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector1.z = materialTexture0.Sample(textureSampler0, workingVector1.zw).x;
                          workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                          workingVector1.w = workingVector1.w * 0.5 + 0.5;
                          workingVector3.x = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector3.y = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector3.x;
                          workingVector3.x = fragmentVectorConstants1[workingVector0.w+0].x + workingVector3.x;
                          workingVector3.x = workingVector3.x + -workingVector3.y;
                          workingVector3.y = -workingVector3.y + workingVector1.z;
                          workingVector3.x = 1 / workingVector3.x;
                          workingVector3.x = saturate(workingVector3.y * workingVector3.x);
                          workingVector3.y = workingVector3.x * -2 + 3;
                          workingVector3.x = workingVector3.x * workingVector3.x;
                          workingVector3.x = workingVector3.y * workingVector3.x;
                          workingVector3.y = RD_COMPARISON_MASK(0 >= workingVector3.x);
#endif
                          if (workingVector3.y != 0) discard;
                          workingVector3.y = (int)workingVector0.w + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector3.z = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                          workingVector1.z = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                          workingVector1.z = workingVector1.z + -workingVector3.z;
                          workingVector3.x = workingVector3.x + -workingVector3.z;
                          workingVector1.z = 1 / workingVector1.z;
                          workingVector1.z = saturate(workingVector3.x * workingVector1.z);
                          workingVector3.x = workingVector1.z * -2 + 3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector3.z = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = workingVector1.w + -workingVector3.z;
                          workingVector1.z = -workingVector3.z + workingVector1.z;
                          workingVector1.w = 1 / workingVector1.w;
                          workingVector1.z = saturate(workingVector1.z * workingVector1.w);
                          workingVector1.w = workingVector1.z * -2 + 3;
#endif
                          workingVector1.z = workingVector1.z * workingVector1.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector1.z = workingVector3.x * workingVector1.z;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector1.z = workingVector1.w * workingVector1.z;
#endif
                          workingVector4.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw + -fragmentVectorConstants1[workingVector3.y+0].xyzw;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector3.xyzw = workingVector1.zzzz * workingVector4.xyzw + fragmentVectorConstants1[workingVector3.y+0].xyzw;
                          workingVector2.xyzw = workingVector3.xyzw * workingVector1.wwww;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector4.xyzw = workingVector1.zzzz * workingVector4.xyzw + fragmentVectorConstants1[workingVector3.y+0].xyzw;
                          workingVector2.xyzw = workingVector4.xyzw * workingVector3.xxxx;
#endif
                          workingVector1.y = 1;
                        } else {
                          workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 24);
                          if (workingVector1.z != 0) {
                            workingVector1.zw = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_3.zw + RD_UNIFORM_UV_TRANSFORM_ROW_3.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                            workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector1.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            workingVector3.xyz = materialTexture3.Sample(textureSampler3, workingVector1.zw).xyz;
#endif
                            workingVector1.z = min(workingVector3.x, workingVector3.y);
                            workingVector1.w = max(workingVector3.x, workingVector3.y);
                            workingVector1.w = min(workingVector1.w, workingVector3.z);
                            workingVector1.z = max(workingVector1.z, workingVector1.w);
                            workingVector1.w = 0.5 + -varyingTexCoord1.z;
                            workingVector3.x = 0.5 + varyingTexCoord1.z;
                            workingVector3.x = workingVector3.x + -workingVector1.w;
                            workingVector1.z = workingVector1.z + -workingVector1.w;
                            workingVector1.w = 1 / workingVector3.x;
                            workingVector1.z = saturate(workingVector1.z * workingVector1.w);
                            workingVector1.w = workingVector1.z * -2 + 3;
                            workingVector1.z = workingVector1.z * workingVector1.z;
                            workingVector1.z = workingVector1.w * workingVector1.z;
                            workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw * workingVector1.zzzz;
                            workingVector1.y = 1;
                          } else {
                            workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 25);
                            if (workingVector1.z != 0) {
                              workingVector1.zw = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                              workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                              workingVector3.xyz = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyz;
#endif
                              workingVector1.z = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                              workingVector1.z = workingVector1.z * 0.5 + 0.5;
                              workingVector1.w = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                              workingVector3.w = min(workingVector3.x, workingVector3.y);
                              workingVector3.x = max(workingVector3.x, workingVector3.y);
                              workingVector3.x = min(workingVector3.x, workingVector3.z);
                              workingVector3.x = max(workingVector3.w, workingVector3.x);
                              workingVector3.y = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                              workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                              workingVector1.w = workingVector1.w + -workingVector3.y;
                              workingVector3.y = workingVector3.x + -workingVector3.y;
                              workingVector1.w = 1 / workingVector1.w;
                              workingVector1.w = saturate(workingVector3.y * workingVector1.w);
                              workingVector3.y = workingVector1.w * -2 + 3;
                              workingVector1.w = workingVector1.w * workingVector1.w;
                              workingVector1.w = workingVector3.y * workingVector1.w;
                              workingVector3.y = RD_COMPARISON_MASK(0 >= workingVector1.w);
                              if (workingVector3.y != 0) discard;
                              workingVector3.y = (int)workingVector0.w + 1;
                              workingVector3.z = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                              workingVector1.z = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.z;
                              workingVector1.z = workingVector1.z + -workingVector3.z;
                              workingVector3.x = workingVector3.x + -workingVector3.z;
                              workingVector1.z = 1 / workingVector1.z;
                              workingVector1.z = saturate(workingVector3.x * workingVector1.z);
                              workingVector3.x = workingVector1.z * -2 + 3;
                              workingVector1.z = workingVector1.z * workingVector1.z;
                              workingVector1.z = workingVector3.x * workingVector1.z;
                              workingVector4.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw + -fragmentVectorConstants1[workingVector3.y+0].xyzw;
                              workingVector3.xyzw = workingVector1.zzzz * workingVector4.xyzw + fragmentVectorConstants1[workingVector3.y+0].xyzw;
                              workingVector2.xyzw = workingVector3.xyzw * workingVector1.wwww;
                              workingVector1.y = 1;
                            } else {
                              workingVector0.z = RD_COMPARISON_MASK((int)workingVector0.z == 31);
                              if (workingVector0.z != 0) {
                                workingVector1.zw = varyingTexCoord1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                                workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
                                workingVector0.z = (int)workingVector1.x & 2;
                                if (workingVector0.z != 0) {
                                  workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                                  workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                                  workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
                                  workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
                                  workingVector5.xyz = log2(workingVector5.xyz);
                                  workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
                                  workingVector5.xyz = exp2(workingVector5.xyz);
                                  workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                                } else {
                                  workingVector0.z = (int)workingVector1.x & 16;
                                  if (workingVector0.z != 0) {
                                    workingVector3.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                                    workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                                    workingVector5.xyz = log2(workingVector2.xyz);
                                    workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
                                    workingVector5.xyz = exp2(workingVector5.xyz);
                                    workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                                    workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                                  }
                                }
                                workingVector0.z = 1 + -workingVector2.w;
                                workingVector1.z = workingVector2.w + -workingVector0.z;
                                workingVector0.z = fragmentVectorConstants1[workingVector0.y+0].x * workingVector1.z + workingVector0.z;
                                workingVector1.z = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                                workingVector0.z = -workingVector1.z + workingVector0.z;
                                workingVector0.z = fragmentVectorConstants1[workingVector0.y+0].z * workingVector0.z + workingVector1.z;
                                workingVector1.z = 1 + -workingVector0.z;
                                workingVector2.w = fragmentVectorConstants1[workingVector0.x+0].y * workingVector1.z + workingVector0.z;
                                workingVector0.x = min(fragmentVectorConstants1[workingVector0.w+0].y, fragmentVectorConstants1[workingVector0.w+0].x);
                                workingVector0.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                                workingVector0.z = dot(workingVector0.zw, workingVector0.zw);
                                workingVector0.z = sqrt(workingVector0.z);
                                workingVector0.z = -varyingTexCoord2.z + workingVector0.z;
                                workingVector0.x = saturate(-workingVector0.x * workingVector0.z + 0.5);
                                workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector0.x;
                              } else {
                                workingVector2.xyzw = fragmentVectorConstants1[workingVector0.y+0].xyzw;
                                workingVector1.y = 1;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  workingVector0.x = (int)workingVector1.x & 64;
  workingVector0.yzw = workingVector2.xyz * workingVector2.www;
  workingVector2.xyz = workingVector0.xxx ? workingVector0.yzw : workingVector2.xyz;
  fragmentColor0.xyzw = workingVector2.xyzw * workingVector1.yyyy;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
    uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue + 1u;
    uint scalarValue1 = uint(int(fragmentConstants[bitwiseValue].x));
    uint sumValue1 = uint(int(fragmentConstants[uint(max(int(0u), int(scalarValue1 + 4294967295u)))].y));
    float nonlinearValue;
    float intermediateValue3;
    float intermediateValue8;
    float intermediateValue13;
    float intermediateValue18;
    if (scalarValue == 1u)
    {
        float scalarValue2 = varyingTexCoord2.x - varyingTexCoord1.x;
        float sumValue2 = varyingTexCoord2.y - varyingTexCoord1.y;
        nonlinearValue = min(max((varyingTexCoord1.z + 0.5f) - sqrt((sumValue2 * sumValue2) + (scalarValue2 * scalarValue2)), 0.0f), 1.0f);
        intermediateValue3 = fragmentConstants[sumValue].x;
        intermediateValue8 = fragmentConstants[sumValue].y;
        intermediateValue13 = fragmentConstants[sumValue].z;
        intermediateValue18 = fragmentConstants[sumValue].w;
    }
    else
    {
        float branchMergedValue6;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        if (scalarValue == 2u)
        {
            float scalarValue3 = varyingTexCoord2.x - varyingTexCoord1.x;
            float sumValue3 = varyingTexCoord2.y - varyingTexCoord1.y;
            float nonlinearValue1 = sqrt((sumValue3 * sumValue3) + (scalarValue3 * scalarValue3));
            float sumValue4 = varyingTexCoord1.z + 0.5f;
            branchMergedValue6 = fragmentConstants[sumValue].w;
            branchMergedValue11 = fragmentConstants[sumValue].z;
            branchMergedValue12 = fragmentConstants[sumValue].y;
            branchMergedValue13 = fragmentConstants[sumValue].x;
            branchMergedValue14 = (1.0f - min(max((sumValue4 - varyingTexCoord1.w) - nonlinearValue1, 0.0f), 1.0f)) * min(max(sumValue4 - nonlinearValue1, 0.0f), 1.0f);
        }
        else
        {
            float branchMergedValue43;
            float branchMergedValue54;
            float branchMergedValue55;
            float branchMergedValue56;
            float branchMergedValue57;
            if (scalarValue == 4u)
            {
                float scalarValue4 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                float productValue4 = ((ddx_coarse(quotientValue) * quotientValue) + (ddx_coarse(scalarValue4) * scalarValue4)) * 2.0f;
                float productValue5 = ((ddy_coarse((-0.0f) - quotientValue) * quotientValue) + (ddy_coarse((-0.0f) - scalarValue4) * scalarValue4)) * 2.0f;
                branchMergedValue43 = fragmentConstants[sumValue].w;
                branchMergedValue54 = fragmentConstants[sumValue].z;
                branchMergedValue55 = fragmentConstants[sumValue].y;
                branchMergedValue56 = fragmentConstants[sumValue].x;
                branchMergedValue57 = clamp(0.5f - (rsqrt(max(dot(float2(productValue4, productValue5), float2(productValue4, productValue5)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(scalarValue4, quotientValue), float2(scalarValue4, quotientValue)) + (-1.0f))), 0.0f, 1.0f);
            }
            else
            {
                float branchMergedValue73;
                float branchMergedValue75;
                float branchMergedValue76;
                float branchMergedValue77;
                float branchMergedValue78;
                if (scalarValue == 5u)
                {
                    float scalarValue5 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue5 = varyingTexCoord2.y - varyingTexCoord1.y;
                    float productValue6 = fragmentConstants[bitwiseValue].y * 0.5f;
                    float quotientValue1 = scalarValue5 / (productValue6 + varyingTexCoord1.z);
                    float quotientValue2 = sumValue5 / (productValue6 + varyingTexCoord1.w);
                    float productValue7 = ((ddx_coarse(quotientValue2) * quotientValue2) + (ddx_coarse(quotientValue1) * quotientValue1)) * 2.0f;
                    float productValue8 = ((ddy_coarse((-0.0f) - quotientValue2) * quotientValue2) + (ddy_coarse((-0.0f) - quotientValue1) * quotientValue1)) * 2.0f;
                    float quotientValue3 = scalarValue5 / (varyingTexCoord1.z - productValue6);
                    float quotientValue4 = sumValue5 / (varyingTexCoord1.w - productValue6);
                    float productValue9 = ((ddx_coarse(quotientValue4) * quotientValue4) + (ddx_coarse(quotientValue3) * quotientValue3)) * 2.0f;
                    float productValue10 = ((ddy_coarse((-0.0f) - quotientValue4) * quotientValue4) + (ddy_coarse((-0.0f) - quotientValue3) * quotientValue3)) * 2.0f;
                    branchMergedValue73 = fragmentConstants[sumValue].w;
                    branchMergedValue75 = fragmentConstants[sumValue].z;
                    branchMergedValue76 = fragmentConstants[sumValue].y;
                    branchMergedValue77 = fragmentConstants[sumValue].x;
                    branchMergedValue78 = clamp((rsqrt(max(dot(float2(productValue9, productValue10), float2(productValue9, productValue10)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue3, quotientValue4), float2(quotientValue3, quotientValue4)) + (-1.0f))) + 0.5f, 0.0f, 1.0f) * clamp(0.5f - (rsqrt(max(dot(float2(productValue7, productValue8), float2(productValue7, productValue8)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue1, quotientValue2), float2(quotientValue1, quotientValue2)) + (-1.0f))), 0.0f, 1.0f);
                }
                else
                {
                    float branchMergedValue84;
                    float branchMergedValue85;
                    float branchMergedValue86;
                    float branchMergedValue87;
                    float branchMergedValue88;
                    if (scalarValue == 6u)
                    {
                        uint scalarValue6 = scalarValue1 + 1u;
                        float comparisonValue = (fragmentConstants[scalarValue1].x > 3.0f) ? (fragmentConstants[scalarValue1].x * 0.307196319103240966796875f) : ((fragmentConstants[scalarValue1].x * 0.100000001490116119384765625f) + 0.60000002384185791015625f);
                        uint bitwiseValue1 = uint(int(fragmentConstants[scalarValue1].x)) << 1u;
                        uint bitwiseValue2 = bitwiseValue1 | 1u;
                        uint quotientValue5 = uint(int(bitwiseValue2) / int(2u));
                        float intermediateValue26;
                        if (int(bitwiseValue2) > int(0u))
                        {
                            uint bitwiseValue3 = bitwiseValue1 | 1u;
                            float intermediateValue27;
                            uint intermediateValue28;
                            intermediateValue27 = 0.0f;
                            intermediateValue28 = 0u;
                            float exponentialValue;
                            for (;;)
                            {
                                float quotientValue6 = float(int(intermediateValue28 - quotientValue5)) / comparisonValue;
                                exponentialValue = (exp2((quotientValue6 * quotientValue6) * (-0.721347510814666748046875f)) / (comparisonValue * 2.5066282749176025390625f)) + intermediateValue27;
                                uint sumValue6 = intermediateValue28 + 1u;
                                if (sumValue6 == bitwiseValue3)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue27 = exponentialValue;
                                    intermediateValue28 = sumValue6;
                                }
                            }
                            intermediateValue26 = exponentialValue;
                        }
                        else
                        {
                            intermediateValue26 = 0.0f;
                        }
                        float sumValue7 = fragmentConstants[scalarValue1].x + 1.0f;
                        uint productValue11 = uint(int(sumValue7 - (floor(sumValue7 * 0.5f) * 2.0f)));
                        uint productValue12 = uint(int((fragmentConstants[scalarValue1].x * 0.5f) + 1.0f));
                        float branchMergedValue90;
                        float branchMergedValue95;
                        float branchMergedValue96;
                        float branchMergedValue97;
                        float branchMergedValue98;
                        if (int(productValue12) > int(0u))
                        {
                            float quotientValue7 = 0.1994711458683013916015625f / (intermediateValue26 * comparisonValue);
                            float productValue;
                            float productValue1;
                            float productValue2;
                            float productValue3;
                            float intermediateValue54;
                            float intermediateValue58;
                            float intermediateValue65;
                            float intermediateValue66;
                            float intermediateValue67;
                            float intermediateValue68;
                            float intermediateValue69;
                            float intermediateValue70;
                            float intermediateValue34;
                            float productValue14;
                            float productValue15;
                            float scalarValue7 = quotientValue7;
                            float scalarValue8 = 0.0f;
                            float scalarValue9 = 0.0f;
                            uint scalarValue10 = 0u;
                            float scalarValue11 = 0.0f;
                            float scalarValue12 = 0.0f;
                            float scalarValue13 = 0.0f;
                            float scalarValue14 = 0.0f;
                            bool comparisonValue2;
                            for (;;)
                            {
                                comparisonValue2 = (productValue11 != 1u) || (scalarValue10 != 0u);
                                if (comparisonValue2)
                                {
                                    uint bitwiseValue4 = scalarValue10 << 1u;
                                    float quotientValue8 = float(int(productValue11 - bitwiseValue4)) / comparisonValue;
                                    float productValue13 = (comparisonValue * 2.5066282749176025390625f) * intermediateValue26;
                                    float bitwiseValue5 = float(int(productValue11 - (bitwiseValue4 | 1u))) / comparisonValue;
                                    float exponentialValue1 = exp2((bitwiseValue5 * bitwiseValue5) * (-0.721347510814666748046875f)) / productValue13;
                                    float exponentialValue2 = exponentialValue1 + ((scalarValue10 == 0u) ? scalarValue7 : (exp2((quotientValue8 * quotientValue8) * (-0.721347510814666748046875f)) / productValue13));
                                    float quotientValue9 = (exponentialValue1 / exponentialValue2) + float(int(bitwiseValue4 - productValue11));
                                    intermediateValue34 = exponentialValue2;
                                    productValue14 = quotientValue9 * fragmentConstants[scalarValue1].y;
                                    productValue15 = quotientValue9 * fragmentConstants[scalarValue1].z;
                                }
                                else
                                {
                                    intermediateValue34 = scalarValue7;
                                    productValue14 = scalarValue8;
                                    productValue15 = scalarValue9;
                                }
                                float sumValue10 = productValue14 + varyingTexCoord1.x;
                                float sumValue11 = productValue15 + varyingTexCoord1.y;
                                float sumValue12 = varyingTexCoord1.x - productValue14;
                                float sumValue13 = varyingTexCoord1.y - productValue15;
                                float intermediateValue47;
                                float intermediateValue48;
                                float intermediateValue49;
                                float intermediateValue50;
                                if ((fragmentConstants[scalarValue6].z != (-1.0f)) || (fragmentConstants[scalarValue6].w != (-1.0f)))
                                {
                                    float sumValue14 = fragmentConstants[scalarValue6].x + fragmentConstants[scalarValue6].z;
                                    float sumValue15 = fragmentConstants[scalarValue6].y + fragmentConstants[scalarValue6].w;
                                    intermediateValue47 = min(max(sumValue10, fragmentConstants[scalarValue6].x), sumValue14);
                                    intermediateValue48 = min(max(sumValue11, fragmentConstants[scalarValue6].y), sumValue15);
                                    intermediateValue49 = min(max(sumValue12, fragmentConstants[scalarValue6].x), sumValue14);
                                    intermediateValue50 = min(max(sumValue13, fragmentConstants[scalarValue6].y), sumValue15);
                                }
                                else
                                {
                                    intermediateValue47 = sumValue10;
                                    intermediateValue48 = sumValue11;
                                    intermediateValue49 = sumValue12;
                                    intermediateValue50 = sumValue13;
                                }
                                float4 sampledTextureValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * intermediateValue47) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * intermediateValue48) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                float scalarValue15 = sampledTextureValue.x;
                                float scalarValue16 = sampledTextureValue.y;
                                float scalarValue17 = sampledTextureValue.z;
                                intermediateValue54 = sampledTextureValue.w;
                                float4 sampledTextureValue1 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * intermediateValue49) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * intermediateValue50) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                float scalarValue18 = sampledTextureValue1.x;
                                float scalarValue19 = sampledTextureValue1.y;
                                float scalarValue20 = sampledTextureValue1.z;
                                intermediateValue58 = sampledTextureValue1.w;
                                float branchMergedValue;
                                float branchMergedValue1;
                                float branchMergedValue2;
                                float branchMergedValue3;
                                float branchMergedValue4;
                                float branchMergedValue5;
                                if ((sumValue1 & 2u) == 0u)
                                {
                                    float branchMergedValue41;
                                    float branchMergedValue44;
                                    float branchMergedValue45;
                                    float branchMergedValue46;
                                    float branchMergedValue47;
                                    float branchMergedValue48;
                                    if ((sumValue1 & 16u) == 0u)
                                    {
                                        branchMergedValue41 = scalarValue20;
                                        branchMergedValue44 = scalarValue19;
                                        branchMergedValue45 = scalarValue18;
                                        branchMergedValue46 = scalarValue16;
                                        branchMergedValue47 = scalarValue17;
                                        branchMergedValue48 = scalarValue15;
                                    }
                                    else
                                    {
                                        float exponentialValue12;
                                        if (!(scalarValue15 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue12 = (exp2(log2(scalarValue15) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue12 = scalarValue15 * 12.9200000762939453125f;
                                        }
                                        float exponentialValue14;
                                        if (!(scalarValue16 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue14 = (exp2(log2(scalarValue16) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue14 = scalarValue16 * 12.9200000762939453125f;
                                        }
                                        float exponentialValue16;
                                        if (!(scalarValue17 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue16 = (exp2(log2(scalarValue17) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue16 = scalarValue17 * 12.9200000762939453125f;
                                        }
                                        float exponentialValue18;
                                        if (!(scalarValue18 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue18 = (exp2(log2(scalarValue18) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue18 = scalarValue18 * 12.9200000762939453125f;
                                        }
                                        float exponentialValue20;
                                        if (!(scalarValue19 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue20 = (exp2(log2(scalarValue19) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue20 = scalarValue19 * 12.9200000762939453125f;
                                        }
                                        float branchMergedValue74;
                                        float branchMergedValue79;
                                        float branchMergedValue80;
                                        float branchMergedValue81;
                                        float branchMergedValue82;
                                        float branchMergedValue83;
                                        if (!(scalarValue20 <= 0.003130800090730190277099609375f))
                                        {
                                            branchMergedValue74 = (exp2(log2(scalarValue20) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                            branchMergedValue79 = exponentialValue20;
                                            branchMergedValue80 = exponentialValue18;
                                            branchMergedValue81 = exponentialValue14;
                                            branchMergedValue82 = exponentialValue16;
                                            branchMergedValue83 = exponentialValue12;
                                        }
                                        else
                                        {
                                            branchMergedValue74 = scalarValue20 * 12.9200000762939453125f;
                                            branchMergedValue79 = exponentialValue20;
                                            branchMergedValue80 = exponentialValue18;
                                            branchMergedValue81 = exponentialValue14;
                                            branchMergedValue82 = exponentialValue16;
                                            branchMergedValue83 = exponentialValue12;
                                        }
                                        branchMergedValue41 = branchMergedValue74;
                                        branchMergedValue44 = branchMergedValue79;
                                        branchMergedValue45 = branchMergedValue80;
                                        branchMergedValue46 = branchMergedValue81;
                                        branchMergedValue47 = branchMergedValue82;
                                        branchMergedValue48 = branchMergedValue83;
                                    }
                                    branchMergedValue = branchMergedValue41;
                                    branchMergedValue1 = branchMergedValue44;
                                    branchMergedValue2 = branchMergedValue45;
                                    branchMergedValue3 = branchMergedValue46;
                                    branchMergedValue4 = branchMergedValue47;
                                    branchMergedValue5 = branchMergedValue48;
                                }
                                else
                                {
                                    float exponentialValue11;
                                    if (!(scalarValue15 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue11 = exp2(log2((scalarValue15 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue11 = scalarValue15 * 0.077399380505084991455078125f;
                                    }
                                    float exponentialValue13;
                                    if (!(scalarValue16 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue13 = exp2(log2((scalarValue16 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue13 = scalarValue16 * 0.077399380505084991455078125f;
                                    }
                                    float exponentialValue15;
                                    if (!(scalarValue17 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue15 = exp2(log2((scalarValue17 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue15 = scalarValue17 * 0.077399380505084991455078125f;
                                    }
                                    float exponentialValue17;
                                    if (!(scalarValue18 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue17 = exp2(log2((scalarValue18 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue17 = scalarValue18 * 0.077399380505084991455078125f;
                                    }
                                    float exponentialValue19;
                                    if (!(scalarValue19 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue19 = exp2(log2((scalarValue19 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue19 = scalarValue19 * 0.077399380505084991455078125f;
                                    }
                                    float branchMergedValue42;
                                    float branchMergedValue49;
                                    float branchMergedValue50;
                                    float branchMergedValue51;
                                    float branchMergedValue52;
                                    float branchMergedValue53;
                                    if (!(scalarValue20 <= 0.040449999272823333740234375f))
                                    {
                                        branchMergedValue42 = exp2(log2((scalarValue20 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                        branchMergedValue49 = exponentialValue19;
                                        branchMergedValue50 = exponentialValue17;
                                        branchMergedValue51 = exponentialValue13;
                                        branchMergedValue52 = exponentialValue15;
                                        branchMergedValue53 = exponentialValue11;
                                    }
                                    else
                                    {
                                        branchMergedValue42 = scalarValue20 * 0.077399380505084991455078125f;
                                        branchMergedValue49 = exponentialValue19;
                                        branchMergedValue50 = exponentialValue17;
                                        branchMergedValue51 = exponentialValue13;
                                        branchMergedValue52 = exponentialValue15;
                                        branchMergedValue53 = exponentialValue11;
                                    }
                                    branchMergedValue = branchMergedValue42;
                                    branchMergedValue1 = branchMergedValue49;
                                    branchMergedValue2 = branchMergedValue50;
                                    branchMergedValue3 = branchMergedValue51;
                                    branchMergedValue4 = branchMergedValue52;
                                    branchMergedValue5 = branchMergedValue53;
                                }
                                intermediateValue70 = branchMergedValue;
                                intermediateValue69 = branchMergedValue1;
                                intermediateValue68 = branchMergedValue2;
                                intermediateValue66 = branchMergedValue3;
                                intermediateValue67 = branchMergedValue4;
                                intermediateValue65 = branchMergedValue5;
                                productValue = ((intermediateValue68 + intermediateValue65) * intermediateValue34) + scalarValue11;
                                productValue1 = ((intermediateValue69 + intermediateValue66) * intermediateValue34) + scalarValue12;
                                productValue2 = ((intermediateValue70 + intermediateValue67) * intermediateValue34) + scalarValue13;
                                productValue3 = ((intermediateValue58 + intermediateValue54) * intermediateValue34) + scalarValue14;
                                uint sumValue16 = scalarValue10 + 1u;
                                if (sumValue16 == productValue12)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue7 = intermediateValue34;
                                    scalarValue8 = productValue14;
                                    scalarValue9 = productValue15;
                                    scalarValue10 = sumValue16;
                                    scalarValue11 = productValue;
                                    scalarValue12 = productValue1;
                                    scalarValue13 = productValue2;
                                    scalarValue14 = productValue3;
                                    continue;
                                }
                            }
                            branchMergedValue90 = productValue3;
                            branchMergedValue95 = productValue2;
                            branchMergedValue96 = productValue1;
                            branchMergedValue97 = productValue;
                            branchMergedValue98 = fragmentConstants[sumValue].w;
                        }
                        else
                        {
                            branchMergedValue90 = 0.0f;
                            branchMergedValue95 = 0.0f;
                            branchMergedValue96 = 0.0f;
                            branchMergedValue97 = 0.0f;
                            branchMergedValue98 = fragmentConstants[sumValue].w;
                        }
                        branchMergedValue84 = branchMergedValue90;
                        branchMergedValue85 = branchMergedValue95;
                        branchMergedValue86 = branchMergedValue96;
                        branchMergedValue87 = branchMergedValue97;
                        branchMergedValue88 = branchMergedValue98;
                    }
                    else
                    {
                        float branchMergedValue89;
                        float branchMergedValue91;
                        float branchMergedValue92;
                        float branchMergedValue93;
                        float branchMergedValue94;
                        if (scalarValue == 7u)
                        {
                            float sumValue8;
                            float sumValue9;
                            if ((fragmentConstants[scalarValue1].z != (-1.0f)) || (fragmentConstants[scalarValue1].w != (-1.0f)))
                            {
                                sumValue8 = min(max(varyingTexCoord1.x, fragmentConstants[scalarValue1].x), fragmentConstants[scalarValue1].x + fragmentConstants[scalarValue1].z);
                                sumValue9 = min(max(varyingTexCoord1.y, fragmentConstants[scalarValue1].y), fragmentConstants[scalarValue1].y + fragmentConstants[scalarValue1].w);
                            }
                            else
                            {
                                sumValue8 = varyingTexCoord1.x;
                                sumValue9 = varyingTexCoord1.y;
                            }
                            float4 sampledTextureValue2 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * sumValue8) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * sumValue9) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                            float scalarValue21 = sampledTextureValue2.x;
                            float scalarValue22 = sampledTextureValue2.y;
                            float scalarValue23 = sampledTextureValue2.z;
                            float intermediateValue42;
                            float intermediateValue43;
                            float intermediateValue44;
                            if ((sumValue1 & 2u) == 0u)
                            {
                                float branchMergedValue7;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if ((sumValue1 & 16u) == 0u)
                                {
                                    branchMergedValue7 = scalarValue23;
                                    branchMergedValue21 = scalarValue22;
                                    branchMergedValue22 = scalarValue21;
                                }
                                else
                                {
                                    float exponentialValue4;
                                    if (!(scalarValue21 <= 0.003130800090730190277099609375f))
                                    {
                                        exponentialValue4 = (exp2(log2(scalarValue21) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                    }
                                    else
                                    {
                                        exponentialValue4 = scalarValue21 * 12.9200000762939453125f;
                                    }
                                    float exponentialValue6;
                                    if (!(scalarValue22 <= 0.003130800090730190277099609375f))
                                    {
                                        exponentialValue6 = (exp2(log2(scalarValue22) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                    }
                                    else
                                    {
                                        exponentialValue6 = scalarValue22 * 12.9200000762939453125f;
                                    }
                                    float branchMergedValue58;
                                    float branchMergedValue62;
                                    float branchMergedValue63;
                                    if (!(scalarValue23 <= 0.003130800090730190277099609375f))
                                    {
                                        branchMergedValue58 = (exp2(log2(scalarValue23) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        branchMergedValue62 = exponentialValue6;
                                        branchMergedValue63 = exponentialValue4;
                                    }
                                    else
                                    {
                                        branchMergedValue58 = scalarValue23 * 12.9200000762939453125f;
                                        branchMergedValue62 = exponentialValue6;
                                        branchMergedValue63 = exponentialValue4;
                                    }
                                    branchMergedValue7 = branchMergedValue58;
                                    branchMergedValue21 = branchMergedValue62;
                                    branchMergedValue22 = branchMergedValue63;
                                }
                                intermediateValue42 = branchMergedValue22;
                                intermediateValue43 = branchMergedValue21;
                                intermediateValue44 = branchMergedValue7;
                            }
                            else
                            {
                                float exponentialValue3;
                                if (!(scalarValue21 <= 0.040449999272823333740234375f))
                                {
                                    exponentialValue3 = exp2(log2((scalarValue21 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                }
                                else
                                {
                                    exponentialValue3 = scalarValue21 * 0.077399380505084991455078125f;
                                }
                                float exponentialValue5;
                                if (!(scalarValue22 <= 0.040449999272823333740234375f))
                                {
                                    exponentialValue5 = exp2(log2((scalarValue22 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                }
                                else
                                {
                                    exponentialValue5 = scalarValue22 * 0.077399380505084991455078125f;
                                }
                                float branchMergedValue8;
                                float branchMergedValue23;
                                float branchMergedValue24;
                                if (!(scalarValue23 <= 0.040449999272823333740234375f))
                                {
                                    branchMergedValue8 = exp2(log2((scalarValue23 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    branchMergedValue23 = exponentialValue5;
                                    branchMergedValue24 = exponentialValue3;
                                }
                                else
                                {
                                    branchMergedValue8 = scalarValue23 * 0.077399380505084991455078125f;
                                    branchMergedValue23 = exponentialValue5;
                                    branchMergedValue24 = exponentialValue3;
                                }
                                intermediateValue42 = branchMergedValue24;
                                intermediateValue43 = branchMergedValue23;
                                intermediateValue44 = branchMergedValue8;
                            }
                            float scalarValue24 = max(sampledTextureValue2.w, 9.9999997473787516355514526367188e-06f);
                            float quotientValue10 = intermediateValue42 / scalarValue24;
                            float quotientValue11 = intermediateValue43 / scalarValue24;
                            float quotientValue12 = intermediateValue44 / scalarValue24;
                            uint sumValue17 = scalarValue1 + 5u;
                            float dotProductValue = dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue24), float4(fragmentConstants[scalarValue1 + 1u])) + fragmentConstants[sumValue17].x;
                            float dotProductValue1 = dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue24), float4(fragmentConstants[scalarValue1 + 2u])) + fragmentConstants[sumValue17].y;
                            float dotProductValue2 = dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue24), float4(fragmentConstants[scalarValue1 + 3u])) + fragmentConstants[sumValue17].z;
                            float clampedValue = clamp(((dotProductValue1 * 0.715200006961822509765625f) + (dotProductValue * 0.2125999927520751953125f)) + (dotProductValue2 * 0.072200000286102294921875f), 0.0f, 1.0f);
                            branchMergedValue89 = 1.0f;
                            branchMergedValue91 = dotProductValue2;
                            branchMergedValue92 = dotProductValue1;
                            branchMergedValue93 = dotProductValue;
                            branchMergedValue94 = (clamp(varyingTexCoord1.z, 0.0f, 1.0f) * fragmentConstants[sumValue].w) * ((((dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue24), float4(fragmentConstants[scalarValue1 + 4u])) + fragmentConstants[sumValue17].w) - clampedValue) * fragmentConstants[sumValue].z) + clampedValue);
                        }
                        else
                        {
                            bool comparisonValue1 = scalarValue == 12u;
                            float branchMergedValue99;
                            float branchMergedValue100;
                            float branchMergedValue101;
                            float branchMergedValue102;
                            float branchMergedValue103;
                            if ((scalarValue == 9u) || comparisonValue1)
                            {
                                float4 vectorValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                float4 sampledTextureValue3 = txBuffer1Texture.Sample(txBuffer1Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_1.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_1.x, (RD_UNIFORM_UV_TRANSFORM_ROW_1.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_1.y));
                                float4 sampledTextureValue4 = txBuffer2Texture.Sample(txBuffer2Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_2.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_2.x, (RD_UNIFORM_UV_TRANSFORM_ROW_2.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_2.y));
                                float sumValue18 = sampledTextureValue3.x + (-0.5f);
                                float sumValue19 = sampledTextureValue4.x + (-0.5f);
                                float productValue16 = (vectorValue.x + (-0.0625f)) * 1.164000034332275390625f;
                                float multiplyAddValue = mad(1.5959999561309814453125f, sumValue19, productValue16);
                                float multiplyAddValue1 = mad(-0.813000023365020751953125f, sumValue19, mad(-0.3910000026226043701171875f, sumValue18, productValue16));
                                float multiplyAddValue2 = mad(2.0179998874664306640625f, sumValue18, productValue16);
                                float intermediateValue4;
                                float intermediateValue9;
                                float intermediateValue14;
                                if ((sumValue1 & 2u) == 0u)
                                {
                                    float branchMergedValue9;
                                    float branchMergedValue25;
                                    float branchMergedValue26;
                                    if ((sumValue1 & 16u) == 0u)
                                    {
                                        branchMergedValue9 = multiplyAddValue2;
                                        branchMergedValue25 = multiplyAddValue1;
                                        branchMergedValue26 = multiplyAddValue;
                                    }
                                    else
                                    {
                                        float exponentialValue8;
                                        if (!(multiplyAddValue <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue8 = (exp2(log2(multiplyAddValue) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue8 = multiplyAddValue * 12.9200000762939453125f;
                                        }
                                        float exponentialValue10;
                                        if (!(multiplyAddValue1 <= 0.003130800090730190277099609375f))
                                        {
                                            exponentialValue10 = (exp2(log2(multiplyAddValue1) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        }
                                        else
                                        {
                                            exponentialValue10 = multiplyAddValue1 * 12.9200000762939453125f;
                                        }
                                        float branchMergedValue59;
                                        float branchMergedValue64;
                                        float branchMergedValue65;
                                        if (!(multiplyAddValue2 <= 0.003130800090730190277099609375f))
                                        {
                                            branchMergedValue59 = (exp2(log2(multiplyAddValue2) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                            branchMergedValue64 = exponentialValue10;
                                            branchMergedValue65 = exponentialValue8;
                                        }
                                        else
                                        {
                                            branchMergedValue59 = multiplyAddValue2 * 12.9200000762939453125f;
                                            branchMergedValue64 = exponentialValue10;
                                            branchMergedValue65 = exponentialValue8;
                                        }
                                        branchMergedValue9 = branchMergedValue59;
                                        branchMergedValue25 = branchMergedValue64;
                                        branchMergedValue26 = branchMergedValue65;
                                    }
                                    intermediateValue4 = branchMergedValue26;
                                    intermediateValue9 = branchMergedValue25;
                                    intermediateValue14 = branchMergedValue9;
                                }
                                else
                                {
                                    float exponentialValue7;
                                    if (!(multiplyAddValue <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue7 = exp2(log2((multiplyAddValue + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue7 = multiplyAddValue * 0.077399380505084991455078125f;
                                    }
                                    float exponentialValue9;
                                    if (!(multiplyAddValue1 <= 0.040449999272823333740234375f))
                                    {
                                        exponentialValue9 = exp2(log2((multiplyAddValue1 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    }
                                    else
                                    {
                                        exponentialValue9 = multiplyAddValue1 * 0.077399380505084991455078125f;
                                    }
                                    float branchMergedValue10;
                                    float branchMergedValue27;
                                    float branchMergedValue28;
                                    if (!(multiplyAddValue2 <= 0.040449999272823333740234375f))
                                    {
                                        branchMergedValue10 = exp2(log2((multiplyAddValue2 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                        branchMergedValue27 = exponentialValue9;
                                        branchMergedValue28 = exponentialValue7;
                                    }
                                    else
                                    {
                                        branchMergedValue10 = multiplyAddValue2 * 0.077399380505084991455078125f;
                                        branchMergedValue27 = exponentialValue9;
                                        branchMergedValue28 = exponentialValue7;
                                    }
                                    intermediateValue4 = branchMergedValue28;
                                    intermediateValue9 = branchMergedValue27;
                                    intermediateValue14 = branchMergedValue10;
                                }
                                float branchMergedValue105;
                                float branchMergedValue110;
                                float branchMergedValue111;
                                float branchMergedValue112;
                                float branchMergedValue113;
                                if (comparisonValue1)
                                {
                                    branchMergedValue105 = 1.0f;
                                    branchMergedValue110 = intermediateValue14;
                                    branchMergedValue111 = intermediateValue9;
                                    branchMergedValue112 = intermediateValue4;
                                    branchMergedValue113 = (clamp(varyingTexCoord1.z, 0.0f, 1.0f) * fragmentConstants[sumValue].w) * txBuffer3Texture.Sample(txBuffer3Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_3.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_3.x, (RD_UNIFORM_UV_TRANSFORM_ROW_3.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_3.y)).x;
                                }
                                else
                                {
                                    branchMergedValue105 = 1.0f;
                                    branchMergedValue110 = intermediateValue14;
                                    branchMergedValue111 = intermediateValue9;
                                    branchMergedValue112 = intermediateValue4;
                                    branchMergedValue113 = fragmentConstants[sumValue].w;
                                }
                                branchMergedValue99 = branchMergedValue105;
                                branchMergedValue100 = branchMergedValue110;
                                branchMergedValue101 = branchMergedValue111;
                                branchMergedValue102 = branchMergedValue112;
                                branchMergedValue103 = branchMergedValue113;
                            }
                            else
                            {
                                float branchMergedValue104;
                                float branchMergedValue106;
                                float branchMergedValue107;
                                float branchMergedValue108;
                                float branchMergedValue109;
                                if (scalarValue == 11u)
                                {
                                    branchMergedValue104 = fragmentConstants[sumValue].w;
                                    branchMergedValue106 = fragmentConstants[sumValue].z;
                                    branchMergedValue107 = fragmentConstants[sumValue].y;
                                    branchMergedValue108 = fragmentConstants[sumValue].x;
                                    branchMergedValue109 = clamp((1.0f - clamp(abs(dot(float3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), float3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0f))), 0.0f, 1.0f)) * varyingTexCoord1.w, 0.0f, 1.0f);
                                }
                                else
                                {
                                    float branchMergedValue114;
                                    float branchMergedValue115;
                                    float branchMergedValue116;
                                    float branchMergedValue117;
                                    float branchMergedValue118;
                                    if (scalarValue == 19u)
                                    {
                                        uint scalarValue25 = scalarValue1 + 1u;
                                        float nonlinearValue2 = sqrt(fragmentConstants[scalarValue1].y * 0.5f);
                                        float productValue17 = nonlinearValue2 * 0.5f;
                                        float sumValue20 = productValue17 + (-0.89999997615814208984375f);
                                        float quotientValue13 = productValue17 * (fragmentConstants[scalarValue1].z / fragmentConstants[scalarValue1].y);
                                        float sampledTextureValue5 = nonlinearValue2 * txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).x;
                                        float clampedValue1 = clamp((sampledTextureValue5 - sumValue20) - quotientValue13, 0.0f, 1.0f);
                                        float clampedValue2 = clamp(sampledTextureValue5 - max(0.0f, sumValue20 - quotientValue13), 0.0f, 1.0f);
                                        branchMergedValue114 = ((clampedValue1 * (fragmentConstants[sumValue].w - fragmentConstants[scalarValue25].w)) + fragmentConstants[scalarValue25].w) * clampedValue2;
                                        branchMergedValue115 = ((clampedValue1 * (fragmentConstants[sumValue].z - fragmentConstants[scalarValue25].z)) + fragmentConstants[scalarValue25].z) * clampedValue2;
                                        branchMergedValue116 = ((clampedValue1 * (fragmentConstants[sumValue].y - fragmentConstants[scalarValue25].y)) + fragmentConstants[scalarValue25].y) * clampedValue2;
                                        branchMergedValue117 = ((clampedValue1 * (fragmentConstants[sumValue].x - fragmentConstants[scalarValue25].x)) + fragmentConstants[scalarValue25].x) * clampedValue2;
                                        branchMergedValue118 = 1.0f;
                                    }
                                    else
                                    {
                                        bool comparisonValue3 = scalarValue == 35u;
                                        float branchMergedValue119;
                                        float branchMergedValue120;
                                        float branchMergedValue121;
                                        float branchMergedValue122;
                                        float branchMergedValue123;
                                        if ((scalarValue == 32u) || comparisonValue3)
                                        {
                                            uint scalarValue26 = uint(int(fragmentConstants[sumValue].x));
                                            float intermediateValue71;
                                            float intermediateValue72;
                                            float intermediateValue73;
                                            float intermediateValue74;
                                            if (comparisonValue3)
                                            {
                                                float4 sampledTextureValue6 = txBufferTexture.Sample(txBufferSampler, float2((((fragmentConstants[scalarValue1].z * frac(varyingTexCoord1.z)) + fragmentConstants[scalarValue1].x) * RD_UNIFORM_UV_TRANSFORM_ROW_0.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(varyingTexCoord1.w) * fragmentConstants[scalarValue1].w) + fragmentConstants[scalarValue1].y) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                intermediateValue71 = sampledTextureValue6.x;
                                                intermediateValue72 = sampledTextureValue6.y;
                                                intermediateValue73 = sampledTextureValue6.z;
                                                intermediateValue74 = sampledTextureValue6.w;
                                            }
                                            else
                                            {
                                                float4 sampledTextureValue7 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                intermediateValue71 = sampledTextureValue7.x;
                                                intermediateValue72 = sampledTextureValue7.y;
                                                intermediateValue73 = sampledTextureValue7.z;
                                                intermediateValue74 = sampledTextureValue7.w;
                                            }
                                            float intermediateValue5;
                                            float intermediateValue10;
                                            float intermediateValue15;
                                            if ((sumValue1 & 2u) == 0u)
                                            {
                                                float branchMergedValue16;
                                                float branchMergedValue31;
                                                float branchMergedValue32;
                                                if ((sumValue1 & 16u) == 0u)
                                                {
                                                    branchMergedValue16 = intermediateValue73;
                                                    branchMergedValue31 = intermediateValue72;
                                                    branchMergedValue32 = intermediateValue71;
                                                }
                                                else
                                                {
                                                    float exponentialValue26;
                                                    if (!(intermediateValue71 <= 0.003130800090730190277099609375f))
                                                    {
                                                        exponentialValue26 = (exp2(log2(intermediateValue71) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue26 = intermediateValue71 * 12.9200000762939453125f;
                                                    }
                                                    float exponentialValue28;
                                                    if (!(intermediateValue72 <= 0.003130800090730190277099609375f))
                                                    {
                                                        exponentialValue28 = (exp2(log2(intermediateValue72) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue28 = intermediateValue72 * 12.9200000762939453125f;
                                                    }
                                                    float branchMergedValue61;
                                                    float branchMergedValue69;
                                                    float branchMergedValue70;
                                                    if (!(intermediateValue73 <= 0.003130800090730190277099609375f))
                                                    {
                                                        branchMergedValue61 = (exp2(log2(intermediateValue73) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        branchMergedValue69 = exponentialValue28;
                                                        branchMergedValue70 = exponentialValue26;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue61 = intermediateValue73 * 12.9200000762939453125f;
                                                        branchMergedValue69 = exponentialValue28;
                                                        branchMergedValue70 = exponentialValue26;
                                                    }
                                                    branchMergedValue16 = branchMergedValue61;
                                                    branchMergedValue31 = branchMergedValue69;
                                                    branchMergedValue32 = branchMergedValue70;
                                                }
                                                intermediateValue5 = branchMergedValue32;
                                                intermediateValue10 = branchMergedValue31;
                                                intermediateValue15 = branchMergedValue16;
                                            }
                                            else
                                            {
                                                float exponentialValue25;
                                                if (!(intermediateValue71 <= 0.040449999272823333740234375f))
                                                {
                                                    exponentialValue25 = exp2(log2((intermediateValue71 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                }
                                                else
                                                {
                                                    exponentialValue25 = intermediateValue71 * 0.077399380505084991455078125f;
                                                }
                                                float exponentialValue27;
                                                if (!(intermediateValue72 <= 0.040449999272823333740234375f))
                                                {
                                                    exponentialValue27 = exp2(log2((intermediateValue72 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                }
                                                else
                                                {
                                                    exponentialValue27 = intermediateValue72 * 0.077399380505084991455078125f;
                                                }
                                                float branchMergedValue18;
                                                float branchMergedValue35;
                                                float branchMergedValue36;
                                                if (!(intermediateValue73 <= 0.040449999272823333740234375f))
                                                {
                                                    branchMergedValue18 = exp2(log2((intermediateValue73 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    branchMergedValue35 = exponentialValue27;
                                                    branchMergedValue36 = exponentialValue25;
                                                }
                                                else
                                                {
                                                    branchMergedValue18 = intermediateValue73 * 0.077399380505084991455078125f;
                                                    branchMergedValue35 = exponentialValue27;
                                                    branchMergedValue36 = exponentialValue25;
                                                }
                                                intermediateValue5 = branchMergedValue36;
                                                intermediateValue10 = branchMergedValue35;
                                                intermediateValue15 = branchMergedValue18;
                                            }
                                            float clampedValue3 = clamp(((intermediateValue10 * 0.715200006961822509765625f) + (intermediateValue5 * 0.2125999927520751953125f)) + (intermediateValue15 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                            float comparisonValue4 = (((((1.0f - (intermediateValue74 * 2.0f)) * float((scalarValue26 & 1u) != 0u)) + intermediateValue74) - clampedValue3) * fragmentConstants[sumValue].z) + clampedValue3;
                                            float quotientValue14 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue15 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentConstants[bitwiseValue].y;
                                            float productValue18 = ((ddx_coarse(quotientValue15) * quotientValue15) + (ddx_coarse(quotientValue14) * quotientValue14)) * 2.0f;
                                            float productValue19 = ((ddy_coarse((-0.0f) - quotientValue15) * quotientValue15) + (ddy_coarse((-0.0f) - quotientValue14) * quotientValue14)) * 2.0f;
                                            branchMergedValue119 = ((1.0f - comparisonValue4) * float((scalarValue26 & 2u) != 0u)) + comparisonValue4;
                                            branchMergedValue120 = intermediateValue15;
                                            branchMergedValue121 = intermediateValue10;
                                            branchMergedValue122 = intermediateValue5;
                                            branchMergedValue123 = clamp(0.5f - (rsqrt(max(dot(float2(productValue18, productValue19), float2(productValue18, productValue19)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue14, quotientValue15), float2(quotientValue14, quotientValue15)) + (-1.0f))), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                        }
                                        else
                                        {
                                            float branchMergedValue124;
                                            float branchMergedValue125;
                                            float branchMergedValue126;
                                            float branchMergedValue127;
                                            float branchMergedValue128;
                                            if (scalarValue == 33u)
                                            {
                                                uint scalarValue27 = scalarValue1 + 1u;
                                                float4 sampledTextureValue8 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * ((fragmentConstants[scalarValue27].z * frac(varyingTexCoord1.z)) + fragmentConstants[scalarValue27].x)) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(varyingTexCoord1.w) * fragmentConstants[scalarValue27].w) + fragmentConstants[scalarValue27].y) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                float scalarValue28 = sampledTextureValue8.x;
                                                float scalarValue29 = sampledTextureValue8.y;
                                                float scalarValue30 = sampledTextureValue8.z;
                                                float scalarValue31 = sampledTextureValue8.w;
                                                float intermediateValue6;
                                                float intermediateValue11;
                                                float intermediateValue16;
                                                if ((sumValue1 & 2u) == 0u)
                                                {
                                                    float branchMergedValue15;
                                                    float branchMergedValue29;
                                                    float branchMergedValue30;
                                                    if ((sumValue1 & 16u) == 0u)
                                                    {
                                                        branchMergedValue15 = scalarValue30;
                                                        branchMergedValue29 = scalarValue29;
                                                        branchMergedValue30 = scalarValue28;
                                                    }
                                                    else
                                                    {
                                                        float exponentialValue22;
                                                        if (!(scalarValue28 <= 0.003130800090730190277099609375f))
                                                        {
                                                            exponentialValue22 = (exp2(log2(scalarValue28) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue22 = scalarValue28 * 12.9200000762939453125f;
                                                        }
                                                        float exponentialValue24;
                                                        if (!(scalarValue29 <= 0.003130800090730190277099609375f))
                                                        {
                                                            exponentialValue24 = (exp2(log2(scalarValue29) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue24 = scalarValue29 * 12.9200000762939453125f;
                                                        }
                                                        float branchMergedValue60;
                                                        float branchMergedValue67;
                                                        float branchMergedValue68;
                                                        if (!(scalarValue30 <= 0.003130800090730190277099609375f))
                                                        {
                                                            branchMergedValue60 = (exp2(log2(scalarValue30) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                            branchMergedValue67 = exponentialValue24;
                                                            branchMergedValue68 = exponentialValue22;
                                                        }
                                                        else
                                                        {
                                                            branchMergedValue60 = scalarValue30 * 12.9200000762939453125f;
                                                            branchMergedValue67 = exponentialValue24;
                                                            branchMergedValue68 = exponentialValue22;
                                                        }
                                                        branchMergedValue15 = branchMergedValue60;
                                                        branchMergedValue29 = branchMergedValue67;
                                                        branchMergedValue30 = branchMergedValue68;
                                                    }
                                                    intermediateValue6 = branchMergedValue30;
                                                    intermediateValue11 = branchMergedValue29;
                                                    intermediateValue16 = branchMergedValue15;
                                                }
                                                else
                                                {
                                                    float exponentialValue21;
                                                    if (!(scalarValue28 <= 0.040449999272823333740234375f))
                                                    {
                                                        exponentialValue21 = exp2(log2((scalarValue28 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue21 = scalarValue28 * 0.077399380505084991455078125f;
                                                    }
                                                    float exponentialValue23;
                                                    if (!(scalarValue29 <= 0.040449999272823333740234375f))
                                                    {
                                                        exponentialValue23 = exp2(log2((scalarValue29 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue23 = scalarValue29 * 0.077399380505084991455078125f;
                                                    }
                                                    float branchMergedValue17;
                                                    float branchMergedValue33;
                                                    float branchMergedValue34;
                                                    if (!(scalarValue30 <= 0.040449999272823333740234375f))
                                                    {
                                                        branchMergedValue17 = exp2(log2((scalarValue30 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                        branchMergedValue33 = exponentialValue23;
                                                        branchMergedValue34 = exponentialValue21;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue17 = scalarValue30 * 0.077399380505084991455078125f;
                                                        branchMergedValue33 = exponentialValue23;
                                                        branchMergedValue34 = exponentialValue21;
                                                    }
                                                    intermediateValue6 = branchMergedValue34;
                                                    intermediateValue11 = branchMergedValue33;
                                                    intermediateValue16 = branchMergedValue17;
                                                }
                                                float sumValue21 = 1.0f - scalarValue31;
                                                float clampedValue4 = clamp(((intermediateValue11 * 0.715200006961822509765625f) + (intermediateValue6 * 0.2125999927520751953125f)) + (intermediateValue16 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                                float productValue20 = (((((scalarValue31 - sumValue21) * fragmentConstants[sumValue].x) + sumValue21) - clampedValue4) * fragmentConstants[sumValue].z) + clampedValue4;
                                                float sumValue22 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                float sumValue23 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                branchMergedValue124 = ((1.0f - productValue20) * fragmentConstants[bitwiseValue].y) + productValue20;
                                                branchMergedValue125 = intermediateValue16;
                                                branchMergedValue126 = intermediateValue11;
                                                branchMergedValue127 = intermediateValue6;
                                                branchMergedValue128 = clamp(0.5f - ((sqrt((sumValue23 * sumValue23) + (sumValue22 * sumValue22)) - varyingTexCoord2.z) * ((fragmentConstants[scalarValue1].x < fragmentConstants[scalarValue1].y) ? fragmentConstants[scalarValue1].x : fragmentConstants[scalarValue1].y)), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                            }
                                            else
                                            {
                                                float branchMergedValue129;
                                                float branchMergedValue130;
                                                float branchMergedValue131;
                                                float branchMergedValue132;
                                                float branchMergedValue133;
                                                if (scalarValue == 23u)
                                                {
                                                    float4 vectorValue1 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                    uint sumValue24 = scalarValue1 + 1u;
                                                    float productValue21 = fragmentConstants[scalarValue1].z * fragmentConstants[scalarValue1].x;
                                                    float productValue22 = (productValue21 * 0.5f) + 0.5f;
                                                    float productValue23 = fragmentConstants[scalarValue1].x * 2.0f;
                                                    float sumValue25 = fragmentConstants[scalarValue1].x + vectorValue1.x;
                                                    float clampedValue5 = clamp(((sumValue25 + productValue21) - productValue22) / productValue23, 0.0f, 1.0f);
                                                    float productValue24 = (clampedValue5 * clampedValue5) * (3.0f - (clampedValue5 * 2.0f));
                                                    if (!(!(productValue24 <= 0.0f)))
                                                    {
                                                        isFragmentDiscarded = true;
                                                    }
                                                    float clampedValue6 = clamp((sumValue25 - productValue22) / productValue23, 0.0f, 1.0f);
                                                    float productValue25 = (clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f));
                                                    branchMergedValue129 = ((productValue25 * (fragmentConstants[sumValue].w - fragmentConstants[sumValue24].w)) + fragmentConstants[sumValue24].w) * productValue24;
                                                    branchMergedValue130 = ((productValue25 * (fragmentConstants[sumValue].z - fragmentConstants[sumValue24].z)) + fragmentConstants[sumValue24].z) * productValue24;
                                                    branchMergedValue131 = ((productValue25 * (fragmentConstants[sumValue].y - fragmentConstants[sumValue24].y)) + fragmentConstants[sumValue24].y) * productValue24;
                                                    branchMergedValue132 = ((productValue25 * (fragmentConstants[sumValue].x - fragmentConstants[sumValue24].x)) + fragmentConstants[sumValue24].x) * productValue24;
                                                    branchMergedValue133 = 1.0f;
                                                }
                                                else
                                                {
                                                    float branchMergedValue134;
                                                    float branchMergedValue135;
                                                    float branchMergedValue136;
                                                    float branchMergedValue137;
                                                    float branchMergedValue138;
                                                    if (scalarValue == 24u)
                                                    {
                                                        float4 vectorValue2 = txBuffer3Texture.Sample(txBuffer3Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_3.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_3.x, (RD_UNIFORM_UV_TRANSFORM_ROW_3.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_3.y));
                                                        float scalarValue32 = vectorValue2.x;
                                                        float scalarValue33 = vectorValue2.y;
                                                        float sumValue26 = 0.5f - varyingTexCoord1.z;
                                                        float clampedValue7 = clamp((max(min(scalarValue32, scalarValue33), min(max(scalarValue32, scalarValue33), vectorValue2.z)) - sumValue26) / ((varyingTexCoord1.z + 0.5f) - sumValue26), 0.0f, 1.0f);
                                                        float productValue26 = (clampedValue7 * clampedValue7) * (3.0f - (clampedValue7 * 2.0f));
                                                        branchMergedValue134 = productValue26 * fragmentConstants[sumValue].w;
                                                        branchMergedValue135 = productValue26 * fragmentConstants[sumValue].z;
                                                        branchMergedValue136 = productValue26 * fragmentConstants[sumValue].y;
                                                        branchMergedValue137 = productValue26 * fragmentConstants[sumValue].x;
                                                        branchMergedValue138 = 1.0f;
                                                    }
                                                    else
                                                    {
                                                        float branchMergedValue139;
                                                        float branchMergedValue140;
                                                        float branchMergedValue141;
                                                        float branchMergedValue142;
                                                        float branchMergedValue143;
                                                        if (scalarValue == 25u)
                                                        {
                                                            float4 vectorValue3 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                            float scalarValue34 = vectorValue3.x;
                                                            float scalarValue35 = vectorValue3.y;
                                                            uint sumValue27 = scalarValue1 + 1u;
                                                            float productValue27 = fragmentConstants[scalarValue1].z * fragmentConstants[scalarValue1].x;
                                                            float productValue28 = (productValue27 * 0.5f) + 0.5f;
                                                            float scalarValue36 = max(min(scalarValue34, scalarValue35), min(max(scalarValue34, scalarValue35), vectorValue3.z));
                                                            float productValue29 = fragmentConstants[scalarValue1].x * 2.0f;
                                                            float clampedValue8 = clamp((((productValue27 + fragmentConstants[scalarValue1].x) - productValue28) + scalarValue36) / productValue29, 0.0f, 1.0f);
                                                            float productValue30 = (clampedValue8 * clampedValue8) * (3.0f - (clampedValue8 * 2.0f));
                                                            if (!(!(productValue30 <= 0.0f)))
                                                            {
                                                                isFragmentDiscarded = true;
                                                            }
                                                            float clampedValue9 = clamp(((fragmentConstants[scalarValue1].x - productValue28) + scalarValue36) / productValue29, 0.0f, 1.0f);
                                                            float productValue31 = (clampedValue9 * clampedValue9) * (3.0f - (clampedValue9 * 2.0f));
                                                            branchMergedValue139 = ((productValue31 * (fragmentConstants[sumValue].w - fragmentConstants[sumValue27].w)) + fragmentConstants[sumValue27].w) * productValue30;
                                                            branchMergedValue140 = ((productValue31 * (fragmentConstants[sumValue].z - fragmentConstants[sumValue27].z)) + fragmentConstants[sumValue27].z) * productValue30;
                                                            branchMergedValue141 = ((productValue31 * (fragmentConstants[sumValue].y - fragmentConstants[sumValue27].y)) + fragmentConstants[sumValue27].y) * productValue30;
                                                            branchMergedValue142 = ((productValue31 * (fragmentConstants[sumValue].x - fragmentConstants[sumValue27].x)) + fragmentConstants[sumValue27].x) * productValue30;
                                                            branchMergedValue143 = 1.0f;
                                                        }
                                                        else
                                                        {
                                                            float branchMergedValue144;
                                                            float branchMergedValue145;
                                                            float branchMergedValue146;
                                                            float branchMergedValue147;
                                                            float branchMergedValue148;
                                                            if (scalarValue == 31u)
                                                            {
                                                                float4 vectorValue4 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                                float scalarValue37 = vectorValue4.x;
                                                                float scalarValue38 = vectorValue4.y;
                                                                float scalarValue39 = vectorValue4.z;
                                                                float scalarValue40 = vectorValue4.w;
                                                                float intermediateValue7;
                                                                float intermediateValue12;
                                                                float intermediateValue17;
                                                                if ((sumValue1 & 2u) == 0u)
                                                                {
                                                                    float branchMergedValue19;
                                                                    float branchMergedValue37;
                                                                    float branchMergedValue38;
                                                                    if ((sumValue1 & 16u) == 0u)
                                                                    {
                                                                        branchMergedValue19 = scalarValue39;
                                                                        branchMergedValue37 = scalarValue38;
                                                                        branchMergedValue38 = scalarValue37;
                                                                    }
                                                                    else
                                                                    {
                                                                        float exponentialValue30;
                                                                        if (!(scalarValue37 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            exponentialValue30 = (exp2(log2(scalarValue37) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue30 = scalarValue37 * 12.9200000762939453125f;
                                                                        }
                                                                        float exponentialValue32;
                                                                        if (!(scalarValue38 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            exponentialValue32 = (exp2(log2(scalarValue38) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue32 = scalarValue38 * 12.9200000762939453125f;
                                                                        }
                                                                        float branchMergedValue66;
                                                                        float branchMergedValue71;
                                                                        float branchMergedValue72;
                                                                        if (!(scalarValue39 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            branchMergedValue66 = (exp2(log2(scalarValue39) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                            branchMergedValue71 = exponentialValue32;
                                                                            branchMergedValue72 = exponentialValue30;
                                                                        }
                                                                        else
                                                                        {
                                                                            branchMergedValue66 = scalarValue39 * 12.9200000762939453125f;
                                                                            branchMergedValue71 = exponentialValue32;
                                                                            branchMergedValue72 = exponentialValue30;
                                                                        }
                                                                        branchMergedValue19 = branchMergedValue66;
                                                                        branchMergedValue37 = branchMergedValue71;
                                                                        branchMergedValue38 = branchMergedValue72;
                                                                    }
                                                                    intermediateValue7 = branchMergedValue38;
                                                                    intermediateValue12 = branchMergedValue37;
                                                                    intermediateValue17 = branchMergedValue19;
                                                                }
                                                                else
                                                                {
                                                                    float exponentialValue29;
                                                                    if (!(scalarValue37 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        exponentialValue29 = exp2(log2((scalarValue37 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue29 = scalarValue37 * 0.077399380505084991455078125f;
                                                                    }
                                                                    float exponentialValue31;
                                                                    if (!(scalarValue38 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        exponentialValue31 = exp2(log2((scalarValue38 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue31 = scalarValue38 * 0.077399380505084991455078125f;
                                                                    }
                                                                    float branchMergedValue20;
                                                                    float branchMergedValue39;
                                                                    float branchMergedValue40;
                                                                    if (!(scalarValue39 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        branchMergedValue20 = exp2(log2((scalarValue39 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                        branchMergedValue39 = exponentialValue31;
                                                                        branchMergedValue40 = exponentialValue29;
                                                                    }
                                                                    else
                                                                    {
                                                                        branchMergedValue20 = scalarValue39 * 0.077399380505084991455078125f;
                                                                        branchMergedValue39 = exponentialValue31;
                                                                        branchMergedValue40 = exponentialValue29;
                                                                    }
                                                                    intermediateValue7 = branchMergedValue40;
                                                                    intermediateValue12 = branchMergedValue39;
                                                                    intermediateValue17 = branchMergedValue20;
                                                                }
                                                                float sumValue28 = 1.0f - scalarValue40;
                                                                float clampedValue10 = clamp(((intermediateValue12 * 0.715200006961822509765625f) + (intermediateValue7 * 0.2125999927520751953125f)) + (intermediateValue17 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                                                float productValue32 = (((((scalarValue40 - sumValue28) * fragmentConstants[sumValue].x) + sumValue28) - clampedValue10) * fragmentConstants[sumValue].z) + clampedValue10;
                                                                float sumValue29 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                float sumValue30 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                branchMergedValue144 = ((1.0f - productValue32) * fragmentConstants[bitwiseValue].y) + productValue32;
                                                                branchMergedValue145 = intermediateValue17;
                                                                branchMergedValue146 = intermediateValue12;
                                                                branchMergedValue147 = intermediateValue7;
                                                                branchMergedValue148 = clamp(0.5f - (((fragmentConstants[scalarValue1].x < fragmentConstants[scalarValue1].y) ? fragmentConstants[scalarValue1].x : fragmentConstants[scalarValue1].y) * (sqrt((sumValue30 * sumValue30) + (sumValue29 * sumValue29)) - varyingTexCoord2.z)), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                                            }
                                                            else
                                                            {
                                                                branchMergedValue144 = fragmentConstants[sumValue].w;
                                                                branchMergedValue145 = fragmentConstants[sumValue].z;
                                                                branchMergedValue146 = fragmentConstants[sumValue].y;
                                                                branchMergedValue147 = fragmentConstants[sumValue].x;
                                                                branchMergedValue148 = 1.0f;
                                                            }
                                                            branchMergedValue139 = branchMergedValue144;
                                                            branchMergedValue140 = branchMergedValue145;
                                                            branchMergedValue141 = branchMergedValue146;
                                                            branchMergedValue142 = branchMergedValue147;
                                                            branchMergedValue143 = branchMergedValue148;
                                                        }
                                                        branchMergedValue134 = branchMergedValue139;
                                                        branchMergedValue135 = branchMergedValue140;
                                                        branchMergedValue136 = branchMergedValue141;
                                                        branchMergedValue137 = branchMergedValue142;
                                                        branchMergedValue138 = branchMergedValue143;
                                                    }
                                                    branchMergedValue129 = branchMergedValue134;
                                                    branchMergedValue130 = branchMergedValue135;
                                                    branchMergedValue131 = branchMergedValue136;
                                                    branchMergedValue132 = branchMergedValue137;
                                                    branchMergedValue133 = branchMergedValue138;
                                                }
                                                branchMergedValue124 = branchMergedValue129;
                                                branchMergedValue125 = branchMergedValue130;
                                                branchMergedValue126 = branchMergedValue131;
                                                branchMergedValue127 = branchMergedValue132;
                                                branchMergedValue128 = branchMergedValue133;
                                            }
                                            branchMergedValue119 = branchMergedValue124;
                                            branchMergedValue120 = branchMergedValue125;
                                            branchMergedValue121 = branchMergedValue126;
                                            branchMergedValue122 = branchMergedValue127;
                                            branchMergedValue123 = branchMergedValue128;
                                        }
                                        branchMergedValue114 = branchMergedValue119;
                                        branchMergedValue115 = branchMergedValue120;
                                        branchMergedValue116 = branchMergedValue121;
                                        branchMergedValue117 = branchMergedValue122;
                                        branchMergedValue118 = branchMergedValue123;
                                    }
                                    branchMergedValue104 = branchMergedValue114;
                                    branchMergedValue106 = branchMergedValue115;
                                    branchMergedValue107 = branchMergedValue116;
                                    branchMergedValue108 = branchMergedValue117;
                                    branchMergedValue109 = branchMergedValue118;
                                }
                                branchMergedValue99 = branchMergedValue104;
                                branchMergedValue100 = branchMergedValue106;
                                branchMergedValue101 = branchMergedValue107;
                                branchMergedValue102 = branchMergedValue108;
                                branchMergedValue103 = branchMergedValue109;
                            }
                            branchMergedValue89 = branchMergedValue99;
                            branchMergedValue91 = branchMergedValue100;
                            branchMergedValue92 = branchMergedValue101;
                            branchMergedValue93 = branchMergedValue102;
                            branchMergedValue94 = branchMergedValue103;
                        }
                        branchMergedValue84 = branchMergedValue89;
                        branchMergedValue85 = branchMergedValue91;
                        branchMergedValue86 = branchMergedValue92;
                        branchMergedValue87 = branchMergedValue93;
                        branchMergedValue88 = branchMergedValue94;
                    }
                    branchMergedValue73 = branchMergedValue84;
                    branchMergedValue75 = branchMergedValue85;
                    branchMergedValue76 = branchMergedValue86;
                    branchMergedValue77 = branchMergedValue87;
                    branchMergedValue78 = branchMergedValue88;
                }
                branchMergedValue43 = branchMergedValue73;
                branchMergedValue54 = branchMergedValue75;
                branchMergedValue55 = branchMergedValue76;
                branchMergedValue56 = branchMergedValue77;
                branchMergedValue57 = branchMergedValue78;
            }
            branchMergedValue6 = branchMergedValue43;
            branchMergedValue11 = branchMergedValue54;
            branchMergedValue12 = branchMergedValue55;
            branchMergedValue13 = branchMergedValue56;
            branchMergedValue14 = branchMergedValue57;
        }
        nonlinearValue = branchMergedValue14;
        intermediateValue3 = branchMergedValue13;
        intermediateValue8 = branchMergedValue12;
        intermediateValue13 = branchMergedValue11;
        intermediateValue18 = branchMergedValue6;
    }
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((sumValue1 & 64u) == 0u)
    {
        intermediateValue20 = intermediateValue3;
        intermediateValue21 = intermediateValue8;
        intermediateValue22 = intermediateValue13;
    }
    else
    {
        intermediateValue20 = intermediateValue18 * intermediateValue3;
        intermediateValue21 = intermediateValue18 * intermediateValue8;
        intermediateValue22 = intermediateValue18 * intermediateValue13;
    }
    fragmentColor0.x = intermediateValue20 * nonlinearValue;
    fragmentColor0.y = intermediateValue21 * nonlinearValue;
    fragmentColor0.z = intermediateValue22 * nonlinearValue;
    fragmentColor0.w = intermediateValue18 * nonlinearValue;
    discardIfRequested();
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
