// UISprite / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/UISprite/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(0 < varyingColor0.w);
  workingVector1.y = ceil(workingVector0.w);
  workingVector1.w = workingVector1.x ? workingVector1.y : workingVector0.w;
  workingVector2.x = RD_COMPARISON_MASK(workingVector1.w < 0.5);
  if (workingVector2.x != 0) discard;
  workingVector2.xyz = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xyz = workingVector0.www * workingVector2.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.z = RD_COMPARISON_MASK(0 < varyingColor0.w);
  workingVector1.x = ceil(workingVector0.w);
  workingVector1.w = workingVector0.z ? workingVector1.x : workingVector0.w;
  workingVector0.z = RD_COMPARISON_MASK(workingVector1.w < 0.5);
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xzw;
  workingVector1.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.w = RD_COMPARISON_MASK(0 < varyingColor0.w);
  workingVector1.x = ceil(workingVector0.z);
  workingVector1.w = workingVector0.w ? workingVector1.x : workingVector0.z;
  workingVector0.z = RD_COMPARISON_MASK(workingVector1.w < 0.5);
  if (workingVector0.z != 0) discard;
  workingVector0.xzw = varyingColor0.xyz * workingVector0.xxx;
  workingVector2.x = ceil(workingVector0.y);
  workingVector2.yzw = workingVector0.yyy * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xzw;
  workingVector1.xyz = workingVector2.xxx * workingVector2.yzw + workingVector0.xzw;
#endif
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector1.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float scalarValue2 = sampledTextureValue.z;
#endif
    float scalarValue3 = sampledTextureValue.w;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue * varyingColor0.y;
    float productValue2 = scalarValue * varyingColor0.z;
    float scalarValue4 = ceil(scalarValue1);
#endif
    float intermediateValue4;
    if (varyingColor0.w > 0.0f)
    {
        intermediateValue4 = ceil(scalarValue3);
    }
    else
    {
        intermediateValue4 = scalarValue3;
    }
    if (intermediateValue4 < 0.5f)
    {
        isFragmentDiscarded = true;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor0.x = RD_UNIFORM_TINT_COLOR.x * ((((scalarValue * varyingColor0.x) - scalarValue) * scalarValue3) + scalarValue);
    fragmentColor0.y = RD_UNIFORM_TINT_COLOR.y * ((((scalarValue1 * varyingColor0.y) - scalarValue1) * scalarValue3) + scalarValue1);
    fragmentColor0.z = RD_UNIFORM_TINT_COLOR.z * ((((scalarValue2 * varyingColor0.z) - scalarValue2) * scalarValue3) + scalarValue2);
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor0.x = RD_UNIFORM_TINT_COLOR.x * ((((RD_UNIFORM_CHANGE_COLOR.x * scalarValue1) - productValue) * scalarValue4) + productValue);
    fragmentColor0.y = RD_UNIFORM_TINT_COLOR.y * ((((RD_UNIFORM_CHANGE_COLOR.y * scalarValue1) - productValue1) * scalarValue4) + productValue1);
    fragmentColor0.z = RD_UNIFORM_TINT_COLOR.z * ((((RD_UNIFORM_CHANGE_COLOR.z * scalarValue1) - productValue2) * scalarValue4) + productValue2);
#endif
    fragmentColor0.w = (RD_UNIFORM_TINT_COLOR.w * intermediateValue4) * RD_UNIFORM_HUD_OPACITY.x;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
