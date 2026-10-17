#version 460
#extension GL_GOOGLE_include_directive : require
// Bloom / BloomBlend / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/Bloom/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue4 = fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue5 = fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].w;
    precise float sumValue8 = floor(productValue4) - 0.5;
    precise float sumValue9 = floor(productValue5) - 0.5;
    precise float quotientValue8 = sumValue8 / fragmentVectorConstants1.packedValues[1u].z;
    precise float quotientValue9 = sumValue9 / fragmentVectorConstants1.packedValues[1u].w;
    precise float quotientValue10 = 0.5 / fragmentVectorConstants1.packedValues[1u].z;
    precise float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue6 = quotientValue10 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue7 = quotientValue11 * fragmentVectorConstants1.packedValues[1u].y;
    float multiplyAddValue4 = spvNMin(quotientValue8, fma(productValue6, 2.0, varyingTexCoord0.x));
    float multiplyAddValue5 = spvNMin(quotientValue9, fma(productValue7, 2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue18 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue4, multiplyAddValue5));
    float multiplyAddValue6 = spvNMin(quotientValue8, fma(productValue6, -2.0, varyingTexCoord0.x));
    float multiplyAddValue7 = spvNMin(quotientValue9, fma(productValue7, -2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue6, multiplyAddValue5));
    vec4 sampledTextureValue20 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue4, multiplyAddValue7));
    precise float productValue8 = sampledTextureValue19.x * 0.16599999368190765380859375;
    precise float productValue9 = sampledTextureValue19.y * 0.16599999368190765380859375;
    precise float productValue10 = sampledTextureValue19.z * 0.16599999368190765380859375;
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue6, multiplyAddValue7));
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue7, 4.0, varyingTexCoord0.y))));
    precise float productValue11 = productValue6 * 4.0;
    precise float productValue12 = productValue7 * 4.0;
    vec4 sampledTextureValue23 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(-productValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(-productValue7, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue24 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue11, -1.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue12, 1.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue25 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue11, 1.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue12, -1.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue23.x, 0.082999996840953826904296875, fma(sampledTextureValue25.x, 0.082999996840953826904296875, fma(sampledTextureValue24.x, 0.082999996840953826904296875, fma(sampledTextureValue22.x, 0.082999996840953826904296875, fma(sampledTextureValue21.x, 0.16599999368190765380859375, fma(sampledTextureValue20.x, 0.16599999368190765380859375, fma(sampledTextureValue18.x, 0.16599999368190765380859375, productValue8))))))), sampledTextureValue8.x);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue23.y, 0.082999996840953826904296875, fma(sampledTextureValue25.y, 0.082999996840953826904296875, fma(sampledTextureValue24.y, 0.082999996840953826904296875, fma(sampledTextureValue22.y, 0.082999996840953826904296875, fma(sampledTextureValue21.y, 0.16599999368190765380859375, fma(sampledTextureValue20.y, 0.16599999368190765380859375, fma(sampledTextureValue18.y, 0.16599999368190765380859375, productValue9))))))), sampledTextureValue8.y);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue23.z, 0.082999996840953826904296875, fma(sampledTextureValue25.z, 0.082999996840953826904296875, fma(sampledTextureValue24.z, 0.082999996840953826904296875, fma(sampledTextureValue22.z, 0.082999996840953826904296875, fma(sampledTextureValue21.z, 0.16599999368190765380859375, fma(sampledTextureValue20.z, 0.16599999368190765380859375, fma(sampledTextureValue18.z, 0.16599999368190765380859375, productValue10))))))), sampledTextureValue8.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float quotientValue = (floor(fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].z) - 0.5) / fragmentVectorConstants1.packedValues[1u].z;
    float quotientValue1 = (floor(fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].w) - 0.5) / fragmentVectorConstants1.packedValues[1u].w;
    float quotientValue2 = (0.5 / fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].x;
    float quotientValue3 = (0.5 / fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[1u].y;
    float multiplyAddValue = spvNMin(quotientValue, fma(quotientValue2, 2.0, varyingTexCoord0.x));
    float multiplyAddValue1 = spvNMin(quotientValue1, fma(quotientValue3, 2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue, multiplyAddValue1));
    float multiplyAddValue2 = spvNMin(quotientValue, fma(quotientValue2, -2.0, varyingTexCoord0.x));
    float multiplyAddValue3 = spvNMin(quotientValue1, fma(quotientValue3, -2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue2, multiplyAddValue1));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue, multiplyAddValue3));
    float productValue = quotientValue2 * 4.0;
    float productValue1 = quotientValue3 * 4.0;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue2, multiplyAddValue3));
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue, fma(quotientValue2, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue1, fma(quotientValue3, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue, fma(-quotientValue2, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue1, fma(-quotientValue3, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue, varyingTexCoord0.x - productValue), spvNMin(quotientValue1, productValue1 + varyingTexCoord0.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue, productValue + varyingTexCoord0.x), spvNMin(quotientValue1, varyingTexCoord0.y - productValue1)));
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue5.x, 0.082999996840953826904296875, fma(sampledTextureValue7.x, 0.082999996840953826904296875, fma(sampledTextureValue6.x, 0.082999996840953826904296875, fma(sampledTextureValue4.x, 0.082999996840953826904296875, fma(sampledTextureValue3.x, 0.16599999368190765380859375, fma(sampledTextureValue2.x, 0.16599999368190765380859375, fma(sampledTextureValue.x, 0.16599999368190765380859375, sampledTextureValue1.x * 0.16599999368190765380859375))))))), sampledTextureValue8.x);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue5.y, 0.082999996840953826904296875, fma(sampledTextureValue7.y, 0.082999996840953826904296875, fma(sampledTextureValue6.y, 0.082999996840953826904296875, fma(sampledTextureValue4.y, 0.082999996840953826904296875, fma(sampledTextureValue3.y, 0.16599999368190765380859375, fma(sampledTextureValue2.y, 0.16599999368190765380859375, fma(sampledTextureValue.y, 0.16599999368190765380859375, sampledTextureValue1.y * 0.16599999368190765380859375))))))), sampledTextureValue8.y);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[0u], fma(sampledTextureValue5.z, 0.082999996840953826904296875, fma(sampledTextureValue7.z, 0.082999996840953826904296875, fma(sampledTextureValue6.z, 0.082999996840953826904296875, fma(sampledTextureValue4.z, 0.082999996840953826904296875, fma(sampledTextureValue3.z, 0.16599999368190765380859375, fma(sampledTextureValue2.z, 0.16599999368190765380859375, fma(sampledTextureValue.z, 0.16599999368190765380859375, sampledTextureValue1.z * 0.16599999368190765380859375))))))), sampledTextureValue8.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue4 = (2.0 / fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[1u].x;
    float quotientValue5 = (2.0 / fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[1u].y;
    float quotientValue6 = (floor(fragmentVectorConstants1.packedValues[1u].x * fragmentVectorConstants1.packedValues[1u].z) + (-0.5)) / fragmentVectorConstants1.packedValues[1u].z;
    float quotientValue7 = (floor(fragmentVectorConstants1.packedValues[1u].y * fragmentVectorConstants1.packedValues[1u].w) + (-0.5)) / fragmentVectorConstants1.packedValues[1u].w;
    float productValue2 = quotientValue4 * 0.5;
    float productValue3 = quotientValue5 * 0.5;
    float sumValue = spvNMin(productValue2 + varyingTexCoord0.x, quotientValue6);
    float sumValue1 = spvNMin(productValue3 + varyingTexCoord0.y, quotientValue7);
    vec4 sampledTextureValue9 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue1));
    float sumValue2 = spvNMin(varyingTexCoord0.x - productValue2, quotientValue6);
    vec4 sampledTextureValue10 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue1));
    float sumValue3 = spvNMin(varyingTexCoord0.y - productValue3, quotientValue7);
    vec4 sampledTextureValue11 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue3));
    vec4 sampledTextureValue12 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue3));
    float sumValue4 = spvNMin(varyingTexCoord0.x + quotientValue4, quotientValue6);
    float sumValue5 = spvNMin(varyingTexCoord0.y + quotientValue5, quotientValue7);
    vec4 sampledTextureValue13 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue4, sumValue5));
    float sumValue6 = spvNMin(varyingTexCoord0.x - quotientValue4, quotientValue6);
    vec4 sampledTextureValue14 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue5));
    float sumValue7 = spvNMin(varyingTexCoord0.y - quotientValue5, quotientValue7);
    vec4 sampledTextureValue15 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue4, sumValue7));
    vec4 sampledTextureValue16 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue7));
    vec4 sampledTextureValue17 = texture(sampler2D(hdRiTexture, hdRiSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (fragmentVectorConstants1.packedValues[0u].x * (((((sampledTextureValue14.x + sampledTextureValue13.x) + sampledTextureValue15.x) + sampledTextureValue16.x) * 0.082999996840953826904296875) + ((((sampledTextureValue10.x + sampledTextureValue9.x) + sampledTextureValue11.x) + sampledTextureValue12.x) * 0.16599999368190765380859375))) + sampledTextureValue17.x;
    fragmentColor0.y = (fragmentVectorConstants1.packedValues[0u].x * (((((sampledTextureValue14.y + sampledTextureValue13.y) + sampledTextureValue15.y) + sampledTextureValue16.y) * 0.082999996840953826904296875) + ((((sampledTextureValue10.y + sampledTextureValue9.y) + sampledTextureValue11.y) + sampledTextureValue12.y) * 0.16599999368190765380859375))) + sampledTextureValue17.y;
    fragmentColor0.z = (fragmentVectorConstants1.packedValues[0u].x * (((((sampledTextureValue14.z + sampledTextureValue13.z) + sampledTextureValue15.z) + sampledTextureValue16.z) * 0.082999996840953826904296875) + ((((sampledTextureValue10.z + sampledTextureValue9.z) + sampledTextureValue11.z) + sampledTextureValue12.z) * 0.16599999368190765380859375))) + sampledTextureValue17.z;
#endif
    fragmentColor0.w = 1.0;
}
