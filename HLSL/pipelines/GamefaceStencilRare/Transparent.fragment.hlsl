// GamefaceStencilRare / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceStencilRare/FragmentBindings.hlsli"

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
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
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
  workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 1);
  if (workingVector0.w != 0) {
    workingVector1.xy = varyingTexCoord2.xy + -varyingTexCoord1.xy;
    workingVector0.w = dot(workingVector1.xy, workingVector1.xy);
    workingVector0.w = sqrt(workingVector0.w);
    workingVector0.w = -varyingTexCoord1.z + workingVector0.w;
    workingVector1.y = saturate(0.5 + -workingVector0.w);
    workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
  } else {
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 2);
    if (workingVector0.w != 0) {
      workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
      workingVector0.w = dot(workingVector1.zw, workingVector1.zw);
      workingVector0.w = sqrt(workingVector0.w);
      workingVector1.z = -varyingTexCoord1.z + workingVector0.w;
      workingVector1.w = varyingTexCoord1.z + -varyingTexCoord1.w;
      workingVector0.w = -workingVector1.w + workingVector0.w;
      workingVector1.z = saturate(0.5 + -workingVector1.z);
      workingVector0.w = saturate(0.5 + -workingVector0.w);
      workingVector0.w = 1 + -workingVector0.w;
      workingVector1.y = workingVector1.z * workingVector0.w;
      workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
    } else {
      workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 4);
      if (workingVector0.w != 0) {
        workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
        workingVector1.zw = workingVector1.zw / varyingTexCoord1.zw;
        workingVector0.w = dot(workingVector1.zw, workingVector1.zw);
        workingVector0.w = -1 + workingVector0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector2.xy = ddx(workingVector1.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector2.xy = ddx_coarse(workingVector1.zw);
#endif
        workingVector2.zw = -workingVector1.zw;
#if RD_PLATFORM == RD_PLATFORM_SM40
        workingVector2.zw = ddy(workingVector2.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        workingVector2.zw = ddy_coarse(workingVector2.zw);
#endif
        workingVector1.zw = workingVector1.zw + workingVector1.zw;
        workingVector2.xy = workingVector1.zw * workingVector2.xy;
        workingVector2.x = workingVector2.x + workingVector2.y;
        workingVector1.zw = workingVector1.zw * workingVector2.zw;
        workingVector2.y = workingVector1.z + workingVector1.w;
        workingVector1.z = dot(workingVector2.xy, workingVector2.xy);
        workingVector1.z = max(9.99999975e-005, workingVector1.z);
        workingVector1.z = rsqrt(workingVector1.z);
        workingVector1.y = saturate(-workingVector0.w * workingVector1.z + 0.5);
        workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
      } else {
        workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.z == 5);
        if (workingVector0.w != 0) {
          workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
          workingVector2.xy = fragmentVectorConstants1[workingVector0.x+0].yy * float2(0.5,0.5) + varyingTexCoord1.zw;
          workingVector2.xy = workingVector1.zw / workingVector2.xy;
          workingVector0.w = dot(workingVector2.xy, workingVector2.xy);
          workingVector0.w = -1 + workingVector0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector2.zw = ddx(workingVector2.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector2.zw = ddx_coarse(workingVector2.xy);
#endif
          workingVector3.xy = -workingVector2.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector3.xy = ddy(workingVector3.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.xy = ddy_coarse(workingVector3.xy);
#endif
          workingVector2.xy = workingVector2.xy + workingVector2.xy;
          workingVector2.zw = workingVector2.xy * workingVector2.zw;
          workingVector2.xy = workingVector2.xy * workingVector3.xy;
          workingVector4.xy = workingVector2.zx + workingVector2.wy;
          workingVector2.x = dot(workingVector4.xy, workingVector4.xy);
          workingVector2.x = max(9.99999975e-005, workingVector2.x);
          workingVector2.x = rsqrt(workingVector2.x);
          workingVector0.w = saturate(-workingVector0.w * workingVector2.x + 0.5);
          workingVector2.xy = -fragmentVectorConstants1[workingVector0.x+0].yy * float2(0.5,0.5) + varyingTexCoord1.zw;
          workingVector1.zw = workingVector1.zw / workingVector2.xy;
          workingVector2.x = dot(workingVector1.zw, workingVector1.zw);
          workingVector2.x = -1 + workingVector2.x;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector2.yz = ddx(workingVector1.zw);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector2.yz = ddx_coarse(workingVector1.zw);
#endif
          workingVector3.xy = -workingVector1.zw;
#if RD_PLATFORM == RD_PLATFORM_SM40
          workingVector3.xy = ddy(workingVector3.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
          workingVector3.xy = ddy_coarse(workingVector3.xy);
#endif
          workingVector1.zw = workingVector1.zw + workingVector1.zw;
          workingVector2.yz = workingVector1.zw * workingVector2.yz;
          workingVector4.x = workingVector2.y + workingVector2.z;
          workingVector1.zw = workingVector1.zw * workingVector3.xy;
          workingVector4.y = workingVector1.z + workingVector1.w;
          workingVector1.z = dot(workingVector4.xy, workingVector4.xy);
          workingVector1.z = max(9.99999975e-005, workingVector1.z);
          workingVector1.z = rsqrt(workingVector1.z);
          workingVector1.z = saturate(workingVector2.x * workingVector1.z + 0.5);
          workingVector1.y = workingVector1.z * workingVector0.w;
          workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
        } else {
          workingVector0.w = (int)fragmentVectorConstants1[workingVector0.x+0].x;
          workingVector1.z = RD_COMPARISON_MASK((int)workingVector0.z == 6);
          if (workingVector1.z != 0) {
            workingVector1.z = (int)workingVector0.w + 1;
            workingVector1.w = RD_COMPARISON_MASK(3 < fragmentVectorConstants1[workingVector0.w+0].x);
            workingVector2.x = fragmentVectorConstants1[workingVector0.w+0].x * 0.307196319;
            workingVector2.yz = fragmentVectorConstants1[workingVector0.w+0].xx * float2(0.100000001,0.5) + float2(0.600000024,1);
            workingVector1.w = workingVector1.w ? workingVector2.x : workingVector2.y;
            workingVector2.x = (int)fragmentVectorConstants1[workingVector0.w+0].x;
#if RD_PLATFORM == RD_PLATFORM_SM40
            workingVector2.x = (uint)workingVector2.x << 1;
            workingVector2.x = (int)workingVector2.x + 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bitMask.x = ((~(-1 << 31)) << 1) & 0xffffffff;  workingVector2.x = (((uint)workingVector2.x << 1) & bitMask.x) | ((uint)1 & ~bitMask.x);
#endif
            workingVector2.y = (int)workingVector2.x ^ 2;
            workingVector2.w = max((int)-workingVector2.x, (int)workingVector2.x);
            workingVector2.w = (uint)workingVector2.w >> 1;
            workingVector3.x = -(int)workingVector2.w;
            workingVector2.y = (int)workingVector2.y & 0x80000000;
            workingVector2.y = workingVector2.y ? workingVector3.x : workingVector2.w;
            workingVector2.w = 2.50662827 * workingVector1.w;
            workingVector3.xy = float2(0,0);
            while (true) {
              workingVector3.z = RD_COMPARISON_MASK((int)workingVector3.y >= (int)workingVector2.x);
              if (workingVector3.z != 0) break;
              workingVector3.z = (int)-workingVector2.y + (int)workingVector3.y;
              workingVector3.z = (int)workingVector3.z;
              workingVector3.z = workingVector3.z / workingVector1.w;
              workingVector3.z = workingVector3.z * workingVector3.z;
              workingVector3.z = -0.721347511 * workingVector3.z;
              workingVector3.z = exp2(workingVector3.z);
              workingVector3.z = workingVector3.z / workingVector2.w;
              workingVector3.x = workingVector3.x + workingVector3.z;
              workingVector3.y = (int)workingVector3.y + 1;
            }
            workingVector2.x = fragmentVectorConstants1[workingVector0.w+0].x + 1;
            workingVector2.y = 0.5 * workingVector2.x;
            workingVector2.y = floor(workingVector2.y);
            workingVector2.x = -workingVector2.y * 2 + workingVector2.x;
            workingVector2.y = 1 / workingVector2.w;
            workingVector2.y = workingVector2.y / workingVector3.x;
            workingVector2.y = 0.5 * workingVector2.y;
            workingVector2.xz = (int2)workingVector2.xz;
            workingVector3.y = RD_COMPARISON_MASK((int)workingVector2.x != 1);
            workingVector3.zw = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector1.z+0].zw);
            workingVector3.z = (int)workingVector3.w | (int)workingVector3.z;
            workingVector4.xy = fragmentVectorConstants1[workingVector1.z+0].xy + fragmentVectorConstants1[workingVector1.z+0].zw;
            workingVector4.zw = float2(0,0);
            workingVector1.x = 0;
            workingVector3.w = workingVector2.y;
            workingVector5.x = 0;
            while (true) {
              workingVector5.y = RD_COMPARISON_MASK((int)workingVector5.x >= (int)workingVector2.z);
              if (workingVector5.y != 0) break;
              workingVector5.y = RD_COMPARISON_MASK((int)workingVector5.x != 0);
              workingVector5.y = (int)workingVector3.y | (int)workingVector5.y;
              if (workingVector5.y != 0) {
                workingVector5.y = (uint)workingVector5.x << 1;
                workingVector5.z = (int)workingVector2.x + (int)-workingVector5.y;
                workingVector5.w = (int)workingVector5.z;
                workingVector5.w = workingVector5.w / workingVector1.w;
                workingVector5.w = workingVector5.w * workingVector5.w;
                workingVector5.w = -0.721347511 * workingVector5.w;
                workingVector5.w = exp2(workingVector5.w);
                workingVector5.w = workingVector5.w / workingVector2.w;
                workingVector5.w = workingVector5.w / workingVector3.x;
                workingVector5.w = workingVector5.x ? workingVector5.w : workingVector3.w;
                workingVector5.z = (int)workingVector5.z + -1;
                workingVector5.z = (int)workingVector5.z;
                workingVector5.z = workingVector5.z / workingVector1.w;
                workingVector5.z = workingVector5.z * workingVector5.z;
                workingVector5.z = -0.721347511 * workingVector5.z;
                workingVector5.z = exp2(workingVector5.z);
                workingVector5.z = workingVector5.z / workingVector2.w;
                workingVector5.z = workingVector5.z / workingVector3.x;
                workingVector3.w = workingVector5.w + workingVector5.z;
                workingVector5.y = (int)-workingVector2.x + (int)workingVector5.y;
                workingVector5.y = (int)workingVector5.y;
                workingVector5.z = workingVector5.z / workingVector3.w;
                workingVector5.y = workingVector5.y + workingVector5.z;
                workingVector4.zw = fragmentVectorConstants1[workingVector0.w+0].yz * workingVector5.yy;
              }
              workingVector6.xy = varyingTexCoord1.xy + workingVector4.zw;
              workingVector6.zw = varyingTexCoord1.xy + -workingVector4.zw;
              workingVector5.yz = max(fragmentVectorConstants1[workingVector1.z+0].xy, workingVector6.xy);
              workingVector7.xy = min(workingVector5.yz, workingVector4.xy);
              workingVector5.yz = max(fragmentVectorConstants1[workingVector1.z+0].xy, workingVector6.zw);
              workingVector7.zw = min(workingVector5.yz, workingVector4.xy);
              workingVector6.xyzw = workingVector3.zzzz ? workingVector7.xyzw : workingVector6.xyzw;
              workingVector6.xyzw = workingVector6.xyzw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zwzw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xyxy;
#if RD_PLATFORM == RD_PLATFORM_SM40
              workingVector7.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.xy).xyzw;
              workingVector6.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.zw).xyzw;
              workingVector5.y = workingVector7.w + workingVector6.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
              workingVector5.y = materialTexture0.Sample(textureSampler0, workingVector6.xy).w;
              workingVector5.z = materialTexture0.Sample(textureSampler0, workingVector6.zw).w;
              workingVector5.y = workingVector5.y + workingVector5.z;
#endif
              workingVector1.x = workingVector3.w * workingVector5.y + workingVector1.x;
              workingVector5.x = (int)workingVector5.x + 1;
            }
            workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w;
          } else {
            workingVector1.z = (int)workingVector0.w + -1;
            workingVector1.z = max(0, (int)workingVector1.z);
            workingVector1.z = (int)fragmentVectorConstants1[workingVector1.z+0].y;
            workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 7);
            if (workingVector1.w != 0) {
              workingVector2.xy = RD_COMPARISON_MASK(float2(-1,-1) != fragmentVectorConstants1[workingVector0.w+0].zw);
              workingVector1.w = (int)workingVector2.y | (int)workingVector2.x;
              workingVector2.xy = fragmentVectorConstants1[workingVector0.w+0].xy + fragmentVectorConstants1[workingVector0.w+0].zw;
              workingVector2.zw = max(fragmentVectorConstants1[workingVector0.w+0].xy, varyingTexCoord1.xy);
              workingVector2.xy = min(workingVector2.zw, workingVector2.xy);
              workingVector2.xy = workingVector1.ww ? workingVector2.xy : varyingTexCoord1.xy;
              workingVector2.xy = workingVector2.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
              workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
              workingVector1.w = (int)workingVector1.z & 2;
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
                workingVector1.w = (int)workingVector1.z & 16;
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
              workingVector3.w = max(9.99999975e-006, workingVector2.w);
              workingVector3.xyz = workingVector2.xyz / workingVector3.www;
              workingVector2.xyzw = (int4)workingVector0.wwww + int4(4,5,1,2);
              workingVector1.w = (int)workingVector0.w + 3;
              workingVector4.x = dot(workingVector3.xyzw, fragmentVectorConstants1[workingVector2.z+0].xyzw);
              workingVector4.y = dot(workingVector3.xyzw, fragmentVectorConstants1[workingVector2.w+0].xyzw);
              workingVector4.z = dot(workingVector3.xyzw, fragmentVectorConstants1[workingVector1.w+0].xyzw);
              workingVector4.w = dot(workingVector3.xyzw, fragmentVectorConstants1[workingVector2.x+0].xyzw);
              workingVector2.xyzw = fragmentVectorConstants1[workingVector2.y+0].xyzw + workingVector4.xyzw;
              workingVector1.w = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
              workingVector2.x = workingVector2.w + -workingVector1.w;
              workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].z * workingVector2.x + workingVector1.w;
              workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.w;
              workingVector2.x = saturate(varyingTexCoord1.z);
              workingVector1.y = workingVector2.x * workingVector1.w;
              workingVector1.x = 1;
            } else {
              workingVector2.xy = RD_COMPARISON_MASK((int2)workingVector0.zz == int2(9,12));
              workingVector1.w = (int)workingVector2.y | (int)workingVector2.x;
              if (workingVector1.w != 0) {
                if (workingVector2.y != 0) {
                  workingVector1.w = saturate(varyingTexCoord1.z);
                  workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.w;
                  workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_3.zw + RD_UNIFORM_UV_TRANSFORM_ROW_3.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                  workingVector2.xyzw = materialTexture3.Sample(textureSampler3, workingVector2.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                  workingVector2.x = materialTexture3.Sample(textureSampler3, workingVector2.xy).x;
#endif
                  workingVector1.y = workingVector2.x * workingVector1.w;
                } else {
                  workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w;
                }
                workingVector1.x = 1;
              } else {
                workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 11);
                if (workingVector1.w != 0) {
                  workingVector2.xy = varyingTexCoord2.xy;
                  workingVector2.z = 1;
                  workingVector1.w = dot(varyingTexCoord1.xyz, workingVector2.xyz);
                  workingVector1.w = min(1, abs(workingVector1.w));
                  workingVector1.w = 1 + -workingVector1.w;
                  workingVector1.y = saturate(varyingTexCoord1.w * workingVector1.w);
                  workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
                } else {
                  workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 19);
                  if (workingVector1.w != 0) {
                    workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
                    workingVector1.w = (int)workingVector0.w + 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector1.w = materialTexture0.Sample(textureSampler0, workingVector2.xy).x;
                    workingVector2.x = (int)workingVector0.w + 1;
#endif
                    workingVector2.y = fragmentVectorConstants1[workingVector0.w+0].y * 0.5;
                    workingVector2.y = sqrt(workingVector2.y);
                    workingVector2.z = workingVector2.y * 0.5 + -0.899999976;
                    workingVector2.w = fragmentVectorConstants1[workingVector0.w+0].z / fragmentVectorConstants1[workingVector0.w+0].y;
                    workingVector2.w = workingVector2.w * workingVector2.y;
                    workingVector3.x = workingVector2.w * 0.5 + workingVector2.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector3.x = saturate(workingVector2.x * workingVector2.y + -workingVector3.x);
                    workingVector3.y = fragmentVectorConstants1[workingVector0.y+0].w + -fragmentVectorConstants1[workingVector1.w+0].w;
                    workingVector1.w = workingVector3.x * workingVector3.y + fragmentVectorConstants1[workingVector1.w+0].w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector3.x = saturate(workingVector1.w * workingVector2.y + -workingVector3.x);
                    workingVector3.y = fragmentVectorConstants1[workingVector0.y+0].w + -fragmentVectorConstants1[workingVector2.x+0].w;
                    workingVector2.x = workingVector3.x * workingVector3.y + fragmentVectorConstants1[workingVector2.x+0].w;
#endif
                    workingVector2.z = -workingVector2.w * 0.5 + workingVector2.z;
                    workingVector2.z = max(0, workingVector2.z);
#if RD_PLATFORM == RD_PLATFORM_SM40
                    workingVector2.x = saturate(workingVector2.x * workingVector2.y + -workingVector2.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    workingVector1.w = saturate(workingVector1.w * workingVector2.y + -workingVector2.z);
#endif
                    workingVector1.x = workingVector2.x * workingVector1.w;
                    workingVector1.y = 1;
                  } else {
                    workingVector2.xy = RD_COMPARISON_MASK((int2)workingVector0.zz == int2(32,35));
                    workingVector1.w = (int)workingVector2.y | (int)workingVector2.x;
                    if (workingVector1.w != 0) {
                      workingVector1.w = (int)fragmentVectorConstants1[workingVector0.y+0].x;
                      workingVector2.xz = (int2)workingVector1.ww & int2(1,2);
                      workingVector2.xz = workingVector2.xz ? float2(1,1) : float2(0,0);
                      if (workingVector2.y != 0) {
                        workingVector2.yw = frac(varyingTexCoord1.zw);
                        workingVector2.yw = fragmentVectorConstants1[workingVector0.w+0].zw * workingVector2.yw + fragmentVectorConstants1[workingVector0.w+0].xy;
                        workingVector2.yw = workingVector2.yw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.yw).xyzw;
                      } else {
                        workingVector2.yw = varyingTexCoord1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector3.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.yw).xyzw;
                      }
                      workingVector1.w = (int)workingVector1.z & 2;
                      if (workingVector1.w != 0) {
                        workingVector4.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector3.xyz;
                        workingVector5.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector3.xyz);
                        workingVector6.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector3.xyz;
                        workingVector6.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector6.xyz;
                        workingVector6.xyz = log2(workingVector6.xyz);
                        workingVector6.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector6.xyz;
                        workingVector6.xyz = exp2(workingVector6.xyz);
                        workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
                      } else {
                        workingVector1.w = (int)workingVector1.z & 16;
                        if (workingVector1.w != 0) {
                          workingVector4.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector3.xyz;
                          workingVector5.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector3.xyz);
                          workingVector6.xyz = log2(workingVector3.xyz);
                          workingVector6.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector6.xyz;
                          workingVector6.xyz = exp2(workingVector6.xyz);
                          workingVector6.xyz = workingVector6.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                          workingVector3.xyz = workingVector5.xyz ? workingVector6.xyz : workingVector4.xyz;
                        }
                      }
                      workingVector1.w = workingVector3.w * -2 + 1;
                      workingVector1.w = workingVector2.x * workingVector1.w + workingVector3.w;
                      workingVector2.x = saturate(dot(workingVector3.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                      workingVector1.w = -workingVector2.x + workingVector1.w;
                      workingVector1.w = fragmentVectorConstants1[workingVector0.y+0].z * workingVector1.w + workingVector2.x;
                      workingVector2.x = 1 + -workingVector1.w;
                      workingVector1.x = workingVector2.z * workingVector2.x + workingVector1.w;
                      workingVector2.xy = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                      workingVector3.x = varyingTexCoord2.z;
                      workingVector3.y = fragmentVectorConstants1[workingVector0.x+0].y;
                      workingVector2.xy = workingVector2.xy / workingVector3.xy;
                      workingVector1.w = dot(workingVector2.xy, workingVector2.xy);
                      workingVector1.w = -1 + workingVector1.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
                      workingVector2.zw = ddx(workingVector2.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                      workingVector2.zw = ddx_coarse(workingVector2.xy);
#endif
                      workingVector3.xy = -workingVector2.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                      workingVector3.xy = ddy(workingVector3.xy);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                      workingVector3.xy = ddy_coarse(workingVector3.xy);
#endif
                      workingVector2.xy = workingVector2.xy + workingVector2.xy;
                      workingVector2.zw = workingVector2.xy * workingVector2.zw;
                      workingVector2.xy = workingVector2.xy * workingVector3.xy;
                      workingVector4.xy = workingVector2.zx + workingVector2.wy;
                      workingVector2.x = dot(workingVector4.xy, workingVector4.xy);
                      workingVector2.x = max(9.99999975e-005, workingVector2.x);
                      workingVector2.x = rsqrt(workingVector2.x);
                      workingVector1.w = saturate(-workingVector1.w * workingVector2.x + 0.5);
                      workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.w;
                    } else {
                      workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 33);
                      if (workingVector1.w != 0) {
                        workingVector1.w = min(fragmentVectorConstants1[workingVector0.w+0].y, fragmentVectorConstants1[workingVector0.w+0].x);
                        workingVector2.x = (int)workingVector0.w + 1;
                        workingVector2.yz = frac(varyingTexCoord1.zw);
                        workingVector2.xy = fragmentVectorConstants1[workingVector2.x+0].zw * workingVector2.yz + fragmentVectorConstants1[workingVector2.x+0].xy;
                        workingVector2.xy = workingVector2.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                        workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
                        workingVector3.x = (int)workingVector1.z & 2;
                        if (workingVector3.x != 0) {
                          workingVector3.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * workingVector2.xyz;
                          workingVector4.xyz = RD_COMPARISON_MASK(float3(0.0404499993,0.0404499993,0.0404499993) < workingVector2.xyz);
                          workingVector5.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + workingVector2.xyz;
                          workingVector5.xyz = float3(0.947867334,0.947867334,0.947867334) * workingVector5.xyz;
                          workingVector5.xyz = log2(workingVector5.xyz);
                          workingVector5.xyz = float3(2.4000001,2.4000001,2.4000001) * workingVector5.xyz;
                          workingVector5.xyz = exp2(workingVector5.xyz);
                          workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                        } else {
                          workingVector3.x = (int)workingVector1.z & 16;
                          if (workingVector3.x != 0) {
                            workingVector3.xyz = float3(12.9200001,12.9200001,12.9200001) * workingVector2.xyz;
                            workingVector4.xyz = RD_COMPARISON_MASK(float3(0.00313080009,0.00313080009,0.00313080009) < workingVector2.xyz);
                            workingVector5.xyz = log2(workingVector2.xyz);
                            workingVector5.xyz = float3(0.416666657,0.416666657,0.416666657) * workingVector5.xyz;
                            workingVector5.xyz = exp2(workingVector5.xyz);
                            workingVector5.xyz = workingVector5.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
                            workingVector2.xyz = workingVector4.xyz ? workingVector5.xyz : workingVector3.xyz;
                          }
                        }
                        workingVector3.x = 1 + -workingVector2.w;
                        workingVector2.w = -workingVector3.x + workingVector2.w;
                        workingVector2.w = fragmentVectorConstants1[workingVector0.y+0].x * workingVector2.w + workingVector3.x;
                        workingVector2.x = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                        workingVector2.y = workingVector2.w + -workingVector2.x;
                        workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].z * workingVector2.y + workingVector2.x;
                        workingVector2.y = 1 + -workingVector2.x;
                        workingVector1.x = fragmentVectorConstants1[workingVector0.x+0].y * workingVector2.y + workingVector2.x;
                        workingVector2.xy = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                        workingVector2.x = dot(workingVector2.xy, workingVector2.xy);
                        workingVector2.x = sqrt(workingVector2.x);
                        workingVector2.x = -varyingTexCoord2.z + workingVector2.x;
                        workingVector1.w = saturate(-workingVector1.w * workingVector2.x + 0.5);
                        workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.w;
                      } else {
                        workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 23);
                        if (workingVector1.w != 0) {
                          workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
                          workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                          workingVector1.w = workingVector1.w * 0.5 + 0.5;
                          workingVector2.y = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector1.w = materialTexture0.Sample(textureSampler0, workingVector2.xy).x;
                          workingVector2.x = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                          workingVector2.x = workingVector2.x * 0.5 + 0.5;
                          workingVector2.y = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.x;
#endif
                          workingVector2.z = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.y;
                          workingVector2.y = fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.y;
                          workingVector2.y = workingVector2.y + -workingVector2.z;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector2.z = workingVector2.x + -workingVector2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector2.z = -workingVector2.z + workingVector1.w;
#endif
                          workingVector2.y = 1 / workingVector2.y;
                          workingVector2.y = saturate(workingVector2.z * workingVector2.y);
                          workingVector2.z = workingVector2.y * -2 + 3;
                          workingVector2.y = workingVector2.y * workingVector2.y;
                          workingVector2.y = workingVector2.z * workingVector2.y;
                          workingVector2.z = RD_COMPARISON_MASK(0 >= workingVector2.y);
                          if (workingVector2.z != 0) discard;
                          workingVector2.z = (int)workingVector0.w + 1;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector2.w = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                          workingVector1.w = workingVector1.w + -workingVector2.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector2.w = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.x;
                          workingVector2.x = fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.x;
#endif
                          workingVector2.x = workingVector2.x + -workingVector2.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
                          workingVector1.w = 1 / workingVector1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                          workingVector1.w = -workingVector2.w + workingVector1.w;
                          workingVector2.x = 1 / workingVector2.x;
#endif
                          workingVector1.w = saturate(workingVector2.x * workingVector1.w);
                          workingVector2.x = workingVector1.w * -2 + 3;
                          workingVector1.w = workingVector1.w * workingVector1.w;
                          workingVector1.w = workingVector2.x * workingVector1.w;
                          workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].w + -fragmentVectorConstants1[workingVector2.z+0].w;
                          workingVector1.w = workingVector1.w * workingVector2.x + fragmentVectorConstants1[workingVector2.z+0].w;
                          workingVector1.x = workingVector1.w * workingVector2.y;
                          workingVector1.y = 1;
                        } else {
                          workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 24);
                          if (workingVector1.w != 0) {
                            workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_3.zw + RD_UNIFORM_UV_TRANSFORM_ROW_3.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                            workingVector2.xyzw = materialTexture3.Sample(textureSampler3, workingVector2.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            workingVector2.xyz = materialTexture3.Sample(textureSampler3, workingVector2.xy).xyz;
#endif
                            workingVector1.w = min(workingVector2.x, workingVector2.y);
                            workingVector2.x = max(workingVector2.x, workingVector2.y);
                            workingVector2.x = min(workingVector2.x, workingVector2.z);
                            workingVector1.w = max(workingVector2.x, workingVector1.w);
                            workingVector2.x = 0.5 + -varyingTexCoord1.z;
                            workingVector2.y = 0.5 + varyingTexCoord1.z;
                            workingVector2.y = workingVector2.y + -workingVector2.x;
                            workingVector1.w = -workingVector2.x + workingVector1.w;
                            workingVector2.x = 1 / workingVector2.y;
                            workingVector1.w = saturate(workingVector2.x * workingVector1.w);
                            workingVector2.x = workingVector1.w * -2 + 3;
                            workingVector1.w = workingVector1.w * workingVector1.w;
                            workingVector1.w = workingVector2.x * workingVector1.w;
                            workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w * workingVector1.w;
                            workingVector1.y = 1;
                          } else {
                            workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 25);
                            if (workingVector1.w != 0) {
                              workingVector2.xy = varyingTexCoord1.xy * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
#if RD_PLATFORM == RD_PLATFORM_SM40
                              workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                              workingVector2.xyz = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyz;
#endif
                              workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x;
                              workingVector1.w = workingVector1.w * 0.5 + 0.5;
                              workingVector2.w = -fragmentVectorConstants1[workingVector0.w+0].z * fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                              workingVector3.x = min(workingVector2.x, workingVector2.y);
                              workingVector2.x = max(workingVector2.x, workingVector2.y);
                              workingVector2.x = min(workingVector2.x, workingVector2.z);
                              workingVector2.x = max(workingVector3.x, workingVector2.x);
                              workingVector2.y = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.w;
                              workingVector2.z = fragmentVectorConstants1[workingVector0.w+0].x + workingVector2.w;
                              workingVector2.z = workingVector2.z + -workingVector2.y;
                              workingVector2.y = workingVector2.x + -workingVector2.y;
                              workingVector2.z = 1 / workingVector2.z;
                              workingVector2.y = saturate(workingVector2.y * workingVector2.z);
                              workingVector2.z = workingVector2.y * -2 + 3;
                              workingVector2.y = workingVector2.y * workingVector2.y;
                              workingVector2.y = workingVector2.z * workingVector2.y;
                              workingVector2.z = RD_COMPARISON_MASK(0 >= workingVector2.y);
                              if (workingVector2.z != 0) discard;
                              workingVector2.z = (int)workingVector0.w + 1;
                              workingVector2.w = -fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                              workingVector1.w = fragmentVectorConstants1[workingVector0.w+0].x + workingVector1.w;
                              workingVector1.w = workingVector1.w + -workingVector2.w;
                              workingVector2.x = workingVector2.x + -workingVector2.w;
                              workingVector1.w = 1 / workingVector1.w;
                              workingVector1.w = saturate(workingVector2.x * workingVector1.w);
                              workingVector2.x = workingVector1.w * -2 + 3;
                              workingVector1.w = workingVector1.w * workingVector1.w;
                              workingVector1.w = workingVector2.x * workingVector1.w;
                              workingVector2.x = fragmentVectorConstants1[workingVector0.y+0].w + -fragmentVectorConstants1[workingVector2.z+0].w;
                              workingVector1.w = workingVector1.w * workingVector2.x + fragmentVectorConstants1[workingVector2.z+0].w;
                              workingVector1.x = workingVector1.w * workingVector2.y;
                              workingVector1.y = 1;
                            } else {
                              workingVector1.w = RD_COMPARISON_MASK((int)workingVector0.z == 31);
                              if (workingVector1.w != 0) {
                                workingVector2.xy = varyingTexCoord1.zw * RD_UNIFORM_UV_TRANSFORM_ROW_0.zw + RD_UNIFORM_UV_TRANSFORM_ROW_0.xy;
                                workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector2.xy).xyzw;
                                workingVector1.w = (int)workingVector1.z & 2;
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
                                  workingVector1.z = (int)workingVector1.z & 16;
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
                                workingVector1.z = 1 + -workingVector2.w;
                                workingVector1.w = workingVector2.w + -workingVector1.z;
                                workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].x * workingVector1.w + workingVector1.z;
                                workingVector1.w = saturate(dot(workingVector2.xyz, float3(0.212599993,0.715200007,0.0722000003)));
                                workingVector1.z = workingVector1.z + -workingVector1.w;
                                workingVector1.z = fragmentVectorConstants1[workingVector0.y+0].z * workingVector1.z + workingVector1.w;
                                workingVector1.w = 1 + -workingVector1.z;
                                workingVector1.x = fragmentVectorConstants1[workingVector0.x+0].y * workingVector1.w + workingVector1.z;
                                workingVector0.x = min(fragmentVectorConstants1[workingVector0.w+0].y, fragmentVectorConstants1[workingVector0.w+0].x);
                                workingVector1.zw = varyingTexCoord2.xy + -varyingTexCoord1.xy;
                                workingVector0.w = dot(workingVector1.zw, workingVector1.zw);
                                workingVector0.w = sqrt(workingVector0.w);
                                workingVector0.w = -varyingTexCoord2.z + workingVector0.w;
                                workingVector0.x = saturate(-workingVector0.x * workingVector0.w + 0.5);
                                workingVector1.y = fragmentVectorConstants1[workingVector0.y+0].w * workingVector0.x;
                              } else {
                                workingVector1.x = fragmentVectorConstants1[workingVector0.y+0].w;
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
  workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.z == 3);
  workingVector0.x = workingVector0.x ? workingVector1.x : workingVector1.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.00390625);
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = float4(0,0,0,0);
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
    if (scalarValue == 1u)
    {
        float scalarValue2 = varyingTexCoord2.x - varyingTexCoord1.x;
        float sumValue2 = varyingTexCoord2.y - varyingTexCoord1.y;
        nonlinearValue = min(max((varyingTexCoord1.z + 0.5f) - sqrt((sumValue2 * sumValue2) + (scalarValue2 * scalarValue2)), 0.0f), 1.0f);
        intermediateValue3 = fragmentConstants[sumValue].w;
    }
    else
    {
        float branchMergedValue4;
        float branchMergedValue7;
        if (scalarValue == 2u)
        {
            float scalarValue3 = varyingTexCoord2.x - varyingTexCoord1.x;
            float sumValue3 = varyingTexCoord2.y - varyingTexCoord1.y;
            float nonlinearValue1 = sqrt((sumValue3 * sumValue3) + (scalarValue3 * scalarValue3));
            float sumValue4 = varyingTexCoord1.z + 0.5f;
            branchMergedValue4 = (1.0f - min(max((sumValue4 - varyingTexCoord1.w) - nonlinearValue1, 0.0f), 1.0f)) * min(max(sumValue4 - nonlinearValue1, 0.0f), 1.0f);
            branchMergedValue7 = fragmentConstants[sumValue].w;
        }
        else
        {
            float branchMergedValue30;
            float branchMergedValue31;
            if (scalarValue == 4u)
            {
                float scalarValue4 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                float productValue = ((ddx_coarse(quotientValue) * quotientValue) + (ddx_coarse(scalarValue4) * scalarValue4)) * 2.0f;
                float productValue1 = ((ddy_coarse((-0.0f) - quotientValue) * quotientValue) + (ddy_coarse((-0.0f) - scalarValue4) * scalarValue4)) * 2.0f;
                branchMergedValue30 = clamp(0.5f - (rsqrt(max(dot(float2(productValue, productValue1), float2(productValue, productValue1)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(scalarValue4, quotientValue), float2(scalarValue4, quotientValue)) + (-1.0f))), 0.0f, 1.0f);
                branchMergedValue31 = fragmentConstants[sumValue].w;
            }
            else
            {
                float branchMergedValue44;
                float branchMergedValue45;
                if (scalarValue == 5u)
                {
                    float scalarValue5 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue5 = varyingTexCoord2.y - varyingTexCoord1.y;
                    float productValue2 = fragmentConstants[bitwiseValue].y * 0.5f;
                    float quotientValue1 = scalarValue5 / (productValue2 + varyingTexCoord1.z);
                    float quotientValue2 = sumValue5 / (productValue2 + varyingTexCoord1.w);
                    float productValue3 = ((ddx_coarse(quotientValue2) * quotientValue2) + (ddx_coarse(quotientValue1) * quotientValue1)) * 2.0f;
                    float productValue4 = ((ddy_coarse((-0.0f) - quotientValue2) * quotientValue2) + (ddy_coarse((-0.0f) - quotientValue1) * quotientValue1)) * 2.0f;
                    float quotientValue3 = scalarValue5 / (varyingTexCoord1.z - productValue2);
                    float quotientValue4 = sumValue5 / (varyingTexCoord1.w - productValue2);
                    float productValue5 = ((ddx_coarse(quotientValue4) * quotientValue4) + (ddx_coarse(quotientValue3) * quotientValue3)) * 2.0f;
                    float productValue6 = ((ddy_coarse((-0.0f) - quotientValue4) * quotientValue4) + (ddy_coarse((-0.0f) - quotientValue3) * quotientValue3)) * 2.0f;
                    branchMergedValue44 = clamp((rsqrt(max(dot(float2(productValue5, productValue6), float2(productValue5, productValue6)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue3, quotientValue4), float2(quotientValue3, quotientValue4)) + (-1.0f))) + 0.5f, 0.0f, 1.0f) * clamp(0.5f - (rsqrt(max(dot(float2(productValue3, productValue4), float2(productValue3, productValue4)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue1, quotientValue2), float2(quotientValue1, quotientValue2)) + (-1.0f))), 0.0f, 1.0f);
                    branchMergedValue45 = fragmentConstants[sumValue].w;
                }
                else
                {
                    float branchMergedValue46;
                    float branchMergedValue47;
                    if (scalarValue == 6u)
                    {
                        uint scalarValue6 = scalarValue1 + 1u;
                        float comparisonValue = (fragmentConstants[scalarValue1].x > 3.0f) ? (fragmentConstants[scalarValue1].x * 0.307196319103240966796875f) : ((fragmentConstants[scalarValue1].x * 0.100000001490116119384765625f) + 0.60000002384185791015625f);
                        uint bitwiseValue1 = uint(int(fragmentConstants[scalarValue1].x)) << 1u;
                        uint bitwiseValue2 = bitwiseValue1 | 1u;
                        uint quotientValue5 = uint(int(bitwiseValue2) / int(2u));
                        float intermediateValue8;
                        if (int(bitwiseValue2) > int(0u))
                        {
                            uint bitwiseValue3 = bitwiseValue1 | 1u;
                            float intermediateValue9;
                            uint intermediateValue10;
                            intermediateValue9 = 0.0f;
                            intermediateValue10 = 0u;
                            float exponentialValue;
                            for (;;)
                            {
                                float quotientValue6 = float(int(intermediateValue10 - quotientValue5)) / comparisonValue;
                                exponentialValue = (exp2((quotientValue6 * quotientValue6) * (-0.721347510814666748046875f)) / (comparisonValue * 2.5066282749176025390625f)) + intermediateValue9;
                                uint sumValue6 = intermediateValue10 + 1u;
                                if (sumValue6 == bitwiseValue3)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue9 = exponentialValue;
                                    intermediateValue10 = sumValue6;
                                }
                            }
                            intermediateValue8 = exponentialValue;
                        }
                        else
                        {
                            intermediateValue8 = 0.0f;
                        }
                        float sumValue7 = fragmentConstants[scalarValue1].x + 1.0f;
                        uint productValue7 = uint(int(sumValue7 - (floor(sumValue7 * 0.5f) * 2.0f)));
                        uint productValue8 = uint(int((fragmentConstants[scalarValue1].x * 0.5f) + 1.0f));
                        float branchMergedValue49;
                        float branchMergedValue51;
                        if (int(productValue8) > int(0u))
                        {
                            float quotientValue7 = 0.1994711458683013916015625f / (intermediateValue8 * comparisonValue);
                            float sampledTextureValue;
                            float intermediateValue25;
                            float intermediateValue26;
                            float intermediateValue27;
                            float intermediateValue28;
                            float intermediateValue15;
                            float productValue9;
                            float productValue10;
                            float scalarValue7 = quotientValue7;
                            float scalarValue8 = 0.0f;
                            float scalarValue9 = 0.0f;
                            uint scalarValue10 = 0u;
                            float scalarValue11 = 0.0f;
                            bool comparisonValue2;
                            for (;;)
                            {
                                comparisonValue2 = (productValue7 != 1u) || (scalarValue10 != 0u);
                                if (comparisonValue2)
                                {
                                    uint bitwiseValue4 = scalarValue10 << 1u;
                                    float quotientValue8 = float(int(productValue7 - bitwiseValue4)) / comparisonValue;
                                    float productValue11 = (comparisonValue * 2.5066282749176025390625f) * intermediateValue8;
                                    float bitwiseValue5 = float(int(productValue7 - (bitwiseValue4 | 1u))) / comparisonValue;
                                    float exponentialValue1 = exp2((bitwiseValue5 * bitwiseValue5) * (-0.721347510814666748046875f)) / productValue11;
                                    float exponentialValue2 = exponentialValue1 + ((scalarValue10 == 0u) ? scalarValue7 : (exp2((quotientValue8 * quotientValue8) * (-0.721347510814666748046875f)) / productValue11));
                                    float quotientValue9 = (exponentialValue1 / exponentialValue2) + float(int(bitwiseValue4 - productValue7));
                                    intermediateValue15 = exponentialValue2;
                                    productValue9 = quotientValue9 * fragmentConstants[scalarValue1].y;
                                    productValue10 = quotientValue9 * fragmentConstants[scalarValue1].z;
                                }
                                else
                                {
                                    intermediateValue15 = scalarValue7;
                                    productValue9 = scalarValue8;
                                    productValue10 = scalarValue9;
                                }
                                float sumValue10 = productValue9 + varyingTexCoord1.x;
                                float sumValue11 = productValue10 + varyingTexCoord1.y;
                                float sumValue12 = varyingTexCoord1.x - productValue9;
                                float sumValue13 = varyingTexCoord1.y - productValue10;
                                float branchMergedValue;
                                float branchMergedValue1;
                                float branchMergedValue2;
                                float branchMergedValue3;
                                if ((fragmentConstants[scalarValue6].z != (-1.0f)) || (fragmentConstants[scalarValue6].w != (-1.0f)))
                                {
                                    float sumValue14 = fragmentConstants[scalarValue6].x + fragmentConstants[scalarValue6].z;
                                    float sumValue15 = fragmentConstants[scalarValue6].y + fragmentConstants[scalarValue6].w;
                                    branchMergedValue = min(max(sumValue13, fragmentConstants[scalarValue6].y), sumValue15);
                                    branchMergedValue1 = min(max(sumValue12, fragmentConstants[scalarValue6].x), sumValue14);
                                    branchMergedValue2 = min(max(sumValue11, fragmentConstants[scalarValue6].y), sumValue15);
                                    branchMergedValue3 = min(max(sumValue10, fragmentConstants[scalarValue6].x), sumValue14);
                                }
                                else
                                {
                                    branchMergedValue = sumValue13;
                                    branchMergedValue1 = sumValue12;
                                    branchMergedValue2 = sumValue11;
                                    branchMergedValue3 = sumValue10;
                                }
                                intermediateValue28 = branchMergedValue;
                                intermediateValue27 = branchMergedValue1;
                                intermediateValue26 = branchMergedValue2;
                                intermediateValue25 = branchMergedValue3;
                                sampledTextureValue = ((txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * intermediateValue27) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * intermediateValue28) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).w + txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * intermediateValue25) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * intermediateValue26) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).w) * intermediateValue15) + scalarValue11;
                                uint sumValue16 = scalarValue10 + 1u;
                                if (sumValue16 == productValue8)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue7 = intermediateValue15;
                                    scalarValue8 = productValue9;
                                    scalarValue9 = productValue10;
                                    scalarValue10 = sumValue16;
                                    scalarValue11 = sampledTextureValue;
                                    continue;
                                }
                            }
                            branchMergedValue49 = fragmentConstants[sumValue].w;
                            branchMergedValue51 = sampledTextureValue;
                        }
                        else
                        {
                            branchMergedValue49 = fragmentConstants[sumValue].w;
                            branchMergedValue51 = 0.0f;
                        }
                        branchMergedValue46 = branchMergedValue49;
                        branchMergedValue47 = branchMergedValue51;
                    }
                    else
                    {
                        float branchMergedValue48;
                        float branchMergedValue50;
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
                            float4 sampledTextureValue1 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * sumValue8) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * sumValue9) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                            float scalarValue12 = sampledTextureValue1.x;
                            float scalarValue13 = sampledTextureValue1.y;
                            float scalarValue14 = sampledTextureValue1.z;
                            float intermediateValue20;
                            float intermediateValue21;
                            float intermediateValue22;
                            if ((sumValue1 & 2u) == 0u)
                            {
                                float branchMergedValue5;
                                float branchMergedValue14;
                                float branchMergedValue15;
                                if ((sumValue1 & 16u) == 0u)
                                {
                                    branchMergedValue5 = scalarValue13;
                                    branchMergedValue14 = scalarValue14;
                                    branchMergedValue15 = scalarValue12;
                                }
                                else
                                {
                                    float exponentialValue4;
                                    if (!(scalarValue12 <= 0.003130800090730190277099609375f))
                                    {
                                        exponentialValue4 = (exp2(log2(scalarValue12) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                    }
                                    else
                                    {
                                        exponentialValue4 = scalarValue12 * 12.9200000762939453125f;
                                    }
                                    float exponentialValue6;
                                    if (!(scalarValue13 <= 0.003130800090730190277099609375f))
                                    {
                                        exponentialValue6 = (exp2(log2(scalarValue13) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                    }
                                    else
                                    {
                                        exponentialValue6 = scalarValue13 * 12.9200000762939453125f;
                                    }
                                    float branchMergedValue32;
                                    float branchMergedValue35;
                                    float branchMergedValue36;
                                    if (!(scalarValue14 <= 0.003130800090730190277099609375f))
                                    {
                                        branchMergedValue32 = exponentialValue6;
                                        branchMergedValue35 = (exp2(log2(scalarValue14) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                        branchMergedValue36 = exponentialValue4;
                                    }
                                    else
                                    {
                                        branchMergedValue32 = exponentialValue6;
                                        branchMergedValue35 = scalarValue14 * 12.9200000762939453125f;
                                        branchMergedValue36 = exponentialValue4;
                                    }
                                    branchMergedValue5 = branchMergedValue32;
                                    branchMergedValue14 = branchMergedValue35;
                                    branchMergedValue15 = branchMergedValue36;
                                }
                                intermediateValue20 = branchMergedValue15;
                                intermediateValue21 = branchMergedValue5;
                                intermediateValue22 = branchMergedValue14;
                            }
                            else
                            {
                                float exponentialValue3;
                                if (!(scalarValue12 <= 0.040449999272823333740234375f))
                                {
                                    exponentialValue3 = exp2(log2((scalarValue12 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                }
                                else
                                {
                                    exponentialValue3 = scalarValue12 * 0.077399380505084991455078125f;
                                }
                                float exponentialValue5;
                                if (!(scalarValue13 <= 0.040449999272823333740234375f))
                                {
                                    exponentialValue5 = exp2(log2((scalarValue13 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                }
                                else
                                {
                                    exponentialValue5 = scalarValue13 * 0.077399380505084991455078125f;
                                }
                                float branchMergedValue6;
                                float branchMergedValue16;
                                float branchMergedValue17;
                                if (!(scalarValue14 <= 0.040449999272823333740234375f))
                                {
                                    branchMergedValue6 = exponentialValue5;
                                    branchMergedValue16 = exp2(log2((scalarValue14 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                    branchMergedValue17 = exponentialValue3;
                                }
                                else
                                {
                                    branchMergedValue6 = exponentialValue5;
                                    branchMergedValue16 = scalarValue14 * 0.077399380505084991455078125f;
                                    branchMergedValue17 = exponentialValue3;
                                }
                                intermediateValue20 = branchMergedValue17;
                                intermediateValue21 = branchMergedValue6;
                                intermediateValue22 = branchMergedValue16;
                            }
                            float scalarValue15 = max(sampledTextureValue1.w, 9.9999997473787516355514526367188e-06f);
                            float quotientValue10 = intermediateValue20 / scalarValue15;
                            float quotientValue11 = intermediateValue21 / scalarValue15;
                            float quotientValue12 = intermediateValue22 / scalarValue15;
                            uint sumValue17 = scalarValue1 + 5u;
                            float clampedValue = clamp((((dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), float4(fragmentConstants[scalarValue1 + 2u])) + fragmentConstants[sumValue17].y) * 0.715200006961822509765625f) + ((dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), float4(fragmentConstants[scalarValue1 + 1u])) + fragmentConstants[sumValue17].x) * 0.2125999927520751953125f)) + ((dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), float4(fragmentConstants[scalarValue1 + 3u])) + fragmentConstants[sumValue17].z) * 0.072200000286102294921875f), 0.0f, 1.0f);
                            branchMergedValue48 = (clamp(varyingTexCoord1.z, 0.0f, 1.0f) * fragmentConstants[sumValue].w) * ((((dot(float4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), float4(fragmentConstants[scalarValue1 + 4u])) + fragmentConstants[sumValue17].w) - clampedValue) * fragmentConstants[sumValue].z) + clampedValue);
                            branchMergedValue50 = 1.0f;
                        }
                        else
                        {
                            bool comparisonValue1 = scalarValue == 12u;
                            float branchMergedValue52;
                            float branchMergedValue53;
                            if ((scalarValue == 9u) || comparisonValue1)
                            {
                                float branchMergedValue54;
                                float branchMergedValue56;
                                if (comparisonValue1)
                                {
                                    branchMergedValue54 = (clamp(varyingTexCoord1.z, 0.0f, 1.0f) * fragmentConstants[sumValue].w) * txBuffer3Texture.Sample(txBuffer3Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_3.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_3.x, (RD_UNIFORM_UV_TRANSFORM_ROW_3.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_3.y)).x;
                                    branchMergedValue56 = 1.0f;
                                }
                                else
                                {
                                    branchMergedValue54 = fragmentConstants[sumValue].w;
                                    branchMergedValue56 = 1.0f;
                                }
                                branchMergedValue52 = branchMergedValue54;
                                branchMergedValue53 = branchMergedValue56;
                            }
                            else
                            {
                                float branchMergedValue55;
                                float branchMergedValue57;
                                if (scalarValue == 11u)
                                {
                                    branchMergedValue55 = clamp((1.0f - clamp(abs(dot(float3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), float3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0f))), 0.0f, 1.0f)) * varyingTexCoord1.w, 0.0f, 1.0f);
                                    branchMergedValue57 = fragmentConstants[sumValue].w;
                                }
                                else
                                {
                                    float branchMergedValue58;
                                    float branchMergedValue59;
                                    if (scalarValue == 19u)
                                    {
                                        uint scalarValue16 = scalarValue1 + 1u;
                                        float nonlinearValue2 = sqrt(fragmentConstants[scalarValue1].y * 0.5f);
                                        float productValue12 = nonlinearValue2 * 0.5f;
                                        float sumValue18 = productValue12 + (-0.89999997615814208984375f);
                                        float quotientValue13 = productValue12 * (fragmentConstants[scalarValue1].z / fragmentConstants[scalarValue1].y);
                                        float sampledTextureValue2 = nonlinearValue2 * txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y)).x;
                                        branchMergedValue58 = 1.0f;
                                        branchMergedValue59 = ((clamp((sampledTextureValue2 - sumValue18) - quotientValue13, 0.0f, 1.0f) * (fragmentConstants[sumValue].w - fragmentConstants[scalarValue16].w)) + fragmentConstants[scalarValue16].w) * clamp(sampledTextureValue2 - max(0.0f, sumValue18 - quotientValue13), 0.0f, 1.0f);
                                    }
                                    else
                                    {
                                        bool comparisonValue3 = scalarValue == 35u;
                                        float branchMergedValue60;
                                        float branchMergedValue61;
                                        if ((scalarValue == 32u) || comparisonValue3)
                                        {
                                            uint scalarValue17 = uint(int(fragmentConstants[sumValue].x));
                                            float intermediateValue35;
                                            float intermediateValue36;
                                            float intermediateValue37;
                                            float intermediateValue38;
                                            if (comparisonValue3)
                                            {
                                                float4 sampledTextureValue3 = txBufferTexture.Sample(txBufferSampler, float2((((fragmentConstants[scalarValue1].z * frac(varyingTexCoord1.z)) + fragmentConstants[scalarValue1].x) * RD_UNIFORM_UV_TRANSFORM_ROW_0.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(varyingTexCoord1.w) * fragmentConstants[scalarValue1].w) + fragmentConstants[scalarValue1].y) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                intermediateValue35 = sampledTextureValue3.x;
                                                intermediateValue36 = sampledTextureValue3.y;
                                                intermediateValue37 = sampledTextureValue3.z;
                                                intermediateValue38 = sampledTextureValue3.w;
                                            }
                                            else
                                            {
                                                float4 sampledTextureValue4 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                intermediateValue35 = sampledTextureValue4.x;
                                                intermediateValue36 = sampledTextureValue4.y;
                                                intermediateValue37 = sampledTextureValue4.z;
                                                intermediateValue38 = sampledTextureValue4.w;
                                            }
                                            float intermediateValue46;
                                            float intermediateValue47;
                                            float intermediateValue48;
                                            if ((sumValue1 & 2u) == 0u)
                                            {
                                                float branchMergedValue9;
                                                float branchMergedValue20;
                                                float branchMergedValue21;
                                                if ((sumValue1 & 16u) == 0u)
                                                {
                                                    branchMergedValue9 = intermediateValue37;
                                                    branchMergedValue20 = intermediateValue36;
                                                    branchMergedValue21 = intermediateValue35;
                                                }
                                                else
                                                {
                                                    float exponentialValue12;
                                                    if (!(intermediateValue35 <= 0.003130800090730190277099609375f))
                                                    {
                                                        exponentialValue12 = (exp2(log2(intermediateValue35) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue12 = intermediateValue35 * 12.9200000762939453125f;
                                                    }
                                                    float exponentialValue14;
                                                    if (!(intermediateValue36 <= 0.003130800090730190277099609375f))
                                                    {
                                                        exponentialValue14 = (exp2(log2(intermediateValue36) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue14 = intermediateValue36 * 12.9200000762939453125f;
                                                    }
                                                    float branchMergedValue34;
                                                    float branchMergedValue40;
                                                    float branchMergedValue41;
                                                    if (!(intermediateValue37 <= 0.003130800090730190277099609375f))
                                                    {
                                                        branchMergedValue34 = (exp2(log2(intermediateValue37) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        branchMergedValue40 = exponentialValue14;
                                                        branchMergedValue41 = exponentialValue12;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue34 = intermediateValue37 * 12.9200000762939453125f;
                                                        branchMergedValue40 = exponentialValue14;
                                                        branchMergedValue41 = exponentialValue12;
                                                    }
                                                    branchMergedValue9 = branchMergedValue34;
                                                    branchMergedValue20 = branchMergedValue40;
                                                    branchMergedValue21 = branchMergedValue41;
                                                }
                                                intermediateValue46 = branchMergedValue21;
                                                intermediateValue47 = branchMergedValue20;
                                                intermediateValue48 = branchMergedValue9;
                                            }
                                            else
                                            {
                                                float exponentialValue11;
                                                if (!(intermediateValue35 <= 0.040449999272823333740234375f))
                                                {
                                                    exponentialValue11 = exp2(log2((intermediateValue35 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                }
                                                else
                                                {
                                                    exponentialValue11 = intermediateValue35 * 0.077399380505084991455078125f;
                                                }
                                                float exponentialValue13;
                                                if (!(intermediateValue36 <= 0.040449999272823333740234375f))
                                                {
                                                    exponentialValue13 = exp2(log2((intermediateValue36 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                }
                                                else
                                                {
                                                    exponentialValue13 = intermediateValue36 * 0.077399380505084991455078125f;
                                                }
                                                float branchMergedValue11;
                                                float branchMergedValue24;
                                                float branchMergedValue25;
                                                if (!(intermediateValue37 <= 0.040449999272823333740234375f))
                                                {
                                                    branchMergedValue11 = exp2(log2((intermediateValue37 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    branchMergedValue24 = exponentialValue13;
                                                    branchMergedValue25 = exponentialValue11;
                                                }
                                                else
                                                {
                                                    branchMergedValue11 = intermediateValue37 * 0.077399380505084991455078125f;
                                                    branchMergedValue24 = exponentialValue13;
                                                    branchMergedValue25 = exponentialValue11;
                                                }
                                                intermediateValue46 = branchMergedValue25;
                                                intermediateValue47 = branchMergedValue24;
                                                intermediateValue48 = branchMergedValue11;
                                            }
                                            float clampedValue1 = clamp(((intermediateValue47 * 0.715200006961822509765625f) + (intermediateValue46 * 0.2125999927520751953125f)) + (intermediateValue48 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                            float comparisonValue4 = (((((1.0f - (intermediateValue38 * 2.0f)) * float((scalarValue17 & 1u) != 0u)) + intermediateValue38) - clampedValue1) * fragmentConstants[sumValue].z) + clampedValue1;
                                            float quotientValue14 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue15 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentConstants[bitwiseValue].y;
                                            float productValue13 = ((ddx_coarse(quotientValue15) * quotientValue15) + (ddx_coarse(quotientValue14) * quotientValue14)) * 2.0f;
                                            float productValue14 = ((ddy_coarse((-0.0f) - quotientValue15) * quotientValue15) + (ddy_coarse((-0.0f) - quotientValue14) * quotientValue14)) * 2.0f;
                                            branchMergedValue60 = clamp(0.5f - (rsqrt(max(dot(float2(productValue13, productValue14), float2(productValue13, productValue14)), 9.9999997473787516355514526367188e-05f)) * (dot(float2(quotientValue14, quotientValue15), float2(quotientValue14, quotientValue15)) + (-1.0f))), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                            branchMergedValue61 = ((1.0f - comparisonValue4) * float((scalarValue17 & 2u) != 0u)) + comparisonValue4;
                                        }
                                        else
                                        {
                                            float branchMergedValue62;
                                            float branchMergedValue63;
                                            if (scalarValue == 33u)
                                            {
                                                uint scalarValue18 = scalarValue1 + 1u;
                                                float4 sampledTextureValue5 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * ((fragmentConstants[scalarValue18].z * frac(varyingTexCoord1.z)) + fragmentConstants[scalarValue18].x)) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (((frac(varyingTexCoord1.w) * fragmentConstants[scalarValue18].w) + fragmentConstants[scalarValue18].y) * RD_UNIFORM_UV_TRANSFORM_ROW_0.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                float scalarValue19 = sampledTextureValue5.x;
                                                float scalarValue20 = sampledTextureValue5.y;
                                                float scalarValue21 = sampledTextureValue5.z;
                                                float scalarValue22 = sampledTextureValue5.w;
                                                float intermediateValue40;
                                                float intermediateValue41;
                                                float intermediateValue42;
                                                if ((sumValue1 & 2u) == 0u)
                                                {
                                                    float branchMergedValue8;
                                                    float branchMergedValue18;
                                                    float branchMergedValue19;
                                                    if ((sumValue1 & 16u) == 0u)
                                                    {
                                                        branchMergedValue8 = scalarValue21;
                                                        branchMergedValue18 = scalarValue19;
                                                        branchMergedValue19 = scalarValue20;
                                                    }
                                                    else
                                                    {
                                                        float exponentialValue8;
                                                        if (!(scalarValue19 <= 0.003130800090730190277099609375f))
                                                        {
                                                            exponentialValue8 = (exp2(log2(scalarValue19) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue8 = scalarValue19 * 12.9200000762939453125f;
                                                        }
                                                        float exponentialValue10;
                                                        if (!(scalarValue20 <= 0.003130800090730190277099609375f))
                                                        {
                                                            exponentialValue10 = (exp2(log2(scalarValue20) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue10 = scalarValue20 * 12.9200000762939453125f;
                                                        }
                                                        float branchMergedValue33;
                                                        float branchMergedValue38;
                                                        float branchMergedValue39;
                                                        if (!(scalarValue21 <= 0.003130800090730190277099609375f))
                                                        {
                                                            branchMergedValue33 = (exp2(log2(scalarValue21) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                            branchMergedValue38 = exponentialValue8;
                                                            branchMergedValue39 = exponentialValue10;
                                                        }
                                                        else
                                                        {
                                                            branchMergedValue33 = scalarValue21 * 12.9200000762939453125f;
                                                            branchMergedValue38 = exponentialValue8;
                                                            branchMergedValue39 = exponentialValue10;
                                                        }
                                                        branchMergedValue8 = branchMergedValue33;
                                                        branchMergedValue18 = branchMergedValue38;
                                                        branchMergedValue19 = branchMergedValue39;
                                                    }
                                                    intermediateValue40 = branchMergedValue18;
                                                    intermediateValue41 = branchMergedValue19;
                                                    intermediateValue42 = branchMergedValue8;
                                                }
                                                else
                                                {
                                                    float exponentialValue7;
                                                    if (!(scalarValue19 <= 0.040449999272823333740234375f))
                                                    {
                                                        exponentialValue7 = exp2(log2((scalarValue19 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue7 = scalarValue19 * 0.077399380505084991455078125f;
                                                    }
                                                    float exponentialValue9;
                                                    if (!(scalarValue20 <= 0.040449999272823333740234375f))
                                                    {
                                                        exponentialValue9 = exp2(log2((scalarValue20 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue9 = scalarValue20 * 0.077399380505084991455078125f;
                                                    }
                                                    float branchMergedValue10;
                                                    float branchMergedValue22;
                                                    float branchMergedValue23;
                                                    if (!(scalarValue21 <= 0.040449999272823333740234375f))
                                                    {
                                                        branchMergedValue10 = exp2(log2((scalarValue21 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                        branchMergedValue22 = exponentialValue7;
                                                        branchMergedValue23 = exponentialValue9;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue10 = scalarValue21 * 0.077399380505084991455078125f;
                                                        branchMergedValue22 = exponentialValue7;
                                                        branchMergedValue23 = exponentialValue9;
                                                    }
                                                    intermediateValue40 = branchMergedValue22;
                                                    intermediateValue41 = branchMergedValue23;
                                                    intermediateValue42 = branchMergedValue10;
                                                }
                                                float sumValue19 = 1.0f - scalarValue22;
                                                float clampedValue2 = clamp(((intermediateValue41 * 0.715200006961822509765625f) + (intermediateValue40 * 0.2125999927520751953125f)) + (intermediateValue42 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                                float productValue15 = (((((scalarValue22 - sumValue19) * fragmentConstants[sumValue].x) + sumValue19) - clampedValue2) * fragmentConstants[sumValue].z) + clampedValue2;
                                                float sumValue20 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                float sumValue21 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                branchMergedValue62 = clamp(0.5f - ((sqrt((sumValue21 * sumValue21) + (sumValue20 * sumValue20)) - varyingTexCoord2.z) * ((fragmentConstants[scalarValue1].x < fragmentConstants[scalarValue1].y) ? fragmentConstants[scalarValue1].x : fragmentConstants[scalarValue1].y)), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                                branchMergedValue63 = ((1.0f - productValue15) * fragmentConstants[bitwiseValue].y) + productValue15;
                                            }
                                            else
                                            {
                                                float branchMergedValue64;
                                                float branchMergedValue65;
                                                if (scalarValue == 23u)
                                                {
                                                    float4 vectorValue = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                    uint sumValue22 = scalarValue1 + 1u;
                                                    float productValue16 = fragmentConstants[scalarValue1].z * fragmentConstants[scalarValue1].x;
                                                    float productValue17 = (productValue16 * 0.5f) + 0.5f;
                                                    float productValue18 = fragmentConstants[scalarValue1].x * 2.0f;
                                                    float sumValue23 = fragmentConstants[scalarValue1].x + vectorValue.x;
                                                    float clampedValue3 = clamp(((sumValue23 + productValue16) - productValue17) / productValue18, 0.0f, 1.0f);
                                                    float productValue19 = (clampedValue3 * clampedValue3) * (3.0f - (clampedValue3 * 2.0f));
                                                    if (!(!(productValue19 <= 0.0f)))
                                                    {
                                                        isFragmentDiscarded = true;
                                                    }
                                                    float clampedValue4 = clamp((sumValue23 - productValue17) / productValue18, 0.0f, 1.0f);
                                                    branchMergedValue64 = 1.0f;
                                                    branchMergedValue65 = ((((clampedValue4 * clampedValue4) * (fragmentConstants[sumValue].w - fragmentConstants[sumValue22].w)) * (3.0f - (clampedValue4 * 2.0f))) + fragmentConstants[sumValue22].w) * productValue19;
                                                }
                                                else
                                                {
                                                    float branchMergedValue66;
                                                    float branchMergedValue67;
                                                    if (scalarValue == 24u)
                                                    {
                                                        float4 vectorValue1 = txBuffer3Texture.Sample(txBuffer3Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_3.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_3.x, (RD_UNIFORM_UV_TRANSFORM_ROW_3.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_3.y));
                                                        float scalarValue23 = vectorValue1.x;
                                                        float scalarValue24 = vectorValue1.y;
                                                        float sumValue24 = 0.5f - varyingTexCoord1.z;
                                                        float clampedValue5 = clamp((max(min(scalarValue23, scalarValue24), min(max(scalarValue23, scalarValue24), vectorValue1.z)) - sumValue24) / ((varyingTexCoord1.z + 0.5f) - sumValue24), 0.0f, 1.0f);
                                                        branchMergedValue66 = 1.0f;
                                                        branchMergedValue67 = ((clampedValue5 * clampedValue5) * fragmentConstants[sumValue].w) * (3.0f - (clampedValue5 * 2.0f));
                                                    }
                                                    else
                                                    {
                                                        float branchMergedValue68;
                                                        float branchMergedValue69;
                                                        if (scalarValue == 25u)
                                                        {
                                                            float4 vectorValue2 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                            float scalarValue25 = vectorValue2.x;
                                                            float scalarValue26 = vectorValue2.y;
                                                            uint sumValue25 = scalarValue1 + 1u;
                                                            float productValue20 = fragmentConstants[scalarValue1].z * fragmentConstants[scalarValue1].x;
                                                            float productValue21 = (productValue20 * 0.5f) + 0.5f;
                                                            float scalarValue27 = max(min(scalarValue25, scalarValue26), min(max(scalarValue25, scalarValue26), vectorValue2.z));
                                                            float productValue22 = fragmentConstants[scalarValue1].x * 2.0f;
                                                            float clampedValue6 = clamp((((productValue20 + fragmentConstants[scalarValue1].x) - productValue21) + scalarValue27) / productValue22, 0.0f, 1.0f);
                                                            float productValue23 = (clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f));
                                                            if (!(!(productValue23 <= 0.0f)))
                                                            {
                                                                isFragmentDiscarded = true;
                                                            }
                                                            float clampedValue7 = clamp(((fragmentConstants[scalarValue1].x - productValue21) + scalarValue27) / productValue22, 0.0f, 1.0f);
                                                            branchMergedValue68 = 1.0f;
                                                            branchMergedValue69 = ((((clampedValue7 * clampedValue7) * (fragmentConstants[sumValue].w - fragmentConstants[sumValue25].w)) * (3.0f - (clampedValue7 * 2.0f))) + fragmentConstants[sumValue25].w) * productValue23;
                                                        }
                                                        else
                                                        {
                                                            float branchMergedValue70;
                                                            float branchMergedValue71;
                                                            if (scalarValue == 31u)
                                                            {
                                                                float4 vectorValue3 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.z) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.w) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
                                                                float scalarValue28 = vectorValue3.x;
                                                                float scalarValue29 = vectorValue3.y;
                                                                float scalarValue30 = vectorValue3.z;
                                                                float scalarValue31 = vectorValue3.w;
                                                                float intermediateValue58;
                                                                float intermediateValue59;
                                                                float intermediateValue60;
                                                                if ((sumValue1 & 2u) == 0u)
                                                                {
                                                                    float branchMergedValue12;
                                                                    float branchMergedValue26;
                                                                    float branchMergedValue27;
                                                                    if ((sumValue1 & 16u) == 0u)
                                                                    {
                                                                        branchMergedValue12 = scalarValue30;
                                                                        branchMergedValue26 = scalarValue29;
                                                                        branchMergedValue27 = scalarValue28;
                                                                    }
                                                                    else
                                                                    {
                                                                        float exponentialValue16;
                                                                        if (!(scalarValue28 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            exponentialValue16 = (exp2(log2(scalarValue28) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue16 = scalarValue28 * 12.9200000762939453125f;
                                                                        }
                                                                        float exponentialValue18;
                                                                        if (!(scalarValue29 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            exponentialValue18 = (exp2(log2(scalarValue29) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue18 = scalarValue29 * 12.9200000762939453125f;
                                                                        }
                                                                        float branchMergedValue37;
                                                                        float branchMergedValue42;
                                                                        float branchMergedValue43;
                                                                        if (!(scalarValue30 <= 0.003130800090730190277099609375f))
                                                                        {
                                                                            branchMergedValue37 = (exp2(log2(scalarValue30) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
                                                                            branchMergedValue42 = exponentialValue18;
                                                                            branchMergedValue43 = exponentialValue16;
                                                                        }
                                                                        else
                                                                        {
                                                                            branchMergedValue37 = scalarValue30 * 12.9200000762939453125f;
                                                                            branchMergedValue42 = exponentialValue18;
                                                                            branchMergedValue43 = exponentialValue16;
                                                                        }
                                                                        branchMergedValue12 = branchMergedValue37;
                                                                        branchMergedValue26 = branchMergedValue42;
                                                                        branchMergedValue27 = branchMergedValue43;
                                                                    }
                                                                    intermediateValue58 = branchMergedValue27;
                                                                    intermediateValue59 = branchMergedValue26;
                                                                    intermediateValue60 = branchMergedValue12;
                                                                }
                                                                else
                                                                {
                                                                    float exponentialValue15;
                                                                    if (!(scalarValue28 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        exponentialValue15 = exp2(log2((scalarValue28 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue15 = scalarValue28 * 0.077399380505084991455078125f;
                                                                    }
                                                                    float exponentialValue17;
                                                                    if (!(scalarValue29 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        exponentialValue17 = exp2(log2((scalarValue29 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue17 = scalarValue29 * 0.077399380505084991455078125f;
                                                                    }
                                                                    float branchMergedValue13;
                                                                    float branchMergedValue28;
                                                                    float branchMergedValue29;
                                                                    if (!(scalarValue30 <= 0.040449999272823333740234375f))
                                                                    {
                                                                        branchMergedValue13 = exp2(log2((scalarValue30 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                                                                        branchMergedValue28 = exponentialValue17;
                                                                        branchMergedValue29 = exponentialValue15;
                                                                    }
                                                                    else
                                                                    {
                                                                        branchMergedValue13 = scalarValue30 * 0.077399380505084991455078125f;
                                                                        branchMergedValue28 = exponentialValue17;
                                                                        branchMergedValue29 = exponentialValue15;
                                                                    }
                                                                    intermediateValue58 = branchMergedValue29;
                                                                    intermediateValue59 = branchMergedValue28;
                                                                    intermediateValue60 = branchMergedValue13;
                                                                }
                                                                float sumValue26 = 1.0f - scalarValue31;
                                                                float clampedValue8 = clamp(((intermediateValue59 * 0.715200006961822509765625f) + (intermediateValue58 * 0.2125999927520751953125f)) + (intermediateValue60 * 0.072200000286102294921875f), 0.0f, 1.0f);
                                                                float productValue24 = (((((scalarValue31 - sumValue26) * fragmentConstants[sumValue].x) + sumValue26) - clampedValue8) * fragmentConstants[sumValue].z) + clampedValue8;
                                                                float sumValue27 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                float sumValue28 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                branchMergedValue70 = clamp(0.5f - (((fragmentConstants[scalarValue1].x < fragmentConstants[scalarValue1].y) ? fragmentConstants[scalarValue1].x : fragmentConstants[scalarValue1].y) * (sqrt((sumValue28 * sumValue28) + (sumValue27 * sumValue27)) - varyingTexCoord2.z)), 0.0f, 1.0f) * fragmentConstants[sumValue].w;
                                                                branchMergedValue71 = ((1.0f - productValue24) * fragmentConstants[bitwiseValue].y) + productValue24;
                                                            }
                                                            else
                                                            {
                                                                branchMergedValue70 = 1.0f;
                                                                branchMergedValue71 = fragmentConstants[sumValue].w;
                                                            }
                                                            branchMergedValue68 = branchMergedValue70;
                                                            branchMergedValue69 = branchMergedValue71;
                                                        }
                                                        branchMergedValue66 = branchMergedValue68;
                                                        branchMergedValue67 = branchMergedValue69;
                                                    }
                                                    branchMergedValue64 = branchMergedValue66;
                                                    branchMergedValue65 = branchMergedValue67;
                                                }
                                                branchMergedValue62 = branchMergedValue64;
                                                branchMergedValue63 = branchMergedValue65;
                                            }
                                            branchMergedValue60 = branchMergedValue62;
                                            branchMergedValue61 = branchMergedValue63;
                                        }
                                        branchMergedValue58 = branchMergedValue60;
                                        branchMergedValue59 = branchMergedValue61;
                                    }
                                    branchMergedValue55 = branchMergedValue58;
                                    branchMergedValue57 = branchMergedValue59;
                                }
                                branchMergedValue52 = branchMergedValue55;
                                branchMergedValue53 = branchMergedValue57;
                            }
                            branchMergedValue48 = branchMergedValue52;
                            branchMergedValue50 = branchMergedValue53;
                        }
                        branchMergedValue46 = branchMergedValue48;
                        branchMergedValue47 = branchMergedValue50;
                    }
                    branchMergedValue44 = branchMergedValue46;
                    branchMergedValue45 = branchMergedValue47;
                }
                branchMergedValue30 = branchMergedValue44;
                branchMergedValue31 = branchMergedValue45;
            }
            branchMergedValue4 = branchMergedValue30;
            branchMergedValue7 = branchMergedValue31;
        }
        nonlinearValue = branchMergedValue4;
        intermediateValue3 = branchMergedValue7;
    }
    if (((scalarValue == 3u) ? intermediateValue3 : nonlinearValue) < 0.00390625f)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0f;
    fragmentColor0.y = 0.0f;
    fragmentColor0.z = 0.0f;
    fragmentColor0.w = 0.0f;
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
