#version 460
#extension GL_GOOGLE_include_directive : require
// Bloom / DFUpSample / fragment forward pipeline.
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
    precise float productValue4 = fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue5 = fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w;
    precise float sumValue8 = floor(productValue4) - 0.5;
    precise float sumValue9 = floor(productValue5) - 0.5;
    precise float quotientValue8 = sumValue8 / fragmentVectorConstants1.packedValues[0u].z;
    precise float quotientValue9 = sumValue9 / fragmentVectorConstants1.packedValues[0u].w;
    precise float quotientValue10 = 0.5 / fragmentVectorConstants1.packedValues[0u].z;
    precise float quotientValue11 = 0.5 / fragmentVectorConstants1.packedValues[0u].w;
    precise float productValue6 = quotientValue10 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue7 = quotientValue11 * fragmentVectorConstants1.packedValues[0u].y;
    float multiplyAddValue4 = spvNMin(quotientValue8, fma(productValue6, 2.0, varyingTexCoord0.x));
    float multiplyAddValue5 = spvNMin(quotientValue9, fma(productValue7, 2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue4, multiplyAddValue5));
    float multiplyAddValue6 = spvNMin(quotientValue8, fma(productValue6, -2.0, varyingTexCoord0.x));
    float multiplyAddValue7 = spvNMin(quotientValue9, fma(productValue7, -2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue6, multiplyAddValue5));
    vec4 sampledTextureValue18 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue4, multiplyAddValue7));
    precise float productValue8 = sampledTextureValue17.x * 0.16599999368190765380859375;
    precise float productValue9 = sampledTextureValue17.y * 0.16599999368190765380859375;
    precise float productValue10 = sampledTextureValue17.z * 0.16599999368190765380859375;
    precise float productValue11 = sampledTextureValue17.w * 0.16599999368190765380859375;
    vec4 sampledTextureValue19 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue6, multiplyAddValue7));
    vec4 sampledTextureValue20 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue7, 4.0, varyingTexCoord0.y))));
    precise float productValue12 = productValue6 * 4.0;
    precise float productValue13 = productValue7 * 4.0;
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(-productValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(-productValue7, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue22 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue12, -1.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue13, 1.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue23 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue8, fma(productValue12, 1.0, varyingTexCoord0.x)), spvNMin(quotientValue9, fma(productValue13, -1.0, varyingTexCoord0.y))));
    fragmentColor0.x = fma(sampledTextureValue21.x, 0.082999996840953826904296875, fma(sampledTextureValue23.x, 0.082999996840953826904296875, fma(sampledTextureValue22.x, 0.082999996840953826904296875, fma(sampledTextureValue20.x, 0.082999996840953826904296875, fma(sampledTextureValue19.x, 0.16599999368190765380859375, fma(sampledTextureValue18.x, 0.16599999368190765380859375, fma(sampledTextureValue16.x, 0.16599999368190765380859375, productValue8)))))));
    fragmentColor0.y = fma(sampledTextureValue21.y, 0.082999996840953826904296875, fma(sampledTextureValue23.y, 0.082999996840953826904296875, fma(sampledTextureValue22.y, 0.082999996840953826904296875, fma(sampledTextureValue20.y, 0.082999996840953826904296875, fma(sampledTextureValue19.y, 0.16599999368190765380859375, fma(sampledTextureValue18.y, 0.16599999368190765380859375, fma(sampledTextureValue16.y, 0.16599999368190765380859375, productValue9)))))));
    fragmentColor0.z = fma(sampledTextureValue21.z, 0.082999996840953826904296875, fma(sampledTextureValue23.z, 0.082999996840953826904296875, fma(sampledTextureValue22.z, 0.082999996840953826904296875, fma(sampledTextureValue20.z, 0.082999996840953826904296875, fma(sampledTextureValue19.z, 0.16599999368190765380859375, fma(sampledTextureValue18.z, 0.16599999368190765380859375, fma(sampledTextureValue16.z, 0.16599999368190765380859375, productValue10)))))));
    fragmentColor0.w = fma(sampledTextureValue21.w, 0.082999996840953826904296875, fma(sampledTextureValue23.w, 0.082999996840953826904296875, fma(sampledTextureValue22.w, 0.082999996840953826904296875, fma(sampledTextureValue20.w, 0.082999996840953826904296875, fma(sampledTextureValue19.w, 0.16599999368190765380859375, fma(sampledTextureValue18.w, 0.16599999368190765380859375, fma(sampledTextureValue16.w, 0.16599999368190765380859375, productValue11)))))));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float quotientValue4 = (floor(fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z) - 0.5) / fragmentVectorConstants1.packedValues[0u].z;
    float quotientValue5 = (floor(fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w) - 0.5) / fragmentVectorConstants1.packedValues[0u].w;
    float quotientValue6 = (0.5 / fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[0u].x;
    float quotientValue7 = (0.5 / fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[0u].y;
    float multiplyAddValue = spvNMin(quotientValue4, fma(quotientValue6, 2.0, varyingTexCoord0.x));
    float multiplyAddValue1 = spvNMin(quotientValue5, fma(quotientValue7, 2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue, multiplyAddValue1));
    float multiplyAddValue2 = spvNMin(quotientValue4, fma(quotientValue6, -2.0, varyingTexCoord0.x));
    float multiplyAddValue3 = spvNMin(quotientValue5, fma(quotientValue7, -2.0, varyingTexCoord0.y));
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue2, multiplyAddValue1));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue, multiplyAddValue3));
    float productValue2 = quotientValue6 * 4.0;
    float productValue3 = quotientValue7 * 4.0;
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue2, multiplyAddValue3));
    vec4 sampledTextureValue12 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue4, fma(quotientValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue5, fma(quotientValue7, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue13 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue4, fma(-quotientValue6, 4.0, varyingTexCoord0.x)), spvNMin(quotientValue5, fma(-quotientValue7, 4.0, varyingTexCoord0.y))));
    vec4 sampledTextureValue14 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue4, varyingTexCoord0.x - productValue2), spvNMin(quotientValue5, productValue3 + varyingTexCoord0.y)));
    vec4 sampledTextureValue15 = texture(sampler2D(materialTexture1, textureSampler1), vec2(spvNMin(quotientValue4, productValue2 + varyingTexCoord0.x), spvNMin(quotientValue5, varyingTexCoord0.y - productValue3)));
    fragmentColor0.x = fma(sampledTextureValue13.x, 0.082999996840953826904296875, fma(sampledTextureValue15.x, 0.082999996840953826904296875, fma(sampledTextureValue14.x, 0.082999996840953826904296875, fma(sampledTextureValue12.x, 0.082999996840953826904296875, fma(sampledTextureValue11.x, 0.16599999368190765380859375, fma(sampledTextureValue10.x, 0.16599999368190765380859375, fma(sampledTextureValue8.x, 0.16599999368190765380859375, sampledTextureValue9.x * 0.16599999368190765380859375)))))));
    fragmentColor0.y = fma(sampledTextureValue13.y, 0.082999996840953826904296875, fma(sampledTextureValue15.y, 0.082999996840953826904296875, fma(sampledTextureValue14.y, 0.082999996840953826904296875, fma(sampledTextureValue12.y, 0.082999996840953826904296875, fma(sampledTextureValue11.y, 0.16599999368190765380859375, fma(sampledTextureValue10.y, 0.16599999368190765380859375, fma(sampledTextureValue8.y, 0.16599999368190765380859375, sampledTextureValue9.y * 0.16599999368190765380859375)))))));
    fragmentColor0.z = fma(sampledTextureValue13.z, 0.082999996840953826904296875, fma(sampledTextureValue15.z, 0.082999996840953826904296875, fma(sampledTextureValue14.z, 0.082999996840953826904296875, fma(sampledTextureValue12.z, 0.082999996840953826904296875, fma(sampledTextureValue11.z, 0.16599999368190765380859375, fma(sampledTextureValue10.z, 0.16599999368190765380859375, fma(sampledTextureValue8.z, 0.16599999368190765380859375, sampledTextureValue9.z * 0.16599999368190765380859375)))))));
    fragmentColor0.w = fma(sampledTextureValue13.w, 0.082999996840953826904296875, fma(sampledTextureValue15.w, 0.082999996840953826904296875, fma(sampledTextureValue14.w, 0.082999996840953826904296875, fma(sampledTextureValue12.w, 0.082999996840953826904296875, fma(sampledTextureValue11.w, 0.16599999368190765380859375, fma(sampledTextureValue10.w, 0.16599999368190765380859375, fma(sampledTextureValue8.w, 0.16599999368190765380859375, sampledTextureValue9.w * 0.16599999368190765380859375)))))));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = (2.0 / fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[0u].x;
    float quotientValue1 = (2.0 / fragmentVectorConstants1.packedValues[0u].w) * fragmentVectorConstants1.packedValues[0u].y;
    float quotientValue2 = (floor(fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].z) + (-0.5)) / fragmentVectorConstants1.packedValues[0u].z;
    float quotientValue3 = (floor(fragmentVectorConstants1.packedValues[0u].y * fragmentVectorConstants1.packedValues[0u].w) + (-0.5)) / fragmentVectorConstants1.packedValues[0u].w;
    float productValue = quotientValue * 0.5;
    float productValue1 = quotientValue1 * 0.5;
    float sumValue = spvNMin(productValue + varyingTexCoord0.x, quotientValue2);
    float sumValue1 = spvNMin(productValue1 + varyingTexCoord0.y, quotientValue3);
    vec4 sampledTextureValue = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue1));
    float sumValue2 = spvNMin(varyingTexCoord0.x - productValue, quotientValue2);
    vec4 sampledTextureValue1 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue1));
    float sumValue3 = spvNMin(varyingTexCoord0.y - productValue1, quotientValue3);
    vec4 sampledTextureValue2 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue, sumValue3));
    vec4 sampledTextureValue3 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue2, sumValue3));
    float sumValue4 = spvNMin(quotientValue + varyingTexCoord0.x, quotientValue2);
    float sumValue5 = spvNMin(quotientValue1 + varyingTexCoord0.y, quotientValue3);
    vec4 sampledTextureValue4 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue4, sumValue5));
    float sumValue6 = spvNMin(varyingTexCoord0.x - quotientValue, quotientValue2);
    vec4 sampledTextureValue5 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue5));
    float sumValue7 = spvNMin(varyingTexCoord0.y - quotientValue1, quotientValue3);
    vec4 sampledTextureValue6 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue4, sumValue7));
    vec4 sampledTextureValue7 = texture(sampler2D(blurPyramidTextureTexture, blurPyramidTextureSampler), vec2(sumValue6, sumValue7));
    fragmentColor0.x = ((((sampledTextureValue5.x + sampledTextureValue4.x) + sampledTextureValue6.x) + sampledTextureValue7.x) * 0.082999996840953826904296875) + ((((sampledTextureValue1.x + sampledTextureValue.x) + sampledTextureValue2.x) + sampledTextureValue3.x) * 0.16599999368190765380859375);
    fragmentColor0.y = ((((sampledTextureValue5.y + sampledTextureValue4.y) + sampledTextureValue6.y) + sampledTextureValue7.y) * 0.082999996840953826904296875) + ((((sampledTextureValue1.y + sampledTextureValue.y) + sampledTextureValue2.y) + sampledTextureValue3.y) * 0.16599999368190765380859375);
    fragmentColor0.z = ((((sampledTextureValue5.z + sampledTextureValue4.z) + sampledTextureValue6.z) + sampledTextureValue7.z) * 0.082999996840953826904296875) + ((((sampledTextureValue1.z + sampledTextureValue.z) + sampledTextureValue2.z) + sampledTextureValue3.z) * 0.16599999368190765380859375);
    fragmentColor0.w = ((((sampledTextureValue5.w + sampledTextureValue4.w) + sampledTextureValue6.w) + sampledTextureValue7.w) * 0.082999996840953826904296875) + ((((sampledTextureValue1.w + sampledTextureValue.w) + sampledTextureValue2.w) + sampledTextureValue3.w) * 0.16599999368190765380859375);
#endif
}
