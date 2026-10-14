// ItemInHandPrepassTextured / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ItemInHandPrepassTextured/FragmentBindings.hlsli"

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
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = varyingColor0.xyz * workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector3.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.w = 1;
  workingVector2.w = workingVector1.w;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xy = varyingColor0.xy * workingVector0.yz;
  workingVector2.xy = workingVector0.yz * varyingColor0.xy + -workingVector0.yz;
  workingVector0.yz = workingVector0.ww * workingVector2.xy + workingVector0.yz;
  workingVector2.xy = varyingColor0.ww * workingVector0.yz;
  workingVector2.z = 1;
  workingVector1.z = workingVector0.w;
  workingVector0.xyz = workingVector0.xxx ? workingVector2.xyz : workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz * workingVector1.www;
#endif
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
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
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector1.x = dot(-workingVector1.xyz, workingVector2.xyz);
  workingVector1.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.x;
  workingVector1.y = 1 / workingVector1.y;
  workingVector1.x = saturate(workingVector1.x * workingVector1.y);
  workingVector1.y = workingVector1.x * -2 + 3;
  workingVector1.x = workingVector1.x * workingVector1.x;
  workingVector1.x = workingVector1.y * workingVector1.x;
  workingVector1.yz = varyingColor1.xy / varyingColor1.ww;
  workingVector1.yz = workingVector1.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.yz;
  workingVector1.yz = workingVector1.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.yz;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.yzyz;
#endif
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
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
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector1.w = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = 0.75 * workingVector1.z;
  workingVector1.y = workingVector1.y * 0.5 + workingVector1.z;
  workingVector1.y = frac(workingVector1.y);
  workingVector1.y = workingVector1.w * 0.25 + workingVector1.y;
  workingVector1.y = workingVector1.y * 64 + 0.5;
  workingVector1.y = 0.015625 * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.y >= workingVector1.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector0.z = (int)workingVector0.z | (int)workingVector0.w;
  if (workingVector0.z != 0) discard;
  workingVector0.zw = float2(-1,-1) + varyingColor0.xy;
  workingVector0.zw = RD_UNIFORM_COLOR_BASED.xx * workingVector0.zw + float2(1,1);
  workingVector0.xy = workingVector0.xy * workingVector0.zw;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.x = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.x != 0) {
    workingVector0.x = sampledResource1[varyingTexCoord4.x].val[16/4];
    workingVector0.y = sampledResource1[varyingTexCoord4.x].val[16/4+1];
    workingVector0.z = sampledResource1[varyingTexCoord4.x].val[16/4+2];
    workingVector0.w = sampledResource1[varyingTexCoord4.x].val[16/4+3];
    workingVector1.x = sampledResource1[varyingTexCoord4.x].val[32/4+1];
    workingVector1.y = sampledResource1[varyingTexCoord4.x].val[32/4+2];
    workingVector1.z = sampledResource1[varyingTexCoord4.x].val[32/4];
    workingVector1.w = sampledResource1[varyingTexCoord4.x].val[32/4+3];
    workingVector2.y = sampledResource1[varyingTexCoord4.x].val[48/4];
    workingVector2.z = sampledResource1[varyingTexCoord4.x].val[48/4+1];
    workingVector3.xy = (int2)workingVector1.zz & int2(4,1);
    workingVector3.xy = RD_COMPARISON_MASK((int2)workingVector3.xy == int2(4,1));
    if (workingVector3.x != 0) {
      workingVector3.xz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector3.xzw = materialTexture0.Sample(textureSampler0, workingVector3.xz).xyz;
      workingVector3.xzw = workingVector3.xzw * float3(2,2,2) + float3(-1,-1,-1);
    } else {
      workingVector2.w = sampledResource1[varyingTexCoord4.x].val[60/4];
      workingVector4.x = (int)workingVector1.z & 8;
      workingVector4.x = RD_COMPARISON_MASK((int)workingVector4.x == 8);
      if (workingVector4.x != 0) {
        workingVector4.x = workingVector2.w + -workingVector2.z;
        workingVector4.x = min(workingVector4.x, workingVector2.w);
        workingVector4.x = saturate(2 + -workingVector4.x);
        workingVector4.y = RD_COMPARISON_MASK(0 < workingVector4.x);
        if (workingVector4.y != 0) {
          workingVector4.yz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
          materialTexture0.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
          workingVector6.xyzw = materialTexture0.Gather(textureSampler0, workingVector6.xy).xyzw;
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
          workingVector4.xyzw = materialTexture0.SampleLevel(textureSampler0, workingVector0.xy, 0).xyzw;
          workingVector2.zw = RD_COMPARISON_MASK(workingVector4.yz == workingVector4.xy);
          workingVector0.w = workingVector2.w ? workingVector2.z : 0;
          if (workingVector0.w != 0) {
            workingVector0.w = saturate(2 + -workingVector0.z);
            workingVector2.z = RD_COMPARISON_MASK(0 < workingVector0.w);
            if (workingVector2.z != 0) {
              materialTexture0.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
              workingVector6.xyzw = materialTexture0.Gather(textureSampler0, workingVector2.zw).xyzw;
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
            materialTexture0.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
      workingVector0.x = sampledResource1[varyingTexCoord4.x].val[0/4];
      workingVector0.y = sampledResource1[varyingTexCoord4.x].val[0/4+1];
      workingVector0.z = sampledResource1[varyingTexCoord4.x].val[0/4+2];
      workingVector0.w = sampledResource1[varyingTexCoord4.x].val[0/4+3];
      workingVector0.xy = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
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
    workingVector0.xyz = varyingNormal0.xyz;
  }
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord5.xyz;
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
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector2.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.y = workingVector2.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.y = workingVector2.x * workingVector0.y;
  workingVector0.y = workingVector2.x * workingVector2.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector2.z = workingVector2.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector2.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
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
  workingVector0.x = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
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
    float intermediateValue7;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float intermediateValue6;
#endif
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
        intermediateValue7 = 1.0f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        intermediateValue6 = 1.0f;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue7 = scalarValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue6 = scalarValue4;
#endif
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue7 = (RD_UNIFORM_MAT_COLOR.x * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue8 = (RD_UNIFORM_MAT_COLOR.y * productValue4) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue9 = (RD_UNIFORM_MAT_COLOR.z * productValue5) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue10 = (((productValue7 * RD_UNIFORM_CHANGE_COLOR.x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * RD_UNIFORM_CHANGE_COLOR.y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * RD_UNIFORM_CHANGE_COLOR.z) - productValue9) * varyingColor0.w) + productValue9;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue33 = (RD_UNIFORM_MAT_COLOR.x * productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue34 = (RD_UNIFORM_MAT_COLOR.y * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue35 = productValue33 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue36 = productValue33 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue37 = productValue33 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue22 = ceil(productValue34);
    float productValue38 = (((productValue34 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue35) * scalarValue22) + productValue35;
    float productValue39 = (((productValue34 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue36) * scalarValue22) + productValue36;
    float productValue40 = (((productValue34 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue37) * scalarValue22) + productValue37;
#endif
    bool comparisonValue1;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue13 = floor(quotientValue1 * 0.25f);
        float productValue14 = floor(quotientValue1 * 0.5f);
        float scalarValue5 = floor(quotientValue1);
        comparisonValue1 = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue14 * productValue14) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue13 * productValue13) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue5 * scalarValue5) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue1 = false;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    if (((RD_UNIFORM_MAT_COLOR.w * intermediateValue7) < 0.5f) || comparisonValue1)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    if (((RD_UNIFORM_MAT_COLOR.w * intermediateValue6) < 0.5f) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
    float intermediateValue9;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if (scalarValue == 65535u)
    {
        intermediateValue9 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue12 = 1.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
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
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue6 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue6 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue6 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue5 = 0.0f;
                    branchMergedValue6 = 1.0f;
                }
                else
                {
                    float multiplyAddValue = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                    float multiplyAddValue1 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                    float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue, multiplyAddValue1), 0.0f);
                    float scalarValue7 = sampledTextureValue1.x;
                    float scalarValue8 = sampledTextureValue1.y;
                    float scalarValue9 = sampledTextureValue1.z;
                    float multiplyAddValue2 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue = multiplyAddValue2 > 0.0f;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            uint unusedTextureMipCount774;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount774);
                            float productValue15 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue;
                            float productValue16 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue1;
                            float scalarValue10 = frac(productValue15);
                            float scalarValue11 = frac(productValue16);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            uint unusedTextureMipCount769;
                            uint2 vectorValue5 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount769);
                            float productValue41 = float(int(uint(int(float(int(vectorValue5.x)))))) * multiplyAddValue;
                            float productValue42 = float(int(uint(int(float(int(vectorValue5.y)))))) * multiplyAddValue1;
                            float scalarValue23 = frac(productValue41);
                            float scalarValue24 = frac(productValue42);
#endif
                            float comparisonValue11;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                                comparisonValue11 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                                comparisonValue11 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#endif
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue;
                            }
                            float comparisonValue12;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            if (abs(scalarValue24 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                                comparisonValue12 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                                comparisonValue12 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                            }
                            else
                            {
                                comparisonValue12 = multiplyAddValue1;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue11, comparisonValue12));
                            float scalarValue12 = vectorValue1.x;
                            float scalarValue13 = vectorValue1.y;
                            float scalarValue14 = vectorValue1.z;
                            float scalarValue15 = vectorValue1.w;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            float sumValue = frac(productValue15 + 0.5f);
                            float sumValue1 = frac(productValue16 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            float sumValue9 = frac(productValue41 + 0.5f);
                            float sumValue10 = frac(productValue42 + 0.5f);
                            bool conditionValue6 = sumValue10 > 0.5f;
#endif
                            float intermediateValue1[2];
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            intermediateValue1[0u] = conditionValue1 ? scalarValue12 : scalarValue15;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue13 : scalarValue14;
                            float clampedValue4 = intermediateValue1[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue5 = intermediateValue1[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue4 - clampedValue5;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue14 : scalarValue15;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue13 : scalarValue12;
                            float clampedValue6 = intermediateValue1[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue1 = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                            float productValue17 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue12 = productValue17 * sumValue2;
                            branchMergedValue14 = productValue17 * clampedValue6;
                            branchMergedValue15 = inverseLengthValue1 * 0.25f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            intermediateValue1[0u] = conditionValue6 ? scalarValue12 : scalarValue15;
                            intermediateValue1[1u] = conditionValue6 ? scalarValue13 : scalarValue14;
                            float clampedValue11 = intermediateValue1[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue12 = intermediateValue1[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue11 = clampedValue11 - clampedValue12;
                            bool conditionValue7 = sumValue9 > 0.5f;
                            intermediateValue1[0u] = conditionValue7 ? scalarValue14 : scalarValue15;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue13 : scalarValue12;
                            float clampedValue13 = intermediateValue1[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue8 = rsqrt(dot(float3(sumValue11, clampedValue13, 0.25f), float3(sumValue11, clampedValue13, 0.25f)));
                            float productValue43 = inverseLengthValue8 * multiplyAddValue2;
                            branchMergedValue12 = productValue43 * sumValue11;
                            branchMergedValue14 = productValue43 * clampedValue13;
                            branchMergedValue15 = inverseLengthValue8 * 0.25f;
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
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                        uint unusedTextureMipCount764;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount764);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                        uint unusedTextureMipCount759;
                        uint2 vectorValue6 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount759);
#endif
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                            float productValue18 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue);
                            float productValue19 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue1);
                            float comparisonValue2 = (((productValue18 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue18 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue3 = (((productValue19 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue19 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue3;
                            float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue4, comparisonValue6, 0.25f), float3(comparisonValue4, comparisonValue6, 0.25f)));
                            float productValue20 = inverseLengthValue2 * multiplyAddValue2;
                            branchMergedValue13 = productValue20 * comparisonValue4;
                            branchMergedValue16 = productValue20 * comparisonValue6;
                            branchMergedValue17 = inverseLengthValue2 * 0.25f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                            float productValue44 = frac(float(int(uint(int(float(int(vectorValue6.x)))))) * multiplyAddValue);
                            float productValue45 = frac(float(int(uint(int(float(int(vectorValue6.y)))))) * multiplyAddValue1);
                            float comparisonValue13 = (((productValue44 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue44 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue14 = (((productValue45 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue45 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue15 = ((abs(comparisonValue13) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue13;
                            float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                            float inverseLengthValue9 = rsqrt(dot(float3(comparisonValue15, comparisonValue16, 0.25f), float3(comparisonValue15, comparisonValue16, 0.25f)));
                            float productValue46 = inverseLengthValue9 * multiplyAddValue2;
                            branchMergedValue13 = productValue46 * comparisonValue15;
                            branchMergedValue16 = productValue46 * comparisonValue16;
                            branchMergedValue17 = inverseLengthValue9 * 0.25f;
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
                float multiplyAddValue3 = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                float multiplyAddValue4 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                float multiplyAddValue5 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue5 > 0.0f)
                {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                    uint unusedTextureMipCount703;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount703);
                    float productValue21 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue3;
                    float productValue22 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue4;
                    float scalarValue16 = frac(productValue21);
                    float scalarValue17 = frac(productValue22);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                    uint unusedTextureMipCount698;
                    uint2 vectorValue7 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount698);
                    float productValue47 = float(int(uint(int(float(int(vectorValue7.x)))))) * multiplyAddValue3;
                    float productValue48 = float(int(uint(int(float(int(vectorValue7.y)))))) * multiplyAddValue4;
                    float scalarValue25 = frac(productValue47);
                    float scalarValue26 = frac(productValue48);
#endif
                    float comparisonValue5;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                    if (abs(scalarValue25 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                        comparisonValue5 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                        comparisonValue5 = ((scalarValue25 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#endif
                    }
                    else
                    {
                        comparisonValue5 = multiplyAddValue3;
                    }
                    float comparisonValue10;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                    if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                    if (abs(scalarValue26 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                        comparisonValue10 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                        comparisonValue10 = ((scalarValue26 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                    }
                    else
                    {
                        comparisonValue10 = multiplyAddValue4;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue5, comparisonValue10));
                    float scalarValue18 = vectorValue4.x;
                    float scalarValue19 = vectorValue4.y;
                    float scalarValue20 = vectorValue4.z;
                    float scalarValue21 = vectorValue4.w;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                    float sumValue3 = frac(productValue21 + 0.5f);
                    float sumValue4 = frac(productValue22 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                    float sumValue12 = frac(productValue47 + 0.5f);
                    float sumValue13 = frac(productValue48 + 0.5f);
                    bool conditionValue8 = sumValue13 > 0.5f;
#endif
                    float intermediateValue2[2];
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
                    intermediateValue2[0u] = conditionValue3 ? scalarValue18 : scalarValue21;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue19 : scalarValue20;
                    float clampedValue7 = intermediateValue2[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue8 = intermediateValue2[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue7 - clampedValue8;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue20 : scalarValue21;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue19 : scalarValue18;
                    float clampedValue9 = intermediateValue2[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue3 = rsqrt(dot(float3(sumValue5, clampedValue9, 0.25f), float3(sumValue5, clampedValue9, 0.25f)));
                    float productValue23 = inverseLengthValue3 * multiplyAddValue5;
                    branchMergedValue4 = productValue23 * sumValue5;
                    branchMergedValue7 = productValue23 * clampedValue9;
                    branchMergedValue8 = inverseLengthValue3 * 0.25f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
                    intermediateValue2[0u] = conditionValue8 ? scalarValue18 : scalarValue21;
                    intermediateValue2[1u] = conditionValue8 ? scalarValue19 : scalarValue20;
                    float clampedValue14 = intermediateValue2[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue15 = intermediateValue2[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue14 = clampedValue14 - clampedValue15;
                    bool conditionValue9 = sumValue12 > 0.5f;
                    intermediateValue2[0u] = conditionValue9 ? scalarValue20 : scalarValue21;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue19 : scalarValue18;
                    float clampedValue16 = intermediateValue2[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue10 = rsqrt(dot(float3(sumValue14, clampedValue16, 0.25f), float3(sumValue14, clampedValue16, 0.25f)));
                    float productValue49 = inverseLengthValue10 * multiplyAddValue5;
                    branchMergedValue4 = productValue49 * sumValue14;
                    branchMergedValue7 = productValue49 * clampedValue16;
                    branchMergedValue8 = inverseLengthValue10 * 0.25f;
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
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
        }
        else
        {
            float4 sampledTextureValue2 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5), mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6)));
            intermediateValue19 = (sampledTextureValue2.x * 2.0f) + (-1.0f);
            intermediateValue20 = (sampledTextureValue2.y * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue2.z * 2.0f) + (-1.0f);
        }
        float intermediateValue10;
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
        if ((scalarValue6 & 1u) == 0u)
        {
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
            loadedBufferValue1 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 9u).x);
            intermediateValue10 = loadedBufferValue8;
        }
        else
        {
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(varyingTexCoord0.x, asfloat(rdLoad_pbrData(scalarValue * 16u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 2u).x)), mad(varyingTexCoord0.y, asfloat(rdLoad_pbrData((scalarValue * 16u) + 1u).x), asfloat(rdLoad_pbrData((scalarValue * 16u) + 3u).x))));
            loadedBufferValue = sampledTextureValue3.y;
            loadedBufferValue2 = sampledTextureValue3.x;
            loadedBufferValue1 = sampledTextureValue3.z;
            intermediateValue10 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue3.w : loadedBufferValue8;
        }
        float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue8 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue9 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue7, comparisonValue8, comparisonValue9), float3(comparisonValue7, comparisonValue8, comparisonValue9)));
        float inverseLengthValue5 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue6 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        intermediateValue9 = intermediateValue10;
        intermediateValue11 = loadedBufferValue;
        intermediateValue12 = loadedBufferValue1;
        intermediateValue13 = loadedBufferValue2;
        intermediateValue14 = mad(inverseLengthValue4 * comparisonValue7, intermediateValue21, mad(inverseLengthValue5 * varyingBitangent0.x, intermediateValue20, inverseLengthValue6 * varyingTangent0.x));
        intermediateValue15 = mad(inverseLengthValue4 * comparisonValue8, intermediateValue21, mad(inverseLengthValue5 * varyingBitangent0.y, intermediateValue20, inverseLengthValue6 * varyingTangent0.y));
        intermediateValue16 = mad(inverseLengthValue4 * comparisonValue9, intermediateValue21, mad(inverseLengthValue5 * varyingBitangent0.z, intermediateValue20, inverseLengthValue6 * varyingTangent0.z));
    }
    float sumValue6 = varyingTexCoord5.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord5.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord5.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue7 = rsqrt(dot(float3(intermediateValue14, intermediateValue15, intermediateValue16), float3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue24 = inverseLengthValue7 * intermediateValue14;
    float productValue25 = inverseLengthValue7 * intermediateValue15;
    float productValue26 = inverseLengthValue7 * intermediateValue16;
    float quotientValue2 = 1.0f / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue2 * productValue24;
    float productValue28 = quotientValue2 * productValue25;
    bool conditionValue5 = productValue26 < 0.0f;
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue7 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue29 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue29, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue29 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue29, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue29 * productValue29) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue29, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue30 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue31 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue32 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue10 = ceil(clamp(max(max(productValue30, productValue32), max(productValue31, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue11, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue30 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue31 / clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue32 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40;
#endif
    fragmentColor1.w = (intermediateValue13 > intermediateValue9) ? ((intermediateValue13 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue9 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue27)) * ((productValue28 < 0.0f) ? (-1.0f) : 1.0f)) : productValue28;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue6) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue7)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue6) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue7)) * 0.5f;
    discardIfRequested();
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
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
#endif
