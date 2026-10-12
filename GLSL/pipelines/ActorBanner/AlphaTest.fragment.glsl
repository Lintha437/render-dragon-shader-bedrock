#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBanner / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorBanner/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.w;
    precise float productValue5 = scalarValue1 * scalarValue;
    float multiplyAddValue3 = fma(varyingColor0.w, fma(-scalarValue, scalarValue1, scalarValue1), productValue5);
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue2 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue2);
    precise float productValue6 = inverseLengthValue * reinterpretedBits;
    precise float productValue7 = inverseLengthValue * reinterpretedBits1;
    precise float productValue8 = inverseLengthValue * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits9 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits10 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits11 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue4 = rdDot3Precise(vec3(-productValue6, -productValue7, -productValue8), vec3(reinterpretedBits9, reinterpretedBits10, reinterpretedBits11));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    precise float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5;
    precise float sumValue = scalarValue4 - reinterpretedBits5;
    precise float quotientValue = 1.0 / reinterpretedBits12;
    precise float productValue9 = sumValue * quotientValue;
    float scalarValue5 = spvNClamp(productValue9, 0.0, 1.0);
    precise float productValue10 = scalarValue5 * scalarValue5;
    precise float multiplyAddValue4 = productValue10 * fma(scalarValue5, -2.0, 3.0);
    precise float quotientValue1 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue2 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue5 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue6 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    precise float quotientValue3 = multiplyAddValue5 / reinterpretedBits8;
    precise float quotientValue4 = multiplyAddValue6 / reinterpretedBits8;
    precise float productValue11 = floor(quotientValue3) * reinterpretedBits8;
    precise float productValue12 = floor(quotientValue4) * reinterpretedBits8;
    precise float productValue13 = productValue11 * 0.25;
    precise float productValue14 = productValue12 * 0.25;
    precise float productValue15 = productValue11 * 0.5;
    precise float productValue16 = productValue12 * 0.5;
    float scalarValue6 = floor(productValue14);
    float scalarValue7 = floor(productValue16);
    precise float productValue17 = scalarValue6 * scalarValue6;
    precise float productValue18 = scalarValue7 * scalarValue7;
    precise float productValue19 = productValue17 * 0.75;
    precise float productValue20 = productValue18 * 0.75;
    float scalarValue8 = floor(productValue12);
    precise float productValue21 = scalarValue8 * scalarValue8;
    precise float productValue22 = productValue21 * 0.75;
    precise float multiplyAddValue7 = fma(fma(fma(fract(fma(floor(productValue13), 0.5, productValue19)), 0.25, fract(fma(floor(productValue15), 0.5, productValue20))), 0.25, fract(fma(floor(productValue11), 0.5, productValue22))), 64.0, 0.5) * 0.015625;
    if ((multiplyAddValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && (multiplyAddValue7 >= multiplyAddValue4)))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue11 = sampledTextureValue1.x;
    float scalarValue12 = sampledTextureValue1.y;
    float scalarValue13 = sampledTextureValue1.z;
    float scalarValue14 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue2 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue2);
    precise float productValue6 = inverseLengthValue * reinterpretedBits;
    precise float productValue7 = inverseLengthValue * reinterpretedBits1;
    precise float productValue8 = inverseLengthValue * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits9 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits10 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits11 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue4 = rdDot3Precise(vec3(-productValue6, -productValue7, -productValue8), vec3(reinterpretedBits9, reinterpretedBits10, reinterpretedBits11));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    precise float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5;
    precise float sumValue = scalarValue4 - reinterpretedBits5;
    precise float quotientValue = 1.0 / reinterpretedBits12;
    precise float productValue36 = quotientValue * sumValue;
    float scalarValue15 = spvNClamp(productValue36, 0.0, 1.0);
    precise float productValue37 = scalarValue15 * scalarValue15;
    precise float multiplyAddValue8 = productValue37 * fma(scalarValue15, -2.0, 3.0);
    precise float quotientValue1 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue2 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue5 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue6 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    precise float quotientValue3 = multiplyAddValue5 / reinterpretedBits8;
    precise float quotientValue4 = multiplyAddValue6 / reinterpretedBits8;
    precise float productValue11 = floor(quotientValue3) * reinterpretedBits8;
    precise float productValue12 = floor(quotientValue4) * reinterpretedBits8;
    precise float productValue13 = productValue11 * 0.25;
    precise float productValue14 = productValue12 * 0.25;
    precise float productValue15 = productValue11 * 0.5;
    precise float productValue16 = productValue12 * 0.5;
    float scalarValue6 = floor(productValue14);
    float scalarValue7 = floor(productValue16);
    precise float productValue17 = scalarValue6 * scalarValue6;
    precise float productValue18 = scalarValue7 * scalarValue7;
    precise float productValue19 = productValue17 * 0.75;
    precise float productValue20 = productValue18 * 0.75;
    float scalarValue8 = floor(productValue12);
    precise float productValue21 = scalarValue8 * scalarValue8;
    precise float productValue22 = productValue21 * 0.75;
    precise float multiplyAddValue7 = fma(fma(fma(fract(fma(floor(productValue13), 0.5, productValue19)), 0.25, fract(fma(floor(productValue15), 0.5, productValue20))), 0.25, fract(fma(floor(productValue11), 0.5, productValue22))), 64.0, 0.5) * 0.015625;
    if ((scalarValue14 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && (multiplyAddValue7 >= multiplyAddValue8)))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.w;
    float multiplyAddValue = fma(varyingColor0.w, fma(-scalarValue, scalarValue1, scalarValue1), scalarValue1 * scalarValue);
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue2 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue2);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits), -(inverseLengthValue * reinterpretedBits1), -(inverseLengthValue * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    float reinterpretedBits6 = spvNClamp((reinterpretedBits4 - reinterpretedBits5) * (1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5)), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    float multiplyAddValue1 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue2 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue = floor(multiplyAddValue2 * 0.25);
    float productValue1 = floor(multiplyAddValue2 * 0.5);
    float scalarValue3 = floor(multiplyAddValue2);
    if ((multiplyAddValue < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue1 * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue1 * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue1), 0.5, (scalarValue3 * scalarValue3) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue11 = sampledTextureValue1.x;
    float scalarValue12 = sampledTextureValue1.y;
    float scalarValue13 = sampledTextureValue1.z;
    float scalarValue14 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue2 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue2);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits), -(inverseLengthValue * reinterpretedBits1), -(inverseLengthValue * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    float reinterpretedBits14 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    float multiplyAddValue1 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue2 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue = floor(multiplyAddValue2 * 0.25);
    float productValue1 = floor(multiplyAddValue2 * 0.5);
    float scalarValue3 = floor(multiplyAddValue2);
    if ((scalarValue14 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue1 * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue1 * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue1), 0.5, (scalarValue3 * scalarValue3) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits14 * reinterpretedBits14) * fma(reinterpretedBits14, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue9 = sampledTextureValue3.w;
    float productValue29 = sampledTextureValue3.x * scalarValue9;
    float productValue30 = ((scalarValue9 - productValue29) * varyingColor0.w) + productValue29;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].x) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].y) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float productValue31 = floor(quotientValue6 * 0.25);
        float productValue32 = floor(quotientValue6 * 0.5);
        float scalarValue10 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue32 * productValue32) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue31 * productValue31) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue30 < fragmentVectorConstants1.packedValues[8u].x) || comparisonValue)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float scalarValue16 = sampledTextureValue2.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].x) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].y) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float productValue31 = floor(quotientValue6 * 0.25);
        float productValue32 = floor(quotientValue6 * 0.5);
        float scalarValue10 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue32 * productValue32) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue31 * productValue31) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((scalarValue16 < fragmentVectorConstants1.packedValues[8u].x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    precise float productValue23 = sampledTextureValue1.x * varyingColor0.x;
    precise float productValue24 = sampledTextureValue1.y * varyingColor0.y;
    precise float productValue25 = sampledTextureValue1.z * varyingColor0.z;
    precise float productValue26 = productValue23 * varyingColor3.x;
    precise float productValue27 = productValue24 * varyingColor3.y;
    precise float productValue28 = productValue25 * varyingColor3.z;
    precise float reinterpretedBits13 = multiplyAddValue3 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.w = reinterpretedBits13;
    fragmentColor0.x = fma(varyingColor2.w, fma(-productValue23, varyingColor3.x, varyingColor2.x), productValue26);
    fragmentColor0.y = fma(varyingColor2.w, fma(-productValue24, varyingColor3.y, varyingColor2.y), productValue27);
    fragmentColor0.z = fma(varyingColor2.w, fma(-productValue25, varyingColor3.z, varyingColor2.z), productValue28);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue38 = scalarValue11 * varyingColor3.x;
    precise float productValue39 = scalarValue12 * varyingColor3.y;
    precise float productValue40 = scalarValue13 * varyingColor3.z;
    precise float reinterpretedBits15 = scalarValue14 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.w = reinterpretedBits15;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue11, varyingColor3.x, varyingColor2.x), productValue38);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue12, varyingColor3.y, varyingColor2.y), productValue39);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue13, varyingColor3.z, varyingColor2.z), productValue40);
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float productValue2 = sampledTextureValue1.x * varyingColor0.x;
    float productValue3 = sampledTextureValue1.y * varyingColor0.y;
    float productValue4 = sampledTextureValue1.z * varyingColor0.z;
    fragmentColor0.w = multiplyAddValue * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.x = fma(varyingColor2.w, fma(-productValue2, varyingColor3.x, varyingColor2.x), productValue2 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-productValue3, varyingColor3.y, varyingColor2.y), productValue3 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-productValue4, varyingColor3.z, varyingColor2.z), productValue4 * varyingColor3.z);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = scalarValue14 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue11, varyingColor3.x, varyingColor2.x), scalarValue11 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue12, varyingColor3.y, varyingColor2.y), scalarValue12 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue13, varyingColor3.z, varyingColor2.z), scalarValue13 * varyingColor3.z);
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue33 = (varyingColor0.x * varyingColor3.x) * sampledTextureValue2.x;
    float productValue34 = (varyingColor0.y * varyingColor3.y) * sampledTextureValue2.y;
    float productValue35 = (varyingColor0.z * varyingColor3.z) * sampledTextureValue2.z;
    fragmentColor0.x = ((varyingColor2.x - productValue33) * varyingColor2.w) + productValue33;
    fragmentColor0.y = ((varyingColor2.y - productValue34) * varyingColor2.w) + productValue34;
    fragmentColor0.z = ((varyingColor2.z - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * productValue30;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue41 = sampledTextureValue2.x * varyingColor3.x;
    float productValue42 = sampledTextureValue2.y * varyingColor3.y;
    float productValue43 = sampledTextureValue2.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue41) * varyingColor2.w) + productValue41;
    fragmentColor0.y = ((varyingColor2.y - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.z = ((varyingColor2.z - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * scalarValue16;
#endif
    discardIfRequested();
}
