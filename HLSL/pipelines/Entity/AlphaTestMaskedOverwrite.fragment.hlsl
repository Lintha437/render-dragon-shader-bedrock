// Entity / AlphaTestMaskedOverwrite / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
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
#define RD_BINDING_LAYOUT 0
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
#if RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT || RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0
  float4 workingVector0,workingVector1;
#elif RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED
  float4 workingVector0,workingVector1,workingVector2;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.x = RD_UNIFORM_MAT_COLOR1.x + RD_UNIFORM_MAT_COLOR1.y;
  workingVector0.x = RD_UNIFORM_MAT_COLOR1.z + workingVector0.x;
  workingVector0.y = 1 + -RD_UNIFORM_MAT_COLOR1.w;
  workingVector0.x = workingVector0.x * workingVector0.y;
  workingVector0.x = saturate(ceil(workingVector0.x));
  workingVector1.xyzw = -RD_UNIFORM_MAT_COLOR1.xyzw + RD_UNIFORM_MAT_COLOR0.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector1.xyzw + RD_UNIFORM_MAT_COLOR1.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.x = workingVector0.x + workingVector0.y;
  workingVector1.x = workingVector1.x + workingVector0.z;
  workingVector1.y = 1 + -workingVector0.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = saturate(ceil(workingVector1.x));
  workingVector2.xyzw = RD_UNIFORM_MAT_COLOR0.xyzw + -workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector2.xyzw + workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_UNIFORM_MAT_COLOR1.x + RD_UNIFORM_MAT_COLOR1.y;
  workingVector1.x = RD_UNIFORM_MAT_COLOR1.z + workingVector1.x;
  workingVector1.y = 1 + -RD_UNIFORM_MAT_COLOR1.w;
  workingVector1.x = workingVector1.x * workingVector1.y;
  workingVector1.x = saturate(ceil(workingVector1.x));
  workingVector0.xyzw = -RD_UNIFORM_MAT_COLOR1.xyzw + workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xxxx * workingVector0.xyzw + RD_UNIFORM_MAT_COLOR1.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector2.x = workingVector1.x + workingVector1.y;
  workingVector2.x = workingVector2.x + workingVector1.z;
  workingVector2.y = 1 + -workingVector1.w;
  workingVector2.x = workingVector2.x * workingVector2.y;
  workingVector2.x = saturate(ceil(workingVector2.x));
  workingVector0.xyzw = -workingVector1.xyzw + workingVector0.xyzw;
  workingVector0.xyzw = workingVector2.xxxx * workingVector0.xyzw + workingVector1.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DISCARD_VALUE.x >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED || RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT || RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED
  fragmentColor0.w = workingVector0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue = min(max(ceil(((RD_UNIFORM_MAT_COLOR1.x + RD_UNIFORM_MAT_COLOR1.y) + RD_UNIFORM_MAT_COLOR1.z) * (1.0f - RD_UNIFORM_MAT_COLOR1.w)), 0.0f), 1.0f);
    float productValue1 = (productValue * (RD_UNIFORM_MAT_COLOR0.x - RD_UNIFORM_MAT_COLOR1.x)) + RD_UNIFORM_MAT_COLOR1.x;
    float productValue2 = (productValue * (RD_UNIFORM_MAT_COLOR0.y - RD_UNIFORM_MAT_COLOR1.y)) + RD_UNIFORM_MAT_COLOR1.y;
    float productValue3 = (productValue * (RD_UNIFORM_MAT_COLOR0.z - RD_UNIFORM_MAT_COLOR1.z)) + RD_UNIFORM_MAT_COLOR1.z;
    float productValue4 = (productValue * (RD_UNIFORM_MAT_COLOR0.w - RD_UNIFORM_MAT_COLOR1.w)) + RD_UNIFORM_MAT_COLOR1.w;
    if (!(!(productValue4 <= RD_UNIFORM_DISCARD_VALUE.x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue8 = min(max(ceil(((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)), 0.0f), 1.0f);
    float productValue9 = (productValue8 * (RD_UNIFORM_MAT_COLOR0.x - scalarValue)) + scalarValue;
    float productValue10 = (productValue8 * (RD_UNIFORM_MAT_COLOR0.y - scalarValue1)) + scalarValue1;
    float productValue11 = (productValue8 * (RD_UNIFORM_MAT_COLOR0.z - scalarValue2)) + scalarValue2;
    float productValue12 = (productValue8 * (RD_UNIFORM_MAT_COLOR0.w - scalarValue3)) + scalarValue3;
    if (!(!(productValue12 <= RD_UNIFORM_DISCARD_VALUE.x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    if (!(!(RD_UNIFORM_MAT_COLOR0.w <= RD_UNIFORM_DISCARD_VALUE.x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float4 sampledTextureValue1 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = min(max(ceil(((RD_UNIFORM_MAT_COLOR1.x + RD_UNIFORM_MAT_COLOR1.y) + RD_UNIFORM_MAT_COLOR1.z) * (1.0f - RD_UNIFORM_MAT_COLOR1.w)), 0.0f), 1.0f);
    float productValue19 = (productValue * (sampledTextureValue1.x - RD_UNIFORM_MAT_COLOR1.x)) + RD_UNIFORM_MAT_COLOR1.x;
    float productValue20 = (productValue * (sampledTextureValue1.y - RD_UNIFORM_MAT_COLOR1.y)) + RD_UNIFORM_MAT_COLOR1.y;
    float productValue21 = (productValue * (sampledTextureValue1.z - RD_UNIFORM_MAT_COLOR1.z)) + RD_UNIFORM_MAT_COLOR1.z;
    float productValue22 = (productValue * (sampledTextureValue1.w - RD_UNIFORM_MAT_COLOR1.w)) + RD_UNIFORM_MAT_COLOR1.w;
    if (!(!(productValue22 <= RD_UNIFORM_DISCARD_VALUE.x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue1 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue8 = min(max(ceil(((scalarValue + scalarValue1) + scalarValue2) * (1.0f - scalarValue3)), 0.0f), 1.0f);
    float productValue26 = (productValue8 * (sampledTextureValue1.x - scalarValue)) + scalarValue;
    float productValue27 = (productValue8 * (sampledTextureValue1.y - scalarValue1)) + scalarValue1;
    float productValue28 = (productValue8 * (sampledTextureValue1.z - scalarValue2)) + scalarValue2;
    float productValue29 = (productValue8 * (sampledTextureValue1.w - scalarValue3)) + scalarValue3;
    if (!(!(productValue29 <= RD_UNIFORM_DISCARD_VALUE.x)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float4 sampledTextureValue1 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(!(scalarValue7 <= RD_UNIFORM_DISCARD_VALUE.x)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue5 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.x;
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.y;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.y = ((varyingColor2.y - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.z = ((varyingColor2.z - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.w = productValue4;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue9) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue9) * varyingColor3.x;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor3.y;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = productValue12;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.x) * varyingColor3.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.y) * varyingColor3.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.z) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.y = ((varyingColor2.y - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.z = ((varyingColor2.z - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue23 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * varyingColor3.x;
    float productValue24 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * varyingColor3.y;
    float productValue25 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue21) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue21) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.y = ((varyingColor2.y - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.z = ((varyingColor2.z - productValue25) * varyingColor2.w) + productValue25;
    fragmentColor0.w = productValue22;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26) * varyingColor3.x;
    float productValue31 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor3.y;
    float productValue32 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue28) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue28) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.y = ((varyingColor2.y - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.z = ((varyingColor2.z - productValue32) * varyingColor2.w) + productValue32;
    fragmentColor0.w = productValue29;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue4) * varyingColor3.x;
    float productValue34 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue5) * varyingColor3.y;
    float productValue35 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue6) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue6) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.y = ((varyingColor2.y - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.z = ((varyingColor2.z - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.w = scalarValue7;
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
