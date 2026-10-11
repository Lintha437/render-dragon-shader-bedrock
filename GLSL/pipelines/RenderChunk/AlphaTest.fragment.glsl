#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#define RD_BINDING_LAYOUT 3
#endif

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/RenderChunk/FragmentBindings.glsli"

#if (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    if (scalarValue < 0.5)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue5 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue5);
    precise float productValue21 = inverseLengthValue * reinterpretedBits;
    precise float productValue22 = inverseLengthValue * reinterpretedBits1;
    precise float productValue23 = inverseLengthValue * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits4 = varyingColor3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits5 = varyingColor3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits6 = varyingColor3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue6 = rdDot3Precise(vec3(-productValue21, -productValue22, -productValue23), vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    precise float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits7;
    precise float sumValue = scalarValue6 - reinterpretedBits7;
    precise float quotientValue = 1.0 / reinterpretedBits8;
    precise float productValue24 = quotientValue * sumValue;
    float scalarValue7 = spvNClamp(productValue24, 0.0, 1.0);
    precise float productValue25 = scalarValue7 * scalarValue7;
    precise float multiplyAddValue6 = productValue25 * fma(scalarValue7, -2.0, 3.0);
    precise float quotientValue1 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue2 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float multiplyAddValue7 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x);
    precise float multiplyAddValue8 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    precise float quotientValue3 = multiplyAddValue7 / reinterpretedBits10;
    precise float quotientValue4 = multiplyAddValue8 / reinterpretedBits10;
    precise float productValue26 = floor(quotientValue3) * reinterpretedBits10;
    precise float productValue27 = floor(quotientValue4) * reinterpretedBits10;
    precise float productValue28 = productValue26 * 0.25;
    precise float productValue29 = productValue27 * 0.25;
    precise float productValue30 = productValue26 * 0.5;
    precise float productValue31 = productValue27 * 0.5;
    float scalarValue8 = floor(productValue29);
    float scalarValue9 = floor(productValue31);
    precise float productValue32 = scalarValue8 * scalarValue8;
    precise float productValue33 = scalarValue9 * scalarValue9;
    precise float productValue34 = productValue32 * 0.75;
    precise float productValue35 = productValue33 * 0.75;
    float scalarValue10 = floor(productValue27);
    precise float productValue36 = scalarValue10 * scalarValue10;
    precise float productValue37 = productValue36 * 0.75;
    precise float multiplyAddValue9 = fma(fma(fma(fract(fma(floor(productValue28), 0.5, productValue34)), 0.25, fract(fma(floor(productValue30), 0.5, productValue35))), 0.25, fract(fma(floor(productValue26), 0.5, productValue37))), 64.0, 0.5) * 0.015625;
    if (((varyingTexCoord2 > 0.5) && (multiplyAddValue9 >= multiplyAddValue6)) || (scalarValue < 0.5))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue5 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue5);
    precise float productValue21 = inverseLengthValue * reinterpretedBits;
    precise float productValue22 = inverseLengthValue * reinterpretedBits1;
    precise float productValue23 = inverseLengthValue * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits4 = varyingColor3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits5 = varyingColor3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits6 = varyingColor3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue6 = rdDot3Precise(vec3(-productValue21, -productValue22, -productValue23), vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    precise float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits7;
    precise float sumValue = scalarValue6 - reinterpretedBits7;
    precise float quotientValue = 1.0 / reinterpretedBits8;
    precise float productValue24 = quotientValue * sumValue;
    float scalarValue7 = spvNClamp(productValue24, 0.0, 1.0);
    precise float productValue25 = scalarValue7 * scalarValue7;
    precise float multiplyAddValue6 = productValue25 * fma(scalarValue7, -2.0, 3.0);
    precise float quotientValue1 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue2 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float multiplyAddValue7 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x);
    precise float multiplyAddValue8 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    precise float quotientValue3 = multiplyAddValue7 / reinterpretedBits10;
    precise float quotientValue4 = multiplyAddValue8 / reinterpretedBits10;
    precise float productValue26 = floor(quotientValue3) * reinterpretedBits10;
    precise float productValue27 = floor(quotientValue4) * reinterpretedBits10;
    precise float productValue28 = productValue26 * 0.25;
    precise float productValue29 = productValue27 * 0.25;
    precise float productValue30 = productValue26 * 0.5;
    precise float productValue31 = productValue27 * 0.5;
    float scalarValue8 = floor(productValue29);
    float scalarValue9 = floor(productValue31);
    precise float productValue32 = scalarValue8 * scalarValue8;
    precise float productValue33 = scalarValue9 * scalarValue9;
    precise float productValue34 = productValue32 * 0.75;
    precise float productValue35 = productValue33 * 0.75;
    float scalarValue10 = floor(productValue27);
    precise float productValue36 = scalarValue10 * scalarValue10;
    precise float productValue37 = productValue36 * 0.75;
    precise float multiplyAddValue9 = fma(fma(fma(fract(fma(floor(productValue28), 0.5, productValue34)), 0.25, fract(fma(floor(productValue30), 0.5, productValue35))), 0.25, fract(fma(floor(productValue26), 0.5, productValue37))), 64.0, 0.5) * 0.015625;
    if (((varyingTexCoord2 > 0.5) && (multiplyAddValue9 >= multiplyAddValue6)) || (sampledTextureValue.w < 0.5))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue5 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue5);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits), -(inverseLengthValue * reinterpretedBits1), -(inverseLengthValue * reinterpretedBits2)), vec3(varyingColor3.x - uintBitsToFloat(reinterpretedBits3.x), varyingColor3.y - uintBitsToFloat(reinterpretedBits3.y), varyingColor3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    float reinterpretedBits13 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits7)) * (reinterpretedBits12 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    float multiplyAddValue10 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue11 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue38 = floor(multiplyAddValue11 * 0.25);
    float productValue39 = floor(multiplyAddValue11 * 0.5);
    float scalarValue11 = floor(multiplyAddValue11);
    if ((scalarValue < 0.5) || ((varyingTexCoord2 > 0.5) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue10 * 0.25), 0.5, (productValue38 * productValue38) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue10 * 0.5), 0.5, (productValue39 * productValue39) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue10), 0.5, (scalarValue11 * scalarValue11) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits13 * reinterpretedBits13) * fma(reinterpretedBits13, -2.0, 3.0)))))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue5 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue5);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits), -(inverseLengthValue * reinterpretedBits1), -(inverseLengthValue * reinterpretedBits2)), vec3(varyingColor3.x - uintBitsToFloat(reinterpretedBits3.x), varyingColor3.y - uintBitsToFloat(reinterpretedBits3.y), varyingColor3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[24u]));
    float reinterpretedBits13 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[25u])) - reinterpretedBits7)) * (reinterpretedBits12 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[26u]));
    float multiplyAddValue10 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue11 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue38 = floor(multiplyAddValue11 * 0.25);
    float productValue39 = floor(multiplyAddValue11 * 0.5);
    float scalarValue11 = floor(multiplyAddValue11);
    if ((sampledTextureValue.w < 0.5) || ((varyingTexCoord2 > 0.5) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue10 * 0.25), 0.5, (productValue38 * productValue38) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue10 * 0.5), 0.5, (productValue39 * productValue39) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue10), 0.5, (scalarValue11 * scalarValue11) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits13 * reinterpretedBits13) * fma(reinterpretedBits13, -2.0, 3.0)))))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue2.w;
    if (scalarValue4 < 0.5)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue2.w < 0.5)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue2.w;
    bool comparisonValue;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingColor3.x - fragmentVectorConstants1.packedValues[9u].x, varyingColor3.y - fragmentVectorConstants1.packedValues[9u].y, varyingColor3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[6u].x) / (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[6u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float productValue40 = floor(quotientValue6 * 0.25);
        float productValue41 = floor(quotientValue6 * 0.5);
        float scalarValue12 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue41 * productValue41) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue40 * productValue40) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((scalarValue4 < 0.5) || comparisonValue)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    bool comparisonValue;
    if (varyingTexCoord2.x > 0.5)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingColor3.x - fragmentVectorConstants1.packedValues[9u].x, varyingColor3.y - fragmentVectorConstants1.packedValues[9u].y, varyingColor3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[6u].x) / (fragmentVectorConstants1.packedValues[6u].y - fragmentVectorConstants1.packedValues[6u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].x) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[7u].y) / fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[6u].z;
        float productValue40 = floor(quotientValue6 * 0.25);
        float productValue41 = floor(quotientValue6 * 0.5);
        float scalarValue12 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue41 * productValue41) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue40 * productValue40) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((sampledTextureValue2.w < 0.5) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue3 = sampledTextureValue.x * varyingColor0.x;
    precise float productValue4 = sampledTextureValue.y * varyingColor0.y;
    precise float productValue5 = sampledTextureValue.z * varyingColor0.z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    precise float productValue6 = productValue3 * scalarValue1;
    precise float productValue7 = productValue4 * scalarValue2;
    precise float productValue8 = productValue5 * scalarValue3;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue3, fragmentVectorConstants1.packedValues[0u].x), productValue6);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue4, fragmentVectorConstants1.packedValues[0u].y), productValue7);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue5, fragmentVectorConstants1.packedValues[0u].z), productValue8);
    fragmentColor0.w = scalarValue;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    precise float multiplyAddValue = sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue5.x, 2.0, -1.0), 1.0);
    precise float multiplyAddValue1 = sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue5.y, 2.0, -1.0), 1.0);
    precise float multiplyAddValue2 = sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue5.z, 2.0, -1.0), 1.0);
    precise float productValue15 = multiplyAddValue * varyingColor0.w;
    precise float productValue16 = multiplyAddValue1 * varyingColor0.w;
    precise float productValue17 = multiplyAddValue2 * varyingColor0.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    precise float productValue18 = productValue15 * scalarValue1;
    precise float productValue19 = productValue16 * scalarValue2;
    precise float productValue20 = productValue17 * scalarValue3;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue15, fragmentVectorConstants1.packedValues[0u].x), productValue18);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue16, fragmentVectorConstants1.packedValues[0u].y), productValue19);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue17, fragmentVectorConstants1.packedValues[0u].z), productValue20);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue3 = sampledTextureValue.x * varyingColor0.x;
    precise float productValue4 = sampledTextureValue.y * varyingColor0.y;
    precise float productValue5 = sampledTextureValue.z * varyingColor0.z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    precise float productValue6 = productValue3 * scalarValue1;
    precise float productValue7 = productValue4 * scalarValue2;
    precise float productValue8 = productValue5 * scalarValue3;
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue3, uintBitsToFloat(reinterpretedBits11.x)), productValue6);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue4, uintBitsToFloat(reinterpretedBits11.y)), productValue7);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue5, uintBitsToFloat(reinterpretedBits11.z)), productValue8);
    fragmentColor0.w = scalarValue;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    precise float multiplyAddValue = sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue5.x, 2.0, -1.0), 1.0);
    precise float multiplyAddValue1 = sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue5.y, 2.0, -1.0), 1.0);
    precise float multiplyAddValue2 = sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue5.z, 2.0, -1.0), 1.0);
    precise float productValue15 = multiplyAddValue * varyingColor0.w;
    precise float productValue16 = multiplyAddValue1 * varyingColor0.w;
    precise float productValue17 = multiplyAddValue2 * varyingColor0.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    precise float productValue18 = productValue15 * scalarValue1;
    precise float productValue19 = productValue16 * scalarValue2;
    precise float productValue20 = productValue17 * scalarValue3;
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue15, uintBitsToFloat(reinterpretedBits11.x)), productValue18);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue16, uintBitsToFloat(reinterpretedBits11.y)), productValue19);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue17, uintBitsToFloat(reinterpretedBits11.z)), productValue20);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue, fragmentVectorConstants1.packedValues[0u].x), productValue * scalarValue1);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue1, fragmentVectorConstants1.packedValues[0u].y), productValue1 * scalarValue2);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue2, fragmentVectorConstants1.packedValues[0u].z), productValue2 * scalarValue3);
    fragmentColor0.w = scalarValue;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue3 = (sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue5.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    float multiplyAddValue4 = (sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue5.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    float multiplyAddValue5 = (sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue5.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue3 * scalarValue1);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue4 * scalarValue2);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue5 * scalarValue3);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue = sampledTextureValue.x * varyingColor0.x;
    float productValue1 = sampledTextureValue.y * varyingColor0.y;
    float productValue2 = sampledTextureValue.z * varyingColor0.z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, productValue, uintBitsToFloat(reinterpretedBits11.x)), productValue * scalarValue1);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, productValue1, uintBitsToFloat(reinterpretedBits11.y)), productValue1 * scalarValue2);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, productValue2, uintBitsToFloat(reinterpretedBits11.z)), productValue2 * scalarValue3);
    fragmentColor0.w = scalarValue;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue3 = (sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue5.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    float multiplyAddValue4 = (sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue5.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    float multiplyAddValue5 = (sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue5.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float scalarValue1 = sampledTextureValue1.x;
    float scalarValue2 = sampledTextureValue1.y;
    float scalarValue3 = sampledTextureValue1.z;
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue1, multiplyAddValue3, uintBitsToFloat(reinterpretedBits11.x)), multiplyAddValue3 * scalarValue1);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue2, multiplyAddValue4, uintBitsToFloat(reinterpretedBits11.y)), multiplyAddValue4 * scalarValue2);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue3, multiplyAddValue5, uintBitsToFloat(reinterpretedBits11.z)), multiplyAddValue5 * scalarValue3);
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue9 = (sampledTextureValue2.x * varyingColor0.x) * sampledTextureValue3.x;
    float productValue10 = (sampledTextureValue2.y * varyingColor0.y) * sampledTextureValue3.y;
    float productValue11 = (sampledTextureValue2.z * varyingColor0.z) * sampledTextureValue3.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = scalarValue4;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue12 = ((sampledTextureValue2.x * varyingColor0.w) * ((((sampledTextureValue4.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.x;
    float productValue13 = ((sampledTextureValue2.y * varyingColor0.w) * ((((sampledTextureValue4.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.y;
    float productValue14 = ((sampledTextureValue2.z * varyingColor0.w) * ((((sampledTextureValue4.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue9 = (sampledTextureValue2.x * varyingColor0.x) * sampledTextureValue3.x;
    float productValue10 = (sampledTextureValue2.y * varyingColor0.y) * sampledTextureValue3.y;
    float productValue11 = (sampledTextureValue2.z * varyingColor0.z) * sampledTextureValue3.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[8u].x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[8u].y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[8u].z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = scalarValue4;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue4 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(lightMapTextureTexture, lightMapTextureSampler), vec2(varyingTexCoord1.x, varyingTexCoord1.y));
    float productValue12 = ((sampledTextureValue2.x * varyingColor0.w) * ((((sampledTextureValue4.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.x;
    float productValue13 = ((sampledTextureValue2.y * varyingColor0.w) * ((((sampledTextureValue4.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.y;
    float productValue14 = ((sampledTextureValue2.z * varyingColor0.w) * ((((sampledTextureValue4.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0)) * sampledTextureValue3.z;
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[8u].x - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[8u].y - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[8u].z - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.w = 1.0;
#endif
    discardIfRequested();
}
