// ActorGlintPrepass / GeometryPrepass / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorGlintPrepass/FragmentBindings.hlsli"

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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.w = workingVector1.x + workingVector1.y;
  workingVector0.w = workingVector0.w + workingVector1.z;
  workingVector1.w = 1 + -workingVector1.w;
  workingVector0.w = workingVector1.w * workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 < workingVector0.w);
  workingVector0.w = workingVector0.w ? 1.000000 : 0;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyz * workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector2.y = 1 + -workingVector1.w;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.x = RD_COMPARISON_MASK(0 < workingVector2.x);
  workingVector2.x = workingVector2.x ? 1.000000 : 0;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw + -workingVector1.xyzw;
  workingVector0.xyzw = workingVector2.xxxx * workingVector0.xyzw + workingVector1.xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
  workingVector0.xy = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xy;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.z = workingVector1.x + workingVector1.y;
  workingVector0.z = workingVector0.z + workingVector1.z;
  workingVector0.w = 1 + -workingVector1.w;
  workingVector0.z = workingVector0.z * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(0 < workingVector0.z);
  workingVector0.z = workingVector0.z ? 1.000000 : 0;
  workingVector0.xy = RD_UNIFORM_MAT_COLOR.xy * workingVector0.xy + -workingVector1.xy;
  workingVector0.xy = workingVector0.zz * workingVector0.xy + workingVector1.xy;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector2.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * workingVector1.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
  workingVector1.xyzw = frac(varyingTexCoord2.xyzw);
  workingVector2.xyz = materialTexture2.Sample(textureSampler2, workingVector1.xy).xyz;
  workingVector1.xyz = materialTexture2.Sample(textureSampler2, workingVector1.zw).xyz;
  workingVector1.xyz = RD_UNIFORM_GLINT_COLOR.xyz * workingVector1.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_GLINT_COLOR.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_TILE_LIGHT_COLOR.xyz * workingVector1.xyz;
  fragmentColor1.xyz = workingVector1.xyz * workingVector1.xyz + workingVector0.xyz;
  workingVector0.x = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
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
      workingVector3.xyz = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyz;
      workingVector3.xyz = workingVector3.xyz * float3(2,2,2) + float3(-1,-1,-1);
      workingVector1.x = -1;
    } else {
      if (workingVector1.w != 0) {
        materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
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
        workingVector5.xyzw = materialTexture3.Gather(textureSampler3, workingVector0.zw).xyzw;
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
          materialTexture3.GetDimensions(0, floatingPointResult.x, floatingPointResult.y, floatingPointResult.z);
          workingVector0.zw = floatingPointResult.xy;
          workingVector4.xyzw = materialTexture3.SampleLevel(textureSampler3, varyingTexCoord0.xy, 0).xyzw;
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
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float productValue = (sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue1 = (sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue2 = (sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = sampledTextureValue6.z;
    float productValue19 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - sampledTextureValue6.w)) > 0.0f);
    float productValue20 = ((productValue19 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue21 = ((productValue19 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue22 = ((productValue19 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue32 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue33 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue34 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue35 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue36 = ((((productValue32 * RD_UNIFORM_CHANGE_COLOR.x) - productValue32) * productValue35) + productValue32) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue37 = ((((productValue33 * RD_UNIFORM_CHANGE_COLOR.y) - productValue33) * productValue35) + productValue33) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue38 = ((((productValue34 * RD_UNIFORM_CHANGE_COLOR.z) - productValue34) * productValue35) + productValue34) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = sampledTextureValue6.z;
    float scalarValue12 = sampledTextureValue6.w;
    float productValue39 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - scalarValue12)) > 0.0f);
    float productValue40 = (productValue39 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue41 = (productValue39 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue42 = (productValue39 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9;
    float productValue43 = (productValue39 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue12)) + scalarValue12;
    float productValue44 = ((((productValue40 * RD_UNIFORM_CHANGE_COLOR.x) - productValue40) * productValue43) + productValue40) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue45 = ((((productValue41 * RD_UNIFORM_CHANGE_COLOR.y) - productValue41) * productValue43) + productValue41) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue46 = ((((productValue42 * RD_UNIFORM_CHANGE_COLOR.z) - productValue42) * productValue43) + productValue42) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue32 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue33 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue56 = RD_UNIFORM_CHANGE_COLOR.x * productValue32;
    float productValue57 = RD_UNIFORM_CHANGE_COLOR.y * productValue32;
    float productValue58 = RD_UNIFORM_CHANGE_COLOR.z * productValue32;
    float scalarValue15 = ceil(productValue33);
    float productValue59 = ((((productValue33 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue56) * scalarValue15) + productValue56) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue60 = ((((productValue33 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue57) * scalarValue15) + productValue57) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue61 = ((((productValue33 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue58) * scalarValue15) + productValue58) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue6 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float productValue71 = float((((scalarValue7 + scalarValue8) + sampledTextureValue6.z) * (1.0f - sampledTextureValue6.w)) > 0.0f);
    float productValue72 = (productValue71 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue73 = (productValue71 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue74 = productValue72 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue75 = productValue72 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue76 = productValue72 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue18 = ceil(productValue73);
    float productValue77 = ((((productValue73 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue74) * scalarValue18) + productValue74) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue78 = ((((productValue73 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue75) * scalarValue18) + productValue75) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue79 = ((((productValue73 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue76) * scalarValue18) + productValue76) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#endif
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.x), frac(varyingTexCoord2.y)));
    float4 sampledTextureValue2 = matTexture1Texture.Sample(matTexture1Sampler, float2(frac(varyingTexCoord2.z), frac(varyingTexCoord2.w)));
    float productValue3 = (RD_UNIFORM_GLINT_COLOR.x * RD_UNIFORM_TILE_LIGHT_COLOR.x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (RD_UNIFORM_GLINT_COLOR.y * RD_UNIFORM_TILE_LIGHT_COLOR.y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (RD_UNIFORM_GLINT_COLOR.z * RD_UNIFORM_TILE_LIGHT_COLOR.z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
#endif
    if ((scalarValue & 1u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue2 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue3 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue4 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue5 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue7 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue8 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue9 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue3 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue4 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue6 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
    else
    {
        float4 sampledTextureValue3 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue2 = sampledTextureValue3.x;
        intermediateValue3 = sampledTextureValue3.y;
        intermediateValue4 = sampledTextureValue3.z;
        intermediateValue5 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = sampledTextureValue3.x;
        intermediateValue7 = sampledTextureValue3.y;
        intermediateValue8 = sampledTextureValue3.z;
        intermediateValue9 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue3 = sampledTextureValue3.x;
        intermediateValue4 = sampledTextureValue3.y;
        intermediateValue5 = sampledTextureValue3.z;
        intermediateValue6 = ((scalarValue & 2u) != 0u) ? sampledTextureValue3.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
#endif
    if ((scalarValue & 28u) == 0u)
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = varyingNormal0.x;
        intermediateValue7 = varyingNormal0.y;
        intermediateValue8 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue10 = varyingNormal0.x;
        intermediateValue11 = varyingNormal0.y;
        intermediateValue12 = varyingNormal0.z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
#endif
        if ((scalarValue & 4u) == 0u)
        {
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue4 = 0.0f;
                    branchMergedValue5 = 1.0f;
                }
                else
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount564;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount564);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount585;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount585);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount609;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount609);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount589;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount589);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount607;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount607);
#endif
                    float4 sampledTextureValue4 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue6 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue7 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue6 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue6 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue1 = (((productValue7 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue7 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue;
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float inverseLengthValue = rsqrt(dot(float3(comparisonValue2, comparisonValue3, 0.25f), float3(comparisonValue2, comparisonValue3, 0.25f)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue3 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue23 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue24 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue6 = (((productValue23 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue23 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue7 = (((productValue24 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue24 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue8 = ((abs(comparisonValue6) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue6;
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, 0.25f), float3(comparisonValue8, comparisonValue9, 0.25f)));
                    branchMergedValue3 = comparisonValue8 * inverseLengthValue7;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue7;
                    branchMergedValue5 = inverseLengthValue7 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue47 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue48 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue10 = (((productValue47 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue47 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue11 = (((productValue48 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue48 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue12 = ((abs(comparisonValue10) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue10;
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float inverseLengthValue12 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, 0.25f), float3(comparisonValue12, comparisonValue13, 0.25f)));
                    branchMergedValue3 = comparisonValue12 * inverseLengthValue12;
                    branchMergedValue4 = comparisonValue13 * inverseLengthValue12;
                    branchMergedValue5 = inverseLengthValue12 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue62 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue63 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue14 = (((productValue62 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue62 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue15 = (((productValue63 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue63 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float inverseLengthValue17 = rsqrt(dot(float3(comparisonValue16, comparisonValue17, 0.25f), float3(comparisonValue16, comparisonValue17, 0.25f)));
                    branchMergedValue3 = comparisonValue16 * inverseLengthValue17;
                    branchMergedValue4 = comparisonValue17 * inverseLengthValue17;
                    branchMergedValue5 = inverseLengthValue17 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue80 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue81 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue18 = (((productValue80 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.y * 2.0f) + (-1.0f))) - (((sampledTextureValue4.w * 2.0f) + (-1.0f)) * ((productValue80 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue19 = (((productValue81 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue4.z * 2.0f) + (-1.0f))) - (((productValue81 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue4.x * 2.0f) + (-1.0f)));
                    float comparisonValue20 = ((abs(comparisonValue18) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue18;
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float inverseLengthValue22 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, 0.25f), float3(comparisonValue20, comparisonValue21, 0.25f)));
                    branchMergedValue3 = comparisonValue20 * inverseLengthValue22;
                    branchMergedValue4 = comparisonValue21 * inverseLengthValue22;
                    branchMergedValue5 = inverseLengthValue22 * 0.25f;
#endif
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
            }
            else
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount505;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount505);
                float productValue8 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue9 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = frac(productValue8);
                float scalarValue2 = frac(productValue9);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount526;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount526);
                float productValue25 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue10 = frac(productValue25);
                float scalarValue11 = frac(productValue26);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount550;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount550);
                float productValue49 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue50 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue13 = frac(productValue49);
                float scalarValue14 = frac(productValue50);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount530;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount530);
                float productValue64 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue65 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue16 = frac(productValue64);
                float scalarValue17 = frac(productValue65);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount548;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount548);
                float productValue82 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue83 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue19 = frac(productValue82);
                float scalarValue20 = frac(productValue83);
#endif
                float comparisonValue4;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue1 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue13 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue19 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue1 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue2 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                if (abs(scalarValue14 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                if (abs(scalarValue20 + (-0.5f)) < 0.0625f)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue20 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#endif
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.y;
                }
                float4 vectorValue2 = normalTextureTexture.GatherRed(normalTextureSampler, float2(comparisonValue4, comparisonValue5));
                float scalarValue3 = vectorValue2.x;
                float scalarValue4 = vectorValue2.y;
                float scalarValue5 = vectorValue2.z;
                float scalarValue6 = vectorValue2.w;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue = frac(productValue8 + 0.5f);
                float sumValue1 = frac(productValue9 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue6 = frac(productValue25 + 0.5f);
                float sumValue7 = frac(productValue26 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue9 = frac(productValue49 + 0.5f);
                float sumValue10 = frac(productValue50 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue12 = frac(productValue64 + 0.5f);
                float sumValue13 = frac(productValue65 + 0.5f);
                bool conditionValue9 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue15 = frac(productValue82 + 0.5f);
                float sumValue16 = frac(productValue83 + 0.5f);
                bool conditionValue12 = sumValue16 > 0.5f;
#endif
                float intermediateValue[2];
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue ? scalarValue4 : scalarValue5;
                float clampedValue3 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue2 = clampedValue3 - clampedValue4;
                bool conditionValue1 = sumValue > 0.5f;
                intermediateValue[0u] = conditionValue1 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue1 ? scalarValue4 : scalarValue3;
                float clampedValue5 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue1 = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                branchMergedValue = inverseLengthValue1 * sumValue2;
                branchMergedValue1 = inverseLengthValue1 * clampedValue5;
                branchMergedValue2 = inverseLengthValue1 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                intermediateValue[0u] = conditionValue3 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue3 ? scalarValue4 : scalarValue5;
                float clampedValue7 = intermediateValue[uint(int(clamp((sumValue6 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue8 = intermediateValue[uint(int(clamp((sumValue6 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue8 = clampedValue7 - clampedValue8;
                bool conditionValue4 = sumValue6 > 0.5f;
                intermediateValue[0u] = conditionValue4 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue4 ? scalarValue4 : scalarValue3;
                float clampedValue9 = intermediateValue[uint(int(clamp((sumValue7 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue7 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue8 = rsqrt(dot(float3(sumValue8, clampedValue9, 0.25f), float3(sumValue8, clampedValue9, 0.25f)));
                branchMergedValue = inverseLengthValue8 * sumValue8;
                branchMergedValue1 = inverseLengthValue8 * clampedValue9;
                branchMergedValue2 = inverseLengthValue8 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue6 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue6 ? scalarValue4 : scalarValue5;
                float clampedValue10 = intermediateValue[uint(int(clamp((sumValue9 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue11 = intermediateValue[uint(int(clamp((sumValue9 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue11 = clampedValue10 - clampedValue11;
                bool conditionValue7 = sumValue9 > 0.5f;
                intermediateValue[0u] = conditionValue7 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue7 ? scalarValue4 : scalarValue3;
                float clampedValue12 = intermediateValue[uint(int(clamp((sumValue10 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue10 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue13 = rsqrt(dot(float3(sumValue11, clampedValue12, 0.25f), float3(sumValue11, clampedValue12, 0.25f)));
                branchMergedValue = inverseLengthValue13 * sumValue11;
                branchMergedValue1 = inverseLengthValue13 * clampedValue12;
                branchMergedValue2 = inverseLengthValue13 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue9 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue9 ? scalarValue4 : scalarValue5;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue13 - clampedValue14;
                bool conditionValue10 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue10 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue10 ? scalarValue4 : scalarValue3;
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue18 = rsqrt(dot(float3(sumValue14, clampedValue15, 0.25f), float3(sumValue14, clampedValue15, 0.25f)));
                branchMergedValue = inverseLengthValue18 * sumValue14;
                branchMergedValue1 = inverseLengthValue18 * clampedValue15;
                branchMergedValue2 = inverseLengthValue18 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue12 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue12 ? scalarValue4 : scalarValue5;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue17 = clampedValue16 - clampedValue17;
                bool conditionValue13 = sumValue15 > 0.5f;
                intermediateValue[0u] = conditionValue13 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue13 ? scalarValue4 : scalarValue3;
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue23 = rsqrt(dot(float3(sumValue17, clampedValue18, 0.25f), float3(sumValue17, clampedValue18, 0.25f)));
                branchMergedValue = inverseLengthValue23 * sumValue17;
                branchMergedValue1 = inverseLengthValue23 * clampedValue18;
                branchMergedValue2 = inverseLengthValue23 * 0.25f;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue13 = branchMergedValue;
            intermediateValue14 = branchMergedValue1;
            intermediateValue15 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#endif
        }
        else
        {
            float4 sampledTextureValue5 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue13 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue14 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            intermediateValue16 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue17 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue14 = (sampledTextureValue5.x * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue5.y * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue5.z * 2.0f) + (-1.0f);
#endif
        }
        float inverseLengthValue2 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue3 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue4 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue13;
        float multiplyAddValue = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue15, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue14, inverseLengthValue4 * varyingTangent0.x));
        float multiplyAddValue1 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue15, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue14, inverseLengthValue4 * varyingTangent0.y));
        float multiplyAddValue2 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue15, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue14, inverseLengthValue4 * varyingTangent0.z));
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue6 = inverseLengthValue5 * multiplyAddValue;
        intermediateValue7 = inverseLengthValue5 * multiplyAddValue1;
        intermediateValue8 = inverseLengthValue5 * multiplyAddValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        float inverseLengthValue9 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue5 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue17, inverseLengthValue9 * varyingTangent0.x));
        float multiplyAddValue6 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue17, inverseLengthValue9 * varyingTangent0.y));
        float multiplyAddValue7 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue18, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue17, inverseLengthValue9 * varyingTangent0.z));
        float inverseLengthValue10 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
        intermediateValue9 = inverseLengthValue10 * multiplyAddValue5;
        intermediateValue10 = inverseLengthValue10 * multiplyAddValue6;
        intermediateValue11 = inverseLengthValue10 * multiplyAddValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        float inverseLengthValue14 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue8 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue18, inverseLengthValue14 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue18, inverseLengthValue14 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue18, inverseLengthValue14 * varyingTangent0.z));
        float inverseLengthValue15 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue10 = inverseLengthValue15 * multiplyAddValue8;
        intermediateValue11 = inverseLengthValue15 * multiplyAddValue9;
        intermediateValue12 = inverseLengthValue15 * multiplyAddValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue19 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue11 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue15, inverseLengthValue19 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue15, inverseLengthValue19 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue15, inverseLengthValue19 * varyingTangent0.z));
        float inverseLengthValue20 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue7 = inverseLengthValue20 * multiplyAddValue11;
        intermediateValue8 = inverseLengthValue20 * multiplyAddValue12;
        intermediateValue9 = inverseLengthValue20 * multiplyAddValue13;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue6, intermediateValue7, intermediateValue8), float3(intermediateValue6, intermediateValue7, intermediateValue8)));
    float productValue10 = inverseLengthValue6 * intermediateValue6;
    float productValue11 = inverseLengthValue6 * intermediateValue7;
    float productValue12 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0f / ((abs(productValue11) + abs(productValue10)) + abs(productValue12));
    float productValue13 = quotientValue * productValue10;
    float productValue14 = quotientValue * productValue11;
    bool conditionValue2 = productValue12 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue9, intermediateValue10, intermediateValue11), float3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue27 = inverseLengthValue11 * intermediateValue9;
    float productValue28 = inverseLengthValue11 * intermediateValue10;
    float productValue29 = inverseLengthValue11 * intermediateValue11;
    float quotientValue1 = 1.0f / ((abs(productValue28) + abs(productValue27)) + abs(productValue29));
    float productValue30 = quotientValue1 * productValue27;
    float productValue31 = quotientValue1 * productValue28;
    bool conditionValue5 = productValue29 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue16 = rsqrt(dot(float3(intermediateValue10, intermediateValue11, intermediateValue12), float3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue51 = inverseLengthValue16 * intermediateValue10;
    float productValue52 = inverseLengthValue16 * intermediateValue11;
    float productValue53 = inverseLengthValue16 * intermediateValue12;
    float quotientValue2 = 1.0f / ((abs(productValue52) + abs(productValue51)) + abs(productValue53));
    float productValue54 = quotientValue2 * productValue51;
    float productValue55 = quotientValue2 * productValue52;
    bool conditionValue8 = productValue53 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue21 = rsqrt(dot(float3(intermediateValue7, intermediateValue8, intermediateValue9), float3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue66 = inverseLengthValue21 * intermediateValue7;
    float productValue67 = inverseLengthValue21 * intermediateValue8;
    float productValue68 = inverseLengthValue21 * intermediateValue9;
    float quotientValue3 = 1.0f / ((abs(productValue67) + abs(productValue66)) + abs(productValue68));
    float productValue69 = quotientValue3 * productValue66;
    float productValue70 = quotientValue3 * productValue67;
    bool conditionValue11 = productValue68 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue15 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue15, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue15 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue15, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue15 * productValue15) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue15, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue16 = clampedValue * 0.16666667163372039794921875f;
    float productValue17 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue18 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue6 = ceil(clamp(max(max(productValue16, productValue18), max(productValue17, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue3, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor0.x = ((uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue6, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue7, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor0.x = ((uint(clamp(intermediateValue5, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue16 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue17 / clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue18 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue13 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue14))) : productValue13;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue13)) * ((productValue14 < 0.0f) ? (-1.0f) : 1.0f)) : productValue14;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue22) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue22) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue30 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue31))) : productValue30;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue30)) * ((productValue31 < 0.0f) ? (-1.0f) : 1.0f)) : productValue31;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue36) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue36) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue13 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue14))) : productValue13;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue13)) * ((productValue14 < 0.0f) ? (-1.0f) : 1.0f)) : productValue14;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue44) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue44) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue9 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue8 ? (((productValue54 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue55))) : productValue54;
    fragmentColor2.y = conditionValue8 ? ((1.0f - abs(productValue54)) * ((productValue55 < 0.0f) ? (-1.0f) : 1.0f)) : productValue55;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue61) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue61) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue11 ? (((productValue69 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue11 ? ((1.0f - abs(productValue69)) * ((productValue70 < 0.0f) ? (-1.0f) : 1.0f)) : productValue70;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) + (productValue3 * productValue3);
    fragmentColor1.y = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78) + (productValue4 * productValue4);
    fragmentColor1.z = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue79) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue79) + (productValue5 * productValue5);
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue30 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue31))) : productValue30;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue30)) * ((productValue31 < 0.0f) ? (-1.0f) : 1.0f)) : productValue31;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
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
