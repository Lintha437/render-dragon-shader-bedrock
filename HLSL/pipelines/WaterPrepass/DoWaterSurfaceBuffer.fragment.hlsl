// WaterPrepass / DoWaterSurfaceBuffer / fragment forward pipeline.
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
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/WaterPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  nointerpolation int varyingFrontFacing0 : FRONTFACING0,
  nointerpolation int varyingTexCoord4 : TEXCOORD4,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  uint varyingSv_Isfrontface0 : SV_IsFrontFace0,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12,workingVector13;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.x != 0) {
    workingVector0.x = sampledResource12[varyingTexCoord4.x].val[16/4];
    workingVector0.y = sampledResource12[varyingTexCoord4.x].val[16/4+1];
    workingVector0.z = sampledResource12[varyingTexCoord4.x].val[16/4+2];
    workingVector0.w = sampledResource12[varyingTexCoord4.x].val[16/4+3];
    workingVector1.x = sampledResource12[varyingTexCoord4.x].val[32/4+1];
    workingVector1.y = sampledResource12[varyingTexCoord4.x].val[32/4+2];
    workingVector1.z = sampledResource12[varyingTexCoord4.x].val[32/4];
    workingVector1.w = sampledResource12[varyingTexCoord4.x].val[32/4+3];
    workingVector2.y = sampledResource12[varyingTexCoord4.x].val[48/4];
    workingVector2.z = sampledResource12[varyingTexCoord4.x].val[48/4+1];
    workingVector3.xy = (int2)workingVector1.zz & int2(4,1);
    workingVector3.xy = RD_COMPARISON_MASK((int2)workingVector3.xy == int2(4,1));
    if (workingVector3.x != 0) {
      workingVector3.xz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
      workingVector4.xy = floatingPointResult.xy;
      workingVector4.xy = workingVector4.xy * workingVector3.xz;
      workingVector4.zw = ddx_coarse(workingVector4.xy);
      workingVector4.xy = -workingVector4.xy;
      workingVector4.xy = ddy_coarse(workingVector4.xy);
      workingVector2.w = dot(workingVector4.zw, workingVector4.zw);
      workingVector3.w = dot(workingVector4.xy, workingVector4.xy);
      workingVector2.w = max(workingVector3.w, workingVector2.w);
      workingVector2.w = log2(workingVector2.w);
      workingVector2.w = 0.5 * workingVector2.w;
      workingVector2.w = max(0, workingVector2.w);
      workingVector3.w = RD_COMPARISON_MASK(1 >= workingVector2.w);
      if (workingVector3.w != 0) {
        workingVector3.xzw = materialTexture3.SampleLevel(textureSampler3, workingVector3.xz, workingVector2.w).xyz;
        workingVector3.xzw = workingVector3.xzw * float3(2,2,2) + float3(-1,-1,-1);
        workingVector3.w = rcp(workingVector3.w);
        workingVector3.xz = workingVector3.xz * workingVector3.ww;
        workingVector2.w = workingVector2.w * workingVector2.w;
        workingVector2.w = min(1, workingVector2.w);
        workingVector2.w = 1 + -workingVector2.w;
        workingVector4.xy = workingVector3.xz * workingVector2.ww;
        workingVector4.z = 1;
        workingVector2.w = dot(workingVector4.xyz, workingVector4.xyz);
        workingVector2.w = rsqrt(workingVector2.w);
        workingVector3.xzw = workingVector4.xyz * workingVector2.www;
      } else {
        workingVector3.xzw = float3(0,0,1);
      }
    } else {
      workingVector2.w = sampledResource12[varyingTexCoord4.x].val[60/4];
      workingVector4.x = (int)workingVector1.z & 8;
      workingVector4.x = RD_COMPARISON_MASK((int)workingVector4.x == 8);
      if (workingVector4.x != 0) {
        workingVector4.x = workingVector2.w + -workingVector2.z;
        workingVector4.x = min(workingVector4.x, workingVector2.w);
        workingVector4.x = saturate(2 + -workingVector4.x);
        workingVector4.y = RD_COMPARISON_MASK(0 < workingVector4.x);
        if (workingVector4.y != 0) {
          workingVector4.yz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
          materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector5.xy = floatingPointResult.xy;
          workingVector5.xyzw = workingVector5.xxyy;
          workingVector6.xy = workingVector5.yw * workingVector4.yz;
          workingVector6.xy = frac(workingVector6.xy);
          workingVector6.zw = float2(-0.5,-0.5) + workingVector6.xy;
          workingVector6.zw = RD_COMPARISON_MASK(abs(workingVector6.zw) < float2(0.0625,0.0625));
          workingVector6.xy = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector6.xy);
          workingVector6.xy = workingVector6.xy ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
          workingVector6.xy = workingVector6.xy + workingVector4.yz;
          workingVector6.xy = workingVector6.zw ? workingVector6.xy : workingVector4.yz;
          workingVector6.xyzw = materialTexture3.Gather(textureSampler3, workingVector6.xy).xyzw;
          workingVector5.xyzw = workingVector4.yyzz * workingVector5.xyzw + float4(0.5,0.5,0.5,0.5);
          workingVector5.xyzw = frac(workingVector5.xyzw);
          workingVector7.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector5.wwyy);
          workingVector6.xyzw = workingVector7.xyzw ? workingVector6.xyzy : workingVector6.wzwx;
          workingVector5.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector5.xyzw;
          workingVector5.xyzw = saturate(workingVector5.xyzw + workingVector5.xyzw);
          workingVector5.xyzw = (int4)workingVector5.xyzw;
          workingVector4.y = dot(workingVector6.xy, icb[workingVector5.x+0].xy);
          workingVector4.z = dot(workingVector6.xy, icb[workingVector5.y+0].xy);
          workingVector7.x = workingVector4.y + -workingVector4.z;
          workingVector4.y = dot(workingVector6.zw, icb[workingVector5.z+0].xy);
          workingVector4.z = dot(workingVector6.zw, icb[workingVector5.w+0].xy);
          workingVector7.y = workingVector4.y + -workingVector4.z;
          workingVector7.z = 0.25;
          workingVector4.y = dot(workingVector7.xyz, workingVector7.xyz);
          workingVector4.y = rsqrt(workingVector4.y);
          workingVector3.xzw = workingVector7.xyz * workingVector4.yyy;
          workingVector3.xz = workingVector3.xz * workingVector4.xx;
        } else {
          workingVector3.xzw = float3(0,0,1);
        }
      } else {
        workingVector4.x = (int)workingVector1.z & 16;
        workingVector4.x = RD_COMPARISON_MASK((int)workingVector4.x == 16);
        if (workingVector4.x != 0) {
          workingVector0.xy = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
          workingVector0.z = workingVector2.w + -workingVector2.z;
          workingVector0.z = min(workingVector0.z, workingVector2.w);
          workingVector4.xyzw = materialTexture3.SampleLevel(textureSampler3, workingVector0.xy, 0).xyzw;
          workingVector2.zw = RD_COMPARISON_MASK(workingVector4.yz == workingVector4.xy);
          workingVector0.w = workingVector2.w ? workingVector2.z : 0;
          if (workingVector0.w != 0) {
            workingVector0.w = saturate(2 + -workingVector0.z);
            workingVector2.z = RD_COMPARISON_MASK(0 < workingVector0.w);
            if (workingVector2.z != 0) {
              materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
              workingVector2.zw = floatingPointResult.xy;
              workingVector5.xyzw = workingVector2.zzww;
              workingVector2.zw = workingVector5.yw * workingVector0.xy;
              workingVector2.zw = frac(workingVector2.zw);
              workingVector6.xy = float2(-0.5,-0.5) + workingVector2.zw;
              workingVector6.xy = RD_COMPARISON_MASK(abs(workingVector6.xy) < float2(0.0625,0.0625));
              workingVector2.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector2.zw);
              workingVector2.zw = workingVector2.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
              workingVector2.zw = workingVector2.zw + workingVector0.xy;
              workingVector2.zw = workingVector6.xy ? workingVector2.zw : workingVector0.xy;
              workingVector6.xyzw = materialTexture3.Gather(textureSampler3, workingVector2.zw).xyzw;
              workingVector5.xyzw = workingVector0.xxyy * workingVector5.xyzw + float4(0.5,0.5,0.5,0.5);
              workingVector5.xyzw = frac(workingVector5.xyzw);
              workingVector7.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector5.wwyy);
              workingVector6.xyzw = workingVector7.xyzw ? workingVector6.xyzy : workingVector6.wzwx;
              workingVector5.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector5.xyzw;
              workingVector5.xyzw = saturate(workingVector5.xyzw + workingVector5.xyzw);
              workingVector5.xyzw = (int4)workingVector5.xyzw;
              workingVector2.z = dot(workingVector6.xy, icb[workingVector5.x+0].xy);
              workingVector2.w = dot(workingVector6.xy, icb[workingVector5.y+0].xy);
              workingVector7.x = workingVector2.z + -workingVector2.w;
              workingVector2.z = dot(workingVector6.zw, icb[workingVector5.z+0].xy);
              workingVector2.w = dot(workingVector6.zw, icb[workingVector5.w+0].xy);
              workingVector7.y = workingVector2.z + -workingVector2.w;
              workingVector7.z = 0.25;
              workingVector2.z = dot(workingVector7.xyz, workingVector7.xyz);
              workingVector2.z = rsqrt(workingVector2.z);
              workingVector3.xzw = workingVector7.xyz * workingVector2.zzz;
              workingVector3.xz = workingVector3.xz * workingVector0.ww;
            } else {
              workingVector3.xzw = float3(0,0,1);
            }
          } else {
            materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
            workingVector2.zw = floatingPointResult.xy;
            workingVector0.z = saturate(2 + -workingVector0.z);
            workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.z);
            workingVector0.xy = workingVector2.zw * workingVector0.xy;
            workingVector0.xy = frac(workingVector0.xy);
            workingVector2.zw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0.916666687,0.916666687));
            workingVector2.zw = workingVector2.zw ? float2(1,1) : 0;
            workingVector4.xyzw = workingVector4.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
            workingVector0.xy = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector0.xy);
            workingVector0.xy = workingVector0.xy ? float2(1,1) : 0;
            workingVector0.xy = workingVector0.xy * -workingVector4.yw;
            workingVector0.xy = workingVector2.zw * workingVector4.xz + workingVector0.xy;
            workingVector2.zw = RD_COMPARISON_MASK(abs(workingVector0.xy) >= float2(0.00499999989,0.00499999989));
            workingVector2.zw = workingVector2.zw ? float2(1,1) : 0;
            workingVector4.xy = workingVector2.zw * workingVector0.xy;
            workingVector4.z = 0.25;
            workingVector0.x = dot(workingVector4.xyz, workingVector4.xyz);
            workingVector0.x = rsqrt(workingVector0.x);
            workingVector4.xyz = workingVector4.xyz * workingVector0.xxx;
            workingVector4.xy = workingVector4.xy * workingVector0.zz;
            workingVector3.xzw = workingVector0.www ? workingVector4.xyz : float3(0,0,1);
          }
        } else {
          workingVector3.xzw = float3(0,0,1);
        }
      }
    }
    if (workingVector3.y != 0) {
      workingVector0.x = sampledResource12[varyingTexCoord4.x].val[0/4];
      workingVector0.y = sampledResource12[varyingTexCoord4.x].val[0/4+1];
      workingVector0.z = sampledResource12[varyingTexCoord4.x].val[0/4+2];
      workingVector0.w = sampledResource12[varyingTexCoord4.x].val[0/4+3];
      workingVector0.xy = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector0.xyzw = materialTexture3.Sample(textureSampler3, workingVector0.xy).xyzw;
      workingVector1.z = (int)workingVector1.z & 2;
      workingVector1.z = RD_COMPARISON_MASK((int)workingVector1.z == 2);
      workingVector2.y = workingVector1.z ? workingVector0.w : workingVector2.y;
      workingVector1.xy = workingVector0.zy;
      workingVector2.x = workingVector0.x;
    } else {
      workingVector2.x = workingVector1.w;
    }
    workingVector0.xyz = varyingSv_Isfrontface0.xxx ? -varyingNormal0.xyz : varyingNormal0.xyz;
    workingVector0.w = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector4.xyz = varyingTangent0.xyz * workingVector0.www;
    workingVector0.w = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector5.xyz = varyingBitangent0.xyz * workingVector0.www;
    workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector0.xyz = workingVector0.xyz * workingVector0.www;
    workingVector5.xyz = workingVector5.xyz * workingVector3.zzz;
    workingVector3.xyz = workingVector4.xyz * workingVector3.xxx + workingVector5.xyz;
    workingVector0.xyz = workingVector0.xyz * workingVector3.www + workingVector3.xyz;
  } else {
    workingVector2.xy = float2(0,0);
    workingVector1.xy = float2(1,0);
    workingVector0.xyz = float3(0,1,0);
  }
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x);
  if (workingVector0.w != 0) {
    workingVector1.z = 0.5 * RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z;
    workingVector1.z = (int)workingVector1.z;
    workingVector2.zw = -RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.xz + varyingTexCoord3.xz;
    workingVector2.zw = workingVector2.zw / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.ww;
    workingVector3.xy = floor(workingVector2.zw);
    workingVector3.xy = (int2)workingVector3.xy;
    workingVector1.zw = (int2)workingVector1.zz + (int2)workingVector3.xy;
    workingVector3.xy = (int2)RD_UNIFORM_BIOME_BLENDING_PARAMETERS.zw;
    workingVector3.x = (int)workingVector3.x + -1;
    workingVector1.zw = max(int2(0,0), (int2)workingVector1.zw);
    workingVector4.xy = min((int2)workingVector1.zw, (int2)workingVector3.xx);
    workingVector4.zw = float2(0,0);
    workingVector1.z = materialTexture0.Load(workingVector4.xyz).x;
    workingVector1.z = 255 * workingVector1.z;
    workingVector1.z = round(workingVector1.z);
    workingVector1.z = (int)workingVector1.z;
    workingVector1.w = RD_COMPARISON_MASK((int)workingVector1.z >= (int)workingVector3.y);
    workingVector1.z = workingVector1.w ? 0 : workingVector1.z;
    workingVector5.xyzw = (int4)workingVector4.xyxy + int4(0,1,1,0);
    workingVector6.xy = workingVector5.zw;
    workingVector6.zw = float2(0,0);
    workingVector1.w = materialTexture0.Load(workingVector6.xyz).x;
    workingVector1.w = 255 * workingVector1.w;
    workingVector1.w = round(workingVector1.w);
    workingVector1.w = (int)workingVector1.w;
    workingVector3.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector3.y);
    workingVector1.w = workingVector3.x ? 0 : workingVector1.w;
    workingVector5.zw = float2(0,0);
    workingVector3.x = materialTexture0.Load(workingVector5.xyz).x;
    workingVector3.x = 255 * workingVector3.x;
    workingVector3.x = round(workingVector3.x);
    workingVector3.x = (int)workingVector3.x;
    workingVector3.z = RD_COMPARISON_MASK((int)workingVector3.x >= (int)workingVector3.y);
    workingVector3.x = workingVector3.z ? 0 : workingVector3.x;
    workingVector4.xy = (int2)workingVector4.xy + int2(1,1);
    workingVector4.zw = float2(0,0);
    workingVector3.z = materialTexture0.Load(workingVector4.xyz).x;
    workingVector3.z = 255 * workingVector3.z;
    workingVector3.z = round(workingVector3.z);
    workingVector3.z = (int)workingVector3.z;
    workingVector3.y = RD_COMPARISON_MASK((int)workingVector3.z >= (int)workingVector3.y);
    workingVector3.y = workingVector3.y ? 0 : workingVector3.z;
    workingVector3.z = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector1.z);
    workingVector3.w = RD_COMPARISON_MASK((int)workingVector1.w == (int)workingVector3.x);
    workingVector3.z = workingVector3.w ? workingVector3.z : 0;
    workingVector3.w = RD_COMPARISON_MASK((int)workingVector3.y == (int)workingVector3.x);
    workingVector3.z = workingVector3.w ? workingVector3.z : 0;
    if (workingVector3.z != 0) {
      workingVector4.x = sampledResource14[workingVector1.z].val[32/4];
      workingVector4.y = sampledResource14[workingVector1.z].val[32/4+1];
      workingVector4.z = sampledResource14[workingVector1.z].val[32/4+2];
      workingVector5.x = sampledResource14[workingVector1.z].val[48/4];
      workingVector5.y = sampledResource14[workingVector1.z].val[48/4+1];
      workingVector6.x = sampledResource14[workingVector1.z].val[64/4+1];
      workingVector6.y = sampledResource14[workingVector1.z].val[64/4];
      workingVector6.z = sampledResource14[workingVector1.z].val[64/4+2];
      workingVector6.w = sampledResource14[workingVector1.z].val[64/4+3];
      workingVector3.w = workingVector6.y;
      workingVector6.xyw = workingVector6.xzw;
    }
    if (workingVector3.z == 0) {
      workingVector4.x = sampledResource14[workingVector1.z].val[32/4];
      workingVector4.y = sampledResource14[workingVector1.z].val[32/4+1];
      workingVector4.z = sampledResource14[workingVector1.z].val[32/4+2];
      workingVector5.x = sampledResource14[workingVector1.z].val[48/4];
      workingVector5.y = sampledResource14[workingVector1.z].val[48/4+1];
      workingVector6.x = sampledResource14[workingVector1.z].val[64/4+1];
      workingVector6.y = sampledResource14[workingVector1.z].val[64/4];
      workingVector6.z = sampledResource14[workingVector1.z].val[64/4+2];
      workingVector6.w = sampledResource14[workingVector1.z].val[64/4+3];
      workingVector7.x = sampledResource14[workingVector1.w].val[32/4];
      workingVector7.y = sampledResource14[workingVector1.w].val[32/4+1];
      workingVector7.z = sampledResource14[workingVector1.w].val[32/4+2];
      workingVector5.z = sampledResource14[workingVector1.w].val[48/4];
      workingVector5.w = sampledResource14[workingVector1.w].val[48/4+1];
      workingVector8.x = sampledResource14[workingVector1.w].val[64/4];
      workingVector8.y = sampledResource14[workingVector1.w].val[64/4+1];
      workingVector8.z = sampledResource14[workingVector1.w].val[64/4+2];
      workingVector8.w = sampledResource14[workingVector1.w].val[64/4+3];
      workingVector9.x = sampledResource14[workingVector3.x].val[32/4];
      workingVector9.y = sampledResource14[workingVector3.x].val[32/4+1];
      workingVector9.z = sampledResource14[workingVector3.x].val[32/4+2];
      workingVector1.z = sampledResource14[workingVector3.x].val[48/4];
      workingVector1.w = sampledResource14[workingVector3.x].val[48/4+1];
      workingVector10.x = sampledResource14[workingVector3.x].val[64/4];
      workingVector10.y = sampledResource14[workingVector3.x].val[64/4+1];
      workingVector10.z = sampledResource14[workingVector3.x].val[64/4+2];
      workingVector10.w = sampledResource14[workingVector3.x].val[64/4+3];
      workingVector11.x = sampledResource14[workingVector3.y].val[32/4];
      workingVector11.y = sampledResource14[workingVector3.y].val[32/4+1];
      workingVector11.z = sampledResource14[workingVector3.y].val[32/4+2];
      workingVector3.x = sampledResource14[workingVector3.y].val[48/4];
      workingVector3.z = sampledResource14[workingVector3.y].val[48/4+1];
      workingVector12.x = sampledResource14[workingVector3.y].val[64/4];
      workingVector12.y = sampledResource14[workingVector3.y].val[64/4+1];
      workingVector12.z = sampledResource14[workingVector3.y].val[64/4+2];
      workingVector12.w = sampledResource14[workingVector3.y].val[64/4+3];
      workingVector13.xyz = RD_COMPARISON_MASK(workingVector4.xyz == workingVector7.xyz);
      workingVector3.y = workingVector13.y ? workingVector13.x : 0;
      workingVector3.y = workingVector13.z ? workingVector3.y : 0;
      workingVector13.xy = RD_COMPARISON_MASK(workingVector5.zw == workingVector5.xy);
      workingVector3.y = workingVector13.x ? workingVector3.y : 0;
      workingVector3.y = workingVector13.y ? workingVector3.y : 0;
      workingVector13.xyzw = RD_COMPARISON_MASK(workingVector6.yxzw == workingVector8.xyzw);
      workingVector3.y = workingVector13.x ? workingVector3.y : 0;
      workingVector3.y = workingVector13.y ? workingVector3.y : 0;
      workingVector3.y = workingVector13.z ? workingVector3.y : 0;
      workingVector3.y = workingVector13.w ? workingVector3.y : 0;
      workingVector13.xyz = RD_COMPARISON_MASK(workingVector7.xyz == workingVector9.xyz);
      workingVector4.w = workingVector13.y ? workingVector13.x : 0;
      workingVector4.w = workingVector13.z ? workingVector4.w : 0;
      workingVector13.xy = RD_COMPARISON_MASK(workingVector1.zw == workingVector5.zw);
      workingVector4.w = workingVector13.x ? workingVector4.w : 0;
      workingVector4.w = workingVector13.y ? workingVector4.w : 0;
      workingVector13.xyzw = RD_COMPARISON_MASK(workingVector8.xyzw == workingVector10.xyzw);
      workingVector4.w = workingVector13.x ? workingVector4.w : 0;
      workingVector4.w = workingVector13.y ? workingVector4.w : 0;
      workingVector4.w = workingVector13.z ? workingVector4.w : 0;
      workingVector4.w = workingVector13.w ? workingVector4.w : 0;
      workingVector3.y = (int)workingVector3.y & (int)workingVector4.w;
      workingVector13.xyz = RD_COMPARISON_MASK(workingVector9.xyz == workingVector11.xyz);
      workingVector4.w = workingVector13.y ? workingVector13.x : 0;
      workingVector4.w = workingVector13.z ? workingVector4.w : 0;
      workingVector13.xy = RD_COMPARISON_MASK(workingVector1.zw == workingVector3.xz);
      workingVector4.w = workingVector13.x ? workingVector4.w : 0;
      workingVector4.w = workingVector13.y ? workingVector4.w : 0;
      workingVector13.xyzw = RD_COMPARISON_MASK(workingVector10.xyzw == workingVector12.xyzw);
      workingVector4.w = workingVector13.x ? workingVector4.w : 0;
      workingVector4.w = workingVector13.y ? workingVector4.w : 0;
      workingVector4.w = workingVector13.z ? workingVector4.w : 0;
      workingVector4.w = workingVector13.w ? workingVector4.w : 0;
      workingVector3.y = (int)workingVector3.y & (int)workingVector4.w;
      if (workingVector3.y != 0) {
        workingVector3.w = workingVector6.y;
        workingVector6.xyw = workingVector6.xzw;
      } else {
        workingVector2.zw = frac(workingVector2.zw);
        workingVector13.xy = float2(1,1) + -workingVector2.wz;
        workingVector3.y = workingVector13.y * workingVector13.x;
        workingVector13.xy = workingVector13.xy * workingVector2.zw;
        workingVector2.z = workingVector2.z * workingVector2.w;
        workingVector7.xyz = workingVector13.xxx * workingVector7.xyz;
        workingVector7.xyz = workingVector4.xyz * workingVector3.yyy + workingVector7.xyz;
        workingVector7.xyz = workingVector9.xyz * workingVector13.yyy + workingVector7.xyz;
        workingVector4.xyz = workingVector11.xyz * workingVector2.zzz + workingVector7.xyz;
        workingVector5.zw = workingVector13.xx * workingVector5.zw;
        workingVector5.zw = workingVector5.xy * workingVector3.yy + workingVector5.zw;
        workingVector1.zw = workingVector1.zw * workingVector13.yy + workingVector5.zw;
        workingVector5.xy = workingVector3.xz * workingVector2.zz + workingVector1.zw;
        workingVector7.xyzw = workingVector13.xxxx * workingVector8.xyzw;
        workingVector7.xyzw = workingVector6.yxzw * workingVector3.yyyy + workingVector7.xyzw;
        workingVector7.xyzw = workingVector10.xyzw * workingVector13.yyyy + workingVector7.xyzw;
        workingVector6.xyzw = workingVector12.yxzw * workingVector2.zzzz + workingVector7.yxzw;
        workingVector3.w = workingVector6.y;
        workingVector6.xyw = workingVector6.xzw;
      }
    }
  }
  if (workingVector0.w == 0) {
    workingVector3.w = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.x;
    workingVector6.xyw = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.yzw;
    workingVector4.xyz = RD_UNIFORM_WATER_SURFACE_PARAMETERS.xyz;
    workingVector5.xy = RD_UNIFORM_WATER_SURFACE_WAVE_PARAMETERS.xy;
  }
  workingVector0.w = RD_COMPARISON_MASK(0 < RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT.x);
  if (workingVector0.w != 0) {
    workingVector1.zw = -RD_UNIFORM_WORLD_ORIGIN.xz + varyingTexCoord3.xz;
    workingVector0.w = 0.5 * RD_UNIFORM_VIEW_POSITION_AND_TIME.w;
    workingVector2.z = (uint)workingVector4.y;
    workingVector3.xy = workingVector1.zw;
    workingVector7.xz = float2(0,0);
    workingVector2.w = workingVector4.x;
    workingVector3.z = workingVector5.x;
    workingVector4.yw = float2(0,1);
    workingVector5.zw = float2(0,0);
    while (true) {
      workingVector6.z = RD_COMPARISON_MASK((uint)workingVector5.w >= (uint)workingVector2.z);
      if (workingVector6.z != 0) break;
      sincos(workingVector4.y, workingVector8.x, workingVector9.x);
      workingVector6.z = workingVector3.z * workingVector0.w;
      workingVector8.y = workingVector9.x;
      workingVector7.y = dot(workingVector8.xy, workingVector3.xy);
      workingVector6.z = workingVector7.y * workingVector2.w + workingVector6.z;
      sincos(workingVector6.z, workingVector9.x, workingVector10.x);
      workingVector7.yw = float2(1,1.00010002) + workingVector9.xx;
      workingVector6.z = 0.5 * workingVector7.y;
      workingVector6.z = log2(workingVector6.z);
      workingVector6.z = workingVector6.z * workingVector5.y;
      workingVector6.z = exp2(workingVector6.z);
      workingVector8.zw = workingVector8.xy * workingVector4.zz;
      workingVector8.zw = workingVector8.zw * workingVector4.ww;
      workingVector8.zw = workingVector8.zw * workingVector2.ww;
      workingVector8.zw = workingVector8.zw * workingVector5.yy;
      workingVector8.zw = workingVector8.zw * workingVector10.xx;
      workingVector8.zw = workingVector8.zw * workingVector6.zz;
      workingVector7.y = 1 / workingVector7.w;
      workingVector6.z = workingVector6.z * workingVector4.w;
      workingVector6.z = workingVector6.z * workingVector10.x;
      workingVector7.xz = -workingVector8.zw * workingVector7.yy + workingVector7.xz;
      workingVector5.z = workingVector5.z + workingVector4.w;
      workingVector7.yw = workingVector8.xy * -workingVector6.zz;
      workingVector3.xy = workingVector7.yw * workingVector3.ww + workingVector3.xy;
      workingVector4.w = workingVector6.x * -workingVector4.w + workingVector4.w;
      workingVector2.w = workingVector2.w * workingVector6.y;
      workingVector3.z = workingVector3.z * workingVector6.w;
      workingVector4.y = 1.39900005 + workingVector4.y;
      workingVector5.w = (int)workingVector5.w + 1;
    }
    workingVector3.xz = workingVector7.xz / workingVector5.zz;
    workingVector3.y = 1;
    workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector3.xyz = workingVector3.xyz * workingVector0.www + -varyingNormal0.xyz;
    workingVector3.xyz = varyingNormal0.yyy * workingVector3.xyz + varyingNormal0.xyz;
    workingVector0.w = dot(workingVector3.xyz, workingVector3.xyz);
    workingVector0.w = rsqrt(workingVector0.w);
    workingVector0.xyz = workingVector3.xyz * workingVector0.www;
  }
  workingVector3.xyz = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyz;
  workingVector4.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord3.xyz;
  workingVector0.w = RD_COMPARISON_MASK(workingVector2.y < workingVector2.x);
  workingVector1.z = workingVector2.x * 0.498039216 + 0.501960814;
  workingVector1.w = -workingVector2.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.w ? workingVector1.z : workingVector1.w;
  workingVector0.w = dot(workingVector0.xyz, workingVector0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz * workingVector0.www;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector0.yx);
  workingVector2.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector2.xy = workingVector2.xy ? float2(1,1) : float2(-1,-1);
  workingVector1.zw = workingVector2.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.zw : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector4.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector4.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector4.zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector2.xyz;
  workingVector0.zw = workingVector2.xy / workingVector2.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.xy + -workingVector0.zw;
  workingVector0.x = varyingTexCoord5.x + varyingTexCoord5.y;
  workingVector0.x = varyingTexCoord5.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < varyingTexCoord1.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector2.x = varyingTexCoord1.x * varyingTexCoord1.x;
  workingVector0.y = workingVector2.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.y = workingVector2.x * workingVector0.y;
  workingVector0.y = workingVector2.x * workingVector2.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.z = workingVector2.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector2.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : varyingTexCoord5.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.zw = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.z, workingVector1.w);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector2.w = 0.00392156886 * workingVector0.w;
  workingVector2.xyz = workingVector0.xyz / workingVector2.www;
  workingVector2.xyzw = saturate(workingVector2.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector2.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = saturate(varyingTexCoord1.y);
  workingVector0.x = 255 * workingVector0.x;
  fragmentColor0.w = (uint)workingVector0.x;
  workingVector1.xy = saturate(workingVector1.xy);
  workingVector0.xy = float2(255,255) * workingVector1.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  fragmentColor1.xyz = workingVector3.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    float multiplyAddValue;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (scalarValue == 65535u)
    {
        multiplyAddValue = 0.0f;
        intermediateValue3 = 1.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue7 = 0.0f;
        intermediateValue8 = 1.0f;
        intermediateValue9 = 0.0f;
    }
    else
    {
        float loadedBufferValue3 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 4u).x);
        float loadedBufferValue4 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 5u).x);
        float loadedBufferValue5 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 6u).x);
        float loadedBufferValue6 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 7u).x);
        uint4 loadedBufferValue7 = rdLoad_pbrData((scalarValue * 16u) + 8u);
        uint scalarValue1 = loadedBufferValue7.x;
        float loadedBufferValue8 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 12u).x);
        float loadedBufferValue9 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 13u).x);
        float loadedBufferValue10 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 15u).x);
        float intermediateValue63;
        float intermediateValue64;
        float intermediateValue65;
        if ((scalarValue1 & 4u) == 0u)
        {
            float branchMergedValue1;
            float branchMergedValue11;
            float branchMergedValue12;
            if ((scalarValue1 & 8u) == 0u)
            {
                float branchMergedValue16;
                float branchMergedValue26;
                float branchMergedValue27;
                if ((scalarValue1 & 16u) == 0u)
                {
                    branchMergedValue16 = 0.0f;
                    branchMergedValue26 = 1.0f;
                    branchMergedValue27 = 0.0f;
                }
                else
                {
                    float multiplyAddValue1 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                    float multiplyAddValue2 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                    float4 sampledTextureValue = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue1, multiplyAddValue2), 0.0f);
                    float scalarValue2 = sampledTextureValue.x;
                    float scalarValue3 = sampledTextureValue.y;
                    float scalarValue4 = sampledTextureValue.z;
                    float multiplyAddValue3 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue = multiplyAddValue3 > 0.0f;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    float branchMergedValue32;
                    if ((scalarValue2 == scalarValue3) && (scalarValue3 == scalarValue4))
                    {
                        float branchMergedValue33;
                        float branchMergedValue35;
                        float branchMergedValue36;
                        if (conditionValue)
                        {
                            uint unusedTextureMipCount1152;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1152);
                            float productValue = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue1;
                            float productValue1 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue2;
                            float scalarValue5 = frac(productValue);
                            float scalarValue6 = frac(productValue1);
                            float comparisonValue14;
                            if (abs(scalarValue5 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue14 = ((scalarValue5 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue14 = multiplyAddValue1;
                            }
                            float comparisonValue15;
                            if (abs(scalarValue6 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue15 = ((scalarValue6 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
                            }
                            else
                            {
                                comparisonValue15 = multiplyAddValue2;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue14, comparisonValue15));
                            float scalarValue7 = vectorValue1.x;
                            float scalarValue8 = vectorValue1.y;
                            float scalarValue9 = vectorValue1.z;
                            float scalarValue10 = vectorValue1.w;
                            float sumValue = frac(productValue + 0.5f);
                            float sumValue1 = frac(productValue1 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue7 : scalarValue10;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue8 : scalarValue9;
                            float clampedValue = intermediateValue1[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue4 = intermediateValue1[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue - clampedValue4;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue9 : scalarValue10;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue8 : scalarValue7;
                            float clampedValue5 = intermediateValue1[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                            float productValue2 = inverseLengthValue * multiplyAddValue3;
                            branchMergedValue33 = productValue2 * clampedValue5;
                            branchMergedValue35 = inverseLengthValue * 0.25f;
                            branchMergedValue36 = productValue2 * sumValue2;
                        }
                        else
                        {
                            branchMergedValue33 = 0.0f;
                            branchMergedValue35 = 1.0f;
                            branchMergedValue36 = 0.0f;
                        }
                        branchMergedValue30 = branchMergedValue33;
                        branchMergedValue31 = branchMergedValue35;
                        branchMergedValue32 = branchMergedValue36;
                    }
                    else
                    {
                        uint unusedTextureMipCount1089;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount1089);
                        float branchMergedValue34;
                        float branchMergedValue37;
                        float branchMergedValue38;
                        if (conditionValue)
                        {
                            float productValue3 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue1);
                            float productValue4 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue2);
                            float comparisonValue1 = (((productValue3 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue3 * 2.0f) + (-1.0f))) - (((productValue3 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue.w * 2.0f) + (-1.0f)));
                            float comparisonValue2 = (((productValue4 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue4 * 2.0f) + (-1.0f))) - (((productValue4 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue2 * 2.0f) + (-1.0f)));
                            float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                            float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, 0.25f), float3(comparisonValue3, comparisonValue4, 0.25f)));
                            float productValue5 = inverseLengthValue1 * multiplyAddValue3;
                            branchMergedValue34 = productValue5 * comparisonValue4;
                            branchMergedValue37 = inverseLengthValue1 * 0.25f;
                            branchMergedValue38 = productValue5 * comparisonValue3;
                        }
                        else
                        {
                            branchMergedValue34 = 0.0f;
                            branchMergedValue37 = 1.0f;
                            branchMergedValue38 = 0.0f;
                        }
                        branchMergedValue30 = branchMergedValue34;
                        branchMergedValue31 = branchMergedValue37;
                        branchMergedValue32 = branchMergedValue38;
                    }
                    branchMergedValue16 = branchMergedValue30;
                    branchMergedValue26 = branchMergedValue31;
                    branchMergedValue27 = branchMergedValue32;
                }
                branchMergedValue1 = branchMergedValue16;
                branchMergedValue11 = branchMergedValue26;
                branchMergedValue12 = branchMergedValue27;
            }
            else
            {
                float multiplyAddValue4 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                float multiplyAddValue5 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                float multiplyAddValue6 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue17;
                float branchMergedValue28;
                float branchMergedValue29;
                if (multiplyAddValue6 > 0.0f)
                {
                    uint unusedTextureMipCount912;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount912);
                    float productValue6 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue4;
                    float productValue7 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue5;
                    float scalarValue11 = frac(productValue6);
                    float scalarValue12 = frac(productValue7);
                    float comparisonValue8;
                    if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue8 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue4;
                    }
                    float comparisonValue13;
                    if (abs(scalarValue12 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue13 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue5;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue8, comparisonValue13));
                    float scalarValue13 = vectorValue4.x;
                    float scalarValue14 = vectorValue4.y;
                    float scalarValue15 = vectorValue4.z;
                    float scalarValue16 = vectorValue4.w;
                    float sumValue3 = frac(productValue6 + 0.5f);
                    float sumValue4 = frac(productValue7 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue13 : scalarValue16;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue14 : scalarValue15;
                    float clampedValue6 = intermediateValue2[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue7 = intermediateValue2[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue6 - clampedValue7;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue15 : scalarValue16;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue14 : scalarValue13;
                    float clampedValue8 = intermediateValue2[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue8, 0.25f), float3(sumValue5, clampedValue8, 0.25f)));
                    float productValue8 = inverseLengthValue2 * multiplyAddValue6;
                    branchMergedValue17 = productValue8 * clampedValue8;
                    branchMergedValue28 = inverseLengthValue2 * 0.25f;
                    branchMergedValue29 = productValue8 * sumValue5;
                }
                else
                {
                    branchMergedValue17 = 0.0f;
                    branchMergedValue28 = 1.0f;
                    branchMergedValue29 = 0.0f;
                }
                branchMergedValue1 = branchMergedValue17;
                branchMergedValue11 = branchMergedValue28;
                branchMergedValue12 = branchMergedValue29;
            }
            intermediateValue63 = branchMergedValue12;
            intermediateValue64 = branchMergedValue1;
            intermediateValue65 = branchMergedValue11;
        }
        else
        {
            float multiplyAddValue7 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
            float multiplyAddValue8 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
            uint unusedTextureMipCount353;
            uint2 vectorValue5 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount353);
            float productValue9 = float(int(uint(int(float(int(vectorValue5.x)))))) * multiplyAddValue7;
            float productValue10 = float(int(uint(int(float(int(vectorValue5.y)))))) * multiplyAddValue8;
            float scalarValue17 = ddx_coarse(productValue9);
            float scalarValue18 = ddx_coarse(productValue10);
            float sumValue6 = ddy_coarse((-0.0f) - productValue9);
            float sumValue7 = ddy_coarse((-0.0f) - productValue10);
            float dotProductValue = max(0.0f, log2(max(dot(float2(scalarValue17, scalarValue18), float2(scalarValue17, scalarValue18)), dot(float2(sumValue6, sumValue7), float2(sumValue6, sumValue7)))) * 0.5f);
            float branchMergedValue2;
            float branchMergedValue13;
            float branchMergedValue14;
            if (!(dotProductValue <= 1.0f))
            {
                branchMergedValue2 = 0.0f;
                branchMergedValue13 = 1.0f;
                branchMergedValue14 = 0.0f;
            }
            else
            {
                float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue7, multiplyAddValue8), dotProductValue);
                float clampedValue9 = (1.0f - clamp(dotProductValue * dotProductValue, 0.0f, 1.0f)) * (1.0f / ((sampledTextureValue1.z * 2.0f) + (-1.0f)));
                float productValue11 = clampedValue9 * ((sampledTextureValue1.x * 2.0f) + (-1.0f));
                float productValue12 = clampedValue9 * ((sampledTextureValue1.y * 2.0f) + (-1.0f));
                float inverseLengthValue3 = rsqrt(dot(float3(productValue11, productValue12, 1.0f), float3(productValue11, productValue12, 1.0f)));
                branchMergedValue2 = productValue12 * inverseLengthValue3;
                branchMergedValue13 = inverseLengthValue3;
                branchMergedValue14 = productValue11 * inverseLengthValue3;
            }
            intermediateValue63 = branchMergedValue14;
            intermediateValue64 = branchMergedValue2;
            intermediateValue65 = branchMergedValue13;
        }
        float intermediateValue6;
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
        if ((scalarValue1 & 1u) == 0u)
        {
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
            loadedBufferValue1 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 9u).x);
            intermediateValue6 = loadedBufferValue8;
        }
        else
        {
            float4 sampledTextureValue2 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, asfloat(rdLoad_pbrData(scalarValue * 16u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 2u).x)), mad(varyingTexCoord0.y, asfloat(rdLoad_pbrData((scalarValue * 16u) + 1u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 3u).x))));
            loadedBufferValue = sampledTextureValue2.y;
            loadedBufferValue2 = sampledTextureValue2.x;
            loadedBufferValue1 = sampledTextureValue2.z;
            intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue2.w : loadedBufferValue8;
        }
        float comparisonValue5 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue6 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue5, comparisonValue6, comparisonValue7), float3(comparisonValue5, comparisonValue6, comparisonValue7)));
        float inverseLengthValue5 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue6 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue63;
        multiplyAddValue = mad(inverseLengthValue4 * comparisonValue5, intermediateValue65, mad(inverseLengthValue5 * varyingBitangent0.x, intermediateValue64, inverseLengthValue6 * varyingTangent0.x));
        intermediateValue3 = mad(inverseLengthValue4 * comparisonValue6, intermediateValue65, mad(inverseLengthValue5 * varyingBitangent0.y, intermediateValue64, inverseLengthValue6 * varyingTangent0.y));
        intermediateValue4 = mad(inverseLengthValue4 * comparisonValue7, intermediateValue65, mad(inverseLengthValue5 * varyingBitangent0.z, intermediateValue64, inverseLengthValue6 * varyingTangent0.z));
        intermediateValue5 = intermediateValue6;
        intermediateValue7 = loadedBufferValue;
        intermediateValue8 = loadedBufferValue1;
        intermediateValue9 = loadedBufferValue2;
    }
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    float intermediateValue57;
    float intermediateValue58;
    float intermediateValue59;
    float intermediateValue60;
    float intermediateValue61;
    float intermediateValue62;
    if (RD_UNIFORM_BIOME_BLENDING_PARAMETERS.x > 0.0f)
    {
        uint productValue13 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z * 0.5f));
        float quotientValue = (varyingTexCoord3.x - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.x) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
        float quotientValue1 = (varyingTexCoord3.z - RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.z) / RD_UNIFORM_BIOME_BLENDING_LAST_UPDATE_POSITION.w;
        uint sumValue8 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.z)) + 4294967295u;
        uint sumValue9 = uint(min(int(uint(max(int(uint(int(floor(quotientValue))) + productValue13), int(0u)))), int(sumValue8)));
        uint sumValue10 = uint(min(int(uint(max(int(uint(int(floor(quotientValue1))) + productValue13), int(0u)))), int(sumValue8)));
        uint loadedBufferValue11 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue9, sumValue10), 0u)).x * 255.0f)));
        uint scalarValue19 = uint(int(RD_UNIFORM_BIOME_BLENDING_PARAMETERS.w));
        uint comparisonValue9 = (int(loadedBufferValue11) >= int(scalarValue19)) ? 0u : loadedBufferValue11;
        uint sumValue11 = sumValue9 + 1u;
        uint loadedBufferValue12 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue11, sumValue10), 0u)).x * 255.0f)));
        uint comparisonValue10 = (int(loadedBufferValue12) >= int(scalarValue19)) ? 0u : loadedBufferValue12;
        uint sumValue15 = sumValue10 + 1u;
        uint loadedBufferValue13 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue9, sumValue15), 0u)).x * 255.0f)));
        uint comparisonValue11 = (int(loadedBufferValue13) >= int(scalarValue19)) ? 0u : loadedBufferValue13;
        uint loadedBufferValue14 = uint(int(round(biomeBlendingMapTexture.Load(int3(uint2(sumValue11, sumValue15), 0u)).x * 255.0f)));
        uint comparisonValue12 = (int(loadedBufferValue14) >= int(scalarValue19)) ? 0u : loadedBufferValue14;
        float branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue4;
        float branchMergedValue5;
        float branchMergedValue6;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        if (((comparisonValue9 == comparisonValue10) && (comparisonValue10 == comparisonValue11)) && (comparisonValue11 == comparisonValue12))
        {
            uint scalarValue20 = (comparisonValue9 * 20u) + 8u;
            float3 loadedBufferValue15 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(scalarValue20).x, rdLoad_zBiomeInfoBuffer(scalarValue20 + 1u).x, rdLoad_zBiomeInfoBuffer(scalarValue20 + 2u).x));
            uint productValue14 = (comparisonValue9 * 20u) + 12u;
            float2 loadedBufferValue16 = asfloat(uint2(rdLoad_zBiomeInfoBuffer(productValue14).x, rdLoad_zBiomeInfoBuffer(productValue14 + 1u).x));
            uint productValue15 = (comparisonValue9 * 20u) + 16u;
            float4 loadedBufferValue17 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue15).x, rdLoad_zBiomeInfoBuffer(productValue15 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue15 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue15 + 3u).x));
            branchMergedValue = loadedBufferValue17.z;
            branchMergedValue3 = loadedBufferValue17.w;
            branchMergedValue4 = loadedBufferValue15.x;
            branchMergedValue5 = loadedBufferValue15.y;
            branchMergedValue6 = loadedBufferValue15.z;
            branchMergedValue7 = loadedBufferValue16.x;
            branchMergedValue8 = loadedBufferValue16.y;
            branchMergedValue9 = loadedBufferValue17.x;
            branchMergedValue10 = loadedBufferValue17.y;
        }
        else
        {
            uint productValue16 = (comparisonValue9 * 20u) + 8u;
            float3 loadedBufferValue18 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue16).x, rdLoad_zBiomeInfoBuffer(productValue16 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue16 + 2u).x));
            float scalarValue21 = loadedBufferValue18.x;
            float scalarValue22 = loadedBufferValue18.y;
            float scalarValue23 = loadedBufferValue18.z;
            uint productValue17 = (comparisonValue9 * 20u) + 12u;
            float2 loadedBufferValue19 = asfloat(uint2(rdLoad_zBiomeInfoBuffer(productValue17).x, rdLoad_zBiomeInfoBuffer(productValue17 + 1u).x));
            float scalarValue24 = loadedBufferValue19.x;
            float scalarValue25 = loadedBufferValue19.y;
            uint productValue18 = (comparisonValue9 * 20u) + 16u;
            float4 loadedBufferValue20 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue18).x, rdLoad_zBiomeInfoBuffer(productValue18 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue18 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue18 + 3u).x));
            float scalarValue26 = loadedBufferValue20.x;
            float scalarValue27 = loadedBufferValue20.y;
            float scalarValue28 = loadedBufferValue20.z;
            float scalarValue29 = loadedBufferValue20.w;
            uint productValue19 = (comparisonValue10 * 20u) + 8u;
            float3 loadedBufferValue21 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue19).x, rdLoad_zBiomeInfoBuffer(productValue19 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue19 + 2u).x));
            float scalarValue30 = loadedBufferValue21.x;
            float scalarValue31 = loadedBufferValue21.y;
            float scalarValue32 = loadedBufferValue21.z;
            uint productValue20 = (comparisonValue10 * 20u) + 12u;
            float2 loadedBufferValue22 = asfloat(uint2(rdLoad_zBiomeInfoBuffer(productValue20).x, rdLoad_zBiomeInfoBuffer(productValue20 + 1u).x));
            float scalarValue33 = loadedBufferValue22.x;
            float scalarValue34 = loadedBufferValue22.y;
            uint productValue21 = (comparisonValue10 * 20u) + 16u;
            float4 loadedBufferValue23 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue21).x, rdLoad_zBiomeInfoBuffer(productValue21 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue21 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue21 + 3u).x));
            float scalarValue35 = loadedBufferValue23.x;
            float scalarValue36 = loadedBufferValue23.y;
            float scalarValue37 = loadedBufferValue23.z;
            float scalarValue38 = loadedBufferValue23.w;
            uint productValue22 = (comparisonValue11 * 20u) + 8u;
            float3 loadedBufferValue24 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue22).x, rdLoad_zBiomeInfoBuffer(productValue22 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue22 + 2u).x));
            float scalarValue39 = loadedBufferValue24.x;
            float scalarValue40 = loadedBufferValue24.y;
            float scalarValue41 = loadedBufferValue24.z;
            uint productValue23 = (comparisonValue11 * 20u) + 12u;
            float2 loadedBufferValue25 = asfloat(uint2(rdLoad_zBiomeInfoBuffer(productValue23).x, rdLoad_zBiomeInfoBuffer(productValue23 + 1u).x));
            float scalarValue42 = loadedBufferValue25.x;
            float scalarValue43 = loadedBufferValue25.y;
            uint productValue27 = (comparisonValue11 * 20u) + 16u;
            float4 loadedBufferValue26 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue27).x, rdLoad_zBiomeInfoBuffer(productValue27 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue27 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue27 + 3u).x));
            float scalarValue44 = loadedBufferValue26.x;
            float scalarValue45 = loadedBufferValue26.y;
            float scalarValue46 = loadedBufferValue26.z;
            float scalarValue47 = loadedBufferValue26.w;
            uint productValue28 = (comparisonValue12 * 20u) + 8u;
            float3 loadedBufferValue27 = asfloat(uint3(rdLoad_zBiomeInfoBuffer(productValue28).x, rdLoad_zBiomeInfoBuffer(productValue28 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue28 + 2u).x));
            float scalarValue48 = loadedBufferValue27.x;
            float scalarValue49 = loadedBufferValue27.y;
            float scalarValue50 = loadedBufferValue27.z;
            uint productValue29 = (comparisonValue12 * 20u) + 12u;
            float2 loadedBufferValue28 = asfloat(uint2(rdLoad_zBiomeInfoBuffer(productValue29).x, rdLoad_zBiomeInfoBuffer(productValue29 + 1u).x));
            float scalarValue51 = loadedBufferValue28.x;
            float scalarValue52 = loadedBufferValue28.y;
            uint productValue30 = (comparisonValue12 * 20u) + 16u;
            float4 loadedBufferValue29 = asfloat(uint4(rdLoad_zBiomeInfoBuffer(productValue30).x, rdLoad_zBiomeInfoBuffer(productValue30 + 1u).x, rdLoad_zBiomeInfoBuffer(productValue30 + 2u).x, rdLoad_zBiomeInfoBuffer(productValue30 + 3u).x));
            float scalarValue53 = loadedBufferValue29.x;
            float scalarValue54 = loadedBufferValue29.y;
            float scalarValue55 = loadedBufferValue29.z;
            float scalarValue56 = loadedBufferValue29.w;
            float scalarValue57 = frac(quotientValue);
            float scalarValue58 = frac(quotientValue1);
            float sumValue16 = 1.0f - scalarValue57;
            float sumValue17 = 1.0f - scalarValue58;
            float productValue31 = sumValue17 * sumValue16;
            float productValue32 = sumValue17 * scalarValue57;
            float productValue33 = sumValue16 * scalarValue58;
            float productValue36 = scalarValue58 * scalarValue57;
            float branchMergedValue15;
            float branchMergedValue18;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            float branchMergedValue22;
            float branchMergedValue23;
            float branchMergedValue24;
            float branchMergedValue25;
            if ((((scalarValue29 == scalarValue38) && ((scalarValue28 == scalarValue37) && ((scalarValue27 == scalarValue36) && ((scalarValue26 == scalarValue35) && ((scalarValue25 == scalarValue34) && ((scalarValue24 == scalarValue33) && ((scalarValue23 == scalarValue32) && ((scalarValue21 == scalarValue30) && (scalarValue22 == scalarValue31))))))))) && ((scalarValue38 == scalarValue47) && ((scalarValue37 == scalarValue46) && ((scalarValue36 == scalarValue45) && ((scalarValue35 == scalarValue44) && ((scalarValue34 == scalarValue43) && ((scalarValue33 == scalarValue42) && ((scalarValue32 == scalarValue41) && ((scalarValue30 == scalarValue39) && (scalarValue31 == scalarValue40)))))))))) && ((scalarValue47 == scalarValue56) && ((scalarValue46 == scalarValue55) && ((scalarValue45 == scalarValue54) && ((scalarValue44 == scalarValue53) && ((scalarValue43 == scalarValue52) && ((scalarValue42 == scalarValue51) && ((scalarValue41 == scalarValue50) && ((scalarValue39 == scalarValue48) && (scalarValue40 == scalarValue49))))))))))
            {
                branchMergedValue15 = scalarValue28;
                branchMergedValue18 = scalarValue29;
                branchMergedValue19 = scalarValue21;
                branchMergedValue20 = scalarValue22;
                branchMergedValue21 = scalarValue23;
                branchMergedValue22 = scalarValue24;
                branchMergedValue23 = scalarValue25;
                branchMergedValue24 = scalarValue26;
                branchMergedValue25 = scalarValue27;
            }
            else
            {
                branchMergedValue15 = (((productValue36 * scalarValue55) + (productValue33 * scalarValue46)) + (productValue32 * scalarValue37)) + (productValue31 * scalarValue28);
                branchMergedValue18 = (((productValue36 * scalarValue56) + (productValue33 * scalarValue47)) + (productValue32 * scalarValue38)) + (productValue31 * scalarValue29);
                branchMergedValue19 = (((productValue36 * scalarValue48) + (productValue33 * scalarValue39)) + (productValue32 * scalarValue30)) + (productValue31 * scalarValue21);
                branchMergedValue20 = (((productValue36 * scalarValue49) + (productValue33 * scalarValue40)) + (productValue32 * scalarValue31)) + (productValue31 * scalarValue22);
                branchMergedValue21 = (((productValue36 * scalarValue50) + (productValue33 * scalarValue41)) + (productValue32 * scalarValue32)) + (productValue31 * scalarValue23);
                branchMergedValue22 = (((productValue36 * scalarValue51) + (productValue33 * scalarValue42)) + (productValue32 * scalarValue33)) + (productValue31 * scalarValue24);
                branchMergedValue23 = (((productValue36 * scalarValue52) + (productValue33 * scalarValue43)) + (productValue32 * scalarValue34)) + (productValue31 * scalarValue25);
                branchMergedValue24 = (((productValue36 * scalarValue53) + (productValue33 * scalarValue44)) + (productValue32 * scalarValue35)) + (productValue31 * scalarValue26);
                branchMergedValue25 = (((productValue36 * scalarValue54) + (productValue33 * scalarValue45)) + (productValue32 * scalarValue36)) + (productValue31 * scalarValue27);
            }
            branchMergedValue = branchMergedValue15;
            branchMergedValue3 = branchMergedValue18;
            branchMergedValue4 = branchMergedValue19;
            branchMergedValue5 = branchMergedValue20;
            branchMergedValue6 = branchMergedValue21;
            branchMergedValue7 = branchMergedValue22;
            branchMergedValue8 = branchMergedValue23;
            branchMergedValue9 = branchMergedValue24;
            branchMergedValue10 = branchMergedValue25;
        }
        intermediateValue54 = branchMergedValue3;
        intermediateValue55 = branchMergedValue4;
        intermediateValue56 = branchMergedValue5;
        intermediateValue57 = branchMergedValue6;
        intermediateValue58 = branchMergedValue7;
        intermediateValue59 = branchMergedValue8;
        intermediateValue60 = branchMergedValue9;
        intermediateValue61 = branchMergedValue10;
        intermediateValue62 = branchMergedValue;
    }
    else
    {
        intermediateValue54 = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.w;
        intermediateValue55 = RD_UNIFORM_WATER_SURFACE_PARAMETERS.x;
        intermediateValue56 = RD_UNIFORM_WATER_SURFACE_PARAMETERS.y;
        intermediateValue57 = RD_UNIFORM_WATER_SURFACE_PARAMETERS.z;
        intermediateValue58 = RD_UNIFORM_WATER_SURFACE_WAVE_PARAMETERS.x;
        intermediateValue59 = RD_UNIFORM_WATER_SURFACE_WAVE_PARAMETERS.y;
        intermediateValue60 = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.x;
        intermediateValue61 = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.y;
        intermediateValue62 = RD_UNIFORM_WATER_SURFACE_OCTAVE_PARAMETERS.z;
    }
    float productValue24;
    float productValue25;
    float productValue26;
    if (RD_UNIFORM_WATER_SURFACE_ENABLED_AND_EXTINCTION_DIST_SHIFT.x > 0.0f)
    {
        float productValue37 = RD_UNIFORM_VIEW_POSITION_AND_TIME.w * 0.5f;
        uint scalarValue59 = uint(intermediateValue56);
        float intermediateValue75;
        float intermediateValue76;
        float intermediateValue77;
        if (scalarValue59 == 0u)
        {
            intermediateValue75 = 0.0f;
            intermediateValue76 = 0.0f;
            intermediateValue77 = 0.0f;
        }
        else
        {
            float intermediateValue79;
            float sumValue13;
            float sumValue14;
            float intermediateValue80;
            float intermediateValue81;
            float intermediateValue82;
            float intermediateValue83;
            float intermediateValue84;
            float intermediateValue85;
            uint intermediateValue86;
            intermediateValue79 = intermediateValue55;
            sumValue13 = varyingTexCoord3.x - RD_UNIFORM_WORLD_ORIGIN.x;
            sumValue14 = varyingTexCoord3.z - RD_UNIFORM_WORLD_ORIGIN.z;
            intermediateValue80 = intermediateValue58;
            intermediateValue81 = 0.0f;
            intermediateValue82 = 1.0f;
            intermediateValue83 = 0.0f;
            intermediateValue84 = 0.0f;
            intermediateValue85 = 0.0f;
            intermediateValue86 = 0u;
            float sumValue12;
            float productValue34;
            float productValue35;
            for (;;)
            {
                float wavePhaseValue = sin(intermediateValue81);
                float wavePhaseValue1 = cos(intermediateValue81);
                float2 vectorValue6 = float2(sumValue13, sumValue14);
                float dotProductValue1 = dot(float2(wavePhaseValue, wavePhaseValue1), vectorValue6) * intermediateValue79;
                float productValue38 = dotProductValue1 + (productValue37 * intermediateValue80);
                float wavePhaseValue2 = sin(productValue38);
                float exponentialValue = exp2(log2((wavePhaseValue2 + 1.0f) * 0.5f) * intermediateValue59);
                float wavePhaseValue3 = cos(productValue38) * intermediateValue82;
                float quotientValue2 = (1.0f / (wavePhaseValue2 + 1.00010001659393310546875f)) * (((intermediateValue59 * intermediateValue57) * intermediateValue79) * wavePhaseValue3);
                float productValue39 = (-0.0f) - (wavePhaseValue3 * exponentialValue);
                productValue34 = intermediateValue84 - ((quotientValue2 * wavePhaseValue) * exponentialValue);
                productValue35 = intermediateValue85 - ((quotientValue2 * wavePhaseValue1) * exponentialValue);
                sumValue12 = intermediateValue83 + intermediateValue82;
                uint sumValue18 = intermediateValue86 + 1u;
                if (sumValue18 < scalarValue59)
                {
                    intermediateValue79 *= intermediateValue62;
                    sumValue13 = ((wavePhaseValue * intermediateValue60) * productValue39) + sumValue13;
                    sumValue14 = ((wavePhaseValue1 * intermediateValue60) * productValue39) + sumValue14;
                    intermediateValue80 *= intermediateValue54;
                    intermediateValue81 += 1.39900004863739013671875f;
                    intermediateValue82 -= (intermediateValue82 * intermediateValue61);
                    intermediateValue83 = sumValue12;
                    intermediateValue84 = productValue34;
                    intermediateValue85 = productValue35;
                    intermediateValue86 = sumValue18;
                }
                else
                {
                    break;
                }
            }
            intermediateValue75 = sumValue12;
            intermediateValue76 = productValue34;
            intermediateValue77 = productValue35;
        }
        float quotientValue3 = intermediateValue76 / intermediateValue75;
        float quotientValue4 = intermediateValue77 / intermediateValue75;
        float inverseLengthValue7 = rsqrt(dot(float3(quotientValue3, 1.0f, quotientValue4), float3(quotientValue3, 1.0f, quotientValue4)));
        float dotProductValue2 = dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(0.0f, 1.0f, 0.0f));
        float productValue40 = (((inverseLengthValue7 * quotientValue3) - varyingNormal0.x) * dotProductValue2) + varyingNormal0.x;
        float productValue41 = (dotProductValue2 * (inverseLengthValue7 - varyingNormal0.y)) + varyingNormal0.y;
        float productValue42 = (((inverseLengthValue7 * quotientValue4) - varyingNormal0.z) * dotProductValue2) + varyingNormal0.z;
        float inverseLengthValue8 = rsqrt(dot(float3(productValue40, productValue41, productValue42), float3(productValue40, productValue41, productValue42)));
        productValue24 = productValue40 * inverseLengthValue8;
        productValue25 = productValue41 * inverseLengthValue8;
        productValue26 = productValue42 * inverseLengthValue8;
    }
    else
    {
        productValue24 = multiplyAddValue;
        productValue25 = intermediateValue3;
        productValue26 = intermediateValue4;
    }
    float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue19 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue20 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue21 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue9 = rsqrt(dot(float3(productValue24, productValue25, productValue26), float3(productValue24, productValue25, productValue26)));
    float productValue43 = inverseLengthValue9 * productValue24;
    float productValue44 = inverseLengthValue9 * productValue25;
    float productValue45 = inverseLengthValue9 * productValue26;
    float quotientValue5 = 1.0f / ((abs(productValue44) + abs(productValue43)) + abs(productValue45));
    float productValue46 = quotientValue5 * productValue43;
    float productValue47 = quotientValue5 * productValue44;
    bool conditionValue5 = productValue45 < 0.0f;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue21, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue20, sumValue19 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue48 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue1 = clamp(productValue48, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue48 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue48, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue48 * productValue48) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue48, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = varyingTexCoord5.x;
        clampedValue2 = varyingTexCoord5.y;
        clampedValue3 = varyingTexCoord5.z;
    }
    float productValue49 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue50 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue51 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue10 = ceil(clamp(max(max(productValue49, productValue51), max(productValue50, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue49 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue50 / clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue51 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(varyingTexCoord1.y, 0.0f, 1.0f) * 255.0f);
    fragmentColor1.x = sampledTextureValue3.x;
    fragmentColor1.y = sampledTextureValue3.y;
    fragmentColor1.z = sampledTextureValue3.z;
    fragmentColor1.w = (intermediateValue9 > intermediateValue5) ? ((intermediateValue9 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue46 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue47))) : productValue46;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue46)) * ((productValue47 < 0.0f) ? (-1.0f) : 1.0f)) : productValue47;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue21, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue20, sumValue19 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue10)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue21, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue20, sumValue19 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue10)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
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
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
