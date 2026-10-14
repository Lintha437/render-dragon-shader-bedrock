// ActorPrepass / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#endif

#include "../../include/materials/ActorPrepass/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float3 varyingBitangent0 : BITANGENT0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
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
  fragmentColor1.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + workingVector2.xyz;
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
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.x;
    float scalarValue8 = sampledTextureValue4.y;
    float scalarValue9 = sampledTextureValue4.z;
    float productValue16 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - sampledTextureValue4.w)) > 0.0f);
    float productValue17 = ((productValue16 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue18 = ((productValue16 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue19 = ((productValue16 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float productValue29 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue30 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue31 = sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z;
    float productValue32 = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w;
    float productValue33 = ((((productValue29 * RD_UNIFORM_CHANGE_COLOR.x) - productValue29) * productValue32) + productValue29) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue34 = ((((productValue30 * RD_UNIFORM_CHANGE_COLOR.y) - productValue30) * productValue32) + productValue30) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue35 = ((((productValue31 * RD_UNIFORM_CHANGE_COLOR.z) - productValue31) * productValue32) + productValue31) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.x;
    float scalarValue8 = sampledTextureValue4.y;
    float scalarValue9 = sampledTextureValue4.z;
    float scalarValue14 = sampledTextureValue4.w;
    float productValue40 = float((((scalarValue7 + scalarValue8) + scalarValue9) * (1.0f - scalarValue14)) > 0.0f);
    float productValue41 = (productValue40 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue42 = (productValue40 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue43 = (productValue40 * ((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR.z) - scalarValue9)) + scalarValue9;
    float productValue44 = (productValue40 * ((sampledTextureValue.w * RD_UNIFORM_MAT_COLOR.w) - scalarValue14)) + scalarValue14;
    float productValue45 = ((((productValue41 * RD_UNIFORM_CHANGE_COLOR.x) - productValue41) * productValue44) + productValue41) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue46 = ((((productValue42 * RD_UNIFORM_CHANGE_COLOR.y) - productValue42) * productValue44) + productValue42) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue47 = ((((productValue43 * RD_UNIFORM_CHANGE_COLOR.z) - productValue43) * productValue44) + productValue43) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float productValue29 = sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x;
    float productValue30 = sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y;
    float productValue57 = RD_UNIFORM_CHANGE_COLOR.x * productValue29;
    float productValue58 = RD_UNIFORM_CHANGE_COLOR.y * productValue29;
    float productValue59 = RD_UNIFORM_CHANGE_COLOR.z * productValue29;
    float scalarValue17 = ceil(productValue30);
    float productValue60 = ((((productValue30 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue57) * scalarValue17) + productValue57) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue61 = ((((productValue30 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue58) * scalarValue17) + productValue58) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue62 = ((((productValue30 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue59) * scalarValue17) + productValue59) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float4 sampledTextureValue4 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.x;
    float scalarValue8 = sampledTextureValue4.y;
    float productValue72 = float((((scalarValue7 + scalarValue8) + sampledTextureValue4.z) * (1.0f - sampledTextureValue4.w)) > 0.0f);
    float productValue73 = (productValue72 * ((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR.x) - scalarValue7)) + scalarValue7;
    float productValue74 = (productValue72 * ((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR.y) - scalarValue8)) + scalarValue8;
    float productValue75 = productValue73 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue76 = productValue73 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue77 = productValue73 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue20 = ceil(productValue74);
    float productValue78 = ((((productValue74 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue75) * scalarValue20) + productValue75) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue79 = ((((productValue74 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue76) * scalarValue20) + productValue76) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue80 = ((((productValue74 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue77) * scalarValue20) + productValue77) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
#endif
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
        float4 sampledTextureValue1 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue2 = sampledTextureValue1.x;
        intermediateValue3 = sampledTextureValue1.y;
        intermediateValue4 = sampledTextureValue1.z;
        intermediateValue5 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
        intermediateValue5 = sampledTextureValue1.x;
        intermediateValue6 = sampledTextureValue1.y;
        intermediateValue7 = sampledTextureValue1.z;
        intermediateValue8 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
        intermediateValue6 = sampledTextureValue1.x;
        intermediateValue7 = sampledTextureValue1.y;
        intermediateValue8 = sampledTextureValue1.z;
        intermediateValue9 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue & 2u) != 0u) ? sampledTextureValue1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
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
                    uint unusedTextureMipCount509;
                    uint2 vectorValue = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount509);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    uint unusedTextureMipCount535;
                    uint2 vectorValue3 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount535);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount530;
                    uint2 vectorValue5 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount530);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    uint unusedTextureMipCount559;
                    uint2 vectorValue7 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount559);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount534;
                    uint2 vectorValue9 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount534);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    uint unusedTextureMipCount557;
                    uint2 vectorValue11 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount557);
#endif
                    float4 sampledTextureValue2 = normalTextureTexture.SampleLevel(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0f);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue3 = frac(float(int(uint(int(float(int(vectorValue.x)))))) * varyingTexCoord0.x);
                    float productValue4 = frac(float(int(uint(int(float(int(vectorValue.y)))))) * varyingTexCoord0.y);
                    float comparisonValue = (((productValue3 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue3 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue1 = (((productValue4 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue4 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue2 = ((abs(comparisonValue) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue;
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue1;
                    float inverseLengthValue = rsqrt(dot(float3(comparisonValue2, comparisonValue3, 0.25f), float3(comparisonValue2, comparisonValue3, 0.25f)));
                    branchMergedValue3 = comparisonValue2 * inverseLengthValue;
                    branchMergedValue4 = comparisonValue3 * inverseLengthValue;
                    branchMergedValue5 = inverseLengthValue * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    float productValue20 = frac(float(int(uint(int(float(int(vectorValue3.x)))))) * varyingTexCoord0.x);
                    float productValue21 = frac(float(int(uint(int(float(int(vectorValue3.y)))))) * varyingTexCoord0.y);
                    float comparisonValue6 = (((productValue20 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue20 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue7 = (((productValue21 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue21 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue8 = ((abs(comparisonValue6) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue6;
                    float comparisonValue9 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                    float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, 0.25f), float3(comparisonValue8, comparisonValue9, 0.25f)));
                    branchMergedValue3 = comparisonValue8 * inverseLengthValue7;
                    branchMergedValue4 = comparisonValue9 * inverseLengthValue7;
                    branchMergedValue5 = inverseLengthValue7 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue36 = frac(float(int(uint(int(float(int(vectorValue5.x)))))) * varyingTexCoord0.x);
                    float productValue37 = frac(float(int(uint(int(float(int(vectorValue5.y)))))) * varyingTexCoord0.y);
                    float comparisonValue10 = (((productValue36 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue36 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue11 = (((productValue37 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue37 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue12 = ((abs(comparisonValue10) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue10;
                    float comparisonValue13 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                    float inverseLengthValue12 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, 0.25f), float3(comparisonValue12, comparisonValue13, 0.25f)));
                    branchMergedValue3 = comparisonValue12 * inverseLengthValue12;
                    branchMergedValue4 = comparisonValue13 * inverseLengthValue12;
                    branchMergedValue5 = inverseLengthValue12 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    float productValue48 = frac(float(int(uint(int(float(int(vectorValue7.x)))))) * varyingTexCoord0.x);
                    float productValue49 = frac(float(int(uint(int(float(int(vectorValue7.y)))))) * varyingTexCoord0.y);
                    float comparisonValue14 = (((productValue48 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue48 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue15 = (((productValue49 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue49 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue16 = ((abs(comparisonValue14) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue14;
                    float comparisonValue17 = ((abs(comparisonValue15) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue15;
                    float inverseLengthValue14 = rsqrt(dot(float3(comparisonValue16, comparisonValue17, 0.25f), float3(comparisonValue16, comparisonValue17, 0.25f)));
                    branchMergedValue3 = comparisonValue16 * inverseLengthValue14;
                    branchMergedValue4 = comparisonValue17 * inverseLengthValue14;
                    branchMergedValue5 = inverseLengthValue14 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue63 = frac(float(int(uint(int(float(int(vectorValue9.x)))))) * varyingTexCoord0.x);
                    float productValue64 = frac(float(int(uint(int(float(int(vectorValue9.y)))))) * varyingTexCoord0.y);
                    float comparisonValue18 = (((productValue63 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue63 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue19 = (((productValue64 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue64 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue20 = ((abs(comparisonValue18) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue18;
                    float comparisonValue21 = ((abs(comparisonValue19) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue19;
                    float inverseLengthValue19 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, 0.25f), float3(comparisonValue20, comparisonValue21, 0.25f)));
                    branchMergedValue3 = comparisonValue20 * inverseLengthValue19;
                    branchMergedValue4 = comparisonValue21 * inverseLengthValue19;
                    branchMergedValue5 = inverseLengthValue19 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    float productValue81 = frac(float(int(uint(int(float(int(vectorValue11.x)))))) * varyingTexCoord0.x);
                    float productValue82 = frac(float(int(uint(int(float(int(vectorValue11.y)))))) * varyingTexCoord0.y);
                    float comparisonValue22 = (((productValue81 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.y * 2.0f) + (-1.0f))) - (((sampledTextureValue2.w * 2.0f) + (-1.0f)) * ((productValue81 > 0.083333335816860198974609375f) ? 0.0f : 1.0f));
                    float comparisonValue23 = (((productValue82 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((sampledTextureValue2.z * 2.0f) + (-1.0f))) - (((productValue82 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.x * 2.0f) + (-1.0f)));
                    float comparisonValue24 = ((abs(comparisonValue22) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue22;
                    float comparisonValue25 = ((abs(comparisonValue23) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue23;
                    float inverseLengthValue24 = rsqrt(dot(float3(comparisonValue24, comparisonValue25, 0.25f), float3(comparisonValue24, comparisonValue25, 0.25f)));
                    branchMergedValue3 = comparisonValue24 * inverseLengthValue24;
                    branchMergedValue4 = comparisonValue25 * inverseLengthValue24;
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
                uint unusedTextureMipCount450;
                uint2 vectorValue1 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount450);
                float productValue5 = float(int(uint(int(float(int(vectorValue1.x)))))) * varyingTexCoord0.x;
                float productValue6 = float(int(uint(int(float(int(vectorValue1.y)))))) * varyingTexCoord0.y;
                float scalarValue1 = frac(productValue5);
                float scalarValue2 = frac(productValue6);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                uint unusedTextureMipCount476;
                uint2 vectorValue4 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount476);
                float productValue22 = float(int(uint(int(float(int(vectorValue4.x)))))) * varyingTexCoord0.x;
                float productValue23 = float(int(uint(int(float(int(vectorValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue10 = frac(productValue22);
                float scalarValue11 = frac(productValue23);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount471;
                uint2 vectorValue6 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount471);
                float productValue38 = float(int(uint(int(float(int(vectorValue6.x)))))) * varyingTexCoord0.x;
                float productValue39 = float(int(uint(int(float(int(vectorValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue12 = frac(productValue38);
                float scalarValue13 = frac(productValue39);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                uint unusedTextureMipCount500;
                uint2 vectorValue8 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount500);
                float productValue50 = float(int(uint(int(float(int(vectorValue8.x)))))) * varyingTexCoord0.x;
                float productValue51 = float(int(uint(int(float(int(vectorValue8.y)))))) * varyingTexCoord0.y;
                float scalarValue15 = frac(productValue50);
                float scalarValue16 = frac(productValue51);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount475;
                uint2 vectorValue10 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount475);
                float productValue65 = float(int(uint(int(float(int(vectorValue10.x)))))) * varyingTexCoord0.x;
                float productValue66 = float(int(uint(int(float(int(vectorValue10.y)))))) * varyingTexCoord0.y;
                float scalarValue18 = frac(productValue65);
                float scalarValue19 = frac(productValue66);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                uint unusedTextureMipCount498;
                uint2 vectorValue12 = rdTextureSize(normalTextureTexture, 0u, unusedTextureMipCount498);
                float productValue83 = float(int(uint(int(float(int(vectorValue12.x)))))) * varyingTexCoord0.x;
                float productValue84 = float(int(uint(int(float(int(vectorValue12.y)))))) * varyingTexCoord0.y;
                float scalarValue21 = frac(productValue83);
                float scalarValue22 = frac(productValue84);
#endif
                float comparisonValue4;
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
                    comparisonValue4 = ((scalarValue1 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue4 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue12 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue4 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue18 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue4 = ((scalarValue21 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.x;
#endif
                }
                else
                {
                    comparisonValue4 = varyingTexCoord0.x;
                }
                float comparisonValue5;
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
                    comparisonValue5 = ((scalarValue2 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                    comparisonValue5 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue13 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                    comparisonValue5 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue19 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                    comparisonValue5 = ((scalarValue22 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + varyingTexCoord0.y;
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
                float sumValue = frac(productValue5 + 0.5f);
                float sumValue1 = frac(productValue6 + 0.5f);
                bool conditionValue = sumValue1 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
                float sumValue6 = frac(productValue22 + 0.5f);
                float sumValue7 = frac(productValue23 + 0.5f);
                bool conditionValue3 = sumValue7 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue9 = frac(productValue38 + 0.5f);
                float sumValue10 = frac(productValue39 + 0.5f);
                bool conditionValue6 = sumValue10 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                float sumValue12 = frac(productValue50 + 0.5f);
                float sumValue13 = frac(productValue51 + 0.5f);
                bool conditionValue8 = sumValue13 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue15 = frac(productValue65 + 0.5f);
                float sumValue16 = frac(productValue66 + 0.5f);
                bool conditionValue11 = sumValue16 > 0.5f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                float sumValue18 = frac(productValue83 + 0.5f);
                float sumValue19 = frac(productValue84 + 0.5f);
                bool conditionValue14 = sumValue19 > 0.5f;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
                intermediateValue[0u] = conditionValue8 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue8 ? scalarValue4 : scalarValue5;
                float clampedValue13 = intermediateValue[uint(int(clamp((sumValue12 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue14 = intermediateValue[uint(int(clamp((sumValue12 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue14 = clampedValue13 - clampedValue14;
                bool conditionValue9 = sumValue12 > 0.5f;
                intermediateValue[0u] = conditionValue9 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue9 ? scalarValue4 : scalarValue3;
                float clampedValue15 = intermediateValue[uint(int(clamp((sumValue13 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue13 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue15 = rsqrt(dot(float3(sumValue14, clampedValue15, 0.25f), float3(sumValue14, clampedValue15, 0.25f)));
                branchMergedValue = inverseLengthValue15 * sumValue14;
                branchMergedValue1 = inverseLengthValue15 * clampedValue15;
                branchMergedValue2 = inverseLengthValue15 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue11 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue11 ? scalarValue4 : scalarValue5;
                float clampedValue16 = intermediateValue[uint(int(clamp((sumValue15 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue17 = intermediateValue[uint(int(clamp((sumValue15 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue17 = clampedValue16 - clampedValue17;
                bool conditionValue12 = sumValue15 > 0.5f;
                intermediateValue[0u] = conditionValue12 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue12 ? scalarValue4 : scalarValue3;
                float clampedValue18 = intermediateValue[uint(int(clamp((sumValue16 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue16 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue20 = rsqrt(dot(float3(sumValue17, clampedValue18, 0.25f), float3(sumValue17, clampedValue18, 0.25f)));
                branchMergedValue = inverseLengthValue20 * sumValue17;
                branchMergedValue1 = inverseLengthValue20 * clampedValue18;
                branchMergedValue2 = inverseLengthValue20 * 0.25f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
                intermediateValue[0u] = conditionValue14 ? scalarValue3 : scalarValue6;
                intermediateValue[1u] = conditionValue14 ? scalarValue4 : scalarValue5;
                float clampedValue19 = intermediateValue[uint(int(clamp((sumValue18 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                float clampedValue20 = intermediateValue[uint(int(clamp((sumValue18 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float sumValue20 = clampedValue19 - clampedValue20;
                bool conditionValue15 = sumValue18 > 0.5f;
                intermediateValue[0u] = conditionValue15 ? scalarValue5 : scalarValue6;
                intermediateValue[1u] = conditionValue15 ? scalarValue4 : scalarValue3;
                float clampedValue21 = intermediateValue[uint(int(clamp((sumValue19 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue19 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                float inverseLengthValue25 = rsqrt(dot(float3(sumValue20, clampedValue21, 0.25f), float3(sumValue20, clampedValue21, 0.25f)));
                branchMergedValue = inverseLengthValue25 * sumValue20;
                branchMergedValue1 = inverseLengthValue25 * clampedValue21;
                branchMergedValue2 = inverseLengthValue25 * 0.25f;
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
            float4 sampledTextureValue3 = normalTextureTexture.Sample(normalTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue13 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue14 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
            intermediateValue16 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue17 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
            intermediateValue17 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
            intermediateValue14 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue15 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue16 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
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
        float inverseLengthValue16 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue8 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue18, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue9 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue18, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue10 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue19, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue18, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = rsqrt(dot(float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), float3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10)));
        intermediateValue10 = inverseLengthValue17 * multiplyAddValue8;
        intermediateValue11 = inverseLengthValue17 * multiplyAddValue9;
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue10;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
        float inverseLengthValue21 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue11 = mad(inverseLengthValue2 * varyingNormal0.x, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.x, intermediateValue15, inverseLengthValue21 * varyingTangent0.x));
        float multiplyAddValue12 = mad(inverseLengthValue2 * varyingNormal0.y, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.y, intermediateValue15, inverseLengthValue21 * varyingTangent0.y));
        float multiplyAddValue13 = mad(inverseLengthValue2 * varyingNormal0.z, intermediateValue16, mad(inverseLengthValue3 * varyingBitangent0.z, intermediateValue15, inverseLengthValue21 * varyingTangent0.z));
        float inverseLengthValue22 = rsqrt(dot(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13), float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue13)));
        intermediateValue7 = inverseLengthValue22 * multiplyAddValue11;
        intermediateValue8 = inverseLengthValue22 * multiplyAddValue12;
        intermediateValue9 = inverseLengthValue22 * multiplyAddValue13;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue6, intermediateValue7, intermediateValue8), float3(intermediateValue6, intermediateValue7, intermediateValue8)));
    float productValue7 = inverseLengthValue6 * intermediateValue6;
    float productValue8 = inverseLengthValue6 * intermediateValue7;
    float productValue9 = inverseLengthValue6 * intermediateValue8;
    float quotientValue = 1.0f / ((abs(productValue8) + abs(productValue7)) + abs(productValue9));
    float productValue10 = quotientValue * productValue7;
    float productValue11 = quotientValue * productValue8;
    bool conditionValue2 = productValue9 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    float inverseLengthValue11 = rsqrt(dot(float3(intermediateValue9, intermediateValue10, intermediateValue11), float3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue24 = inverseLengthValue11 * intermediateValue9;
    float productValue25 = inverseLengthValue11 * intermediateValue10;
    float productValue26 = inverseLengthValue11 * intermediateValue11;
    float quotientValue1 = 1.0f / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue5 = productValue26 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    float inverseLengthValue18 = rsqrt(dot(float3(intermediateValue10, intermediateValue11, intermediateValue12), float3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue52 = inverseLengthValue18 * intermediateValue10;
    float productValue53 = inverseLengthValue18 * intermediateValue11;
    float productValue54 = inverseLengthValue18 * intermediateValue12;
    float quotientValue2 = 1.0f / ((abs(productValue53) + abs(productValue52)) + abs(productValue54));
    float productValue55 = quotientValue2 * productValue52;
    float productValue56 = quotientValue2 * productValue53;
    bool conditionValue10 = productValue54 < 0.0f;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    float inverseLengthValue23 = rsqrt(dot(float3(intermediateValue7, intermediateValue8, intermediateValue9), float3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue67 = inverseLengthValue23 * intermediateValue7;
    float productValue68 = inverseLengthValue23 * intermediateValue8;
    float productValue69 = inverseLengthValue23 * intermediateValue9;
    float quotientValue3 = 1.0f / ((abs(productValue68) + abs(productValue67)) + abs(productValue69));
    float productValue70 = quotientValue3 * productValue67;
    float productValue71 = quotientValue3 * productValue68;
    bool conditionValue13 = productValue69 < 0.0f;
#endif
    float multiplyAddValue3 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue4 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue12 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue = clamp(productValue12, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue12 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue12, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue12 * productValue12) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue12, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue13 = clampedValue * 0.16666667163372039794921875f;
    float productValue14 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue15 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue6 = ceil(clamp(max(max(productValue13, productValue15), max(productValue14, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
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
    fragmentColor0.y = ((uint(clamp(productValue13 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue14 / clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue15 / clampedValue6, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue6, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue10 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue11))) : productValue10;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue10)) * ((productValue11 < 0.0f) ? (-1.0f) : 1.0f)) : productValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue27)) * ((productValue28 < 0.0f) ? (-1.0f) : 1.0f)) : productValue28;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue2 ? (((productValue10 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue11))) : productValue10;
    fragmentColor2.y = conditionValue2 ? ((1.0f - abs(productValue10)) * ((productValue11 < 0.0f) ? (-1.0f) : 1.0f)) : productValue11;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue47) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue47;
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue9 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue10 ? (((productValue55 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue56))) : productValue55;
    fragmentColor2.y = conditionValue10 ? ((1.0f - abs(productValue55)) * ((productValue56 < 0.0f) ? (-1.0f) : 1.0f)) : productValue56;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue61) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue61;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue62) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue62;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue6 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue13 ? (((productValue70 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue71))) : productValue70;
    fragmentColor2.y = conditionValue13 ? ((1.0f - abs(productValue70)) * ((productValue71 < 0.0f) ? (-1.0f) : 1.0f)) : productValue71;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI)
    fragmentColor1.x = ((RD_UNIFORM_OVERLAY_COLOR.x - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78;
    fragmentColor1.y = ((RD_UNIFORM_OVERLAY_COLOR.y - productValue79) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue79;
    fragmentColor1.z = ((RD_UNIFORM_OVERLAY_COLOR.z - productValue80) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue80;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue8 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue5 ? (((productValue27 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue5 ? ((1.0f - abs(productValue27)) * ((productValue28 < 0.0f) ? (-1.0f) : 1.0f)) : productValue28;
#endif
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue4)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue3) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue4)) * 0.5f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
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
