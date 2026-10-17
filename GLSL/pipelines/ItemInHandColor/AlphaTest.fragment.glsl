#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
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

#include "../../include/materials/ItemInHandColor/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue2 = inverseLengthValue * reinterpretedBits;
    precise float productValue3 = inverseLengthValue * reinterpretedBits1;
    precise float productValue4 = inverseLengthValue * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits13 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits14 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits15 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue2 = rdDot3Precise(vec3(-productValue2, -productValue3, -productValue4), vec3(reinterpretedBits13, reinterpretedBits14, reinterpretedBits15));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits5;
    precise float sumValue = scalarValue2 - reinterpretedBits5;
    precise float quotientValue = 1.0 / reinterpretedBits16;
    precise float productValue5 = quotientValue * sumValue;
    float scalarValue3 = spvNClamp(productValue5, 0.0, 1.0);
    precise float productValue6 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue11 = productValue6 * fma(scalarValue3, -2.0, 3.0);
    precise float quotientValue1 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue2 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue12 = fma(quotientValue1, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue13 = fma(quotientValue2, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue3 = multiplyAddValue12 / reinterpretedBits8;
    precise float quotientValue4 = multiplyAddValue13 / reinterpretedBits8;
    precise float productValue7 = floor(quotientValue3) * reinterpretedBits8;
    precise float productValue8 = floor(quotientValue4) * reinterpretedBits8;
    precise float productValue9 = productValue7 * 0.25;
    precise float productValue10 = productValue8 * 0.25;
    precise float productValue11 = productValue7 * 0.5;
    precise float productValue12 = productValue8 * 0.5;
    float scalarValue4 = floor(productValue10);
    float scalarValue5 = floor(productValue12);
    precise float productValue13 = scalarValue4 * scalarValue4;
    precise float productValue14 = scalarValue5 * scalarValue5;
    precise float productValue15 = productValue13 * 0.75;
    precise float productValue16 = productValue14 * 0.75;
    float scalarValue6 = floor(productValue8);
    precise float productValue17 = scalarValue6 * scalarValue6;
    precise float productValue18 = productValue17 * 0.75;
    precise float multiplyAddValue14 = fma(fma(fma(fract(fma(floor(productValue9), 0.5, productValue15)), 0.25, fract(fma(floor(productValue11), 0.5, productValue16))), 0.25, fract(fma(floor(productValue7), 0.5, productValue18))), 64.0, 0.5) * 0.015625;
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue14 >= multiplyAddValue11))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits), -(inverseLengthValue * reinterpretedBits1), -(inverseLengthValue * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue1 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue1 = floor(multiplyAddValue1);
    if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0))))
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue22 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue23 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue24 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue25 = (((productValue22 * fragmentVectorConstants1.packedValues[4u].x) - productValue22) * varyingColor0.w) + productValue22;
    float productValue26 = (((productValue23 * fragmentVectorConstants1.packedValues[4u].y) - productValue23) * varyingColor0.w) + productValue23;
    float productValue27 = (((productValue24 * fragmentVectorConstants1.packedValues[4u].z) - productValue24) * varyingColor0.w) + productValue24;
    float productValue28 = (((fragmentVectorConstants1.packedValues[9u].x - productValue25) * fragmentVectorConstants1.packedValues[9u].w) + productValue25) * varyingColor1.x;
    float productValue29 = (((fragmentVectorConstants1.packedValues[9u].y - productValue26) * fragmentVectorConstants1.packedValues[9u].w) + productValue26) * varyingColor1.y;
    float productValue30 = (((fragmentVectorConstants1.packedValues[9u].z - productValue27) * fragmentVectorConstants1.packedValues[9u].w) + productValue27) * varyingColor1.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue6 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue31 = floor(quotientValue6 * 0.25);
        float productValue32 = floor(quotientValue6 * 0.5);
        float scalarValue7 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue32 * productValue32) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue31 * productValue31) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue7 * scalarValue7) * 0.75) + (floor(quotientValue5) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue22 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue23 = (fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue33 = productValue22 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue34 = productValue22 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue35 = productValue22 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue8 = ceil(productValue23);
    float productValue36 = (((productValue23 * fragmentVectorConstants1.packedValues[16u].x) - productValue33) * scalarValue8) + productValue33;
    float productValue37 = (((productValue23 * fragmentVectorConstants1.packedValues[16u].y) - productValue34) * scalarValue8) + productValue34;
    float productValue38 = (((productValue23 * fragmentVectorConstants1.packedValues[16u].z) - productValue35) * scalarValue8) + productValue35;
    float productValue39 = (((fragmentVectorConstants1.packedValues[9u].x - productValue36) * fragmentVectorConstants1.packedValues[9u].w) + productValue36) * varyingColor1.x;
    float productValue40 = (((fragmentVectorConstants1.packedValues[9u].y - productValue37) * fragmentVectorConstants1.packedValues[9u].w) + productValue37) * varyingColor1.y;
    float productValue41 = (((fragmentVectorConstants1.packedValues[9u].z - productValue38) * fragmentVectorConstants1.packedValues[9u].w) + productValue38) * varyingColor1.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue5 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue6 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue31 = floor(quotientValue6 * 0.25);
        float productValue32 = floor(quotientValue6 * 0.5);
        float scalarValue7 = floor(quotientValue6);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue32 * productValue32) * 0.75) + (floor(quotientValue5 * 0.5) * 0.5)) + (fract(((productValue31 * productValue31) * 0.75) + (floor(quotientValue5 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue7 * scalarValue7) * 0.75) + (floor(quotientValue5) * 0.5)));
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
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    precise float sumValue3 = varyingColor0.z - 1.0;
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue15 = fma(reinterpretedBits9, sumValue1, 1.0);
    float multiplyAddValue16 = fma(reinterpretedBits9, sumValue2, 1.0);
    float multiplyAddValue17 = fma(reinterpretedBits9, sumValue3, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue18 = fma(varyingColor0.w, fma(multiplyAddValue15, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue15), multiplyAddValue15);
    float multiplyAddValue19 = fma(varyingColor0.w, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue16), multiplyAddValue16);
    float multiplyAddValue20 = fma(varyingColor0.w, fma(multiplyAddValue17, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue17), multiplyAddValue17);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue18;
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue19;
    precise float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue20;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue21 = fma(reinterpretedBits12, reinterpretedBits17, multiplyAddValue18);
    float multiplyAddValue22 = fma(reinterpretedBits12, reinterpretedBits18, multiplyAddValue19);
    float multiplyAddValue23 = fma(reinterpretedBits12, reinterpretedBits19, multiplyAddValue20);
    precise float productValue19 = multiplyAddValue21 * varyingColor1.x;
    precise float productValue20 = multiplyAddValue22 * varyingColor1.y;
    precise float productValue21 = multiplyAddValue23 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue21, varyingColor1.x, varyingColor2.x), productValue19);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor1.y, varyingColor2.y), productValue20);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor1.z, varyingColor2.z), productValue21);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = varyingColor0.x - 1.0;
    precise float sumValue2 = varyingColor0.y - 1.0;
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue15 = fma(reinterpretedBits9, sumValue1, 1.0);
    float multiplyAddValue16 = fma(reinterpretedBits9, sumValue2, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits24 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits10.x);
    precise float reinterpretedBits25 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits10.y);
    precise float reinterpretedBits26 = multiplyAddValue15 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue10 = ceil(multiplyAddValue16);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue30 = fma(scalarValue10, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits23.x), -reinterpretedBits24), reinterpretedBits24);
    float multiplyAddValue31 = fma(scalarValue10, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits23.y), -reinterpretedBits25), reinterpretedBits25);
    float multiplyAddValue32 = fma(scalarValue10, fma(multiplyAddValue16, uintBitsToFloat(reinterpretedBits23.z), -reinterpretedBits26), reinterpretedBits26);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits27 = uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue30;
    precise float reinterpretedBits28 = uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue31;
    precise float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue32;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue33 = fma(reinterpretedBits12, reinterpretedBits27, multiplyAddValue30);
    float multiplyAddValue34 = fma(reinterpretedBits12, reinterpretedBits28, multiplyAddValue31);
    float multiplyAddValue35 = fma(reinterpretedBits12, reinterpretedBits29, multiplyAddValue32);
    precise float productValue42 = multiplyAddValue33 * varyingColor1.x;
    precise float productValue43 = multiplyAddValue34 * varyingColor1.y;
    precise float productValue44 = multiplyAddValue35 * varyingColor1.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor1.x, varyingColor2.x), productValue42);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue34, varyingColor1.y, varyingColor2.y), productValue43);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue35, varyingColor1.z, varyingColor2.z), productValue44);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue5 = fma(varyingColor0.w, fma(multiplyAddValue2, uintBitsToFloat(reinterpretedBits10.x), -multiplyAddValue2), multiplyAddValue2);
    float multiplyAddValue6 = fma(varyingColor0.w, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits10.y), -multiplyAddValue3), multiplyAddValue3);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, uintBitsToFloat(reinterpretedBits10.z), -multiplyAddValue4), multiplyAddValue4);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue8 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue5, multiplyAddValue5);
    float multiplyAddValue9 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue6, multiplyAddValue6);
    float multiplyAddValue10 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue7, multiplyAddValue7);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor1.x, varyingColor2.x), multiplyAddValue8 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor1.y, varyingColor2.y), multiplyAddValue9 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor1.z, varyingColor2.z), multiplyAddValue10 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue2 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits20 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.x);
    float reinterpretedBits21 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.y);
    float reinterpretedBits22 = multiplyAddValue2 * uintBitsToFloat(reinterpretedBits10.z);
    float scalarValue9 = ceil(multiplyAddValue3);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue24 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits23.x), -reinterpretedBits20), reinterpretedBits20);
    float multiplyAddValue25 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits23.y), -reinterpretedBits21), reinterpretedBits21);
    float multiplyAddValue26 = fma(scalarValue9, fma(multiplyAddValue3, uintBitsToFloat(reinterpretedBits23.z), -reinterpretedBits22), reinterpretedBits22);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue27 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.x) - multiplyAddValue24, multiplyAddValue24);
    float multiplyAddValue28 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.y) - multiplyAddValue25, multiplyAddValue25);
    float multiplyAddValue29 = fma(reinterpretedBits12, uintBitsToFloat(reinterpretedBits11.z) - multiplyAddValue26, multiplyAddValue26);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor1.x, varyingColor2.x), multiplyAddValue27 * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor1.y, varyingColor2.y), multiplyAddValue28 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor1.z, varyingColor2.z), multiplyAddValue29 * varyingColor1.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.y = ((varyingColor2.y - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.z = ((varyingColor2.z - productValue30) * varyingColor2.w) + productValue30;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue39) * varyingColor2.w) + productValue39;
    fragmentColor0.y = ((varyingColor2.y - productValue40) * varyingColor2.w) + productValue40;
    fragmentColor0.z = ((varyingColor2.z - productValue41) * varyingColor2.w) + productValue41;
#endif
    fragmentColor0.w = 1.0;
    discardIfRequested();
}
