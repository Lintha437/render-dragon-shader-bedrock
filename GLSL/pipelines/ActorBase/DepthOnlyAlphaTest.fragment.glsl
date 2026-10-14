#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBase / DepthOnlyAlphaTest / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif

#include "../../include/materials/ActorBase/FragmentBindings.glsli"

#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue2), sampledTextureValue2) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue7 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue7, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue7), sampledTextureValue7) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    precise float reinterpretedBits2 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits3 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits.y);
    precise float reinterpretedBits4 = sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits.z);
    precise float reinterpretedBits5 = sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits.w);
    float multiplyAddValue1 = rdDot4Precise2(vec4(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(reinterpretedBits5, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -reinterpretedBits5), reinterpretedBits5)), vec4(1.0));
    if (multiplyAddValue1 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue5.x;
    float scalarValue6 = sampledTextureValue5.y;
    float scalarValue7 = sampledTextureValue5.z;
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue3 = scalarValue6 + scalarValue5;
    precise float sumValue4 = scalarValue7 + sumValue3;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue6 = sumValue2 * sumValue4;
    float scalarValue8 = float(productValue6 > 0.0);
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float multiplyAddValue4 = fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue9.w, -scalarValue1), scalarValue1);
    float multiplyAddValue5 = rdDot4Precise2(vec4(fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue9.x, -scalarValue5), scalarValue5), fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue9.y, -scalarValue6), scalarValue6), fma(scalarValue8, fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue9.z, -scalarValue7), scalarValue7), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(multiplyAddValue4, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -multiplyAddValue4), multiplyAddValue4)), vec4(1.0));
    if (multiplyAddValue5 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    float multiplyAddValue7 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue12, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue12), sampledTextureValue12);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    precise float sumValue5 = 1.0 - reinterpretedBits6;
    if ((multiplyAddValue7 < reinterpretedBits6) || (sumValue5 < multiplyAddValue7))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue15 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    float multiplyAddValue9 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue15, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue15), sampledTextureValue15);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    precise float sumValue5 = 1.0 - reinterpretedBits6;
    if ((multiplyAddValue9 < reinterpretedBits6) || (sumValue5 < multiplyAddValue9))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue12, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue12), sampledTextureValue12) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue15 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue15, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue15), sampledTextureValue15) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue1, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue1), sampledTextureValue1) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue6 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue6, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue6), sampledTextureValue6) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float reinterpretedBits1 = sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits.w);
    float multiplyAddValue = rdDot4Precise2(vec4(sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits.x), sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits.y), sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits.z), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(reinterpretedBits1, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -reinterpretedBits1), reinterpretedBits1)), vec4(1.0));
    if (multiplyAddValue < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue5.x;
    float scalarValue6 = sampledTextureValue5.y;
    float scalarValue7 = sampledTextureValue5.z;
    float scalarValue1 = sampledTextureValue5.w;
    bool productValue4 = ((1.0 - scalarValue1) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[2u]);
    float multiplyAddValue2 = productValue4 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue9.w, -scalarValue1) + scalarValue1) : scalarValue1;
    float multiplyAddValue3 = rdDot4Precise2(vec4(productValue4 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue9.x, -scalarValue5) + scalarValue5) : scalarValue5, productValue4 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue9.y, -scalarValue6) + scalarValue6) : scalarValue6, productValue4 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue9.z, -scalarValue7) + scalarValue7) : scalarValue7, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(multiplyAddValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -multiplyAddValue2), multiplyAddValue2)), vec4(1.0));
    if (multiplyAddValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    float multiplyAddValue6 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue11, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue11), sampledTextureValue11);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    if ((multiplyAddValue6 < reinterpretedBits6) || ((1.0 - reinterpretedBits6) < multiplyAddValue6))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue14 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    float multiplyAddValue8 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue14, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue14), sampledTextureValue14);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u]));
    if ((multiplyAddValue8 < reinterpretedBits6) || ((1.0 - reinterpretedBits6) < multiplyAddValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue11, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue11), sampledTextureValue11) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue14 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[11u])), texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[12u])), fma(sampledTextureValue14, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), -sampledTextureValue14), sampledTextureValue14) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[4u])))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w;
    if (((((fragmentVectorConstants1.packedValues[0u].w * sampledTextureValue) - sampledTextureValue) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue4 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue4 * fragmentVectorConstants1.packedValues[0u].w) - sampledTextureValue4) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue4) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue1 = sampledTextureValue8.w * fragmentVectorConstants1.packedValues[2u].w;
    if (dot(vec4(sampledTextureValue8.x * fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue8.y * fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue8.z * fragmentVectorConstants1.packedValues[2u].z, (((fragmentVectorConstants1.packedValues[0u].w * productValue1) - productValue1) * fragmentVectorConstants1.packedValues[3u].x) + productValue1), vec4(1.0)) < fragmentVectorConstants1.packedValues[1u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue = sampledTextureValue3.w;
    float productValue2 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue)) > 0.0);
    float productValue3 = (productValue2 * ((sampledTextureValue8.w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue)) + scalarValue;
    if (dot(vec4((productValue2 * ((sampledTextureValue8.x * fragmentVectorConstants1.packedValues[2u].x) - scalarValue2)) + scalarValue2, (productValue2 * ((sampledTextureValue8.y * fragmentVectorConstants1.packedValues[2u].y) - scalarValue3)) + scalarValue3, (productValue2 * ((sampledTextureValue8.z * fragmentVectorConstants1.packedValues[2u].z) - scalarValue4)) + scalarValue4, (((productValue3 * fragmentVectorConstants1.packedValues[0u].w) - productValue3) * fragmentVectorConstants1.packedValues[3u].x) + productValue3), vec4(1.0)) < fragmentVectorConstants1.packedValues[1u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue10 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w;
    float productValue5 = (((fragmentVectorConstants1.packedValues[0u].w * sampledTextureValue10) - sampledTextureValue10) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue10;
    if ((productValue5 < fragmentVectorConstants1.packedValues[1u].x) || (productValue5 > (1.0 - fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue13 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue)) + scalarValue;
    float productValue7 = (((sampledTextureValue13 * fragmentVectorConstants1.packedValues[0u].w) - sampledTextureValue13) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue13;
    if ((productValue7 < fragmentVectorConstants1.packedValues[1u].x) || (productValue7 > (1.0 - fragmentVectorConstants1.packedValues[1u].x)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue10 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w;
    if (((((fragmentVectorConstants1.packedValues[0u].w * sampledTextureValue10) - sampledTextureValue10) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue10) < fragmentVectorConstants1.packedValues[1u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue13 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue13 * fragmentVectorConstants1.packedValues[0u].w) - sampledTextureValue13) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue13) < fragmentVectorConstants1.packedValues[1u].x)
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
