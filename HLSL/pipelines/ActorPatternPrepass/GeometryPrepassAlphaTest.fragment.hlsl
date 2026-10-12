// ActorPatternPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#define RD_BINDING_LAYOUT 7
#endif


#include "../../include/materials/ActorPatternPrepass/FragmentBindings.hlsli"

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
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.xyz = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyz;
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = -1;
  workingVector2.x = 0;
  while (true) {
    workingVector2.y = RD_COMPARISON_MASK((int)workingVector2.x >= (int)workingVector0.w);
    if (workingVector2.y != 0) break;
    workingVector2.yz = fragmentVectorConstants1[workingVector2.x+36].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector2.x+36].xy;
    workingVector3.xyzw = materialTexture3.Sample(textureSampler3, workingVector2.yz).xyzw;
    workingVector2.y = fragmentVectorConstants1[workingVector2.x+29].w * workingVector3.w;
    workingVector3.xyz = workingVector3.xyz * fragmentVectorConstants1[workingVector2.x+29].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.yyy * workingVector3.xyz + workingVector1.xyz;
    workingVector2.y = RD_COMPARISON_MASK(0.5 < workingVector2.y);
    workingVector2.y = workingVector2.y ? workingVector1.w : 0;
    workingVector1.w = workingVector2.y ? 0 : workingVector1.w;
    workingVector2.x = (int)workingVector2.x + 1;
  }
  fragmentColor1.xyz = workingVector1.xyz;
  workingVector0.x = RD_COMPARISON_MASK(1 < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.z = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector1.xyz = workingVector1.xyz * workingVector0.zzz;
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_ACTOR_FP_EPSILON.x);
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
#endif
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.z = dot(-workingVector1.xyz, workingVector2.xyz);
  workingVector0.w = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.z = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.z;
  workingVector0.w = 1 / workingVector0.w;
  workingVector0.z = saturate(workingVector0.z * workingVector0.w);
  workingVector0.w = workingVector0.z * -2 + 3;
  workingVector0.z = workingVector0.z * workingVector0.z;
  workingVector0.z = workingVector0.w * workingVector0.z;
  workingVector1.xy = varyingColor1.xy / varyingColor1.ww;
  workingVector1.xy = workingVector1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.xy;
  workingVector1.xy = workingVector1.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.xy = floor(workingVector1.xy);
  workingVector1.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.xy;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.xyxy;
#elif RD_FEATURE_TINTING == RD_OFF
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
#endif
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.w = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.xy = floor(workingVector1.xy);
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = 0.75 * workingVector1.y;
  workingVector1.x = workingVector1.x * 0.5 + workingVector1.y;
  workingVector1.x = frac(workingVector1.x);
  workingVector0.w = workingVector0.w * 0.25 + workingVector1.x;
  workingVector0.w = workingVector0.w * 64 + 0.5;
  workingVector0.w = 0.015625 * workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.w >= workingVector0.z);
  workingVector0.y = workingVector0.z ? workingVector0.y : 0;
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  if (workingVector0.x != 0) discard;
  workingVector0.x = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector0.y = (int)workingVector0.x & -2;
  workingVector0.x = workingVector1.w ? workingVector0.x : workingVector0.y;
  workingVector0.y = (int)workingVector0.x & 1;
  workingVector0.y = RD_COMPARISON_MASK((int)workingVector0.y == 1);
  if (workingVector0.y != 0) {
#elif RD_FEATURE_TINTING == RD_OFF
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
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
  workingVector0.w = (int)RD_UNIFORM_PBR_TEXTURE_FLAGS.x;
  workingVector1.x = (int)workingVector0.w & 1;
  workingVector1.x = RD_COMPARISON_MASK((int)workingVector1.x == 1);
  if (workingVector1.x != 0) {
#endif
    workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).zyxw;
#if RD_FEATURE_TINTING == RD_ON
    workingVector0.x = (int)workingVector0.x & 2;
    workingVector0.x = RD_COMPARISON_MASK((int)workingVector0.x == 2);
    workingVector0.y = workingVector0.x ? workingVector1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    workingVector0.x = workingVector1.z;
#elif RD_FEATURE_TINTING == RD_OFF
    workingVector0.w = (int)workingVector0.w & 2;
    workingVector0.w = RD_COMPARISON_MASK((int)workingVector0.w == 2);
    workingVector2.y = workingVector0.w ? workingVector1.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
    workingVector2.x = workingVector1.z;
#endif
  } else {
#if RD_FEATURE_TINTING == RD_ON
    workingVector0.x = RD_UNIFORM_METALNESS_UNIFORM.x;
#elif RD_FEATURE_TINTING == RD_OFF
    workingVector2.x = RD_UNIFORM_METALNESS_UNIFORM.x;
#endif
    workingVector1.y = RD_UNIFORM_EMISSIVE_UNIFORM.x;
    workingVector1.x = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
#if RD_FEATURE_TINTING == RD_ON
    workingVector0.y = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif RD_FEATURE_TINTING == RD_OFF
    workingVector2.y = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
  }
#if RD_FEATURE_TINTING == RD_ON
  workingVector2.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.y < workingVector0.x);
  workingVector0.x = workingVector0.x * 0.498039216 + 0.501960814;
  workingVector0.y = -workingVector0.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.z ? workingVector0.x : workingVector0.y;
  workingVector0.x = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.x = rsqrt(workingVector0.x);
  workingVector0.xyz = varyingNormal0.xyz * workingVector0.xxx;
  workingVector0.w = abs(workingVector0.x) + abs(workingVector0.y);
  workingVector0.w = workingVector0.w + abs(workingVector0.z);
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector3.xyz = -RD_UNIFORM_PREV_WORLD_POS_OFFSET.xyz + varyingTexCoord4.xyz;
  workingVector0.w = RD_COMPARISON_MASK(workingVector2.y < workingVector2.x);
  workingVector1.z = workingVector2.x * 0.498039216 + 0.501960814;
  workingVector1.w = -workingVector2.y * 0.498039216 + 0.498039216;
  fragmentColor1.w = workingVector0.w ? workingVector1.z : workingVector1.w;
  workingVector0.w = dot(varyingNormal0.xyz, varyingNormal0.xyz);
  workingVector0.w = rsqrt(workingVector0.w);
  workingVector2.xyz = varyingNormal0.xyz * workingVector0.www;
  workingVector0.w = abs(workingVector2.x) + abs(workingVector2.y);
  workingVector0.w = workingVector0.w + abs(workingVector2.z);
#endif
  workingVector0.w = 1 / workingVector0.w;
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.xy = workingVector0.xy * workingVector0.ww;
  workingVector0.z = RD_COMPARISON_MASK(workingVector0.z < 0);
  workingVector1.zw = float2(1,1) + -abs(workingVector0.yx);
  workingVector3.xy = RD_COMPARISON_MASK(workingVector0.xy >= float2(0,0));
  workingVector3.xy = workingVector3.xy ? float2(1,1) : 0;
  workingVector3.xy = workingVector3.xy * float2(2,2) + float2(-1,-1);
  workingVector1.zw = workingVector3.xy * workingVector1.zw;
  fragmentColor2.xy = workingVector0.zz ? workingVector1.zw : workingVector0.xy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector0.xyz;
  workingVector0.xy = workingVector0.xy / workingVector0.zz;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector3.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector2.yyy;
  workingVector2.xyw = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector2.xxx + workingVector3.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector2.zzz + workingVector2.xyw;
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.zw = workingVector2.xy * workingVector0.ww;
  workingVector0.w = RD_COMPARISON_MASK(workingVector2.z < 0);
  workingVector2.xy = float2(1,1) + -abs(workingVector1.wz);
  workingVector2.zw = RD_COMPARISON_MASK(workingVector1.zw >= float2(0,0));
  workingVector2.zw = workingVector2.zw ? float2(1,1) : 0;
  workingVector2.zw = workingVector2.zw * float2(2,2) + float2(-1,-1);
  workingVector2.xy = workingVector2.xy * workingVector2.zw;
  fragmentColor2.xy = workingVector0.ww ? workingVector2.xy : workingVector1.zw;
  workingVector2.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.xyw * varyingTexCoord3.yyy;
  workingVector2.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.xyw * varyingTexCoord3.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.xyw * varyingTexCoord3.zzz + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.xyw + workingVector2.xyz;
  workingVector1.zw = workingVector2.xy / workingVector2.zz;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.xyw * workingVector3.yyy;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.xyw * workingVector3.xxx + workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.xyw * workingVector3.zzz + workingVector2.xyz;
#endif
  workingVector2.xyz = RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.xyw + workingVector2.xyz;
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.zw = workingVector2.xy / workingVector2.zz;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = workingVector0.xy + -workingVector0.zw;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.x = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.x;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 9.99999975e-005);
  workingVector0.y = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector2.xy = workingVector2.xy / workingVector2.zz;
  workingVector2.xy = workingVector2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  fragmentColor2.zw = -workingVector2.xy + workingVector1.zw;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
  workingVector0.w = RD_UNIFORM_BLOCK_LIGHT_COLOR.z + workingVector0.w;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 9.99999975e-005);
  workingVector1.z = RD_COMPARISON_MASK(9.99999975e-005 < RD_UNIFORM_TILE_LIGHT_INTENSITY.x);
  workingVector0.w = workingVector0.w ? workingVector1.z : 0;
#endif
  workingVector2.x = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
#if RD_FEATURE_TINTING == RD_ON
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.z = workingVector2.x * 0.600000024 + 0.400000006;
  workingVector1.z = workingVector1.z * 0.600000024 + 0.400000006;
  workingVector2.y = workingVector2.x * workingVector1.z;
  workingVector1.z = workingVector2.x * workingVector2.x;
  workingVector1.z = workingVector1.z * 0.600000024 + 0.400000006;
  workingVector2.z = workingVector2.x * workingVector1.z;
  workingVector2.xyz = min(float3(1,1,1), workingVector2.xyz);
  workingVector2.xyz = workingVector0.www ? workingVector2.xyz : RD_UNIFORM_BLOCK_LIGHT_COLOR.xyz;
  workingVector2.xyz = float3(0.166666672,0.166666672,0.166666672) * workingVector2.xyz;
  workingVector2.w = 0.00392156886;
  workingVector1.zw = max(workingVector2.xy, workingVector2.zw);
#endif
  workingVector0.w = max(workingVector1.z, workingVector1.w);
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = ceil(workingVector0.w);
#if RD_FEATURE_TINTING == RD_ON
  workingVector2.w = 0.00392156886 * workingVector0.w;
  workingVector2.xyz = workingVector0.xyz / workingVector2.www;
  workingVector2.xyzw = saturate(workingVector2.xyzw);
  workingVector0.xyzw = float4(255,255,255,255) * workingVector2.xyzw;
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
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector3.w = 0.00392156886 * workingVector0.w;
  workingVector3.xyz = workingVector2.xyz / workingVector3.www;
  workingVector3.xyzw = saturate(workingVector3.xyzw);
  workingVector2.xyzw = float4(255,255,255,255) * workingVector3.xyzw;
  workingVector2.xyzw = (uint4)workingVector2.xyzw;
  fragmentColor0.yz = mad((int2)workingVector2.xz, int2(256,256), (int2)workingVector2.yw);
  workingVector0.w = 255 * RD_UNIFORM_BLOCK_LIGHT_COLOR.w;
  workingVector0.w = floor(workingVector0.w);
  workingVector0.w = (uint)workingVector0.w;
  workingVector1.zw = (int2)workingVector0.ww & int2(1,2);
  workingVector0.w = saturate(RD_UNIFORM_TILE_LIGHT_INTENSITY.y);
  workingVector0.w = 255 * workingVector0.w;
  workingVector0.w = (uint)workingVector0.w;
  workingVector1.zw = workingVector1.zw ? float2(3.58732407e-043,7.17464814e-043) : float2(0,0);
  workingVector0.w = (int)workingVector0.w + (int)workingVector1.z;
  fragmentColor0.w = (int)workingVector1.w + (int)workingVector0.w;
#endif
  workingVector1.xy = saturate(workingVector1.xy);
#if RD_FEATURE_TINTING == RD_ON
  workingVector0.xy = float2(255,255) * workingVector1.xy;
  workingVector0.xy = (uint2)workingVector0.xy;
  fragmentColor0.x = mad((int)workingVector0.x, 256, (int)workingVector0.y);
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.xy = float2(255,255) * workingVector1.xy;
  workingVector1.xy = (uint2)workingVector1.xy;
  fragmentColor0.x = mad((int)workingVector1.x, 256, (int)workingVector1.y);
  fragmentColor1.xyz = workingVector0.xyz;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(int(RD_UNIFORM_PBR_TEXTURE_FLAGS.x));
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_TINTING == RD_ON
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
#endif
    bool comparisonValue;
#if RD_FEATURE_TINTING == RD_ON
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))) > int(0u))
    {
        uint intermediateValue7;
        uint intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        intermediateValue7 = 0u;
        intermediateValue8 = 1u;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue2;
        intermediateValue11 = scalarValue3;
        float productValue;
        float productValue1;
        float productValue2;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue = intermediateValue7 + 36u;
            uint sumValue1 = intermediateValue7 + 29u;
            float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue].z * varyingTexCoord0.x) + fragmentConstants[sumValue].x, (fragmentConstants[sumValue].w * varyingTexCoord0.y) + fragmentConstants[sumValue].y));
            float productValue3 = sampledTextureValue1.w * fragmentConstants[sumValue1].w;
            productValue = (((sampledTextureValue1.x * fragmentConstants[sumValue1].x) - intermediateValue9) * productValue3) + intermediateValue9;
            productValue1 = (((sampledTextureValue1.y * fragmentConstants[sumValue1].y) - intermediateValue10) * productValue3) + intermediateValue10;
            productValue2 = (((sampledTextureValue1.z * fragmentConstants[sumValue1].z) - intermediateValue11) * productValue3) + intermediateValue11;
            comparisonValue2 = ((intermediateValue8 != 0u) && (productValue3 > 0.5f)) ? 0u : intermediateValue8;
            uint sumValue2 = intermediateValue7 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
            {
                intermediateValue7 = sumValue2;
                intermediateValue8 = comparisonValue2;
                intermediateValue9 = productValue;
                intermediateValue10 = productValue1;
                intermediateValue11 = productValue2;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue4 = productValue;
        intermediateValue5 = productValue1;
        intermediateValue6 = productValue2;
    }
    else
    {
        comparisonValue = true;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
        intermediateValue6 = scalarValue3;
    }
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
    bool comparisonValue3;
#endif
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue4 = floor(quotientValue1 * 0.25f);
        float productValue5 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
#if RD_FEATURE_TINTING == RD_ON
        comparisonValue3 = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue5 * productValue5) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue4 * productValue4) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)));
#elif RD_FEATURE_TINTING == RD_OFF
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue5 * productValue5) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue4 * productValue4) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)));
#endif
    }
    else
    {
#if RD_FEATURE_TINTING == RD_ON
        comparisonValue3 = false;
#elif RD_FEATURE_TINTING == RD_OFF
        comparisonValue = false;
#endif
    }
#if RD_FEATURE_TINTING == RD_ON
    if ((RD_UNIFORM_ACTOR_FP_EPSILON.x > 1.0f) || comparisonValue3)
#elif RD_FEATURE_TINTING == RD_OFF
    if ((sampledTextureValue.w < RD_UNIFORM_ACTOR_FP_EPSILON.x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_FEATURE_TINTING == RD_ON
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue1 & 1u) == 0u)
#elif RD_FEATURE_TINTING == RD_OFF
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue & 1u) == 0u)
#endif
    {
#if RD_FEATURE_TINTING == RD_ON
        intermediateValue13 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue14 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue15 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue16 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif RD_FEATURE_TINTING == RD_OFF
        intermediateValue2 = RD_UNIFORM_METALNESS_UNIFORM.x;
        intermediateValue3 = RD_UNIFORM_EMISSIVE_UNIFORM.x;
        intermediateValue4 = RD_UNIFORM_ROUGHNESS_UNIFORM.x;
        intermediateValue5 = RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
    else
    {
        float4 sampledTextureValue2 = mersTextureTexture.Sample(mersTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_TINTING == RD_ON
        intermediateValue13 = sampledTextureValue2.x;
        intermediateValue14 = sampledTextureValue2.y;
        intermediateValue15 = sampledTextureValue2.z;
        intermediateValue16 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue2.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#elif RD_FEATURE_TINTING == RD_OFF
        intermediateValue2 = sampledTextureValue2.x;
        intermediateValue3 = sampledTextureValue2.y;
        intermediateValue4 = sampledTextureValue2.z;
        intermediateValue5 = ((scalarValue & 2u) != 0u) ? sampledTextureValue2.w : RD_UNIFORM_SUBSURFACE_UNIFORM.x;
#endif
    }
    float sumValue3 = varyingTexCoord4.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue4 = varyingTexCoord4.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue5 = varyingTexCoord4.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue1 = rsqrt(dot(float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), float3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue1 * varyingNormal0.x;
    float productValue7 = inverseLengthValue1 * varyingNormal0.y;
    float productValue8 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0f / ((abs(productValue7) + abs(productValue6)) + abs(productValue8));
    float productValue9 = quotientValue2 * productValue6;
    float productValue10 = quotientValue2 * productValue7;
    bool conditionValue = productValue8 < 0.0f;
    float multiplyAddValue = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue1 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((RD_UNIFORM_TILE_LIGHT_INTENSITY.x > 9.9999997473787516355514526367188e-05f) && (((RD_UNIFORM_BLOCK_LIGHT_COLOR.x + RD_UNIFORM_BLOCK_LIGHT_COLOR.y) + RD_UNIFORM_BLOCK_LIGHT_COLOR.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue11 = RD_UNIFORM_TILE_LIGHT_INTENSITY.x * RD_UNIFORM_TILE_LIGHT_INTENSITY.x;
        clampedValue1 = clamp(productValue11, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue11 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue11, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue11 * productValue11) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue11, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = RD_UNIFORM_BLOCK_LIGHT_COLOR.x;
        clampedValue2 = RD_UNIFORM_BLOCK_LIGHT_COLOR.y;
        clampedValue3 = RD_UNIFORM_BLOCK_LIGHT_COLOR.z;
    }
    float productValue12 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue13 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue14 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue4 = ceil(clamp(max(max(productValue12, productValue14), max(productValue13, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    uint bitwiseValue = uint(floor(RD_UNIFORM_BLOCK_LIGHT_COLOR.w * 255.0f)) << 8u;
#if RD_FEATURE_TINTING == RD_ON
    fragmentColor0.x = ((uint(clamp(intermediateValue15, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue14, 0.0f, 1.0f) * 255.0f) & 255u);
#elif RD_FEATURE_TINTING == RD_OFF
    fragmentColor0.x = ((uint(clamp(intermediateValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue3, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.y = ((uint(clamp(productValue12 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue13 / clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue14 / clampedValue4, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue4, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.w = (uint(clamp(RD_UNIFORM_TILE_LIGHT_INTENSITY.y, 0.0f, 1.0f) * 255.0f) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
#if RD_FEATURE_TINTING == RD_ON
    fragmentColor1.x = intermediateValue4;
    fragmentColor1.y = intermediateValue5;
    fragmentColor1.z = intermediateValue6;
    fragmentColor1.w = (intermediateValue13 > intermediateValue16) ? ((intermediateValue13 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue16 * 0.4980392158031463623046875f));
#elif RD_FEATURE_TINTING == RD_OFF
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue5 * 0.4980392158031463623046875f));
#endif
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0f - abs(productValue9)) * ((productValue10 < 0.0f) ? (-1.0f) : 1.0f)) : productValue10;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue1)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue5, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue4, sumValue3 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue1)) * 0.5f;
    discardIfRequested();
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
