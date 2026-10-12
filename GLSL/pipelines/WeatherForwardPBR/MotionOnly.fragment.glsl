#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / MotionOnly / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 9
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/WeatherForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float productValue2 = sampledTextureValue.x * 255.0;
    precise float productValue3 = sampledTextureValue.y * 255.0;
    float bitwiseValue1 = rdEvaluateFloatExpression2((uint(roundEven(productValue2)) | (uint(roundEven(productValue3)) << 8u)) & 1023u);
    precise float sumValue7 = bitwiseValue1 + fragmentScalarConstants1.packedValues[36u];
    precise float productValue4 = sumValue7 * 0.0039215688593685626983642578125;
    if ((texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || ((((varyingTexCoord1.y >= 0.0) && ((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0))) && (varyingTexCoord1.y <= 1.0)) && (varyingTexCoord2 < productValue4)))
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    if (texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5)
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    precise float productValue2 = sampledTextureValue.x * 255.0;
    precise float productValue3 = sampledTextureValue.y * 255.0;
    float bitwiseValue1 = rdEvaluateFloatExpression2((uint(roundEven(productValue2)) | (uint(roundEven(productValue3)) << 8u)) & 1023u);
    precise float sumValue7 = bitwiseValue1 + fragmentScalarConstants1.packedValues[36u];
    precise float productValue4 = sumValue7 * 0.0039215688593685626983642578125;
    if ((texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || ((((varyingTexCoord1.y >= 0.0) && ((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0))) && (varyingTexCoord1.y <= 1.0)) && (productValue4 < varyingTexCoord2)))
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = rdEvaluateFloatExpression2((uint(roundEven(sampledTextureValue.x * 255.0)) | (uint(roundEven(sampledTextureValue.y * 255.0)) << 8u)) & 1023u);
    if ((texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || ((varyingTexCoord2 < ((bitwiseValue + fragmentScalarConstants1.packedValues[36u]) * 0.0039215688593685626983642578125)) && (((varyingTexCoord1.y >= 0.0) && ((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0))) && (varyingTexCoord1.y <= 1.0))))
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float bitwiseValue = rdEvaluateFloatExpression2((uint(roundEven(sampledTextureValue.x * 255.0)) | (uint(roundEven(sampledTextureValue.y * 255.0)) << 8u)) & 1023u);
    if ((texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || ((((bitwiseValue + fragmentScalarConstants1.packedValues[36u]) * 0.0039215688593685626983642578125) < varyingTexCoord2) && (((varyingTexCoord1.y >= 0.0) && ((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0))) && (varyingTexCoord1.y <= 1.0))))
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_OFF && RD_FEATURE_NO_OCCLUSION == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    if ((texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 < ((float(((uint(roundEven(sampledTextureValue1.y * 255.0)) << 8u) | uint(roundEven(sampledTextureValue1.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[9u].x) * 0.0039215688593685626983642578125))))
#elif (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5)
#elif (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FLIP_OCCLUSION == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(occlusionTextureTexture, occlusionTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    if ((texture(sampler2D(weatherTextureTexture, weatherTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w < 0.5) || (((varyingTexCoord1.y <= 1.0) && (((varyingTexCoord1.x >= 0.0) && (varyingTexCoord1.x <= 1.0)) && (varyingTexCoord1.y >= 0.0))) && (varyingTexCoord2 > ((float(((uint(roundEven(sampledTextureValue1.y * 255.0)) << 8u) | uint(roundEven(sampledTextureValue1.x * 255.0))) & 1023u) + fragmentVectorConstants1.packedValues[9u].x) * 0.0039215688593685626983642578125))))
#endif
    {
        isFragmentDiscarded = true;
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue8 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue9 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue10 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[8u].z;
    precise float sumValue11 = varyingTexCoord3.x - sumValue8;
    precise float sumValue12 = varyingTexCoord3.y - sumValue9;
    precise float sumValue13 = varyingTexCoord3.z - sumValue10;
    vec3 vectorValue = vec3(sumValue11, sumValue12, sumValue13);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    bool nonlinearValue1 = sqrt(scalarValue1) > 27.0;
    precise float productValue5 = varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue6 = varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue7 = varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u];
    precise float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, productValue5)) + fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, productValue6)) + fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, productValue7)) + fragmentScalarConstants1.packedValues[15u];
    precise float quotientValue = multiplyAddValue12 / multiplyAddValue14;
    precise float quotientValue1 = multiplyAddValue13 / multiplyAddValue14;
    float multiplyAddValue15 = fma(quotientValue, 0.5, 0.5);
    float multiplyAddValue16 = fma(quotientValue1, 0.5, 0.5);
    precise float productValue8 = varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue9 = varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue10 = varyingTexCoord3.y * fragmentScalarConstants1.packedValues[23u];
    precise float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, productValue8)) + fragmentVectorConstants1.packedValues[7u].x;
    precise float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, productValue9)) + fragmentVectorConstants1.packedValues[7u].y;
    precise float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[27u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.x, productValue10)) + fragmentScalarConstants1.packedValues[31u];
    precise float quotientValue2 = multiplyAddValue17 / multiplyAddValue19;
    precise float quotientValue3 = multiplyAddValue18 / multiplyAddValue19;
    precise float multiplyAddValue20 = multiplyAddValue15 - fma(quotientValue2, 0.5, 0.5);
    precise float multiplyAddValue21 = multiplyAddValue16 - fma(quotientValue3, 0.5, 0.5);
    precise float productValue11 = sumValue9 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue12 = sumValue9 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue13 = sumValue9 * fragmentScalarConstants1.packedValues[23u];
    precise float multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[6u].x, sumValue10, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue8, productValue11)) + fragmentVectorConstants1.packedValues[7u].x;
    precise float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].y, sumValue10, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue8, productValue12)) + fragmentVectorConstants1.packedValues[7u].y;
    precise float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[27u], sumValue10, fma(fragmentScalarConstants1.packedValues[19u], sumValue8, productValue13)) + fragmentScalarConstants1.packedValues[31u];
    precise float quotientValue4 = multiplyAddValue22 / multiplyAddValue24;
    precise float quotientValue5 = multiplyAddValue23 / multiplyAddValue24;
    precise float multiplyAddValue25 = multiplyAddValue15 - fma(quotientValue4, 0.5, 0.5);
    precise float multiplyAddValue26 = multiplyAddValue16 - fma(quotientValue5, 0.5, 0.5);
    fragmentColor0.z = nonlinearValue1 ? multiplyAddValue20 : multiplyAddValue25;
    fragmentColor0.w = nonlinearValue1 ? multiplyAddValue21 : multiplyAddValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[8u].z;
    vec3 sumValue3 = vec3((fragmentVectorConstants1.packedValues[8u].x - varyingTexCoord4.x) + varyingTexCoord3.x, (fragmentVectorConstants1.packedValues[8u].y - varyingTexCoord4.y) + varyingTexCoord3.y, (fragmentVectorConstants1.packedValues[8u].z - varyingTexCoord4.z) + varyingTexCoord3.z);
    float scalarValue = rdDot3Precise(sumValue3, sumValue3);
    bool nonlinearValue = sqrt(scalarValue) > 27.0;
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue1 = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue, 0.5, 0.5);
    float multiplyAddValue2 = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue, 0.5, 0.5);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[27u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[27u], sumValue2, fma(fragmentScalarConstants1.packedValues[19u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor0.z = nonlinearValue ? (multiplyAddValue1 - fma((fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue5, 0.5, 0.5)) : (multiplyAddValue1 - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue6, 0.5, 0.5));
    fragmentColor0.w = nonlinearValue ? (multiplyAddValue2 - fma((fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue5, 0.5, 0.5)) : (multiplyAddValue2 - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue6, 0.5, 0.5));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[8u].z;
    float sumValue4 = varyingTexCoord3.x - sumValue;
    float sumValue5 = varyingTexCoord3.y - sumValue1;
    float sumValue6 = varyingTexCoord3.z - sumValue2;
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue3;
    float multiplyAddValue4;
    if (sqrt(((sumValue4 * sumValue4) + (sumValue5 * sumValue5)) + (sumValue6 * sumValue6)) > 27.0)
    {
        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
        multiplyAddValue3 = (fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue8;
        multiplyAddValue4 = (fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue8;
    }
    else
    {
        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
        multiplyAddValue3 = (fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue9;
        multiplyAddValue4 = (fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue9;
    }
    precise float multiplyAddValue10 = ((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue7) - multiplyAddValue4;
    precise float multiplyAddValue11 = ((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue7) - multiplyAddValue3;
    precise float productValue = multiplyAddValue10 * 0.5;
    precise float productValue1 = multiplyAddValue11 * 0.5;
#endif
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.z = productValue1;
    fragmentColor0.w = productValue;
#endif
    discardIfRequested();
}
