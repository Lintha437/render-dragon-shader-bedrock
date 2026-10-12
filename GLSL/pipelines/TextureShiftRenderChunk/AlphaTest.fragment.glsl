#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunk / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_samplerless_texture_functions : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE2_FLOAT_8 1
#endif
#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/TextureShiftRenderChunk/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
    uint productValue = uint(int(varyingTexCoord5.y * 65535.0));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[productValue * 2u]);
    uint productValue7 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue2.packedValues[productValue7], intermediateValue2.packedValues[productValue7 + 1u], intermediateValue2.packedValues[productValue7 + 2u]));
    float scalarValue5 = reinterpretedBits1.x;
    float scalarValue6 = reinterpretedBits1.y;
    float multiplyAddValue = fma(-varyingTexCoord5.x, reinterpretedBits1.z, 1.0);
    float comparisonValue6 = (scalarValue6 == 0.0) ? float(scalarValue5 >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue5) / scalarValue6, 0.0, 1.0));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.x + varyingTexCoord0.x, reinterpretedBits.y + varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = sampledTextureValue6.z;
    float scalarValue10 = sampledTextureValue6.w;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.z + varyingTexCoord0.x, reinterpretedBits.w + varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue7.w;
    bool comparisonValue7 = scalarValue10 >= 0.5;
    bool comparisonValue8 = scalarValue11 >= 0.5;
    float productValue8 = spvNMin(comparisonValue6 * 4.0, 1.0);
    float comparisonValue9 = ((!(comparisonValue7 || comparisonValue8)) || (comparisonValue7 && comparisonValue8)) ? float(comparisonValue7) : (comparisonValue8 ? productValue8 : (1.0 - productValue8));
    bool comparisonValue10 = comparisonValue9 <= 0.0;
    bool comparisonValue11 = comparisonValue10 || (comparisonValue9 >= 1.0);
    float multiplyAddValue1 = rdDot2Precise2(vec2(floor(fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[0u].x), floor(fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[0u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125));
    bool comparisonValue12 = ((fract(fract(multiplyAddValue1) * 52.98291778564453125) >= comparisonValue9) && (!comparisonValue11)) || (comparisonValue11 && comparisonValue10);
    if (comparisonValue12)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[productValue * 2u]);
    uint productValue7 = (productValue * 8u) + 5u;
    vec3 reinterpretedBits1 = uintBitsToFloat(uvec3(intermediateValue2.packedValues[productValue7], intermediateValue2.packedValues[productValue7 + 1u], intermediateValue2.packedValues[productValue7 + 2u]));
    float scalarValue5 = reinterpretedBits1.x;
    float scalarValue6 = reinterpretedBits1.y;
    float multiplyAddValue = fma(-varyingTexCoord5.x, reinterpretedBits1.z, 1.0);
    float comparisonValue6 = (scalarValue6 == 0.0) ? float(scalarValue5 >= multiplyAddValue) : (1.0 - spvNClamp((multiplyAddValue - scalarValue5) / scalarValue6, 0.0, 1.0));
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.x + varyingTexCoord0.x, reinterpretedBits.y + varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = sampledTextureValue6.z;
    float scalarValue10 = sampledTextureValue6.w;
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(reinterpretedBits.z + varyingTexCoord0.x, reinterpretedBits.w + varyingTexCoord0.y));
    float scalarValue11 = sampledTextureValue7.w;
    bool comparisonValue7 = scalarValue10 >= 0.5;
    bool comparisonValue8 = scalarValue11 >= 0.5;
    float productValue8 = spvNMin(comparisonValue6 * 4.0, 1.0);
    float comparisonValue9 = ((!(comparisonValue7 || comparisonValue8)) || (comparisonValue7 && comparisonValue8)) ? float(comparisonValue7) : (comparisonValue8 ? productValue8 : (1.0 - productValue8));
    bool comparisonValue10 = comparisonValue9 <= 0.0;
    bool comparisonValue11 = comparisonValue10 || (comparisonValue9 >= 1.0);
    uvec4 reinterpretedBits2 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float multiplyAddValue6 = fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits2.x);
    float multiplyAddValue7 = fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits2.y);
    float scalarValue15 = rdDot2Precise2(vec2(floor(multiplyAddValue6), floor(multiplyAddValue7)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125));
    bool comparisonValue13 = ((fract(fract(scalarValue15) * 52.98291778564453125) >= comparisonValue9) && (!comparisonValue11)) || (comparisonValue11 && comparisonValue10);
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits3, reinterpretedBits4, reinterpretedBits5);
    float scalarValue16 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue16);
    uvec4 reinterpretedBits6 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits7 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4), -(inverseLengthValue * reinterpretedBits5)), vec3(varyingColor3.x - uintBitsToFloat(reinterpretedBits6.x), varyingColor3.y - uintBitsToFloat(reinterpretedBits6.y), varyingColor3.z - uintBitsToFloat(reinterpretedBits6.z)));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    float reinterpretedBits9 = spvNClamp((reinterpretedBits7 - reinterpretedBits8) * (1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits8)), 0.0, 1.0);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    float quotientValue2 = floor(multiplyAddValue6 / reinterpretedBits10) * reinterpretedBits10;
    float quotientValue3 = floor(multiplyAddValue7 / reinterpretedBits10) * reinterpretedBits10;
    float productValue10 = floor(quotientValue3 * 0.25);
    float productValue11 = floor(quotientValue3 * 0.5);
    float scalarValue17 = floor(quotientValue3);
    if (comparisonValue13 || ((varyingTexCoord2 > 0.5) && ((fma(fma(fma(fract(fma(floor(quotientValue2 * 0.25), 0.5, (productValue10 * productValue10) * 0.75)), 0.25, fract(fma(floor(quotientValue2 * 0.5), 0.5, (productValue11 * productValue11) * 0.75))), 0.25, fract(fma(floor(quotientValue2), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits9 * reinterpretedBits9) * fma(reinterpretedBits9, -2.0, 3.0)))))
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
    float scalarValue4 = sampledTextureValue4.w;
    float productValue1 = scalarValue4 * quotientValue;
    float productValue2 = productValue1 + (scalarValue3 * (1.0 - quotientValue));
    float comparisonValue = (productValue2 > 0.0) ? (productValue1 / productValue2) : 0.0;
    bool comparisonValue1 = scalarValue3 >= 0.5;
    bool comparisonValue2 = scalarValue4 >= 0.5;
    float comparisonValue3;
    if (comparisonValue1 != comparisonValue2)
    {
        float productValue3 = spvNMin(spvNMax(quotientValue * 4.0, 0.0), 1.0);
        comparisonValue3 = comparisonValue2 ? productValue3 : (1.0 - productValue3);
    }
    else
    {
        comparisonValue3 = float(comparisonValue1);
    }
    bool comparisonValue4 = comparisonValue3 <= 0.0;
    bool intermediateValue5;
    if (comparisonValue4 || (comparisonValue3 >= 1.0))
    {
        intermediateValue5 = comparisonValue4;
    }
    else
    {
        intermediateValue5 = comparisonValue3 <= fract(fract(dot(vec2(floor((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[0u].x), floor((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[0u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125))) * 52.98291778564453125);
    }
    if (intermediateValue5)
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
    float scalarValue4 = sampledTextureValue4.w;
    float productValue1 = scalarValue4 * quotientValue;
    float productValue2 = productValue1 + (scalarValue3 * (1.0 - quotientValue));
    float comparisonValue = (productValue2 > 0.0) ? (productValue1 / productValue2) : 0.0;
    bool comparisonValue1 = scalarValue3 >= 0.5;
    bool comparisonValue2 = scalarValue4 >= 0.5;
    float comparisonValue3;
    if (comparisonValue1 != comparisonValue2)
    {
        float productValue3 = spvNMin(spvNMax(quotientValue * 4.0, 0.0), 1.0);
        comparisonValue3 = comparisonValue2 ? productValue3 : (1.0 - productValue3);
    }
    else
    {
        comparisonValue3 = float(comparisonValue1);
    }
    bool comparisonValue4 = comparisonValue3 <= 0.0;
    bool intermediateValue5;
    if (comparisonValue4 || (comparisonValue3 >= 1.0))
    {
        intermediateValue5 = comparisonValue4;
    }
    else
    {
        intermediateValue5 = comparisonValue3 <= fract(fract(dot(vec2(floor((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x), floor((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y)), vec2(0.067110560834407806396484375, 0.005837149918079376220703125))) * 52.98291778564453125);
    }
    bool comparisonValue5;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingColor3.x - fragmentVectorConstants1.packedValues[9u].x, varyingColor3.y - fragmentVectorConstants1.packedValues[9u].y, varyingColor3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[6u].x) / (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[6u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float productValue12 = floor(quotientValue5 * 0.25);
        float productValue13 = floor(quotientValue5 * 0.5);
        float scalarValue18 = floor(quotientValue5);
        comparisonValue5 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue13 * productValue13) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue12 * productValue12) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue5 = false;
    }
    if (intermediateValue5 || comparisonValue5)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = comparisonValue12 ? 0.0 : 1.0;
    float productValue9 = comparisonValue6 * scalarValue11;
    float multiplyAddValue2 = fma(1.0 - comparisonValue6, scalarValue10, productValue9);
    bool conditionValue = multiplyAddValue2 > 0.0;
    float quotientValue1 = productValue9 / multiplyAddValue2;
    float multiplyAddValue3 = (conditionValue ? fma(sampledTextureValue7.x - scalarValue7, quotientValue1, scalarValue7) : scalarValue7) * varyingColor0.x;
    float multiplyAddValue4 = (conditionValue ? fma(sampledTextureValue7.y - scalarValue8, quotientValue1, scalarValue8) : scalarValue8) * varyingColor0.y;
    float multiplyAddValue5 = (conditionValue ? fma(sampledTextureValue7.z - scalarValue9, quotientValue1, scalarValue9) : scalarValue9) * varyingColor0.z;
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue12 = sampledTextureValue8.x;
    float scalarValue13 = sampledTextureValue8.y;
    float scalarValue14 = sampledTextureValue8.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue12, multiplyAddValue3, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue3 * scalarValue12);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue13, multiplyAddValue4, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue4 * scalarValue13);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue14, multiplyAddValue5, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue5 * scalarValue14);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = comparisonValue13 ? 0.0 : 1.0;
    float productValue9 = comparisonValue6 * scalarValue11;
    float multiplyAddValue2 = fma(1.0 - comparisonValue6, scalarValue10, productValue9);
    bool conditionValue = multiplyAddValue2 > 0.0;
    float quotientValue1 = productValue9 / multiplyAddValue2;
    float multiplyAddValue3 = (conditionValue ? fma(sampledTextureValue7.x - scalarValue7, quotientValue1, scalarValue7) : scalarValue7) * varyingColor0.x;
    float multiplyAddValue4 = (conditionValue ? fma(sampledTextureValue7.y - scalarValue8, quotientValue1, scalarValue8) : scalarValue8) * varyingColor0.y;
    float multiplyAddValue5 = (conditionValue ? fma(sampledTextureValue7.z - scalarValue9, quotientValue1, scalarValue9) : scalarValue9) * varyingColor0.z;
    vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue12 = sampledTextureValue8.x;
    float scalarValue13 = sampledTextureValue8.y;
    float scalarValue14 = sampledTextureValue8.z;
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue12, multiplyAddValue3, uintBitsToFloat(reinterpretedBits11.x)), multiplyAddValue3 * scalarValue12);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue13, multiplyAddValue4, uintBitsToFloat(reinterpretedBits11.y)), multiplyAddValue4 * scalarValue13);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue14, multiplyAddValue5, uintBitsToFloat(reinterpretedBits11.z)), multiplyAddValue5 * scalarValue14);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue5 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue4 = (((comparisonValue * (sampledTextureValue4.x - scalarValue)) + scalarValue) * varyingColor0.x) * sampledTextureValue5.x;
    float productValue5 = (((comparisonValue * (sampledTextureValue4.y - scalarValue1)) + scalarValue1) * varyingColor0.y) * sampledTextureValue5.y;
    float productValue6 = (((comparisonValue * (sampledTextureValue4.z - scalarValue2)) + scalarValue2) * varyingColor0.z) * sampledTextureValue5.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[1u].x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[1u].y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[1u].z - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.w = intermediateValue5 ? 0.0 : 1.0;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue5 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue4 = (((comparisonValue * (sampledTextureValue4.x - scalarValue)) + scalarValue) * varyingColor0.x) * sampledTextureValue5.x;
    float productValue5 = (((comparisonValue * (sampledTextureValue4.y - scalarValue1)) + scalarValue1) * varyingColor0.y) * sampledTextureValue5.y;
    float productValue6 = (((comparisonValue * (sampledTextureValue4.z - scalarValue2)) + scalarValue2) * varyingColor0.z) * sampledTextureValue5.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[8u].x - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[8u].y - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[8u].z - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.w = intermediateValue5 ? 0.0 : 1.0;
#endif
    discardIfRequested();
}
