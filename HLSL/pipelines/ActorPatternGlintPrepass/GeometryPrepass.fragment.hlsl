// ActorPatternGlintPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorPatternGlintPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingNormal0 : NORMAL0,
  float3 varyingTexCoord4 : TEXCOORD4,
  float3 varyingTangent0 : TANGENT0,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out uint4 fragmentColor0 : SV_TARGET0,
  out float4 fragmentColor1 : SV_TARGET1,
  out float4 fragmentColor2 : SV_TARGET2)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.yzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.yzw;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.yzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector1.w = 1 + -workingVector1.w;
  workingVector1.w = workingVector2.x * workingVector1.w;
  workingVector1.w = RD_COMPARISON_MASK(0 < workingVector1.w);
  workingVector1.w = workingVector1.w ? 1.000000 : 0;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.yzw + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  workingVector0.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.y = workingVector2.x + workingVector2.y;
  workingVector0.y = workingVector0.y + workingVector2.z;
  workingVector0.z = 1 + -workingVector2.w;
  workingVector0.y = workingVector0.y * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(0 < workingVector0.y);
  workingVector0.y = workingVector0.y ? 1.000000 : 0;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw + -workingVector2.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + workingVector2.xyzw;
  workingVector0.yzw = workingVector1.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.yz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector0.yz = RD_UNIFORM_MAT_COLOR.xy * workingVector0.yz;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector0.y = ceil(workingVector0.z);
  workingVector2.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector0.yyy * workingVector2.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.yz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector1.z = 1 + -workingVector1.w;
  workingVector0.w = workingVector1.z * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.yz = RD_UNIFORM_MAT_COLOR.xy * workingVector0.yz + -workingVector1.xy;
  workingVector0.yz = workingVector0.ww * workingVector0.yz + workingVector1.xy;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.yyy;
  workingVector0.y = ceil(workingVector0.z);
  workingVector2.xyz = workingVector0.zzz * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector0.yyy * workingVector2.xyz + workingVector1.xyz;
#endif
  workingVector1.x = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.yzw = workingVector0.yzw;
  workingVector2.xy = float2(-1,0);
  while (true) {
    workingVector2.z = RD_COMPARISON_MASK((int)workingVector2.y >= (int)workingVector1.x);
    if (workingVector2.z != 0) break;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+26].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+26].xy;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+27].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+27].xy;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
    workingVector2.zw = fragmentVectorConstants1[workingVector2.y+28].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.y+28].xy;
#endif
    workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector2.zw).xyzw;
#if RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+19].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+19].xyz + -workingVector1.yzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+20].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+20].xyz + -workingVector1.yzw;
#elif RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI
    workingVector2.z = fragmentVectorConstants1[workingVector2.y+21].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.y+21].xyz + -workingVector1.yzw;
#endif
    workingVector1.yzw = workingVector2.zzz * workingVector3.xyz + workingVector1.yzw;
    workingVector2.z = RD_COMPARISON_MASK(0.5 < workingVector2.z);
    workingVector2.z = workingVector2.z ? workingVector2.x : 0;
    workingVector2.x = workingVector2.z ? 0 : workingVector2.x;
    workingVector2.y = (int)workingVector2.y + 1;
  }
  workingVector0.y = (int)workingVector0.x & -2;
  workingVector0.x = workingVector2.x ? workingVector0.x : workingVector0.y;
  workingVector0.yzw = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.yzw = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.yzw + float3(1,1,1);
  workingVector2.xyz = workingVector1.yzw * workingVector0.yzw;
  workingVector0.yzw = -workingVector1.yzw * workingVector0.yzw + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.yzw + workingVector2.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  fragmentColor1.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyzw = (int4)workingVector0.xxxx & int4(1,4,8,16);
  workingVector1.xyzw = RD_COMPARISON_MASK((int4)workingVector1.wxyz == int4(16,1,4,8));
  if (workingVector1.y != 0) {
    workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).zyxw;
    workingVector0.x = (int)workingVector0.x & 2;
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 2);
    workingVector0.y = workingVector0.x ? workingVector2.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    workingVector0.x = workingVector2.z;
  } else {
    workingVector0.x = RD_UNIFORM_METALNESS_UNIFORM.x;
    workingVector2.y = RD_UNIFORM_EMISSIVE_UNIFORM.x;
    workingVector2.x = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
    workingVector0.y = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
  }
  workingVector0.z = (int)workingVector1.w | (int)workingVector1.z;
  workingVector0.z = (int)workingVector1.x | (int)workingVector0.z;
  if (workingVector0.z != 0) {
    if (workingVector1.z != 0) {
      workingVector3.xyz = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyz;
      workingVector3.xyz = workingVector3.xyz * float3(2,2,2) + float3(-1,-1,-1);
      workingVector1.x = -1;
    } else {
      if (workingVector1.w != 0) {
        materialTexture4.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
        workingVector0.zw = floatingPointResult.xy;
        workingVector4.xyzw = workingVector0.zzww;
        workingVector0.zw = varyingTexCoord0.xy * workingVector4.yw;
        workingVector0.zw = frac(workingVector0.zw);
        workingVector1.yz = float2(-0.5,-0.5) + workingVector0.zw;
        workingVector1.yz = RD_COMPARISON_MASK(abs(workingVector1.yz) < float2(0.0625,0.0625));
        workingVector0.zw = RD_COMPARISON_MASK(float2(0.5,0.5) < workingVector0.zw);
        workingVector0.zw = workingVector0.zw ? float2(3.81469727e-006,3.81469727e-006) : float2(-3.81469727e-006,-3.81469727e-006);
        workingVector0.zw = varyingTexCoord0.xy + workingVector0.zw;
        workingVector0.zw = workingVector1.yz ? workingVector0.zw : varyingTexCoord0.xy;
        workingVector5.xyzw = materialTexture4.Gather(textureSampler4, workingVector0.zw).xyzw;
        workingVector4.xyzw = varyingTexCoord0.xxyy * workingVector4.xyzw + float4(0.5,0.5,0.5,0.5);
        workingVector4.xyzw = frac(workingVector4.xyzw);
        workingVector6.xyzw = RD_COMPARISON_MASK(float4(0.5,0.5,0.5,0.5) < workingVector4.wwyy);
        workingVector5.xyzw = workingVector6.xyzw ? workingVector5.xyzy : workingVector5.wzwx;
        workingVector4.xyzw = float4(-0.0833333358,0.0833333358,-0.0833333358,0.0833333358) + workingVector4.xyzw;
        workingVector4.xyzw = saturate(workingVector4.xyzw + workingVector4.xyzw);
        workingVector4.xyzw = (int4)workingVector4.xyzw;
        workingVector0.z = dot(workingVector5.xy, icb[workingVector4.x+0].xy);
        workingVector0.w = dot(workingVector5.xy, icb[workingVector4.y+0].xy);
        workingVector6.x = workingVector0.z + -workingVector0.w;
        workingVector0.z = dot(workingVector5.zw, icb[workingVector4.z+0].xy);
        workingVector0.w = dot(workingVector5.zw, icb[workingVector4.w+0].xy);
        workingVector6.y = workingVector0.z + -workingVector0.w;
        workingVector6.z = 0.25;
        workingVector0.z = dot(workingVector6.xyz, workingVector6.xyz);
        workingVector0.z = rsqrt(workingVector0.z);
        workingVector3.xyz = workingVector6.xyz * workingVector0.zzz;
        workingVector1.x = -1;
      } else {
        if (workingVector1.x != 0) {
          materialTexture4.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector0.zw = floatingPointResult.xy;
          workingVector4.xyzw = materialTexture4.SampleLevel(textureSampler4, varyingTexCoord0.xy, 0).xyzw;
          workingVector0.zw = varyingTexCoord0.xy * workingVector0.zw;
          workingVector0.zw = frac(workingVector0.zw);
          workingVector1.yz = RD_COMPARISON_MASK(workingVector0.zw >= float2(0.916666687,0.916666687));
          workingVector1.yz = workingVector1.yz ? float2(1,1) : 0;
          workingVector4.xyzw = workingVector4.ywzx * float4(2,2,2,2) + float4(-1,-1,-1,-1);
          workingVector0.zw = RD_COMPARISON_MASK(float2(0.0833333358,0.0833333358) >= workingVector0.zw);
          workingVector0.zw = workingVector0.zw ? float2(1,1) : 0;
          workingVector0.zw = workingVector0.zw * -workingVector4.yw;
          workingVector0.zw = workingVector1.yz * workingVector4.xz + workingVector0.zw;
          workingVector1.yz = RD_COMPARISON_MASK(abs(workingVector0.zw) >= float2(0.00499999989,0.00499999989));
          workingVector1.yz = workingVector1.yz ? float2(1,1) : 0;
          workingVector4.xy = workingVector1.yz * workingVector0.zw;
          workingVector4.z = 0.25;
          workingVector0.z = dot(workingVector4.xyz, workingVector4.xyz);
          workingVector0.z = rsqrt(workingVector0.z);
          workingVector3.xyz = workingVector4.xyz * workingVector0.zzz;
        }
      }
    }
    workingVector1.xyz = workingVector1.xxx ? workingVector3.xyz : float3(0,0,1);
    workingVector0.z = dot(varyingTangent0.xyz, varyingTangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector3.xyz = varyingTangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingBitangent0.xyz, varyingBitangent0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector4.xyz = varyingBitangent0.xyz * workingVector0.zzz;
    workingVector0.z = dot(varyingNormal0.xyz, varyingNormal0.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector5.xyz = varyingNormal0.xyz * workingVector0.zzz;
    workingVector4.xyz = workingVector4.xyz * workingVector1.yyy;
    workingVector1.xyw = workingVector3.xyz * workingVector1.xxx + workingVector4.xyz;
    workingVector1.xyz = workingVector5.xyz * workingVector1.zzz + workingVector1.xyw;
    workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
    workingVector0.z = rsqrt(workingVector0.z);
    workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
  } else {
    workingVector1.xyz = varyingNormal0.xyz;
  }
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.y < workingVector0.x);
  workingVector0.x = workingVector0.x * 0.498039216 + 0.501960814;
  workingVector0.y = -workingVector0.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.z ? workingVector0.x : workingVector0.y;
  workingVector0.x = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.xy = float2(1,1) + -abs(workingVector0.yx);
  workingVector1.zw = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector1.zw = workingVector1.zw ? float2(1,1) : 0;
  workingVector1.zw = workingVector1.zw * float2(2,2) + float2(-1,-1);
  workingVector1.xy = workingVector1.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.xy : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector3.yyy;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector3.xxx + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector3.zzz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector1.xyz;
  workingVector0.zw = workingVector1.xy / workingVector1.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.xy + -workingVector0.zw;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  workingVector1.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
  workingVector0.y = workingVector1.x * 0.600000024 + 0.400000006;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.y = workingVector1.x * workingVector0.y;
  workingVector0.y = workingVector1.x * workingVector1.x;
  workingVector0.y = workingVector0.y * 0.600000024 + 0.400000006;
  workingVector1.z = workingVector1.x * workingVector0.y;
  workingVector0.yzw = min(float3(1,1,1), workingVector1.xyz);
  workingVector0.xyz = workingVector0.xxx ? workingVector0.yzw : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector0.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector0.xyz;
  workingVector0.w = 0.00392156886;
  workingVector1.xy = max(workingVector0.xy, workingVector0.zw);
  workingVector0.w = max(workingVector1.x, workingVector1.y);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
  workingVector1.w = 0.00392156886 * workingVector0.w;
  workingVector1.xyz = workingVector0.xyz / workingVector1.www;
  workingVector1.xyzw = saturate(workingVector1.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector1.xyzw;
  workingVector0.xyzw = (uint4)workingVector0.xyzw;
  fragmentColor0.yz = mad((int2)workingVector0.xz, int2(256,256), (int2)workingVector0.yw);
  workingVector0.x = 255 * RD_UNIFORM_BLOCK_LIGHT_COLOR.w;
  workingVector0.x = floor(workingVector0.x);
  workingVector0.x = (uint)workingVector0.x;
  workingVector0.xy = (int2)workingVector0.xx & int2(1,2);
  workingVector0.z = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.z = 255 * workingVector0.z;
  workingVector0.z = (uint)workingVector0.z;
  workingVector0.xy = workingVector0.xy ? float2(256,512) : float2(0,0);
  workingVector0.x = (int)workingVector0.x + (int)workingVector0.z;
  fragmentColor0.w = (int)workingVector0.y + (int)workingVector0.x;
  workingVector2.xy = saturate(workingVector2.xy);
  workingVector0.xy = float2(255,255) * workingVector2.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#include "../../include/Math.hlsli"
void executeFragmentStage()
{
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue7.x;
    float scalarValue8 = sampledTextureValue7.y;
    float scalarValue9 = sampledTextureValue7.z;
    float productValue32 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - sampledTextureValue7.w)) > 0.0f);
    float productValue33 = (productValue32 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue34 = (productValue32 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue35 = (productValue32 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue2 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue49 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue50 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * productValue49) + productValue;
    float productValue51 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * productValue49) + productValue1;
    float productValue52 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * productValue49) + productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue7.x;
    float scalarValue8 = sampledTextureValue7.y;
    float scalarValue9 = sampledTextureValue7.z;
    float scalarValue14 = sampledTextureValue7.w;
    float productValue58 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - scalarValue14)) > 0.0f);
    float productValue59 = (productValue58 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue60 = (productValue58 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue61 = (productValue58 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9;
    float productValue62 = (productValue58 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue14)) + scalarValue14;
    float productValue63 = (((productValue59 * RD_UNIFORM_CHANGE_COLOR.x) - productValue59) * productValue62) + productValue59;
    float productValue64 = (((productValue60 * RD_UNIFORM_CHANGE_COLOR.y) - productValue60) * productValue62) + productValue60;
    float productValue65 = (((productValue61 * RD_UNIFORM_CHANGE_COLOR.z) - productValue61) * productValue62) + productValue61;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue1 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue79 = RD_UNIFORM_CHANGE_COLOR.x * productValue;
    float productValue80 = RD_UNIFORM_CHANGE_COLOR.y * productValue;
    float productValue81 = RD_UNIFORM_CHANGE_COLOR.z * productValue;
    float scalarValue17 = ceil(productValue1);
    float productValue82 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue79) * scalarValue17) + productValue79;
    float productValue83 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue80) * scalarValue17) + productValue80;
    float productValue84 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue81) * scalarValue17) + productValue81;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue7 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue7.x;
    float scalarValue8 = sampledTextureValue7.y;
    float productValue98 = float((((scalarValue7 + scalarValue8) + sampledTextureValue7.z) * (1.0f - sampledTextureValue7.w)) > 0.0f);
    float productValue99 = (productValue98 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue100 = (productValue98 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue101 = productValue99 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue102 = productValue99 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue103 = productValue99 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue20 = ceil(productValue100);
    float productValue104 = (((productValue100 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue101) * scalarValue20) + productValue101;
    float productValue105 = (((productValue100 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue102) * scalarValue20) + productValue102;
    float productValue106 = (((productValue100 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue103) * scalarValue20) + productValue103;
#endif
    bool comparisonValue;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
#endif
    if (int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))) > int(0u))
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        uint intermediateValue5;
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue5 = 0u;
        intermediateValue6 = 1u;
        intermediateValue7 = productValue;
        intermediateValue8 = productValue1;
        intermediateValue9 = productValue2;
        float productValue3;
        float productValue4;
        float productValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        uint intermediateValue8;
        uint intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        intermediateValue8 = 0u;
        intermediateValue9 = 1u;
        intermediateValue10 = productValue33;
        intermediateValue11 = productValue34;
        intermediateValue12 = productValue35;
        float productValue4;
        float productValue5;
        float productValue6;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        uint intermediateValue5;
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue5 = 0u;
        intermediateValue6 = 1u;
        intermediateValue7 = productValue50;
        intermediateValue8 = productValue51;
        intermediateValue9 = productValue52;
        float productValue7;
        float productValue8;
        float productValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        uint intermediateValue9;
        uint intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float intermediateValue13;
        intermediateValue9 = 0u;
        intermediateValue10 = 1u;
        intermediateValue11 = productValue63;
        intermediateValue12 = productValue64;
        intermediateValue13 = productValue65;
        float productValue8;
        float productValue9;
        float productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        uint intermediateValue6;
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue6 = 0u;
        intermediateValue7 = 1u;
        intermediateValue8 = productValue82;
        intermediateValue9 = productValue83;
        intermediateValue10 = productValue84;
        float productValue8;
        float productValue9;
        float productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        uint intermediateValue8;
        uint intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        intermediateValue8 = 0u;
        intermediateValue9 = 1u;
        intermediateValue10 = productValue104;
        intermediateValue11 = productValue105;
        intermediateValue12 = productValue106;
        float productValue9;
        float productValue10;
        float productValue11;
#endif
        uint comparisonValue2;
        for (;;)
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            uint sumValue = intermediateValue5 + 26u;
            uint sumValue1 = intermediateValue5 + 19u;
            float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue].z * varyingTexCoord0.x) + fragmentConstants[sumValue].x, (fragmentConstants[sumValue].w * varyingTexCoord0.y) + fragmentConstants[sumValue].y));
            float productValue12 = sampledTextureValue1.w * fragmentConstants[sumValue1].w;
            productValue3 = (((sampledTextureValue1.x * fragmentConstants[sumValue1].x) - intermediateValue7) * productValue12) + intermediateValue7;
            productValue4 = (((sampledTextureValue1.y * fragmentConstants[sumValue1].y) - intermediateValue8) * productValue12) + intermediateValue8;
            productValue5 = (((sampledTextureValue1.z * fragmentConstants[sumValue1].z) - intermediateValue9) * productValue12) + intermediateValue9;
            comparisonValue2 = ((intermediateValue6 != 0u) && (productValue12 > 0.5f)) ? 0u : intermediateValue6;
            uint sumValue2 = intermediateValue5 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            uint sumValue9 = intermediateValue8 + 26u;
            uint sumValue10 = intermediateValue8 + 19u;
            float4 sampledTextureValue8 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue9].z * varyingTexCoord0.x) + fragmentConstants[sumValue9].x, (fragmentConstants[sumValue9].w * varyingTexCoord0.y) + fragmentConstants[sumValue9].y));
            float productValue36 = sampledTextureValue8.w * fragmentConstants[sumValue10].w;
            productValue4 = (((sampledTextureValue8.x * fragmentConstants[sumValue10].x) - intermediateValue10) * productValue36) + intermediateValue10;
            productValue5 = (((sampledTextureValue8.y * fragmentConstants[sumValue10].y) - intermediateValue11) * productValue36) + intermediateValue11;
            productValue6 = (((sampledTextureValue8.z * fragmentConstants[sumValue10].z) - intermediateValue12) * productValue36) + intermediateValue12;
            comparisonValue2 = ((intermediateValue9 != 0u) && (productValue36 > 0.5f)) ? 0u : intermediateValue9;
            uint sumValue11 = intermediateValue8 + 1u;
            if (int(sumValue11) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            uint sumValue15 = intermediateValue5 + 27u;
            uint sumValue16 = intermediateValue5 + 20u;
            float4 sampledTextureValue9 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue15].z * varyingTexCoord0.x) + fragmentConstants[sumValue15].x, (fragmentConstants[sumValue15].w * varyingTexCoord0.y) + fragmentConstants[sumValue15].y));
            float productValue53 = sampledTextureValue9.w * fragmentConstants[sumValue16].w;
            productValue7 = (((sampledTextureValue9.x * fragmentConstants[sumValue16].x) - intermediateValue7) * productValue53) + intermediateValue7;
            productValue8 = (((sampledTextureValue9.y * fragmentConstants[sumValue16].y) - intermediateValue8) * productValue53) + intermediateValue8;
            productValue9 = (((sampledTextureValue9.z * fragmentConstants[sumValue16].z) - intermediateValue9) * productValue53) + intermediateValue9;
            comparisonValue2 = ((intermediateValue6 != 0u) && (productValue53 > 0.5f)) ? 0u : intermediateValue6;
            uint sumValue2 = intermediateValue5 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            uint sumValue20 = intermediateValue9 + 27u;
            uint sumValue21 = intermediateValue9 + 20u;
            float4 sampledTextureValue10 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue20].z * varyingTexCoord0.x) + fragmentConstants[sumValue20].x, (fragmentConstants[sumValue20].w * varyingTexCoord0.y) + fragmentConstants[sumValue20].y));
            float productValue66 = sampledTextureValue10.w * fragmentConstants[sumValue21].w;
            productValue8 = (((sampledTextureValue10.x * fragmentConstants[sumValue21].x) - intermediateValue11) * productValue66) + intermediateValue11;
            productValue9 = (((sampledTextureValue10.y * fragmentConstants[sumValue21].y) - intermediateValue12) * productValue66) + intermediateValue12;
            productValue10 = (((sampledTextureValue10.z * fragmentConstants[sumValue21].z) - intermediateValue13) * productValue66) + intermediateValue13;
            comparisonValue2 = ((intermediateValue10 != 0u) && (productValue66 > 0.5f)) ? 0u : intermediateValue10;
            uint sumValue22 = intermediateValue9 + 1u;
            if (int(sumValue22) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            uint sumValue26 = intermediateValue6 + 28u;
            uint sumValue27 = intermediateValue6 + 21u;
            float4 sampledTextureValue11 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue26].z * varyingTexCoord0.x) + fragmentConstants[sumValue26].x, (fragmentConstants[sumValue26].w * varyingTexCoord0.y) + fragmentConstants[sumValue26].y));
            float productValue85 = sampledTextureValue11.w * fragmentConstants[sumValue27].w;
            productValue8 = (((sampledTextureValue11.x * fragmentConstants[sumValue27].x) - intermediateValue8) * productValue85) + intermediateValue8;
            productValue9 = (((sampledTextureValue11.y * fragmentConstants[sumValue27].y) - intermediateValue9) * productValue85) + intermediateValue9;
            productValue10 = (((sampledTextureValue11.z * fragmentConstants[sumValue27].z) - intermediateValue10) * productValue85) + intermediateValue10;
            comparisonValue2 = ((intermediateValue7 != 0u) && (productValue85 > 0.5f)) ? 0u : intermediateValue7;
            uint sumValue28 = intermediateValue6 + 1u;
            if (int(sumValue28) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            uint sumValue32 = intermediateValue8 + 28u;
            uint sumValue33 = intermediateValue8 + 21u;
            float4 sampledTextureValue12 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue32].z * varyingTexCoord0.x) + fragmentConstants[sumValue32].x, (fragmentConstants[sumValue32].w * varyingTexCoord0.y) + fragmentConstants[sumValue32].y));
            float productValue107 = sampledTextureValue12.w * fragmentConstants[sumValue33].w;
            productValue9 = (((sampledTextureValue12.x * fragmentConstants[sumValue33].x) - intermediateValue10) * productValue107) + intermediateValue10;
            productValue10 = (((sampledTextureValue12.y * fragmentConstants[sumValue33].y) - intermediateValue11) * productValue107) + intermediateValue11;
            productValue11 = (((sampledTextureValue12.z * fragmentConstants[sumValue33].z) - intermediateValue12) * productValue107) + intermediateValue12;
            comparisonValue2 = ((intermediateValue9 != 0u) && (productValue107 > 0.5f)) ? 0u : intermediateValue9;
            uint sumValue11 = intermediateValue8 + 1u;
            if (int(sumValue11) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
#endif
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue5 = sumValue2;
                intermediateValue6 = comparisonValue2;
                intermediateValue7 = productValue3;
                intermediateValue8 = productValue4;
                intermediateValue9 = productValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue8 = sumValue11;
                intermediateValue9 = comparisonValue2;
                intermediateValue10 = productValue4;
                intermediateValue11 = productValue5;
                intermediateValue12 = productValue6;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue5 = sumValue2;
                intermediateValue6 = comparisonValue2;
                intermediateValue7 = productValue7;
                intermediateValue8 = productValue8;
                intermediateValue9 = productValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue9 = sumValue22;
                intermediateValue10 = comparisonValue2;
                intermediateValue11 = productValue8;
                intermediateValue12 = productValue9;
                intermediateValue13 = productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue6 = sumValue28;
                intermediateValue7 = comparisonValue2;
                intermediateValue8 = productValue8;
                intermediateValue9 = productValue9;
                intermediateValue10 = productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue8 = sumValue11;
                intermediateValue9 = comparisonValue2;
                intermediateValue10 = productValue9;
                intermediateValue11 = productValue10;
                intermediateValue12 = productValue11;
#endif
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue2 = productValue3;
        intermediateValue3 = productValue4;
        intermediateValue4 = productValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue5 = productValue4;
        intermediateValue6 = productValue5;
        intermediateValue7 = productValue6;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue2 = productValue7;
        intermediateValue3 = productValue8;
        intermediateValue4 = productValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = productValue8;
        intermediateValue7 = productValue9;
        intermediateValue8 = productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue3 = productValue8;
        intermediateValue4 = productValue9;
        intermediateValue5 = productValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue5 = productValue9;
        intermediateValue6 = productValue10;
        intermediateValue7 = productValue11;
#endif
    }
    else
    {
        comparisonValue = true;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue2 = productValue;
        intermediateValue3 = productValue1;
        intermediateValue4 = productValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue5 = productValue33;
        intermediateValue6 = productValue34;
        intermediateValue7 = productValue35;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue2 = productValue50;
        intermediateValue3 = productValue51;
        intermediateValue4 = productValue52;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = productValue63;
        intermediateValue7 = productValue64;
        intermediateValue8 = productValue65;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue3 = productValue82;
        intermediateValue4 = productValue83;
        intermediateValue5 = productValue84;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue5 = productValue104;
        intermediateValue6 = productValue105;
        intermediateValue7 = productValue106;
#endif
    }
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue13 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue2;
    float productValue14 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue3;
    float productValue15 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue37 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue5;
    float productValue38 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue6;
    float productValue39 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue67 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue6;
    float productValue68 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue7;
    float productValue69 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue86 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f) * intermediateValue3;
    float productValue87 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f) * intermediateValue4;
    float productValue88 = ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f) * intermediateValue5;
#endif
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue3 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue16 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue17 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue18 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue3.z + sampledTextureValue2.z);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue10 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue11 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue10 = sampledTextureValue4.x;
        intermediateValue11 = sampledTextureValue4.y;
        intermediateValue12 = sampledTextureValue4.z;
        intermediateValue13 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float intermediateValue13;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
#endif
    float intermediateValue14;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue11 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue12 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue13 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue4.x;
        intermediateValue12 = sampledTextureValue4.y;
        intermediateValue13 = sampledTextureValue4.z;
        intermediateValue14 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
#endif
    float intermediateValue15;
    float intermediateValue16;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue13 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue15 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue16 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue13 = sampledTextureValue4.x;
        intermediateValue14 = sampledTextureValue4.y;
        intermediateValue15 = sampledTextureValue4.z;
        intermediateValue16 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue17;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue14 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue15 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue16 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue17 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    else
    {
        float4 sampledTextureValue4 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue14 = sampledTextureValue4.x;
        intermediateValue15 = sampledTextureValue4.y;
        intermediateValue16 = sampledTextureValue4.z;
        intermediateValue17 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue4.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    }
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue17;
#endif
    if ((comparisonValue1 & 28u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue14 = varyingNormal0.x;
        intermediateValue15 = varyingNormal0.y;
        intermediateValue16 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue17 = varyingNormal0.x;
        intermediateValue18 = varyingNormal0.y;
        intermediateValue19 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue18 = varyingNormal0.x;
        intermediateValue19 = varyingNormal0.y;
        intermediateValue20 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
#endif
        if ((comparisonValue1 & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((comparisonValue1 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((comparisonValue1 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount638;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount638);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount660;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount660);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount659;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount659);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount684;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount684);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount662;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount662);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount681;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount681);
#endif
                    float4 sampledTextureValue5 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue19 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue20 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue3 = (((productValue19 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue19 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue4 = (((productValue20 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue20 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue5 = ((abs(comparisonValue3) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue3;
                    float comparisonValue6 = ((abs(comparisonValue4) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue4;
                    float inverseLengthValue = rsqrt(dot(float3(comparisonValue5, comparisonValue6, 0.25f), float3(comparisonValue5, comparisonValue6, 0.25f)));
                    branchMergedValue3 = comparisonValue5 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue6 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue40 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue41 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue9 = (((productValue40 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue40 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue10 = (((productValue41 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue41 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue11 = ((abs(comparisonValue9) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue9;
                    float comparisonValue12 = ((abs(comparisonValue10) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue10;
                    float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue11, comparisonValue12, 0.25f), float3(comparisonValue11, comparisonValue12, 0.25f)));
                    branchMergedValue3 = comparisonValue11 * inverseLengthValue7;
                    branchMergedValue4 = comparisonValue12 * inverseLengthValue7;
                    branchMergedValue5 = inverseLengthValue7 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue54 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue55 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue13 = (((productValue54 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue54 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue14 = (((productValue55 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue55 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue15 = ((abs(comparisonValue13) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue13;
                    float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                    float inverseLengthValue12 = rsqrt(dot(float3(comparisonValue15, comparisonValue16, 0.25f), float3(comparisonValue15, comparisonValue16, 0.25f)));
                    branchMergedValue3 = comparisonValue15 * inverseLengthValue12;
                    branchMergedValue4 = comparisonValue16 * inverseLengthValue12;
                    branchMergedValue5 = inverseLengthValue12 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue70 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue71 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue17 = (((productValue70 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue70 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue18 = (((productValue71 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue71 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue19 = ((abs(comparisonValue17) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue17;
                    float comparisonValue20 = ((abs(comparisonValue18) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue18;
                    float inverseLengthValue14 = rsqrt(dot(float3(comparisonValue19, comparisonValue20, 0.25f), float3(comparisonValue19, comparisonValue20, 0.25f)));
                    branchMergedValue3 = comparisonValue19 * inverseLengthValue14;
                    branchMergedValue4 = comparisonValue20 * inverseLengthValue14;
                    branchMergedValue5 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue89 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue90 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue21 = (((productValue89 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue89 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue22 = (((productValue90 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue90 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue23 = ((abs(comparisonValue21) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue21;
                    float comparisonValue24 = ((abs(comparisonValue22) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue22;
                    float inverseLengthValue19 = rsqrt(dot(float3(comparisonValue23, comparisonValue24, 0.25f), float3(comparisonValue23, comparisonValue24, 0.25f)));
                    branchMergedValue3 = comparisonValue23 * inverseLengthValue19;
                    branchMergedValue4 = comparisonValue24 * inverseLengthValue19;
                    branchMergedValue5 = inverseLengthValue19 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue108 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue109 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue25 = (((productValue108 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.y * 2.0f) + (-1.0f))) - (((sampledTextureValue5.w * 2.0f) + (-1.0f)) * ((productValue108 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue26 = (((productValue109 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue5.z * 2.0f) + (-1.0f))) - (((productValue109 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue5.x * 2.0f) + (-1.0f)));
                    float comparisonValue27 = ((abs(comparisonValue25) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue25;
                    float comparisonValue28 = ((abs(comparisonValue26) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue26;
                    float inverseLengthValue24 = rsqrt(dot(float3(comparisonValue27, comparisonValue28, 0.25f), float3(comparisonValue27, comparisonValue28, 0.25f)));
                    branchMergedValue3 = comparisonValue27 * inverseLengthValue24;
                    branchMergedValue4 = comparisonValue28 * inverseLengthValue24;
                    branchMergedValue5 = inverseLengthValue24 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount579;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount579);
                float productValue21 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue22 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = frac(productValue21);
                float scalarValue2 = frac(productValue22);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount601;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount601);
                float productValue42 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue43 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue10 = frac(productValue42);
                float scalarValue11 = frac(productValue43);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount600;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount600);
                float productValue56 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue57 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue56);
                float scalarValue13 = frac(productValue57);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount625;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount625);
                float productValue72 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue73 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue15 = frac(productValue72);
                float scalarValue16 = frac(productValue73);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount603;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount603);
                float productValue91 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue92 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue18 = frac(productValue91);
                float scalarValue19 = frac(productValue92);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount622;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount622);
                float productValue110 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue111 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue21 = frac(productValue110);
                float scalarValue22 = frac(productValue111);
#endif
                float comparisonValue7;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue1 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue12 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue18 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue21 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue7 = ((scalarValue1 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue7 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue7 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue7 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue7 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue7 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue7 = varyingTexCoord0.x;
                }
                float comparisonValue8;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue2 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue13 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue22 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue8 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue8 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue8 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue8 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue8 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue8 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue8 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue7, comparisonValue8));
                float scalarValue3 = vectorValue2.x;
                float scalarValue4 = vectorValue2.y;
                float scalarValue5 = vectorValue2.z;
                float scalarValue6 = vectorValue2.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue3 = frac(productValue21 + 0.5f);
                float sumValue4 = frac(productValue22 + 0.5f);
                bool conditionValue = sumValue4 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue12 = frac(productValue42 + 0.5f);
                float sumValue13 = frac(productValue43 + 0.5f);
                bool conditionValue3 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue17 = frac(productValue56 + 0.5f);
                float sumValue18 = frac(productValue57 + 0.5f);
                bool conditionValue6 = sumValue18 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue23 = frac(productValue72 + 0.5f);
                float sumValue24 = frac(productValue73 + 0.5f);
                bool conditionValue8 = sumValue24 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue29 = frac(productValue91 + 0.5f);
                float sumValue30 = frac(productValue92 + 0.5f);
                bool conditionValue11 = sumValue30 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue34 = frac(productValue110 + 0.5f);
                float sumValue35 = frac(productValue111 + 0.5f);
                bool conditionValue14 = sumValue35 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float clampedValue3 = intermediateValue[uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue5 = clampedValue3 - clampedValue4;
                bool conditionValue1 = sumValue3 > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue1 = rsqrt(dot(float3(sumValue5, clampedValue5, 0.25f), float3(sumValue5, clampedValue5, 0.25f)));
                branchMergedValue = inverseLengthValue1 * sumValue5;
                branchMergedValue1 = inverseLengthValue1 * clampedValue5;
                branchMergedValue2 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue3 ? scalarValue4 : scalarValue5;
                float clampedValue7 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue7 - clampedValue8;
                bool conditionValue4 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue4 ? scalarValue4 : scalarValue3;
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue8 = rsqrt(dot(float3(sumValue14, clampedValue9, 0.25f), float3(sumValue14, clampedValue9, 0.25f)));
                branchMergedValue = inverseLengthValue8 * sumValue14;
                branchMergedValue1 = inverseLengthValue8 * clampedValue9;
                branchMergedValue2 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue6 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue6 ? scalarValue4 : scalarValue5;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue17 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue17 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue19 = clampedValue10 - clampedValue11;
                bool conditionValue7 = sumValue17 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue7 ? scalarValue4 : scalarValue3;
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue13 = rsqrt(dot(float3(sumValue19, clampedValue12, 0.25f), float3(sumValue19, clampedValue12, 0.25f)));
                branchMergedValue = inverseLengthValue13 * sumValue19;
                branchMergedValue1 = inverseLengthValue13 * clampedValue12;
                branchMergedValue2 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue8 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue8 ? scalarValue4 : scalarValue5;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue23 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue23 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue25 = clampedValue13 - clampedValue14;
                bool conditionValue9 = sumValue23 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue9 ? scalarValue4 : scalarValue3;
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue15 = rsqrt(dot(float3(sumValue25, clampedValue15, 0.25f), float3(sumValue25, clampedValue15, 0.25f)));
                branchMergedValue = inverseLengthValue15 * sumValue25;
                branchMergedValue1 = inverseLengthValue15 * clampedValue15;
                branchMergedValue2 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue11 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue11 ? scalarValue4 : scalarValue5;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue29 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue29 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue31 = clampedValue16 - clampedValue17;
                bool conditionValue12 = sumValue29 > 0.5f;
                intermediateValue[0u] = conditionValue12 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue12 ? scalarValue4 : scalarValue3;
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue30 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue30 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue20 = rsqrt(dot(float3(sumValue31, clampedValue18, 0.25f), float3(sumValue31, clampedValue18, 0.25f)));
                branchMergedValue = inverseLengthValue20 * sumValue31;
                branchMergedValue1 = inverseLengthValue20 * clampedValue18;
                branchMergedValue2 = inverseLengthValue20 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue14 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue14 ? scalarValue4 : scalarValue5;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue34 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue34 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue36 = clampedValue19 - clampedValue20;
                bool conditionValue15 = sumValue34 > 0.5f;
                intermediateValue[0u] = conditionValue15 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue15 ? scalarValue4 : scalarValue3;
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue35 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue35 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue25 = rsqrt(dot(float3(sumValue36, clampedValue21, 0.25f), float3(sumValue36, clampedValue21, 0.25f)));
                branchMergedValue = inverseLengthValue25 * sumValue36;
                branchMergedValue1 = inverseLengthValue25 * clampedValue21;
                branchMergedValue2 = inverseLengthValue25 * 0.25f;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            intermediateValue24 = branchMergedValue;
            intermediateValue25 = branchMergedValue1;
            intermediateValue26 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue25 = branchMergedValue;
            intermediateValue26 = branchMergedValue1;
            intermediateValue27 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue6 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue21 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue22 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            intermediateValue24 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue25 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue26 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue25 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue26 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue27 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue22 = (sampledTextureValue6.x * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue6.y * 2.0f) + (-1.0f);
            intermediateValue24 = (sampledTextureValue6.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue2 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue4 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        float multiplyAddValue = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue22, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue22, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue23, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue22, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue14 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue15 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue16 = inverseLengthValue5 * multiplyAddValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        float inverseLengthValue9 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        float multiplyAddValue5 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue26, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue25, inverseLengthValue9 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue26, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue25, inverseLengthValue9 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue26, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue25, inverseLengthValue9 * varyingTangent0.z));
        float inverseLengthValue10 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue17 = inverseLengthValue10 * multiplyAddValue5;
        intermediateValue18 = inverseLengthValue10 * multiplyAddValue6;
        intermediateValue19 = inverseLengthValue10 * multiplyAddValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue16 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue25;
        float multiplyAddValue8 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue27, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue26, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue27, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue26, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue27, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue26, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue18 = inverseLengthValue17 * multiplyAddValue8;
        intermediateValue19 = inverseLengthValue17 * multiplyAddValue9;
        intermediateValue20 = inverseLengthValue17 * multiplyAddValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue21 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue11 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue23, inverseLengthValue21 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue23, inverseLengthValue21 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue24, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue23, inverseLengthValue21 * varyingTangent0.z));
        float inverseLengthValue22 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue15 = inverseLengthValue22 * multiplyAddValue11;
        intermediateValue16 = inverseLengthValue22 * multiplyAddValue12;
        intermediateValue17 = inverseLengthValue22 * multiplyAddValue13;
#endif
    }
    float sumValue6 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue14, intermediateValue15, intermediateValue16), float3(intermediateValue14, intermediateValue15, intermediateValue16)));
    float productValue23 = inverseLengthValue6 * intermediateValue14;
    float productValue24 = inverseLengthValue6 * intermediateValue15;
    float productValue25 = inverseLengthValue6 * intermediateValue16;
    float quotientValue = 1.0f / ((abs(productValue24) + abs(productValue23)) + abs(productValue25));
    float productValue26 = quotientValue * productValue23;
    float productValue27 = quotientValue * productValue24;
    bool conditionValue2 = productValue25 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue17, intermediateValue18, intermediateValue19), float3(intermediateValue17, intermediateValue18, intermediateValue19)));
    float productValue44 = inverseLengthValue11 * intermediateValue17;
    float productValue45 = inverseLengthValue11 * intermediateValue18;
    float productValue46 = inverseLengthValue11 * intermediateValue19;
    float quotientValue1 = 1.0f / ((abs(productValue45) + abs(productValue44)) + abs(productValue46));
    float productValue47 = quotientValue1 * productValue44;
    float productValue48 = quotientValue1 * productValue45;
    bool conditionValue5 = productValue46 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue18 = rsqrt(dot(float3(intermediateValue18, intermediateValue19, intermediateValue20), float3(intermediateValue18, intermediateValue19, intermediateValue20)));
    float productValue74 = inverseLengthValue18 * intermediateValue18;
    float productValue75 = inverseLengthValue18 * intermediateValue19;
    float productValue76 = inverseLengthValue18 * intermediateValue20;
    float quotientValue2 = 1.0f / ((abs(productValue75) + abs(productValue74)) + abs(productValue76));
    float productValue77 = quotientValue2 * productValue74;
    float productValue78 = quotientValue2 * productValue75;
    bool conditionValue10 = productValue76 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue23 = rsqrt(dot(float3(intermediateValue15, intermediateValue16, intermediateValue17), float3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue93 = inverseLengthValue23 * intermediateValue15;
    float productValue94 = inverseLengthValue23 * intermediateValue16;
    float productValue95 = inverseLengthValue23 * intermediateValue17;
    float quotientValue3 = 1.0f / ((abs(productValue94) + abs(productValue93)) + abs(productValue95));
    float productValue96 = quotientValue3 * productValue93;
    float productValue97 = quotientValue3 * productValue94;
    bool conditionValue13 = productValue95 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue28 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue28, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue28 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue28, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue28 * productValue28) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue28, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue29 = clampedValue * 0.16666667163372039794921875f;
    float productValue30 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue31 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue6 = ceil(clamp(max(max(productValue29, productValue31), max(productValue30, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue11, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((uint(clamp(intermediateValue15, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue14, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue16, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue15, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue29 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue30 / clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue31 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) + (productValue16 * productValue16);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) + (productValue17 * productValue17);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) + (productValue18 * productValue18);
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue13 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue26 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue27))) : productValue26;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue26)) * ((productValue27 < 0.0f) ? (-1.0f) : 1.0f)) : productValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37) + (productValue16 * productValue16);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) + (productValue17 * productValue17);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) + (productValue18 * productValue18);
    fragmentColor1.w = (intermediateValue13 > intermediateValue16) ? ((intermediateValue13 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue16 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue47 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue48))) : productValue47;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue47)) * ((productValue48 < 0.0f) ? (-1.0f) : 1.0f)) : productValue48;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue67) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue67) + (productValue16 * productValue16);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) + (productValue17 * productValue17);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) + (productValue18 * productValue18);
    fragmentColor1.w = (intermediateValue14 > intermediateValue17) ? ((intermediateValue14 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue17 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue77 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue78))) : productValue77;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue77)) * ((productValue78 < 0.0f) ? (-1.0f) : 1.0f)) : productValue78;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue86) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue86) + (productValue16 * productValue16);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue87) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue87) + (productValue17 * productValue17);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue88) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue88) + (productValue18 * productValue18);
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue13 ? (((productValue96 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue97))) : productValue96;
    fragmentColor2.y = conditionValue13 ? ((1.0f - abs(productValue96)) * ((productValue97 < 0.0f) ? (-1.0f) : 1.0f)) : productValue97;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
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
