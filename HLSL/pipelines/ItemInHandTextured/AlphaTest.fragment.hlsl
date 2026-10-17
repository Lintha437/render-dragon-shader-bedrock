// ItemInHandTextured / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 1
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
  workingVector0.x = RD_COMPARISON_MASK(0 != RD_UNIFORM_ALPHA_MASKED_TINT.x);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xyz = varyingColor0.xyz * workingVector1.xyz;
  workingVector0.yzw = workingVector1.xyz * varyingColor0.xyz + -workingVector1.xyz;
  workingVector0.yzw = workingVector1.www * workingVector0.yzw + workingVector1.xyz;
  workingVector3.xyz = varyingColor0.www * workingVector0.yzw;
  workingVector3.w = 1;
  workingVector2.w = workingVector1.w;
  workingVector0.xyzw = workingVector0.xxxx ? workingVector3.xyzw : workingVector2.xyzw;
  workingVector0.xyzw = RD_UNIFORM_MAT_COLOR.xyzw * workingVector0.xyzw;
  workingVector1.x = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector2.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector2.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector2.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.y = dot(workingVector2.xyz, workingVector2.xyz);
  workingVector1.y = rsqrt(workingVector1.y);
  workingVector1.yzw = workingVector2.xyz * workingVector1.yyy;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector2.xy = varyingColor0.xy * workingVector1.xy;
  workingVector0.yz = workingVector1.xy * varyingColor0.xy + -workingVector1.xy;
  workingVector0.yz = workingVector1.ww * workingVector0.yz + workingVector1.xy;
  workingVector1.xy = varyingColor0.ww * workingVector0.yz;
  workingVector1.z = 1;
  workingVector2.z = workingVector1.w;
  workingVector0.xyz = workingVector0.xxx ? workingVector1.xyz : workingVector2.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz * workingVector1.www;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.yzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyw;
  workingVector1.xy = varyingColor0.xy * workingVector0.yz;
  workingVector2.xy = workingVector0.yz * varyingColor0.xy + -workingVector0.yz;
  workingVector0.yz = workingVector0.ww * workingVector2.xy + workingVector0.yz;
  workingVector2.xy = varyingColor0.ww * workingVector0.yz;
  workingVector2.z = 1;
  workingVector1.z = workingVector0.w;
  workingVector0.xyz = workingVector0.xxx ? workingVector2.xyz : workingVector1.xyz;
  workingVector0.xyz = RD_UNIFORM_MAT_COLOR.xyw * workingVector0.xyz;
  workingVector0.w = RD_COMPARISON_MASK(RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.000000);
  workingVector1.x = RD_UNIFORM_VIEW_MATRIX_ROW_0.z;
  workingVector1.y = RD_UNIFORM_VIEW_MATRIX_ROW_1.z;
  workingVector1.z = RD_UNIFORM_VIEW_MATRIX_ROW_2.z;
  workingVector1.w = dot(workingVector1.xyz, workingVector1.xyz);
  workingVector1.w = rsqrt(workingVector1.w);
  workingVector1.xyz = workingVector1.xyz * workingVector1.www;
#endif
  workingVector2.xyz = -RD_UNIFORM_INV_VIEW_ROW_3.xyz + varyingTexCoord3.xyz;
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
  workingVector1.y = dot(-workingVector1.yzw, workingVector2.xyz);
  workingVector1.z = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.y = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.y;
  workingVector1.z = 1 / workingVector1.z;
  workingVector1.y = saturate(workingVector1.y * workingVector1.z);
  workingVector1.z = workingVector1.y * -2 + 3;
  workingVector1.y = workingVector1.y * workingVector1.y;
  workingVector1.y = workingVector1.z * workingVector1.y;
  workingVector1.zw = varyingColor3.xy / varyingColor3.ww;
  workingVector1.zw = workingVector1.zw * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.zw;
  workingVector1.zw = workingVector1.zw / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.zw = floor(workingVector1.zw);
  workingVector1.zw = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.zw;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.zwzw;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector1.x = dot(-workingVector1.xyz, workingVector2.xyz);
  workingVector1.y = RD_UNIFORM_DITHER_PARAMS2_ROW_0.y + -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x;
  workingVector1.x = -RD_UNIFORM_DITHER_PARAMS2_ROW_0.x + workingVector1.x;
  workingVector1.y = 1 / workingVector1.y;
  workingVector1.x = saturate(workingVector1.x * workingVector1.y);
  workingVector1.y = workingVector1.x * -2 + 3;
  workingVector1.x = workingVector1.x * workingVector1.x;
  workingVector1.x = workingVector1.y * workingVector1.x;
  workingVector1.yz = varyingColor3.xy / varyingColor3.ww;
  workingVector1.yz = workingVector1.yz * float2(0.5,0.5) + float2(0.5,0.5);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS.xy * workingVector1.yz;
  workingVector1.yz = workingVector1.yz / RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.yz = RD_UNIFORM_DITHER_PARAMS2_ROW_0.zz * workingVector1.yz;
  workingVector2.xyzw = float4(0.25,0.25,0.5,0.5) * workingVector1.yzyz;
#endif
  workingVector2.xyzw = floor(workingVector2.xyzw);
  workingVector2.yw = workingVector2.yw * workingVector2.yw;
  workingVector2.yw = float2(0.75,0.75) * workingVector2.yw;
  workingVector2.xy = workingVector2.xz * float2(0.5,0.5) + workingVector2.yw;
  workingVector2.xy = frac(workingVector2.xy);
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
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
  workingVector1.y = RD_COMPARISON_MASK(workingVector0.w < 0.5);
  workingVector1.x = (int)workingVector1.y | (int)workingVector1.x;
  if (workingVector1.x != 0) discard;
  workingVector1.xyz = float3(-1,-1,-1) + varyingColor0.xyz;
  workingVector1.xyz = RD_UNIFORM_COLOR_BASED.xxx * workingVector1.xyz + float3(1,1,1);
  workingVector0.xyz = workingVector1.xyz * workingVector0.xyz;
  workingVector1.xyz = workingVector0.xyz * RD_UNIFORM_CHANGE_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = varyingColor0.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyz;
  workingVector0.xyz = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyz;
  workingVector1.xyz = varyingColor1.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = workingVector0.w;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
  workingVector1.w = workingVector2.x * 0.25 + workingVector2.y;
  workingVector1.yz = floor(workingVector1.yz);
  workingVector1.z = workingVector1.z * workingVector1.z;
  workingVector1.z = 0.75 * workingVector1.z;
  workingVector1.y = workingVector1.y * 0.5 + workingVector1.z;
  workingVector1.y = frac(workingVector1.y);
  workingVector1.y = workingVector1.w * 0.25 + workingVector1.y;
  workingVector1.y = workingVector1.y * 64 + 0.5;
  workingVector1.y = 0.015625 * workingVector1.y;
  workingVector1.x = RD_COMPARISON_MASK(workingVector1.y >= workingVector1.x);
  workingVector0.w = workingVector0.w ? workingVector1.x : 0;
  workingVector1.x = RD_COMPARISON_MASK(workingVector0.z < 0.5);
  workingVector0.w = (int)workingVector0.w | (int)workingVector1.x;
  if (workingVector0.w != 0) discard;
  workingVector1.xy = float2(-1,-1) + varyingColor0.xy;
  workingVector1.xy = RD_UNIFORM_COLOR_BASED.xx * workingVector1.xy + float2(1,1);
  workingVector0.xy = workingVector1.xy * workingVector0.xy;
  workingVector1.xyz = RD_UNIFORM_CHANGE_COLOR.xyz * workingVector0.xxx;
  workingVector0.x = ceil(workingVector0.y);
  workingVector2.xyz = workingVector0.yyy * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.xyz + -workingVector1.xyz;
  workingVector0.xyw = workingVector0.xxx * workingVector2.xyz + workingVector1.xyz;
  workingVector1.xyz = RD_UNIFORM_OVERLAY_COLOR.xyz + -workingVector0.xyw;
  workingVector0.xyw = RD_UNIFORM_OVERLAY_COLOR.www * workingVector1.xyz + workingVector0.xyw;
  workingVector1.xyz = varyingColor1.xyz * workingVector0.xyw;
  workingVector0.xyw = -workingVector0.xyw * varyingColor1.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyw + workingVector1.xyz;
  fragmentColor0.w = workingVector0.z;
#endif
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
    float productValue7 = RD_UNIFORM_MAT_COLOR.w * intermediateValue4;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue19 = RD_UNIFORM_MAT_COLOR.w * intermediateValue3;
#endif
    bool comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue8 = floor(quotientValue1 * 0.25f);
        float productValue9 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = ((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue9 * productValue9) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue8 * productValue8) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)));
    }
    else
    {
        comparisonValue = false;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    if ((productValue7 < 0.5f) || comparisonValue)
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    if ((productValue19 < 0.5f) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_FEATURE_MULTI_COLOR_TINT == RD_OFF
    float productValue10 = (RD_UNIFORM_MAT_COLOR.x * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue11 = (RD_UNIFORM_MAT_COLOR.y * productValue4) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue12 = (RD_UNIFORM_MAT_COLOR.z * productValue5) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.z + (-1.0f))) + 1.0f);
    float productValue13 = (((productValue10 * RD_UNIFORM_CHANGE_COLOR.x) - productValue10) * varyingColor0.w) + productValue10;
    float productValue14 = (((productValue11 * RD_UNIFORM_CHANGE_COLOR.y) - productValue11) * varyingColor0.w) + productValue11;
    float productValue15 = (((productValue12 * RD_UNIFORM_CHANGE_COLOR.z) - productValue12) * varyingColor0.w) + productValue12;
    float productValue16 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue13) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue13) * varyingColor1.x;
    float productValue17 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue14) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue14) * varyingColor1.y;
    float productValue18 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue15) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue15) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue16) * varyingColor2.w) + productValue16;
    fragmentColor0.y = ((varyingColor2.y - productValue17) * varyingColor2.w) + productValue17;
    fragmentColor0.z = ((varyingColor2.z - productValue18) * varyingColor2.w) + productValue18;
    fragmentColor0.w = productValue7;
#elif RD_FEATURE_MULTI_COLOR_TINT == RD_ON
    float productValue20 = (RD_UNIFORM_MAT_COLOR.x * productValue2) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.x + (-1.0f))) + 1.0f);
    float productValue21 = (RD_UNIFORM_MAT_COLOR.y * productValue3) * ((RD_UNIFORM_COLOR_BASED.x * (varyingColor0.y + (-1.0f))) + 1.0f);
    float productValue22 = productValue20 * RD_UNIFORM_CHANGE_COLOR.x;
    float productValue23 = productValue20 * RD_UNIFORM_CHANGE_COLOR.y;
    float productValue24 = productValue20 * RD_UNIFORM_CHANGE_COLOR.z;
    float scalarValue5 = ceil(productValue21);
    float productValue25 = (((productValue21 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.x) - productValue22) * scalarValue5) + productValue22;
    float productValue26 = (((productValue21 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.y) - productValue23) * scalarValue5) + productValue23;
    float productValue27 = (((productValue21 * RD_UNIFORM_MULTIPLICATIVE_TINT_COLOR.z) - productValue24) * scalarValue5) + productValue24;
    float productValue28 = (((RD_UNIFORM_OVERLAY_COLOR.x - productValue25) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue25) * varyingColor1.x;
    float productValue29 = (((RD_UNIFORM_OVERLAY_COLOR.y - productValue26) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue26) * varyingColor1.y;
    float productValue30 = (((RD_UNIFORM_OVERLAY_COLOR.z - productValue27) * RD_UNIFORM_OVERLAY_COLOR.w) + productValue27) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.y = ((varyingColor2.y - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.z = ((varyingColor2.z - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.w = productValue19;
#endif
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
