// ActorPatternGlint / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 10
#endif


#include "../../include/materials/ActorPatternGlint/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
void main(
  float4 pixelPosition : SV_POSITION0,
  float4 varyingColor1 : COLOR1,
  float4 varyingColor0 : COLOR0,
  float4 varyingColor2 : COLOR2,
  float4 varyingTexCoord1 : TEXCOORD1,
  float4 varyingColor3 : COLOR3,
  linear centroid float4 varyingTexCoord0 : TEXCOORD0,
  float4 varyingTexCoord2 : TEXCOORD2,
  float3 varyingTexCoord3 : TEXCOORD3,
  out float4 fragmentColor0 : SV_TARGET0)
{
#if RD_FEATURE_TINTING == RD_ON
  float4 workingVector0,workingVector1,workingVector2;
#elif RD_FEATURE_TINTING == RD_OFF
  float4 workingVector0,workingVector1;
#endif
  uint4 bitMask, integerResult;
  float4 floatingPointResult;
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+9].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+9].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+2].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+2].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor2.xyz + -workingVector1.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
  workingVector0.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+9].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+9].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+2].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+2].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON)
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
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector1.w;
  fragmentColor0.w = workingVector0.x ? 0 : workingVector0.y;
  workingVector0.xyz = varyingColor2.xyz + -workingVector1.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF)
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
  workingVector1.xyzw = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyzw;
  workingVector0.y = RD_UNIFORM_HUD_OPACITY.x * workingVector1.w;
  fragmentColor0.w = workingVector0.x ? 0 : workingVector0.y;
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+9].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+9].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+2].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+2].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor2.xyz + -workingVector1.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector0.xyz + workingVector1.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
  workingVector0.xyz = materialTexture0.Sample(textureSampler0, varyingTexCoord0.xy).xyz;
  workingVector0.w = (int)RD_UNIFORM_PATTERN_COUNT.x;
  workingVector1.xyz = workingVector0.xyz;
  workingVector1.w = 0;
  while (true) {
    workingVector2.x = RD_COMPARISON_MASK((int)workingVector1.w >= (int)workingVector0.w);
    if (workingVector2.x != 0) break;
    workingVector2.xy = fragmentVectorConstants1[workingVector1.w+9].zw * varyingTexCoord0.xy + fragmentVectorConstants1[workingVector1.w+9].xy;
    workingVector2.xyzw = materialTexture2.Sample(textureSampler2, workingVector2.xy).xyzw;
    workingVector2.w = fragmentVectorConstants1[workingVector1.w+2].w * workingVector2.w;
    workingVector2.xyz = workingVector2.xyz * fragmentVectorConstants1[workingVector1.w+2].xyz + -workingVector1.xyz;
    workingVector1.xyz = workingVector2.www * workingVector2.xyz + workingVector1.xyz;
    workingVector1.w = (int)workingVector1.w + 1;
  }
  workingVector0.xyz = varyingColor3.xyz * workingVector1.xyz;
  workingVector1.xyz = -workingVector1.xyz * varyingColor3.xyz + varyingColor2.xyz;
  fragmentColor0.xyz = varyingColor2.www * workingVector1.xyz + workingVector0.xyz;
  fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#endif
  return;
}
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void executeFragmentStage()
{
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
#if RD_FEATURE_TINTING == RD_ON
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))) > int(0u))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON)
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF)
    float scalarValue3 = sampledTextureValue.w;
    float comparisonValue;
    if (RD_UNIFORM_DITHERING_ENABLED_TOGGLE.x != 0.0f)
#endif
    {
#if RD_FEATURE_TINTING == RD_ON
        uint intermediateValue6;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        intermediateValue6 = 0u;
        intermediateValue7 = scalarValue;
        intermediateValue8 = scalarValue1;
        intermediateValue9 = scalarValue2;
        float productValue;
        float productValue1;
        float productValue2;
        for (;;)
        {
            uint sumValue = intermediateValue6 + 9u;
            uint sumValue1 = intermediateValue6 + 2u;
            float4 sampledTextureValue1 = matTexture2Texture.Sample(matTexture2Sampler, float2((fragmentConstants[sumValue].z * varyingTexCoord0.x) + fragmentConstants[sumValue].x, (fragmentConstants[sumValue].w * varyingTexCoord0.y) + fragmentConstants[sumValue].y));
            float productValue3 = sampledTextureValue1.w * fragmentConstants[sumValue1].w;
            productValue = (((sampledTextureValue1.x * fragmentConstants[sumValue1].x) - intermediateValue7) * productValue3) + intermediateValue7;
            productValue1 = (((sampledTextureValue1.y * fragmentConstants[sumValue1].y) - intermediateValue8) * productValue3) + intermediateValue8;
            productValue2 = (((sampledTextureValue1.z * fragmentConstants[sumValue1].z) - intermediateValue9) * productValue3) + intermediateValue9;
            uint sumValue2 = intermediateValue6 + 1u;
            if (int(sumValue2) < int(uint(int(RD_UNIFORM_PATTERN_COUNT.x))))
            {
                intermediateValue6 = sumValue2;
                intermediateValue7 = productValue;
                intermediateValue8 = productValue1;
                intermediateValue9 = productValue2;
            }
            else
            {
                break;
            }
        }
        intermediateValue3 = productValue;
        intermediateValue4 = productValue1;
        intermediateValue5 = productValue2;
#elif RD_FEATURE_TINTING == RD_OFF
        float inverseLengthValue = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue)), float3(varyingTexCoord3.x - RD_UNIFORM_INV_VIEW_ROW_3.x, varyingTexCoord3.y - RD_UNIFORM_INV_VIEW_ROW_3.y, varyingTexCoord3.z - RD_UNIFORM_INV_VIEW_ROW_3.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_0.y - RD_UNIFORM_DITHER_PARAMS2_ROW_0.x), 0.0f, 1.0f);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_0.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_0.z;
        float productValue7 = floor(quotientValue1 * 0.25f);
        float productValue8 = floor(quotientValue1 * 0.5f);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = (((clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f))) <= ((((frac(((productValue8 * productValue8) * 0.75f) + (floor(quotientValue * 0.5f) * 0.5f)) + (frac(((productValue7 * productValue7) * 0.75f) + (floor(quotientValue * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue4 * scalarValue4) * 0.75f) + (floor(quotientValue) * 0.5f)))) ? 0.0f : scalarValue3;
#endif
    }
    else
    {
#if RD_FEATURE_TINTING == RD_ON
        intermediateValue3 = scalarValue;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
#elif RD_FEATURE_TINTING == RD_OFF
        comparisonValue = scalarValue3;
#endif
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON)
    fragmentColor0.x = ((varyingColor2.x - intermediateValue3) * varyingColor2.w) + intermediateValue3;
    fragmentColor0.y = ((varyingColor2.y - intermediateValue4) * varyingColor2.w) + intermediateValue4;
    fragmentColor0.z = ((varyingColor2.z - intermediateValue5) * varyingColor2.w) + intermediateValue5;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF)
    float productValue4 = intermediateValue3 * varyingColor3.x;
    float productValue5 = intermediateValue4 * varyingColor3.y;
    float productValue6 = intermediateValue5 * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((varyingColor2.y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((varyingColor2.z - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON)
    fragmentColor0.x = ((varyingColor2.x - scalarValue) * varyingColor2.w) + scalarValue;
    fragmentColor0.y = ((varyingColor2.y - scalarValue1) * varyingColor2.w) + scalarValue1;
    fragmentColor0.z = ((varyingColor2.z - scalarValue2) * varyingColor2.w) + scalarValue2;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * comparisonValue;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF)
    float productValue9 = sampledTextureValue.x * varyingColor3.x;
    float productValue10 = sampledTextureValue.y * varyingColor3.y;
    float productValue11 = sampledTextureValue.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = RD_UNIFORM_HUD_OPACITY.x * comparisonValue;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingColor1 = stage_input.varyingColor1;
    varyingColor0 = stage_input.varyingColor0;
    varyingColor2 = stage_input.varyingColor2;
    varyingTexCoord1 = stage_input.varyingTexCoord1;
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
