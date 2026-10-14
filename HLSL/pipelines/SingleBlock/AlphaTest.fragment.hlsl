// SingleBlock / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/SingleBlock/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor3 : COLOR3,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_1.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_1.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor3.xy / varyingColor3.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_1.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
  workingVector2.x = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.w = workingVector1.w * workingVector1.w;
  workingVector1.w = 0.75 * workingVector1.w;
  workingVector1.z = workingVector1.z * 0.5 + workingVector1.w;
  workingVector1.z = frac(workingVector1.z);
  workingVector1.z = workingVector2.x * 0.25 + workingVector1.z;
  workingVector1.z = workingVector1.z * 64 + 0.5;
  workingVector1.z = 0.015625 * workingVector1.z;
  workingVector1.y = RD_COMPARISON_MASK(workingVector1.z >= workingVector1.y);
  workingVector1.x = workingVector1.y ? workingVector1.x : 0;
  workingVector1.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
  workingVector1.z = ~(int)workingVector1.y;
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
  workingVector1.w = RD_COMPARISON_MASK(0 >= workingVector0.w);
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
  workingVector1.w = RD_COMPARISON_MASK(workingVector0.w < RD_UNIFORM_DISCARD_VALUE.x);
#endif
  workingVector1.x = (int)workingVector1.x | (int)workingVector1.w;
  workingVector1.x = workingVector1.x ? workingVector1.z : 0;
  if (workingVector1.x != 0) discard;
  workingVector1.xzw = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xzw + workingVector0.xyz;
#if RD_FEATURE_LIT == RD_ON
  workingVector0.xyzw = varyingColor1.xyzw * workingVector0.xyzw;
#endif
  workingVector1.xzw = workingVector0.xyz * varyingColor0.xyz + -workingVector0.xyz;
  workingVector1.xzw = workingVector0.www * workingVector1.xzw + workingVector0.xyz;
  workingVector1.xzw = RD_UNIFORM_CURRENT_COLOR.xyz * workingVector1.xzw;
  workingVector2.xyz = varyingColor0.www * workingVector1.xzw;
  workingVector3.xyzw = RD_UNIFORM_CURRENT_COLOR.xyzw * varyingColor0.xyzw;
  workingVector0.xyzw = workingVector3.xyzw * workingVector0.xyzw;
  workingVector2.w = 1;
  workingVector0.xyzw = workingVector1.yyyy ? workingVector2.xyzw : workingVector0.xyzw;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * workingVector0.w;
  workingVector1.xyz = varyingColor2.xyz + -workingVector0.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
    bool comparisonValue;
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
    uint comparisonValue;
#endif
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_1.y - RD_UNIFORM_DITHER_PARAMS2_ROW_1.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_1.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_1.z;
        float productValue = floor(quotientValue1 * 0.25f);
        float productValue1 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue * productValue) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)));
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
        comparisonValue = uint(((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue1 * productValue1) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue * productValue) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f))));
#endif
    }
    else
    {
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
        comparisonValue = false;
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
        comparisonValue = 0u;
#endif
    }
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
    if (((scalarValue3 <= 0.0f) || comparisonValue) && (RD_UNIFORM_ALPHA_MASKED_TINT.x == 0.0f))
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
    if (!(RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f))
#endif
    {
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
        isFragmentDiscarded = true;
#elif RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
        if ((comparisonValue != 0u) || (scalarValue3 < RD_UNIFORM_DISCARD_VALUE.x))
        {
            isFragmentDiscarded = true;
        }
#endif
    }
#if RD_FEATURE_LIT == RD_OFF
    float productValue2 = ((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue;
    float productValue3 = ((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1;
    float productValue4 = ((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2;
    float productValue5 = productValue2 * varyingColor0.x;
    float productValue6 = productValue3 * varyingColor0.y;
    float productValue7 = productValue4 * varyingColor0.z;
    float productValue8;
#elif RD_FEATURE_LIT == RD_ON
    float productValue12 = (((RD_UNIFORM_OVERLAY_COLOR.x - scalarValue) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue) * varyingColor1.x;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.y - scalarValue1) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue1) * varyingColor1.y;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.z - scalarValue2) * RD_UNIFORM_OVERLAY_COLOR.w) + scalarValue2) * varyingColor1.z;
    float productValue15 = scalarValue3 * varyingColor1.w;
    float productValue16 = productValue12 * varyingColor0.x;
    float productValue17 = productValue13 * varyingColor0.y;
    float productValue18 = productValue14 * varyingColor0.z;
#endif
    float productValue9;
    float productValue10;
#if RD_FEATURE_LIT == RD_ON
    float productValue11;
#endif
    float intermediateValue5;
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if RD_FEATURE_LIT == RD_OFF
        productValue8 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue5 - productValue2) * scalarValue3) + productValue2);
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue6 - productValue3) * scalarValue3) + productValue3);
        productValue10 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue7 - productValue4) * scalarValue3) + productValue4);
#elif RD_FEATURE_LIT == RD_ON
        productValue9 = (RD_UNIFORM_CURRENT_COLOR.x * varyingColor0.w) * (((productValue16 - productValue12) * productValue15) + productValue12);
        productValue10 = (RD_UNIFORM_CURRENT_COLOR.y * varyingColor0.w) * (((productValue17 - productValue13) * productValue15) + productValue13);
        productValue11 = (RD_UNIFORM_CURRENT_COLOR.z * varyingColor0.w) * (((productValue18 - productValue14) * productValue15) + productValue14);
#endif
        intermediateValue5 = 1.0f;
    }
    else
    {
#if RD_FEATURE_LIT == RD_OFF
        productValue8 = productValue5 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue9 = productValue6 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue10 = productValue7 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue5 = (scalarValue3 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#elif RD_FEATURE_LIT == RD_ON
        productValue9 = productValue16 * RD_UNIFORM_CURRENT_COLOR.x;
        productValue10 = productValue17 * RD_UNIFORM_CURRENT_COLOR.y;
        productValue11 = productValue18 * RD_UNIFORM_CURRENT_COLOR.z;
        intermediateValue5 = (productValue15 * varyingColor0.w) * RD_UNIFORM_CURRENT_COLOR.w;
#endif
    }
#if RD_FEATURE_LIT == RD_OFF
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
#elif RD_FEATURE_LIT == RD_ON
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
#endif
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * intermediateValue5;
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor3 = stage_input.varyingColor3;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor1 = stage_input.varyingColor1;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
