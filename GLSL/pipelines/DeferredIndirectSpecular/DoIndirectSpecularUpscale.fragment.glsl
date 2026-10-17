#version 460
#extension GL_GOOGLE_include_directive : require
// DeferredIndirectSpecular / DoIndirectSpecularUpscale / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_UPSCALING
#define RD_FEATURE_UPSCALING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/DeferredIndirectSpecular/FragmentBindings.glsli"

#if (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue8 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue9 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue10 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue11 = dFdxCoarse(varyingTexCoord0.y);
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (texture(sampler2D(materialTexture8, textureSampler8), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x != 1.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture8, textureSampler8), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue10.x;
    float scalarValue9 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue11 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue10 = dFdyCoarse(varyingTexCoord0.y);
    float scalarValue8 = dFdyCoarse(varyingTexCoord0.x);
    float multiplyAddValue18;
    float multiplyAddValue19;
    float multiplyAddValue20;
    if (scalarValue12 != 1.0)
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    if (texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x != 1.0)
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(normalTexture, normalSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.x;
    float scalarValue1 = sampledTextureValue1.y;
    vec4 sampledTextureValue2 = texture(sampler2D(sceneDepthTexture, sceneDepthSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue2.x;
    float sumValue = 1.0 - abs(scalarValue);
    float scalarValue3 = abs(scalarValue1);
    float sumValue1 = sumValue - scalarValue3;
    bool conditionValue = sumValue1 < 0.0;
    float comparisonValue = conditionValue ? ((1.0 - scalarValue3) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
    float comparisonValue1 = conditionValue ? (sumValue * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
    float productValue = comparisonValue * inverseLengthValue;
    float productValue1 = comparisonValue1 * inverseLengthValue;
    float productValue2 = inverseLengthValue * sumValue1;
    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue, productValue1, productValue2), vec3(productValue, productValue1, productValue2)));
    float productValue3 = inverseLengthValue1 * productValue;
    float productValue4 = productValue1 * inverseLengthValue1;
    float productValue5 = inverseLengthValue1 * productValue2;
    float productValue31;
    float productValue32;
    float productValue33;
    if (scalarValue2 != 1.0)
#endif
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue9 = textureGrad(sampler2D(materialTexture9, textureSampler9), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue9, scalarValue11), vec2(scalarValue8, scalarValue10));
        intermediateValue8 = sampledTextureValue9.z;
        intermediateValue9 = sampledTextureValue9.y;
        intermediateValue10 = sampledTextureValue9.x;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue11 = textureGrad(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue9, scalarValue11), vec2(scalarValue8, scalarValue10));
        float scalarValue13 = sampledTextureValue11.x;
        float scalarValue14 = sampledTextureValue11.y;
        float scalarValue15 = abs(scalarValue14);
        float sumValue15 = 1.0 - abs(scalarValue13);
        float sumValue16 = sumValue15 - scalarValue15;
        bool conditionValue5 = sumValue16 < 0.0;
        float sumValue17 = 2.0 - 1.0;
        float comparisonValue10 = conditionValue5 ? (((scalarValue13 >= 0.0) ? sumValue17 : (-1.0)) * (1.0 - scalarValue15)) : scalarValue13;
        float comparisonValue11 = conditionValue5 ? (((scalarValue14 >= 0.0) ? sumValue17 : (-1.0)) * sumValue15) : scalarValue14;
        vec3 vectorValue = vec3(comparisonValue10, comparisonValue11, sumValue16);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
        float multiplyAddValue = floor(fma(varyingTexCoord0.x, fragmentVectorConstants1.packedValues[0u].x, -0.5)) + 0.5;
        float multiplyAddValue1 = floor(fma(varyingTexCoord0.y, fragmentVectorConstants1.packedValues[0u].y, -0.5)) + 0.5;
        float productValue34 = multiplyAddValue * fragmentVectorConstants1.packedValues[0u].z;
        float productValue35 = multiplyAddValue1 * fragmentVectorConstants1.packedValues[0u].w;
        float sumValue18 = fragmentVectorConstants1.packedValues[0u].z + productValue34;
        float sumValue19 = fragmentVectorConstants1.packedValues[0u].w + productValue35;
        float multiplyAddValue2 = fma(multiplyAddValue, fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[0u].z);
        float multiplyAddValue3 = fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].w, fragmentVectorConstants1.packedValues[0u].w);
        float multiplyAddValue4 = fract(fma(-multiplyAddValue, fragmentVectorConstants1.packedValues[0u].z, varyingTexCoord0.x) * fragmentVectorConstants1.packedValues[0u].x);
        float multiplyAddValue5 = fract(fma(-multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].w, varyingTexCoord0.y) * fragmentVectorConstants1.packedValues[0u].y);
        float sumValue20 = 1.0 - multiplyAddValue5;
        float sumValue21 = 1.0 - multiplyAddValue4;
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture4, textureSampler4), vec2(productValue34, productValue35));
        float multiplyAddValue6 = fma(sampledTextureValue12.x, 2.0, -1.0);
        float multiplyAddValue7 = fma(sampledTextureValue12.y, 2.0, -1.0);
        float scalarValue16 = abs(multiplyAddValue7);
        float sumValue22 = 1.0 - abs(multiplyAddValue6);
        float sumValue23 = sumValue22 - scalarValue16;
        bool conditionValue6 = sumValue23 < 0.0;
        float comparisonValue12 = conditionValue6 ? (((multiplyAddValue6 >= 0.0) ? sumValue17 : (-1.0)) * (1.0 - scalarValue16)) : multiplyAddValue6;
        float comparisonValue13 = conditionValue6 ? (((multiplyAddValue7 >= 0.0) ? sumValue17 : (-1.0)) * sumValue22) : multiplyAddValue7;
        vec3 vectorValue1 = vec3(comparisonValue12, comparisonValue13, sumValue23);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        vec3 productValue36 = vec3(inverseLengthValue10 * comparisonValue10, inverseLengthValue10 * comparisonValue11, inverseLengthValue10 * sumValue16);
        vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(sumValue18, productValue35));
        float multiplyAddValue8 = fma(sampledTextureValue13.x, 2.0, -1.0);
        float multiplyAddValue9 = fma(sampledTextureValue13.y, 2.0, -1.0);
        float scalarValue17 = abs(multiplyAddValue9);
        float sumValue24 = 1.0 - abs(multiplyAddValue8);
        float sumValue25 = sumValue24 - scalarValue17;
        bool conditionValue7 = sumValue25 < 0.0;
        float comparisonValue14 = conditionValue7 ? (((multiplyAddValue8 >= 0.0) ? sumValue17 : (-1.0)) * (1.0 - scalarValue17)) : multiplyAddValue8;
        float comparisonValue15 = conditionValue7 ? (((multiplyAddValue9 >= 0.0) ? sumValue17 : (-1.0)) * sumValue24) : multiplyAddValue9;
        vec3 vectorValue2 = vec3(comparisonValue14, comparisonValue15, sumValue25);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        float multiplyAddValue10 = (sumValue20 * multiplyAddValue4) * ((6.1999999161344021558761596679688e-05 / (abs(fma(-fma(sampledTextureValue13.z, 65535.0, sampledTextureValue13.w), 1.525902189314365386962890625e-05, scalarValue12)) + 6.1999999161344021558761596679688e-05)) * spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue12 * comparisonValue14, inverseLengthValue12 * comparisonValue15, inverseLengthValue12 * sumValue25), productValue36) - 1.0) * fragmentScalarConstants1.packedValues[4u]), 1.0));
        vec4 sampledTextureValue14 = texture(sampler2D(materialTexture4, textureSampler4), vec2(productValue34, sumValue19));
        float multiplyAddValue11 = fma(sampledTextureValue14.x, 2.0, -1.0);
        float multiplyAddValue12 = fma(sampledTextureValue14.y, 2.0, -1.0);
        float scalarValue18 = abs(multiplyAddValue12);
        float sumValue26 = 1.0 - abs(multiplyAddValue11);
        float sumValue27 = sumValue26 - scalarValue18;
        bool conditionValue8 = sumValue27 < 0.0;
        float comparisonValue16 = conditionValue8 ? (((multiplyAddValue11 >= 0.0) ? sumValue17 : (-1.0)) * (1.0 - scalarValue18)) : multiplyAddValue11;
        float comparisonValue17 = conditionValue8 ? (((multiplyAddValue12 >= 0.0) ? sumValue17 : (-1.0)) * sumValue26) : multiplyAddValue12;
        vec3 vectorValue3 = vec3(comparisonValue16, comparisonValue17, sumValue27);
        float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec4 sampledTextureValue15 = texture(sampler2D(materialTexture4, textureSampler4), vec2(multiplyAddValue2, multiplyAddValue3));
        float multiplyAddValue13 = fma(sampledTextureValue15.x, 2.0, -1.0);
        float multiplyAddValue14 = fma(sampledTextureValue15.y, 2.0, -1.0);
        float scalarValue19 = abs(multiplyAddValue14);
        float sumValue28 = 1.0 - abs(multiplyAddValue13);
        float sumValue29 = sumValue28 - scalarValue19;
        bool conditionValue9 = sumValue29 < 0.0;
        float comparisonValue18 = conditionValue9 ? (((multiplyAddValue13 >= 0.0) ? sumValue17 : (-1.0)) * (1.0 - scalarValue19)) : multiplyAddValue13;
        float comparisonValue19 = conditionValue9 ? (((multiplyAddValue14 >= 0.0) ? sumValue17 : (-1.0)) * sumValue28) : multiplyAddValue14;
        vec3 vectorValue4 = vec3(comparisonValue18, comparisonValue19, sumValue29);
        float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        float multiplyAddValue15 = (multiplyAddValue5 * multiplyAddValue4) * ((6.1999999161344021558761596679688e-05 / (abs(fma(-fma(sampledTextureValue15.z, 65535.0, sampledTextureValue15.w), 1.525902189314365386962890625e-05, scalarValue12)) + 6.1999999161344021558761596679688e-05)) * spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue14 * comparisonValue18, inverseLengthValue14 * comparisonValue19, inverseLengthValue14 * sumValue29), productValue36) - 1.0) * fragmentScalarConstants1.packedValues[4u]), 1.0));
        float multiplyAddValue16 = fma((6.1999999161344021558761596679688e-05 / (abs(fma(-fma(sampledTextureValue12.z, 65535.0, sampledTextureValue12.w), 1.525902189314365386962890625e-05, scalarValue12)) + 6.1999999161344021558761596679688e-05)) * spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue11 * comparisonValue12, inverseLengthValue11 * comparisonValue13, inverseLengthValue11 * sumValue23), productValue36) - 1.0) * fragmentScalarConstants1.packedValues[4u]), 1.0), sumValue20 * sumValue21, multiplyAddValue10);
        float multiplyAddValue17 = fma((6.1999999161344021558761596679688e-05 / (abs(fma(-fma(sampledTextureValue14.z, 65535.0, sampledTextureValue14.w), 1.525902189314365386962890625e-05, scalarValue12)) + 6.1999999161344021558761596679688e-05)) * spvNMin(exp2((rdDot3Precise2(vec3(inverseLengthValue13 * comparisonValue16, inverseLengthValue13 * comparisonValue17, inverseLengthValue13 * sumValue27), productValue36) - 1.0) * fragmentScalarConstants1.packedValues[4u]), 1.0), sumValue21 * multiplyAddValue5, multiplyAddValue15);
        bool conditionValue10 = multiplyAddValue16 > 0.0;
        bool conditionValue11 = multiplyAddValue17 > 0.0;
        float quotientValue2 = multiplyAddValue10 / multiplyAddValue16;
        float quotientValue3 = multiplyAddValue15 / multiplyAddValue17;
        float sumValue30 = (multiplyAddValue17 + multiplyAddValue16) + 6.1999999161344021558761596679688e-05;
        float quotientValue4 = multiplyAddValue16 / sumValue30;
        float quotientValue5 = multiplyAddValue17 / sumValue30;
        vec4 sampledTextureValue16 = texture(sampler2D(materialTexture9, textureSampler9), vec2(conditionValue10 ? fma(sumValue18 - productValue34, quotientValue2, productValue34) : productValue34, conditionValue10 ? fma(productValue35 - productValue35, quotientValue2, productValue35) : productValue35));
        vec4 sampledTextureValue17 = texture(sampler2D(materialTexture9, textureSampler9), vec2(conditionValue11 ? fma(multiplyAddValue2 - productValue34, quotientValue3, productValue34) : productValue34, conditionValue11 ? fma(multiplyAddValue3 - sumValue19, quotientValue3, sumValue19) : sumValue19));
        multiplyAddValue18 = fma(quotientValue4, sampledTextureValue16.z, quotientValue5 * sampledTextureValue17.z);
        multiplyAddValue19 = fma(quotientValue4, sampledTextureValue16.y, quotientValue5 * sampledTextureValue17.y);
        multiplyAddValue20 = fma(quotientValue4, sampledTextureValue16.x, quotientValue5 * sampledTextureValue17.x);
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue = sampledTextureValue.x;
        intermediateValue1 = sampledTextureValue.y;
        intermediateValue2 = sampledTextureValue.z;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue6 = floor((fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord0.x) + (-0.5)) + 0.5;
        float productValue7 = productValue6 * fragmentVectorConstants1.packedValues[0u].z;
        float productValue8 = (floor((fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord0.y) + (-0.5)) + 0.5) * fragmentVectorConstants1.packedValues[0u].w;
        float sumValue2 = productValue7 + fragmentVectorConstants1.packedValues[0u].z;
        float sumValue3 = productValue8 + fragmentVectorConstants1.packedValues[0u].w;
        float productValue9 = fract((varyingTexCoord0.x - productValue7) * fragmentVectorConstants1.packedValues[0u].x);
        float productValue10 = fract((varyingTexCoord0.y - productValue8) * fragmentVectorConstants1.packedValues[0u].y);
        float sumValue4 = 1.0 - productValue9;
        float sumValue5 = 1.0 - productValue10;
        vec4 sampledTextureValue3 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(productValue7, productValue8));
        float productValue11 = (sampledTextureValue3.x * 2.0) + (-1.0);
        float productValue12 = (sampledTextureValue3.y * 2.0) + (-1.0);
        float sumValue6 = 1.0 - abs(productValue11);
        float scalarValue4 = abs(productValue12);
        float sumValue7 = sumValue6 - scalarValue4;
        bool conditionValue1 = sumValue7 < 0.0;
        float comparisonValue2 = conditionValue1 ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue4)) : productValue11;
        float comparisonValue3 = conditionValue1 ? (((productValue12 < 0.0) ? (-1.0) : 1.0) * sumValue6) : productValue12;
        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue2, comparisonValue3, sumValue7), vec3(comparisonValue2, comparisonValue3, sumValue7)));
        float productValue13 = comparisonValue2 * inverseLengthValue2;
        float productValue14 = comparisonValue3 * inverseLengthValue2;
        float productValue15 = inverseLengthValue2 * sumValue7;
        float inverseLengthValue3 = inversesqrt(dot(vec3(productValue13, productValue14, productValue15), vec3(productValue13, productValue14, productValue15)));
        vec4 sampledTextureValue4 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(sumValue2, productValue8));
        float productValue16 = (sampledTextureValue4.x * 2.0) + (-1.0);
        float productValue17 = (sampledTextureValue4.y * 2.0) + (-1.0);
        float sumValue8 = 1.0 - abs(productValue16);
        float scalarValue5 = abs(productValue17);
        float sumValue9 = sumValue8 - scalarValue5;
        bool conditionValue2 = sumValue9 < 0.0;
        float comparisonValue4 = conditionValue2 ? (((productValue16 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue5)) : productValue16;
        float comparisonValue5 = conditionValue2 ? (((productValue17 < 0.0) ? (-1.0) : 1.0) * sumValue8) : productValue17;
        float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, sumValue9), vec3(comparisonValue4, comparisonValue5, sumValue9)));
        float productValue18 = comparisonValue4 * inverseLengthValue4;
        float productValue19 = comparisonValue5 * inverseLengthValue4;
        float productValue20 = inverseLengthValue4 * sumValue9;
        float inverseLengthValue5 = inversesqrt(dot(vec3(productValue18, productValue19, productValue20), vec3(productValue18, productValue19, productValue20)));
        float dotProductValue = ((sumValue5 * productValue9) * spvNClamp(exp2((dot(vec3(productValue18 * inverseLengthValue5, productValue19 * inverseLengthValue5, inverseLengthValue5 * productValue20), vec3(productValue3, productValue4, productValue5)) + (-1.0)) * fragmentVectorConstants1.packedValues[1u].x), 0.0, 1.0)) * (6.1999999161344021558761596679688e-05 / (abs(scalarValue2 - (((sampledTextureValue4.z * 65535.0) + sampledTextureValue4.w) * 1.525902189314365386962890625e-05)) + 6.1999999161344021558761596679688e-05));
        vec4 sampledTextureValue5 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(productValue7, sumValue3));
        float productValue21 = (sampledTextureValue5.x * 2.0) + (-1.0);
        float productValue22 = (sampledTextureValue5.y * 2.0) + (-1.0);
        float sumValue10 = 1.0 - abs(productValue21);
        float scalarValue6 = abs(productValue22);
        float sumValue11 = sumValue10 - scalarValue6;
        bool conditionValue3 = sumValue11 < 0.0;
        float comparisonValue6 = conditionValue3 ? (((productValue21 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue6)) : productValue21;
        float comparisonValue7 = conditionValue3 ? (((productValue22 < 0.0) ? (-1.0) : 1.0) * sumValue10) : productValue22;
        float inverseLengthValue6 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue11), vec3(comparisonValue6, comparisonValue7, sumValue11)));
        float productValue23 = comparisonValue6 * inverseLengthValue6;
        float productValue24 = comparisonValue7 * inverseLengthValue6;
        float productValue25 = inverseLengthValue6 * sumValue11;
        float inverseLengthValue7 = inversesqrt(dot(vec3(productValue23, productValue24, productValue25), vec3(productValue23, productValue24, productValue25)));
        vec4 sampledTextureValue6 = texture(sampler2D(normalsAndDepthLightingTexture, normalsAndDepthLightingSampler), vec2(sumValue2, sumValue3));
        float productValue26 = (sampledTextureValue6.x * 2.0) + (-1.0);
        float productValue27 = (sampledTextureValue6.y * 2.0) + (-1.0);
        float sumValue12 = 1.0 - abs(productValue26);
        float scalarValue7 = abs(productValue27);
        float sumValue13 = sumValue12 - scalarValue7;
        bool conditionValue4 = sumValue13 < 0.0;
        float comparisonValue8 = conditionValue4 ? (((productValue26 < 0.0) ? (-1.0) : 1.0) * (1.0 - scalarValue7)) : productValue26;
        float comparisonValue9 = conditionValue4 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * sumValue12) : productValue27;
        float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue9, sumValue13), vec3(comparisonValue8, comparisonValue9, sumValue13)));
        float productValue28 = comparisonValue8 * inverseLengthValue8;
        float productValue29 = comparisonValue9 * inverseLengthValue8;
        float productValue30 = inverseLengthValue8 * sumValue13;
        float inverseLengthValue9 = inversesqrt(dot(vec3(productValue28, productValue29, productValue30), vec3(productValue28, productValue29, productValue30)));
        float dotProductValue1 = ((productValue10 * productValue9) * spvNClamp(exp2((dot(vec3(productValue28 * inverseLengthValue9, productValue29 * inverseLengthValue9, inverseLengthValue9 * productValue30), vec3(productValue3, productValue4, productValue5)) + (-1.0)) * fragmentVectorConstants1.packedValues[1u].x), 0.0, 1.0)) * (6.1999999161344021558761596679688e-05 / (abs(scalarValue2 - (((sampledTextureValue6.z * 65535.0) + sampledTextureValue6.w) * 1.525902189314365386962890625e-05)) + 6.1999999161344021558761596679688e-05));
        float dotProductValue2 = dotProductValue + (((sumValue5 * sumValue4) * spvNClamp(exp2((dot(vec3(productValue13 * inverseLengthValue3, productValue14 * inverseLengthValue3, inverseLengthValue3 * productValue15), vec3(productValue3, productValue4, productValue5)) + (-1.0)) * fragmentVectorConstants1.packedValues[1u].x), 0.0, 1.0)) * (6.1999999161344021558761596679688e-05 / (abs(scalarValue2 - (((sampledTextureValue3.z * 65535.0) + sampledTextureValue3.w) * 1.525902189314365386962890625e-05)) + 6.1999999161344021558761596679688e-05)));
        float dotProductValue3 = dotProductValue1 + (((sumValue4 * productValue10) * spvNClamp(exp2((dot(vec3(productValue23 * inverseLengthValue7, productValue24 * inverseLengthValue7, inverseLengthValue7 * productValue25), vec3(productValue3, productValue4, productValue5)) + (-1.0)) * fragmentVectorConstants1.packedValues[1u].x), 0.0, 1.0)) * (6.1999999161344021558761596679688e-05 / (abs(scalarValue2 - (((sampledTextureValue5.z * 65535.0) + sampledTextureValue5.w) * 1.525902189314365386962890625e-05)) + 6.1999999161344021558761596679688e-05)));
        float sumValue14 = (dotProductValue2 + 6.1999999161344021558761596679688e-05) + dotProductValue3;
        float quotientValue = dotProductValue2 / sumValue14;
        float quotientValue1 = dotProductValue3 / sumValue14;
        vec4 sampledTextureValue7 = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2((((dotProductValue / dotProductValue2) * float(dotProductValue2 > 0.0)) + productValue6) * fragmentVectorConstants1.packedValues[0u].z, productValue8));
        vec4 sampledTextureValue8 = texture(sampler2D(specularLightingTexture, specularLightingSampler), vec2(((float(dotProductValue3 > 0.0) * (dotProductValue1 / dotProductValue3)) + productValue6) * fragmentVectorConstants1.packedValues[0u].z, sumValue3));
        productValue31 = (sampledTextureValue8.x * quotientValue1) + (sampledTextureValue7.x * quotientValue);
        productValue32 = (sampledTextureValue8.y * quotientValue1) + (sampledTextureValue7.y * quotientValue);
        productValue33 = (sampledTextureValue8.z * quotientValue1) + (sampledTextureValue7.z * quotientValue);
#endif
    }
    else
    {
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue8 = 0.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue18 = 0.0;
        multiplyAddValue19 = 0.0;
        multiplyAddValue20 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue = 0.0;
        intermediateValue1 = 0.0;
        intermediateValue2 = 0.0;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue31 = 0.0;
        productValue32 = 0.0;
        productValue33 = 0.0;
#endif
    }
#if (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = intermediateValue10;
    fragmentColor0.y = intermediateValue9;
    fragmentColor0.z = intermediateValue8;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = multiplyAddValue20;
    fragmentColor0.y = multiplyAddValue19;
    fragmentColor0.z = multiplyAddValue18;
#elif (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = intermediateValue;
    fragmentColor0.y = intermediateValue1;
    fragmentColor0.z = intermediateValue2;
#elif (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_UPSCALING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue31;
    fragmentColor0.y = productValue32;
    fragmentColor0.z = productValue33;
#endif
    fragmentColor0.w = 1.0;
}
