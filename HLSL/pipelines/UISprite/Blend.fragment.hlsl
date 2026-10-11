// UISprite / Blend / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/UISprite/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
#endif
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector0.xyz = workingVector0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector0.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xyz = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector1.xyz;
  workingVector1.w = ceil(workingVector0.y);
  workingVector0.xyz = workingVector1.www * workingVector2.xyz + workingVector1.xyz;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    fragmentColor0.x = ((((scalarValue * varyingColor0.x) - scalarValue) * scalarValue3) + scalarValue) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = ((((scalarValue1 * varyingColor0.y) - scalarValue1) * scalarValue3) + scalarValue1) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = ((((scalarValue2 * varyingColor0.z) - scalarValue2) * scalarValue3) + scalarValue2) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = (RD_UNIFORM_TINT_COLOR.w * scalarValue3) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue * varyingColor0.y;
    float productValue2 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
    fragmentColor0.x = ((((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue) * scalarValue4) + productValue) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = ((((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue1) * scalarValue4) + productValue1) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = ((((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue2) * scalarValue4) + productValue2) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = (RD_UNIFORM_TINT_COLOR.w * sampledTextureValue.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
