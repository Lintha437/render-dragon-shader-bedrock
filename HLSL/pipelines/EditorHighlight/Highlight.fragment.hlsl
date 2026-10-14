// EditorHighlight / Highlight / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/EditorHighlight/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_PLATFORM == RD_PLATFORM_SM40
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7,workingVector8,workingVector9,workingVector10,workingVector11,workingVector12;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  float4 workingVector0,workingVector1,workingVector2,workingVector3,workingVector4,workingVector5,workingVector6,workingVector7;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector3.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.yz = varyingTexCoord0.xy * float2(2,2) + float2(-1,-1);
  workingVector4.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector0.zzzz;
  workingVector4.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector0.yyyy + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector1.xxxx + workingVector4.xyzw;
  workingVector4.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.xyzw + workingVector4.xyzw;
  workingVector0.yzw = workingVector4.yzx / workingVector4.www;
  workingVector4.xyzw = RD_UNIFORM_CAMERA_POSITION.zyxz + workingVector0.zywz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.x = materialTexture4.Sample(textureSampler4, varyingTexCoord0.xy).x;
  workingVector0.y = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).x;
  workingVector1.xyzw = materialTexture3.Sample(textureSampler3, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.zw = varyingTexCoord0.xy * float2(2,2) + float2(-1,-1);
  workingVector3.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector0.wwww;
  workingVector3.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector0.zzzz + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector0.yyyy + workingVector3.xyzw;
  workingVector3.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.xyzw + workingVector3.xyzw;
  workingVector3.xyz = workingVector3.yzx / workingVector3.www;
  workingVector4.xyzw = RD_UNIFORM_CAMERA_POSITION.zyxz + workingVector3.yxzy;
#endif
  workingVector5.xyzw = RD_UNIFORM_SCREEN_SIZE.zwzw * float4(-1,0,0,-1) + varyingTexCoord0.xyxy;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector6.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.xy).xyzw;
  workingVector7.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.zw).xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.z = materialTexture1.Sample(textureSampler1, workingVector5.xy).x;
  workingVector0.w = materialTexture1.Sample(textureSampler1, workingVector5.zw).x;
#endif
  workingVector5.xyzw = workingVector5.xyzw * float4(2,2,2,2) + float4(-1,-1,-1,-1);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector8.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector5.yyyy;
  workingVector8.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector5.xxxx + workingVector8.xyzw;
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector6.xxxx + workingVector8.xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector5.yyyy;
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector5.xxxx + workingVector6.xyzw;
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector0.zzzz + workingVector6.xyzw;
#endif
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.xyzw + workingVector6.xyzw;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.yzw = workingVector6.zxy / workingVector6.www;
  workingVector6.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector5.wwww;
  workingVector5.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector5.zzzz + workingVector6.xyzw;
  workingVector5.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector7.xxxx + workingVector5.xyzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector6.xyz = workingVector6.zxy / workingVector6.www;
  workingVector7.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.xyzw * -workingVector5.wwww;
  workingVector5.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.xyzw * workingVector5.zzzz + workingVector7.xyzw;
  workingVector5.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.xyzw * workingVector0.wwww + workingVector5.xyzw;
#endif
  workingVector5.xyzw = RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.xyzw + workingVector5.xyzw;
  workingVector5.xyz = workingVector5.yzx / workingVector5.www;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.yzw = workingVector1.yzw + -workingVector0.zwy;
  workingVector0.yzw = workingVector5.xyz + -workingVector0.yzw;
  workingVector5.xyz = workingVector1.yzw * workingVector0.yzw;
  workingVector0.yzw = workingVector1.wyz * workingVector0.zwy + -workingVector5.xyz;
  workingVector1.y = dot(workingVector0.yzw, workingVector0.yzw);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector0.yzw = workingVector1.yyy * workingVector0.yzw;
  workingVector0.yzw = float3(10,10,10) * workingVector0.yzw;
  workingVector0.yzw = round(workingVector0.yzw);
  workingVector0.yzw = float3(0.100000001,0.100000001,0.100000001) * workingVector0.yzw;
  workingVector5.xyzw = workingVector4.xyzw * workingVector0.yyzz;
  workingVector0.yz = workingVector5.xy + workingVector5.zw;
  workingVector0.yz = workingVector4.zy * workingVector0.ww + workingVector0.yz;
  workingVector0.yz = workingVector0.yz / RD_UNIFORM_OVERLAY_TEXTURE_STRETCH.xx;
  workingVector0.yz = frac(workingVector0.yz);
  workingVector4.xyzw = materialTexture5.Sample(textureSampler5, workingVector0.yz).xyzw;
  workingVector0.yzw = workingVector4.xyz + -workingVector3.xyz;
  workingVector0.yzw = workingVector4.www * workingVector0.yzw + workingVector3.xyz;
  workingVector1.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector1.y != 0) {
    workingVector4.xyzw = materialTexture2.Load(float4(0,0,0,0)).xyzw;
    workingVector1.z = 0.180000007 / workingVector4.x;
    workingVector1.z = 9.99999975e-005 + workingVector1.z;
    workingVector2.xyz = workingVector2.xyz / workingVector1.zzz;
    workingVector0.yzw = workingVector0.yzw / workingVector1.zzz;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector6.xyz = workingVector6.xyz + -workingVector3.yzx;
  workingVector3.xyz = workingVector5.xyz + -workingVector3.xyz;
  workingVector5.xyz = workingVector6.xyz * workingVector3.xyz;
  workingVector3.xyz = workingVector6.zxy * workingVector3.yzx + -workingVector5.xyz;
  workingVector0.z = dot(workingVector3.xyz, workingVector3.xyz);
  workingVector0.z = rsqrt(workingVector0.z);
  workingVector3.xyz = workingVector3.xyz * workingVector0.zzz;
  workingVector3.xyz = float3(10,10,10) * workingVector3.xyz;
  workingVector3.xyz = round(workingVector3.xyz);
  workingVector3.xyz = float3(0.100000001,0.100000001,0.100000001) * workingVector3.xyz;
  workingVector5.xyzw = workingVector4.xyzw * workingVector3.xxyy;
  workingVector0.zw = workingVector5.xy + workingVector5.zw;
  workingVector0.zw = workingVector4.zy * workingVector3.zz + workingVector0.zw;
  workingVector0.zw = workingVector0.zw / RD_UNIFORM_OVERLAY_TEXTURE_STRETCH.xx;
  workingVector0.zw = frac(workingVector0.zw);
  workingVector3.xyzw = materialTexture5.Sample(textureSampler5, workingVector0.zw).xyzw;
  workingVector3.xyz = workingVector3.xyz + -workingVector2.xyz;
  workingVector2.xyz = workingVector3.www * workingVector3.xyz + workingVector2.xyz;
  workingVector0.z = RD_COMPARISON_MASK(0 != RD_UNIFORM_PRE_EXPOSURE_ENABLED.x);
  if (workingVector0.z != 0) {
    workingVector0.w = materialTexture2.Load(float4(0,0,0,0)).x;
    workingVector3.x = 0.180000007 / workingVector0.w;
    workingVector3.x = 9.99999975e-005 + workingVector3.x;
    workingVector1.xyz = workingVector1.xyz / workingVector3.xxx;
    workingVector2.xyz = workingVector2.xyz / workingVector3.xxx;
#endif
  } else {
#if RD_PLATFORM == RD_PLATFORM_SM40
    workingVector4.x = 1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    workingVector0.w = 1;
#endif
  }
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector1.zw = RD_UNIFORM_SCREEN_SIZE.zw * RD_UNIFORM_OUTLINE_WIDTH.xx;
  workingVector3.xy = -RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector5.xyzw = materialTexture0.Sample(textureSampler0, workingVector3.xy).xyzw;
  workingVector6.xyzw = workingVector1.zwzw * float4(-1,0,-1,1) + varyingTexCoord0.xyxy;
  workingVector7.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.xy).xyzw;
  workingVector6.xyzw = materialTexture0.Sample(textureSampler0, workingVector6.zw).xyzw;
  workingVector8.xyzw = workingVector1.zwzw * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector9.xyzw = materialTexture0.Sample(textureSampler0, workingVector8.xy).xyzw;
  workingVector8.xyzw = materialTexture0.Sample(textureSampler0, workingVector8.zw).xyzw;
  workingVector10.xyzw = workingVector1.zwzw * float4(1,-1,1,0) + varyingTexCoord0.xyxy;
  workingVector11.xyzw = materialTexture0.Sample(textureSampler0, workingVector10.xy).xyzw;
  workingVector10.xyzw = materialTexture0.Sample(textureSampler0, workingVector10.zw).xyzw;
  workingVector1.zw = RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector12.xyzw = materialTexture0.Sample(textureSampler0, workingVector1.zw).xyzw;
  workingVector3.x = ceil(workingVector5.w);
  workingVector3.y = ceil(workingVector7.w);
  workingVector3.z = ceil(workingVector6.w);
  workingVector1.z = dot(float3(1,2,1), workingVector3.xyz);
  workingVector5.x = ceil(workingVector11.w);
  workingVector5.y = ceil(workingVector10.w);
  workingVector5.z = ceil(workingVector12.w);
  workingVector1.w = dot(float3(-1,-2,-1), workingVector5.xyz);
  workingVector1.z = workingVector1.z + workingVector1.w;
  workingVector1.w = dot(float2(1,-1), workingVector3.xz);
  workingVector3.x = ceil(workingVector9.w);
  workingVector3.y = ceil(workingVector8.w);
  workingVector3.x = dot(float2(2,-2), workingVector3.xy);
  workingVector1.w = workingVector3.x + workingVector1.w;
  workingVector3.x = dot(float2(1,-1), workingVector5.xz);
  workingVector1.w = workingVector3.x + workingVector1.w;
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.z = workingVector1.z * workingVector1.z + workingVector1.w;
  workingVector1.z = sqrt(workingVector1.z);
  workingVector3.xyz = RD_UNIFORM_HIGHLIGHT_COLOR.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_HIGHLIGHT_COLOR.www * workingVector3.xyz + workingVector0.yzw;
  workingVector1.w = RD_UNIFORM_HIGHLIGHT_ALPHA.x * workingVector3.w;
  workingVector0.yzw = workingVector0.yzw + -workingVector2.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector2.xyz;
  workingVector1.z = RD_UNIFORM_OUTLINE_COLOR.w * workingVector1.z;
  workingVector3.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz + -workingVector0.yzw;
  workingVector0.yzw = workingVector1.zzz * workingVector3.xyz + workingVector0.yzw;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector3.xy = RD_UNIFORM_SCREEN_SIZE.zw * RD_UNIFORM_OUTLINE_WIDTH.xx;
  workingVector3.zw = -RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector3.z = materialTexture0.Sample(textureSampler0, workingVector3.zw).w;
  workingVector4.xyzw = workingVector3.xyxy * float4(-1,0,-1,1) + varyingTexCoord0.xyxy;
  workingVector3.w = materialTexture0.Sample(textureSampler0, workingVector4.xy).w;
  workingVector4.x = materialTexture0.Sample(textureSampler0, workingVector4.zw).w;
  workingVector5.xyzw = workingVector3.xyxy * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
  workingVector4.y = materialTexture0.Sample(textureSampler0, workingVector5.xy).w;
  workingVector4.z = materialTexture0.Sample(textureSampler0, workingVector5.zw).w;
  workingVector5.xyzw = workingVector3.xyxy * float4(1,-1,1,0) + varyingTexCoord0.xyxy;
  workingVector3.x = materialTexture0.Sample(textureSampler0, workingVector5.xy).w;
  workingVector3.y = materialTexture0.Sample(textureSampler0, workingVector5.zw).w;
  workingVector5.xy = RD_UNIFORM_OUTLINE_WIDTH.xx * RD_UNIFORM_SCREEN_SIZE.zw + varyingTexCoord0.xy;
  workingVector4.w = materialTexture0.Sample(textureSampler0, workingVector5.xy).w;
  workingVector5.xy = ceil(workingVector3.zw);
  workingVector5.z = ceil(workingVector4.x);
  workingVector3.z = dot(float3(1,2,1), workingVector5.xyz);
  workingVector6.xy = ceil(workingVector3.xy);
  workingVector6.z = ceil(workingVector4.w);
  workingVector3.x = dot(float3(-1,-2,-1), workingVector6.xyz);
  workingVector3.x = workingVector3.z + workingVector3.x;
  workingVector3.y = dot(float2(1,-1), workingVector5.xz);
  workingVector4.x = ceil(workingVector4.y);
  workingVector4.y = ceil(workingVector4.z);
  workingVector3.z = dot(float2(2,-2), workingVector4.xy);
  workingVector3.y = workingVector3.y + workingVector3.z;
  workingVector3.z = dot(float2(1,-1), workingVector6.xz);
  workingVector3.y = workingVector3.y + workingVector3.z;
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.x = workingVector3.x * workingVector3.x + workingVector3.y;
  workingVector3.x = sqrt(workingVector3.x);
  workingVector3.yzw = RD_UNIFORM_HIGHLIGHT_COLOR.xyz + -workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_HIGHLIGHT_COLOR.www * workingVector3.yzw + workingVector2.xyz;
  workingVector2.w = RD_UNIFORM_HIGHLIGHT_ALPHA.x * workingVector2.w;
  workingVector2.xyz = workingVector2.xyz + -workingVector1.xyz;
  workingVector2.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
  workingVector2.w = RD_UNIFORM_OUTLINE_COLOR.w * workingVector3.x;
  workingVector3.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz + -workingVector2.xyz;
  workingVector2.xyz = workingVector2.www * workingVector3.xyz + workingVector2.xyz;
#endif
  workingVector3.xyzw = RD_UNIFORM_SCREEN_SIZE.zwzw * RD_UNIFORM_BLOCK_EDGE_THICKNESS.xxxx;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector5.xyzw = workingVector3.zwzw * float4(-1,0,1,0) + varyingTexCoord0.xyxy;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector4.xyzw = workingVector3.zwzw * float4(-1,0,1,0) + varyingTexCoord0.xyxy;
#endif
  workingVector3.xyzw = workingVector3.xyzw * float4(0,-1,0,1) + varyingTexCoord0.xyxy;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector6.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.xy).xyzw;
  workingVector5.xyzw = materialTexture1.Sample(textureSampler1, workingVector5.zw).xyzw;
  workingVector7.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.xy).xyzw;
  workingVector3.xyzw = materialTexture1.Sample(textureSampler1, workingVector3.zw).xyzw;
  workingVector8.y = workingVector1.x * 9999 + 1;
  workingVector8.x = workingVector6.x * 9999 + 1;
  workingVector8.z = workingVector5.x * 9999 + 1;
  workingVector5.x = workingVector7.x * 9999 + 1;
  workingVector5.z = workingVector3.x * 9999 + 1;
  workingVector1.w = dot(float3(-1,2,-1), workingVector8.xyz);
  workingVector5.y = workingVector8.y;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector4.x = materialTexture1.Sample(textureSampler1, workingVector4.xy).x;
  workingVector4.y = materialTexture1.Sample(textureSampler1, workingVector4.zw).x;
  workingVector3.x = materialTexture1.Sample(textureSampler1, workingVector3.xy).x;
  workingVector3.y = materialTexture1.Sample(textureSampler1, workingVector3.zw).x;
  workingVector5.y = workingVector0.y * 9999 + 1;
  workingVector5.x = workingVector4.x * 9999 + 1;
  workingVector5.z = workingVector4.y * 9999 + 1;
  workingVector4.x = workingVector3.x * 9999 + 1;
  workingVector4.z = workingVector3.y * 9999 + 1;
#endif
  workingVector3.x = dot(float3(-1,2,-1), workingVector5.xyz);
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector3.x = workingVector3.x * workingVector3.x;
  workingVector1.w = workingVector1.w * workingVector1.w + workingVector3.x;
  workingVector1.w = sqrt(workingVector1.w);
  workingVector1.w = RD_COMPARISON_MASK(0.00999999978 < workingVector1.w);
  workingVector1.w = workingVector1.w ? 1.000000 : 0;
  workingVector1.w = RD_UNIFORM_BLOCK_EDGE_COLOR.w * workingVector1.w;
  workingVector3.xyz = RD_UNIFORM_BLOCK_EDGE_COLOR.xyz + -workingVector0.yzw;
  workingVector3.xyz = workingVector1.www * workingVector3.xyz + workingVector0.yzw;
  workingVector0.yz = float2(1.19999996e-007,-1.19999996e-007) + workingVector1.xx;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.y < 1);
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.z);
  workingVector5.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz;
  workingVector5.w = workingVector2.w;
  workingVector6.xyzw = workingVector5.xyzw + -workingVector2.xyzw;
  workingVector6.xyzw = workingVector1.zzzz * workingVector6.xyzw + workingVector2.xyzw;
  workingVector1.xzw = -workingVector6.xyz + workingVector3.xyz;
  workingVector6.xyz = RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.xxx * workingVector1.xzw + workingVector6.xyz;
  workingVector3.w = workingVector5.w;
  workingVector3.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector6.xyzw;
  workingVector0.xyzw = workingVector0.yyyy ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector1.x = 0.180000007 / workingVector4.x;
  workingVector1.x = 9.99999975e-005 + workingVector1.x;
  workingVector1.xzw = workingVector1.xxx * workingVector0.xyz;
  fragmentColor0.xyz = workingVector1.yyy ? workingVector1.xzw : workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector4.y = workingVector5.y;
  workingVector3.y = dot(float3(-1,2,-1), workingVector4.xyz);
  workingVector3.y = workingVector3.y * workingVector3.y;
  workingVector3.x = workingVector3.x * workingVector3.x + workingVector3.y;
  workingVector3.x = sqrt(workingVector3.x);
  workingVector3.x = RD_COMPARISON_MASK(0.00999999978 < workingVector3.x);
  workingVector3.x = workingVector3.x ? 1.000000 : 0;
  workingVector3.x = RD_UNIFORM_BLOCK_EDGE_COLOR.w * workingVector3.x;
  workingVector3.yzw = RD_UNIFORM_BLOCK_EDGE_COLOR.xyz + -workingVector2.xyz;
  workingVector3.xyz = workingVector3.xxx * workingVector3.yzw + workingVector2.xyz;
  workingVector2.xy = float2(1.19999996e-007,-1.19999996e-007) + workingVector0.yy;
  workingVector0.y = RD_COMPARISON_MASK(workingVector2.x < 1);
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector2.y);
  workingVector4.xyz = RD_UNIFORM_OUTLINE_COLOR.xyz;
  workingVector4.w = workingVector1.w;
  workingVector5.xyzw = workingVector4.xyzw + -workingVector1.xyzw;
  workingVector2.xyzw = workingVector2.wwww * workingVector5.xyzw + workingVector1.xyzw;
  workingVector4.xyz = workingVector3.xyz + -workingVector2.xyz;
  workingVector2.xyz = RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.xxx * workingVector4.xyz + workingVector2.xyz;
  workingVector3.w = workingVector4.w;
  workingVector2.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector1.xyzw = workingVector0.yyyy ? workingVector2.xyzw : workingVector1.xyzw;
  workingVector0.x = 0.180000007 / workingVector0.w;
  workingVector0.x = 9.99999975e-005 + workingVector0.x;
  workingVector0.xyw = workingVector1.xyz * workingVector0.xxx;
  fragmentColor0.xyz = workingVector0.zzz ? workingVector0.xyw : workingVector1.xyz;
  fragmentColor0.w = workingVector1.w;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = sceneTextureDepthTexture.Sample(sceneTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float4 sampledTextureValue2 = sceneTextureColorTexture.Sample(sceneTextureColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.x;
    float scalarValue2 = sampledTextureValue2.y;
    float scalarValue3 = sampledTextureValue2.z;
    float4 sampledTextureValue3 = highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue3.x;
    float scalarValue5 = sampledTextureValue3.y;
    float scalarValue6 = sampledTextureValue3.z;
    float productValue = (varyingTexCoord0.x * 2.0f) + (-1.0f);
    float productValue1 = (-0.0f) - ((varyingTexCoord0.y * 2.0f) + (-1.0f));
    float multiplyAddValue = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.x, productValue1, RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.x * productValue);
    float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.y, productValue1, RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.y * productValue);
    float multiplyAddValue2 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.z, productValue1, RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.z * productValue);
    float multiplyAddValue3 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.w, productValue1, RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.w * productValue);
    float multiplyAddValue4 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.w, scalarValue, multiplyAddValue3) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.w;
    float multiplyAddValue5 = RD_UNIFORM_CAMERA_POSITION.z + ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.z, scalarValue, multiplyAddValue2) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.z) / multiplyAddValue4);
    float sumValue = varyingTexCoord0.x - RD_UNIFORM_SCREEN_SIZE.z;
    float sumValue1 = varyingTexCoord0.y - RD_UNIFORM_SCREEN_SIZE.w;
    float4 sampledTextureValue4 = highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(sumValue, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.x;
    float4 sampledTextureValue5 = highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.x;
    float4 sampledTextureValue6 = highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, sumValue1));
    float scalarValue9 = sampledTextureValue6.x;
    float productValue2 = (sumValue * 2.0f) + (-1.0f);
    float productValue3 = (-0.0f) - ((varyingTexCoord0.y * 2.0f) + (-1.0f));
    float multiplyAddValue6 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.w, scalarValue7, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.w, productValue3, productValue2 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.w)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.w;
    float multiplyAddValue7 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.w, scalarValue8, multiplyAddValue3) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.w;
    float multiplyAddValue8 = (mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.x, scalarValue8, multiplyAddValue) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.x) / multiplyAddValue7;
    float multiplyAddValue9 = (mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.y, scalarValue8, multiplyAddValue1) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.y) / multiplyAddValue7;
    float multiplyAddValue10 = (mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.z, scalarValue8, multiplyAddValue2) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.z) / multiplyAddValue7;
    float productValue4 = (varyingTexCoord0.x * 2.0f) + (-1.0f);
    float productValue5 = (-0.0f) - ((sumValue1 * 2.0f) + (-1.0f));
    float multiplyAddValue11 = mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.w, scalarValue9, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.w, productValue5, productValue4 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.w)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.w;
    float multiplyAddValue12 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.x, scalarValue7, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.x, productValue3, productValue2 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.x)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.x) / multiplyAddValue6) - multiplyAddValue8;
    float multiplyAddValue13 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.y, scalarValue7, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.y, productValue3, productValue2 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.y)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.y) / multiplyAddValue6) - multiplyAddValue9;
    float multiplyAddValue14 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.z, scalarValue7, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.z, productValue3, productValue2 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.z)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.z) / multiplyAddValue6) - multiplyAddValue10;
    float multiplyAddValue15 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.x, scalarValue9, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.x, productValue5, productValue4 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.x)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.x) / multiplyAddValue11) - multiplyAddValue8;
    float multiplyAddValue16 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.y, scalarValue9, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.y, productValue5, productValue4 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.y)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.y) / multiplyAddValue11) - multiplyAddValue9;
    float multiplyAddValue17 = ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.z, scalarValue9, mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_1.z, productValue5, productValue4 * RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_0.z)) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.z) / multiplyAddValue11) - multiplyAddValue10;
    float productValue6 = (multiplyAddValue17 * multiplyAddValue13) - (multiplyAddValue16 * multiplyAddValue14);
    float productValue7 = (multiplyAddValue15 * multiplyAddValue14) - (multiplyAddValue17 * multiplyAddValue12);
    float productValue8 = (multiplyAddValue16 * multiplyAddValue12) - (multiplyAddValue15 * multiplyAddValue13);
    float inverseLengthValue = rsqrt(dot(float3(productValue6, productValue7, productValue8), float3(productValue6, productValue7, productValue8))) * 10.0f;
    float productValue9 = round(inverseLengthValue * productValue6);
    float productValue10 = round(inverseLengthValue * productValue7);
    float productValue11 = round(inverseLengthValue * productValue8);
    float4 sampledTextureValue7 = selectedBlocksOverlayTextureTexture.Sample(selectedBlocksOverlayTextureSampler, float2(frac(((((productValue11 + productValue10) * (RD_UNIFORM_CAMERA_POSITION.x + ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.x, scalarValue, multiplyAddValue) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.x) / multiplyAddValue4))) + (productValue9 * multiplyAddValue5)) * 0.100000001490116119384765625f) / RD_UNIFORM_OVERLAY_TEXTURE_STRETCH.x), frac(((((productValue11 + productValue9) * (RD_UNIFORM_CAMERA_POSITION.y + ((mad(RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_2.y, scalarValue, multiplyAddValue1) + RD_UNIFORM_INVERSE_PROJ_VIEW_ROW_3.y) / multiplyAddValue4))) + (productValue10 * multiplyAddValue5)) * 0.100000001490116119384765625f) / RD_UNIFORM_OVERLAY_TEXTURE_STRETCH.x)));
    float scalarValue10 = sampledTextureValue7.w;
    float productValue12 = ((sampledTextureValue7.x - scalarValue4) * scalarValue10) + scalarValue4;
    float productValue13 = ((sampledTextureValue7.y - scalarValue5) * scalarValue10) + scalarValue5;
    float productValue14 = ((sampledTextureValue7.z - scalarValue6) * scalarValue10) + scalarValue6;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    float quotientValue4;
    float quotientValue5;
    float quotientValue6;
    float intermediateValue12;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x != 0.0f)
    {
        float4 loadedBufferValue = previousFrameAverageLuminanceTexture.Load(int3(uint2(0u, 0u), 0u));
        float scalarValue11 = loadedBufferValue.x;
        float quotientValue = (0.180000007152557373046875f / scalarValue11) + 9.9999997473787516355514526367188e-05f;
        quotientValue1 = scalarValue1 / quotientValue;
        quotientValue2 = scalarValue2 / quotientValue;
        quotientValue3 = scalarValue3 / quotientValue;
        quotientValue4 = productValue12 / quotientValue;
        quotientValue5 = productValue13 / quotientValue;
        quotientValue6 = productValue14 / quotientValue;
        intermediateValue12 = scalarValue11;
    }
    else
    {
        quotientValue1 = scalarValue1;
        quotientValue2 = scalarValue2;
        quotientValue3 = scalarValue3;
        quotientValue4 = productValue12;
        quotientValue5 = productValue13;
        quotientValue6 = productValue14;
        intermediateValue12 = 1.0f;
    }
    float productValue15 = RD_UNIFORM_SCREEN_SIZE.z * RD_UNIFORM_OUTLINE_WIDTH.x;
    float productValue16 = RD_UNIFORM_SCREEN_SIZE.w * RD_UNIFORM_OUTLINE_WIDTH.x;
    float sumValue2 = varyingTexCoord0.x - productValue15;
    float sumValue3 = varyingTexCoord0.y - productValue16;
    float sumValue4 = productValue16 + varyingTexCoord0.y;
    float sumValue5 = productValue15 + varyingTexCoord0.x;
    float sampledTextureValue8 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue2, sumValue3)).w);
    float sampledTextureValue9 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue2, varyingTexCoord0.y)).w);
    float sampledTextureValue10 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue2, sumValue4)).w);
    float sampledTextureValue11 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, sumValue3)).w);
    float sampledTextureValue12 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(varyingTexCoord0.x, sumValue4)).w);
    float sampledTextureValue13 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue5, sumValue3)).w);
    float sampledTextureValue14 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue5, varyingTexCoord0.y)).w);
    float sampledTextureValue15 = ceil(highlightTextureColorTexture.Sample(highlightTextureColorSampler, float2(sumValue5, sumValue4)).w);
    float dotProductValue = (dot(0.0f.xxx, float3(sampledTextureValue11, 0.0f, sampledTextureValue12)) + dot(float3(1.0f, 2.0f, 1.0f), float3(sampledTextureValue8, sampledTextureValue9, sampledTextureValue10))) + dot(float3(-1.0f, -2.0f, -1.0f), float3(sampledTextureValue13, sampledTextureValue14, sampledTextureValue15));
    float dotProductValue1 = (dot(float3(2.0f, 0.0f, -2.0f), float3(sampledTextureValue11, 0.0f, sampledTextureValue12)) + dot(float3(1.0f, 0.0f, -1.0f), float3(sampledTextureValue8, sampledTextureValue9, sampledTextureValue10))) + dot(float3(1.0f, 0.0f, -1.0f), float3(sampledTextureValue13, sampledTextureValue14, sampledTextureValue15));
    float nonlinearValue = sqrt((dotProductValue1 * dotProductValue1) + (dotProductValue * dotProductValue));
    float productValue17 = RD_UNIFORM_HIGHLIGHT_ALPHA.x * sampledTextureValue3.w;
    float productValue18 = (((quotientValue4 - quotientValue1) + ((RD_UNIFORM_HIGHLIGHT_COLOR.x - quotientValue4) * RD_UNIFORM_HIGHLIGHT_COLOR.w)) * productValue17) + quotientValue1;
    float productValue19 = (((quotientValue5 - quotientValue2) + ((RD_UNIFORM_HIGHLIGHT_COLOR.y - quotientValue5) * RD_UNIFORM_HIGHLIGHT_COLOR.w)) * productValue17) + quotientValue2;
    float productValue20 = (((quotientValue6 - quotientValue3) + ((RD_UNIFORM_HIGHLIGHT_COLOR.z - quotientValue6) * RD_UNIFORM_HIGHLIGHT_COLOR.w)) * productValue17) + quotientValue3;
    float productValue21 = RD_UNIFORM_OUTLINE_COLOR.w * nonlinearValue;
    float productValue22 = ((RD_UNIFORM_OUTLINE_COLOR.x - productValue18) * productValue21) + productValue18;
    float productValue23 = ((RD_UNIFORM_OUTLINE_COLOR.y - productValue19) * productValue21) + productValue19;
    float productValue24 = ((RD_UNIFORM_OUTLINE_COLOR.z - productValue20) * productValue21) + productValue20;
    float productValue25 = RD_UNIFORM_SCREEN_SIZE.z * RD_UNIFORM_BLOCK_EDGE_THICKNESS.x;
    float productValue26 = RD_UNIFORM_SCREEN_SIZE.w * RD_UNIFORM_BLOCK_EDGE_THICKNESS.x;
    float sampledTextureValue16 = (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0f) + 1.0f;
    float sampledTextureValue17 = dot(float3(-1.0f, 2.0f, -1.0f), float3((highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x - productValue25, varyingTexCoord0.y)).x * 9999.0f) + 1.0f, sampledTextureValue16, (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(productValue25 + varyingTexCoord0.x, varyingTexCoord0.y)).x * 9999.0f) + 1.0f));
    float sampledTextureValue18 = dot(float3(-1.0f, 2.0f, -1.0f), float3((highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y - productValue26)).x * 9999.0f) + 1.0f, sampledTextureValue16, (highlightTextureDepthTexture.Sample(highlightTextureDepthSampler, float2(varyingTexCoord0.x, productValue26 + varyingTexCoord0.y)).x * 9999.0f) + 1.0f));
    float nonlinearValue1 = float(sqrt((sampledTextureValue18 * sampledTextureValue18) + (sampledTextureValue17 * sampledTextureValue17)) > 0.00999999977648258209228515625f) * RD_UNIFORM_BLOCK_EDGE_COLOR.w;
    float productValue27 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.x - productValue22) * nonlinearValue1) + productValue22;
    float productValue28 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.y - productValue23) * nonlinearValue1) + productValue23;
    float productValue29 = ((RD_UNIFORM_BLOCK_EDGE_COLOR.z - productValue24) * nonlinearValue1) + productValue24;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue + 1.1999999571798980468884110450745e-07f) < 1.0f)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (!((scalarValue + (-1.1999999571798980468884110450745e-07f)) <= sampledTextureValue.x))
        {
            float productValue30 = RD_UNIFORM_OUTLINE_COLOR.w * nonlinearValue;
            float productValue31 = ((RD_UNIFORM_OUTLINE_COLOR.x - quotientValue1) * productValue30) + quotientValue1;
            float productValue32 = ((RD_UNIFORM_OUTLINE_COLOR.y - quotientValue2) * productValue30) + quotientValue2;
            float productValue33 = ((RD_UNIFORM_OUTLINE_COLOR.z - quotientValue3) * productValue30) + quotientValue3;
            branchMergedValue = ((productValue27 - productValue31) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue31;
            branchMergedValue1 = ((productValue28 - productValue32) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue32;
            branchMergedValue2 = ((productValue29 - productValue33) * RD_UNIFORM_HIDDEN_BLOCKS_ALPHA.x) + productValue33;
        }
        else
        {
            branchMergedValue = productValue27;
            branchMergedValue1 = productValue28;
            branchMergedValue2 = productValue29;
        }
        intermediateValue13 = branchMergedValue;
        intermediateValue14 = branchMergedValue1;
        intermediateValue15 = branchMergedValue2;
    }
    else
    {
        intermediateValue13 = quotientValue1;
        intermediateValue14 = quotientValue2;
        intermediateValue15 = quotientValue3;
    }
    float productValue34;
    float productValue35;
    float productValue36;
    if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x != 0.0f)
    {
        float quotientValue7 = (0.180000007152557373046875f / intermediateValue12) + 9.9999997473787516355514526367188e-05f;
        productValue34 = quotientValue7 * intermediateValue13;
        productValue35 = quotientValue7 * intermediateValue14;
        productValue36 = quotientValue7 * intermediateValue15;
    }
    else
    {
        productValue34 = intermediateValue13;
        productValue35 = intermediateValue14;
        productValue36 = intermediateValue15;
    }
    fragmentColor0.x = productValue34;
    fragmentColor0.y = productValue35;
    fragmentColor0.z = productValue36;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
