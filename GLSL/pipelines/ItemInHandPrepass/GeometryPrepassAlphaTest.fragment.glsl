#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ItemInHandPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits), -(inverseLengthValue2 * reinterpretedBits1), -(inverseLengthValue2 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue2 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue3 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue22 = floor(multiplyAddValue3 * 0.25);
    float productValue23 = floor(multiplyAddValue3 * 0.5);
    float scalarValue2 = floor(multiplyAddValue3);
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue2 * 0.25), 0.5, (productValue22 * productValue22) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue2 * 0.5), 0.5, (productValue23 * productValue23) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue2), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[4u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[4u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[4u].z) - productValue2) * varyingColor0.w) + productValue2;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue6 = floor(quotientValue1 * 0.25);
        float productValue7 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue6 * productValue6) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue31 = productValue * fragmentVectorConstants1.packedValues[4u].x;
    float productValue32 = productValue * fragmentVectorConstants1.packedValues[4u].y;
    float productValue33 = productValue * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue4 = ceil(productValue1);
    float productValue34 = (((productValue1 * fragmentVectorConstants1.packedValues[26u].x) - productValue31) * scalarValue4) + productValue31;
    float productValue35 = (((productValue1 * fragmentVectorConstants1.packedValues[26u].y) - productValue32) * scalarValue4) + productValue32;
    float productValue36 = (((productValue1 * fragmentVectorConstants1.packedValues[26u].z) - productValue33) * scalarValue4) + productValue33;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue6 = floor(quotientValue1 * 0.25);
        float productValue7 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue6 * productValue6) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue6 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue4), multiplyAddValue4);
    float multiplyAddValue8 = fma(varyingColor0.w, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue5), multiplyAddValue5);
    float multiplyAddValue9 = fma(varyingColor0.w, fma(multiplyAddValue6, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue6), multiplyAddValue6);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue7, multiplyAddValue7);
    fragmentColor1.y = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue8, multiplyAddValue8);
    fragmentColor1.z = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue9, multiplyAddValue9);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits14 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits13.z);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue3 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue3);
    float productValue24 = inverseLengthValue3 * varyingNormal0.x;
    float productValue25 = inverseLengthValue3 * varyingNormal0.y;
    float productValue26 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue26) + (abs(productValue25) + abs(productValue24)));
    float productValue27 = quotientValue3 * productValue24;
    float productValue28 = quotientValue3 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue28)) * ((productValue27 >= 0.0) ? sumValue3 : (-1.0))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 >= 0.0) ? sumValue3 : (-1.0))) : productValue28;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue10 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue11 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits16, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits19.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits18.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits17.x))) + uintBitsToFloat(reinterpretedBits20.x)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits23.x), reinterpretedBits16, fma(uintBitsToFloat(reinterpretedBits22.x), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(reinterpretedBits21.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue11, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits19.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits18.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits17.y))) + uintBitsToFloat(reinterpretedBits20.y)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits23.y), reinterpretedBits16, fma(uintBitsToFloat(reinterpretedBits22.y), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(reinterpretedBits21.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue11, 0.5, 0.5);
    float reinterpretedBits25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
    bool reinterpretedBits26 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits25 > 9.9999997473787516355514526367188e-05);
    float productValue29 = reinterpretedBits25 * reinterpretedBits25;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits28 = (reinterpretedBits26 ? spvNMin(productValue29, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue12 = (reinterpretedBits26 ? spvNMin(fma(fma(productValue29, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue13 = (reinterpretedBits26 ? spvNMin(fma(productValue29 * productValue29, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue29, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue12, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue13, reinterpretedBits28)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue12 / productValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits28 / productValue30, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue13 / productValue30, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[105u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) + (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits29 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.x);
    float reinterpretedBits30 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits31 = multiplyAddValue4 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue5 = ceil(multiplyAddValue5);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float multiplyAddValue14 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits32.x), -reinterpretedBits29), reinterpretedBits29);
    float multiplyAddValue15 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits32.y), -reinterpretedBits30), reinterpretedBits30);
    float multiplyAddValue16 = fma(scalarValue5, fma(multiplyAddValue5, uintBitsToFloat(reinterpretedBits32.z), -reinterpretedBits31), reinterpretedBits31);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue14, multiplyAddValue14);
    fragmentColor1.y = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue15, multiplyAddValue15);
    fragmentColor1.z = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue16, multiplyAddValue16);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits14 = varyingTexCoord5.x - uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits15 = varyingTexCoord5.y - uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits16 = varyingTexCoord5.z - uintBitsToFloat(reinterpretedBits13.z);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue3 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue3);
    float productValue24 = inverseLengthValue3 * varyingNormal0.x;
    float productValue25 = inverseLengthValue3 * varyingNormal0.y;
    float productValue26 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue26) + (abs(productValue25) + abs(productValue24)));
    float productValue27 = quotientValue3 * productValue24;
    float productValue28 = quotientValue3 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue28)) * ((productValue27 >= 0.0) ? sumValue3 : (-1.0))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 >= 0.0) ? sumValue3 : (-1.0))) : productValue28;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits19 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue10 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue11 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits16, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits19.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits18.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits17.x))) + uintBitsToFloat(reinterpretedBits20.x)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits23.x), reinterpretedBits16, fma(uintBitsToFloat(reinterpretedBits22.x), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(reinterpretedBits21.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue11, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits19.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits18.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits17.y))) + uintBitsToFloat(reinterpretedBits20.y)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits23.y), reinterpretedBits16, fma(uintBitsToFloat(reinterpretedBits22.y), reinterpretedBits14, reinterpretedBits15 * uintBitsToFloat(reinterpretedBits21.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue11, 0.5, 0.5);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits34 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits33 > 9.9999997473787516355514526367188e-05);
    float productValue42 = reinterpretedBits33 * reinterpretedBits33;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits35 = (reinterpretedBits34 ? spvNMin(productValue42, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue17 = (reinterpretedBits34 ? spvNMin(fma(fma(productValue42, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue18 = (reinterpretedBits34 ? spvNMin(fma(productValue42 * productValue42, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue17, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue18, reinterpretedBits35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue17 / productValue43, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits35 / productValue43, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue18 / productValue43, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) + (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue2;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[26u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue13 = fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue2 = spvNClamp(productValue13, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue13 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue13, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue13 * productValue13) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue13, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[18u].x;
        productValue14 = fragmentVectorConstants1.packedValues[18u].y;
        productValue15 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue18 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue19 = productValue14 * 0.16666667163372039794921875;
    float productValue20 = productValue15 * 0.16666667163372039794921875;
    float productValue21 = ceil(spvNClamp(spvNMax(spvNMax(productValue18, productValue20), spvNMax(productValue19, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue18 / productValue21, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue19 / productValue21, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue20 / productValue21, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue21, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[26u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue3) * fragmentVectorConstants1.packedValues[13u].w) + productValue3;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue4) * fragmentVectorConstants1.packedValues[13u].w) + productValue4;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue5) * fragmentVectorConstants1.packedValues[13u].w) + productValue5;
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue1)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue3;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue37 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue3 = spvNClamp(productValue37, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue37 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue37, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue37 * productValue37) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue37, 0.0, 1.0);
    }
    else
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[18u].x;
        productValue16 = fragmentVectorConstants1.packedValues[18u].y;
        productValue17 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue38 = intermediateValue3 * 0.16666667163372039794921875;
    float productValue39 = productValue16 * 0.16666667163372039794921875;
    float productValue40 = productValue17 * 0.16666667163372039794921875;
    float productValue41 = ceil(spvNClamp(spvNMax(spvNMax(productValue38, productValue40), spvNMax(productValue39, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue38 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39 / productValue41, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue40 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue41, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue34) * fragmentVectorConstants1.packedValues[13u].w) + productValue34;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue35) * fragmentVectorConstants1.packedValues[13u].w) + productValue35;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue36) * fragmentVectorConstants1.packedValues[13u].w) + productValue36;
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue1)) * 0.5;
#endif
    discardIfRequested();
}
