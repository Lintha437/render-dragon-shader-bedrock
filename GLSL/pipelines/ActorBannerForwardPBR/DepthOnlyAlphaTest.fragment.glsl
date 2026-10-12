#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBannerForwardPBR / DepthOnlyAlphaTest / fragment forward pipeline.
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
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ActorBannerForwardPBR/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue2), sampledTextureValue2) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    precise float sumValue = sampledTextureValue3.y + sampledTextureValue3.x;
    precise float sumValue1 = sampledTextureValue3.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue5 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue), scalarValue);
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue5, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue5), sampledTextureValue5) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue8 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue8, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue8), sampledTextureValue8) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    precise float sumValue = sampledTextureValue3.y + sampledTextureValue3.x;
    precise float sumValue1 = sampledTextureValue3.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue12 = fma(float(productValue > 0.0), fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue), scalarValue);
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue12, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue12), sampledTextureValue12) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue), sampledTextureValue) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue4 = (((1.0 - scalarValue) * (sampledTextureValue3.z + (sampledTextureValue3.y + sampledTextureValue3.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue) + scalarValue) : scalarValue;
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue4, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue4), sampledTextureValue4) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue9, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue9), sampledTextureValue9) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue10 = (((1.0 - scalarValue) * (sampledTextureValue3.z + (sampledTextureValue3.y + sampledTextureValue3.x))) > 0.0) ? (fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue) + scalarValue) : scalarValue;
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue10, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue10), sampledTextureValue10) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w;
    if (((((fragmentVectorConstants1.packedValues[1u].w * sampledTextureValue1) - sampledTextureValue1) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue1) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue6.w;
    float sampledTextureValue7 = (float((((sampledTextureValue6.x + sampledTextureValue6.y) + sampledTextureValue6.z) * (1.0 - scalarValue1)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w) - scalarValue1)) + scalarValue1;
    if (((((sampledTextureValue7 * fragmentVectorConstants1.packedValues[1u].w) - sampledTextureValue7) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue7) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue11 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w;
    if (((((fragmentVectorConstants1.packedValues[2u].w * sampledTextureValue11) - sampledTextureValue11) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue11) < fragmentVectorConstants1.packedValues[0u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue6.w;
    float sampledTextureValue13 = (float((((sampledTextureValue6.x + sampledTextureValue6.y) + sampledTextureValue6.z) * (1.0 - scalarValue1)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue1)) + scalarValue1;
    if (((((sampledTextureValue13 * fragmentVectorConstants1.packedValues[2u].w) - sampledTextureValue13) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue13) < fragmentVectorConstants1.packedValues[0u].x)
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
