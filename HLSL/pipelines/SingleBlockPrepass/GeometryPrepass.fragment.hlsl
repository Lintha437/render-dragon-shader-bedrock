// SingleBlockPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/SingleBlockPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  nointerpolation int varyingFrontFacing0 : FRONTFACING0,
  nointerpolation int varyingTexCoord4 : TEXCOORD4,
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
#if RD_FEATURE_SEASONS == RD_OFF
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.yzw = varyingColor0.xyz * workingVector0.xyz;
  workingVector2.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector0.xyz;
  fragmentColor1.xyz = workingVector1.xxx ? workingVector0.xyz : workingVector1.yzw;
#elif RD_FEATURE_SEASONS == RD_ON
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector1.xyz = materialTexture1.Sample(textureSampler1, varyingColor0.xy).xyz;
  workingVector1.xyz = workingVector1.xyz * float3(2,2,2) + float3(-1,-1,-1);
  workingVector1.xyz = varyingColor0.zzz * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  fragmentColor1.xyz = varyingColor0.www * workingVector0.xyz;
#endif
  workingVector0.x = RD_COMPARISON_MASK((int)varyingTexCoord4.x != 0x0000ffff);
  if (workingVector0.x != 0) {
    workingVector0.x = sampledResource2[varyingTexCoord4.x].val[16/4];
    workingVector0.y = sampledResource2[varyingTexCoord4.x].val[16/4+1];
    workingVector0.z = sampledResource2[varyingTexCoord4.x].val[16/4+2];
    workingVector0.w = sampledResource2[varyingTexCoord4.x].val[16/4+3];
    workingVector1.x = sampledResource2[varyingTexCoord4.x].val[32/4+1];
    workingVector1.y = sampledResource2[varyingTexCoord4.x].val[32/4+2];
    workingVector1.z = sampledResource2[varyingTexCoord4.x].val[32/4];
    workingVector1.w = sampledResource2[varyingTexCoord4.x].val[32/4+3];
    workingVector2.y = sampledResource2[varyingTexCoord4.x].val[48/4];
    workingVector2.z = sampledResource2[varyingTexCoord4.x].val[48/4+1];
    workingVector3.xy = (int2)workingVector1.zz & int2(4,1);
    workingVector3.xy = RD_COMPARISON_MASK((int2)workingVector3.xy == int2(4,1));
    if (workingVector3.x != 0) {
      workingVector3.xz = varyingTexCoord0.xy * workingVector0.xy + workingVector0.zw;
      workingVector3.xzw = materialTexture0.Sample(textureSampler0, workingVector3.xz).xyz;
      workingVector3.xzw = workingVector3.xzw * float3(2,2,2) + float3(-1,-1,-1);
    } else {
      workingVector2.w = sampledResource2[varyingTexCoord4.x].val[60/4];
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
      workingVector0.x = sampledResource2[varyingTexCoord4.x].val[0/4];
      workingVector0.y = sampledResource2[varyingTexCoord4.x].val[0/4+1];
      workingVector0.z = sampledResource2[varyingTexCoord4.x].val[0/4+2];
      workingVector0.w = sampledResource2[varyingTexCoord4.x].val[0/4+3];
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
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
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
#elif RD_FEATURE_SEASONS == RD_ON
    float4 sampledTextureValue4 = seasonsTextureTexture.Sample(seasonsTextureSampler, float2(varyingColor0.x, varyingColor0.y));
    float intermediateValue3;
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
#if RD_FEATURE_SEASONS == RD_OFF
        intermediateValue7 = 0.0f;
        intermediateValue8 = 1.0f;
        intermediateValue9 = 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
        intermediateValue3 = 0.0f;
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
                    float multiplyAddValue = mad(varyingTexCoord0.x, loadedBufferValue3, loadedBufferValue5);
                    float multiplyAddValue1 = mad(varyingTexCoord0.y, loadedBufferValue4, loadedBufferValue6);
                    float4 sampledTextureValue1 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue, multiplyAddValue1), 0.0f);
                    float scalarValue6 = sampledTextureValue1.x;
                    float scalarValue7 = sampledTextureValue1.y;
                    float scalarValue8 = sampledTextureValue1.z;
                    float multiplyAddValue2 = clamp(mad(min(loadedBufferValue10 - loadedBufferValue9, loadedBufferValue10), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue = multiplyAddValue2 > 0.0f;
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
#if RD_FEATURE_SEASONS == RD_OFF
                            uint unusedTextureMipCount585;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount585);
                            float productValue6 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue;
                            float productValue7 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue1;
                            float scalarValue9 = frac(productValue6);
                            float scalarValue10 = frac(productValue7);
#elif RD_FEATURE_SEASONS == RD_ON
                            uint unusedTextureMipCount590;
                            uint2 vectorValue5 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount590);
                            float productValue24 = float(int(uint(int(float(int(vectorValue5.x)))))) * multiplyAddValue;
                            float productValue25 = float(int(uint(int(float(int(vectorValue5.y)))))) * multiplyAddValue1;
                            float scalarValue21 = frac(productValue24);
                            float scalarValue22 = frac(productValue25);
#endif
                            float comparisonValue10;
#if RD_FEATURE_SEASONS == RD_OFF
                            if (abs(scalarValue9 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                            if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                comparisonValue10 = ((scalarValue9 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#elif RD_FEATURE_SEASONS == RD_ON
                                comparisonValue10 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
#endif
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue;
                            }
                            float comparisonValue11;
#if RD_FEATURE_SEASONS == RD_OFF
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                            if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#endif
                            {
#if RD_FEATURE_SEASONS == RD_OFF
                                comparisonValue11 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#elif RD_FEATURE_SEASONS == RD_ON
                                comparisonValue11 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
#endif
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue1;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue10, comparisonValue11));
                            float scalarValue11 = vectorValue1.x;
                            float scalarValue12 = vectorValue1.y;
                            float scalarValue13 = vectorValue1.z;
                            float scalarValue14 = vectorValue1.w;
#if RD_FEATURE_SEASONS == RD_OFF
                            float sumValue = frac(productValue6 + 0.5f);
                            float sumValue1 = frac(productValue7 + 0.5f);
                            bool conditionValue1 = sumValue1 > 0.5f;
#elif RD_FEATURE_SEASONS == RD_ON
                            float sumValue9 = frac(productValue24 + 0.5f);
                            float sumValue10 = frac(productValue25 + 0.5f);
                            bool conditionValue6 = sumValue10 > 0.5f;
#endif
                            float intermediateValue1[2];
#if RD_FEATURE_SEASONS == RD_OFF
                            intermediateValue1[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float clampedValue3 = intermediateValue1[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue4 = intermediateValue1[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue3 - clampedValue4;
                            bool conditionValue2 = sumValue > 0.5f;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float clampedValue5 = intermediateValue1[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                            float productValue8 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue8 * sumValue2;
                            branchMergedValue14 = productValue8 * clampedValue5;
                            branchMergedValue15 = inverseLengthValue * 0.25f;
#elif RD_FEATURE_SEASONS == RD_ON
                            intermediateValue1[0u] = conditionValue6 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue6 ? scalarValue12 : scalarValue13;
                            float clampedValue10 = intermediateValue1[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue11 = intermediateValue1[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue11 = clampedValue10 - clampedValue11;
                            bool conditionValue7 = sumValue9 > 0.5f;
                            intermediateValue1[0u] = conditionValue7 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue12 : scalarValue11;
                            float clampedValue12 = intermediateValue1[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue7 = rsqrt(dot(float3(sumValue11, clampedValue12, 0.25f), float3(sumValue11, clampedValue12, 0.25f)));
                            float productValue26 = inverseLengthValue7 * multiplyAddValue2;
                            branchMergedValue12 = productValue26 * sumValue11;
                            branchMergedValue14 = productValue26 * clampedValue12;
                            branchMergedValue15 = inverseLengthValue7 * 0.25f;
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
#if RD_FEATURE_SEASONS == RD_OFF
                        uint unusedTextureMipCount575;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount575);
#elif RD_FEATURE_SEASONS == RD_ON
                        uint unusedTextureMipCount580;
                        uint2 vectorValue6 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount580);
#endif
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
#if RD_FEATURE_SEASONS == RD_OFF
                            float productValue9 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue);
                            float productValue10 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue1);
                            float comparisonValue1 = (((productValue9 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue9 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue2 = (((productValue10 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue10 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                            float comparisonValue5 = ((abs(comparisonValue2) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue2;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue5, 0.25f), float3(comparisonValue3, comparisonValue5, 0.25f)));
                            float productValue11 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue11 * comparisonValue3;
                            branchMergedValue16 = productValue11 * comparisonValue5;
                            branchMergedValue17 = inverseLengthValue1 * 0.25f;
#elif RD_FEATURE_SEASONS == RD_ON
                            float productValue27 = frac(float(int(uint(int(float(int(vectorValue6.x)))))) * multiplyAddValue);
                            float productValue28 = frac(float(int(uint(int(float(int(vectorValue6.y)))))) * multiplyAddValue1);
                            float comparisonValue12 = (((productValue27 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue27 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue1.w * 2.0f) + (-1.0f)));
                            float comparisonValue13 = (((productValue28 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue28 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f)));
                            float comparisonValue14 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                            float comparisonValue15 = ((abs(comparisonValue13) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue13;
                            float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue14, comparisonValue15, 0.25f), float3(comparisonValue14, comparisonValue15, 0.25f)));
                            float productValue29 = inverseLengthValue8 * multiplyAddValue2;
                            branchMergedValue13 = productValue29 * comparisonValue14;
                            branchMergedValue16 = productValue29 * comparisonValue15;
                            branchMergedValue17 = inverseLengthValue8 * 0.25f;
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
#if RD_FEATURE_SEASONS == RD_OFF
                    uint unusedTextureMipCount513;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount513);
                    float productValue12 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue3;
                    float productValue13 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue4;
                    float scalarValue15 = frac(productValue12);
                    float scalarValue16 = frac(productValue13);
#elif RD_FEATURE_SEASONS == RD_ON
                    uint unusedTextureMipCount518;
                    uint2 vectorValue7 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount518);
                    float productValue30 = float(int(uint(int(float(int(vectorValue7.x)))))) * multiplyAddValue3;
                    float productValue31 = float(int(uint(int(float(int(vectorValue7.y)))))) * multiplyAddValue4;
                    float scalarValue23 = frac(productValue30);
                    float scalarValue24 = frac(productValue31);
#endif
                    float comparisonValue4;
#if RD_FEATURE_SEASONS == RD_OFF
                    if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                    if (abs(scalarValue23 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        comparisonValue4 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#elif RD_FEATURE_SEASONS == RD_ON
                        comparisonValue4 = ((scalarValue23 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
#endif
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue3;
                    }
                    float comparisonValue9;
#if RD_FEATURE_SEASONS == RD_OFF
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif RD_FEATURE_SEASONS == RD_ON
                    if (abs(scalarValue24 + (-0.5f)) < 0.0625f)
#endif
                    {
#if RD_FEATURE_SEASONS == RD_OFF
                        comparisonValue9 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#elif RD_FEATURE_SEASONS == RD_ON
                        comparisonValue9 = ((scalarValue24 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
#endif
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue4;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue4, comparisonValue9));
                    float scalarValue17 = vectorValue4.x;
                    float scalarValue18 = vectorValue4.y;
                    float scalarValue19 = vectorValue4.z;
                    float scalarValue20 = vectorValue4.w;
#if RD_FEATURE_SEASONS == RD_OFF
                    float sumValue3 = frac(productValue12 + 0.5f);
                    float sumValue4 = frac(productValue13 + 0.5f);
                    bool conditionValue3 = sumValue4 > 0.5f;
#elif RD_FEATURE_SEASONS == RD_ON
                    float sumValue12 = frac(productValue30 + 0.5f);
                    float sumValue13 = frac(productValue31 + 0.5f);
                    bool conditionValue8 = sumValue13 > 0.5f;
#endif
                    float intermediateValue2[2];
#if RD_FEATURE_SEASONS == RD_OFF
                    intermediateValue2[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float clampedValue6 = intermediateValue2[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue7 = intermediateValue2[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue5 = clampedValue6 - clampedValue7;
                    bool conditionValue4 = sumValue3 > 0.5f;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float clampedValue8 = intermediateValue2[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue8, 0.25f), float3(sumValue5, clampedValue8, 0.25f)));
                    float productValue14 = inverseLengthValue2 * multiplyAddValue5;
                    branchMergedValue4 = productValue14 * sumValue5;
                    branchMergedValue7 = productValue14 * clampedValue8;
                    branchMergedValue8 = inverseLengthValue2 * 0.25f;
#elif RD_FEATURE_SEASONS == RD_ON
                    intermediateValue2[0u] = conditionValue8 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue8 ? scalarValue18 : scalarValue19;
                    float clampedValue13 = intermediateValue2[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                    float clampedValue14 = intermediateValue2[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float sumValue14 = clampedValue13 - clampedValue14;
                    bool conditionValue9 = sumValue12 > 0.5f;
                    intermediateValue2[0u] = conditionValue9 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue18 : scalarValue17;
                    float clampedValue15 = intermediateValue2[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue2[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                    float inverseLengthValue9 = rsqrt(dot(float3(sumValue14, clampedValue15, 0.25f), float3(sumValue14, clampedValue15, 0.25f)));
                    float productValue32 = inverseLengthValue9 * multiplyAddValue5;
                    branchMergedValue4 = productValue32 * sumValue14;
                    branchMergedValue7 = productValue32 * clampedValue15;
                    branchMergedValue8 = inverseLengthValue9 * 0.25f;
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
        float loadedBufferValue;
        float loadedBufferValue1;
        float loadedBufferValue2;
#if RD_FEATURE_SEASONS == RD_OFF
        float intermediateValue11;
#elif RD_FEATURE_SEASONS == RD_ON
        float intermediateValue7;
#endif
        if ((scalarValue5 & 1u) == 0u)
        {
            loadedBufferValue2 = asfloat(rdLoad_pbrData((scalarValue * 16u) + 10u).x);
            loadedBufferValue = asfloat(rdLoad_pbrData((scalarValue * 16u) + 11u).x);
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
            loadedBufferValue2 = sampledTextureValue3.y;
            loadedBufferValue = sampledTextureValue3.x;
            loadedBufferValue1 = sampledTextureValue3.z;
#if RD_FEATURE_SEASONS == RD_OFF
            intermediateValue11 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue3.w : loadedBufferValue8;
#elif RD_FEATURE_SEASONS == RD_ON
            intermediateValue7 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue3.w : loadedBufferValue8;
#endif
        }
        float comparisonValue6 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue7 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue8 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, comparisonValue8), float3(comparisonValue6, comparisonValue7, comparisonValue8)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if RD_FEATURE_SEASONS == RD_OFF
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        intermediateValue7 = loadedBufferValue;
        intermediateValue8 = loadedBufferValue1;
        intermediateValue9 = loadedBufferValue2;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = mad(inverseLengthValue3 * comparisonValue6, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue13 = mad(inverseLengthValue3 * comparisonValue7, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue14 = mad(inverseLengthValue3 * comparisonValue8, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue5 * varyingTangent0.z));
#elif RD_FEATURE_SEASONS == RD_ON
        float inverseLengthValue10 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        intermediateValue3 = loadedBufferValue;
        intermediateValue4 = loadedBufferValue1;
        intermediateValue5 = loadedBufferValue2;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = mad(inverseLengthValue3 * comparisonValue6, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue14, inverseLengthValue10 * varyingTangent0.x));
        intermediateValue9 = mad(inverseLengthValue3 * comparisonValue7, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue14, inverseLengthValue10 * varyingTangent0.y));
        intermediateValue10 = mad(inverseLengthValue3 * comparisonValue8, intermediateValue15, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue14, inverseLengthValue10 * varyingTangent0.z));
#endif
    }
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if RD_FEATURE_SEASONS == RD_OFF
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue15 = inverseLengthValue6 * intermediateValue12;
    float productValue16 = inverseLengthValue6 * intermediateValue13;
    float productValue17 = inverseLengthValue6 * intermediateValue14;
    float quotientValue = 1.0f / ((abs(productValue16) + abs(productValue15)) + abs(productValue17));
    float productValue18 = quotientValue * productValue15;
    float productValue19 = quotientValue * productValue16;
    bool conditionValue5 = productValue17 < 0.0f;
#elif RD_FEATURE_SEASONS == RD_ON
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue8, intermediateValue9, intermediateValue10), float3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue33 = inverseLengthValue11 * intermediateValue8;
    float productValue34 = inverseLengthValue11 * intermediateValue9;
    float productValue35 = inverseLengthValue11 * intermediateValue10;
    float quotientValue1 = 1.0f / ((abs(productValue34) + abs(productValue33)) + abs(productValue35));
    float productValue36 = quotientValue1 * productValue33;
    float productValue37 = quotientValue1 * productValue34;
    bool conditionValue10 = productValue35 < 0.0f;
#endif
    float multiplyAddValue6 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue7 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue20 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue20, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue20 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue20, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue20 * productValue20) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue20, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue21 = clampedValue * 0.16666667163372039794921875f;
    float productValue22 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue23 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue9 = ceil(clamp(max(max(productValue21, productValue23), max(productValue22, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
#if RD_FEATURE_SEASONS == RD_OFF
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
#elif RD_FEATURE_SEASONS == RD_ON
    fragmentColor0.x = ((uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue21 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue22 / clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue23 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f);
#if RD_FEATURE_SEASONS == RD_OFF
    fragmentColor1.x = productValue3;
    fragmentColor1.y = productValue4;
    fragmentColor1.z = productValue5;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue18 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue19))) : productValue18;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue18)) * ((productValue19 < 0.0f) ? (-1.0f) : 1.0f)) : productValue19;
#elif RD_FEATURE_SEASONS == RD_ON
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue4.x * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue4.y * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue4.z * 2.0f) + (-1.0f)) * varyingColor0.z) + 1.0f);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue36 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue37))) : productValue36;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue36)) * ((productValue37 < 0.0f) ? (-1.0f) : 1.0f)) : productValue37;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue6) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue7)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue6) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue7)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
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
