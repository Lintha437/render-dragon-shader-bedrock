// ActorBanner / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/ActorBanner/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingColor3 : COLOR3,
  float4 varyingTexCoord0 : TEXCOORD0,
  linear centroid float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
  float4 workingVector0,workingVector1;
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
  workingVector0.xy = varyingColor1.xy / varyingColor1.ww;
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
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord2.xy).xyzw;
  workingVector0.y = workingVector1.x * workingVector1.w;
  workingVector0.z = -workingVector1.x * workingVector1.w + workingVector1.w;
  workingVector0.y = varyingColor0.w * workingVector0.z + workingVector0.y;
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord2.zw).xyzw;
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector1.w;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.yz = materialTexture0.Sample(textureSampler0, varyingTexCoord2.xy).xw;
  workingVector0.w = workingVector0.y * workingVector0.z;
  workingVector0.y = -workingVector0.y * workingVector0.z + workingVector0.z;
  workingVector0.y = varyingColor0.w * workingVector0.y + workingVector0.w;
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector0.y;
#endif
  fragmentColor0.w = workingVector0.x ? 0 : workingVector0.y;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord2.zw).xyzw;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif RD_FEATURE_TINTING == RD_OFF
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord2.zw).xyz;
  workingVector0.xyz = varyingColor0.xyz * workingVector0.xyz;
  workingVector1.xyz = varyingColor3.xyz * workingVector0.xyz;
  workingVector0.xyz = -workingVector0.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord2.z, varyingTexCoord2.w));
#if RD_FEATURE_TINTING == RD_ON
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue = sampledTextureValue1.x * scalarValue;
    float productValue1 = ((scalarValue - productValue) * varyingColor0.w) + productValue;
#elif RD_FEATURE_TINTING == RD_OFF
    float scalarValue2 = sampledTextureValue.w;
#endif
    float comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
    {
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue2 = floor(quotientValue1 * 0.25f);
        float productValue3 = floor(quotientValue1 * 0.5f);
        float scalarValue1 = floor(quotientValue1);
#if RD_FEATURE_TINTING == RD_ON
        comparisonValue = (((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue3 * productValue3) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue2 * productValue2) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)))) ? 0.0f : productValue1;
#elif RD_FEATURE_TINTING == RD_OFF
        comparisonValue = (((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue3 * productValue3) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue2 * productValue2) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue1 * scalarValue1) * 0.75f) + (floor(quotientValue) * 0.5f)))) ? 0.0f : scalarValue2;
#endif
    }
    else
    {
#if RD_FEATURE_TINTING == RD_ON
        comparisonValue = productValue1;
#elif RD_FEATURE_TINTING == RD_OFF
        comparisonValue = scalarValue2;
#endif
    }
#if RD_FEATURE_TINTING == RD_ON
    float productValue4 = (varyingColor0.x * varyingColor3.x) * sampledTextureValue.x;
    float productValue5 = (varyingColor0.y * varyingColor3.y) * sampledTextureValue.y;
    float productValue6 = (varyingColor0.z * varyingColor3.z) * sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor2.x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((varyingColor2.y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((varyingColor2.z - productValue6) * varyingColor2.w) + productValue6;
#elif RD_FEATURE_TINTING == RD_OFF
    float productValue7 = sampledTextureValue.x * varyingColor3.x;
    float productValue8 = sampledTextureValue.y * varyingColor3.y;
    float productValue9 = sampledTextureValue.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
#endif
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * comparisonValue;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingColor3 = stage_input.varyingColor3;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
#endif
