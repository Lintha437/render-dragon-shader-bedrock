// Entity / AlphaTestColorMask / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 30
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
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * workingVector0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w * workingVector0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.xyz * RD_UNIFORM_MAT_COLOR0.xyz + -RD_UNIFORM_MAT_COLOR0.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_MAT_COLOR1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_MAT_COLOR1.w * workingVector0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = materialTexture1.Sample(textureSampler1, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * workingVector1.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector1.w * workingVector0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = workingVector0.xyz * workingVector0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = workingVector0.w * workingVector0.w;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    if (!(!(RD_UNIFORM_MAT_COLOR0.w <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(RD_UNIFORM_MAT_COLOR0.w <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float4 sampledTextureValue1 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    if (!(!(scalarValue3 <= 0.0f)))
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float4 sampledTextureValue1 = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    float scalarValue2 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    float4 sampledTextureValue = matTexture1Texture.Sample(matTexture1Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (!(!(scalarValue3 <= 0.0f)))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue = (((RD_UNIFORM_MAT_COLOR1.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = (((RD_UNIFORM_MAT_COLOR1.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = (((RD_UNIFORM_MAT_COLOR1.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue) * varyingColor3.x;
    float productValue4 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue1) * varyingColor3.y;
    float productValue5 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue2) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR1.w * RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue6 = (((sampledTextureValue.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue7 = (((sampledTextureValue.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue8 = (((sampledTextureValue.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue9 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue6) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue6) * varyingColor3.x;
    float productValue10 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue7) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue7) * varyingColor3.y;
    float productValue11 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue8) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue8) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = sampledTextureValue.w * RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue12 = (((RD_UNIFORM_MAT_COLOR0.x * RD_UNIFORM_MAT_COLOR0.x) - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue13 = (((RD_UNIFORM_MAT_COLOR0.y * RD_UNIFORM_MAT_COLOR0.y) - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue14 = (((RD_UNIFORM_MAT_COLOR0.z * RD_UNIFORM_MAT_COLOR0.z) - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_MAT_COLOR0.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor3.x;
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) * varyingColor3.y;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.y = ((varyingColor2.y - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.z = ((varyingColor2.z - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w * RD_UNIFORM_MAT_COLOR0.w;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_CONSTANT)
    float productValue18 = (((RD_UNIFORM_MAT_COLOR1.x * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue19 = (((RD_UNIFORM_MAT_COLOR1.y * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue20 = (((RD_UNIFORM_MAT_COLOR1.z * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue21 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue18) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue18) * varyingColor3.x;
    float productValue22 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue19) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue19) * varyingColor3.y;
    float productValue23 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue20) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue20) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.y = ((varyingColor2.y - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.z = ((varyingColor2.z - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR1.w * scalarValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SAMPLED)
    float productValue24 = (((sampledTextureValue.x * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue25 = (((sampledTextureValue.y * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue26 = (((sampledTextureValue.z * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue27 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor3.x;
    float productValue28 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor3.y;
    float productValue29 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.y = ((varyingColor2.y - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.z = ((varyingColor2.z - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.w = sampledTextureValue.w * scalarValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_OPTION_SOURCE_INPUT_TYPE1 == RD_SOURCE_INPUT_TYPE1_SHARED0)
    float productValue30 = (((scalarValue * scalarValue) - scalarValue) * scalarValue3) + scalarValue;
    float productValue31 = (((scalarValue1 * scalarValue1) - scalarValue1) * scalarValue3) + scalarValue1;
    float productValue32 = (((scalarValue2 * scalarValue2) - scalarValue2) * scalarValue3) + scalarValue2;
    float productValue33 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue30) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue30) * varyingColor3.x;
    float productValue34 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue31) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue31) * varyingColor3.y;
    float productValue35 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue32) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue32) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.y = ((varyingColor2.y - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.z = ((varyingColor2.z - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.w = scalarValue3 * scalarValue3;
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
