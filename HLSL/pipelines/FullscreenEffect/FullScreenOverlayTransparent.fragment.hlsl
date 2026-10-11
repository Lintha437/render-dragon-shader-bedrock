// FullscreenEffect / FullScreenOverlayTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 15
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/FullscreenEffect/FragmentBindings.hlsli"

#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  linear centroid float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
void executeFragmentStage()
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED || RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
void discard_exit()
#endif
{
#if (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
    fragmentColor0.w = ((sampledTextureValue.w * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.x;
    fragmentColor0.y = RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.y;
    fragmentColor0.z = RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.z;
    fragmentColor0.w = (RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (!(!(scalarValue <= 0.0f)))
    {
        discard_state = true;
    }
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
    fragmentColor0.w = ((scalarValue * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < RD_UNIFORM_DISCARD_VALUE.x)
    {
        discard_state = true;
    }
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_CURRENT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_CURRENT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_CURRENT_COLOR.z;
    fragmentColor0.w = ((scalarValue * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    if (RD_UNIFORM_DISCARD_VALUE.x > 1.0f)
    {
        discard_state = true;
    }
    fragmentColor0.x = RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.x;
    fragmentColor0.y = RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.y;
    fragmentColor0.z = RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.z;
    fragmentColor0.w = (RD_UNIFORM_CURRENT_COLOR.w * varyingColor0.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
#if RD_FEATURE_USE_TEXTURES == RD_ON
  linear centroid float2 varyingTexCoord0 : TEXCOORD0,
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  float2 varyingTexCoord0 : TEXCOORD0,
#endif
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_USE_TEXTURES == RD_ON
  float4 workingVector0,workingVector1;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  float4 workingVector0;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 >= workingVector0.w);
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
  if (workingVector1.x != 0) discard;
  workingVector1.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
#elif RD_FEATURE_USE_TEXTURES == RD_OFF
  workingVector0.x = RD_COMPARISON_MASK(1 < RD_UNIFORM_DISCARD_VALUE.x);
  if (workingVector0.x != 0) discard;
  workingVector0.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
#endif
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
}
#endif
