// Entity / AlphaTestEmissiveOnly / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 12
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
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT
  workingVector0.x = RD_COMPARISON_MASK(0 >= RD_UNIFORM_MAT_COLOR0.w);
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_MAT_COLOR0.w >= 1);
  workingVector0.x = (int)workingVector0.y | (int)workingVector0.x;
  if (workingVector0.x != 0) discard;
  workingVector0.xyz = -RD_UNIFORM_MAT_COLOR0.xyz + RD_UNIFORM_OVERLAY_COLOR.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector0.xyz + RD_UNIFORM_MAT_COLOR0.xyz;
#elif RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w >= 1);
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = workingVector0.xyz * varyingColor3.xyz + -workingVector0.xyz;
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
#endif
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
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
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT
    if ((RD_UNIFORM_MAT_COLOR0.w <= 0.0f) || (RD_UNIFORM_MAT_COLOR0.w >= 1.0f))
#elif RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED
    float4 sampledTextureValue = matTexture0Texture.Sample(matTexture0Sampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    if ((scalarValue3 <= 0.0f) || (scalarValue3 >= 1.0f))
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT
    float productValue = ((RD_UNIFORM_OVERLAY_COLOR.x - RD_UNIFORM_MAT_COLOR0.x) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.x;
    float productValue1 = ((RD_UNIFORM_OVERLAY_COLOR.y - RD_UNIFORM_MAT_COLOR0.y) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.y;
    float productValue2 = ((RD_UNIFORM_OVERLAY_COLOR.z - RD_UNIFORM_MAT_COLOR0.z) * RD_UNIFORM_OVERLAY_COLOR.w) + RD_UNIFORM_MAT_COLOR0.z;
    float productValue3 = (((productValue * varyingColor3.x) - productValue) * RD_UNIFORM_MAT_COLOR0.w) + productValue;
    float productValue4 = (((productValue1 * varyingColor3.y) - productValue1) * RD_UNIFORM_MAT_COLOR0.w) + productValue1;
    float productValue5 = (((productValue2 * varyingColor3.z) - productValue2) * RD_UNIFORM_MAT_COLOR0.w) + productValue2;
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR0.w;
#elif RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED
    float productValue6 = ((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue;
    float productValue7 = ((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1;
    float productValue8 = ((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2;
    float productValue9 = (((productValue6 * varyingColor3.x) - productValue6) * scalarValue3) + productValue6;
    float productValue10 = (((productValue7 * varyingColor3.y) - productValue7) * scalarValue3) + productValue7;
    float productValue11 = (((productValue8 * varyingColor3.z) - productValue8) * scalarValue3) + productValue8;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = scalarValue3;
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
