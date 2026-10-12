// BlockSelectionOverlay / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/BlockSelectionOverlay/FragmentBindings.hlsli"

#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
void executeFragmentStage()
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON
void discard_exit()
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw;
  return;
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    if (matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5f)
    {
        discard_state = true;
    }
    fragmentColor0.x = RD_UNIFORM_MAT_COLOR.x;
    fragmentColor0.y = RD_UNIFORM_MAT_COLOR.y;
    fragmentColor0.z = RD_UNIFORM_MAT_COLOR.z;
    fragmentColor0.w = RD_UNIFORM_MAT_COLOR.w;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_PLATFORM == RD_PLATFORM_SM40
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
  workingVector0.x = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).w;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x < 0.5);
#endif
  if (workingVector0.x != 0) discard;
  fragmentColor0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw;
  return;
}
#endif
