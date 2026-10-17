// Entity / AlphaTestMultiColor / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 70
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
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  float4 workingVector0,workingVector1,workingVector2;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1) || (RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector0.w = ceil(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.w = ceil(RD_UNIFORM_MAT_COLOR0.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR1.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR1.xyz;
  workingVector0.w = ceil(RD_UNIFORM_MAT_COLOR1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.w = ceil(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.w = ceil(RD_UNIFORM_MAT_COLOR0.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector0.w = ceil(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  workingVector0.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.w = ceil(workingVector0.w);
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz;
  workingVector0.w = ceil(RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.xyz = workingVector0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector2.xyz + workingVector0.xyz;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = ceil(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector1.w = ceil(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR1.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -RD_UNIFORM_MAT_COLOR1.xyz;
  workingVector1.xyz = RD_UNIFORM_MAT_COLOR1.www * workingVector1.xyz + RD_UNIFORM_MAT_COLOR1.xyz;
  workingVector1.w = ceil(RD_UNIFORM_MAT_COLOR1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector1.w);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  if (workingVector2.x != 0) discard;
  workingVector2.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = workingVector2.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector2.xyz;
  workingVector1.xyz = workingVector2.www * workingVector1.xyz + workingVector2.xyz;
  workingVector1.w = ceil(workingVector2.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector1.w);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  if (workingVector2.x != 0) discard;
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
  workingVector2.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
  workingVector1.w = ceil(workingVector0.w);
  workingVector0.xyz = workingVector0.xyz + -workingVector1.xyz;
  workingVector0.xyz = workingVector1.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector2.y = RD_COMPARISON_MASK(0 >= workingVector1.w);
  workingVector2.x = workingVector2.y ? workingVector2.x : 0;
  if (workingVector2.x != 0) discard;
  workingVector2.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector2.xyz + workingVector0.xyz;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = ceil(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = materialTexture2.Sample(textureSampler2, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = workingVector1.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector1.xyz;
  workingVector1.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector1.w = ceil(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR2.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector1.xyz * workingVector0.www;
  workingVector1.w = ceil(workingVector0.w);
  workingVector0.xyz = workingVector1.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED
  fragmentColor0.w = workingVector0.w;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue = ((RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.z;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue9 = (RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue10 = (RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue11 = (RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float productValue = ((RD_UNIFORM_MAT_COLOR1.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_MAT_COLOR1.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_MAT_COLOR1.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR1.w) + RD_UNIFORM_MAT_COLOR0.z;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue24 = ((sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue25 = ((sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue26 = ((sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.z;
    if ((scalarValue7 <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.w;
    float productValue33 = (sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR0.x) * scalarValue7;
    float productValue34 = (sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR0.y) * scalarValue7;
    float productValue35 = (sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR0.z) * scalarValue7;
    if ((scalarValue7 <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue1.x;
    float scalarValue9 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float productValue42 = ((scalarValue8 - RD_UNIFORM_MAT_COLOR0.x) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue43 = ((scalarValue9 - RD_UNIFORM_MAT_COLOR0.y) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue44 = ((scalarValue10 - RD_UNIFORM_MAT_COLOR0.z) * scalarValue7) + RD_UNIFORM_MAT_COLOR0.z;
    if ((scalarValue7 <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if ((RD_UNIFORM_MAT_COLOR0.w <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    if ((RD_UNIFORM_MAT_COLOR0.w <= 0.0f) && (RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue64 = ((RD_UNIFORM_MAT_COLOR1.x - scalarValue12) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue12;
    float productValue65 = ((RD_UNIFORM_MAT_COLOR1.y - scalarValue13) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue13;
    float productValue66 = ((RD_UNIFORM_MAT_COLOR1.z - scalarValue14) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue14;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float productValue73 = (RD_UNIFORM_MAT_COLOR1.x - scalarValue12) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue74 = (RD_UNIFORM_MAT_COLOR1.y - scalarValue13) * RD_UNIFORM_MAT_COLOR1.w;
    float productValue75 = (RD_UNIFORM_MAT_COLOR1.z - scalarValue14) * RD_UNIFORM_MAT_COLOR1.w;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float productValue64 = ((RD_UNIFORM_MAT_COLOR1.x - scalarValue12) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue12;
    float productValue65 = ((RD_UNIFORM_MAT_COLOR1.y - scalarValue13) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue13;
    float productValue66 = ((RD_UNIFORM_MAT_COLOR1.z - scalarValue14) * RD_UNIFORM_MAT_COLOR1.w) + scalarValue14;
    if ((RD_UNIFORM_MAT_COLOR1.w <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue88 = ((sampledTextureValue1.x - scalarValue12) * scalarValue7) + scalarValue12;
    float productValue89 = ((sampledTextureValue1.y - scalarValue13) * scalarValue7) + scalarValue13;
    float productValue90 = ((sampledTextureValue1.z - scalarValue14) * scalarValue7) + scalarValue14;
    if ((scalarValue7 <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.w;
    float productValue97 = (sampledTextureValue1.x - scalarValue12) * scalarValue7;
    float productValue98 = (sampledTextureValue1.y - scalarValue13) * scalarValue7;
    float productValue99 = (sampledTextureValue1.z - scalarValue14) * scalarValue7;
    if ((scalarValue7 <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float4 sampledTextureValue1 = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue1.x;
    float scalarValue9 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float productValue106 = ((scalarValue8 - scalarValue12) * scalarValue7) + scalarValue12;
    float productValue107 = ((scalarValue9 - scalarValue13) * scalarValue7) + scalarValue13;
    float productValue108 = ((scalarValue10 - scalarValue14) * scalarValue7) + scalarValue14;
    if ((scalarValue7 <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    float4 sampledTextureValue = matTexture2Texture.Sample(matTexture2Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if ((scalarValue15 <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float4 sampledTextureValue2 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue2.x;
    float scalarValue13 = sampledTextureValue2.y;
    float scalarValue14 = sampledTextureValue2.z;
    float scalarValue15 = sampledTextureValue2.w;
    if ((scalarValue15 <= 0.0f) && (scalarValue15 <= RD_UNIFORM_DISCARD_VALUE.x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue3 = (((scalarValue - productValue) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue;
    float productValue4 = (((scalarValue1 - productValue1) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue1;
    float productValue5 = (((scalarValue2 - productValue2) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue2;
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor3.x;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor3.y;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float scalarValue5 = ceil(RD_UNIFORM_MAT_COLOR0.w);
    float productValue12 = (productValue9 + RD_UNIFORM_MAT_COLOR0.x) + (((((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) - productValue9) * scalarValue5);
    float productValue13 = (productValue10 + RD_UNIFORM_MAT_COLOR0.y) + (((((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) - productValue10) * scalarValue5);
    float productValue14 = (productValue11 + RD_UNIFORM_MAT_COLOR0.z) + (((((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) - productValue11) * scalarValue5);
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor3.x;
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) * varyingColor3.y;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.y = ((varyingColor2.y - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.z = ((varyingColor2.z - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float scalarValue6 = ceil(RD_UNIFORM_MAT_COLOR1.w);
    float productValue18 = (((RD_UNIFORM_MAT_COLOR1.x - productValue) + (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR1.x) - RD_UNIFORM_MAT_COLOR1.x) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue;
    float productValue19 = (((RD_UNIFORM_MAT_COLOR1.y - productValue1) + (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR1.y) - RD_UNIFORM_MAT_COLOR1.y) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue1;
    float productValue20 = (((RD_UNIFORM_MAT_COLOR1.z - productValue2) + (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR1.z) - RD_UNIFORM_MAT_COLOR1.z) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue2;
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.x;
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * varyingColor3.y;
    float productValue23 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.y = ((varyingColor2.y - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.z = ((varyingColor2.z - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue27 = (((scalarValue - productValue24) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue24;
    float productValue28 = (((scalarValue1 - productValue25) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue25;
    float productValue29 = (((scalarValue2 - productValue26) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue26;
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor3.x;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.y;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue29) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue29) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.y = ((varyingColor2.y - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.z = ((varyingColor2.z - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float scalarValue5 = ceil(RD_UNIFORM_MAT_COLOR0.w);
    float productValue36 = (productValue33 + RD_UNIFORM_MAT_COLOR0.x) + (((((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) - productValue33) * scalarValue5);
    float productValue37 = (productValue34 + RD_UNIFORM_MAT_COLOR0.y) + (((((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) - productValue34) * scalarValue5);
    float productValue38 = (productValue35 + RD_UNIFORM_MAT_COLOR0.z) + (((((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) - productValue35) * scalarValue5);
    float productValue39 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue36) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue36) * varyingColor3.x;
    float productValue40 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue37) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue37) * varyingColor3.y;
    float productValue41 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue38) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue38) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue39) * varyingColor2.w) + productValue39;
    fragmentColor0.y = ((varyingColor2.y - productValue40) * varyingColor2.w) + productValue40;
    fragmentColor0.z = ((varyingColor2.z - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float scalarValue11 = ceil(scalarValue7);
    float productValue45 = (((scalarValue8 - productValue42) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue8) - scalarValue8) * scalarValue7)) * scalarValue11) + productValue42;
    float productValue46 = (((scalarValue9 - productValue43) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue9) - scalarValue9) * scalarValue7)) * scalarValue11) + productValue43;
    float productValue47 = (((scalarValue10 - productValue44) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue10) - scalarValue10) * scalarValue7)) * scalarValue11) + productValue44;
    float productValue48 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue45) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue45) * varyingColor3.x;
    float productValue49 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue46) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue46) * varyingColor3.y;
    float productValue50 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue47) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue47) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.y = ((varyingColor2.y - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.z = ((varyingColor2.z - productValue50) * varyingColor2.w) + productValue50;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue51 = (((scalarValue - RD_UNIFORM_MAT_COLOR0.x) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue52 = (((scalarValue1 - RD_UNIFORM_MAT_COLOR0.y) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue53 = (((scalarValue2 - RD_UNIFORM_MAT_COLOR0.z) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue54 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue51) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue51) * varyingColor3.x;
    float productValue55 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue52) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue52) * varyingColor3.y;
    float productValue56 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue53) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue53) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.y = ((varyingColor2.y - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.z = ((varyingColor2.z - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue57 = ceil(RD_UNIFORM_MAT_COLOR0.w) * RD_UNIFORM_MAT_COLOR0.w;
    float productValue58 = (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * productValue57) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue59 = (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * productValue57) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue60 = (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * productValue57) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue61 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue58) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue58) * varyingColor3.x;
    float productValue62 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue59) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue59) * varyingColor3.y;
    float productValue63 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue60) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue60) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue61) * varyingColor2.w) + productValue61;
    fragmentColor0.y = ((varyingColor2.y - productValue62) * varyingColor2.w) + productValue62;
    fragmentColor0.z = ((varyingColor2.z - productValue63) * varyingColor2.w) + productValue63;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue67 = (((scalarValue - productValue64) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue64;
    float productValue68 = (((scalarValue1 - productValue65) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue65;
    float productValue69 = (((scalarValue2 - productValue66) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue66;
    float productValue70 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue67) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue67) * varyingColor3.x;
    float productValue71 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue68) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue68) * varyingColor3.y;
    float productValue72 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue69) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue69) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue70) * varyingColor2.w) + productValue70;
    fragmentColor0.y = ((varyingColor2.y - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.z = ((varyingColor2.z - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float scalarValue16 = ceil(scalarValue15);
    float productValue76 = (productValue73 + scalarValue12) + (((((RD_UNIFORM_MAT_COLOR2.x * scalarValue12) - scalarValue12) * scalarValue15) - productValue73) * scalarValue16);
    float productValue77 = (productValue74 + scalarValue13) + (((((RD_UNIFORM_MAT_COLOR2.y * scalarValue13) - scalarValue13) * scalarValue15) - productValue74) * scalarValue16);
    float productValue78 = (productValue75 + scalarValue14) + (((((RD_UNIFORM_MAT_COLOR2.z * scalarValue14) - scalarValue14) * scalarValue15) - productValue75) * scalarValue16);
    float productValue79 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue76) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue76) * varyingColor3.x;
    float productValue80 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue77) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue77) * varyingColor3.y;
    float productValue81 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue78) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue78) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.y = ((varyingColor2.y - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.z = ((varyingColor2.z - productValue81) * varyingColor2.w) + productValue81;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float scalarValue6 = ceil(RD_UNIFORM_MAT_COLOR1.w);
    float productValue82 = (((RD_UNIFORM_MAT_COLOR1.x - productValue64) + (((RD_UNIFORM_MAT_COLOR2.x * RD_UNIFORM_MAT_COLOR1.x) - RD_UNIFORM_MAT_COLOR1.x) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue64;
    float productValue83 = (((RD_UNIFORM_MAT_COLOR1.y - productValue65) + (((RD_UNIFORM_MAT_COLOR2.y * RD_UNIFORM_MAT_COLOR1.y) - RD_UNIFORM_MAT_COLOR1.y) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue65;
    float productValue84 = (((RD_UNIFORM_MAT_COLOR1.z - productValue66) + (((RD_UNIFORM_MAT_COLOR2.z * RD_UNIFORM_MAT_COLOR1.z) - RD_UNIFORM_MAT_COLOR1.z) * RD_UNIFORM_MAT_COLOR1.w)) * scalarValue6) + productValue66;
    float productValue85 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue82) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue82) * varyingColor3.x;
    float productValue86 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue83) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue83) * varyingColor3.y;
    float productValue87 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue84) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue84) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.y = ((varyingColor2.y - productValue86) * varyingColor2.w) + productValue86;
    fragmentColor0.z = ((varyingColor2.z - productValue87) * varyingColor2.w) + productValue87;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue91 = (((scalarValue - productValue88) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + productValue88;
    float productValue92 = (((scalarValue1 - productValue89) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + productValue89;
    float productValue93 = (((scalarValue2 - productValue90) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + productValue90;
    float productValue94 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue91) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue91) * varyingColor3.x;
    float productValue95 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue92) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue92) * varyingColor3.y;
    float productValue96 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue93) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue93) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue94) * varyingColor2.w) + productValue94;
    fragmentColor0.y = ((varyingColor2.y - productValue95) * varyingColor2.w) + productValue95;
    fragmentColor0.z = ((varyingColor2.z - productValue96) * varyingColor2.w) + productValue96;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float scalarValue16 = ceil(scalarValue15);
    float productValue100 = (productValue97 + scalarValue12) + (((((RD_UNIFORM_MAT_COLOR2.x * scalarValue12) - scalarValue12) * scalarValue15) - productValue97) * scalarValue16);
    float productValue101 = (productValue98 + scalarValue13) + (((((RD_UNIFORM_MAT_COLOR2.y * scalarValue13) - scalarValue13) * scalarValue15) - productValue98) * scalarValue16);
    float productValue102 = (productValue99 + scalarValue14) + (((((RD_UNIFORM_MAT_COLOR2.z * scalarValue14) - scalarValue14) * scalarValue15) - productValue99) * scalarValue16);
    float productValue103 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue100) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue100) * varyingColor3.x;
    float productValue104 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue101) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue101) * varyingColor3.y;
    float productValue105 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue102) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue102) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue103) * varyingColor2.w) + productValue103;
    fragmentColor0.y = ((varyingColor2.y - productValue104) * varyingColor2.w) + productValue104;
    fragmentColor0.z = ((varyingColor2.z - productValue105) * varyingColor2.w) + productValue105;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED1)
    float scalarValue11 = ceil(scalarValue7);
    float productValue109 = (((scalarValue8 - productValue106) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue8) - scalarValue8) * scalarValue7)) * scalarValue11) + productValue106;
    float productValue110 = (((scalarValue9 - productValue107) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue9) - scalarValue9) * scalarValue7)) * scalarValue11) + productValue107;
    float productValue111 = (((scalarValue10 - productValue108) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue10) - scalarValue10) * scalarValue7)) * scalarValue11) + productValue108;
    float productValue112 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue109) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue109) * varyingColor3.x;
    float productValue113 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue110) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue110) * varyingColor3.y;
    float productValue114 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue111) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue111) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue112) * varyingColor2.w) + productValue112;
    fragmentColor0.y = ((varyingColor2.y - productValue113) * varyingColor2.w) + productValue113;
    fragmentColor0.z = ((varyingColor2.z - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SAMPLED)
    float scalarValue4 = ceil(scalarValue3);
    float productValue115 = (((scalarValue - scalarValue12) + (((RD_UNIFORM_MAT_COLOR2.x * scalarValue) - scalarValue) * scalarValue3)) * scalarValue4) + scalarValue12;
    float productValue116 = (((scalarValue1 - scalarValue13) + (((RD_UNIFORM_MAT_COLOR2.y * scalarValue1) - scalarValue1) * scalarValue3)) * scalarValue4) + scalarValue13;
    float productValue117 = (((scalarValue2 - scalarValue14) + (((RD_UNIFORM_MAT_COLOR2.z * scalarValue2) - scalarValue2) * scalarValue3)) * scalarValue4) + scalarValue14;
    float productValue118 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue115) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue115) * varyingColor3.x;
    float productValue119 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue116) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue116) * varyingColor3.y;
    float productValue120 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue117) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue117) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue118) * varyingColor2.w) + productValue118;
    fragmentColor0.y = ((varyingColor2.y - productValue119) * varyingColor2.w) + productValue119;
    fragmentColor0.z = ((varyingColor2.z - productValue120) * varyingColor2.w) + productValue120;
    fragmentColor0.w = scalarValue15;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0 && RD_OPTION_SOURCE_INPUT_TYPE2 == RD_SOURCE_INPUT_TYPE2_SHARED0)
    float productValue121 = ceil(scalarValue15) * scalarValue15;
    float productValue122 = (((RD_UNIFORM_MAT_COLOR2.x * scalarValue12) - scalarValue12) * productValue121) + scalarValue12;
    float productValue123 = (((RD_UNIFORM_MAT_COLOR2.y * scalarValue13) - scalarValue13) * productValue121) + scalarValue13;
    float productValue124 = (((RD_UNIFORM_MAT_COLOR2.z * scalarValue14) - scalarValue14) * productValue121) + scalarValue14;
    float productValue125 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue122) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue122) * varyingColor3.x;
    float productValue126 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue123) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue123) * varyingColor3.y;
    float productValue127 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue124) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue124) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue125) * varyingColor2.w) + productValue125;
    fragmentColor0.y = ((varyingColor2.y - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.z = ((varyingColor2.z - productValue127) * varyingColor2.w) + productValue127;
    fragmentColor0.w = scalarValue15;
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
