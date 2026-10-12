#version 460
#extension GL_GOOGLE_include_directive : require
// ActorForwardPBR / DepthOnlyAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
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
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 19
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif

#include "../../include/materials/ActorForwardPBR/FragmentBindings.glsli"

#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue2), sampledTextureValue2) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue7 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue7, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue7), sampledTextureValue7) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue2 = sampledTextureValue9.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue3 = sampledTextureValue9.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue4 = sampledTextureValue9.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue5 = sampledTextureValue9.w * fragmentVectorConstants1.packedValues[1u].w;
    float multiplyAddValue = rdDot4Precise2(vec4(productValue2, productValue3, productValue4, fma(fragmentScalarConstants1.packedValues[12u], fma(productValue5, fragmentScalarConstants1.packedValues[11u], -productValue5), productValue5)), vec4(1.0));
    if (multiplyAddValue < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue5.x;
    float scalarValue6 = sampledTextureValue5.y;
    float scalarValue7 = sampledTextureValue5.z;
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue3 = scalarValue6 + scalarValue5;
    precise float sumValue4 = scalarValue7 + sumValue3;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue11 = sumValue2 * sumValue4;
    float scalarValue8 = float(productValue11 > 0.0);
    float multiplyAddValue4 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[1u].w, sampledTextureValue9.w, -scalarValue1), scalarValue1);
    float multiplyAddValue5 = rdDot4Precise2(vec4(fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue9.x, -scalarValue5), scalarValue5), fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue9.y, -scalarValue6), scalarValue6), fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue9.z, -scalarValue7), scalarValue7), fma(fragmentScalarConstants1.packedValues[12u], fma(multiplyAddValue4, fragmentScalarConstants1.packedValues[11u], -multiplyAddValue4), multiplyAddValue4)), vec4(1.0));
    if (multiplyAddValue5 < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue13, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue13), sampledTextureValue13);
    precise float sumValue5 = 1.0 - fragmentScalarConstants1.packedValues[0u];
    if ((multiplyAddValue7 < fragmentScalarConstants1.packedValues[0u]) || (sumValue5 < multiplyAddValue7))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue15 = fma(float(productValue > 0.0), fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue15, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue15), sampledTextureValue15);
    precise float sumValue5 = 1.0 - fragmentScalarConstants1.packedValues[0u];
    if ((multiplyAddValue9 < fragmentScalarConstants1.packedValues[0u]) || (sumValue5 < multiplyAddValue9))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue13 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue13, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue13), sampledTextureValue13) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue15 = fma(float(productValue > 0.0), fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue15, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue15), sampledTextureValue15) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue), sampledTextureValue) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue6 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue6, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue6), sampledTextureValue6) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue8 = sampledTextureValue9.w * fragmentVectorConstants1.packedValues[1u].w;
    float multiplyAddValue1 = rdDot4Precise2(vec4(sampledTextureValue9.x * fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue9.y * fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue9.z * fragmentVectorConstants1.packedValues[1u].z, fma(fragmentScalarConstants1.packedValues[12u], fma(productValue8, fragmentScalarConstants1.packedValues[11u], -productValue8), productValue8)), vec4(1.0));
    if (multiplyAddValue1 < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue5.x;
    float scalarValue6 = sampledTextureValue5.y;
    float scalarValue7 = sampledTextureValue5.z;
    float scalarValue1 = sampledTextureValue5.w;
    bool productValue9 = ((1.0 - scalarValue1) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    float multiplyAddValue2 = productValue9 ? (fma(fragmentVectorConstants1.packedValues[1u].w, sampledTextureValue9.w, -scalarValue1) + scalarValue1) : scalarValue1;
    float multiplyAddValue3 = rdDot4Precise2(vec4(productValue9 ? (fma(fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue9.x, -scalarValue5) + scalarValue5) : scalarValue5, productValue9 ? (fma(fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue9.y, -scalarValue6) + scalarValue6) : scalarValue6, productValue9 ? (fma(fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue9.z, -scalarValue7) + scalarValue7) : scalarValue7, fma(fragmentScalarConstants1.packedValues[12u], fma(multiplyAddValue2, fragmentScalarConstants1.packedValues[11u], -multiplyAddValue2), multiplyAddValue2)), vec4(1.0));
    if (multiplyAddValue3 < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue11, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue11), sampledTextureValue11);
    if ((multiplyAddValue6 < fragmentScalarConstants1.packedValues[0u]) || ((1.0 - fragmentScalarConstants1.packedValues[0u]) < multiplyAddValue6))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue14 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue14, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue14), sampledTextureValue14);
    if ((multiplyAddValue8 < fragmentScalarConstants1.packedValues[0u]) || ((1.0 - fragmentScalarConstants1.packedValues[0u]) < multiplyAddValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue11, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue11), sampledTextureValue11) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue14 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue14, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue14), sampledTextureValue14) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w;
    if (((((fragmentVectorConstants1.packedValues[1u].w * sampledTextureValue1) - sampledTextureValue1) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue1) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue4 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue4 * fragmentVectorConstants1.packedValues[1u].w) - sampledTextureValue4) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue4) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue1 = sampledTextureValue8.w * fragmentVectorConstants1.packedValues[1u].w;
    if (dot(vec4(sampledTextureValue8.x * fragmentVectorConstants1.packedValues[1u].x, sampledTextureValue8.y * fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue8.z * fragmentVectorConstants1.packedValues[1u].z, (((fragmentVectorConstants1.packedValues[2u].w * productValue1) - productValue1) * fragmentVectorConstants1.packedValues[3u].x) + productValue1), vec4(1.0)) < fragmentVectorConstants1.packedValues[0u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue = sampledTextureValue3.w;
    float productValue6 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue)) > 0.0);
    float productValue7 = (productValue6 * ((sampledTextureValue8.w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue)) + scalarValue;
    if (dot(vec4((productValue6 * ((sampledTextureValue8.x * fragmentVectorConstants1.packedValues[1u].x) - scalarValue2)) + scalarValue2, (productValue6 * ((sampledTextureValue8.y * fragmentVectorConstants1.packedValues[1u].y) - scalarValue3)) + scalarValue3, (productValue6 * ((sampledTextureValue8.z * fragmentVectorConstants1.packedValues[1u].z) - scalarValue4)) + scalarValue4, (((productValue7 * fragmentVectorConstants1.packedValues[2u].w) - productValue7) * fragmentVectorConstants1.packedValues[3u].x) + productValue7), vec4(1.0)) < fragmentVectorConstants1.packedValues[0u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue10 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w;
    float productValue10 = (((fragmentVectorConstants1.packedValues[2u].w * sampledTextureValue10) - sampledTextureValue10) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue10;
    if ((productValue10 < fragmentVectorConstants1.packedValues[0u].x) || (productValue10 > (1.0 - fragmentVectorConstants1.packedValues[0u].x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue12 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue)) + scalarValue;
    float productValue12 = (((sampledTextureValue12 * fragmentVectorConstants1.packedValues[2u].w) - sampledTextureValue12) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue12;
    if ((productValue12 < fragmentVectorConstants1.packedValues[0u].x) || (productValue12 > (1.0 - fragmentVectorConstants1.packedValues[0u].x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue10 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w;
    if (((((fragmentVectorConstants1.packedValues[2u].w * sampledTextureValue10) - sampledTextureValue10) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue10) < fragmentVectorConstants1.packedValues[0u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue12 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue12 * fragmentVectorConstants1.packedValues[2u].w) - sampledTextureValue12) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue12) < fragmentVectorConstants1.packedValues[0u].x)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
    discardIfRequested();
}
