#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunk / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 10
#endif

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/TextureShiftRenderChunk/FragmentBindings.glsli"

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    float multiplyAddValue8 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits2.x)) / reinterpretedBits3) * reinterpretedBits3;
    float multiplyAddValue9 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits2.y)) / reinterpretedBits3) * reinterpretedBits3;
    float scalarValue13 = floor(multiplyAddValue9);
    float productValue15 = floor(multiplyAddValue9 * 0.25);
    float productValue16 = floor(multiplyAddValue9 * 0.5);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    float reinterpretedBits9 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits8)) * (rdDot3Precise2(vec3(-(inverseLengthValue * reinterpretedBits4), -(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6)), vec3(varyingColor3.x - uintBitsToFloat(reinterpretedBits7.x), varyingColor3.y - uintBitsToFloat(reinterpretedBits7.y), varyingColor3.z - uintBitsToFloat(reinterpretedBits7.z))) - reinterpretedBits8), 0.0, 1.0);
#endif
    uint productValue = uint(int(varyingTexCoord5.y * 65535.0));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue14 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits = uintBitsToFloat(uvec3(intermediateValue2.packedValues[productValue14], intermediateValue2.packedValues[productValue14 + 1u], intermediateValue2.packedValues[productValue14 + 2u]));
    float scalarValue4 = reinterpretedBits.x;
    float scalarValue5 = reinterpretedBits.y;
    vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[productValue * 2u]);
    float multiplyAddValue = fma(-varyingTexCoord5.x, reinterpretedBits.z, 1.0);
    float comparisonValue = (scalarValue5 == 0.0) ? float(scalarValue4 >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue4) / scalarValue5, 0.0, 1.0));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.z + varyingTexCoord0.x, reinterpretedBits1.w + varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.x + varyingTexCoord0.x, reinterpretedBits1.y + varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue7.x;
    float scalarValue7 = sampledTextureValue7.y;
    float scalarValue8 = sampledTextureValue7.z;
    float scalarValue9 = sampledTextureValue7.w;
    float multiplyAddValue1 = fma(comparisonValue, sampledTextureValue6.x - scalarValue6, scalarValue6);
    float multiplyAddValue2 = fma(comparisonValue, sampledTextureValue6.y - scalarValue7, scalarValue7);
    float multiplyAddValue3 = fma(comparisonValue, sampledTextureValue6.z - scalarValue8, scalarValue8);
    float multiplyAddValue4 = fma(comparisonValue, sampledTextureValue6.w - scalarValue9, scalarValue9);
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue5 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue1, varyingColor0.x, -multiplyAddValue1), multiplyAddValue1) * varyingColor0.w) : (multiplyAddValue1 * varyingColor0.x);
    float multiplyAddValue6 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue2, varyingColor0.y, -multiplyAddValue2), multiplyAddValue2) * varyingColor0.w) : (multiplyAddValue2 * varyingColor0.y);
    float multiplyAddValue7 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue3, varyingColor0.z, -multiplyAddValue3), multiplyAddValue3) * varyingColor0.w) : (multiplyAddValue3 * varyingColor0.z);
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue10 = sampledTextureValue8.x;
    float scalarValue11 = sampledTextureValue8.y;
    float scalarValue12 = sampledTextureValue8.z;
    fragmentColor0.w = conditionValue ? 1.0 : (multiplyAddValue4 * varyingColor0.w);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue10, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue5 * scalarValue10);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue11, multiplyAddValue6, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue6 * scalarValue11);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue12, multiplyAddValue7, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue7 * scalarValue12);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue14 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits = uintBitsToFloat(uvec3(intermediateValue2.packedValues[productValue14], intermediateValue2.packedValues[productValue14 + 1u], intermediateValue2.packedValues[productValue14 + 2u]));
    float scalarValue4 = reinterpretedBits.x;
    float scalarValue5 = reinterpretedBits.y;
    vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[productValue * 2u]);
    float multiplyAddValue = fma(-varyingTexCoord5.x, reinterpretedBits.z, 1.0);
    float comparisonValue = (scalarValue5 == 0.0) ? float(scalarValue4 >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue4) / scalarValue5, 0.0, 1.0));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.z + varyingTexCoord0.x, reinterpretedBits1.w + varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits1.x + varyingTexCoord0.x, reinterpretedBits1.y + varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue7.x;
    float scalarValue7 = sampledTextureValue7.y;
    float scalarValue8 = sampledTextureValue7.z;
    float scalarValue9 = sampledTextureValue7.w;
    float multiplyAddValue1 = fma(comparisonValue, sampledTextureValue6.x - scalarValue6, scalarValue6);
    float multiplyAddValue2 = fma(comparisonValue, sampledTextureValue6.y - scalarValue7, scalarValue7);
    float multiplyAddValue3 = fma(comparisonValue, sampledTextureValue6.z - scalarValue8, scalarValue8);
    float multiplyAddValue4 = fma(comparisonValue, sampledTextureValue6.w - scalarValue9, scalarValue9);
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue5 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue1, varyingColor0.x, -multiplyAddValue1), multiplyAddValue1) * varyingColor0.w) : (multiplyAddValue1 * varyingColor0.x);
    float multiplyAddValue6 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue2, varyingColor0.y, -multiplyAddValue2), multiplyAddValue2) * varyingColor0.w) : (multiplyAddValue2 * varyingColor0.y);
    float multiplyAddValue7 = conditionValue ? (fma(multiplyAddValue4, fma(multiplyAddValue3, varyingColor0.z, -multiplyAddValue3), multiplyAddValue3) * varyingColor0.w) : (multiplyAddValue3 * varyingColor0.z);
    float comparisonValue1 = conditionValue ? 1.0 : (multiplyAddValue4 * varyingColor0.w);
    fragmentColor0.w = (varyingTexCoord2.x > 0.5) ? (((fma(fma(fma(fract(fma(floor(multiplyAddValue8 * 0.25), 0.5, (productValue15 * productValue15) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue8 * 0.5), 0.5, (productValue16 * productValue16) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue8), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits9 * reinterpretedBits9) * fma(reinterpretedBits9, -2.0, 3.0))) ? 0.0 : comparisonValue1) : comparisonValue1;
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue10 = sampledTextureValue8.x;
    float scalarValue11 = sampledTextureValue8.y;
    float scalarValue12 = sampledTextureValue8.z;
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue10, multiplyAddValue5, uintBitsToFloat(reinterpretedBits10.x)), multiplyAddValue5 * scalarValue10);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue11, multiplyAddValue6, uintBitsToFloat(reinterpretedBits10.y)), multiplyAddValue6 * scalarValue11);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue12, multiplyAddValue7, uintBitsToFloat(reinterpretedBits10.z)), multiplyAddValue7 * scalarValue12);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue2 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord5.x);
    float quotientValue;
    if (sampledTextureValue1 == 0.0)
    {
        quotientValue = (sampledTextureValue < sampledTextureValue2) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue2 - sampledTextureValue) / sampledTextureValue1, 0.0), 1.0);
    }
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x) + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    vec4 sampledTextureValue4 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x) + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue4.x - scalarValue) * quotientValue) + scalarValue;
    float productValue2 = ((sampledTextureValue4.y - scalarValue1) * quotientValue) + scalarValue1;
    float productValue3 = ((sampledTextureValue4.z - scalarValue2) * quotientValue) + scalarValue2;
    float productValue4 = ((sampledTextureValue4.w - scalarValue3) * quotientValue) + scalarValue3;
    float productValue5 = productValue1 * varyingColor0.x;
    float productValue6 = productValue2 * varyingColor0.y;
    float productValue7 = productValue3 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue8 = (((productValue5 - productValue1) * productValue4) + productValue1) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue2) * productValue4) + productValue2) * varyingColor0.w;
        productValue10 = (((productValue7 - productValue3) * productValue4) + productValue3) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue8 = productValue5;
        productValue9 = productValue6;
        productValue10 = productValue7;
        intermediateValue4 = productValue4 * varyingColor0.w;
    }
    vec4 sampledTextureValue5 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue11 = sampledTextureValue5.x * productValue8;
    float productValue12 = sampledTextureValue5.y * productValue9;
    float productValue13 = sampledTextureValue5.z * productValue10;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.w = intermediateValue4;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue2 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord5.x);
    float quotientValue;
    if (sampledTextureValue1 == 0.0)
    {
        quotientValue = (sampledTextureValue < sampledTextureValue2) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue2 - sampledTextureValue) / sampledTextureValue1, 0.0), 1.0);
    }
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x) + varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    vec4 sampledTextureValue4 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x) + varyingTexCoord0.x, uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x) + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue4.x - scalarValue) * quotientValue) + scalarValue;
    float productValue2 = ((sampledTextureValue4.y - scalarValue1) * quotientValue) + scalarValue1;
    float productValue3 = ((sampledTextureValue4.z - scalarValue2) * quotientValue) + scalarValue2;
    float productValue4 = ((sampledTextureValue4.w - scalarValue3) * quotientValue) + scalarValue3;
    float productValue5 = productValue1 * varyingColor0.x;
    float productValue6 = productValue2 * varyingColor0.y;
    float productValue7 = productValue3 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue8 = (((productValue5 - productValue1) * productValue4) + productValue1) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue2) * productValue4) + productValue2) * varyingColor0.w;
        productValue10 = (((productValue7 - productValue3) * productValue4) + productValue3) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue8 = productValue5;
        productValue9 = productValue6;
        productValue10 = productValue7;
        intermediateValue4 = productValue4 * varyingColor0.w;
    }
    float intermediateValue6;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingColor3.x - fragmentVectorConstants1.packedValues[9u].x, varyingColor3.y - fragmentVectorConstants1.packedValues[9u].y, varyingColor3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[6u].x) / (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[6u].x), 0.0, 1.0);
        float quotientValue1 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float quotientValue2 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float productValue17 = floor(quotientValue2 * 0.25);
        float productValue18 = floor(quotientValue2 * 0.5);
        float scalarValue14 = floor(quotientValue2);
        float branchMergedValue;
        if (!(((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue18 * productValue18) * 0.75) + (floor(quotientValue1 * 0.5) * 0.5)) + (fract(((productValue17 * productValue17) * 0.75) + (floor(quotientValue1 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue14 * scalarValue14) * 0.75) + (floor(quotientValue1) * 0.5)))))
        {
            branchMergedValue = intermediateValue4;
        }
        else
        {
            branchMergedValue = 0.0;
        }
        intermediateValue6 = branchMergedValue;
    }
    else
    {
        intermediateValue6 = intermediateValue4;
    }
    vec4 sampledTextureValue5 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue11 = sampledTextureValue5.x * productValue8;
    float productValue12 = sampledTextureValue5.y * productValue9;
    float productValue13 = sampledTextureValue5.z * productValue10;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[8u].x - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[8u].y - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[8u].z - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.w = intermediateValue6;
#endif
}
