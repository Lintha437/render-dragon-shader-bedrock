#version 460
#extension GL_GOOGLE_include_directive : require
// Entity / Glint / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE0
#define RD_OPTION_SOURCE_INPUT_TYPE0 RD_SOURCE_INPUT_TYPE0_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE1
#define RD_OPTION_SOURCE_INPUT_TYPE1 RD_SOURCE_INPUT_TYPE1_CONSTANT
#endif
#ifndef RD_OPTION_SOURCE_INPUT_TYPE2
#define RD_OPTION_SOURCE_INPUT_TYPE2 RD_SOURCE_INPUT_TYPE2_CONSTANT
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 58
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Entity/FragmentBindings.glsli"

void main()
{
#if (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z;
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, fragmentVectorConstants1.packedValues[2u].z);
    precise float productValue12 = multiplyAddValue6 * varyingColor3.x;
    precise float productValue13 = multiplyAddValue7 * varyingColor3.y;
    precise float productValue14 = multiplyAddValue8 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue15 = scalarValue2 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue16 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue17 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue18 = scalarValue2 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue9 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].x, productValue15) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue10 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[1u].y, productValue16) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue11 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[1u].z, productValue17) * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue12 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].w, productValue18) * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue19 = multiplyAddValue9 * multiplyAddValue9;
    precise float productValue20 = multiplyAddValue10 * multiplyAddValue10;
    precise float productValue21 = multiplyAddValue11 * multiplyAddValue11;
    precise float multiplyAddValue13 = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), productValue12) + productValue19;
    precise float multiplyAddValue14 = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), productValue13) + productValue20;
    precise float multiplyAddValue15 = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), productValue14) + productValue21;
    precise float sumValue3 = abs(multiplyAddValue12) + 0.0;
    fragmentColor0.x = multiplyAddValue13;
    fragmentColor0.y = multiplyAddValue14;
    fragmentColor0.z = multiplyAddValue15;
    fragmentColor0.w = sumValue3;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue5.x;
    float scalarValue8 = sampledTextureValue5.y;
    float scalarValue9 = sampledTextureValue5.z;
    precise float sumValue4 = fragmentVectorConstants1.packedValues[0u].x - scalarValue7;
    precise float sumValue5 = fragmentVectorConstants1.packedValues[0u].y - scalarValue8;
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].z - scalarValue9;
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], sumValue4, scalarValue7);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], sumValue5, scalarValue8);
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, scalarValue9);
    precise float productValue22 = multiplyAddValue16 * varyingColor3.x;
    precise float productValue23 = multiplyAddValue17 * varyingColor3.y;
    precise float productValue24 = multiplyAddValue18 * varyingColor3.z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue3 = sampledTextureValue3.x;
    precise float productValue15 = scalarValue2 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue16 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue17 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue18 = scalarValue2 * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue19 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].x, productValue15) * fragmentVectorConstants1.packedValues[2u].x;
    precise float multiplyAddValue20 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[1u].y, productValue16) * fragmentVectorConstants1.packedValues[2u].y;
    precise float multiplyAddValue21 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[1u].z, productValue17) * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue22 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].w, productValue18) * fragmentVectorConstants1.packedValues[2u].w;
    precise float productValue25 = multiplyAddValue19 * multiplyAddValue19;
    precise float productValue26 = multiplyAddValue20 * multiplyAddValue20;
    precise float productValue27 = multiplyAddValue21 * multiplyAddValue21;
    precise float multiplyAddValue23 = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor3.x, varyingColor2.x), productValue22) + productValue25;
    precise float multiplyAddValue24 = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor3.y, varyingColor2.y), productValue23) + productValue26;
    precise float multiplyAddValue25 = fma(varyingColor2.w, fma(-multiplyAddValue18, varyingColor3.z, varyingColor2.z), productValue24) + productValue27;
    precise float sumValue7 = abs(multiplyAddValue22) + 0.0;
    fragmentColor0.x = multiplyAddValue23;
    fragmentColor0.y = multiplyAddValue24;
    fragmentColor0.z = multiplyAddValue25;
    fragmentColor0.w = sumValue7;
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[2u].x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[2u].y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[2u].z);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue3 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].x, scalarValue2 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[3u].x;
    float multiplyAddValue4 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[3u].y;
    float multiplyAddValue5 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = fma(multiplyAddValue3, multiplyAddValue3, fma(varyingColor2.w, fma(-multiplyAddValue, varyingColor3.x, varyingColor2.x), multiplyAddValue * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue4, multiplyAddValue4, fma(varyingColor2.w, fma(-multiplyAddValue1, varyingColor3.y, varyingColor2.y), multiplyAddValue1 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue5, multiplyAddValue5, fma(varyingColor2.w, fma(-multiplyAddValue2, varyingColor3.z, varyingColor2.z), multiplyAddValue2 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].w, scalarValue2 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue5.x;
    float scalarValue8 = sampledTextureValue5.y;
    float scalarValue9 = sampledTextureValue5.z;
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue7, scalarValue7);
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue8, scalarValue8);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue9, scalarValue9);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue2 = sampledTextureValue2.x;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue3 = sampledTextureValue3.x;
    float multiplyAddValue29 = fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].x, scalarValue2 * fragmentVectorConstants1.packedValues[1u].x) * fragmentVectorConstants1.packedValues[2u].x;
    float multiplyAddValue30 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[1u].y, sampledTextureValue2.y * fragmentVectorConstants1.packedValues[1u].y) * fragmentVectorConstants1.packedValues[2u].y;
    float multiplyAddValue31 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[1u].z, sampledTextureValue2.z * fragmentVectorConstants1.packedValues[1u].z) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = fma(multiplyAddValue29, multiplyAddValue29, fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor3.x, varyingColor2.x), multiplyAddValue26 * varyingColor3.x));
    fragmentColor0.y = fma(multiplyAddValue30, multiplyAddValue30, fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor3.y, varyingColor2.y), multiplyAddValue27 * varyingColor3.y));
    fragmentColor0.z = fma(multiplyAddValue31, multiplyAddValue31, fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.z, varyingColor2.z), multiplyAddValue28 * varyingColor3.z));
    fragmentColor0.w = abs(fma(scalarValue3, fragmentVectorConstants1.packedValues[1u].w, scalarValue2 * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[2u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_CONSTANT && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].x) * varyingColor3.x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].y) * varyingColor3.y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[0u].z - fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[0u].w) + fragmentVectorConstants1.packedValues[2u].z) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue3 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[3u].x;
    float productValue4 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[3u].y;
    float productValue5 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue) * varyingColor2.w) + productValue) + (productValue3 * productValue3);
    fragmentColor0.y = (((varyingColor2.y - productValue1) * varyingColor2.w) + productValue1) + (productValue4 * productValue4);
    fragmentColor0.z = (((varyingColor2.z - productValue2) * varyingColor2.w) + productValue2) + (productValue5 * productValue5);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_SOURCE_INPUT_TYPE0 == RD_SOURCE_INPUT_TYPE0_SAMPLED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture0Texture, matTexture0Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float productValue6 = (((fragmentVectorConstants1.packedValues[0u].x - scalarValue4) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue4) * varyingColor3.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].y - scalarValue5) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue5) * varyingColor3.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[0u].z - scalarValue6) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue6) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float scalarValue = sampledTextureValue.x;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float scalarValue1 = sampledTextureValue1.x;
    float productValue9 = ((fragmentVectorConstants1.packedValues[1u].x * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].x * scalarValue)) * fragmentVectorConstants1.packedValues[2u].x;
    float productValue10 = ((fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue1.y) + (fragmentVectorConstants1.packedValues[1u].y * sampledTextureValue.y)) * fragmentVectorConstants1.packedValues[2u].y;
    float productValue11 = ((fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue1.z) + (fragmentVectorConstants1.packedValues[1u].z * sampledTextureValue.z)) * fragmentVectorConstants1.packedValues[2u].z;
    fragmentColor0.x = (((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6) + (productValue9 * productValue9);
    fragmentColor0.y = (((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7) + (productValue10 * productValue10);
    fragmentColor0.z = (((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8) + (productValue11 * productValue11);
    fragmentColor0.w = abs(((fragmentVectorConstants1.packedValues[1u].w * scalarValue1) + (fragmentVectorConstants1.packedValues[1u].w * scalarValue)) * fragmentVectorConstants1.packedValues[2u].w);
#endif
}
