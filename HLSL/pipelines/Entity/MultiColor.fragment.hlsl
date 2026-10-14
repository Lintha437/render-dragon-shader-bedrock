// Entity / MultiColor / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 60
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 98
#endif


#include "../../include/materials/Entity/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord2 : TEXCOORD2,
  float4 varyingColor3 : COLOR3,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector1.w;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector1.w;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector1.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector2.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR2.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector1.w;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = ((RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = ((RD_UNIFORM_MAT_COLOR2.x - productValue) * RD_UNIFORM_MAT_COLOR2.w) + productValue;
    float productValue4 = ((RD_UNIFORM_MAT_COLOR2.y - productValue1) * RD_UNIFORM_MAT_COLOR2.w) + productValue1;
    float productValue5 = ((RD_UNIFORM_MAT_COLOR2.z - productValue2) * RD_UNIFORM_MAT_COLOR2.w) + productValue2;
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor3.x;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor3.y;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue = ((RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue9 = ((sampledTextureValue.x - productValue) * scalarValue) + productValue;
    float productValue10 = ((sampledTextureValue.y - productValue1) * scalarValue) + productValue1;
    float productValue11 = ((sampledTextureValue.z - productValue2) * scalarValue) + productValue2;
    float productValue12 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue9) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue9) * varyingColor3.x;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.y;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.y = ((varyingColor2.y - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.z = ((varyingColor2.z - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue15 = (RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue16 = (RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue17 = (RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue18 = (productValue15 + RD_UNIFORM_MAT_COLOR0.x) - (productValue15 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue19 = (productValue16 + RD_UNIFORM_MAT_COLOR0.y) - (productValue16 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue20 = (productValue17 + RD_UNIFORM_MAT_COLOR0.z) - (productValue17 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.x;
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * varyingColor3.y;
    float productValue23 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.y = ((varyingColor2.y - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.z = ((varyingColor2.z - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = ((RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue24 = ((RD_UNIFORM_MAT_COLOR1.x - productValue) * RD_UNIFORM_MAT_COLOR1.w) + productValue;
    float productValue25 = ((RD_UNIFORM_MAT_COLOR1.y - productValue1) * RD_UNIFORM_MAT_COLOR1.w) + productValue1;
    float productValue26 = ((RD_UNIFORM_MAT_COLOR1.z - productValue2) * RD_UNIFORM_MAT_COLOR1.w) + productValue2;
    float productValue27 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor3.x;
    float productValue28 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor3.y;
    float productValue29 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.y = ((varyingColor2.y - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.z = ((varyingColor2.z - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float productValue30 = ((sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue31 = ((sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue32 = ((sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue33 = ((RD_UNIFORM_MAT_COLOR2.x - productValue30) * RD_UNIFORM_MAT_COLOR2.w) + productValue30;
    float productValue34 = ((RD_UNIFORM_MAT_COLOR2.y - productValue31) * RD_UNIFORM_MAT_COLOR2.w) + productValue31;
    float productValue35 = ((RD_UNIFORM_MAT_COLOR2.z - productValue32) * RD_UNIFORM_MAT_COLOR2.w) + productValue32;
    float productValue36 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.x;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.y;
    float productValue38 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue35) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue35) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.y = ((varyingColor2.y - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.z = ((varyingColor2.z - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue30 = ((sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue31 = ((sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue32 = ((sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue39 = ((sampledTextureValue.x - productValue30) * scalarValue) + productValue30;
    float productValue40 = ((sampledTextureValue.y - productValue31) * scalarValue) + productValue31;
    float productValue41 = ((sampledTextureValue.z - productValue32) * scalarValue) + productValue32;
    float productValue42 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue39) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue39) * varyingColor3.x;
    float productValue43 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue40) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue40) * varyingColor3.y;
    float productValue44 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue41) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue41) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.y = ((varyingColor2.y - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.z = ((varyingColor2.z - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float productValue45 = (sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue1;
    float productValue46 = (sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue1;
    float productValue47 = (sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue1;
    float productValue48 = (productValue45 + RD_UNIFORM_MAT_COLOR0.x) - (productValue45 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue49 = (productValue46 + RD_UNIFORM_MAT_COLOR0.y) - (productValue46 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue50 = (productValue47 + RD_UNIFORM_MAT_COLOR0.z) - (productValue47 * RD_UNIFORM_MAT_COLOR0.w);
    float productValue51 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue48) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue48) * varyingColor3.x;
    float productValue52 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue49) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue49) * varyingColor3.y;
    float productValue53 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue50) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue50) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.y = ((varyingColor2.y - productValue52) * varyingColor2.w) + productValue52;
    fragmentColor0.z = ((varyingColor2.z - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue1 = sampledTextureValue1.w;
    float productValue54 = ((scalarValue2 - RD_UNIFORM_MAT_COLOR0.x) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue55 = ((scalarValue3 - RD_UNIFORM_MAT_COLOR0.y) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue56 = ((scalarValue4 - RD_UNIFORM_MAT_COLOR0.z) * scalarValue1) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue57 = ((scalarValue2 - productValue54) * scalarValue1) + productValue54;
    float productValue58 = ((scalarValue3 - productValue55) * scalarValue1) + productValue55;
    float productValue59 = ((scalarValue4 - productValue56) * scalarValue1) + productValue56;
    float productValue60 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue57) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue57) * varyingColor3.x;
    float productValue61 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58) * varyingColor3.y;
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue60) * varyingColor2.w) + productValue60;
    fragmentColor0.y = ((varyingColor2.y - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.z = ((varyingColor2.z - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue63 = ((RD_UNIFORM_MAT_COLOR2.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR2.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue64 = ((RD_UNIFORM_MAT_COLOR2.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR2.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue65 = ((RD_UNIFORM_MAT_COLOR2.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR2.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue66 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue63) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue63) * varyingColor3.x;
    float productValue67 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue64) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue64) * varyingColor3.y;
    float productValue68 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue65) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue65) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue66) * varyingColor2.w) + productValue66;
    fragmentColor0.y = ((varyingColor2.y - productValue67) * varyingColor2.w) + productValue67;
    fragmentColor0.z = ((varyingColor2.z - productValue68) * varyingColor2.w) + productValue68;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue69 = ((sampledTextureValue.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue70 = ((sampledTextureValue.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue71 = ((sampledTextureValue.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) * varyingColor3.x;
    float productValue73 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue70) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue70) * varyingColor3.y;
    float productValue74 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue71) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue71) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.y = ((varyingColor2.y - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.z = ((varyingColor2.z - productValue74) * varyingColor2.w) + productValue74;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float productValue75 = ((RD_UNIFORM_MAT_COLOR1.x - scalarValue5) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue5;
    float productValue76 = ((RD_UNIFORM_MAT_COLOR1.y - scalarValue6) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue6;
    float productValue77 = ((RD_UNIFORM_MAT_COLOR1.z - scalarValue7) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue7;
    float productValue78 = ((RD_UNIFORM_MAT_COLOR2.x - productValue75) * RD_UNIFORM_MAT_COLOR2.w) + productValue75;
    float productValue79 = ((RD_UNIFORM_MAT_COLOR2.y - productValue76) * RD_UNIFORM_MAT_COLOR2.w) + productValue76;
    float productValue80 = ((RD_UNIFORM_MAT_COLOR2.z - productValue77) * RD_UNIFORM_MAT_COLOR2.w) + productValue77;
    float productValue81 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78) * varyingColor3.x;
    float productValue82 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue79) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue79) * varyingColor3.y;
    float productValue83 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue80) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue80) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue81) * varyingColor2.w) + productValue81;
    fragmentColor0.y = ((varyingColor2.y - productValue82) * varyingColor2.w) + productValue82;
    fragmentColor0.z = ((varyingColor2.z - productValue83) * varyingColor2.w) + productValue83;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue75 = ((RD_UNIFORM_MAT_COLOR1.x - scalarValue5) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue5;
    float productValue76 = ((RD_UNIFORM_MAT_COLOR1.y - scalarValue6) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue6;
    float productValue77 = ((RD_UNIFORM_MAT_COLOR1.z - scalarValue7) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue7;
    float productValue84 = ((sampledTextureValue.x - productValue75) * scalarValue) + productValue75;
    float productValue85 = ((sampledTextureValue.y - productValue76) * scalarValue) + productValue76;
    float productValue86 = ((sampledTextureValue.z - productValue77) * scalarValue) + productValue77;
    float productValue87 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue84) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue84) * varyingColor3.x;
    float productValue88 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue85) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue85) * varyingColor3.y;
    float productValue89 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue86) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue86) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue87) * varyingColor2.w) + productValue87;
    fragmentColor0.y = ((varyingColor2.y - productValue88) * varyingColor2.w) + productValue88;
    fragmentColor0.z = ((varyingColor2.z - productValue89) * varyingColor2.w) + productValue89;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float productValue90 = (RD_UNIFORM_MAT_COLOR1.x - scalarValue5) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue91 = (RD_UNIFORM_MAT_COLOR1.y - scalarValue6) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue92 = (RD_UNIFORM_MAT_COLOR1.z - scalarValue7) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue93 = (productValue90 + scalarValue5) - (productValue90 * scalarValue8);
    float productValue94 = (productValue91 + scalarValue6) - (productValue91 * scalarValue8);
    float productValue95 = (productValue92 + scalarValue7) - (productValue92 * scalarValue8);
    float productValue96 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue93) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue93) * varyingColor3.x;
    float productValue97 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue94) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue94) * varyingColor3.y;
    float productValue98 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue95) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue95) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue96) * varyingColor2.w) + productValue96;
    fragmentColor0.y = ((varyingColor2.y - productValue97) * varyingColor2.w) + productValue97;
    fragmentColor0.z = ((varyingColor2.z - productValue98) * varyingColor2.w) + productValue98;
    fragmentColor0.w = scalarValue8;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float productValue75 = ((RD_UNIFORM_MAT_COLOR1.x - scalarValue5) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue5;
    float productValue76 = ((RD_UNIFORM_MAT_COLOR1.y - scalarValue6) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue6;
    float productValue77 = ((RD_UNIFORM_MAT_COLOR1.z - scalarValue7) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue7;
    float productValue99 = ((RD_UNIFORM_MAT_COLOR1.x - productValue75) * RD_UNIFORM_MAT_COLOR1.w) + productValue75;
    float productValue100 = ((RD_UNIFORM_MAT_COLOR1.y - productValue76) * RD_UNIFORM_MAT_COLOR1.w) + productValue76;
    float productValue101 = ((RD_UNIFORM_MAT_COLOR1.z - productValue77) * RD_UNIFORM_MAT_COLOR1.w) + productValue77;
    float productValue102 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue99) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue99) * varyingColor3.x;
    float productValue103 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue100) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue100) * varyingColor3.y;
    float productValue104 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue101) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue101) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue102) * varyingColor2.w) + productValue102;
    fragmentColor0.y = ((varyingColor2.y - productValue103) * varyingColor2.w) + productValue103;
    fragmentColor0.z = ((varyingColor2.z - productValue104) * varyingColor2.w) + productValue104;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float productValue105 = ((sampledTextureValue1.x - scalarValue5) * scalarValue1) + scalarValue5;
    float productValue106 = ((sampledTextureValue1.y - scalarValue6) * scalarValue1) + scalarValue6;
    float productValue107 = ((sampledTextureValue1.z - scalarValue7) * scalarValue1) + scalarValue7;
    float productValue108 = ((RD_UNIFORM_MAT_COLOR2.x - productValue105) * RD_UNIFORM_MAT_COLOR2.w) + productValue105;
    float productValue109 = ((RD_UNIFORM_MAT_COLOR2.y - productValue106) * RD_UNIFORM_MAT_COLOR2.w) + productValue106;
    float productValue110 = ((RD_UNIFORM_MAT_COLOR2.z - productValue107) * RD_UNIFORM_MAT_COLOR2.w) + productValue107;
    float productValue111 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue108) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue108) * varyingColor3.x;
    float productValue112 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109) * varyingColor3.y;
    float productValue113 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue110) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue110) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue111) * varyingColor2.w) + productValue111;
    fragmentColor0.y = ((varyingColor2.y - productValue112) * varyingColor2.w) + productValue112;
    fragmentColor0.z = ((varyingColor2.z - productValue113) * varyingColor2.w) + productValue113;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue105 = ((sampledTextureValue1.x - scalarValue5) * scalarValue1) + scalarValue5;
    float productValue106 = ((sampledTextureValue1.y - scalarValue6) * scalarValue1) + scalarValue6;
    float productValue107 = ((sampledTextureValue1.z - scalarValue7) * scalarValue1) + scalarValue7;
    float productValue114 = ((sampledTextureValue.x - productValue105) * scalarValue) + productValue105;
    float productValue115 = ((sampledTextureValue.y - productValue106) * scalarValue) + productValue106;
    float productValue116 = ((sampledTextureValue.z - productValue107) * scalarValue) + productValue107;
    float productValue117 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue114) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue114) * varyingColor3.x;
    float productValue118 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue115) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue115) * varyingColor3.y;
    float productValue119 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue116) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue116) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue117) * varyingColor2.w) + productValue117;
    fragmentColor0.y = ((varyingColor2.y - productValue118) * varyingColor2.w) + productValue118;
    fragmentColor0.z = ((varyingColor2.z - productValue119) * varyingColor2.w) + productValue119;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.w;
    float productValue120 = (sampledTextureValue1.x - scalarValue5) * scalarValue1;
    float productValue121 = (sampledTextureValue1.y - scalarValue6) * scalarValue1;
    float productValue122 = (sampledTextureValue1.z - scalarValue7) * scalarValue1;
    float productValue123 = (productValue120 + scalarValue5) - (productValue120 * scalarValue8);
    float productValue124 = (productValue121 + scalarValue6) - (productValue121 * scalarValue8);
    float productValue125 = (productValue122 + scalarValue7) - (productValue122 * scalarValue8);
    float productValue126 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue123) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue123) * varyingColor3.x;
    float productValue127 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue124) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue124) * varyingColor3.y;
    float productValue128 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue125) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue125) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.y = ((varyingColor2.y - productValue127) * varyingColor2.w) + productValue127;
    fragmentColor0.z = ((varyingColor2.z - productValue128) * varyingColor2.w) + productValue128;
    fragmentColor0.w = scalarValue8;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1 && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue1 = sampledTextureValue1.w;
    float productValue129 = ((scalarValue2 - scalarValue5) * scalarValue1) + scalarValue5;
    float productValue130 = ((scalarValue3 - scalarValue6) * scalarValue1) + scalarValue6;
    float productValue131 = ((scalarValue4 - scalarValue7) * scalarValue1) + scalarValue7;
    float productValue132 = ((scalarValue2 - productValue129) * scalarValue1) + productValue129;
    float productValue133 = ((scalarValue3 - productValue130) * scalarValue1) + productValue130;
    float productValue134 = ((scalarValue4 - productValue131) * scalarValue1) + productValue131;
    float productValue135 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue132) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue132) * varyingColor3.x;
    float productValue136 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue133) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue133) * varyingColor3.y;
    float productValue137 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue134) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue134) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue135) * varyingColor2.w) + productValue135;
    fragmentColor0.y = ((varyingColor2.y - productValue136) * varyingColor2.w) + productValue136;
    fragmentColor0.z = ((varyingColor2.z - productValue137) * varyingColor2.w) + productValue137;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float productValue138 = ((RD_UNIFORM_MAT_COLOR2.x - scalarValue5) * RD_UNIFORM_MAT_COLOR2.w) + scalarValue5;
    float productValue139 = ((RD_UNIFORM_MAT_COLOR2.y - scalarValue6) * RD_UNIFORM_MAT_COLOR2.w) + scalarValue6;
    float productValue140 = ((RD_UNIFORM_MAT_COLOR2.z - scalarValue7) * RD_UNIFORM_MAT_COLOR2.w) + scalarValue7;
    float productValue141 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue138) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue138) * varyingColor3.x;
    float productValue142 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue139) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue139) * varyingColor3.y;
    float productValue143 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue140) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue140) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue141) * varyingColor2.w) + productValue141;
    fragmentColor0.y = ((varyingColor2.y - productValue142) * varyingColor2.w) + productValue142;
    fragmentColor0.z = ((varyingColor2.z - productValue143) * varyingColor2.w) + productValue143;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue144 = ((sampledTextureValue.x - scalarValue5) * scalarValue) + scalarValue5;
    float productValue145 = ((sampledTextureValue.y - scalarValue6) * scalarValue) + scalarValue6;
    float productValue146 = ((sampledTextureValue.z - scalarValue7) * scalarValue) + scalarValue7;
    float productValue147 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue144) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue144) * varyingColor3.x;
    float productValue148 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue145) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue145) * varyingColor3.y;
    float productValue149 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue146) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue146) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue147) * varyingColor2.w) + productValue147;
    fragmentColor0.y = ((varyingColor2.y - productValue148) * varyingColor2.w) + productValue148;
    fragmentColor0.z = ((varyingColor2.z - productValue149) * varyingColor2.w) + productValue149;
    fragmentColor0.w = sampledTextureValue2.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
