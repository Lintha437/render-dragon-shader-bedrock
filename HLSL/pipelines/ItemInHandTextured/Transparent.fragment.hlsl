// ItemInHandTextured / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 8
#endif


#include "../../include/materials/ItemInHandTextured/FragmentBindings.hlsli"

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
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  float4 workingVector0,workingVector1,workingVector2,workingVector3;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  float4 workingVector0,workingVector1,workingVector2;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = varyingColor3.xy / varyingColor3.ww;
  workingVector0.xy = workingVector0.xy * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS.xy * workingVector0.xy;
  workingVector0.xy = workingVector0.xy / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector0.xy = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector0.xy;
  workingVector1.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector0.xyxy;
  workingVector0.xy = floor(workingVector0.xy);
  workingVector1.xyzw = floor(workingVector1.xyzw);
  workingVector0.zw = workingVector1.yw * workingVector1.yw;
  workingVector0.zw = float2(0.75,0.75) * workingVector0.zw;
  workingVector0.zw = workingVector1.xz * float2(0.5,0.5) + workingVector0.zw;
  workingVector0.zw = frac(workingVector0.zw);
  workingVector0.z = workingVector0.z * 0.25 + workingVector0.w;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = 0.75 * workingVector0.y;
  workingVector0.x = workingVector0.x * 0.5 + workingVector0.y;
  workingVector0.x = frac(workingVector0.x);
  workingVector0.x = workingVector0.z * 0.25 + workingVector0.x;
  workingVector0.x = workingVector0.x * 64 + 0.5;
  workingVector0.x = 0.015625 * workingVector0.x;
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector0.y = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector0.y = rsqrt(workingVector0.y);
  workingVector0.yzw = workingVector1.xyz * workingVector0.yyy;
  workingVector1.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
  workingVector0.y = dot(-workingVector0.yzw, workingVector1.xyz);
  workingVector0.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector0.y;
  workingVector0.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector0.z = 1 / workingVector0.z;
  workingVector0.y = saturate(workingVector0.y * workingVector0.z);
  workingVector0.z = workingVector0.y * -2 + 3;
  workingVector0.y = workingVector0.y * workingVector0.y;
  workingVector0.y = workingVector0.z * workingVector0.y;
  workingVector0.x = RD_COMPARISON_MASK(workingVector0.x >= workingVector0.y);
  workingVector0.y = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector0.x = workingVector0.x ? workingVector0.y : 0;
  workingVector0.x = workingVector0.x ? 0 : 1;
  workingVector0.y = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.w = 1;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector3.xyz = workingVector2.xyz * varyingColor0.xyz + -workingVector2.xyz;
  workingVector3.xyz = workingVector2.www * workingVector3.xyz + workingVector2.xyz;
  workingVector1.xyz = varyingColor0.www * workingVector3.xyz;
  workingVector2.xyz = varyingColor0.xyz * workingVector2.xyz;
  workingVector1.xyzw = workingVector0.yyyy ? workingVector1.xyzw : workingVector2.xyzw;
  workingVector1.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector1.xyzw;
  fragmentColor0.w = workingVector1.w * workingVector0.x;
  workingVector0.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector0.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector0.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.z = 1;
  workingVector2.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xywz;
  workingVector0.zw = workingVector2.xy * varyingColor0.xy + -workingVector2.xy;
  workingVector0.zw = workingVector2.zz * workingVector0.zw + workingVector2.xy;
  workingVector1.xy = varyingColor0.ww * workingVector0.zw;
  workingVector2.xy = varyingColor0.xy * workingVector2.xy;
  workingVector0.yzw = workingVector0.yyy ? workingVector1.xyz : workingVector2.xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.yzw;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xw = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xw = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xw + float2(1,1);
  workingVector0.xy = workingVector0.yz * workingVector0.xw;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector1.z = 1;
  workingVector2.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector0.zw = workingVector2.xy * varyingColor0.xy + -workingVector2.xy;
  workingVector0.zw = workingVector2.zz * workingVector0.zw + workingVector2.xy;
  workingVector1.xy = varyingColor0.ww * workingVector0.zw;
  workingVector2.xy = varyingColor0.xy * workingVector2.xy;
  workingVector0.yzw = workingVector0.yyy ? workingVector1.xyz : workingVector2.xyz;
  workingVector0.yzw = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.yzw;
  fragmentColor0.w = workingVector0.w * workingVector0.x;
  workingVector0.xw = float2(-1,-1) + varyingColor0.xy;
  workingVector0.xw = RD_UNIFORM_COLOR_BASED.xx * workingVector0.xw + float2(1,1);
  workingVector0.xy = workingVector0.yz * workingVector0.xw;
  workingVector0.xzw = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector1.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector0.xzw;
  workingVector0.y = ceil(workingVector0.y);
  workingVector0.xyz = workingVector0.yyy * workingVector1.xyz + workingVector0.xzw;
#endif
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float scalarValue2 = sampledTextureValue.z;
#endif
    float scalarValue3 = sampledTextureValue.w;
    float productValue = scalarValue * varyingColor0.x;
    float productValue1 = scalarValue1 * varyingColor0.y;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue6 = scalarValue2 * varyingColor0.z;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue2;
#endif
    float productValue3;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue4;
    float productValue5;
    float intermediateValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float intermediateValue3;
#endif
    if (RD_UNIFORM_ALPHA_MASKED_TINT.x != 0.0f)
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        productValue5 = (((productValue6 - scalarValue2) * scalarValue3) + scalarValue2) * varyingColor0.w;
        intermediateValue4 = 1.0f;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = (((productValue - scalarValue) * scalarValue3) + scalarValue) * varyingColor0.w;
        productValue3 = (((productValue1 - scalarValue1) * scalarValue3) + scalarValue1) * varyingColor0.w;
        intermediateValue3 = 1.0f;
#endif
    }
    else
    {
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue6;
        intermediateValue4 = scalarValue3;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
        productValue2 = productValue;
        productValue3 = productValue1;
        intermediateValue3 = scalarValue3;
#endif
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue7 = (RD_UNIFORM_MAT_COLOR.x * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue8 = (RD_UNIFORM_MAT_COLOR.y * productValue4) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue9 = (RD_UNIFORM_MAT_COLOR.z * productValue5) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue10 = (((productValue7 * RD_UNIFORM_CHANGE_COLOR.x) - productValue7) * varyingColor0.w) + productValue7;
    float productValue11 = (((productValue8 * RD_UNIFORM_CHANGE_COLOR.y) - productValue8) * varyingColor0.w) + productValue8;
    float productValue12 = (((productValue9 * RD_UNIFORM_CHANGE_COLOR.z) - productValue9) * varyingColor0.w) + productValue9;
    float productValue13 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue10) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue10) * varyingColor1.x;
    float productValue14 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue11) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue11) * varyingColor1.y;
    float productValue15 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue12) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue12) * varyingColor1.z;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue18 = (RD_UNIFORM_MAT_COLOR.x * productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue19 = (RD_UNIFORM_MAT_COLOR.y * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue20 = productValue18 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue21 = productValue18 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue22 = productValue18 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue5 = ceil(productValue19);
    float productValue23 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue20) * scalarValue5) + productValue20;
    float productValue24 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue21) * scalarValue5) + productValue21;
    float productValue25 = (((productValue19 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue22) * scalarValue5) + productValue22;
    float productValue26 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue23) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue23) * varyingColor1.x;
    float productValue27 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue24) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue24) * varyingColor1.y;
    float productValue28 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor1.z;
#endif
    float comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue16 = floor(quotientValue1 * 0.25f);
        float productValue17 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = (((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue17 * productValue17) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue16 * productValue16) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)))) ? 0.0f : 1.0f;
    }
    else
    {
        comparisonValue = 1.0f;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = (RD_UNIFORM_MAT_COLOR.w * intermediateValue4) * comparisonValue;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    fragmentColor0.x = ((varyingColor2.x - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.y = ((varyingColor2.y - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.z = ((varyingColor2.z - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.w = (RD_UNIFORM_MAT_COLOR.w * intermediateValue3) * comparisonValue;
#endif
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
