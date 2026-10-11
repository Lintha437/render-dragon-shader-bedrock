#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlintForwardPBR / DepthOnlyAlphaTest / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 19
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/ActorGlintForwardPBR/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue2, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue2), sampledTextureValue2) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue7 = fma(float(productValue > 0.0), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue7, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue7), sampledTextureValue7) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue10, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue10), sampledTextureValue10) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    precise float sumValue = sampledTextureValue5.y + sampledTextureValue5.x;
    precise float sumValue1 = sampledTextureValue5.z + sumValue;
    precise float sumValue2 = 1.0 - scalarValue1;
    precise float productValue = sumValue2 * sumValue1;
    float sampledTextureValue13 = fma(float(productValue > 0.0), fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1), scalarValue1);
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue13, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue13), sampledTextureValue13) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u]));
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue), sampledTextureValue) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue6 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[3u])), texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[8u])), fma(sampledTextureValue6, uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[7u])), -sampledTextureValue6), sampledTextureValue6) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sampledTextureValue9 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentScalarConstants1.packedValues[7u];
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue9, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue9), sampledTextureValue9) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue5.w;
    float sampledTextureValue12 = (((1.0 - scalarValue1) * (sampledTextureValue5.z + (sampledTextureValue5.y + sampledTextureValue5.x))) > 0.0) ? (fma(fragmentScalarConstants1.packedValues[7u], texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w, -scalarValue1) + scalarValue1) : scalarValue1;
    if (fma(fragmentScalarConstants1.packedValues[12u], fma(sampledTextureValue12, fragmentScalarConstants1.packedValues[11u], -sampledTextureValue12), sampledTextureValue12) < fragmentScalarConstants1.packedValues[0u])
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w;
    if (((((fragmentVectorConstants1.packedValues[1u].w * sampledTextureValue1) - sampledTextureValue1) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue1) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue4 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[0u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue4 * fragmentVectorConstants1.packedValues[1u].w) - sampledTextureValue4) * fragmentVectorConstants1.packedValues[2u].x) + sampledTextureValue4) < 0.5)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w;
    if (((((fragmentVectorConstants1.packedValues[2u].w * sampledTextureValue8) - sampledTextureValue8) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue8) < fragmentVectorConstants1.packedValues[0u].x)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.w;
    float sampledTextureValue11 = (float((((sampledTextureValue3.x + sampledTextureValue3.y) + sampledTextureValue3.z) * (1.0 - scalarValue)) > 0.0) * ((texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).w * fragmentVectorConstants1.packedValues[1u].w) - scalarValue)) + scalarValue;
    if (((((sampledTextureValue11 * fragmentVectorConstants1.packedValues[2u].w) - sampledTextureValue11) * fragmentVectorConstants1.packedValues[3u].x) + sampledTextureValue11) < fragmentVectorConstants1.packedValues[0u].x)
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
