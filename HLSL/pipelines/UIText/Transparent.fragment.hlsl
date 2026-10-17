// UIText / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_ALPHA_TEST
#define RD_FEATURE_ALPHA_TEST RD_OFF
#endif
#ifndef RD_OPTION_FONT_TYPE
#define RD_OPTION_FONT_TYPE RD_FONT_TYPE_BITMAP
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/UIText/FragmentBindings.hlsli"

#if (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE) || RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
void executeFragmentStage()
#elif RD_FEATURE_ALPHA_TEST == RD_ON
void discard_exit()
#endif
{
#if (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.xyzw = float4(-0.300000012,-0.300000012,-0.300000012,-0.300000012) + workingVector0.xyzw;
  workingVector0.xyzw = saturate(float4(5.00000048,5.00000048,5.00000048,5.00000048) * workingVector0.xyzw);
  workingVector1.xyzw = workingVector0.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
  workingVector0.xyzw = workingVector0.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM50)
  float4 workingVector0;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((sampledTextureValue.w * varyingColor0.w) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue = glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float clampedValue = clamp((sampledTextureValue.x + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue1 = clamp((sampledTextureValue.y + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue2 = clamp((sampledTextureValue.z + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue3 = clamp((sampledTextureValue.w + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    fragmentColor0.x = (((clampedValue * clampedValue) * varyingColor0.x) * (3.0f - (clampedValue * 2.0f))) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (((clampedValue1 * clampedValue1) * varyingColor0.y) * (3.0f - (clampedValue1 * 2.0f))) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (((clampedValue2 * clampedValue2) * varyingColor0.z) * (3.0f - (clampedValue2 * 2.0f))) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((((clampedValue3 * clampedValue3) * varyingColor0.w) * (3.0f - (clampedValue3 * 2.0f))) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM65)
    float4 sampledTextureValue1 = glyphTextureTexture.Sample(glyphTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (sampledTextureValue1.x * varyingColor0.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue1.y * varyingColor0.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue1.z * varyingColor0.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((sampledTextureValue1.w * varyingColor0.w) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF)
    float intermediateValue;
    float intermediateValue1;
    if (RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x > 0.00095000001601874828338623046875f)
    {
        intermediateValue = min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z);
        intermediateValue1 = min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w);
    }
    else
    {
        intermediateValue = varyingTexCoord0.x;
        intermediateValue1 = varyingTexCoord0.y;
    }
    float4 sampledTextureValue2 = glyphTextureTexture.Sample(glyphTextureSampler, float2(intermediateValue, intermediateValue1));
    float scalarValue = sampledTextureValue2.x;
    float scalarValue1 = sampledTextureValue2.y;
    float scalarValue2 = max(min(scalarValue, scalarValue1), min(max(scalarValue, scalarValue1), sampledTextureValue2.z));
    float sumValue = max(0.0f, RD_UNIFORM_GLYPH_CUTOFF.x - RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
    float clampedValue4 = clamp((scalarValue2 - sumValue) / (min(1.0f, RD_UNIFORM_GLYPH_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x) - sumValue), 0.0f, 1.0f);
    float productValue = (clampedValue4 * clampedValue4) * (3.0f - (clampedValue4 * 2.0f));
    float sumValue1 = max(0.0f, RD_UNIFORM_OUTLINE_CUTOFF.x - RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
    float clampedValue5 = clamp((scalarValue2 - sumValue1) / (min(1.0f, RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x) - sumValue1), 0.0f, 1.0f);
    float productValue1 = (clampedValue5 * clampedValue5) * (3.0f - (clampedValue5 * 2.0f));
    float productValue2 = floor(varyingTexCoord0.x * 16.0f) * 0.0625f;
    float productValue3 = floor(varyingTexCoord0.y * 16.0f) * 0.0625f;
    float sumValue2 = max(0.0f, RD_UNIFORM_OUTLINE_CUTOFF.x - RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x);
    float sampledTextureValue3 = clamp((glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x - RD_UNIFORM_SHADOW_OFFSET.x, productValue2), productValue2 + 0.0625f), min(max(varyingTexCoord0.y - RD_UNIFORM_SHADOW_OFFSET.y, productValue3), productValue3 + 0.0625f))).w - sumValue2) / (min(1.0f, RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x + RD_UNIFORM_OUTLINE_CUTOFF.x) - sumValue2), 0.0f, 1.0f);
    float productValue4 = ((sampledTextureValue3 * sampledTextureValue3) * (3.0f - (sampledTextureValue3 * 2.0f))) * RD_UNIFORM_SHADOW_COLOR.w;
    fragmentColor0.x = (((((productValue * (varyingColor0.x - RD_UNIFORM_OUTLINE_COLOR.x)) + RD_UNIFORM_OUTLINE_COLOR.x) - RD_UNIFORM_SHADOW_COLOR.x) * productValue1) + RD_UNIFORM_SHADOW_COLOR.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (((((productValue * (varyingColor0.y - RD_UNIFORM_OUTLINE_COLOR.y)) + RD_UNIFORM_OUTLINE_COLOR.y) - RD_UNIFORM_SHADOW_COLOR.y) * productValue1) + RD_UNIFORM_SHADOW_COLOR.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (((((productValue * (varyingColor0.z - RD_UNIFORM_OUTLINE_COLOR.z)) + RD_UNIFORM_OUTLINE_COLOR.z) - RD_UNIFORM_SHADOW_COLOR.z) * productValue1) + RD_UNIFORM_SHADOW_COLOR.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = (RD_UNIFORM_HUD_OPACITY.x * RD_UNIFORM_TINT_COLOR.w) * ((((productValue1 * ((productValue * (varyingColor0.w - RD_UNIFORM_OUTLINE_COLOR.w)) + RD_UNIFORM_OUTLINE_COLOR.w)) - productValue4) * productValue1) + productValue4);
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float4 sampledTextureValue = glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float scalarValue3 = sampledTextureValue.w;
    if (scalarValue3 < 0.5f)
    {
        discard_state = true;
    }
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((scalarValue3 * varyingColor0.w) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float4 sampledTextureValue = glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float clampedValue = clamp((sampledTextureValue.x + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue1 = clamp((sampledTextureValue.y + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue2 = clamp((sampledTextureValue.z + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float clampedValue3 = clamp((sampledTextureValue.w + (-0.300000011920928955078125f)) * 5.000000476837158203125f, 0.0f, 1.0f);
    float productValue5 = (clampedValue3 * clampedValue3) * (3.0f - (clampedValue3 * 2.0f));
    if (productValue5 < 0.5f)
    {
        discard_state = true;
    }
    fragmentColor0.x = (((clampedValue * clampedValue) * varyingColor0.x) * (3.0f - (clampedValue * 2.0f))) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (((clampedValue1 * clampedValue1) * varyingColor0.y) * (3.0f - (clampedValue1 * 2.0f))) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (((clampedValue2 * clampedValue2) * varyingColor0.z) * (3.0f - (clampedValue2 * 2.0f))) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((productValue5 * varyingColor0.w) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float4 sampledTextureValue1 = glyphTextureTexture.Sample(glyphTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.w;
    if (scalarValue4 < 0.5f)
    {
        discard_state = true;
    }
    fragmentColor0.x = (sampledTextureValue1.x * varyingColor0.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (sampledTextureValue1.y * varyingColor0.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (sampledTextureValue1.z * varyingColor0.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = ((scalarValue4 * varyingColor0.w) * RD_UNIFORM_TINT_COLOR.w) * RD_UNIFORM_HUD_OPACITY.x;
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF)
    if (discard_state)
    {
        discard;
    }
}
void executeFragmentStage()
{
    discard_state = false;
    float intermediateValue;
    float intermediateValue1;
    if (RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x > 0.00095000001601874828338623046875f)
    {
        intermediateValue = min(max(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z);
        intermediateValue1 = min(max(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w);
    }
    else
    {
        intermediateValue = varyingTexCoord0.x;
        intermediateValue1 = varyingTexCoord0.y;
    }
    float4 sampledTextureValue2 = glyphTextureTexture.Sample(glyphTextureSampler, float2(intermediateValue, intermediateValue1));
    float scalarValue = sampledTextureValue2.x;
    float scalarValue1 = sampledTextureValue2.y;
    if (sampledTextureValue2.w < 0.5f)
    {
        discard_state = true;
    }
    float scalarValue2 = max(min(scalarValue, scalarValue1), min(max(scalarValue, scalarValue1), sampledTextureValue2.z));
    float sumValue = max(0.0f, RD_UNIFORM_GLYPH_CUTOFF.x - RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
    float clampedValue6 = clamp((scalarValue2 - sumValue) / (min(1.0f, RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x) - sumValue), 0.0f, 1.0f);
    float productValue6 = (clampedValue6 * clampedValue6) * (3.0f - (clampedValue6 * 2.0f));
    float sumValue1 = max(0.0f, RD_UNIFORM_OUTLINE_CUTOFF.x - RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
    float clampedValue5 = clamp((scalarValue2 - sumValue1) / (min(1.0f, RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x) - sumValue1), 0.0f, 1.0f);
    float productValue1 = (clampedValue5 * clampedValue5) * (3.0f - (clampedValue5 * 2.0f));
    float productValue2 = floor(varyingTexCoord0.x * 16.0f) * 0.0625f;
    float productValue3 = floor(varyingTexCoord0.y * 16.0f) * 0.0625f;
    float sumValue2 = max(0.0f, RD_UNIFORM_OUTLINE_CUTOFF.x - RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x);
    float sampledTextureValue3 = clamp((glyphTextureTexture.Sample(glyphTextureSampler, float2(min(max(varyingTexCoord0.x - RD_UNIFORM_SHADOW_OFFSET.x, productValue2), productValue2 + 0.0625f), min(max(varyingTexCoord0.y - RD_UNIFORM_SHADOW_OFFSET.y, productValue3), productValue3 + 0.0625f))).w - sumValue2) / (min(1.0f, RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x + RD_UNIFORM_OUTLINE_CUTOFF.x) - sumValue2), 0.0f, 1.0f);
    float productValue4 = ((sampledTextureValue3 * sampledTextureValue3) * (3.0f - (sampledTextureValue3 * 2.0f))) * RD_UNIFORM_SHADOW_COLOR.w;
    fragmentColor0.x = (((((productValue6 * (varyingColor0.x - RD_UNIFORM_OUTLINE_COLOR.x)) + RD_UNIFORM_OUTLINE_COLOR.x) - RD_UNIFORM_SHADOW_COLOR.x) * productValue1) + RD_UNIFORM_SHADOW_COLOR.x) * RD_UNIFORM_TINT_COLOR.x;
    fragmentColor0.y = (((((productValue6 * (varyingColor0.y - RD_UNIFORM_OUTLINE_COLOR.y)) + RD_UNIFORM_OUTLINE_COLOR.y) - RD_UNIFORM_SHADOW_COLOR.y) * productValue1) + RD_UNIFORM_SHADOW_COLOR.y) * RD_UNIFORM_TINT_COLOR.y;
    fragmentColor0.z = (((((productValue6 * (varyingColor0.z - RD_UNIFORM_OUTLINE_COLOR.z)) + RD_UNIFORM_OUTLINE_COLOR.z) - RD_UNIFORM_SHADOW_COLOR.z) * productValue1) + RD_UNIFORM_SHADOW_COLOR.z) * RD_UNIFORM_TINT_COLOR.z;
    fragmentColor0.w = (RD_UNIFORM_HUD_OPACITY.x * RD_UNIFORM_TINT_COLOR.w) * ((((productValue1 * ((productValue6 * (varyingColor0.w - RD_UNIFORM_OUTLINE_COLOR.w)) + RD_UNIFORM_OUTLINE_COLOR.w)) - productValue4) * productValue1) + productValue4);
    discard_exit();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
#endif
}
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_ALPHA_TEST == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor0 : COLOR0,
  float4 varyingTexCoord1 : TEXCOORD1,
  float2 varyingTexCoord0 : TEXCOORD0,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP || RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH || RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.z = RD_COMPARISON_MASK(0.000950000016 < RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
  workingVector0.xy = workingVector0.zz ? workingVector0.xy : varyingTexCoord0.xy;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.w = max(workingVector0.x, workingVector0.y);
  workingVector0.xz = min(workingVector0.xw, workingVector0.yz);
  workingVector0.x = max(workingVector0.x, workingVector0.z);
  workingVector0.y = -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = workingVector0.x + -workingVector0.y;
  workingVector0.w = RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.y = workingVector0.w + -workingVector0.y;
  workingVector0.y = 1 / workingVector0.y;
  workingVector0.y = saturate(workingVector0.z * workingVector0.y);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector1.xyzw = -RD_UNIFORM_OUTLINE_COLOR.xyzw + varyingColor0.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + RD_UNIFORM_OUTLINE_COLOR.xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.x = workingVector0.x + -workingVector0.y;
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.y = workingVector0.z + -workingVector0.y;
  workingVector0.y = 1 / workingVector0.y;
  workingVector0.x = saturate(workingVector0.x * workingVector0.y);
  workingVector0.y = workingVector0.x * -2 + 3;
  workingVector0.x = workingVector0.x * workingVector0.x;
  workingVector0.x = workingVector0.y * workingVector0.x;
  workingVector1.w = workingVector1.w * workingVector0.x;
  workingVector0.yz = float2(16,16) * varyingTexCoord0.xy;
  workingVector0.yz = floor(workingVector0.yz);
  workingVector2.xy = float2(0.0625,0.0625) * workingVector0.yz;
  workingVector0.yz = workingVector0.yz * float2(0.0625,0.0625) + float2(0.0625,0.0625);
  workingVector2.zw = -RD_UNIFORM_SHADOW_OFFSET.xy + varyingTexCoord0.xy;
  workingVector2.xy = max(workingVector2.zw, workingVector2.xy);
  workingVector0.yz = min(workingVector2.xy, workingVector0.yz);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.yz).xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = workingVector2.w + -workingVector0.y;
  workingVector0.w = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.y = workingVector0.w + -workingVector0.y;
  workingVector0.y = 1 / workingVector0.y;
  workingVector0.y = saturate(workingVector0.z * workingVector0.y);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector2.w = RD_UNIFORM_SHADOW_COLOR.w * workingVector0.y;
  workingVector2.xyz = RD_UNIFORM_SHADOW_COLOR.xyz;
  workingVector1.xyzw = -workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.xyzw = float4(-0.300000012,-0.300000012,-0.300000012,-0.300000012) + workingVector0.xyzw;
  workingVector0.xyzw = saturate(float4(5.00000048,5.00000048,5.00000048,5.00000048) * workingVector0.xyzw);
  workingVector1.xyzw = workingVector0.xyzw * float4(-2,-2,-2,-2) + float4(3,3,3,3);
  workingVector0.xyzw = workingVector0.xyzw * workingVector0.xyzw;
  workingVector0.xyzw = workingVector1.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
#elif RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector1.x != 0) discard;
  workingVector0.xyzw = varyingColor0.xyzw * workingVector0.xyzw;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.x = RD_COMPARISON_MASK(0.000950000016 < RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
  workingVector0.yz = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.yz = min(varyingTexCoord1.zw, workingVector0.yz);
  workingVector0.xy = workingVector0.xx ? workingVector0.yz : varyingTexCoord0.xy;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector0.w = min(workingVector0.x, workingVector0.y);
  workingVector0.x = max(workingVector0.x, workingVector0.y);
  workingVector0.x = min(workingVector0.x, workingVector0.z);
  workingVector0.x = max(workingVector0.w, workingVector0.x);
  workingVector0.y = -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.z = workingVector0.z + -workingVector0.y;
  workingVector0.y = workingVector0.x + -workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector1.xyzw = -RD_UNIFORM_OUTLINE_COLOR.xyzw + varyingColor0.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + RD_UNIFORM_OUTLINE_COLOR.xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.xz = workingVector0.xz + -workingVector0.yy;
  workingVector0.y = 1 / workingVector0.z;
  workingVector0.x = saturate(workingVector0.x * workingVector0.y);
  workingVector0.y = workingVector0.x * -2 + 3;
  workingVector0.x = workingVector0.x * workingVector0.x;
  workingVector0.x = workingVector0.y * workingVector0.x;
  workingVector1.w = workingVector1.w * workingVector0.x;
  workingVector0.yz = float2(16,16) * varyingTexCoord0.xy;
  workingVector0.yz = floor(workingVector0.yz);
  workingVector2.xy = float2(0.0625,0.0625) * workingVector0.yz;
  workingVector0.yz = workingVector0.yz * float2(0.0625,0.0625) + float2(0.0625,0.0625);
  workingVector2.zw = -RD_UNIFORM_SHADOW_OFFSET.xy + varyingTexCoord0.xy;
  workingVector2.xy = max(workingVector2.zw, workingVector2.xy);
  workingVector0.yz = min(workingVector2.xy, workingVector0.yz);
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.yz).xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.z = workingVector0.z + -workingVector0.y;
  workingVector0.y = workingVector2.w + -workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector2.w = RD_UNIFORM_SHADOW_COLOR.w * workingVector0.y;
  workingVector2.xyz = RD_UNIFORM_SHADOW_COLOR.xyz;
  workingVector1.xyzw = -workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xy = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.xy = min(varyingTexCoord1.zw, workingVector0.xy);
  workingVector0.z = RD_COMPARISON_MASK(0.000950000016 < RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
  workingVector0.xy = workingVector0.zz ? workingVector0.xy : varyingTexCoord0.xy;
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyz;
  workingVector0.w = max(workingVector0.x, workingVector0.y);
  workingVector0.xz = min(workingVector0.xw, workingVector0.yz);
  workingVector0.x = max(workingVector0.x, workingVector0.z);
  workingVector0.y = -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = workingVector0.x + -workingVector0.y;
  workingVector0.w = RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.y = workingVector0.w + -workingVector0.y;
  workingVector0.y = 1 / workingVector0.y;
  workingVector0.y = saturate(workingVector0.z * workingVector0.y);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector1.xyzw = -RD_UNIFORM_OUTLINE_COLOR.xyzw + varyingColor0.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + RD_UNIFORM_OUTLINE_COLOR.xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.x = workingVector0.x + -workingVector0.y;
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.y = workingVector0.z + -workingVector0.y;
  workingVector0.y = 1 / workingVector0.y;
  workingVector0.x = saturate(workingVector0.x * workingVector0.y);
  workingVector0.y = workingVector0.x * -2 + 3;
  workingVector0.x = workingVector0.x * workingVector0.x;
  workingVector0.x = workingVector0.y * workingVector0.x;
  workingVector1.w = workingVector1.w * workingVector0.x;
  workingVector0.yz = float2(16,16) * varyingTexCoord0.xy;
  workingVector0.yz = floor(workingVector0.yz);
  workingVector2.xy = float2(0.0625,0.0625) * workingVector0.yz;
  workingVector0.yz = workingVector0.yz * float2(0.0625,0.0625) + float2(0.0625,0.0625);
  workingVector2.zw = -RD_UNIFORM_SHADOW_OFFSET.xy + varyingTexCoord0.xy;
  workingVector2.xy = max(workingVector2.zw, workingVector2.xy);
  workingVector0.yz = min(workingVector2.xy, workingVector0.yz);
  workingVector0.y = materialTexture0.Sample(textureSampler0, workingVector0.yz).w;
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.z = max(0, workingVector0.z);
  workingVector0.y = workingVector0.y + -workingVector0.z;
  workingVector0.w = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.z = workingVector0.w + -workingVector0.z;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector2.w = RD_UNIFORM_SHADOW_COLOR.w * workingVector0.y;
  workingVector2.xyz = RD_UNIFORM_SHADOW_COLOR.xyz;
  workingVector1.xyzw = -workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.x = RD_COMPARISON_MASK(0.000950000016 < RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x);
  workingVector0.yz = max(varyingTexCoord0.xy, varyingTexCoord1.xy);
  workingVector0.yz = min(varyingTexCoord1.zw, workingVector0.yz);
  workingVector0.xy = workingVector0.xx ? workingVector0.yz : varyingTexCoord0.xy;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, workingVector0.xy).xyzw;
  workingVector0.w = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  if (workingVector0.w != 0) discard;
  workingVector0.w = min(workingVector0.x, workingVector0.y);
  workingVector0.x = max(workingVector0.x, workingVector0.y);
  workingVector0.x = min(workingVector0.x, workingVector0.z);
  workingVector0.x = max(workingVector0.w, workingVector0.x);
  workingVector0.y = -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x + RD_UNIFORM_GLYPH_CUTOFF.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.z = workingVector0.z + -workingVector0.y;
  workingVector0.y = workingVector0.x + -workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector1.xyzw = -RD_UNIFORM_OUTLINE_COLOR.xyzw + varyingColor0.xyzw;
  workingVector1.xyzw = workingVector0.yyyy * workingVector1.xyzw + RD_UNIFORM_OUTLINE_COLOR.xyzw;
  workingVector0.y = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.y = max(0, workingVector0.y);
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_GLYPH_SMOOTH_RADIUS.x;
  workingVector0.z = min(1, workingVector0.z);
  workingVector0.xz = workingVector0.xz + -workingVector0.yy;
  workingVector0.y = 1 / workingVector0.z;
  workingVector0.x = saturate(workingVector0.x * workingVector0.y);
  workingVector0.y = workingVector0.x * -2 + 3;
  workingVector0.x = workingVector0.x * workingVector0.x;
  workingVector0.x = workingVector0.y * workingVector0.x;
  workingVector1.w = workingVector1.w * workingVector0.x;
  workingVector0.yz = float2(16,16) * varyingTexCoord0.xy;
  workingVector0.yz = floor(workingVector0.yz);
  workingVector2.xy = float2(0.0625,0.0625) * workingVector0.yz;
  workingVector0.yz = workingVector0.yz * float2(0.0625,0.0625) + float2(0.0625,0.0625);
  workingVector2.zw = -RD_UNIFORM_SHADOW_OFFSET.xy + varyingTexCoord0.xy;
  workingVector2.xy = max(workingVector2.zw, workingVector2.xy);
  workingVector0.yz = min(workingVector2.xy, workingVector0.yz);
  workingVector0.y = materialTexture0.Sample(textureSampler0, workingVector0.yz).w;
  workingVector0.z = RD_UNIFORM_OUTLINE_CUTOFF.x + -RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.z = max(0, workingVector0.z);
  workingVector0.w = RD_UNIFORM_OUTLINE_CUTOFF.x + RD_UNIFORM_SHADOW_SMOOTH_RADIUS.x;
  workingVector0.w = min(1, workingVector0.w);
  workingVector0.yw = workingVector0.yw + -workingVector0.zz;
  workingVector0.z = 1 / workingVector0.w;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector2.w = RD_UNIFORM_SHADOW_COLOR.w * workingVector0.y;
  workingVector2.xyz = RD_UNIFORM_SHADOW_COLOR.xyz;
  workingVector1.xyzw = -workingVector2.xyzw + workingVector1.xyzw;
  workingVector0.xyzw = workingVector0.xxxx * workingVector1.xyzw + workingVector2.xyzw;
#endif
  workingVector0.xyzw = RD_UNIFORM_TINT_COLOR.xyzw * workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  fragmentColor0.xyz = workingVector0.xyz;
  return;
}
#endif
