#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepass / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ItemInHandPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue20 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue = (bitwiseValue ? spvNMin(productValue20, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue2 = (bitwiseValue ? spvNMin(fma(fma(productValue20, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue20, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue3 = (bitwiseValue ? spvNMin(fma(productValue20 * productValue20, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue20, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue21 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue2, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue3, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue / productValue21, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue2 / productValue21, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue3 / productValue21, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue21, 0.0, 1.0) * 255.0);
    fragmentColor0.x = (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue4), multiplyAddValue4);
    float multiplyAddValue8 = fma(varyingColor0.w, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue5), multiplyAddValue5);
    float multiplyAddValue9 = fma(varyingColor0.w, fma(multiplyAddValue6, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue6), multiplyAddValue6);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue7, multiplyAddValue7);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue8, multiplyAddValue8);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue9, multiplyAddValue9);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue22 = inverseLengthValue1 * varyingNormal0.x;
    float productValue23 = inverseLengthValue1 * varyingNormal0.y;
    float productValue24 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue24) + (abs(productValue23) + abs(productValue22)));
    float productValue25 = quotientValue1 * productValue22;
    float productValue26 = quotientValue1 * productValue23;
    bool conditionValue1 = productValue24 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue25 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue26))) : productValue25;
    fragmentColor2.y = conditionValue1 ? (((productValue26 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue25))) : productValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue38 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue1 ? spvNMin(productValue38, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue12 = (bitwiseValue1 ? spvNMin(fma(fma(productValue38, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue38, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue13 = (bitwiseValue1 ? spvNMin(fma(productValue38 * productValue38, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue38, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue39 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue12, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue13, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue39, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue12 / productValue39, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue13 / productValue39, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue39, 0.0, 1.0) * 255.0);
    fragmentColor0.x = (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float productValue40 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue41 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue42 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue1 = ceil(multiplyAddValue5);
    float multiplyAddValue14 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[13u].x, -productValue40), productValue40);
    float multiplyAddValue15 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[13u].y, -productValue41), productValue41);
    float multiplyAddValue16 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[13u].z, -productValue42), productValue42);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue14, multiplyAddValue14);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue15, multiplyAddValue15);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue16, multiplyAddValue16);
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue22 = inverseLengthValue1 * varyingNormal0.x;
    float productValue23 = inverseLengthValue1 * varyingNormal0.y;
    float productValue24 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue24) + (abs(productValue23) + abs(productValue22)));
    float productValue25 = quotientValue1 * productValue22;
    float productValue26 = quotientValue1 * productValue23;
    bool conditionValue1 = productValue24 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue25 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue26))) : productValue25;
    fragmentColor2.y = conditionValue1 ? (((productValue26 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue25))) : productValue26;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[0u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[0u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[0u].z) - productValue2) * varyingColor0.w) + productValue2;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue27 = productValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue28 = productValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue29 = productValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue = ceil(productValue1);
    float productValue30 = (((productValue1 * fragmentVectorConstants1.packedValues[13u].x) - productValue27) * scalarValue) + productValue27;
    float productValue31 = (((productValue1 * fragmentVectorConstants1.packedValues[13u].y) - productValue28) * scalarValue) + productValue28;
    float productValue32 = (((productValue1 * fragmentVectorConstants1.packedValues[13u].z) - productValue29) * scalarValue) + productValue29;
#endif
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[35u], sumValue2, fma(fragmentScalarConstants1.packedValues[27u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue11, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue10, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue11, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue10, 0.5, 0.5);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue7) + abs(productValue6)) + abs(productValue8));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue1;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue11 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue1 = spvNClamp(productValue11, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue11 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue11, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue11 * productValue11) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue11, 0.0, 1.0);
    }
    else
    {
        intermediateValue1 = fragmentVectorConstants1.packedValues[10u].x;
        productValue12 = fragmentVectorConstants1.packedValues[10u].y;
        productValue13 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue16 = intermediateValue1 * 0.16666667163372039794921875;
    float productValue17 = productValue12 * 0.16666667163372039794921875;
    float productValue18 = productValue13 * 0.16666667163372039794921875;
    float productValue19 = ceil(spvNClamp(spvNMax(spvNMax(productValue16, productValue18), spvNMax(productValue17, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue16 / productValue19, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue17 / productValue19, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue18 / productValue19, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue19, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue3) * fragmentVectorConstants1.packedValues[5u].w) + productValue3;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue4) * fragmentVectorConstants1.packedValues[5u].w) + productValue4;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue5) * fragmentVectorConstants1.packedValues[5u].w) + productValue5;
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue9)) * ((productValue10 < 0.0) ? (-1.0) : 1.0)) : productValue10;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue1)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue7) + abs(productValue6)) + abs(productValue8));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue2;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue33 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue2 = spvNClamp(productValue33, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue33 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue33, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue33 * productValue33) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue33, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[10u].x;
        productValue14 = fragmentVectorConstants1.packedValues[10u].y;
        productValue15 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue34 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue35 = productValue14 * 0.16666667163372039794921875;
    float productValue36 = productValue15 * 0.16666667163372039794921875;
    float productValue37 = ceil(spvNClamp(spvNMax(spvNMax(productValue34, productValue36), spvNMax(productValue35, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue34 / productValue37, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue35 / productValue37, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue36 / productValue37, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue30) * fragmentVectorConstants1.packedValues[5u].w) + productValue30;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue31) * fragmentVectorConstants1.packedValues[5u].w) + productValue31;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue32) * fragmentVectorConstants1.packedValues[5u].w) + productValue32;
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue9)) * ((productValue10 < 0.0) ? (-1.0) : 1.0)) : productValue10;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue1)) * 0.5;
#endif
}
