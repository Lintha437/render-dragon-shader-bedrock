// RenderChunkPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
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
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/RenderChunkPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord2 : TEXCOORD2,
  float2 varyingTexCoord1 : TEXCOORD1,
  nointerpolation int varyingFrontFacing0 : FRONTFACING0,
  nointerpolation int varyingTexCoord4 : TEXCOORD4,
  float3 varyingTexCoord5 : TEXCOORD5,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTangent0 : TANGENT0,
  float4 varyingTexCoord0 : TEXCOORD0,
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
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector1.x = RD_COMPARISON_MASK(0 != varyingTexCoord2.y);
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xyz;
  workingVector2.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  fragmentColor1.xyz = workingVector1.xxx ? workingVector0.xyz : workingVector1.yzw;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  fragmentColor1.xyz = varyingColor0.www * workingVector0.xyz;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingTexCoord3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.x = RD_COMPARISON_MASK(0 != varyingTexCoord2.y);
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xyz;
  workingVector2.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  fragmentColor1.xyz = workingVector1.xxx ? workingVector0.xyz : workingVector1.yzw;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
  workingVector1.x = RD_COMPARISON_MASK(0.5 < varyingTexCoord2.x);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_VIEW_POSITION_AND_TIME.xyz + varyingTexCoord3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_2.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_2.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor1.xy / varyingColor1.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_2.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  fragmentColor1.xyz = varyingColor0.www * workingVector0.xyz;
#endif
  workingVector0.x = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.x != 0) {
    workingVector0.x = sampledResource3[varyingTexCoord4.x].val[16/4];
    workingVector0.y = sampledResource3[varyingTexCoord4.x].val[16/4+1];
    workingVector0.z = sampledResource3[varyingTexCoord4.x].val[16/4+2];
    workingVector0.w = sampledResource3[varyingTexCoord4.x].val[16/4+3];
    workingVector1.x = sampledResource3[varyingTexCoord4.x].val[32/4+1];
    workingVector1.y = sampledResource3[varyingTexCoord4.x].val[32/4+2];
    workingVector1.z = sampledResource3[varyingTexCoord4.x].val[32/4];
    workingVector1.w = sampledResource3[varyingTexCoord4.x].val[32/4+3];
    workingVector2.y = sampledResource3[varyingTexCoord4.x].val[48/4];
    workingVector2.z = sampledResource3[varyingTexCoord4.x].val[48/4+1];
    workingVector3.xy = (int2)workingVector1.zz & int2(4,1);
    workingVector3.xy = RD_COMPARISON_MASK((int2)workingVector3.xy == int2(4,1));
    if (workingVector3.x != 0) {
      workingVector3.xz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector3.xzw = materialTexture1.Sample(textureSampler1, workingVector3.xz).xyz;
      workingVector3.xzw = workingVector3.xzw * float3(2,2,2) + float3(-1,-1,-1);
    } else {
      workingVector2.w = sampledResource3[varyingTexCoord4.x].val[60/4];
      workingVector4.x = (int)workingVector1.z & 8;
      workingVector4.x = RD_COMPARISON_MASK((int)workingVector4.x == 8);
      if (workingVector4.x != 0) {
        workingVector4.x = workingVector2.w + -workingVector2.z;
        workingVector4.x = min(workingVector4.x, workingVector2.w);
        workingVector4.x = saturate(2 + -workingVector4.x);
        workingVector4.y = RD_COMPARISON_MASK(0 < workingVector4.x);
        if (workingVector4.y != 0) {
          workingVector4.yz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
          materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
          workingVector6.xyzw = materialTexture1.Gather(textureSampler1, workingVector6.xy).xyzw;
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
          workingVector4.xyzw = materialTexture1.SampleLevel(textureSampler1, workingVector0.xy, 0).xyzw;
          workingVector2.zw = RD_COMPARISON_MASK(workingVector4.yz == workingVector4.xy);
          workingVector0.w = workingVector2.w ? workingVector2.z : 0;
          if (workingVector0.w != 0) {
            workingVector0.w = saturate(2 + -workingVector0.z);
            workingVector2.z = RD_COMPARISON_MASK(0 < workingVector0.w);
            if (workingVector2.z != 0) {
              materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
              workingVector6.xyzw = materialTexture1.Gather(textureSampler1, workingVector2.zw).xyzw;
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
            materialTexture1.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
      workingVector0.x = sampledResource3[varyingTexCoord4.x].val[0/4];
      workingVector0.y = sampledResource3[varyingTexCoord4.x].val[0/4+1];
      workingVector0.z = sampledResource3[varyingTexCoord4.x].val[0/4+2];
      workingVector0.w = sampledResource3[varyingTexCoord4.x].val[0/4+3];
      workingVector0.xy = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector0.xyzw = materialTexture1.Sample(textureSampler1, workingVector0.xy).xyzw;
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
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord3.xyz;
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
  workingVector2.xy = workingVector2.xy ? float2(1,1) : 0;
  workingVector2.xy = workingVector2.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector2.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.zw : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector3.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector3.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector3.zzz + workingVector2.xyz;
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
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
    uint scalarValue = uint(varyingTexCoord4);
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    if (scalarValue4 < 0.5f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    if (sampledTextureValue.w < 0.5f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    bool comparisonValue1;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue12 = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue17 = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue12), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue12), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue12)), float3(varyingTexCoord3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingTexCoord3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingTexCoord3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue2 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue3 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue40 = floor(quotientValue3 * 0.25f);
        float productValue41 = floor(quotientValue3 * 0.5f);
        float scalarValue25 = floor(quotientValue3);
        comparisonValue1 = ((clampedValue17 * clampedValue17) * (3.0f - (clampedValue17 * 2.0f))) <= ((((frac(((productValue41 * productValue41) * 0.75f) + (floor(quotientValue2 * 0.5f) * 0.5f)) + (frac(((productValue40 * productValue40) * 0.75f) + (floor(quotientValue2 * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue25 * scalarValue25) * 0.75f) + (floor(quotientValue2) * 0.5f)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((scalarValue4 < 0.5f) || comparisonValue1)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    bool comparisonValue1;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue12 = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue17 = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue12), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue12), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue12)), float3(varyingTexCoord3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingTexCoord3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingTexCoord3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue2 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue3 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue40 = floor(quotientValue3 * 0.25f);
        float productValue41 = floor(quotientValue3 * 0.5f);
        float scalarValue25 = floor(quotientValue3);
        comparisonValue1 = ((clampedValue17 * clampedValue17) * (3.0f - (clampedValue17 * 2.0f))) <= ((((frac(((productValue41 * productValue41) * 0.75f) + (floor(quotientValue2 * 0.5f) * 0.5f)) + (frac(((productValue40 * productValue40) * 0.75f) + (floor(quotientValue2 * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue25 * scalarValue25) * 0.75f) + (floor(quotientValue2) * 0.5f)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((sampledTextureValue.w < 0.5f) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    float productValue = scalarValue1 * varyingColor0.x;
    float productValue1 = scalarValue2 * varyingColor0.y;
    float productValue2 = scalarValue3 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (varyingTexCoord2.y != 0.0f)
    {
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
    }
    float intermediateValue7;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    float4 sampledTextureValue4 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    float productValue = scalarValue1 * varyingColor0.x;
    float productValue1 = scalarValue2 * varyingColor0.y;
    float productValue2 = scalarValue3 * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    if (varyingTexCoord2.y != 0.0f)
    {
        productValue5 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue6 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue7 = (((productValue2 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
    }
    else
    {
        productValue5 = productValue;
        productValue6 = productValue1;
        productValue7 = productValue2;
    }
    float multiplyAddValue;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    float4 sampledTextureValue4 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
#if RD_FEATURE_SEASONS == RD_OFF
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#endif
    if (scalarValue == 65535u)
    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
        intermediateValue7 = 0.0f;
        intermediateValue8 = 1.0f;
        intermediateValue9 = 0.0f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
        intermediateValue3 = 0.0f;
        intermediateValue4 = 1.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
        intermediateValue8 = 0.0f;
        intermediateValue9 = 1.0f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
        multiplyAddValue = 0.0f;
        intermediateValue8 = 1.0f;
        intermediateValue9 = 0.0f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
        multiplyAddValue = 0.0f;
        intermediateValue4 = 1.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
        intermediateValue8 = 0.0f;
        intermediateValue9 = 1.0f;
#endif
        intermediateValue10 = 0.0f;
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue12 = 0.0f;
        intermediateValue13 = 1.0f;
        intermediateValue14 = 0.0f;
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
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
#endif
        if ((scalarValue5 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue5 = 0.0f;
                    branchMergedValue6 = 1.0f;
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
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                            uint unusedTextureMipCount591;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount591);
                            float productValue8 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue1;
                            float productValue9 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue2;
                            float scalarValue9 = frac(productValue8);
                            float scalarValue10 = frac(productValue9);
                            float comparisonValue10;
                            if (abs(scalarValue9 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                            uint unusedTextureMipCount598;
                            uint2 vectorValue5 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount598);
                            float productValue26 = float(int(uint(int(float(int(vectorValue5.x)))))) * multiplyAddValue1;
                            float productValue27 = float(int(uint(int(float(int(vectorValue5.y)))))) * multiplyAddValue2;
                            float scalarValue21 = frac(productValue26);
                            float scalarValue22 = frac(productValue27);
                            float comparisonValue10;
                            if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                            uint unusedTextureMipCount700;
                            uint2 vectorValue8 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount700);
                            float productValue42 = float(int(uint(int(float(int(vectorValue8.x)))))) * multiplyAddValue1;
                            float productValue43 = float(int(uint(int(float(int(vectorValue8.y)))))) * multiplyAddValue2;
                            float scalarValue26 = frac(productValue42);
                            float scalarValue27 = frac(productValue43);
                            float comparisonValue11;
                            if (abs(scalarValue26 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                            uint unusedTextureMipCount707;
                            uint2 vectorValue13 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount707);
                            float productValue57 = float(int(uint(int(float(int(vectorValue13.x)))))) * multiplyAddValue1;
                            float productValue58 = float(int(uint(int(float(int(vectorValue13.y)))))) * multiplyAddValue2;
                            float scalarValue38 = frac(productValue57);
                            float scalarValue39 = frac(productValue58);
                            float comparisonValue11;
                            if (abs(scalarValue38 + (-0.5f)) < 0.0625f)
#endif
                            {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                                comparisonValue10 = ((scalarValue9 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                                comparisonValue10 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                                comparisonValue11 = ((scalarValue26 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                                comparisonValue11 = ((scalarValue38 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                            }
                            else
                            {
#if RD_FEATURE_DITHERING == RD_OFF
                                comparisonValue10 = multiplyAddValue1;
#elif RD_FEATURE_DITHERING == RD_ON
                                comparisonValue11 = multiplyAddValue1;
#endif
                            }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                            float comparisonValue11;
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                            float comparisonValue11;
                            if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                            float comparisonValue12;
                            if (abs(scalarValue27 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                            float comparisonValue12;
                            if (abs(scalarValue39 + (-0.5f)) < 0.0625f)
#endif
                            {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                                comparisonValue11 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                                comparisonValue11 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                                comparisonValue12 = ((scalarValue27 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                                comparisonValue12 = ((scalarValue39 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue2;
#endif
                            }
                            else
                            {
#if RD_FEATURE_DITHERING == RD_OFF
                                comparisonValue11 = multiplyAddValue2;
#elif RD_FEATURE_DITHERING == RD_ON
                                comparisonValue12 = multiplyAddValue2;
#endif
                            }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue10, comparisonValue11));
                            float scalarValue11 = vectorValue1.x;
                            float scalarValue12 = vectorValue1.y;
                            float scalarValue13 = vectorValue1.z;
                            float scalarValue14 = vectorValue1.w;
                            float sumValue = frac(productValue8 + 0.5f);
                            float sumValue1 = frac(productValue9 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue10, comparisonValue11));
                            float scalarValue11 = vectorValue1.x;
                            float scalarValue12 = vectorValue1.y;
                            float scalarValue13 = vectorValue1.z;
                            float scalarValue14 = vectorValue1.w;
                            float sumValue9 = frac(productValue26 + 0.5f);
                            float sumValue10 = frac(productValue27 + 0.5f);
                            bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                            float4 vectorValue9 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue11, comparisonValue12));
                            float scalarValue28 = vectorValue9.x;
                            float scalarValue29 = vectorValue9.y;
                            float scalarValue30 = vectorValue9.z;
                            float scalarValue31 = vectorValue9.w;
                            float sumValue15 = frac(productValue42 + 0.5f);
                            float sumValue16 = frac(productValue43 + 0.5f);
                            bool conditionValue11 = sumValue16 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                            float4 vectorValue9 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue11, comparisonValue12));
                            float scalarValue28 = vectorValue9.x;
                            float scalarValue29 = vectorValue9.y;
                            float scalarValue30 = vectorValue9.z;
                            float scalarValue31 = vectorValue9.w;
                            float sumValue21 = frac(productValue57 + 0.5f);
                            float sumValue22 = frac(productValue58 + 0.5f);
                            bool conditionValue16 = sumValue22 > 0.5f;
#endif
                            float intermediateValue1[2];
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                            intermediateValue1[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float clampedValue4 = intermediateValue1[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue5 = intermediateValue1[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue4 - clampedValue5;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float clampedValue6 = intermediateValue1[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                            float productValue10 = inverseLengthValue * multiplyAddValue3;
                            branchMergedValue12 = productValue10 * sumValue2;
                            branchMergedValue14 = productValue10 * clampedValue6;
                            branchMergedValue15 = inverseLengthValue * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                            intermediateValue1[0u] = conditionValue6 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue6 ? scalarValue12 : scalarValue13;
                            float clampedValue11 = intermediateValue1[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue12 = intermediateValue1[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue11 = clampedValue11 - clampedValue12;
                            bool conditionValue7 = sumValue9 > 0.5f;
                            intermediateValue1[0u] = conditionValue7 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue12 : scalarValue11;
                            float clampedValue13 = intermediateValue1[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue7 = rsqrt(dot(float3(sumValue11, clampedValue13, 0.25f), float3(sumValue11, clampedValue13, 0.25f)));
                            float productValue28 = inverseLengthValue7 * multiplyAddValue3;
                            branchMergedValue12 = productValue28 * sumValue11;
                            branchMergedValue14 = productValue28 * clampedValue13;
                            branchMergedValue15 = inverseLengthValue7 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                            intermediateValue1[0u] = conditionValue11 ? scalarValue28 : scalarValue31;
                            intermediateValue1[1u] = conditionValue11 ? scalarValue29 : scalarValue30;
                            float clampedValue18 = intermediateValue1[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue19 = intermediateValue1[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue17 = clampedValue18 - clampedValue19;
                            bool conditionValue12 = sumValue15 > 0.5f;
                            intermediateValue1[0u] = conditionValue12 ? scalarValue30 : scalarValue31;
                            intermediateValue1[1u] = conditionValue12 ? scalarValue29 : scalarValue28;
                            float clampedValue20 = intermediateValue1[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue13 = rsqrt(dot(float3(sumValue17, clampedValue20, 0.25f), float3(sumValue17, clampedValue20, 0.25f)));
                            float productValue44 = inverseLengthValue13 * multiplyAddValue3;
                            branchMergedValue12 = productValue44 * sumValue17;
                            branchMergedValue14 = productValue44 * clampedValue20;
                            branchMergedValue15 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                            intermediateValue1[0u] = conditionValue16 ? scalarValue28 : scalarValue31;
                            intermediateValue1[1u] = conditionValue16 ? scalarValue29 : scalarValue30;
                            float clampedValue25 = intermediateValue1[uint(int(clamp((sumValue21 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue26 = intermediateValue1[uint(int(clamp((sumValue21 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue23 = clampedValue25 - clampedValue26;
                            bool conditionValue17 = sumValue21 > 0.5f;
                            intermediateValue1[0u] = conditionValue17 ? scalarValue30 : scalarValue31;
                            intermediateValue1[1u] = conditionValue17 ? scalarValue29 : scalarValue28;
                            float clampedValue27 = intermediateValue1[uint(int(clamp((sumValue22 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue22 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue17 = rsqrt(dot(float3(sumValue23, clampedValue27, 0.25f), float3(sumValue23, clampedValue27, 0.25f)));
                            float productValue59 = inverseLengthValue17 * multiplyAddValue3;
                            branchMergedValue12 = productValue59 * sumValue23;
                            branchMergedValue14 = productValue59 * clampedValue27;
                            branchMergedValue15 = inverseLengthValue17 * 0.25f;
#endif
                        }
                        else
                        {
                            branchMergedValue12 = 0.0f;
                            branchMergedValue14 = 0.0f;
                            branchMergedValue15 = 1.0f;
                        }
                        branchMergedValue9 = branchMergedValue12;
                        branchMergedValue10 = branchMergedValue14;
                        branchMergedValue11 = branchMergedValue15;
                    }
                    else
                    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                        uint unusedTextureMipCount581;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount581);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                        uint unusedTextureMipCount588;
                        uint2 vectorValue6 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount588);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                        uint unusedTextureMipCount690;
                        uint2 vectorValue10 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount690);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                        uint unusedTextureMipCount697;
                        uint2 vectorValue14 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount697);
#endif
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                            float productValue11 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue1);
                            float productValue12 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue2);
                            float comparisonValue2 = (((productValue11 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue11 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue3 = (((productValue12 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue12 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue6 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float comparisonValue7 = ((abs(comparisonValue3) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue3;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, 0.25f), float3(comparisonValue6, comparisonValue7, 0.25f)));
                            float productValue13 = inverseLengthValue1 * multiplyAddValue3;
                            branchMergedValue13 = productValue13 * comparisonValue6;
                            branchMergedValue16 = productValue13 * comparisonValue7;
                            branchMergedValue17 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                            float productValue29 = frac(float(int(uint(int(float(int(vectorValue6.x)))))) * multiplyAddValue1);
                            float productValue30 = frac(float(int(uint(int(float(int(vectorValue6.y)))))) * multiplyAddValue2);
                            float comparisonValue15 = (((productValue29 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue29 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue16 = (((productValue30 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue30 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                            float comparisonValue18 = ((abs(comparisonValue16) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue16;
                            float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue17, comparisonValue18, 0.25f), float3(comparisonValue17, comparisonValue18, 0.25f)));
                            float productValue31 = inverseLengthValue8 * multiplyAddValue3;
                            branchMergedValue13 = productValue31 * comparisonValue17;
                            branchMergedValue16 = productValue31 * comparisonValue18;
                            branchMergedValue17 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                            float productValue45 = frac(float(int(uint(int(float(int(vectorValue10.x)))))) * multiplyAddValue1);
                            float productValue46 = frac(float(int(uint(int(float(int(vectorValue10.y)))))) * multiplyAddValue2);
                            float comparisonValue19 = (((productValue45 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue45 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue20 = (((productValue46 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue46 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                            float comparisonValue22 = ((abs(comparisonValue20) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue20;
                            float inverseLengthValue14 = rsqrt(dot(float3(comparisonValue21, comparisonValue22, 0.25f), float3(comparisonValue21, comparisonValue22, 0.25f)));
                            float productValue47 = inverseLengthValue14 * multiplyAddValue3;
                            branchMergedValue13 = productValue47 * comparisonValue21;
                            branchMergedValue16 = productValue47 * comparisonValue22;
                            branchMergedValue17 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                            float productValue60 = frac(float(int(uint(int(float(int(vectorValue14.x)))))) * multiplyAddValue1);
                            float productValue61 = frac(float(int(uint(int(float(int(vectorValue14.y)))))) * multiplyAddValue2);
                            float comparisonValue23 = (((productValue60 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue60 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue24 = (((productValue61 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue61 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                            float comparisonValue26 = ((abs(comparisonValue24) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue24;
                            float inverseLengthValue18 = rsqrt(dot(float3(comparisonValue25, comparisonValue26, 0.25f), float3(comparisonValue25, comparisonValue26, 0.25f)));
                            float productValue62 = inverseLengthValue18 * multiplyAddValue3;
                            branchMergedValue13 = productValue62 * comparisonValue25;
                            branchMergedValue16 = productValue62 * comparisonValue26;
                            branchMergedValue17 = inverseLengthValue18 * 0.25f;
#endif
                        }
                        else
                        {
                            branchMergedValue13 = 0.0f;
                            branchMergedValue16 = 0.0f;
                            branchMergedValue17 = 1.0f;
                        }
                        branchMergedValue9 = branchMergedValue13;
                        branchMergedValue10 = branchMergedValue16;
                        branchMergedValue11 = branchMergedValue17;
                    }
                    branchMergedValue3 = branchMergedValue9;
                    branchMergedValue5 = branchMergedValue10;
                    branchMergedValue6 = branchMergedValue11;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue4 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                float multiplyAddValue5 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                float multiplyAddValue6 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue6 > 0.0f)
                {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                    uint unusedTextureMipCount519;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount519);
                    float productValue14 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue4;
                    float productValue15 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue5;
                    float scalarValue15 = frac(productValue14);
                    float scalarValue16 = frac(productValue15);
                    float comparisonValue4;
                    if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                    uint unusedTextureMipCount526;
                    uint2 vectorValue7 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount526);
                    float productValue32 = float(int(uint(int(float(int(vectorValue7.x)))))) * multiplyAddValue4;
                    float productValue33 = float(int(uint(int(float(int(vectorValue7.y)))))) * multiplyAddValue5;
                    float scalarValue23 = frac(productValue32);
                    float scalarValue24 = frac(productValue33);
                    float comparisonValue4;
                    if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                    uint unusedTextureMipCount629;
                    uint2 vectorValue11 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount629);
                    float productValue48 = float(int(uint(int(float(int(vectorValue11.x)))))) * multiplyAddValue4;
                    float productValue49 = float(int(uint(int(float(int(vectorValue11.y)))))) * multiplyAddValue5;
                    float scalarValue32 = frac(productValue48);
                    float scalarValue33 = frac(productValue49);
                    float comparisonValue5;
                    if (abs(scalarValue32 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                    uint unusedTextureMipCount636;
                    uint2 vectorValue15 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount636);
                    float productValue63 = float(int(uint(int(float(int(vectorValue15.x)))))) * multiplyAddValue4;
                    float productValue64 = float(int(uint(int(float(int(vectorValue15.y)))))) * multiplyAddValue5;
                    float scalarValue40 = frac(productValue63);
                    float scalarValue41 = frac(productValue64);
                    float comparisonValue5;
                    if (abs(scalarValue40 + (-0.5f)) < 0.0625f)
#endif
                    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                        comparisonValue4 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                        comparisonValue4 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                        comparisonValue5 = ((scalarValue32 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                        comparisonValue5 = ((scalarValue40 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                    }
                    else
                    {
#if RD_FEATURE_DITHERING == RD_OFF
                        comparisonValue4 = multiplyAddValue4;
#elif RD_FEATURE_DITHERING == RD_ON
                        comparisonValue5 = multiplyAddValue4;
#endif
                    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                    float comparisonValue9;
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                    float comparisonValue9;
                    if (abs(scalarValue24 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                    float comparisonValue10;
                    if (abs(scalarValue33 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                    float comparisonValue10;
                    if (abs(scalarValue41 + (-0.5f)) < 0.0625f)
#endif
                    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                        comparisonValue9 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                        comparisonValue9 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                        comparisonValue10 = ((scalarValue33 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                        comparisonValue10 = ((scalarValue41 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue5;
#endif
                    }
                    else
                    {
#if RD_FEATURE_DITHERING == RD_OFF
                        comparisonValue9 = multiplyAddValue5;
#elif RD_FEATURE_DITHERING == RD_ON
                        comparisonValue10 = multiplyAddValue5;
#endif
                    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue4, comparisonValue9));
                    float scalarValue17 = vectorValue4.x;
                    float scalarValue18 = vectorValue4.y;
                    float scalarValue19 = vectorValue4.z;
                    float scalarValue20 = vectorValue4.w;
                    float sumValue3 = frac(productValue14 + 0.5f);
                    float sumValue4 = frac(productValue15 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue4, comparisonValue9));
                    float scalarValue17 = vectorValue4.x;
                    float scalarValue18 = vectorValue4.y;
                    float scalarValue19 = vectorValue4.z;
                    float scalarValue20 = vectorValue4.w;
                    float sumValue12 = frac(productValue32 + 0.5f);
                    float sumValue13 = frac(productValue33 + 0.5f);
                    bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                    float4 vectorValue12 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue5, comparisonValue10));
                    float scalarValue34 = vectorValue12.x;
                    float scalarValue35 = vectorValue12.y;
                    float scalarValue36 = vectorValue12.z;
                    float scalarValue37 = vectorValue12.w;
                    float sumValue18 = frac(productValue48 + 0.5f);
                    float sumValue19 = frac(productValue49 + 0.5f);
                    bool conditionValue13 = sumValue19 > 0.5f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                    float4 vectorValue12 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue5, comparisonValue10));
                    float scalarValue34 = vectorValue12.x;
                    float scalarValue35 = vectorValue12.y;
                    float scalarValue36 = vectorValue12.z;
                    float scalarValue37 = vectorValue12.w;
                    float sumValue24 = frac(productValue63 + 0.5f);
                    float sumValue25 = frac(productValue64 + 0.5f);
                    bool conditionValue18 = sumValue25 > 0.5f;
#endif
                    float intermediateValue2[2];
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
                    intermediateValue2[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float clampedValue7 = intermediateValue2[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue8 = intermediateValue2[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue7 - clampedValue8;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float clampedValue9 = intermediateValue2[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue9, 0.25f), float3(sumValue5, clampedValue9, 0.25f)));
                    float productValue16 = inverseLengthValue2 * multiplyAddValue6;
                    branchMergedValue4 = productValue16 * sumValue5;
                    branchMergedValue7 = productValue16 * clampedValue9;
                    branchMergedValue8 = inverseLengthValue2 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
                    intermediateValue2[0u] = conditionValue8 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue8 ? scalarValue18 : scalarValue19;
                    float clampedValue14 = intermediateValue2[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue15 = intermediateValue2[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue14 = clampedValue14 - clampedValue15;
                    bool conditionValue9 = sumValue12 > 0.5f;
                    intermediateValue2[0u] = conditionValue9 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue18 : scalarValue17;
                    float clampedValue16 = intermediateValue2[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue9 = rsqrt(dot(float3(sumValue14, clampedValue16, 0.25f), float3(sumValue14, clampedValue16, 0.25f)));
                    float productValue34 = inverseLengthValue9 * multiplyAddValue6;
                    branchMergedValue4 = productValue34 * sumValue14;
                    branchMergedValue7 = productValue34 * clampedValue16;
                    branchMergedValue8 = inverseLengthValue9 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
                    intermediateValue2[0u] = conditionValue13 ? scalarValue34 : scalarValue37;
                    intermediateValue2[1u] = conditionValue13 ? scalarValue35 : scalarValue36;
                    float clampedValue21 = intermediateValue2[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue22 = intermediateValue2[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue20 = clampedValue21 - clampedValue22;
                    bool conditionValue14 = sumValue18 > 0.5f;
                    intermediateValue2[0u] = conditionValue14 ? scalarValue36 : scalarValue37;
                    intermediateValue2[1u] = conditionValue14 ? scalarValue35 : scalarValue34;
                    float clampedValue23 = intermediateValue2[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue15 = rsqrt(dot(float3(sumValue20, clampedValue23, 0.25f), float3(sumValue20, clampedValue23, 0.25f)));
                    float productValue50 = inverseLengthValue15 * multiplyAddValue6;
                    branchMergedValue4 = productValue50 * sumValue20;
                    branchMergedValue7 = productValue50 * clampedValue23;
                    branchMergedValue8 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
                    intermediateValue2[0u] = conditionValue18 ? scalarValue34 : scalarValue37;
                    intermediateValue2[1u] = conditionValue18 ? scalarValue35 : scalarValue36;
                    float clampedValue28 = intermediateValue2[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue29 = intermediateValue2[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue26 = clampedValue28 - clampedValue29;
                    bool conditionValue19 = sumValue24 > 0.5f;
                    intermediateValue2[0u] = conditionValue19 ? scalarValue36 : scalarValue37;
                    intermediateValue2[1u] = conditionValue19 ? scalarValue35 : scalarValue34;
                    float clampedValue30 = intermediateValue2[uint(int(clamp((sumValue25 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue25 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue19 = rsqrt(dot(float3(sumValue26, clampedValue30, 0.25f), float3(sumValue26, clampedValue30, 0.25f)));
                    float productValue65 = inverseLengthValue19 * multiplyAddValue6;
                    branchMergedValue4 = productValue65 * sumValue26;
                    branchMergedValue7 = productValue65 * clampedValue30;
                    branchMergedValue8 = inverseLengthValue19 * 0.25f;
#endif
                }
                else
                {
                    branchMergedValue4 = 0.0f;
                    branchMergedValue7 = 0.0f;
                    branchMergedValue8 = 1.0f;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue13 = branchMergedValue;
            intermediateValue14 = branchMergedValue1;
            intermediateValue15 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue2 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5), mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6)));
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue17 = (sampledTextureValue2.x * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue13 = (sampledTextureValue2.x * 2.0f) + (-1.0f);
            intermediateValue14 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
#endif
        }
#if (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
        float intermediateValue11;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
        float intermediateValue7;
#endif
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
        float intermediateValue11;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
        float intermediateValue7;
#endif
        if ((scalarValue5 & 1u) == 0u)
        {
#if RD_FEATURE_DITHERING == RD_OFF
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
#elif RD_FEATURE_DITHERING == RD_ON
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
#endif
            loadedBufferValue1 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 9u).x);
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue11 = loadedBufferValue8;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue7 = loadedBufferValue8;
#endif
        }
        else
        {
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, asfloat(rdLoad_pbrData(scalarValue * 16u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 2u).x)), mad(varyingTexCoord0.y, asfloat(rdLoad_pbrData((scalarValue * 16u) + 1u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 3u).x))));
#if RD_FEATURE_DITHERING == RD_OFF
            loadedBufferValue2 = sampledTextureValue3.y;
            loadedBufferValue = sampledTextureValue3.x;
#elif RD_FEATURE_DITHERING == RD_ON
            loadedBufferValue = sampledTextureValue3.y;
            loadedBufferValue2 = sampledTextureValue3.x;
#endif
            loadedBufferValue1 = sampledTextureValue3.z;
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue11 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue3.w : loadedBufferValue8;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue7 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue3.w : loadedBufferValue8;
#endif
        }
        float comparisonValue8 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue13 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue14 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue8, comparisonValue13, comparisonValue14), float3(comparisonValue8, comparisonValue13, comparisonValue14)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        intermediateValue7 = loadedBufferValue;
        intermediateValue8 = loadedBufferValue1;
        intermediateValue9 = loadedBufferValue2;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = mad(inverseLengthValue3 * comparisonValue8, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue13 = mad(inverseLengthValue3 * comparisonValue13, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue14 = mad(inverseLengthValue3 * comparisonValue14, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue5 * varyingTangent0.z));
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        intermediateValue3 = loadedBufferValue;
        intermediateValue4 = loadedBufferValue1;
        intermediateValue5 = loadedBufferValue2;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = mad(inverseLengthValue3 * comparisonValue8, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue14, inverseLengthValue10 * varyingTangent0.x));
        intermediateValue9 = mad(inverseLengthValue3 * comparisonValue13, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue14, inverseLengthValue10 * varyingTangent0.y));
        intermediateValue10 = mad(inverseLengthValue3 * comparisonValue14, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue14, inverseLengthValue10 * varyingTangent0.z));
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        multiplyAddValue = mad(inverseLengthValue3 * comparisonValue8, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue8 = mad(inverseLengthValue3 * comparisonValue13, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue9 = mad(inverseLengthValue3 * comparisonValue14, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue5 * varyingTangent0.z));
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = loadedBufferValue;
        intermediateValue13 = loadedBufferValue1;
        intermediateValue14 = loadedBufferValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        multiplyAddValue = mad(inverseLengthValue3 * comparisonValue8, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue14, inverseLengthValue10 * varyingTangent0.x));
        intermediateValue4 = mad(inverseLengthValue3 * comparisonValue13, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue14, inverseLengthValue10 * varyingTangent0.y));
        intermediateValue5 = mad(inverseLengthValue3 * comparisonValue14, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue14, inverseLengthValue10 * varyingTangent0.z));
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = loadedBufferValue;
        intermediateValue9 = loadedBufferValue1;
        intermediateValue10 = loadedBufferValue2;
#endif
    }
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue17 = inverseLengthValue6 * intermediateValue12;
    float productValue18 = inverseLengthValue6 * intermediateValue13;
    float productValue19 = inverseLengthValue6 * intermediateValue14;
    float quotientValue = 1.0f / ((abs(productValue18) + abs(productValue17)) + abs(productValue19));
    float productValue20 = quotientValue * productValue17;
    float productValue21 = quotientValue * productValue18;
    bool conditionValue5 = productValue19 < 0.0f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue35 = inverseLengthValue11 * intermediateValue8;
    float productValue36 = inverseLengthValue11 * intermediateValue9;
    float productValue37 = inverseLengthValue11 * intermediateValue10;
    float quotientValue1 = 1.0f / ((abs(productValue36) + abs(productValue35)) + abs(productValue37));
    float productValue38 = quotientValue1 * productValue35;
    float productValue39 = quotientValue1 * productValue36;
    bool conditionValue10 = productValue37 < 0.0f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    float inverseLengthValue16 = rsqrt(dot(float3(multiplyAddValue, intermediateValue8, intermediateValue9), float3(multiplyAddValue, intermediateValue8, intermediateValue9)));
    float productValue51 = inverseLengthValue16 * multiplyAddValue;
    float productValue52 = inverseLengthValue16 * intermediateValue8;
    float productValue53 = inverseLengthValue16 * intermediateValue9;
    float quotientValue4 = 1.0f / ((abs(productValue52) + abs(productValue51)) + abs(productValue53));
    float productValue54 = quotientValue4 * productValue51;
    float productValue55 = quotientValue4 * productValue52;
    bool conditionValue15 = productValue53 < 0.0f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    float inverseLengthValue20 = rsqrt(dot(float3(multiplyAddValue, intermediateValue4, intermediateValue5), float3(multiplyAddValue, intermediateValue4, intermediateValue5)));
    float productValue66 = inverseLengthValue20 * multiplyAddValue;
    float productValue67 = inverseLengthValue20 * intermediateValue4;
    float productValue68 = inverseLengthValue20 * intermediateValue5;
    float quotientValue5 = 1.0f / ((abs(productValue67) + abs(productValue66)) + abs(productValue68));
    float productValue69 = quotientValue5 * productValue66;
    float productValue70 = quotientValue5 * productValue67;
    bool conditionValue20 = productValue68 < 0.0f;
#endif
    float multiplyAddValue7 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue8 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
#if RD_FEATURE_DITHERING == RD_OFF
    float clampedValue;
#endif
    float clampedValue1;
    float clampedValue2;
#if RD_FEATURE_DITHERING == RD_ON
    float clampedValue3;
#endif
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue22 = varyingTexCoord1.x * varyingTexCoord1.x;
#if RD_FEATURE_DITHERING == RD_OFF
        clampedValue = clamp(productValue22, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue22 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue22, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue22 * productValue22) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue22, 0.0f, 1.0f);
#elif RD_FEATURE_DITHERING == RD_ON
        clampedValue1 = clamp(productValue22, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue22 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue22, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue22 * productValue22) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue22, 0.0f, 1.0f);
#endif
    }
    else
    {
#if RD_FEATURE_DITHERING == RD_OFF
        clampedValue = varyingTexCoord5.x;
        clampedValue1 = varyingTexCoord5.y;
        clampedValue2 = varyingTexCoord5.z;
#elif RD_FEATURE_DITHERING == RD_ON
        clampedValue1 = varyingTexCoord5.x;
        clampedValue2 = varyingTexCoord5.y;
        clampedValue3 = varyingTexCoord5.z;
#endif
    }
#if RD_FEATURE_DITHERING == RD_OFF
    float productValue23 = clampedValue * 0.16666667163372039794921875f;
#endif
    float productValue24 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue25 = clampedValue2 * 0.16666667163372039794921875f;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    float clampedValue10 = ceil(clamp(max(max(productValue23, productValue25), max(productValue24, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue23 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue24 / clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue25 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    float clampedValue10 = ceil(clamp(max(max(productValue23, productValue25), max(productValue24, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue23 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue24 / clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue25 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    float productValue56 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue24 = ceil(clamp(max(max(productValue24, productValue56), max(productValue25, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue24 / clampedValue24, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue25 / clampedValue24, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue56 / clampedValue24, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue24, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    float productValue56 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue24 = ceil(clamp(max(max(productValue24, productValue56), max(productValue25, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue24 / clampedValue24, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue25 / clampedValue24, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue56 / clampedValue24, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue24, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.w = uint(clamp(varyingTexCoord1.y, 0.0f, 1.0f) * 255.0f);
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF)
    fragmentColor1.x = productValue3;
    fragmentColor1.y = productValue4;
    fragmentColor1.z = productValue5;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue20 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue21))) : productValue20;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue20)) * ((productValue21 < 0.0f) ? (-1.0f) : 1.0f)) : productValue21;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON)
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue4.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue4.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue4.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue38 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue39))) : productValue38;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue38)) * ((productValue39 < 0.0f) ? (-1.0f) : 1.0f)) : productValue39;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF)
    fragmentColor1.x = productValue5;
    fragmentColor1.y = productValue6;
    fragmentColor1.z = productValue7;
    fragmentColor1.w = (intermediateValue14 > intermediateValue10) ? ((intermediateValue14 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue15 ? (((productValue54 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue55))) : productValue54;
    fragmentColor2.y = conditionValue15 ? ((1.0f - abs(productValue54)) * ((productValue55 < 0.0f) ? (-1.0f) : 1.0f)) : productValue55;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON)
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue4.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue4.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue4.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.w = (intermediateValue10 > intermediateValue6) ? ((intermediateValue10 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue20 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue20 ? ((1.0f - abs(productValue69)) * ((productValue70 < 0.0f) ? (-1.0f) : 1.0f)) : productValue70;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue7) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue8)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue7) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue8)) * 0.5f;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
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
