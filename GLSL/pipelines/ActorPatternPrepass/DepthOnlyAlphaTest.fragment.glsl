#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternPrepass / DepthOnlyAlphaTest / fragment forward pipeline.
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
#define RD_OPTION_EMISSIVE RD_EMISSIVE_EMISSIVE
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif

#include "../../include/materials/ActorPatternPrepass/FragmentBindings.glsli"

#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    precise float reinterpretedBits1 = sampledTextureValue1.x * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits2 = sampledTextureValue1.y * uintBitsToFloat(reinterpretedBits.y);
    precise float reinterpretedBits3 = sampledTextureValue1.z * uintBitsToFloat(reinterpretedBits.z);
    precise float reinterpretedBits4 = sampledTextureValue1.w * uintBitsToFloat(reinterpretedBits.w);
    float multiplyAddValue = rdDot4Precise2(vec4(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(reinterpretedBits4, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -reinterpretedBits4), reinterpretedBits4)), vec4(1.0));
    if (multiplyAddValue < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    precise float sumValue = scalarValue5 + scalarValue4;
    precise float sumValue1 = scalarValue6 + sumValue;
    precise float sumValue2 = 1.0 - scalarValue7;
    precise float productValue4 = sumValue2 * sumValue1;
    float scalarValue8 = float(productValue4 > 0.0);
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float multiplyAddValue2 = fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue1.w, -scalarValue7), scalarValue7);
    float multiplyAddValue3 = rdDot4Precise2(vec4(fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue1.x, -scalarValue4), scalarValue4), fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue1.y, -scalarValue5), scalarValue5), fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue1.z, -scalarValue6), scalarValue6), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(multiplyAddValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -multiplyAddValue2), multiplyAddValue2)), vec4(1.0));
    if (multiplyAddValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    float multiplyAddValue7 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue7, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue7), sampledTextureValue7);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    precise float sumValue3 = 1.0 - reinterpretedBits6;
    if ((multiplyAddValue7 < reinterpretedBits6) || (sumValue3 < multiplyAddValue7))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    precise float sumValue4 = sampledTextureValue4.y + sampledTextureValue4.x;
    precise float sumValue5 = sampledTextureValue4.z + sumValue4;
    precise float sumValue2 = 1.0 - scalarValue7;
    precise float productValue7 = sumValue2 * sumValue5;
    float sampledTextureValue8 = fma(float(productValue7 > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue7), scalarValue7);
    float multiplyAddValue8 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue8, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue8), sampledTextureValue8);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    precise float sumValue3 = 1.0 - reinterpretedBits6;
    if ((multiplyAddValue8 < reinterpretedBits6) || (sumValue3 < multiplyAddValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float reinterpretedBits5 = sampledTextureValue1.w * uintBitsToFloat(reinterpretedBits.w);
    float multiplyAddValue1 = rdDot4Precise2(vec4(sampledTextureValue1.x * uintBitsToFloat(reinterpretedBits.x), sampledTextureValue1.y * uintBitsToFloat(reinterpretedBits.y), sampledTextureValue1.z * uintBitsToFloat(reinterpretedBits.z), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(reinterpretedBits5, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -reinterpretedBits5), reinterpretedBits5)), vec4(1.0));
    if (multiplyAddValue1 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    bool productValue5 = ((1.0 - scalarValue7) * (scalarValue6 + (scalarValue5 + scalarValue4))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float multiplyAddValue4 = productValue5 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue1.w, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue5 = rdDot4Precise2(vec4(productValue5 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue1.x, -scalarValue4) + scalarValue4) : scalarValue4, productValue5 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue1.y, -scalarValue5) + scalarValue5) : scalarValue5, productValue5 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue1.z, -scalarValue6) + scalarValue6) : scalarValue6, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(multiplyAddValue4, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -multiplyAddValue4), multiplyAddValue4)), vec4(1.0));
    if (multiplyAddValue5 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    float multiplyAddValue6 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue5, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue5), sampledTextureValue5);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    if ((multiplyAddValue6 < reinterpretedBits6) || ((1.0 - reinterpretedBits6) < multiplyAddValue6))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    float sampledTextureValue9 = (((1.0 - scalarValue7) * (sampledTextureValue4.z + (sampledTextureValue4.y + sampledTextureValue4.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue9 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue9, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue9), sampledTextureValue9);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    if ((multiplyAddValue9 < reinterpretedBits6) || ((1.0 - reinterpretedBits6) < multiplyAddValue9))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.w * fragmentVectorConstants1.packedValues[2u].w;
    if (dot(vec4(sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z, (((fragmentVectorConstants1.packedValues[0u].w * productValue) - productValue) * fragmentVectorConstants1.packedValues[3u].x) + productValue), vec4(1.0)) < fragmentVectorConstants1.packedValues[1u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue2.x;
    float scalarValue1 = sampledTextureValue2.y;
    float scalarValue2 = sampledTextureValue2.z;
    float scalarValue3 = sampledTextureValue2.w;
    float productValue1 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0 - scalarValue3)) > 0.0);
    float productValue2 = (productValue1 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue3)) + scalarValue3;
    if (dot(vec4((productValue1 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x) - scalarValue)) + scalarValue, (productValue1 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y) - scalarValue1)) + scalarValue1, (productValue1 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z) - scalarValue2)) + scalarValue2, (((productValue2 * fragmentVectorConstants1.packedValues[0u].w) - productValue2) * fragmentVectorConstants1.packedValues[3u].x) + productValue2), vec4(1.0)) < fragmentVectorConstants1.packedValues[1u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w;
    float productValue3 = (((fragmentVectorConstants1.packedValues[0u].w * sampledTextureValue3) - sampledTextureValue3) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue3;
    if ((productValue3 < fragmentVectorConstants1.packedValues[1u].x) || (productValue3 > (1.0 - fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue2.w;
    float sampledTextureValue6 = (float((((sampledTextureValue2.x + sampledTextureValue2.y) + sampledTextureValue2.z) * (1.0 - scalarValue3)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue3)) + scalarValue3;
    float productValue6 = (((sampledTextureValue6 * fragmentVectorConstants1.packedValues[0u].w) - sampledTextureValue6) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue6;
    if ((productValue6 < fragmentVectorConstants1.packedValues[1u].x) || (productValue6 > (1.0 - fragmentVectorConstants1.packedValues[1u].x)))
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
