// Entity / AlphaTestColorMaskMultiplicativeTint / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 48
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
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_SAMPLED
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 42
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
{
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  float4 workingVector0,workingVector1;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  float4 workingVector0,workingVector1,workingVector2;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
  workingVector1.y = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR1.w + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector1.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.yzw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.x = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.y = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR1.w + RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.y = RD_COMPARISON_MASK(0 >= workingVector0.y);
  if (workingVector0.y != 0) discard;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector0.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.yzw;
  workingVector0.yzw = -workingVector0.yzw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.yzw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.x = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.y = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR1.w + RD_UNIFORM_MAT_COLOR1.w;
  workingVector0.y = RD_COMPARISON_MASK(0 >= workingVector0.y);
  if (workingVector0.y != 0) discard;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector0.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.yzw;
  workingVector0.yzw = -workingVector0.yzw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.yzw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w;
  workingVector0.w = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w + workingVector1.w;
  workingVector0.w = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector0.w != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w;
  workingVector0.w = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w + RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.w = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector0.w != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w;
  workingVector1.y = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector1.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.yzw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
  workingVector1.y = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector1.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.yzw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.x = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.y = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w + RD_UNIFORM_MAT_COLOR0.w;
  workingVector0.y = RD_COMPARISON_MASK(0 >= workingVector0.y);
  if (workingVector0.y != 0) discard;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector0.yzw + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.yzw;
  workingVector0.yzw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.yzw;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.yzw;
  workingVector0.yzw = -workingVector0.yzw * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.yzw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_UNIFORM_MAT_COLOR1.w * workingVector0.w;
  workingVector2.y = workingVector0.w * RD_UNIFORM_MAT_COLOR1.w + workingVector1.w;
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector2.y);
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR1.w * workingVector0.w;
  workingVector1.y = workingVector0.w * RD_UNIFORM_MAT_COLOR1.w + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.yzw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR1.w * workingVector0.w;
  workingVector1.y = workingVector0.w * RD_UNIFORM_MAT_COLOR1.w + RD_UNIFORM_MAT_COLOR1.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_MAT_COLOR1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector3.x = workingVector1.w * workingVector0.w;
  workingVector1.w = workingVector0.w * workingVector1.w + workingVector2.w;
  workingVector1.w = RD_COMPARISON_MASK(0 >= workingVector1.w);
  if (workingVector1.w != 0) discard;
  workingVector1.xyz = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector2.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector3.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.w * workingVector0.w;
  workingVector1.w = workingVector0.w * workingVector1.w + workingVector0.w;
  workingVector1.w = RD_COMPARISON_MASK(0 >= workingVector1.w);
  if (workingVector1.w != 0) discard;
  workingVector1.xyz = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.w * workingVector0.w;
  workingVector2.y = workingVector0.w * workingVector1.w + workingVector1.w;
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector2.y);
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector0.w * workingVector0.w;
  workingVector2.y = workingVector0.w * workingVector0.w + workingVector1.w;
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector2.y);
  if (workingVector2.y != 0) discard;
  workingVector2.yzw = workingVector0.xyz * workingVector0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.yzw + workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector2.x;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.w * workingVector0.w;
  workingVector1.y = workingVector0.w * workingVector0.w + workingVector0.w;
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector1.y);
  if (workingVector1.y != 0) discard;
  workingVector1.yzw = workingVector0.xyz * workingVector0.xyz + -workingVector0.xyz;
  workingVector1.yzw = workingVector0.www * workingVector1.yzw + workingVector0.xyz;
  workingVector0.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.yzw;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.yzw;
  workingVector1.yzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.yzw + workingVector0.xyz;
  workingVector1.yzw = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.yzw;
  fragmentColor0.w = workingVector1.x;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue = (((RD_UNIFORM_MAT_COLOR1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = (((RD_UNIFORM_MAT_COLOR1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = (((RD_UNIFORM_MAT_COLOR1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue4 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue) * scalarValue) + productValue;
    float productValue5 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue1) * scalarValue) + productValue1;
    float productValue6 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue2) * scalarValue) + productValue2;
    if (!(!((scalarValue + productValue3) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue = (((RD_UNIFORM_MAT_COLOR1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = (((RD_UNIFORM_MAT_COLOR1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = (((RD_UNIFORM_MAT_COLOR1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue10 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - productValue) * RD_UNIFORM_MAT_COLOR0.w) + productValue;
    float productValue11 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - productValue1) * RD_UNIFORM_MAT_COLOR0.w) + productValue1;
    float productValue12 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - productValue2) * RD_UNIFORM_MAT_COLOR0.w) + productValue2;
    if (!(!((productValue3 + RD_UNIFORM_MAT_COLOR0.w) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue = (((RD_UNIFORM_MAT_COLOR1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = (((RD_UNIFORM_MAT_COLOR1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = (((RD_UNIFORM_MAT_COLOR1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue16 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR1.x) - productValue) * RD_UNIFORM_MAT_COLOR1.w) + productValue;
    float productValue17 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR1.y) - productValue1) * RD_UNIFORM_MAT_COLOR1.w) + productValue1;
    float productValue18 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR1.z) - productValue2) * RD_UNIFORM_MAT_COLOR1.w) + productValue2;
    if (!(!((productValue3 + RD_UNIFORM_MAT_COLOR1.w) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue22 = (((sampledTextureValue1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue23 = (((sampledTextureValue1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue24 = (((sampledTextureValue1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue25 = sampledTextureValue1.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue26 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue22) * scalarValue) + productValue22;
    float productValue27 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue23) * scalarValue) + productValue23;
    float productValue28 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue24) * scalarValue) + productValue24;
    if (!(!((scalarValue + productValue25) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue22 = (((sampledTextureValue1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue23 = (((sampledTextureValue1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue24 = (((sampledTextureValue1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue25 = sampledTextureValue1.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue32 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - productValue22) * RD_UNIFORM_MAT_COLOR0.w) + productValue22;
    float productValue33 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - productValue23) * RD_UNIFORM_MAT_COLOR0.w) + productValue23;
    float productValue34 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - productValue24) * RD_UNIFORM_MAT_COLOR0.w) + productValue24;
    if (!(!((productValue25 + RD_UNIFORM_MAT_COLOR0.w) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue38 = (((scalarValue1 * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue39 = (((scalarValue2 * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue40 = (((scalarValue3 * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue41 = scalarValue4 * RD_UNIFORM_MAT_COLOR0.w;
    float productValue42 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue1) - productValue38) * scalarValue4) + productValue38;
    float productValue43 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue2) - productValue39) * scalarValue4) + productValue39;
    float productValue44 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue3) - productValue40) * scalarValue4) + productValue40;
    if (!(!((productValue41 + scalarValue4) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue48 = (((RD_UNIFORM_MAT_COLOR0.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue49 = (((RD_UNIFORM_MAT_COLOR0.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue50 = (((RD_UNIFORM_MAT_COLOR0.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue51 = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue52 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue48) * scalarValue) + productValue48;
    float productValue53 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue49) * scalarValue) + productValue49;
    float productValue54 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue50) * scalarValue) + productValue50;
    if (!(!((scalarValue + productValue51) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue48 = (((RD_UNIFORM_MAT_COLOR0.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue49 = (((RD_UNIFORM_MAT_COLOR0.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue50 = (((RD_UNIFORM_MAT_COLOR0.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue51 = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
    float productValue58 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - productValue48) * RD_UNIFORM_MAT_COLOR0.w) + productValue48;
    float productValue59 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - productValue49) * RD_UNIFORM_MAT_COLOR0.w) + productValue49;
    float productValue60 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - productValue50) * RD_UNIFORM_MAT_COLOR0.w) + productValue50;
    if (!(!((productValue51 + RD_UNIFORM_MAT_COLOR0.w) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue64 = (((RD_UNIFORM_MAT_COLOR1.x * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue65 = (((RD_UNIFORM_MAT_COLOR1.y * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue66 = (((RD_UNIFORM_MAT_COLOR1.z * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue67 = RD_UNIFORM_MAT_COLOR1.w * scalarValue8;
    float productValue68 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue64) * scalarValue) + productValue64;
    float productValue69 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue65) * scalarValue) + productValue65;
    float productValue70 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue66) * scalarValue) + productValue66;
    if (!(!((scalarValue + productValue67) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float productValue64 = (((RD_UNIFORM_MAT_COLOR1.x * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue65 = (((RD_UNIFORM_MAT_COLOR1.y * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue66 = (((RD_UNIFORM_MAT_COLOR1.z * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue67 = RD_UNIFORM_MAT_COLOR1.w * scalarValue8;
    float productValue74 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue5) - productValue64) * scalarValue8) + productValue64;
    float productValue75 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue6) - productValue65) * scalarValue8) + productValue65;
    float productValue76 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue7) - productValue66) * scalarValue8) + productValue66;
    if (!(!((productValue67 + scalarValue8) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float productValue64 = (((RD_UNIFORM_MAT_COLOR1.x * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue65 = (((RD_UNIFORM_MAT_COLOR1.y * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue66 = (((RD_UNIFORM_MAT_COLOR1.z * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue67 = RD_UNIFORM_MAT_COLOR1.w * scalarValue8;
    float productValue80 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR1.x) - productValue64) * RD_UNIFORM_MAT_COLOR1.w) + productValue64;
    float productValue81 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR1.y) - productValue65) * RD_UNIFORM_MAT_COLOR1.w) + productValue65;
    float productValue82 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR1.z) - productValue66) * RD_UNIFORM_MAT_COLOR1.w) + productValue66;
    if (!(!((productValue67 + RD_UNIFORM_MAT_COLOR1.w) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue86 = (((sampledTextureValue1.x * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue87 = (((sampledTextureValue1.y * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue88 = (((sampledTextureValue1.z * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue89 = sampledTextureValue1.w * scalarValue8;
    float productValue90 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue86) * scalarValue) + productValue86;
    float productValue91 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue87) * scalarValue) + productValue87;
    float productValue92 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue88) * scalarValue) + productValue88;
    if (!(!((scalarValue + productValue89) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue86 = (((sampledTextureValue1.x * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue87 = (((sampledTextureValue1.y * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue88 = (((sampledTextureValue1.z * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue89 = sampledTextureValue1.w * scalarValue8;
    float productValue96 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue5) - productValue86) * scalarValue8) + productValue86;
    float productValue97 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue6) - productValue87) * scalarValue8) + productValue87;
    float productValue98 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue7) - productValue88) * scalarValue8) + productValue88;
    if (!(!((productValue89 + scalarValue8) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    float scalarValue4 = sampledTextureValue1.w;
    float productValue102 = (((scalarValue1 * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue103 = (((scalarValue2 * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue104 = (((scalarValue3 * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue105 = scalarValue4 * scalarValue8;
    float productValue106 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue1) - productValue102) * scalarValue4) + productValue102;
    float productValue107 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue2) - productValue103) * scalarValue4) + productValue103;
    float productValue108 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue3) - productValue104) * scalarValue4) + productValue104;
    if (!(!((productValue105 + scalarValue4) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float productValue112 = (((scalarValue5 * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue113 = (((scalarValue6 * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue114 = (((scalarValue7 * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue115 = scalarValue8 * scalarValue8;
    float productValue116 = (((RD_UNIFORM_MAT_COLOR2.x * sampledTextureValue.x) - productValue112) * scalarValue) + productValue112;
    float productValue117 = (((RD_UNIFORM_MAT_COLOR2.y * sampledTextureValue.y) - productValue113) * scalarValue) + productValue113;
    float productValue118 = (((RD_UNIFORM_MAT_COLOR2.z * sampledTextureValue.z) - productValue114) * scalarValue) + productValue114;
    if (!(!((scalarValue + productValue115) <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue2.x;
    float scalarValue6 = sampledTextureValue2.y;
    float scalarValue7 = sampledTextureValue2.z;
    float scalarValue8 = sampledTextureValue2.w;
    float productValue112 = (((scalarValue5 * scalarValue5) - scalarValue5) * scalarValue8) + scalarValue5;
    float productValue113 = (((scalarValue6 * scalarValue6) - scalarValue6) * scalarValue8) + scalarValue6;
    float productValue114 = (((scalarValue7 * scalarValue7) - scalarValue7) * scalarValue8) + scalarValue7;
    float productValue115 = scalarValue8 * scalarValue8;
    float productValue122 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue5) - productValue112) * scalarValue8) + productValue112;
    float productValue123 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue6) - productValue113) * scalarValue8) + productValue113;
    float productValue124 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue7) - productValue114) * scalarValue8) + productValue114;
    if (!(!((productValue115 + scalarValue8) <= 0.0f)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor3.x;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor3.y;
    float productValue9 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue6) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue6) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.x;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.y;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue19 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor3.x;
    float productValue20 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue17) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue17) * varyingColor3.y;
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue19) * varyingColor2.w) + productValue19;
    fragmentColor0.y = ((varyingColor2.y - productValue20) * varyingColor2.w) + productValue20;
    fragmentColor0.z = ((varyingColor2.z - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.w = productValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue29 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26) * varyingColor3.x;
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor3.y;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.y = ((varyingColor2.y - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.z = ((varyingColor2.z - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.w = productValue25;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue35 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue32) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue32) * varyingColor3.x;
    float productValue36 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue33) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue33) * varyingColor3.y;
    float productValue37 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue34) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue34) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.y = ((varyingColor2.y - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.z = ((varyingColor2.z - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.w = productValue25;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue45 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue42) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue42) * varyingColor3.x;
    float productValue46 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue43) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue43) * varyingColor3.y;
    float productValue47 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue44) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue44) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.y = ((varyingColor2.y - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.z = ((varyingColor2.z - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.w = productValue41;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue55 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * varyingColor3.x;
    float productValue56 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53) * varyingColor3.y;
    float productValue57 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue54) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue54) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.y = ((varyingColor2.y - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.z = ((varyingColor2.z - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.w = productValue51;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue61 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58) * varyingColor3.x;
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.y;
    float productValue63 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.y = ((varyingColor2.y - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.z = ((varyingColor2.z - productValue63) * varyingColor2.w) + productValue63;
    fragmentColor0.w = productValue51;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue71 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) * varyingColor3.x;
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) * varyingColor3.y;
    float productValue73 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue70) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue70) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.y = ((varyingColor2.y - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.z = ((varyingColor2.z - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.w = productValue67;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue77 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue74) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue74) * varyingColor3.x;
    float productValue78 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue75) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue75) * varyingColor3.y;
    float productValue79 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue77) * varyingColor2.w) + productValue77;
    fragmentColor0.y = ((varyingColor2.y - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.z = ((varyingColor2.z - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.w = productValue67;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue83 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue80) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue80) * varyingColor3.x;
    float productValue84 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue81) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue81) * varyingColor3.y;
    float productValue85 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue83) * varyingColor2.w) + productValue83;
    fragmentColor0.y = ((varyingColor2.y - productValue84) * varyingColor2.w) + productValue84;
    fragmentColor0.z = ((varyingColor2.z - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.w = productValue67;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue93 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue90) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue90) * varyingColor3.x;
    float productValue94 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue91) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue91) * varyingColor3.y;
    float productValue95 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue92) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue92) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue93) * varyingColor2.w) + productValue93;
    fragmentColor0.y = ((varyingColor2.y - productValue94) * varyingColor2.w) + productValue94;
    fragmentColor0.z = ((varyingColor2.z - productValue95) * varyingColor2.w) + productValue95;
    fragmentColor0.w = productValue89;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue99 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue96) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue96) * varyingColor3.x;
    float productValue100 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue97) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue97) * varyingColor3.y;
    float productValue101 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue98) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue98) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue99) * varyingColor2.w) + productValue99;
    fragmentColor0.y = ((varyingColor2.y - productValue100) * varyingColor2.w) + productValue100;
    fragmentColor0.z = ((varyingColor2.z - productValue101) * varyingColor2.w) + productValue101;
    fragmentColor0.w = productValue89;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue109 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue106) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue106) * varyingColor3.x;
    float productValue110 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue107) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue107) * varyingColor3.y;
    float productValue111 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue108) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue108) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue109) * varyingColor2.w) + productValue109;
    fragmentColor0.y = ((varyingColor2.y - productValue110) * varyingColor2.w) + productValue110;
    fragmentColor0.z = ((varyingColor2.z - productValue111) * varyingColor2.w) + productValue111;
    fragmentColor0.w = productValue105;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float productValue119 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue116) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue116) * varyingColor3.x;
    float productValue120 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue117) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue117) * varyingColor3.y;
    float productValue121 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue118) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue118) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue119) * varyingColor2.w) + productValue119;
    fragmentColor0.y = ((varyingColor2.y - productValue120) * varyingColor2.w) + productValue120;
    fragmentColor0.z = ((varyingColor2.z - productValue121) * varyingColor2.w) + productValue121;
    fragmentColor0.w = productValue115;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue125 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue122) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue122) * varyingColor3.x;
    float productValue126 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue123) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue123) * varyingColor3.y;
    float productValue127 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue124) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue124) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue125) * varyingColor2.w) + productValue125;
    fragmentColor0.y = ((varyingColor2.y - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.z = ((varyingColor2.z - productValue127) * varyingColor2.w) + productValue127;
    fragmentColor0.w = productValue115;
#endif
    discardIfRequested();
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
}
#endif
