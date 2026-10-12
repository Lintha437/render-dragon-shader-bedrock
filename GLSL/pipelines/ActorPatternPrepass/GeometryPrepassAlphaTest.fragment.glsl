#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorPatternPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue5 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    uint intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    intermediateValue11 = 4294967295u;
    intermediateValue12 = sampledTextureValue3.z;
    intermediateValue13 = sampledTextureValue3.y;
    intermediateValue14 = sampledTextureValue3.x;
    uint comparisonValue;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue6 = 0u;
    for (;;)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue2 = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue17 = rdDot3Precise(vectorValue2, vectorValue2);
    float inverseLengthValue4 = inversesqrt(scalarValue17);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue4 * reinterpretedBits), -(inverseLengthValue4 * reinterpretedBits1), -(inverseLengthValue4 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[81u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[23u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[82u]));
    float multiplyAddValue13 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue14 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue38 = floor(multiplyAddValue14 * 0.25);
    float productValue39 = floor(multiplyAddValue14 * 0.5);
    float scalarValue18 = floor(multiplyAddValue14);
    if ((sampledTextureValue3.w < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[96u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue13 * 0.25), 0.5, (productValue38 * productValue38) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue13 * 0.5), 0.5, (productValue39 * productValue39) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue13), 0.5, (scalarValue18 * scalarValue18) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    bool comparisonValue;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue15 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[24u].x != 0.0)
#endif
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue5) <= int(scalarValue6))
        {
            break;
        }
        uint sumValue7 = scalarValue6 + 36u;
        vec4 sampledTextureValue4 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue7].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue7].x), fma(fragmentVectorConstants1.packedValues[sumValue7].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue7].y)));
        uint sumValue8 = scalarValue6 + 29u;
        float bitwiseValue1 = sampledTextureValue4.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue6) + 464u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[sumValue8].x, -intermediateValue14), intermediateValue14);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[sumValue8].y, -intermediateValue13), intermediateValue13);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[sumValue8].z, -intermediateValue12), intermediateValue12);
        comparisonValue = ((bitwiseValue1 > 0.5) && (intermediateValue11 != 0u)) ? 0u : intermediateValue11;
        sumValue = scalarValue6 + 1u;
        intermediateValue11 = comparisonValue;
        intermediateValue12 = multiplyAddValue;
        intermediateValue13 = multiplyAddValue1;
        intermediateValue14 = multiplyAddValue2;
        scalarValue6 = sumValue;
        continue;
    }
    fragmentColor1.x = intermediateValue14;
    fragmentColor1.y = intermediateValue13;
    fragmentColor1.z = intermediateValue12;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue7 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue7);
    float productValue20 = rdDot3Precise(vec3(-(inverseLengthValue2 * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue2 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue2 * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue3 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[85u] - fragmentScalarConstants1.packedValues[84u])) * (productValue20 - fragmentScalarConstants1.packedValues[84u]), 0.0, 1.0);
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentScalarConstants1.packedValues[86u]) * fragmentScalarConstants1.packedValues[86u];
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentScalarConstants1.packedValues[86u]) * fragmentScalarConstants1.packedValues[86u];
    float productValue21 = floor(multiplyAddValue6 * 0.25);
    float productValue22 = floor(multiplyAddValue6 * 0.5);
    float scalarValue8 = floor(multiplyAddValue6);
    if (((fragmentScalarConstants1.packedValues[100u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue21 * productValue21) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue22 * productValue22) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue8 * scalarValue8) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue3 * quotientValue3) * fma(quotientValue3, -2.0, 3.0)))) || (fragmentScalarConstants1.packedValues[80u] > 1.0))
    {
        isFragmentDiscarded = true;
    }
    uint scalarValue9 = uint(int(fragmentScalarConstants1.packedValues[20u]));
    uint comparisonValue4 = (intermediateValue11 != 0u) ? scalarValue9 : (scalarValue9 & 4294967294u);
    float scalarValue10 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue11 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue12 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue13 = dFdyCoarse(varyingTexCoord0.y);
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float comparisonValue2;
    if ((comparisonValue4 & 1u) == 1u)
    {
        vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue10, scalarValue11), vec2(scalarValue12, scalarValue13));
        intermediateValue24 = sampledTextureValue5.y;
        intermediateValue25 = sampledTextureValue5.z;
        intermediateValue26 = sampledTextureValue5.x;
        comparisonValue2 = ((comparisonValue4 & 2u) == 2u) ? sampledTextureValue5.w : fragmentScalarConstants1.packedValues[176u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uint reinterpretedBits9 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float reinterpretedBits10;
    if ((reinterpretedBits9 & 1u) == 1u)
    {
        vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue6.y;
        intermediateValue12 = sampledTextureValue6.z;
        intermediateValue13 = sampledTextureValue6.x;
        reinterpretedBits10 = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue6.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        uint intermediateValue7;
        uint intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        intermediateValue7 = 0u;
        intermediateValue8 = 1u;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue2;
        intermediateValue11 = scalarValue3;
        float productValue;
        float productValue1;
        float productValue2;
        uint comparisonValue2;
        for (;;)
        {
            uint sumValue1 = intermediateValue7 + 36u;
            uint sumValue2 = intermediateValue7 + 29u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue9) * productValue3) + intermediateValue9;
            productValue1 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue10) * productValue3) + intermediateValue10;
            productValue2 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue11) * productValue3) + intermediateValue11;
            comparisonValue2 = ((intermediateValue8 != 0u) && (productValue3 > 0.5)) ? 0u : intermediateValue8;
            uint sumValue3 = intermediateValue7 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue7 = sumValue3;
                intermediateValue8 = comparisonValue2;
                intermediateValue9 = productValue;
                intermediateValue10 = productValue1;
                intermediateValue11 = productValue2;
            }
            else
            {
                break;
            }
        }
        comparisonValue = comparisonValue2 != 0u;
        intermediateValue4 = productValue;
        intermediateValue5 = productValue1;
        intermediateValue6 = productValue2;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[20u].x) / (fragmentVectorConstants1.packedValues[20u].y - fragmentVectorConstants1.packedValues[20u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[23u].x) / fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[20u].z;
        float quotientValue6 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[23u].y) / fragmentVectorConstants1.packedValues[20u].z) * fragmentVectorConstants1.packedValues[20u].z;
        float productValue31 = floor(quotientValue6 * 0.25);
        float productValue32 = floor(quotientValue6 * 0.5);
        float scalarValue16 = floor(quotientValue6);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue32 * productValue32) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue31 * productValue31) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue16 * scalarValue16) * 0.75) + (floor(quotientValue5) * 0.5)));
#endif
    }
    else
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue24 = fragmentScalarConstants1.packedValues[104u];
        intermediateValue25 = fragmentScalarConstants1.packedValues[172u];
        intermediateValue26 = fragmentScalarConstants1.packedValues[112u];
        comparisonValue2 = fragmentScalarConstants1.packedValues[176u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u]));
        intermediateValue12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
        intermediateValue13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
        reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        comparisonValue = true;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
        intermediateValue6 = scalarValue3;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        comparisonValue = false;
#endif
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    fragmentColor1.w = (comparisonValue2 < intermediateValue26) ? fma(intermediateValue26, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue2, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue14);
    float productValue23 = inverseLengthValue3 * varyingNormal0.x;
    float productValue24 = inverseLengthValue3 * varyingNormal0.y;
    float productValue25 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue4 = 1.0 / (abs(productValue25) + (abs(productValue24) + abs(productValue23)));
    float productValue26 = quotientValue4 * productValue23;
    float productValue27 = quotientValue4 * productValue24;
    bool conditionValue1 = productValue25 < 0.0;
    float sumValue9 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue26 >= 0.0) ? sumValue9 : (-1.0))) : productValue26;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue26)) * ((productValue27 >= 0.0) ? sumValue9 : (-1.0))) : productValue27;
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[51u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[43u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[47u])) + fragmentScalarConstants1.packedValues[55u];
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[67u], sumValue6, fma(fragmentScalarConstants1.packedValues[59u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[63u])) + fragmentScalarConstants1.packedValues[71u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue7, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[14u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue8, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[11u].y)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue7, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[14u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue8, 0.5, 0.5);
    bool bitwiseValue2 = (((fragmentScalarConstants1.packedValues[73u] + fragmentScalarConstants1.packedValues[72u]) + fragmentScalarConstants1.packedValues[74u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[108u] > 9.9999997473787516355514526367188e-05);
    float productValue28 = fragmentScalarConstants1.packedValues[108u] * fragmentScalarConstants1.packedValues[108u];
    float comparisonValue5 = (bitwiseValue2 ? spvNMin(productValue28, 1.0) : fragmentVectorConstants1.packedValues[18u].x) * 0.16666667163372039794921875;
    float multiplyAddValue9 = (bitwiseValue2 ? spvNMin(fma(fma(productValue28, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue28, 1.0) : fragmentVectorConstants1.packedValues[18u].y) * 0.16666667163372039794921875;
    float multiplyAddValue10 = (bitwiseValue2 ? spvNMin(fma(productValue28 * productValue28, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue28, 1.0) : fragmentVectorConstants1.packedValues[18u].z) * 0.16666667163372039794921875;
    float productValue29 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue9, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue10, comparisonValue5)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue9 / productValue29, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue5 / productValue29, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue10 / productValue29, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue29, 0.0, 1.0) * 255.0);
    uint productValue30 = uint(floor(fragmentScalarConstants1.packedValues[75u] * 255.0));
    fragmentColor0.w = ((((productValue30 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[109u], 0.0, 1.0) * 255.0)) + (((productValue30 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits12 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits11.x);
    float reinterpretedBits13 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits11.y);
    float reinterpretedBits14 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits11.z);
    fragmentColor1.w = (reinterpretedBits10 < intermediateValue13) ? fma(intermediateValue13, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits10, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue14 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue14);
    float productValue23 = inverseLengthValue3 * varyingNormal0.x;
    float productValue24 = inverseLengthValue3 * varyingNormal0.y;
    float productValue25 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue4 = 1.0 / (abs(productValue25) + (abs(productValue24) + abs(productValue23)));
    float productValue26 = quotientValue4 * productValue23;
    float productValue27 = quotientValue4 * productValue24;
    bool conditionValue1 = productValue25 < 0.0;
    float sumValue9 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue26 >= 0.0) ? sumValue9 : (-1.0)) * (1.0 - abs(productValue27))) : productValue26;
    fragmentColor2.y = conditionValue1 ? (((productValue27 >= 0.0) ? sumValue9 : (-1.0)) * (1.0 - abs(productValue26))) : productValue27;
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue15 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue16 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits14, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])), reinterpretedBits12, reinterpretedBits13 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits17.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits16.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits15.x))) + uintBitsToFloat(reinterpretedBits18.x)) / multiplyAddValue15, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits21.x), reinterpretedBits14, fma(uintBitsToFloat(reinterpretedBits20.x), reinterpretedBits12, reinterpretedBits13 * uintBitsToFloat(reinterpretedBits19.x))) + uintBitsToFloat(reinterpretedBits22.x)) / multiplyAddValue16, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits17.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits16.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits15.y))) + uintBitsToFloat(reinterpretedBits18.y)) / multiplyAddValue15, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits21.y), reinterpretedBits14, fma(uintBitsToFloat(reinterpretedBits20.y), reinterpretedBits12, reinterpretedBits13 * uintBitsToFloat(reinterpretedBits19.y))) + uintBitsToFloat(reinterpretedBits22.y)) / multiplyAddValue16, 0.5, 0.5);
    float reinterpretedBits23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
    bool reinterpretedBits24 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[69u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[70u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits23 > 9.9999997473787516355514526367188e-05);
    float productValue40 = reinterpretedBits23 * reinterpretedBits23;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits26 = (reinterpretedBits24 ? spvNMin(productValue40, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue17 = (reinterpretedBits24 ? spvNMin(fma(fma(productValue40, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue40, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue18 = (reinterpretedBits24 ? spvNMin(fma(productValue40 * productValue40, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue40, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue41 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue17, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue18, reinterpretedBits26)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue17 / productValue41, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits26 / productValue41, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue18 / productValue41, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue41, 0.0, 1.0) * 255.0);
    uint reinterpretedBits27 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])) * 255.0));
    fragmentColor0.w = ((((reinterpretedBits27 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[105u])), 0.0, 1.0) * 255.0)) + (((reinterpretedBits27 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor1.x = sampledTextureValue3.x;
    fragmentColor1.y = sampledTextureValue3.y;
    fragmentColor1.z = sampledTextureValue3.z;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
    bool comparisonValue3;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue4 = floor(quotientValue1 * 0.25);
        float productValue5 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue3 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue5 * productValue5) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue4 * productValue4) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue3 = false;
    }
    if ((fragmentVectorConstants1.packedValues[20u].x > 1.0) || comparisonValue3)
    {
        isFragmentDiscarded = true;
    }
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[43u].x;
        intermediateValue16 = fragmentVectorConstants1.packedValues[44u].x;
    }
    else
    {
        vec4 sampledTextureValue2 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue13 = sampledTextureValue2.x;
        intermediateValue14 = sampledTextureValue2.y;
        intermediateValue15 = sampledTextureValue2.z;
        intermediateValue16 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue2.w : fragmentVectorConstants1.packedValues[44u].x;
    }
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue1 * varyingNormal0.x;
    float productValue7 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue7) + abs(productValue6)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue6;
    float productValue14 = quotientValue2 * productValue7;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue18;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue15 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue18 = spvNClamp(productValue15, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue15 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue15, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue15 * productValue15) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue15, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[18u].x;
        productValue12 = fragmentVectorConstants1.packedValues[18u].y;
        productValue13 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue16 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue17 = productValue12 * 0.16666667163372039794921875;
    float productValue18 = productValue13 * 0.16666667163372039794921875;
    float productValue19 = ceil(spvNClamp(spvNMax(spvNMax(productValue16, productValue18), spvNMax(productValue17, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue16 / productValue19, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue17 / productValue19, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue18 / productValue19, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue19, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = intermediateValue4;
    fragmentColor1.y = intermediateValue5;
    fragmentColor1.z = intermediateValue6;
    fragmentColor1.w = (intermediateValue13 > intermediateValue16) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue16 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue14))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue14 < 0.0) ? (-1.0) : 1.0)) : productValue14;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((sampledTextureValue.w < fragmentVectorConstants1.packedValues[19u].x) || comparisonValue)
    {
        isFragmentDiscarded = true;
    }
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue15 & 1u) == 0u)
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[25u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[29u].x;
    }
    else
    {
        vec4 sampledTextureValue2 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue2 = sampledTextureValue2.x;
        intermediateValue3 = sampledTextureValue2.y;
        intermediateValue4 = sampledTextureValue2.z;
        intermediateValue5 = ((scalarValue15 & 2u) != 0u) ? sampledTextureValue2.w : fragmentVectorConstants1.packedValues[29u].x;
    }
    float sumValue10 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[18u].x;
    float sumValue11 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[18u].y;
    float sumValue12 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[18u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue1 * varyingNormal0.x;
    float productValue7 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue7) + abs(productValue6)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue6;
    float productValue14 = quotientValue2 * productValue7;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[15u].w, sumValue12, fma(fragmentVectorConstants1.packedValues[14u].w, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[16u].w;
    float intermediateValue7;
    float productValue8;
    float productValue9;
    if ((fragmentVectorConstants1.packedValues[26u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[17u].x + fragmentVectorConstants1.packedValues[17u].y) + fragmentVectorConstants1.packedValues[17u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue33 = fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue7 = spvNClamp(productValue33, 0.0, 1.0);
        productValue8 = spvNClamp(((productValue33 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue33, 0.0, 1.0);
        productValue9 = spvNClamp((((productValue33 * productValue33) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue33, 0.0, 1.0);
    }
    else
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[17u].x;
        productValue8 = fragmentVectorConstants1.packedValues[17u].y;
        productValue9 = fragmentVectorConstants1.packedValues[17u].z;
    }
    float productValue34 = intermediateValue7 * 0.16666667163372039794921875;
    float productValue35 = productValue8 * 0.16666667163372039794921875;
    float productValue36 = productValue9 * 0.16666667163372039794921875;
    float productValue37 = ceil(spvNClamp(spvNMax(spvNMax(productValue34, productValue36), spvNMax(productValue35, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[17u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue34 / productValue37, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue35 / productValue37, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue36 / productValue37, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[26u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
    fragmentColor1.w = (intermediateValue2 > intermediateValue5) ? ((intermediateValue2 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue5 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue14))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue14 < 0.0) ? (-1.0) : 1.0)) : productValue14;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue11) - ((fma(fragmentVectorConstants1.packedValues[15u].x, sumValue12, fma(fragmentVectorConstants1.packedValues[14u].x, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[16u].x) / multiplyAddValue12)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue11) - ((fma(fragmentVectorConstants1.packedValues[15u].y, sumValue12, fma(fragmentVectorConstants1.packedValues[14u].y, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[16u].y) / multiplyAddValue12)) * 0.5;
#endif
    discardIfRequested();
}
