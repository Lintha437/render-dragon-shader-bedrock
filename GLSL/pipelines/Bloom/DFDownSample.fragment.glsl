#version 460
#extension GL_GOOGLE_include_directive : require
// Bloom / DFDownSample / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/Bloom/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float quotientValue8 = 2.0 / fragmentVectorConstants1.packedValues[0u].z;
    precise float quotientValue9 = 2.0 / fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue2 = quotientValue8 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue3 = quotientValue9 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue4 = fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue5 = fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w;
    precise float sumValue4 = floor(productValue4) - 0.5;
    precise float sumValue5 = floor(productValue5) - 0.5;
    precise float quotientValue10 = sumValue4 / fragmentVectorConstants1.packedValues[0u].z;
    precise float quotientValue11 = sumValue5 / fragmentVectorConstants1.packedValues[0u].w;
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(fma(productValue2, 1.5, varyingTexCoord0.x), quotientValue10), spvNMin(fma(productValue3, 1.5, varyingTexCoord0.y), quotientValue11)));
    precise float productValue6 = sampledTextureValue10.x * 0.125;
    precise float productValue7 = sampledTextureValue10.y * 0.125;
    precise float productValue8 = sampledTextureValue10.z * 0.125;
    precise float productValue9 = sampledTextureValue10.w * 0.125;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue10, varyingTexCoord0.x), spvNMin(quotientValue11, varyingTexCoord0.y)));
    precise float productValue10 = productValue2 * 1.5;
    precise float productValue11 = productValue3 * 1.5;
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue10, fma(-productValue2, 1.5, varyingTexCoord0.x)), spvNMin(quotientValue11, fma(-productValue3, 1.5, varyingTexCoord0.y))));
    precise float sumValue6 = varyingTexCoord0.x - productValue10;
    precise float sumValue7 = productValue11 + varyingTexCoord0.y;
    precise float sumValue8 = productValue10 + varyingTexCoord0.x;
    precise float sumValue9 = varyingTexCoord0.y - productValue11;
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue10, sumValue6), spvNMin(quotientValue11, sumValue7)));
    vec4 sampledTextureValue14 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue10, sumValue8), spvNMin(quotientValue11, sumValue9)));
    fragmentColor0.x = fma(sampledTextureValue12.x, 0.125, fma(sampledTextureValue14.x, 0.125, fma(sampledTextureValue13.x, 0.125, fma(sampledTextureValue11.x, 0.5, productValue6))));
    fragmentColor0.y = fma(sampledTextureValue12.y, 0.125, fma(sampledTextureValue14.y, 0.125, fma(sampledTextureValue13.y, 0.125, fma(sampledTextureValue11.y, 0.5, productValue7))));
    fragmentColor0.z = fma(sampledTextureValue12.z, 0.125, fma(sampledTextureValue14.z, 0.125, fma(sampledTextureValue13.z, 0.125, fma(sampledTextureValue11.z, 0.5, productValue8))));
    fragmentColor0.w = fma(sampledTextureValue12.w, 0.125, fma(sampledTextureValue14.w, 0.125, fma(sampledTextureValue13.w, 0.125, fma(sampledTextureValue11.w, 0.5, productValue9))));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float quotientValue4 = (2.0 / fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[0u].x;
    float quotientValue5 = (2.0 / fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[0u].y;
    float productValue = quotientValue4 * 1.5;
    float productValue1 = quotientValue5 * 1.5;
    float quotientValue6 = (floor(fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z) - 0.5) / fragmentVectorConstants1.packedValues[0u].z;
    float quotientValue7 = (floor(fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w) - 0.5) / fragmentVectorConstants1.packedValues[0u].w;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(fma(quotientValue4, 1.5, varyingTexCoord0.x), quotientValue6), spvNMin(fma(quotientValue5, 1.5, varyingTexCoord0.y), quotientValue7)));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, varyingTexCoord0.x), spvNMin(quotientValue7, varyingTexCoord0.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, fma(-quotientValue4, 1.5, varyingTexCoord0.x)), spvNMin(quotientValue7, fma(-quotientValue5, 1.5, varyingTexCoord0.y))));
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, varyingTexCoord0.x - productValue), spvNMin(quotientValue7, productValue1 + varyingTexCoord0.y)));
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue6, productValue + varyingTexCoord0.x), spvNMin(quotientValue7, varyingTexCoord0.y - productValue1)));
    fragmentColor0.x = fma(sampledTextureValue7.x, 0.125, fma(sampledTextureValue9.x, 0.125, fma(sampledTextureValue8.x, 0.125, fma(sampledTextureValue6.x, 0.5, sampledTextureValue5.x * 0.125))));
    fragmentColor0.y = fma(sampledTextureValue7.y, 0.125, fma(sampledTextureValue9.y, 0.125, fma(sampledTextureValue8.y, 0.125, fma(sampledTextureValue6.y, 0.5, sampledTextureValue5.y * 0.125))));
    fragmentColor0.z = fma(sampledTextureValue7.z, 0.125, fma(sampledTextureValue9.z, 0.125, fma(sampledTextureValue8.z, 0.125, fma(sampledTextureValue6.z, 0.5, sampledTextureValue5.z * 0.125))));
    fragmentColor0.w = fma(sampledTextureValue7.w, 0.125, fma(sampledTextureValue9.w, 0.125, fma(sampledTextureValue8.w, 0.125, fma(sampledTextureValue6.w, 0.5, sampledTextureValue5.w * 0.125))));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = (3.0 / fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[0u].x;
    float quotientValue1 = (3.0 / fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[0u].y;
    float quotientValue2 = (floor(fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z) + (-0.5)) / fragmentVectorConstants1.packedValues[0u].z;
    float quotientValue3 = (floor(fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w) + (-0.5)) / fragmentVectorConstants1.packedValues[0u].w;
    vec4 sampledTextureValue = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(spvNMin(varyingTexCoord0.x, quotientValue2), spvNMin(varyingTexCoord0.y, quotientValue3)));
    float sumValue = spvNMin(quotientValue + varyingTexCoord0.x, quotientValue2);
    float sumValue1 = spvNMin(quotientValue1 + varyingTexCoord0.y, quotientValue3);
    vec4 sampledTextureValue1 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue1));
    float sumValue2 = spvNMin(varyingTexCoord0.x - quotientValue, quotientValue2);
    vec4 sampledTextureValue2 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue1));
    float sumValue3 = spvNMin(varyingTexCoord0.y - quotientValue1, quotientValue3);
    vec4 sampledTextureValue3 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue3));
    vec4 sampledTextureValue4 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue3));
    fragmentColor0.x = ((((sampledTextureValue2.x + sampledTextureValue1.x) + sampledTextureValue3.x) + sampledTextureValue4.x) * 0.125) + (sampledTextureValue.x * 0.5);
    fragmentColor0.y = ((((sampledTextureValue2.y + sampledTextureValue1.y) + sampledTextureValue3.y) + sampledTextureValue4.y) * 0.125) + (sampledTextureValue.y * 0.5);
    fragmentColor0.z = ((((sampledTextureValue2.z + sampledTextureValue1.z) + sampledTextureValue3.z) + sampledTextureValue4.z) * 0.125) + (sampledTextureValue.z * 0.5);
    fragmentColor0.w = ((((sampledTextureValue2.w + sampledTextureValue1.w) + sampledTextureValue3.w) + sampledTextureValue4.w) * 0.125) + (sampledTextureValue.w * 0.5);
#endif
}
