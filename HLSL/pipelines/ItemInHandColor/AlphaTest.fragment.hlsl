// ItemInHandColor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/ItemInHandColor/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor3 : COLOR3,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor1 : COLOR1,
  float4 varyingTexCoord0 : TEXCOORD0,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.y;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.zw = varyingColor3.xy / varyingColor3.ww;
  workingVector0.zw = workingVector0.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.zw;
  workingVector0.zw = workingVector0.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.zw;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.zwzw;
  workingVector1.xyzw = floor(workingVector1.xyzw);
  workingVector1.yw = workingVector1.yw * workingVector1.yw;
  workingVector1.yw = float2(0.75,0.75) * workingVector1.yw;
  workingVector1.xy = workingVector1.xz * float2(0.5,0.5) + workingVector1.yw;
  workingVector1.xy = frac(workingVector1.xy);
  workingVector1.x = workingVector1.x * 0.25 + workingVector1.y;
  workingVector0.zw = floor(workingVector0.zw);
  workingVector0.w = workingVector0.w * workingVector0.w;
  workingVector0.w = 0.75 * workingVector0.w;
  workingVector0.z = workingVector0.z * 0.5 + workingVector0.w;
  workingVector0.z = frac(workingVector0.z);
  workingVector0.z = workingVector1.x * 0.25 + workingVector0.z;
  workingVector0.z = workingVector0.z * 64 + 0.5;
  workingVector0.z = 0.015625 * workingVector0.z;
  workingVector0.y = RD_COMPARISON_MASK(workingVector0.z >= workingVector0.y);
  workingVector0.x = workingVector0.y ? workingVector0.x : 0;
  if (workingVector0.x != 0) discard;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector0.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xy + float2(1,1);
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.x = ceil(workingVector0.y);
  workingVector1.yzw = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.xyz = workingVector1.xxx * workingVector1.yzw + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = 1;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65


void executeFragmentStage()
{
    isFragmentDiscarded = false;
    float productValue = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f;
    float productValue1 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue2 = (RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f;
    float productValue3 = (((productValue * RD_UNIFORM_CHANGE_COLOR.x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * RD_UNIFORM_CHANGE_COLOR.y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * RD_UNIFORM_CHANGE_COLOR.z) - productValue2) * varyingColor0.w) + productValue2;
    float productValue6 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue3) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue3) * varyingColor1.x;
    float productValue7 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue4) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue4) * varyingColor1.y;
    float productValue8 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue5) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue5) * varyingColor1.z;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue11 = productValue * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue12 = productValue * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue13 = productValue * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue1 = ceil(productValue1);
    float productValue14 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue11) * scalarValue1) + productValue11;
    float productValue15 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue12) * scalarValue1) + productValue12;
    float productValue16 = (((productValue1 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue13) * scalarValue1) + productValue13;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor1.x;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor1.y;
    float productValue19 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue16) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue16) * varyingColor1.z;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue9 = floor(quotientValue1 * 0.25f);
        float productValue10 = floor(quotientValue1 * 0.5f);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue10 * productValue10) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue9 * productValue9) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue * scalarValue) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
    {
        isFragmentDiscarded = true;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor0.x = ((varyingColor2.x - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.y = ((varyingColor2.y - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.z = ((varyingColor2.z - productValue19) * varyingColor2.w) + productValue19;
#endif
    fragmentColor0.w = 1.0f;
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
