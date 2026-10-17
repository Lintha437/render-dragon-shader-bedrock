#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 16
#endif

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/RenderChunk/FragmentBindings.glsli"

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    precise float productValue = scalarValue * varyingColor0.x;
    precise float productValue1 = scalarValue1 * varyingColor0.y;
    precise float productValue2 = scalarValue2 * varyingColor0.z;
    precise float productValue6 = scalarValue3 * varyingColor0.w;
    precise float multiplyAddValue3 = fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w;
    precise float multiplyAddValue4 = fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w;
    precise float multiplyAddValue5 = fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float comparisonValue = conditionValue ? multiplyAddValue3 : productValue;
    float comparisonValue1 = conditionValue ? multiplyAddValue4 : productValue1;
    float comparisonValue2 = conditionValue ? multiplyAddValue5 : productValue2;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    precise float productValue7 = comparisonValue * scalarValue4;
    precise float productValue8 = comparisonValue1 * scalarValue5;
    precise float productValue9 = comparisonValue2 * scalarValue6;
    fragmentColor0.w = conditionValue ? 1.0 : productValue6;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue4, comparisonValue, fragmentVectorConstants1.packedValues[0u].x), productValue7);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue5, comparisonValue1, fragmentVectorConstants1.packedValues[0u].y), productValue8);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue6, comparisonValue2, fragmentVectorConstants1.packedValues[0u].z), productValue9);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float multiplyAddValue8 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x);
    precise float multiplyAddValue9 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    precise float quotientValue4 = multiplyAddValue8 / reinterpretedBits1;
    precise float quotientValue5 = multiplyAddValue9 / reinterpretedBits1;
    precise float productValue20 = floor(quotientValue4) * reinterpretedBits1;
    precise float productValue21 = floor(quotientValue5) * reinterpretedBits1;
    precise float productValue22 = productValue20 * 0.25;
    precise float productValue23 = productValue21 * 0.25;
    precise float productValue24 = productValue20 * 0.5;
    precise float productValue25 = productValue21 * 0.5;
    float scalarValue13 = floor(productValue21);
    float scalarValue14 = floor(productValue23);
    float scalarValue15 = floor(productValue25);
    precise float productValue26 = scalarValue14 * scalarValue14;
    precise float productValue27 = scalarValue15 * scalarValue15;
    precise float productValue28 = productValue26 * 0.75;
    precise float productValue29 = productValue27 * 0.75;
    precise float productValue30 = scalarValue13 * scalarValue13;
    precise float productValue31 = productValue30 * 0.75;
    precise float multiplyAddValue10 = fma(fma(fma(fract(fma(floor(productValue22), 0.5, productValue28)), 0.25, fract(fma(floor(productValue24), 0.5, productValue29))), 0.25, fract(fma(floor(productValue20), 0.5, productValue31))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue32 = inverseLengthValue1 * reinterpretedBits2;
    precise float productValue33 = inverseLengthValue1 * reinterpretedBits3;
    precise float productValue34 = inverseLengthValue1 * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits9 = varyingColor3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits10 = varyingColor3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits11 = varyingColor3.z - uintBitsToFloat(reinterpretedBits5.z);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    precise float sumValue = rdDot3Precise2(vec3(-productValue32, -productValue33, -productValue34), vec3(reinterpretedBits9, reinterpretedBits10, reinterpretedBits11)) - reinterpretedBits6;
    precise float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits6;
    precise float quotientValue6 = 1.0 / reinterpretedBits12;
    precise float productValue35 = quotientValue6 * sumValue;
    float scalarValue16 = spvNClamp(productValue35, 0.0, 1.0);
    precise float productValue36 = scalarValue16 * scalarValue16;
    precise float multiplyAddValue11 = productValue36 * fma(scalarValue16, -2.0, 3.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    precise float productValue = scalarValue * varyingColor0.x;
    precise float productValue1 = scalarValue1 * varyingColor0.y;
    precise float productValue2 = scalarValue2 * varyingColor0.z;
    precise float productValue6 = scalarValue3 * varyingColor0.w;
    precise float multiplyAddValue3 = fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w;
    precise float multiplyAddValue4 = fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w;
    precise float multiplyAddValue5 = fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float comparisonValue = conditionValue ? multiplyAddValue3 : productValue;
    float comparisonValue1 = conditionValue ? multiplyAddValue4 : productValue1;
    float comparisonValue2 = conditionValue ? multiplyAddValue5 : productValue2;
    float comparisonValue4 = conditionValue ? 1.0 : productValue6;
    fragmentColor0.w = (varyingTexCoord2.x > 0.5) ? ((multiplyAddValue10 >= multiplyAddValue11) ? 0.0 : comparisonValue4) : comparisonValue4;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    precise float productValue7 = comparisonValue * scalarValue4;
    precise float productValue8 = comparisonValue1 * scalarValue5;
    precise float productValue9 = comparisonValue2 * scalarValue6;
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue4, comparisonValue, uintBitsToFloat(reinterpretedBits8.x)), productValue7);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue5, comparisonValue1, uintBitsToFloat(reinterpretedBits8.y)), productValue8);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue6, comparisonValue2, uintBitsToFloat(reinterpretedBits8.z)), productValue9);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue = conditionValue ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x);
    float multiplyAddValue1 = conditionValue ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y);
    float multiplyAddValue2 = conditionValue ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    fragmentColor0.w = conditionValue ? 1.0 : (scalarValue3 * varyingColor0.w);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue4, multiplyAddValue, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue * scalarValue4);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue5, multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue1 * scalarValue5);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue6, multiplyAddValue2, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue2 * scalarValue6);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    float multiplyAddValue6 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.x)) / reinterpretedBits1) * reinterpretedBits1;
    float multiplyAddValue7 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits.y)) / reinterpretedBits1) * reinterpretedBits1;
    float scalarValue12 = floor(multiplyAddValue7);
    float productValue18 = floor(multiplyAddValue7 * 0.25);
    float productValue19 = floor(multiplyAddValue7 * 0.5);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits6)) * (rdDot3Precise2(vec3(-(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3), -(inverseLengthValue1 * reinterpretedBits4)), vec3(varyingColor3.x - uintBitsToFloat(reinterpretedBits5.x), varyingColor3.y - uintBitsToFloat(reinterpretedBits5.y), varyingColor3.z - uintBitsToFloat(reinterpretedBits5.z))) - reinterpretedBits6), 0.0, 1.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool conditionValue = varyingTexCoord2.y > 0.5;
    float multiplyAddValue = conditionValue ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x);
    float multiplyAddValue1 = conditionValue ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y);
    float multiplyAddValue2 = conditionValue ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z);
    float comparisonValue3 = conditionValue ? 1.0 : (scalarValue3 * varyingColor0.w);
    fragmentColor0.w = (varyingTexCoord2.x > 0.5) ? (((fma(fma(fma(fract(fma(floor(multiplyAddValue6 * 0.25), 0.5, (productValue18 * productValue18) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue6 * 0.5), 0.5, (productValue19 * productValue19) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue6), 0.5, (scalarValue12 * scalarValue12) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))) ? 0.0 : comparisonValue3) : comparisonValue3;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue4, multiplyAddValue, uintBitsToFloat(reinterpretedBits8.x)), multiplyAddValue * scalarValue4);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue5, multiplyAddValue1, uintBitsToFloat(reinterpretedBits8.y)), multiplyAddValue1 * scalarValue5);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue6, multiplyAddValue2, uintBitsToFloat(reinterpretedBits8.z)), multiplyAddValue2 * scalarValue6);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float scalarValue10 = sampledTextureValue2.w;
    float productValue10 = scalarValue7 * varyingColor0.x;
    float productValue11 = scalarValue8 * varyingColor0.y;
    float productValue12 = scalarValue9 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue3 = (((productValue10 - scalarValue7) * scalarValue10) + scalarValue7) * varyingColor0.w;
        productValue4 = (((productValue11 - scalarValue8) * scalarValue10) + scalarValue8) * varyingColor0.w;
        productValue5 = (((productValue12 - scalarValue9) * scalarValue10) + scalarValue9) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue10;
        productValue4 = productValue11;
        productValue5 = productValue12;
        intermediateValue4 = scalarValue10 * varyingColor0.w;
    }
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue13 = sampledTextureValue3.x * productValue3;
    float productValue14 = sampledTextureValue3.y * productValue4;
    float productValue15 = sampledTextureValue3.z * productValue5;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = intermediateValue4;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue2.x;
    float scalarValue8 = sampledTextureValue2.y;
    float scalarValue9 = sampledTextureValue2.z;
    float scalarValue10 = sampledTextureValue2.w;
    float productValue10 = scalarValue7 * varyingColor0.x;
    float productValue11 = scalarValue8 * varyingColor0.y;
    float productValue12 = scalarValue9 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue4;
    if (varyingTexCoord2.y > 0.5)
    {
        productValue3 = (((productValue10 - scalarValue7) * scalarValue10) + scalarValue7) * varyingColor0.w;
        productValue4 = (((productValue11 - scalarValue8) * scalarValue10) + scalarValue8) * varyingColor0.w;
        productValue5 = (((productValue12 - scalarValue9) * scalarValue10) + scalarValue9) * varyingColor0.w;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue3 = productValue10;
        productValue4 = productValue11;
        productValue5 = productValue12;
        intermediateValue4 = scalarValue10 * varyingColor0.w;
    }
    float intermediateValue6;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingColor3.x - fragmentVectorConstants1.packedValues[9u].x, varyingColor3.y - fragmentVectorConstants1.packedValues[9u].y, varyingColor3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[6u].x) / (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[6u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float productValue16 = floor(quotientValue1 * 0.25);
        float productValue17 = floor(quotientValue1 * 0.5);
        float scalarValue11 = floor(quotientValue1);
        float branchMergedValue;
        if (!(((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue17 * productValue17) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue16 * productValue16) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue11 * scalarValue11) * 0.75) + (floor(quotientValue) * 0.5)))))
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
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue13 = sampledTextureValue3.x * productValue3;
    float productValue14 = sampledTextureValue3.y * productValue4;
    float productValue15 = sampledTextureValue3.z * productValue5;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[8u].x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[8u].y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[8u].z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = intermediateValue6;
#endif
}
